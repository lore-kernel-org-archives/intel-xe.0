Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D74C4452D
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 20:55:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC93810E5D2;
	Tue, 21 Jul 2026 20:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NexHSESW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD0B10EB36
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 20:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784667339; x=1816203339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9DRtDF6cuhkWgpPjYf9TdM6IS7mwgT5XxkykcwrV2tE=;
 b=NexHSESWBPm9bVsmQQbUI+4kdMJ/H1NCpTyT1SLGnerHCVyyDOZ3W5K3
 ittgDLntTTVzjwwAh1EttcatxHHNmh5BKpis2t7pORAzaZyUUCTF1dK2V
 LrFSbmIYuu/+HBxoLbT/jrICfFAs9EM1DdGsxyIfV07jxG1HUcp71auU6
 HtBa44szn7YM2p6Z2erazqr6b6SttTKCkboEHNoozR0mdzJ05S/74KgeZ
 w9jbDcwRv5I1vlV6Y/h5T8PgiYWHHuzkRU4IWUxrxZxgk2v72FngDA2Zn
 daxDVSzElKnr3upwFsIaekYw2Zxi3OCVDAQtpxnnZ7ynWSr5u6qwE7OEw w==;
X-CSE-ConnectionGUID: eRR/2v4dSEKcPv3yChT60Q==
X-CSE-MsgGUID: +z6A1AKXRByJy+2NiiaITQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="108073998"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="108073998"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 13:55:39 -0700
X-CSE-ConnectionGUID: djpkJWNTTIqu9bukUvyUIA==
X-CSE-MsgGUID: fA18n7TfQzCWYgFSEO3/LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="262805952"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa005.fm.intel.com with ESMTP; 21 Jul 2026 13:55:37 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 2/3] drm/xe/vm: Remove redundant INIT_WORK() for rebind_work
 in xe_vm_create()
Date: Tue, 21 Jul 2026 20:55:15 +0000
Message-Id: <20260721205516.4058959-3-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260721205516.4058959-1-shuicheng.lin@intel.com>
References: <20260721205516.4058959-1-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

xe_vm_create() initializes vm->preempt.rebind_work twice for LR-mode
VMs: once in the LR-mode setup block before xe_svm_init(), and again
inside the xe_validation_guard() block. The second call is a no-op on
top of the first since the work is never queued between them, but
re-initializing a work item is unnecessary and makes lifetime and
ordering harder to reason about (e.g., any future change that queues
the work earlier would be silently corrupted by the second INIT_WORK).

Drop the duplicate INIT_WORK() and keep only the batch_invalidate_tlb
flag handling in the later LR-mode block. The single INIT_WORK() call
in the earlier LR-mode setup block remains the sole initialization.

No functional change.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Assisted-by: Claude:claude-opus-4.7
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 83f35d8f5323..cdd131f7c7cf 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1765,10 +1765,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 			vm->batch_invalidate_tlb = true;
 		}
 
-		if (vm->flags & XE_VM_FLAG_LR_MODE) {
-			INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
+		if (vm->flags & XE_VM_FLAG_LR_MODE)
 			vm->batch_invalidate_tlb = false;
-		}
 
 		/* Fill pt_root after allocating scratch tables */
 		for_each_tile(tile, xe, id) {
-- 
2.43.0

