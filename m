Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0E3D2ED0F
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 06:09:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67D910E557;
	Tue, 20 Jan 2026 06:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HHg1q9ek";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942F410E556
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 06:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768889366; x=1800425366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3wTUS7fAxnbfd4rhQ/YHVYwC32gXfOCa8hhkexxv/ho=;
 b=HHg1q9ekdi6YmbSr7XVRL9LnXZ0lYkAoI1aoyl9uJ3sqZdFHV+xO1On0
 wQso08Ev8u8o002TtpamSSnzkrgb12IVx7xhJlG0rT/5yfz5QNEdHV/XG
 h3u1px2exPlgAeP4rfwig9NYkLBqawg8u5IwBbMK4SwPMJYXpi2zL7b2w
 oZLWZQd8zivw/U+MAgdAHux6W0hbc0lRc6gkF+X4t9aaxixehPm2jBzD+
 umenuuuJwTzqChyj/lUPQ3ujxNogo1+jLaqq4Kfm+teA1wmUA4J6K/T+X
 6KgI4ANqRfgzjMRsha0nfF6bUo2Z8l1j+r59Ys2J7SNzK8iOp4IcqzhSp g==;
X-CSE-ConnectionGUID: x0mZKoRaRZCLoKLbNqPCaw==
X-CSE-MsgGUID: L0GzeDVtRhyWOon3zRqJuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="72677003"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="72677003"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 22:09:26 -0800
X-CSE-ConnectionGUID: DoDhaEKcQzqmboYdDqMNOQ==
X-CSE-MsgGUID: qAYw/NWWS8eOUS6r6NS50w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="205658612"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 22:09:25 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [PATCH v4 6/8] drm/xe/madvise: Implement per-VMA purgeable state
 tracking
Date: Tue, 20 Jan 2026 11:38:52 +0530
Message-ID: <20260120060900.3137984-7-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120060900.3137984-1-arvind.yadav@intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
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

v3:
  - This addresses Thomas Hellström's feedback: "loop over all vmas
    attached to the bo and check that they all say WONTNEED. This will
    also need a check at VMA unbinding"

v4:
  - @madv_purgeable atomic_t → u32 change across all relevant patches. (Matt)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c         | 15 +++++-
 drivers/gpu/drm/xe/xe_vm_madvise.c | 84 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm_madvise.h |  3 ++
 drivers/gpu/drm/xe/xe_vm_types.h   | 11 ++++
 4 files changed, 111 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f250daae3012..9543960b5613 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -40,6 +40,7 @@
 #include "xe_tile.h"
 #include "xe_tlb_inval.h"
 #include "xe_trace_bo.h"
+#include "xe_vm_madvise.h"
 #include "xe_wa.h"
 
 static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
@@ -1079,12 +1080,18 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 static void xe_vma_destroy_late(struct xe_vma *vma)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_bo *bo = NULL;
 
 	if (vma->ufence) {
 		xe_sync_ufence_put(vma->ufence);
 		vma->ufence = NULL;
 	}
 
+	/* Get BO reference for purgeable state re-check */
+	if (!xe_vma_is_userptr(vma) && !xe_vma_is_null(vma) &&
+	    !xe_vma_is_cpu_addr_mirror(vma))
+		bo = xe_vma_bo(vma);
+
 	if (xe_vma_is_userptr(vma)) {
 		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
 
@@ -1093,7 +1100,13 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 	} else if (xe_vma_is_null(vma) || xe_vma_is_cpu_addr_mirror(vma)) {
 		xe_vm_put(vm);
 	} else {
-		xe_bo_put(xe_vma_bo(vma));
+		/* Trylock safe for async context; madvise corrects failures */
+		if (bo && dma_resv_trylock(bo->ttm.base.resv)) {
+			xe_bo_recheck_purgeable_on_vma_unbind(bo);
+			dma_resv_unlock(bo->ttm.base.resv);
+		}
+
+		xe_bo_put(bo);
 	}
 
 	xe_vma_free(vma);
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index dfeab9e24a09..27b6ad65b314 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -12,6 +12,7 @@
 #include "xe_pat.h"
 #include "xe_pt.h"
 #include "xe_svm.h"
+#include "xe_vm.h"
 
 struct xe_vmas_in_madvise_range {
 	u64 addr;
@@ -179,6 +180,80 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
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
+	dma_resv_assert_held(bo->ttm.base.resv);
+
+	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
+		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
+			struct xe_vma *vma = gpuva_to_vma(gpuva);
+
+			has_vmas = true;
+
+			/* Any non-DONTNEED VMA prevents purging */
+			if (READ_ONCE(vma->purgeable_state) != XE_MADV_PURGEABLE_DONTNEED)
+				return false;
+		}
+	}
+
+	/* No VMAs means not purgeable */
+	if (!has_vmas)
+		return false;
+
+	return true;
+}
+
+/**
+ * xe_bo_recheck_purgeable_on_vma_unbind() - Re-evaluate BO purgeable state after VMA unbind
+ * @bo: Buffer object
+ *
+ * When a VMA is unbound, re-check if the BO's purgeable state should change.
+ * Destroyed VMAs may allow the BO to become purgeable if all remaining VMAs
+ * are DONTNEED, or require transition to WILLNEED if no VMAs remain.
+ *
+ * Called from VMA destruction path with BO dma-resv lock held.
+ */
+void xe_bo_recheck_purgeable_on_vma_unbind(struct xe_bo *bo)
+{
+	if (!bo)
+		return;
+
+	dma_resv_assert_held(bo->ttm.base.resv);
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
+			bo->madv_purgeable = XE_MADV_PURGEABLE_DONTNEED;
+	} else {
+		/* At least one VMA is WILLNEED - BO must not be purgeable */
+		if (bo->madv_purgeable != XE_MADV_PURGEABLE_WILLNEED)
+			bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
+	}
+}
+
 /*
  * Handle purgeable buffer object advice for DONTNEED/WILLNEED/PURGED.
  * Returns true if any BO was purged, false otherwise.
@@ -213,10 +288,17 @@ static bool xe_vm_madvise_purgeable_bo(struct xe_device *xe, struct xe_vm *vm,
 
 		switch (op->purge_state_val.val) {
 		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
+			vmas[i]->purgeable_state = XE_MADV_PURGEABLE_WILLNEED;
+
+			/* Mark VMA WILLNEED - BO becomes non-purgeable immediately */
 			bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
 			break;
 		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
-			bo->madv_purgeable = XE_MADV_PURGEABLE_DONTNEED;
+			vmas[i]->purgeable_state = XE_MADV_PURGEABLE_DONTNEED;
+
+			/* Mark BO purgeable only if all VMAs are DONTNEED */
+			if (xe_bo_all_vmas_dontneed(bo))
+				bo->madv_purgeable = XE_MADV_PURGEABLE_DONTNEED;
 			break;
 		default:
 			drm_warn(&vm->xe->drm, "Invalid madvice value = %d\n",
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
index b0e1fc445f23..61868f851949 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.h
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
@@ -8,8 +8,11 @@
 
 struct drm_device;
 struct drm_file;
+struct xe_bo;
 
 int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file);
 
+void xe_bo_recheck_purgeable_on_vma_unbind(struct xe_bo *bo);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 437f64202f3b..94ca9d033b06 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -150,6 +150,17 @@ struct xe_vma {
 	 */
 	bool skip_invalidation;
 
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
+
 	/**
 	 * @ufence: The user fence that was provided with MAP.
 	 * Needs to be signalled before UNMAP can be processed.
-- 
2.43.0

