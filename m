Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC6B10A62CC
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 13:09:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6983E10E2E2;
	Thu, 26 Mar 2026 13:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MOdlsdZF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3E810E926
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 13:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774530548; x=1806066548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jrBiIk0879cls7MOTSzV2ZjGNUtCwnrMqre8Odil6G8=;
 b=MOdlsdZFtXjfABR2eGCjn2V84uB00YvJblKyD7c8Bt+V0cksSe10CTzi
 tVJ5W6tM78oJvdRQNvzEkPGPTvYAWBXfZvcHHIZQ3J8uCHz2vTbVx9sI/
 LqEAbzI4jc+6cRMB2zhH9a7NLghskae1mRQgKA2JVfL3/YdU15hyuB0FR
 3IHWb7gWJZWkqVZIlI4aPzu2fa9XrM5+0HUwKLFS47qiU4zzKKHLcL7BE
 sNeyXs9DVO41Y4Q8ArLd0vgAkwvj84z8UpUgcgdjkvz6NUxinZ9dmiyVH
 fx3Od/wH4GCBcDoVBrf/7XrbHE5rDqaAwuCZjNKvnw1h1Vc3+SugZbKeN A==;
X-CSE-ConnectionGUID: VdtrhcU5QVSkaWbjg0Siww==
X-CSE-MsgGUID: rrvcBxcaTai8a2E6WUlrEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75784777"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75784777"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 06:09:08 -0700
X-CSE-ConnectionGUID: 8xA2Dt1+T2e+19lcZ7qEqg==
X-CSE-MsgGUID: JZWs6SE8Tg+gbTWK+aPA5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="224070542"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 06:09:06 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [PATCH v9 06/12] drm/xe/madvise: Implement per-VMA purgeable state
 tracking
Date: Thu, 26 Mar 2026 18:38:32 +0530
Message-ID: <20260326130843.3545241-7-arvind.yadav@intel.com>
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

This prevents the bug where unmapping the last VMA would incorrectly flip
a DONTNEED BO back to WILLNEED. The enum-based state check preserves BO
state when no VMAs remain, only updating when VMAs provide explicit hints.

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
  - use xe_assert instead of drm_warn (Thomas)

v6:
  - Fix state transition bug: don't flip DONTNEED → WILLNEED when last
    VMA unmapped (Matt)
  - Change xe_bo_all_vmas_dontneed() from bool to enum to distinguish
    "no VMAs" from "has WILLNEED VMA" (Matt)
  - Preserve BO state on NO_VMAS instead of forcing WILLNEED.
  - Set skip_invalidation explicitly in madvise_purgeable() to ensure
    DONTNEED always zaps GPU PTEs regardless of prior madvise state.

v7:
  - Don't zap PTEs at DONTNEED time -- pages are still alive.
    The zap happens in xe_bo_move_notify() right before the shrinker
    frees them.
  - Simplify xe_bo_recompute_purgeable_state() by relying on the
    intentional value alignment between xe_bo_vmas_purge_state and
    xe_madv_purgeable_state enums. Add static_assert to enforce the
    alignment. (Thomas)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c        |   1 +
 drivers/gpu/drm/xe/xe_vm.c         |   9 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c | 136 +++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm_madvise.h |   3 +
 drivers/gpu/drm/xe/xe_vm_types.h   |  11 +++
 5 files changed, 153 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 0251098650af..5b627eed1eab 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -322,6 +322,7 @@ static void xe_vma_set_default_attributes(struct xe_vma *vma)
 		.preferred_loc.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
 		.pat_index = vma->attr.default_pat_index,
 		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
+		.purgeable_state = XE_MADV_PURGEABLE_WILLNEED,
 	};
 
 	xe_vma_mem_attr_copy(&vma->attr, &default_attr);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2dc968ff047b..c3f1ae999b71 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -40,6 +40,7 @@
 #include "xe_tile.h"
 #include "xe_tlb_inval.h"
 #include "xe_trace_bo.h"
