Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D2CC87FCA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 16:17:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6F610E881;
	Thu,  7 Aug 2025 16:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z8yYyVZ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEED10E886
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 16:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754583425; x=1786119425;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=058xo/7kZxdSUJEpP1BT0DXwCPEwTNro0hOK+2xr7K8=;
 b=Z8yYyVZ4VUG4uLeN6IV13BHDr+qjLpTMwXNMqFkb14dvU6yl3wHXe+Y/
 c3faW2W8LNLXbMjgmF9eakkf4FkuwzReghJxXQnPJduWXfN/G5QXNPDZe
 ANmaW3SwTHX2mVoTxaA2FblgPyWCg7b2x2LDfye9nUFnQLxXnhMJ6umyn
 bKMMTISi83iGRKC8wxdfXQ2qcQnBh8Jmge3eeOd5q74eF5eikTwAp9wdp
 Ntx53RmrekldGfNQhvGOOX0BXK11X6+1B5ApnJZsxoT2h0wZCBeyOJZ0l
 w/Jy/22Bb+eL0lQxkgDwazgbQUSZH2bC78fakbz21kZFGTmZsHtoHO97y w==;
X-CSE-ConnectionGUID: ZFK76wJbRkCv94JzfJCmpQ==
X-CSE-MsgGUID: yQ73rnBHT42q7XDbVUVDGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56845594"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56845594"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 09:17:05 -0700
X-CSE-ConnectionGUID: tralMLlnT5uQTQl/oPLEfA==
X-CSE-MsgGUID: E0z8PwadSJ2paZAsqXhzpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="195937863"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 07 Aug 2025 09:17:03 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v6 14/26] drm/xe/svm : Add svm ranges migration policy on
 atomic access
Date: Thu,  7 Aug 2025 22:13:26 +0530
Message-Id: <20250807164338.1832254-15-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
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

If the platform does not support atomic access on system memory, and the
ranges are in system memory, but the user requires atomic accesses on
the VMA, then migrate the ranges to VRAM. Apply this policy for prefetch
operations as well.

v2
- Drop unnecessary vm_dbg

v3 (Matthew Brost)
- fix atomic policy
- prefetch shouldn't have any impact of atomic
- bo can be accessed from vma, avoid duplicate parameter

v4 (Matthew Brost)
- Remove TODO comment
- Fix comment
- Dont allow gpu atomic ops when user is setting atomic attr as CPU

v5 (Matthew Brost)
- Fix atomic checks
- Add userptr checks

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c         | 23 ++++++++------
 drivers/gpu/drm/xe/xe_svm.c        | 50 ++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_vm.c         | 39 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h         |  2 ++
 drivers/gpu/drm/xe/xe_vm_madvise.c | 15 ++++++++-
 5 files changed, 99 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 593fef438cd8..6f5b384991cd 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -640,28 +640,31 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
  *    - In all other cases device atomics will be disabled with AE=0 until an application
  *      request differently using a ioctl like madvise.
  */
-static bool xe_atomic_for_vram(struct xe_vm *vm)
+static bool xe_atomic_for_vram(struct xe_vm *vm, struct xe_vma *vma)
 {
+	if (vma->attr.atomic_access == DRM_XE_ATOMIC_CPU)
+		return false;
+
 	return true;
 }
 
-static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_bo *bo)
+static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_vma *vma)
 {
 	struct xe_device *xe = vm->xe;
+	struct xe_bo *bo = xe_vma_bo(vma);
 
-	if (!xe->info.has_device_atomics_on_smem)
+	if (!xe->info.has_device_atomics_on_smem ||
+	    vma->attr.atomic_access == DRM_XE_ATOMIC_CPU)
 		return false;
 
+	if (vma->attr.atomic_access == DRM_XE_ATOMIC_DEVICE)
+		return true;
+
 	/*
 	 * If a SMEM+LMEM allocation is backed by SMEM, a device
 	 * atomics will cause a gpu page fault and which then
 	 * gets migrated to LMEM, bind such allocations with
 	 * device atomics enabled.
-	 *
-	 * TODO: Revisit this. Perhaps add something like a
-	 * fault_on_atomics_in_system UAPI flag.
-	 * Note that this also prohibits GPU atomics in LR mode for
-	 * userptr and system memory on DGFX.
 	 */
 	return (!IS_DGFX(xe) || (!xe_vm_in_lr_mode(vm) ||
 				 (bo && xe_bo_has_single_placement(bo))));
@@ -744,8 +747,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		goto walk_pt;
 
 	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
-		xe_walk.default_vram_pte = xe_atomic_for_vram(vm) ? XE_USM_PPGTT_PTE_AE : 0;
-		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo) ?
+		xe_walk.default_vram_pte = xe_atomic_for_vram(vm, vma) ? XE_USM_PPGTT_PTE_AE : 0;
+		xe_walk.default_system_pte = xe_atomic_for_system(vm, vma) ?
 			XE_USM_PPGTT_PTE_AE : 0;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index c2306000f15e..c660ccb21945 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -789,22 +789,9 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 	return true;
 }
 
