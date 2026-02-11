Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08E2E9E311
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 15:27:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B2410E051;
	Wed, 11 Feb 2026 15:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z/e0opfz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C3F10E051
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 15:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770823631; x=1802359631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Epc3hXNwAOwJ36OA+EF5cV6oYA2IPuiymlkw3QkDVGQ=;
 b=Z/e0opfzKNVOXruMnPxVZmFZciMaIhyPGVNRKhsNq2nZmOaNrmC9o5O5
 0b1DmeJwkeaMXpvkv+lbzi9Lk0GYlpWjE6qrvs6zMCk3N/LTw4rcDZHZb
 3lrUwqISQQhX2QCFARD2GBOnYuGRggV5Ae3nWRz2V4ytX2QegAj64ocZ8
 w2OT2l/ARsAP/qVD3vfkfh7ejmfaTvEaZiirOWtuwRNcc8yfG/8U+7uPh
 xtq0kQR3AmS0d+EHmGmZV1bbdDHOV07OpixZrJyiDOwQDan71s1KdAkgF
 au8m264t2YnF+1PSCpvlvVtnhj79B0yUcSyAuwCQmnwEMEokWtxUbU4fq w==;
X-CSE-ConnectionGUID: 4XGb9Kj8RJ2SwGkD15Vo1w==
X-CSE-MsgGUID: V9koYWMARY2L7w6gZ9FYiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="89564293"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="89564293"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 07:27:11 -0800
X-CSE-ConnectionGUID: +iPBE9XmRzetfM+Cz0q6Bg==
X-CSE-MsgGUID: H2BiAIWAR/GEZBfw4ogwhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211388181"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 07:27:10 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [PATCH v5 6/9] drm/xe/madvise: Implement per-VMA purgeable state
 tracking
Date: Wed, 11 Feb 2026 20:56:35 +0530
Message-ID: <20260211152644.1661165-7-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211152644.1661165-1-arvind.yadav@intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
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

Track purgeable state per-VMA instead of using a coarse shared
BO check. This prevents purging shared BOs until all VMAs across
all VMs are marked DONTNEED.

Add xe_bo_all_vmas_dontneed() to check all VMAs before marking
a BO purgeable. Add xe_bo_recheck_purgeable_on_vma_unbind() to
handle state transitions when VMAs are destroyed - if all
remaining VMAs are DONTNEED the BO can become purgeable, or if
no VMAs remain it transitions to WILLNEED.

The per-VMA purgeable_state field stores the madvise hint for
each mapping. Shared BOs can only be purged when all VMAs
unanimously indicate DONTNEED.

One thing to note: when the last VMA goes away, we default back to
WILLNEED. DONTNEED is a per-mapping hint, and without any mappings
there is no remaining madvise state to justify purging. This prevents
BOs from becoming purgeable solely due to being temporarily unmapped.

v3:
  - This addresses Thomas Hellström's feedback: "loop over all vmas
    attached to the bo and check that they all say WONTNEED. This will
    also need a check at VMA unbinding"

v4:
  - @madv_purgeable atomic_t → u32 change across all relevant
    patches (Matt)

v5:
  - Call xe_bo_recheck_purgeable_on_vma_unbind() from xe_vma_destroy()
    right after drm_gpuva_unlink() where we already hold the BO lock,
    drop the trylock-based late destroy path (Matt)
  - Move purgeable_state into xe_vma_mem_attr with the other madvise
    attributes (Matt)
  - Drop READ_ONCE since the BO lock already protects us (Matt)
  - Keep returning false when there are no VMAs - otherwise we'd mark
    BOs purgeable without any user hint (Matt)
  - Use xe_bo_set_purgeable_state() instead of direct initialization(Matt)
  - use xe_assert instead of drm_war (Thomas)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c        |  1 +
 drivers/gpu/drm/xe/xe_vm.c         |  9 ++-
 drivers/gpu/drm/xe/xe_vm_madvise.c | 98 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm_madvise.h |  3 +
 drivers/gpu/drm/xe/xe_vm_types.h   | 11 ++++
 5 files changed, 116 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index cda3bf7e2418..329c77aa5c20 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -318,6 +318,7 @@ static void xe_vma_set_default_attributes(struct xe_vma *vma)
 		.preferred_loc.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
 		.pat_index = vma->attr.default_pat_index,
 		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