+#include "xe_vm_madvise.h"
 #include "xe_wa.h"
 
 static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
@@ -1154,6 +1155,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 static void xe_vma_destroy_late(struct xe_vma *vma)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_bo *bo = xe_vma_bo(vma);
 
 	if (vma->ufence) {
 		xe_sync_ufence_put(vma->ufence);
@@ -1168,7 +1170,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 	} else if (xe_vma_is_null(vma) || xe_vma_is_cpu_addr_mirror(vma)) {
 		xe_vm_put(vm);
 	} else {
-		xe_bo_put(xe_vma_bo(vma));
+		xe_bo_put(bo);
 	}
 
 	xe_vma_free(vma);
@@ -1194,6 +1196,7 @@ static void vma_destroy_cb(struct dma_fence *fence,
 static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_bo *bo = xe_vma_bo(vma);
 
 	lockdep_assert_held_write(&vm->lock);
 	xe_assert(vm->xe, list_empty(&vma->combined_links.destroy));
@@ -1202,9 +1205,10 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 		xe_assert(vm->xe, vma->gpuva.flags & XE_VMA_DESTROYED);
 		xe_userptr_destroy(to_userptr_vma(vma));
 	} else if (!xe_vma_is_null(vma) && !xe_vma_is_cpu_addr_mirror(vma)) {
-		xe_bo_assert_held(xe_vma_bo(vma));
+		xe_bo_assert_held(bo);
 
 		drm_gpuva_unlink(&vma->gpuva);
+		xe_bo_recompute_purgeable_state(bo);
 	}
 
 	xe_vm_assert_held(vm);
@@ -2767,6 +2771,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
 				.default_pat_index = op->map.pat_index,
 				.pat_index = op->map.pat_index,
+				.purgeable_state = XE_MADV_PURGEABLE_WILLNEED,
 			};
 
 			flags |= op->map.vma_flags & XE_VMA_CREATE_MASK;
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index a20064e20289..991bbd6a7ff3 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -13,6 +13,7 @@
 #include "xe_pt.h"
 #include "xe_svm.h"
 #include "xe_tlb_inval.h"
+#include "xe_vm.h"
 
 struct xe_vmas_in_madvise_range {
 	u64 addr;
@@ -184,6 +185,116 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 	}
 }
 
