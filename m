Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89F3CA0FED
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 03:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2D610E091;
	Wed,  3 Sep 2025 03:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QVKb28vt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965BA10E091
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 03:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756870080; x=1788406080;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lw+39JG7IAL4uVMXdQ82FSu4ygkrirzb4Ny2b2rRtIM=;
 b=QVKb28vtJCXAD8frSS0NNxx3G2HaxHUyyBw56MvBneTI0cYpRFh2xj0I
 TJ++c6bjy1IJuhVje7cxS1c0G1chaVp9uDJijg6qBQbtmBlBoKqLGzmS7
 RyfJa5hYxaO194EBzM6PcCcugucPpcOOHscFh6rEo4Z9Wyuw9nO8AcOS8
 j7Rna4lfR9j1D0jtys2qUxvDMAeE3FADNKPP5ENjqd6pvSR2gQTNy8NkC
 XBq+e8xmYoDyjFolybBG6n931SnqmaW1/Bwko/voNvPz6QN0KT2/so/hR
 pJsr1REcL+DKtEcaz2IUhmVILrUhKMi/4D9Xi9s3Ek1MyYmnr6/7zV/Ja w==;
X-CSE-ConnectionGUID: KZceOmFMRiW08iXPLh7lXA==
X-CSE-MsgGUID: X5qT+9ZbT8K2Tvvos0FRvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59028717"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="59028717"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 20:27:59 -0700
X-CSE-ConnectionGUID: Pxb7hk0sQACLh34NuyOB3Q==
X-CSE-MsgGUID: p5ack+m9TSa2rVHNgl/88A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="175611072"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa003.jf.intel.com with ESMTP; 02 Sep 2025 20:27:58 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3] drm/xe: Misc refine for svm
Date: Wed,  3 Sep 2025 03:26:14 +0000
Message-ID: <20250903032613.138020-2-shuicheng.lin@intel.com>
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
3. Remove extra preferred_region_is_vram check in xe_svm_range_needs_migrate_to_vram()
   as it is already checked in the begin of this function.
4. Combine the devmem_possible check in xe_svm_handle_pagefault().
   need_vram includes the IS_DGFX() check, so there is no change for .devmem_only
5. Combine 2 xe_vm_unlock() call in xe_svm_handle_pagefault() into 1.

v2: revert !ctx.devmem_only change (Matt)
v3: rebase code and refine commit message.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 76c6d74c1208..2436a2b73427 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -49,11 +49,11 @@ static struct xe_vm *range_to_vm(struct drm_gpusvm_range *r)
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
@@ -308,8 +308,8 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 	if (xe_vm_is_closed_or_banned(vm))
 		return -ENOENT;
 
-	spin_lock(&vm->svm.garbage_collector.lock);
 	for (;;) {
+		spin_lock(&vm->svm.garbage_collector.lock);
 		range = list_first_entry_or_null(&vm->svm.garbage_collector.range_list,
 						 typeof(*range),
 						 garbage_collector_link);
@@ -338,8 +338,6 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 			else
 				return err;
 		}
-
-		spin_lock(&vm->svm.garbage_collector.lock);
 	}
 	spin_unlock(&vm->svm.garbage_collector.lock);
 
@@ -832,12 +830,12 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 
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
@@ -849,15 +847,14 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 				     struct xe_gt *gt, u64 fault_addr,
 				     bool need_vram)
 {
+	int devmem_possible = IS_DGFX(vm->xe) &&
+		IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
 	struct drm_gpusvm_ctx ctx = {
 		.read_only = xe_vma_read_only(vma),
-		.devmem_possible = IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
-		.check_pages_threshold = IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K : 0,
-		.devmem_only = need_vram && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
-		.timeslice_ms = need_vram && IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
+		.devmem_possible = devmem_possible,
+		.check_pages_threshold = devmem_possible ? SZ_64K : 0,
+		.devmem_only = need_vram && devmem_possible,
+		.timeslice_ms = need_vram && devmem_possible ?
 			vm->xe->atomic_svm_timeslice_ms : 0,
 	};
 	struct xe_svm_range *range;
@@ -944,8 +941,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 retry_bind:
 	xe_vm_lock(vm, false);
 	fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
+	xe_vm_unlock(vm);
 	if (IS_ERR(fence)) {
-		xe_vm_unlock(vm);
 		err = PTR_ERR(fence);
 		if (err == -EAGAIN) {
 			ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
@@ -956,13 +953,11 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
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