+		.purgeable_state = XE_MADV_PURGEABLE_WILLNEED,
 	};
 
 	xe_vma_mem_attr_copy(&vma->attr, &default_attr);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 71cf3ce6c62b..e84b9e7cb5eb 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -39,6 +39,7 @@
 #include "xe_tile.h"
 #include "xe_tlb_inval.h"
 #include "xe_trace_bo.h"
+#include "xe_vm_madvise.h"
 #include "xe_wa.h"
 
 static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
@@ -1085,6 +1086,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 static void xe_vma_destroy_late(struct xe_vma *vma)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_bo *bo = xe_vma_bo(vma);
 
 	if (vma->ufence) {
 		xe_sync_ufence_put(vma->ufence);
@@ -1099,7 +1101,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 	} else if (xe_vma_is_null(vma) || xe_vma_is_cpu_addr_mirror(vma)) {
 		xe_vm_put(vm);
 	} else {
-		xe_bo_put(xe_vma_bo(vma));
+		xe_bo_put(bo);
 	}
 
 	xe_vma_free(vma);
@@ -1125,6 +1127,7 @@ static void vma_destroy_cb(struct dma_fence *fence,
 static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_bo *bo = xe_vma_bo(vma);
 
 	lockdep_assert_held_write(&vm->lock);
 	xe_assert(vm->xe, list_empty(&vma->combined_links.destroy));
@@ -1133,9 +1136,10 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 		xe_assert(vm->xe, vma->gpuva.flags & XE_VMA_DESTROYED);
 		xe_userptr_destroy(to_userptr_vma(vma));
 	} else if (!xe_vma_is_null(vma) && !xe_vma_is_cpu_addr_mirror(vma)) {
-		xe_bo_assert_held(xe_vma_bo(vma));
+		xe_bo_assert_held(bo);
 
 		drm_gpuva_unlink(&vma->gpuva);
+		xe_bo_recompute_purgeable_state(bo);
 	}
 
 	xe_vm_assert_held(vm);
@@ -2681,6 +2685,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
 				.default_pat_index = op->map.pat_index,
 				.pat_index = op->map.pat_index,
+				.purgeable_state = XE_MADV_PURGEABLE_WILLNEED,
 			};
 
 			flags |= op->map.vma_flags & XE_VMA_CREATE_MASK;
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index d9cfba7bfe0b..c184426546a2 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -12,6 +12,7 @@
 #include "xe_pat.h"
 #include "xe_pt.h"
 #include "xe_svm.h"
+#include "xe_vm.h"
 
 struct xe_vmas_in_madvise_range {
 	u64 addr;
@@ -183,6 +184,89 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 	}
 }
 
