Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354CBC83F34
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 13:09:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FF710E694;
	Tue, 22 Jul 2025 13:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iqQ4UFtG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B90010E68E
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 13:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753189742; x=1784725742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qoBgbkH+2ZzxngWkvl0WWfg+HR00yebEFROy///NkmQ=;
 b=iqQ4UFtGuknB+4jtwqpitck+9b/BhMSROhK4zQAvOR1V6SEwgkcorn5h
 DkZQHvKDHNV/NPa8Tqhhrmy3MzDxewRmGjoHAy7g2nW6oMLPz1xWhDrzW
 +NJh1VjI/2W41FQc/kB3Qk9YwEnLegQMnF3qOosXEGpV18/7Ioi5BQLba
 KV0V9qt2oPrl2G/QcTo7oW63fg1h89wrwdXR4qtZGc9QMb9caOmVnhPR5
 smECFLiSnFst8L7oHWpQPw4dHmURqHc9DKETee/9lGa40MboWZAYbB8QF
 z4akbVZ9r+NxtUcirLJHfFyYeGcZJqce8j6eHEyBB0yUFmkI6YmQ/Xn+w A==;
X-CSE-ConnectionGUID: PxNmKqF4RRiWaecCuXhxqw==
X-CSE-MsgGUID: lqKVc5GgRZmPm/sefJzMfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55530377"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55530377"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 06:09:02 -0700
X-CSE-ConnectionGUID: hgIdsiOeTp2MHtfmtW+HKQ==
X-CSE-MsgGUID: SZ4l1v+QQQCYnXFfeTLmGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163420602"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa005.fm.intel.com with ESMTP; 22 Jul 2025 06:09:00 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 11/23] drm/xe/svm : Add svm ranges migration policy on
 atomic access
Date: Tue, 22 Jul 2025 19:05:14 +0530
Message-Id: <20250722133526.3550547-12-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
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

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c         | 23 +++++++++--------
 drivers/gpu/drm/xe/xe_svm.c        |  2 +-
 drivers/gpu/drm/xe/xe_vm.c         | 40 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h         |  2 ++
 drivers/gpu/drm/xe/xe_vm_madvise.c |  9 ++++++-
 5 files changed, 64 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index b499006df2cf..96d0ffe8154e 100644
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
index c093dc453e32..49d3405aacb9 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -813,7 +813,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
 		.check_pages_threshold = IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K : 0,
-		.devmem_only = atomic && IS_DGFX(vm->xe) &&
+		.devmem_only = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic) &&
 			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
 		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7f3d0ad04b3f..be51fcf322ec 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4177,6 +4177,46 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
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
+ * Return: true if migration to VRAM is required, false otherwise.
+ */
+bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic)
+{
+	if (!IS_DGFX(xe))
+		return false;
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
+		XE_WARN_ON(is_atomic);
+		return false;
+
+	case DRM_XE_ATOMIC_UNDEFINED:
+		return is_atomic;
+
+	case DRM_XE_ATOMIC_GLOBAL:
+		return true;
+
+	default:
+		return is_atomic;
+	}
+}
+
 /**
  * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
  * @vm: Pointer to the xe_vm structure
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 0d6b08cc4163..d5bc09ae640c 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -171,6 +171,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 
 struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
 
+bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic);
+
 int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index f64728120d7c..62dc5cec8950 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -85,7 +85,14 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 			   struct xe_vma **vmas, int num_vmas,
 			   struct drm_xe_madvise *op)
 {
-	/* Implementation pending */
+	int i;
+
+	xe_assert(vm->xe, op->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC);
+	xe_assert(vm->xe, op->atomic.val <= DRM_XE_ATOMIC_CPU);
+
+	for (i = 0; i < num_vmas; i++)
+		vmas[i]->attr.atomic_access = op->atomic.val;
+	/*TODO: handle bo backed vmas */
 }
 
 static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
-- 
2.34.1

