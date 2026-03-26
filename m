Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFDE10A62CD
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 13:09:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D98410E928;
	Thu, 26 Mar 2026 13:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N+8h0nys";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFBC10E2D5
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 13:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774530543; x=1806066543;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AAOFOZE+QPJUpiQm7RRhUo5P5XdxDI8wHzmwuOb0gts=;
 b=N+8h0nysANf5EJy9u91MIoxH8VdPZZBABKZBX1WwkevPD7u/xrOn72vb
 4pB3OV01VNU1cIHQZZfnIarr9aRTaoB4p5LyXl5qLwZ7ROin6DMk0x3Ij
 di/H8E4J6yaW9Eahq7r4PA/AbZbfIT/0q2tLvCGIwbItMxvb44Fgj/uYH
 dDDpW/vwkvOeGhwamH1BEeh7Dw3y5L8K2GOZ0xc7uOxhRI2cxcNUgBBkh
 B1TGMlLS83N0jjP7gEDoD6KU5AfHEOslPnadb5pcKXv6IXMYSblvxxH5m
 I+dpo5YFu/4tI/CDlsmzgGcMTWQyz/x29bp/ONqFAJModowO4/XW4zb7F w==;
X-CSE-ConnectionGUID: KN3YOZm1SxO4SwOLRVgbKQ==
X-CSE-MsgGUID: Ts14VToORw2mr2Ral9pwGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75784769"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75784769"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 06:09:03 -0700
X-CSE-ConnectionGUID: 1M9AyWXIT3aQa07uBwtgQw==
X-CSE-MsgGUID: XI7Sulq4RNmN3taDphylyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="224070529"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 06:09:00 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v9 03/12] drm/xe/madvise: Implement purgeable buffer object
 support
Date: Thu, 26 Mar 2026 18:38:29 +0530
Message-ID: <20260326130843.3545241-4-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326130843.3545241-1-arvind.yadav@intel.com>
References: <20260326130843.3545241-1-arvind.yadav@intel.com>
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

Note: The madvise_purgeable() function is implemented but not hooked into
the IOCTL handler (madvise_funcs[] entry is NULL) to maintain bisectability.
The feature will be enabled in the final patch when all supporting
infrastructure (shrinker, per-VMA tracking) is complete.

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

v4:
  - @madv_purgeable atomic_t → u32 change across all relevant patches (Matt)

v5:
  - Introduce xe_bo_set_purgeable_state() helper (void return) to centralize
    madv_purgeable updates with xe_bo_assert_held() and state transition
    validation using explicit enum checks (no transition out of PURGED) (Matt)
  - Make xe_ttm_bo_purge() return int and propagate failures from
    xe_bo_move(); handle xe_bo_trigger_rebind() failures (e.g. no_wait_gpu
    paths) rather than silently ignoring (Matt)
  - Replace drm_WARN_ON with xe_assert for better Xe-specific assertions (Matt)
  - Hook purgeable handling into madvise_funcs[DRM_XE_VMA_ATTR_PURGEABLE_STATE]
    instead of special-case path in xe_vm_madvise_ioctl() (Matt)
  - Track purgeable retained return via xe_madvise_details and perform
    copy_to_user() from xe_madvise_details_fini() after locks are dropped (Matt)
  - Set madvise_funcs[DRM_XE_VMA_ATTR_PURGEABLE_STATE] to NULL with
    __maybe_unused on madvise_purgeable() to maintain bisectability until
    shrinker integration is complete in final patch (Matt)
  - Use put_user() instead of copy_to_user() for single u32 retained value (Thomas)
  - Return -EFAULT from ioctl if put_user() fails (Thomas)
  - Validate userspace initialized retained to 0 before ioctl, ensuring safe
    default (0 = "assume purged") if put_user() fails (Thomas)
  - Refactor error handling: separate fallible put_user from infallible cleanup
  - xe_madvise_purgeable_retained_to_user(): separate helper for fallible put_user
  - Call put_user() after releasing all locks to avoid circular dependencies
  - Use xe_bo_move_notify() instead of xe_bo_trigger_rebind() in xe_ttm_bo_purge()
    for proper abstraction - handles vunmap, dma-buf notifications, and VRAM
    userfault cleanup (Thomas)
  - Fix LRU crash while running shrink test
  - Skip xe_bo_validate() for purged BOs in xe_gpuvm_validate()