-/**
- * xe_svm_handle_pagefault() - SVM handle page fault
- * @vm: The VM.
- * @vma: The CPU address mirror VMA.
- * @gt: The gt upon the fault occurred.
- * @fault_addr: The GPU fault address.
- * @atomic: The fault atomic access bit.
- *
- * Create GPU bindings for a SVM page fault. Optionally migrate to device
- * memory.
- *
- * Return: 0 on success, negative error code on error.
- */
-int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
-			    struct xe_gt *gt, u64 fault_addr,
-			    bool atomic)
+static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
+				     struct xe_gt *gt, u64 fault_addr,
+				     bool need_vram)
 {
 	struct drm_gpusvm_ctx ctx = {
 		.read_only = xe_vma_read_only(vma),
@@ -812,9 +799,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
 		.check_pages_threshold = IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K : 0,
-		.devmem_only = atomic && IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
-		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
+		.devmem_only = need_vram && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
+		.timeslice_ms = need_vram && IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
 			vm->xe->atomic_svm_timeslice_ms : 0,
 	};
@@ -917,6 +903,32 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	return err;
 }
 
+/**
+ * xe_svm_handle_pagefault() - SVM handle page fault
+ * @vm: The VM.
+ * @vma: The CPU address mirror VMA.
+ * @gt: The gt upon the fault occurred.
+ * @fault_addr: The GPU fault address.
+ * @atomic: The fault atomic access bit.
+ *
+ * Create GPU bindings for a SVM page fault. Optionally migrate to device
+ * memory.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
+			    struct xe_gt *gt, u64 fault_addr,
+			    bool atomic)
+{
+	int need_vram;
+
+	need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
+	if (need_vram < 0)
+		return need_vram;
+
+	return __xe_svm_handle_pagefault(vm, vma, gt, fault_addr, need_vram ? true : false);
+}
+
 /**
  * xe_svm_has_mapping() - SVM has mappings
  * @vm: The VM.
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 376850a22be2..aa8d4c4fe0f0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4183,6 +4183,45 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
 	kvfree(snap);
 }
 
+/**
+ * xe_vma_need_vram_for_atomic - Check if VMA needs VRAM migration for atomic operations
+ * @xe: Pointer to the XE device structure
+ * @vma: Pointer to the virtual memory area (VMA) structure
+ * @is_atomic: In pagefault path and atomic operation
+ *
+ * This function determines whether the given VMA needs to be migrated to
+ * VRAM in order to do atomic GPU operation.
+ *
+ * Return:
+ *   1        - Migration to VRAM is required
+ *   0        - Migration is not required
+ *   -EACCES  - Invalid access for atomic memory attr
+ *
+ */
+int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic)
+{
+	if (!IS_DGFX(xe) || !is_atomic)
+		return 0;
+
+	/*
+	 * NOTE: The checks implemented here are platform-specific. For
+	 * instance, on a device supporting CXL atomics, these would ideally
+	 * work universally without additional handling.
+	 */
+	switch (vma->attr.atomic_access) {
+	case DRM_XE_ATOMIC_DEVICE:
+		return !xe->info.has_device_atomics_on_smem;
+
+	case DRM_XE_ATOMIC_CPU:
+		return -EACCES;
+
+	case DRM_XE_ATOMIC_UNDEFINED:
+	case DRM_XE_ATOMIC_GLOBAL:
+	default:
+		return 1;
+	}
+}
+
 /**
  * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
  * @vm: Pointer to the xe_vm structure
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 0d6b08cc4163..05ac3118d9f4 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -171,6 +171,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 
 struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
 
+int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic);
+
 int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index b861c3349b0a..95258bb6a8ee 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -85,7 +85,20 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 			   struct xe_vma **vmas, int num_vmas,
 			   struct drm_xe_madvise *op)
 {
-	/* Implementation pending */
+	int i;
+
+	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC);
+	xe_assert(vm->xe, op->atomic.val <= DRM_XE_ATOMIC_CPU);
+
+	for (i = 0; i < num_vmas; i++) {
+		if ((xe_vma_is_userptr(vmas[i]) &&
+		     !(op->atomic.val == DRM_XE_ATOMIC_DEVICE &&
+		       xe->info.has_device_atomics_on_smem)))
+			continue;
+
+		vmas[i]->attr.atomic_access = op->atomic.val;
+	/*TODO: handle bo backed vmas */
+	}
 }
 
 static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
-- 
2.34.1

