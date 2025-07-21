Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1B3C83F26
	for <intel-xe@archiver.kernel.org>; Mon, 21 Jul 2025 15:35:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE76C10E56F;
	Mon, 21 Jul 2025 15:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8mtC4nh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85EF910E56F
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Jul 2025 15:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753112103; x=1784648103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x4sTCPUt5B4puAGh/LIeoyX5+gex9uS552mP1ZA15DE=;
 b=Q8mtC4nh2H0I+7Xii8CoP1qPGnvGcxM1ea80k2/sxak5tDmUjjHcSs2E
 kSihlF+P/LCVaCb2UqPTmTEr2CcMe1vT/4MEktxBGroVJ0ZSTdUTMEE41
 AXibo4QLVaduY0mFOplxXl4UtC18P/8Fo02ZqkLNjUHsUtJpDjLqwblxN
 767nBKQb32nj0Qudz0qdB26tl3Bd29UEnrfssebXB5qYsAvMxHWRgcBUE
 +YlY0G1l9V0/L8UO5e7QtRDnSp96tgxBv5+FTpsXSQZ4dtHDiVwrBDtkW
 1Jy6wfrH5HTOvFzHqQj/2CIM2OHG54qKsYk/R90vbrI2Wsa689TBYx4al Q==;
X-CSE-ConnectionGUID: 6IxnYn4MRwu53Y6/TWdRvA==
X-CSE-MsgGUID: 8uPA29MrTtaSwLKaLvzEAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55424803"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="55424803"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 08:35:02 -0700
X-CSE-ConnectionGUID: Tf+O4SWXQoWfYSCSTd6Nug==
X-CSE-MsgGUID: U8oNTeoRS9iiT+WGvu3f3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="189823784"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa001.fm.intel.com with ESMTP; 21 Jul 2025 08:35:01 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe: Misc refine for svm
Date: Mon, 21 Jul 2025 15:33:40 +0000
Message-ID: <20250721153339.369318-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250718212409.86516-2-shuicheng.lin@intel.com>
References: <20250718212409.86516-2-shuicheng.lin@intel.com>
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

Below changes should have no function effect.
1. Correct typo of "operation"in macro range_debug().
2. Combine 2 spin_lock() call in xe_svm_garbage_collector() into 1.
3. Remove preferred_region_is_vram check in xe_svm_range_needs_migrate_to_vram()
   as it is already checked in the begin of this function.
4. Combine the devmem_possible check in xe_svm_handle_pagefault().
5. Combine 2 xe_vm_unlock() call in xe_svm_handle_pagefault() into 1.

v2: revert !ctx.devmem_only change (Matt)

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 10c8a1bcb86e..a35bca95ab95 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -50,11 +50,11 @@ static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
 	return gpusvm_to_vm(r->gpusvm);
 }
 
-#define range_debug(r__, operaton__)					\
+#define range_debug(r__, operation__)					\
 	vm_dbg(&range_to_vm(&(r__)->base)->xe->drm,			\
 	       "%s: asid=%u, gpusvm=%p, vram=%d,%d, seqno=%lu, " \
 	       "start=0x%014lx, end=0x%014lx, size=%lu",		\
-	       (operaton__), range_to_vm(&(r__)->base)->usm.asid,	\
+	       (operation__), range_to_vm(&(r__)->base)->usm.asid,	\
 	       (r__)->base.gpusvm,					\
 	       xe_svm_range_in_vram((r__)) ? 1 : 0,			\
 	       xe_svm_range_has_vram_binding((r__)) ? 1 : 0,		\
@@ -263,8 +263,8 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 	if (xe_vm_is_closed_or_banned(vm))
 		return -ENOENT;
 
-	spin_lock(&vm->svm.garbage_collector.lock);
 	for (;;) {
+		spin_lock(&vm->svm.garbage_collector.lock);
 		range = list_first_entry_or_null(&vm->svm.garbage_collector.range_list,
 						 typeof(*range),
 						 garbage_collector_link);
@@ -282,8 +282,6 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 			xe_vm_kill(vm, true);
 			return err;
 		}
-
-		spin_lock(&vm->svm.garbage_collector.lock);
 	}
 	spin_unlock(&vm->svm.garbage_collector.lock);
 
@@ -763,12 +761,12 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 
 	xe_assert(vm->xe, IS_DGFX(vm->xe));
 
-	if (preferred_region_is_vram && xe_svm_range_in_vram(range)) {
+	if (xe_svm_range_in_vram(range)) {
 		drm_info(&vm->xe->drm, "Range is already in VRAM\n");
 		return false;
 	}
 
-	if (preferred_region_is_vram && range_size < SZ_64K && !supports_4K_migration(vm->xe)) {
+	if (range_size < SZ_64K && !supports_4K_migration(vm->xe)) {
 		drm_dbg(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
 		return false;
 	}
@@ -793,16 +791,14 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    struct xe_gt *gt, u64 fault_addr,
 			    bool atomic)
 {
+	int devmem_possible = IS_DGFX(vm->xe) &&
+		IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
 	struct drm_gpusvm_ctx ctx = {
 		.read_only = xe_vma_read_only(vma),
-		.devmem_possible = IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
-		.check_pages_threshold = IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K : 0,
-		.devmem_only = atomic && IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
-		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
+		.devmem_possible = devmem_possible,
+		.check_pages_threshold = devmem_possible ? SZ_64K : 0,
+		.devmem_only = atomic && devmem_possible,
+		.timeslice_ms = atomic && devmem_possible ?
 			vm->xe->atomic_svm_timeslice_ms : 0,
 	};
 	struct xe_svm_range *range;
@@ -882,8 +878,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 retry_bind:
 	xe_vm_lock(vm, false);
 	fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
+	xe_vm_unlock(vm);
 	if (IS_ERR(fence)) {
-		xe_vm_unlock(vm);
 		err = PTR_ERR(fence);
 		if (err == -EAGAIN) {
 			ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
@@ -894,13 +890,11 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			goto retry_bind;
 		goto err_out;
 	}
-	xe_vm_unlock(vm);
 
 	dma_fence_wait(fence, false);
 	dma_fence_put(fence);
 
 err_out:
-
 	return err;
 }
 
-- 
2.49.0