v6:
  - xe_bo_move_notify() must be called *before* ttm_bo_validate(). (Thomas)
  - Block GPU page faults (fault-mode VMs) for DONTNEED bo's (Thomas, Matt)
  - Rename retained to retained_ptr. (Jose)

v7 Changes:
  - Fix engine reset from EU overfetch in scratch VMs: xe_pagefault_begin()
    and xe_pagefault_service() now return 0 instead of -EACCES/-EINVAL for
    DONTNEED/purged BOs and missing VMAs so stale accesses hit scratch PTEs.
  - Fix Engine memory CAT errors when Mesa uses DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE:
    accept scratch VMs in xe_pagefault_asid_to_vm() via '|| xe_vm_has_scratch(vm).
  - Skip validate/migrate/rebind for DONTNEED/purged BOs in xe_pagefault_begin()
    using a bool *skip_rebind out-parameter. Scratch VMs ACK the fault and fall back
    to scratch PTEs; non-scratch VMs return -EACCES.

v8:
  - Remove skip_rebind out-parameter from xe_pagefault_begin(); always let
    xe_vma_rebind() run so tile_present is updated and the GPU fault resolves.
    Previously skip_rebind=true left tile_present=0, causing an infinite
    refault loop on scratch VMs. (Thomas)
  - Fixed spelling: corrected "madvice" → "madvise". (Thomas)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c         | 107 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_bo.h         |   2 +
 drivers/gpu/drm/xe/xe_pagefault.c  |  15 +++-
 drivers/gpu/drm/xe/xe_pt.c         |  40 +++++++--
 drivers/gpu/drm/xe/xe_vm.c         |  20 ++++-
 drivers/gpu/drm/xe/xe_vm_madvise.c | 136 +++++++++++++++++++++++++++++
 6 files changed, 298 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7545d2fa3255..40fb19d2c1a7 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -838,6 +838,84 @@ static int xe_bo_move_notify(struct xe_bo *bo,
 	return 0;
 }
 
+/**
+ * xe_bo_set_purgeable_state() - Set BO purgeable state with validation
+ * @bo: Buffer object
+ * @new_state: New purgeable state
+ *
+ * Sets the purgeable state with lockdep assertions and validates state
+ * transitions. Once a BO is PURGED, it cannot transition to any other state.
+ * Invalid transitions are caught with xe_assert().
+ */
+void xe_bo_set_purgeable_state(struct xe_bo *bo,
+			       enum xe_madv_purgeable_state new_state)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+
+	xe_bo_assert_held(bo);
+
+	/* Validate state is one of the known values */
+	xe_assert(xe, new_state == XE_MADV_PURGEABLE_WILLNEED ||
+		      new_state == XE_MADV_PURGEABLE_DONTNEED ||
+		      new_state == XE_MADV_PURGEABLE_PURGED);
+
+	/* Once purged, always purged - cannot transition out */
+	xe_assert(xe, !(bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED &&
+			new_state != XE_MADV_PURGEABLE_PURGED));
+
+	bo->madv_purgeable = new_state;
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
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
+{
+	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
+	struct ttm_placement place = {};
+	int ret;
+
+	xe_bo_assert_held(bo);
+
+	if (!ttm_bo->ttm)
+		return 0;
+
+	if (!xe_bo_madv_is_dontneed(bo))
+		return 0;
+
+	/*
+	 * Use the standard pre-move hook so we share the same cleanup/invalidate
+	 * path as migrations: drop any CPU vmap and schedule the necessary GPU
+	 * unbind/rebind work.
+	 *
+	 * This must be called before ttm_bo_validate() frees the pages.
+	 * May fail in no-wait contexts (fault/shrinker) or if the BO is
+	 * pinned. Keep state unchanged on failure so we don't end up "PURGED"
+	 * with stale mappings.
+	 */
+	ret = xe_bo_move_notify(bo, ctx);
+	if (ret)
+		return ret;
+
+	ret = ttm_bo_validate(ttm_bo, &place, ctx);
+	if (ret)
+		return ret;
+
+	/* Commit the state transition only once invalidation was queued */
+	xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_PURGED);
+
+	return 0;
+}
+
 static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		      struct ttm_operation_ctx *ctx,
 		      struct ttm_resource *new_mem,