+/**
+ * xe_bo_all_vmas_dontneed() - Check if all VMAs of a BO are marked DONTNEED
+ * @bo: Buffer object
+ *
+ * Check all VMAs across all VMs to determine if BO can be purged.
+ * Shared BOs require unanimous DONTNEED state from all mappings.
+ *
+ * Caller must hold BO dma-resv lock.
+ *
+ * Return: true if all VMAs are DONTNEED, false otherwise
+ */
+static bool xe_bo_all_vmas_dontneed(struct xe_bo *bo)
+{
+	struct drm_gpuvm_bo *vm_bo;
+	struct drm_gpuva *gpuva;
+	struct drm_gem_object *obj = &bo->ttm.base;
+	bool has_vmas = false;
+
+	xe_bo_assert_held(bo);
+
+	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
+		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
+			struct xe_vma *vma = gpuva_to_vma(gpuva);
+
+			has_vmas = true;
+
+			/* Any non-DONTNEED VMA prevents purging */
+			if (vma->attr.purgeable_state != XE_MADV_PURGEABLE_DONTNEED)
+				return false;
+		}
+	}
+
+	/*
+	 * No VMAs => no mapping-level DONTNEED hint.
+	 * Default to WILLNEED to avoid making BOs purgeable without
+	 * explicit user intent.
+	 */
+	if (!has_vmas)
+		return false;
+
+	return true;
+}
+
+/**
+ * xe_bo_recompute_purgeable_state() - Recompute BO purgeable state from VMAs
+ * @bo: Buffer object
+ *
+ * Walk all VMAs to determine if BO should be purgeable or not.
+ * Shared BOs require unanimous DONTNEED state from all mappings.
+ *
+ * Locking: Caller must hold BO dma-resv lock. When iterating GPUVM lists,
+ * VM lock must also be held (write) to prevent concurrent VMA modifications.
+ * This is satisfied at both call sites:
+ * - xe_vma_destroy(): holds vm->lock write
+ * - madvise_purgeable(): holds vm->lock write (from madvise ioctl path)
+ *
+ * Return: nothing
+ */
+void xe_bo_recompute_purgeable_state(struct xe_bo *bo)
+{
+	if (!bo)
+		return;
+
+	xe_bo_assert_held(bo);
+
+	/*
+	 * Once purged, always purged. Cannot transition back to WILLNEED.
+	 * This matches i915 semantics where purged BOs are permanently invalid.
+	 */
+	if (bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED)
+		return;
+
+	if (xe_bo_all_vmas_dontneed(bo)) {
+		/* All VMAs are DONTNEED - mark BO purgeable */
+		if (bo->madv_purgeable != XE_MADV_PURGEABLE_DONTNEED)
+			xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
+	} else {
+		/* At least one VMA is WILLNEED - BO must not be purgeable */
+		if (bo->madv_purgeable != XE_MADV_PURGEABLE_WILLNEED)
+			xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_WILLNEED);
+	}
+}
+
 /**
  * madvise_purgeable - Handle purgeable buffer object advice
  * @xe: XE device
@@ -231,14 +315,20 @@ static void __maybe_unused madvise_purgeable(struct xe_device *xe,
 
 		switch (op->purge_state_val.val) {
 		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
-			xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_WILLNEED);
+			vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_WILLNEED;
+
+			/* Update BO purgeable state */
+			xe_bo_recompute_purgeable_state(bo);
 			break;
 		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
-			xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
+			vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
+
+			/* Update BO purgeable state */
+			xe_bo_recompute_purgeable_state(bo);
 			break;
 		default:
-			drm_warn(&vm->xe->drm, "Invalid madvice value = %d\n",
-				 op->purge_state_val.val);
+			/* Should never hit - values validated in madvise_args_are_sane() */
+			xe_assert(vm->xe, 0);
 			return;
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
index b0e1fc445f23..39acd2689ca0 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.h
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
@@ -8,8 +8,11 @@
 
 struct drm_device;
 struct drm_file;
+struct xe_bo;
 
 int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 
+void xe_bo_recompute_purgeable_state(struct xe_bo *bo);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 43203e90ee3e..fd563039e8f4 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -94,6 +94,17 @@ struct xe_vma_mem_attr {
 	 * same as default_pat_index unless overwritten by madvise.
 	 */
 	u16 pat_index;
+
+	/**
+	 * @purgeable_state: Purgeable hint for this VMA mapping
+	 *
+	 * Per-VMA purgeable state from madvise. Valid states are WILLNEED (0)
+	 * or DONTNEED (1). Shared BOs require all VMAs to be DONTNEED before
+	 * the BO can be purged. PURGED state exists only at BO level.
+	 *
+	 * Protected by BO dma-resv lock. Set via DRM_IOCTL_XE_MADVISE.
+	 */
+	u32 purgeable_state;
 };
 
 struct xe_vma {
-- 
2.43.0

