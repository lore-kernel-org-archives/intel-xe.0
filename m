Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A14D3C526
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 04:32:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09AC10E65B;
	Wed, 10 Dec 2025 04:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOOqDcv8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5471C10E65B
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 04:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765341140; x=1796877140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PwETN7Eq+CaWRc8bh4qfW85DQIETYA8g02o6yBbKDi8=;
 b=hOOqDcv8vZNUa4V6CmvZdxJdNDbWCnZA49tyzSYS+OtHbxhhPz3H58Wm
 IsDBzv38ri0c6kgqat83MCfcFtv+3P3em8CYQ1wgYJrQjDkg3yhTZXsAr
 kH5XftM6OEpIGFuNeBgqtwNKOIH+0CiK0xRRy7nDv2hSVwMpTMd5es9yW
 m/FCES23uYMyHrc/aC6qixgxMWmzNDYecJpWA+tUR9GTmmSM5+P9a1Mvv
 vRpcXz6CAxsPUOOrgMBezjqOXO7JCBd5Y6CwEVNXhnjQ8iX5p+D6puTyU
 Zh5THyn/s2osGf7mlkz2wLd1vwG552WlD1pLIV9DsMJSz3HLjQCygPjZa A==;
X-CSE-ConnectionGUID: aLxlcCFoQM65q51GTasX9w==
X-CSE-MsgGUID: j7uHaX+uTOO31HWFBV4EAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78000061"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="78000061"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 20:32:20 -0800
X-CSE-ConnectionGUID: wc/Q5B5IQEaQ1OevzCfhZA==
X-CSE-MsgGUID: St0HKP4OQSanSb9eldg96w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196466613"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 20:32:18 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [RFC v3 3/8] drm/xe/madvise: Implement purgeable buffer object support
Date: Wed, 10 Dec 2025 10:00:47 +0530
Message-ID: <20251210043112.3267620-4-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210043112.3267620-1-arvind.yadav@intel.com>
References: <20251210043112.3267620-1-arvind.yadav@intel.com>
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

This allows userspace applications to provide memory usage hints to
the kernel for better memory management under pressure:

Add the core implementation for purgeable buffer objects, enabling memory
reclamation of user-designated DONTNEED buffers during eviction.

This patch implements the purge operation and state machine transitions:

Purgeable States (from xe_madv_purgeable_state):
 - WILLNEED (0): BO should be retained, actively used
 - DONTNEED (1): BO eligible for purging, not currently needed
 - PURGED (2): BO backing store reclaimed, permanently invalid

Design Rationale:
  - Async TLB invalidation via trigger_rebind (no blocking xe_vm_invalidate_vma)
  - i915 compatibility: retained field, "once purged always purged" semantics
  - Shared BO protection prevents multi-process memory corruption
  - Scratch PTE reuse avoids new infrastructure, safe for fault mode

v2:
  - Use xe_bo_trigger_rebind() for async TLB invalidation (Thomas Hellström)
  - Add NULL rebind with scratch PTEs for fault mode (Thomas Hellström)
  - Implement i915-compatible retained field logic (Thomas Hellström)
  - Skip BO validation for purged BOs in page fault handler (crash fix)
  - Add scratch VM check in page fault path (non-scratch VMs fail fault)
  - Force clear_pt for non-scratch VMs to avoid phys addr 0 mapping (review fix)
  - Add !is_purged check to resource cursor setup to prevent stale access