@@ -857,6 +935,20 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
 	int ret = 0;
 
+	/*
+	 * Purge only non-shared BOs explicitly marked DONTNEED by userspace.
+	 * The move_notify callback will handle invalidation asynchronously.
+	 */
+	if (evict && xe_bo_madv_is_dontneed(bo)) {
+		ret = xe_ttm_bo_purge(ttm_bo, ctx);
+		if (ret)
+			return ret;
+
+		/* Free the unused eviction destination resource */
+		ttm_resource_free(ttm_bo, &new_mem);
+		return 0;
+	}
+
 	/* Bo creation path, moving to system or TT. */
 	if ((!old_mem && ttm) && !handle_system_ccs) {
 		if (new_mem->mem_type == XE_PL_TT)
@@ -1606,18 +1698,6 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
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
@@ -2198,6 +2278,9 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 #endif
 	INIT_LIST_HEAD(&bo->vram_userfault_link);
 
+	/* Initialize purge advisory state */
+	bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
+
 	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
 
 	if (resv) {
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index fc68099ecd28..68dea7d25a6b 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -271,6 +271,8 @@ static inline bool xe_bo_madv_is_dontneed(struct xe_bo *bo)
 	return bo->madv_purgeable == XE_MADV_PURGEABLE_DONTNEED;
 }
 
+void xe_bo_set_purgeable_state(struct xe_bo *bo, enum xe_madv_purgeable_state new_state);
+
 static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
 {
 	if (likely(bo)) {
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 2fd55d7c98f9..c2d0a6c34917 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -59,6 +59,19 @@ static int xe_pagefault_begin(struct drm_exec *exec, struct xe_vma *vma,
 	if (!bo)
 		return 0;
 
+	/*
+	 * Skip validate/migrate for DONTNEED/purged BOs - repopulating
+	 * their pages would prevent the shrinker from reclaiming them.
+	 * For non-scratch VMs there is no safe fallback so fail the fault.
+	 * For scratch VMs let xe_vma_rebind() run normally; it will install
+	 * scratch PTEs so the GPU gets safe zero reads instead of faulting.
+	 */
+	if (unlikely(xe_bo_madv_is_dontneed(bo) || xe_bo_is_purged(bo))) {
+		if (!xe_vm_has_scratch(vm))
+			return -EACCES;
+		return 0;
+	}
+
 	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
 		xe_bo_validate(bo, vm, true, exec);
 }
@@ -145,7 +158,7 @@ static struct xe_vm *xe_pagefault_asid_to_vm(struct xe_device *xe, u32 asid)
 
 	down_read(&xe->usm.lock);
 	vm = xa_load(&xe->usm.asid_to_vm, asid);
-	if (vm && xe_vm_in_fault_mode(vm))
+	if (vm && (xe_vm_in_fault_mode(vm) || xe_vm_has_scratch(vm)))
 		xe_vm_get(vm);
 	else
 		vm = ERR_PTR(-EINVAL);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 713a303c9053..8e5f4f0dea3f 100644
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
@@ -756,11 +782,11 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 	}
 
 	xe_walk.default_vram_pte |= XE_PPGTT_PTE_DM;
-	xe_walk.dma_offset = bo ? vram_region_gpu_offset(bo->ttm.resource) : 0;
+	xe_walk.dma_offset = (bo && !is_purged) ? vram_region_gpu_offset(bo->ttm.resource) : 0;
 	if (!range)
 		xe_bo_assert_held(bo);
 
-	if (!xe_vma_is_null(vma) && !range) {
+	if (!xe_vma_is_null(vma) && !range && !is_purged) {
 		if (xe_vma_is_userptr(vma))
 			xe_res_first_dma(to_userptr_vma(vma)->userptr.pages.dma_addr, 0,
 					 xe_vma_size(vma), &curs);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d96e0a0c5605..19e5d6b3de31 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -327,6 +327,7 @@ void xe_vm_kill(struct xe_vm *vm, bool unlocked)
 static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
 {
 	struct xe_vm *vm = gpuvm_to_vm(vm_bo->vm);
+	struct xe_bo *bo = gem_to_xe_bo(vm_bo->obj);
 	struct drm_gpuva *gpuva;
 	int ret;
 
@@ -335,10 +336,16 @@ static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
 		list_move_tail(&gpuva_to_vma(gpuva)->combined_links.rebind,
 			       &vm->rebind_list);
 
+	/* Skip re-populating purged BOs, rebind maps scratch pages. */
+	if (xe_bo_is_purged(bo)) {
+		vm_bo->evicted = false;
+		return 0;
+	}
+
 	if (!try_wait_for_completion(&vm->xe->pm_block))
 		return -EAGAIN;
 
-	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false, exec);
+	ret = xe_bo_validate(bo, vm, false, exec);
 	if (ret)
 		return ret;
 
@@ -1427,6 +1434,9 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
 static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
 			       u16 pat_index, u32 pt_level)
 {
+	struct xe_bo *bo = xe_vma_bo(vma);
+	struct xe_vm *vm = xe_vma_vm(vma);
+
 	pte |= XE_PAGE_PRESENT;
 
 	if (likely(!xe_vma_read_only(vma)))
@@ -1435,7 +1445,13 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
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
index e564b12c02d9..a20064e20289 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -26,6 +26,8 @@ struct xe_vmas_in_madvise_range {
 /**
  * struct xe_madvise_details - Argument to madvise_funcs
  * @dpagemap: Reference-counted pointer to a struct drm_pagemap.
+ * @has_purged_bo: Track if any BO was purged (for purgeable state)
+ * @retained_ptr: User pointer for retained value (for purgeable state)
  *
  * The madvise IOCTL handler may, in addition to the user-space
  * args, have additional info to pass into the madvise_func that
@@ -34,6 +36,8 @@ struct xe_vmas_in_madvise_range {
  */
 struct xe_madvise_details {
 	struct drm_pagemap *dpagemap;
+	bool has_purged_bo;
+	u64 retained_ptr;
 };
 
 static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range *madvise_range)
@@ -180,6 +184,67 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 	}
 }
 
+/**
+ * madvise_purgeable - Handle purgeable buffer object advice
+ * @xe: XE device
+ * @vm: VM
+ * @vmas: Array of VMAs
+ * @num_vmas: Number of VMAs
+ * @op: Madvise operation
+ * @details: Madvise details for return values
+ *
+ * Handles DONTNEED/WILLNEED/PURGED states. Tracks if any BO was purged
+ * in details->has_purged_bo for later copy to userspace.
+ *
+ * Note: Marked __maybe_unused until hooked into madvise_funcs[] in the
+ * final patch to maintain bisectability. The NULL placeholder in the
+ * array ensures proper -EINVAL return for userspace until all supporting
+ * infrastructure (shrinker, per-VMA tracking) is complete.
+ */
+static void __maybe_unused madvise_purgeable(struct xe_device *xe,
+					     struct xe_vm *vm,
+					     struct xe_vma **vmas,
+					     int num_vmas,
+					     struct drm_xe_madvise *op,
+					     struct xe_madvise_details *details)
+{
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
+			details->has_purged_bo = true;
+			continue;
+		}
+
+		switch (op->purge_state_val.val) {
+		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
+			xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_WILLNEED);
+			break;
+		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
+			xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
+			break;
+		default:
+			drm_warn(&vm->xe->drm, "Invalid madvise value = %d\n",
+				 op->purge_state_val.val);
+			return;
+		}
+	}
+}
+
 typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
 			     struct xe_vma **vmas, int num_vmas,
 			     struct drm_xe_madvise *op,
