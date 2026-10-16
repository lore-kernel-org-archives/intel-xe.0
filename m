Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FE1CCA462
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:19:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6374112620;
	Fri, 16 Oct 2026 07:19:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492D7112619
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792135137; x=1823671137;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=nW1g+KEjeizSl6JpldUhblYQ256BP0z6kFZZMc3By/0=;
 b=Etxjc3s3t+ltt4hTttl4KeMQWGwn6+KIAQon4i3ddKw9e4ggjYhGtjnQ
 rJ81B5m3i3ZCmvyfXNgCBNhEgUDLdVaU3X8rXSsYyyIj/W6yHTZcSb2/A
 F+XJ6KAzgMHNKT9foPjUGdRwfHxCfwN0ZCNys7Wmu882VHlgVv+4MdI0b
 iWfRMFHNOPW6Oj5bP+tkPrxfpQntCsyXmACgoOofEqtSfOugN1DRMhlVW
 PbWced7ObieMYP1fIOZCjo4x8T+GqUb1U9iehugCbtsucEw4ghzRiUq//
 /vWaaf+xCkFLayKpAUF0Mw8b5r+N2+VB2mOLWFKAvv+rnEvrkLecnlFQl w==;
X-CSE-ConnectionGUID: bcQJ2VZmStOI4QW1nNtZeA==
X-CSE-MsgGUID: hFLZ44q2R9KYGBE386b8Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="813648"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="813648"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:50 -0700
X-CSE-ConnectionGUID: SfbvDVjnSmyH/2C9tDKUtg==
X-CSE-MsgGUID: bwVFINKvS1SbDAF8JQea7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1787271"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:49 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI-only v3 09/18] drm/xe: Skip VM close hardware access when device
 I/O is blocked
Date: Fri, 16 Oct 2026 12:48:19 +0530
Message-ID: <20261016071832.222574-10-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016071832.222574-1-arvind.yadav@intel.com>
References: <20261016071832.222574-1-arvind.yadav@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DO NOT REVIEW

xe_vm_close() uses drm_dev_enter(), which only checks unplug. After a
permanent wedge, VM close can still write page tables in VRAM and request
TLB invalidation.

Use xe_device_io_get() around page-table clearing and TLB invalidation.
Skip these operations when device I/O is blocked or unplugged, while
still closing the VM and running software cleanup.

Take the gate after the pending-bind fence wait. Isolation waits for
hardware cleanup admitted before the block, without including that
fence wait in this function's gate.

Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a9882a22b34e..26de682b309b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1903,11 +1903,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 static void xe_vm_close(struct xe_vm *vm)
 {
 	struct xe_device *xe = vm->xe;
-	bool bound;
 	int idx;
 
-	bound = drm_dev_enter(&xe->drm, &idx);
-
 	down_write(&vm->lock);
 	xe_vm_lock(vm, false);
 
@@ -1926,13 +1923,15 @@ static void xe_vm_close(struct xe_vm *vm)
 				      DMA_RESV_USAGE_BOOKKEEP,
 				      false, MAX_SCHEDULE_TIMEOUT);
 
-		if (bound) {
+		if (!xe_device_io_get(xe, &idx)) {
 			for_each_tile(tile, xe, id)
 				if (vm->pt_root[id])
 					xe_pt_clear(xe, vm->pt_root[id]);
 
 			for_each_gt(gt, xe, id)
 				xe_tlb_inval_vm(&gt->tlb_inval, vm);
+
+			xe_device_io_put(idx);
 		}
 	}
 
@@ -1941,9 +1940,6 @@ static void xe_vm_close(struct xe_vm *vm)
 
 	xe_vm_unlock(vm);
 	up_write(&vm->lock);
-
-	if (bound)
-		drm_dev_exit(idx);
 }
 
 void xe_vm_close_and_put(struct xe_vm *vm)
-- 
2.43.0