v3:
  - Rebase as xe_gt_pagefault.c is gone upstream and replaced
    with xe_pagefault.c (Matthew Brost)
  - Xe specific warn on (Matthew Brost)
  - Call helpers for madv_purgeable access(Matthew Brost)
  - Remove bo NULL check(Matthew Brost)
  - Use xe_bo_assert_held instead of dma assert(Matthew Brost)
  - Move the xe_bo_is_purged check under the dma-resv lock( by Matt)
  - Drop is_purged from xe_pt_stage_bind_entry and just set is_null to true
    for purged BO rename s/is_null/is_null_or_purged (by Matt)
  - UAPI rule should not be changed.(Matthew Brost)
  - Make 'retained' a userptr (Matthew Brost)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c         | 69 ++++++++++++++++++----
 drivers/gpu/drm/xe/xe_pagefault.c  | 12 ++++
 drivers/gpu/drm/xe/xe_pt.c         | 38 +++++++++++--
 drivers/gpu/drm/xe/xe_vm.c         | 11 +++-
 drivers/gpu/drm/xe/xe_vm_madvise.c | 91 ++++++++++++++++++++++++++++++
 5 files changed, 202 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6280e6a013ff..c161ac6420db 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -835,6 +835,51 @@ static int xe_bo_move_notify(struct xe_bo *bo,
 	return 0;
 }
 
+static void xe_bo_set_purged(struct xe_bo *bo)
+{
+	/* BO must be locked before modifying madv state */
+	xe_bo_assert_held(bo);
+
+	atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_PURGED);
+}
+
+/**
+ * xe_ttm_bo_purge() - Purge buffer object backing store
+ * @ttm_bo: The TTM buffer object to purge
+ * @ctx: TTM operation context
+ *
+ * This function purges the backing store of a BO marked as DONTNEED and
+ * triggers rebind to invalidate stale GPU mappings. For fault-mode VMs,
+ * this zaps the PTEs. The next GPU access will trigger a page fault and
+ * perform NULL rebind (scratch pages or clear PTEs based on VM config).
+ */
+static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
+{
+	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
+	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
+
+	if (ttm_bo->ttm) {
+		struct ttm_placement place = {};
+		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
+
+		drm_WARN_ON(&xe->drm, ret);
+		if (!ret) {
+			if (xe_bo_madv_is_dontneed(bo)) {
+				xe_bo_set_purged(bo);
+
+				/*
+				 * Trigger rebind to invalidate stale GPU mappings.
+				 * - Non-fault mode: Marks VMAs for rebind
+				 * - Fault mode: Zaps PTEs (sets to 0), next access triggers fault
+				 *   and NULL rebind with scratch/clear PTEs per VM config
+				 */
+				ret = xe_bo_trigger_rebind(xe, bo, ctx);
+				XE_WARN_ON(ret);
+			}
+		}
+	}
+}
+
 static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		      struct ttm_operation_ctx *ctx,
 		      struct ttm_resource *new_mem,
@@ -854,6 +899,15 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
 	int ret = 0;
 
+	/*
+	 * Purge only non-shared BOs explicitly marked DONTNEED by userspace.
+	 * The move_notify callback will handle invalidation asynchronously.
+	 */
+	if (evict && xe_bo_madv_is_dontneed(bo)) {
+		xe_ttm_bo_purge(ttm_bo, ctx);
+		return 0;
+	}
+
 	/* Bo creation path, moving to system or TT. */
 	if ((!old_mem && ttm) && !handle_system_ccs) {
 		if (new_mem->mem_type == XE_PL_TT)
@@ -1605,18 +1659,6 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 	}
 }
 