@@ -189,6 +254,12 @@ static const madvise_func madvise_funcs[] = {
 	[DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
 	[DRM_XE_MEM_RANGE_ATTR_ATOMIC] = madvise_atomic,
 	[DRM_XE_MEM_RANGE_ATTR_PAT] = madvise_pat_index,
+	/*
+	 * Purgeable support implemented but not enabled yet to maintain
+	 * bisectability. Will be set to madvise_purgeable() in final patch
+	 * when all infrastructure (shrinker, VMA tracking) is complete.
+	 */
+	[DRM_XE_VMA_ATTR_PURGEABLE_STATE] = NULL,
 };
 
 static u8 xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end)
@@ -319,6 +390,19 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 			return false;
 		break;
 	}
+	case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
+	{
+		u32 val = args->purge_state_val.val;
+
+		if (XE_IOCTL_DBG(xe, !(val == DRM_XE_VMA_PURGEABLE_STATE_WILLNEED ||
+				       val == DRM_XE_VMA_PURGEABLE_STATE_DONTNEED)))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, args->purge_state_val.pad))
+			return false;
+
+		break;
+	}
 	default:
 		if (XE_IOCTL_DBG(xe, 1))
 			return false;
@@ -337,6 +421,12 @@ static int xe_madvise_details_init(struct xe_vm *vm, const struct drm_xe_madvise
 
 	memset(details, 0, sizeof(*details));
 
+	/* Store retained pointer for purgeable state */
+	if (args->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE) {
+		details->retained_ptr = args->purge_state_val.retained_ptr;
+		return 0;
+	}
+
 	if (args->type == DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC) {
 		int fd = args->preferred_mem_loc.devmem_fd;
 		struct drm_pagemap *dpagemap;
@@ -365,6 +455,21 @@ static void xe_madvise_details_fini(struct xe_madvise_details *details)
 	drm_pagemap_put(details->dpagemap);
 }
 
+static int xe_madvise_purgeable_retained_to_user(const struct xe_madvise_details *details)
+{
+	u32 retained;
+
+	if (!details->retained_ptr)
+		return 0;
+
+	retained = !details->has_purged_bo;
+
+	if (put_user(retained, (u32 __user *)u64_to_user_ptr(details->retained_ptr)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static bool check_bo_args_are_sane(struct xe_vm *vm, struct xe_vma **vmas,
 				   int num_vmas, u32 atomic_val)
 {
@@ -423,6 +528,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	struct xe_vm *vm;
 	struct drm_exec exec;
 	int err, attr_type;
+	bool do_retained;
 
 	vm = xe_vm_lookup(xef, args->vm_id);
 	if (XE_IOCTL_DBG(xe, !vm))
@@ -433,6 +539,25 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 		goto put_vm;
 	}
 
+	/* Cache whether we need to write retained, and validate it's initialized to 0 */
+	do_retained = args->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE &&
+		      args->purge_state_val.retained_ptr;
+	if (do_retained) {
+		u32 retained;
+		u32 __user *retained_ptr;
+
+		retained_ptr = u64_to_user_ptr(args->purge_state_val.retained_ptr);
+		if (get_user(retained, retained_ptr)) {
+			err = -EFAULT;
+			goto put_vm;
+		}
+
+		if (XE_IOCTL_DBG(xe, retained != 0)) {
+			err = -EINVAL;
+			goto put_vm;
+		}
+	}
+
 	xe_svm_flush(vm);
 
 	err = down_write_killable(&vm->lock);
@@ -510,6 +635,13 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	}
 
 	attr_type = array_index_nospec(args->type, ARRAY_SIZE(madvise_funcs));
+
+	/* Ensure the madvise function exists for this type */
+	if (!madvise_funcs[attr_type]) {
+		err = -EINVAL;
+		goto err_fini;
+	}
+
 	madvise_funcs[attr_type](xe, vm, madvise_range.vmas, madvise_range.num_vmas, args,
 				 &details);
 
@@ -528,6 +660,10 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 	xe_madvise_details_fini(&details);
 unlock_vm:
 	up_write(&vm->lock);
+
+	/* Write retained value to user after releasing all locks */
+	if (!err && do_retained)
+		err = xe_madvise_purgeable_retained_to_user(&details);
 put_vm:
 	xe_vm_put(vm);
 	return err;
-- 
2.43.0