+/**
+ * enum xe_bo_vmas_purge_state - VMA purgeable state aggregation
+ *
+ * Distinguishes whether a BO's VMAs are all DONTNEED, have at least
+ * one WILLNEED, or have no VMAs at all.
+ *
+ * Enum values align with XE_MADV_PURGEABLE_* states for consistency.
+ */
+enum xe_bo_vmas_purge_state {
+	/** @XE_BO_VMAS_STATE_WILLNEED: At least one VMA is WILLNEED */
+	XE_BO_VMAS_STATE_WILLNEED = 0,
+	/** @XE_BO_VMAS_STATE_DONTNEED: All VMAs are DONTNEED */
+	XE_BO_VMAS_STATE_DONTNEED = 1,
+	/** @XE_BO_VMAS_STATE_NO_VMAS: BO has no VMAs */
+	XE_BO_VMAS_STATE_NO_VMAS = 2,
+};
+
+/*
+ * xe_bo_recompute_purgeable_state() casts between xe_bo_vmas_purge_state and
+ * xe_madv_purgeable_state. Enforce that WILLNEED=0 and DONTNEED=1 match across
+ * both enums so the single-line cast is always valid.
+ */
+static_assert(XE_BO_VMAS_STATE_WILLNEED == (int)XE_MADV_PURGEABLE_WILLNEED,
+	      "VMA purge state WILLNEED must equal madv purgeable WILLNEED");
+static_assert(XE_BO_VMAS_STATE_DONTNEED == (int)XE_MADV_PURGEABLE_DONTNEED,
+	      "VMA purge state DONTNEED must equal madv purgeable DONTNEED");
+
+/**
+ * xe_bo_all_vmas_dontneed() - Determine BO VMA purgeable state
+ * @bo: Buffer object
+ *
+ * Check all VMAs across all VMs to determine aggregate purgeable state.
+ * Shared BOs require unanimous DONTNEED state from all mappings.
+ *
+ * Caller must hold BO dma-resv lock.
+ *
+ * Return: XE_BO_VMAS_STATE_DONTNEED if all VMAs are DONTNEED,
+ *         XE_BO_VMAS_STATE_WILLNEED if at least one VMA is not DONTNEED,
+ *         XE_BO_VMAS_STATE_NO_VMAS if BO has no VMAs
+ */
+static enum xe_bo_vmas_purge_state xe_bo_all_vmas_dontneed(struct xe_bo *bo)
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
+				return XE_BO_VMAS_STATE_WILLNEED;
+		}
+	}
+
+	/*
+	 * No VMAs => preserve existing BO purgeable state.
+	 * Avoids incorrectly flipping DONTNEED -> WILLNEED when last VMA unmapped.
+	 */
+	if (!has_vmas)
+		return XE_BO_VMAS_STATE_NO_VMAS;
+
+	return XE_BO_VMAS_STATE_DONTNEED;
+}
+
+/**
+ * xe_bo_recompute_purgeable_state() - Recompute BO purgeable state from VMAs
+ * @bo: Buffer object
+ *
+ * Walk all VMAs to determine if BO should be purgeable or not.
+ * Shared BOs require unanimous DONTNEED state from all mappings.
+ * If the BO has no VMAs the existing state is preserved.
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
+	enum xe_bo_vmas_purge_state vma_state;
+
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
+	vma_state = xe_bo_all_vmas_dontneed(bo);
+
+	if (vma_state != (enum xe_bo_vmas_purge_state)bo->madv_purgeable &&
+	    vma_state != XE_BO_VMAS_STATE_NO_VMAS)
+		xe_bo_set_purgeable_state(bo, (enum xe_madv_purgeable_state)vma_state);
+}
+
 /**
  * madvise_purgeable - Handle purgeable buffer object advice
  * @xe: XE device
@@ -215,8 +326,11 @@ static void __maybe_unused madvise_purgeable(struct xe_device *xe,
 	for (i = 0; i < num_vmas; i++) {
 		struct xe_bo *bo = xe_vma_bo(vmas[i]);
 
-		if (!bo)
+		if (!bo) {
+			/* Purgeable state applies to BOs only, skip non-BO VMAs */
+			vmas[i]->skip_invalidation = true;
 			continue;
+		}
 
 		/* BO must be locked before modifying madv state */
 		xe_bo_assert_held(bo);
@@ -227,19 +341,31 @@ static void __maybe_unused madvise_purgeable(struct xe_device *xe,
 		 */
 		if (xe_bo_is_purged(bo)) {
 			details->has_purged_bo = true;
+			vmas[i]->skip_invalidation = true;
 			continue;
 		}
 
 		switch (op->purge_state_val.val) {
 		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
-			xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_WILLNEED);
+			vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_WILLNEED;
+			vmas[i]->skip_invalidation = true;
+
+			xe_bo_recompute_purgeable_state(bo);
 			break;
 		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
-			xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
+			vmas[i]->attr.purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
+			/*
+			 * Don't zap PTEs at DONTNEED time -- pages are still
+			 * alive. The zap happens in xe_bo_move_notify() right
+			 * before the shrinker frees them.
+			 */
+			vmas[i]->skip_invalidation = true;
+
+			xe_bo_recompute_purgeable_state(bo);
 			break;
 		default:
-			drm_warn(&vm->xe->drm, "Invalid madvise value = %d\n",
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
index 3ab2cef25426..a94827d7fbec 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -96,6 +96,17 @@ struct xe_vma_mem_attr {
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