-static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
-{
-	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
-
-	if (ttm_bo->ttm) {
-		struct ttm_placement place = {};
-		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
-
-		drm_WARN_ON(&xe->drm, ret);
-	}
-}
-
 static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
 {
 	struct ttm_operation_ctx ctx = {
@@ -2197,6 +2239,9 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 #endif
 	INIT_LIST_HEAD(&bo->vram_userfault_link);
 
+	/* Initialize purge advisory state */
+	atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_WILLNEED);
+
 	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
 
 	if (resv) {
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index afb06598b6e1..78ee51df1d4a 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -59,6 +59,18 @@ static int xe_pagefault_begin(struct drm_exec *exec, struct xe_vma *vma,
 	if (!bo)
 		return 0;
 
+	/*
+	 * Check if BO is purged (under dma-resv lock).
+	 * For purged BOs:
+	 * - Scratch VMs: Skip validation, rebind will use scratch PTEs
+	 * - Non-scratch VMs: FAIL the page fault (no scratch page available)
+	 */
+	if (unlikely(xe_bo_is_purged(bo))) {
+		if (!xe_vm_has_scratch(vm))
+			return -EACCES;
+		return 0;
+	}
+
 	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
 		xe_bo_validate(bo, vm, true, exec);
 }
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 884127b4d97d..7f83d68c3198 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -531,20 +531,26 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 	/* Is this a leaf entry ?*/
 	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
 		struct xe_res_cursor *curs = xe_walk->curs;
-		bool is_null = xe_vma_is_null(xe_walk->vma);
-		bool is_vram = is_null ? false : xe_res_is_vram(curs);
+		struct xe_bo *bo = xe_vma_bo(xe_walk->vma);
+		bool is_null_or_purged = xe_vma_is_null(xe_walk->vma) ||
+					 (bo && xe_bo_is_purged(bo));
+		bool is_vram = is_null_or_purged ? false : xe_res_is_vram(curs);
 
 		XE_WARN_ON(xe_walk->va_curs_start != addr);
 
 		if (xe_walk->clear_pt) {
 			pte = 0;
 		} else {
-			pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
+			/*
+			 * For purged BOs, treat like null VMAs - pass address 0.
+			 * The pte_encode_vma will set XE_PTE_NULL flag for scratch mapping.
+			 */
+			pte = vm->pt_ops->pte_encode_vma(is_null_or_purged ? 0 :
 							 xe_res_dma(curs) +
 							 xe_walk->dma_offset,
 							 xe_walk->vma,
 							 pat_index, level);
-			if (!is_null)
+			if (!is_null_or_purged)
 				pte |= is_vram ? xe_walk->default_vram_pte :
 					xe_walk->default_system_pte;
 
@@ -568,7 +574,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 		if (unlikely(ret))
 			return ret;
 
-		if (!is_null && !xe_walk->clear_pt)
+		if (!is_null_or_purged && !xe_walk->clear_pt)
 			xe_res_next(curs, next - addr);
 		xe_walk->va_curs_start = next;
 		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K << level);
@@ -721,6 +727,26 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 	};
 	struct xe_pt *pt = vm->pt_root[tile->id];
 	int ret;
+	bool is_purged = false;
+
+	/*
+	 * Check if BO is purged:
+	 * - Scratch VMs: Use scratch PTEs (XE_PTE_NULL) for safe zero reads
+	 * - Non-scratch VMs: Clear PTEs to zero (non-present) to avoid mapping to phys addr 0
+	 *
+	 * For non-scratch VMs, we force clear_pt=true so leaf PTEs become completely
+	 * zero instead of creating a PRESENT mapping to physical address 0.
+	 */
+	if (bo && xe_bo_is_purged(bo)) {
+		is_purged = true;
+
+		/*
+		 * For non-scratch VMs, a NULL rebind should use zero PTEs
+		 * (non-present), not a present PTE to phys 0.
+		 */
+		if (!xe_vm_has_scratch(vm))
+			xe_walk.clear_pt = true;
+	}
 
 	if (range) {
 		/* Move this entire thing to xe_svm.c? */
@@ -760,7 +786,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 	if (!range)
 		xe_bo_assert_held(bo);
 
-	if (!xe_vma_is_null(vma) && !range) {
+	if (!xe_vma_is_null(vma) && !range && !is_purged) {
 		if (xe_vma_is_userptr(vma))
 			xe_res_first_dma(to_userptr_vma(vma)->userptr.pages.dma_addr, 0,
 					 xe_vma_size(vma), &curs);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c2012d20faa6..762098d368a6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1337,6 +1337,9 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
 static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
 			       u16 pat_index, u32 pt_level)
 {
+	struct xe_bo *bo = xe_vma_bo(vma);
+	struct xe_vm *vm = xe_vma_vm(vma);
+
 	pte |= XE_PAGE_PRESENT;
 
 	if (likely(!xe_vma_read_only(vma)))
@@ -1345,7 +1348,13 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
 	pte |= pte_encode_pat_index(pat_index, pt_level);
 	pte |= pte_encode_ps(pt_level);
 
-	if (unlikely(xe_vma_is_null(vma)))
+	/*
+	 * NULL PTEs redirect to scratch page (return zeros on read).
+	 * Set for: 1) explicit null VMAs, 2) purged BOs on scratch VMs.
+	 * Never set NULL flag without scratch page - causes undefined behavior.
+	 */
+	if (unlikely(xe_vma_is_null(vma) ||
+		     (bo && xe_bo_is_purged(bo) && xe_vm_has_scratch(vm))))
 		pte |= XE_PTE_NULL;
 
 	return pte;
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index cad3cf627c3f..3e6f77dc1dcb 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -158,6 +158,56 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 	}
 }
 
+/*
+ * Handle purgeable buffer object advice for DONTNEED/WILLNEED/PURGED.
+ * Returns true if any BO was purged, false otherwise.
+ * Caller must copy retained value to userspace after releasing locks.
+ */
+static bool xe_vm_madvise_purgeable_bo(struct xe_device *xe, struct xe_vm *vm,
+				       struct xe_vma **vmas, int num_vmas,
+				       struct drm_xe_madvise *op)
+{
+	bool has_purged_bo = false;
+	int i;
+
+	xe_assert(vm->xe, op->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE);
+
+	for (i = 0; i < num_vmas; i++) {
+		struct xe_bo *bo = xe_vma_bo(vmas[i]);
+
+		if (!bo)
+			continue;
+
+		/* BO must be locked before modifying madv state */
+		xe_bo_assert_held(bo);
+
+		/*
+		 * Once purged, always purged. Cannot transition back to WILLNEED.
+		 * This matches i915 semantics where purged BOs are permanently invalid.
+		 */
+		if (xe_bo_is_purged(bo)) {
+			has_purged_bo = true;
+			continue;
+		}
+
+		switch (op->purge_state_val.val) {
+		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
+			atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_WILLNEED);
+			break;
+		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
+			atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_DONTNEED);
+			break;
+		default:
+			drm_warn(&vm->xe->drm, "Invalid madvice value = %d\n",
+				 op->purge_state_val.val);
+			return false;
+		}
+	}
+
+	/* Return whether any BO was purged; caller will copy to user after unlocking */
+	return has_purged_bo;
+}
+
 typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
 			     struct xe_vma **vmas, int num_vmas,
 			     struct drm_xe_madvise *op);
