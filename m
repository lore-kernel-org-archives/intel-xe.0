Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96737C48BF6
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 03:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0C810E866;
	Thu, 22 Feb 2024 03:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bF0ZWIs2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FF510E868
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 03:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708573600; x=1740109600;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=809GqWhsIiYE0wr4BJIrkS6b1772act97odngeuPNOc=;
 b=bF0ZWIs2fCVZRGSfJzj/pg+sPaS5/nbWgmjPmY3UKwSFInPndWm+pDV3
 54tw7stb0Og5mfaNSxuRM/RmVtF2O2eIsQPhKW4et2/speNIk1gyH1zmV
 JiNamNmGJAKglP8JzId+oHkxefdGlaWDUU70t7TIiOSwCsEou9obwitxc
 9osrJqcif4CyAmnGm4Es0IqgiinEiSrDev7/ObB7Bgxwcee0axyy32J1r
 IZ5CCVhq27WjXiVUQI6M0nUumCbnrWMXWlL1Hc8n/xTwf3c6zjWfKT+gA
 HivGjBZnK4ERnY5PM7rC6OfmAZswWVdGjHl+ncq5XsCiIP7sszaW4toTw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2914026"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2914026"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 19:46:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="10038516"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 19:46:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Add debug prints for skipping rebinds
Date: Wed, 21 Feb 2024 19:47:23 -0800
Message-Id: <20240222034725.3835064-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222034725.3835064-1-matthew.brost@intel.com>
References: <20240222034725.3835064-1-matthew.brost@intel.com>
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

Will help debug issues with VM binds.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 23a44ef85aa4..bf040df0d02b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2287,6 +2287,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				   struct xe_sync_entry *syncs, u32 num_syncs,
 				   struct list_head *ops_list, bool last)
 {
+	struct xe_device *xe = vm->xe;
 	struct xe_vma_op *last_op = NULL;
 	struct drm_gpuva_op *__op;
 	int err = 0;
@@ -2362,6 +2363,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 						xe_vma_end(vma) -
 						xe_vma_start(old);
 					op->remap.start = xe_vma_end(vma);
+					vm_dbg(&xe->drm, "REMAP:SKIP_PREV: addr=0x%016llx, range=0x%016llx",
+					       (ULL)op->remap.start,
+					       (ULL)op->remap.range);
 				}
 			}
 
@@ -2392,6 +2396,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 					op->remap.range -=
 						xe_vma_end(old) -
 						xe_vma_start(vma);
+					vm_dbg(&xe->drm, "REMAP:SKIP_NEXT: addr=0x%016llx, range=0x%016llx",
+					       (ULL)op->remap.start,
+					       (ULL)op->remap.range);
 				}
 			}
 			break;
-- 
2.34.1