@@ -283,6 +333,19 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 			return false;
 		break;
 	}
+	case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
+	{
+		u32 val = args->purge_state_val.val;
+
+		if (XE_IOCTL_DBG(xe, !((val == DRM_XE_VMA_PURGEABLE_STATE_WILLNEED) ||
+				       (val == DRM_XE_VMA_PURGEABLE_STATE_DONTNEED))))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, args->purge_state_val.reserved))
+			return false;
+
+		break;
+	}
 	default:
 		if (XE_IOCTL_DBG(xe, 1))
 			return false;
@@ -402,6 +465,34 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 					goto err_fini;
 			}
 		}
+		if (args->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE) {
+			bool has_purged_bo;
+
+			has_purged_bo = xe_vm_madvise_purgeable_bo(xe, vm, madvise_range.vmas,
+								   madvise_range.num_vmas, args);
+
+			/* Release BO locks */
+			drm_exec_fini(&exec);
+			kfree(madvise_range.vmas);
+			up_write(&vm->lock);
+
+			/*
+			 * Set retained flag to indicate if backing store still exists.
+			 * Matches i915: retained = 1 if not purged, 0 if purged.
+			 * Must copy_to_user AFTER releasing ALL locks to avoid circular dependency.
+			 */
+			if (args->purge_state_val.retained) {
+				u32 retained = !has_purged_bo;
+
+				if (copy_to_user(u64_to_user_ptr(args->purge_state_val.retained),
+						 &retained, sizeof(retained)))
+					drm_warn(&vm->xe->drm, "Failed to copy retained value to user\n");
+			}
+
+			/* Final cleanup for early return */
+			xe_vm_put(vm);
+			return 0;
+		}
 	}
 
 	if (madvise_range.has_svm_userptr_vmas) {
-- 
2.43.0

