Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C2CC87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 12:34:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6849F10E691;
	Wed, 30 Jul 2025 12:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O1+74osc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB4F10E203
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 12:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753878865; x=1785414865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ek5/YG/26t2sh7yWk1iIHcdDiLVn814Vu05nP9xlH8E=;
 b=O1+74oscfo9syomzuuiB8TkQIIJgCJuJ2RmzeoQ6460XEz5AArv71XCA
 l0E+oiSvpSUNgESMukVpbCt6QniqjDXKRhyVAkf/YgmE3OJQfTaNVCRSK
 Qzcnw6OoYXwHAwNi+1EtXlMa3yDMCnQcL8MgUgNyf03bv1tAj69dyWc38
 bLeVIUhsKaMrG6dXE8ygzqVikWDTPK+zuX56wNdd4cKzuQu7p+bLTPTJk
 xyrt11hMDzeCX112f6a5oh8HH3Hko+GXEJErlTCaZB6jRQM1smAGcIU80
 Z6GscAJu7gy8k15DenCENC/i9DiotBHqE9YXFgm/IooiJyMq8ya9+jS09 g==;
X-CSE-ConnectionGUID: 9yq6wgSMQRS197+ECjYqrA==
X-CSE-MsgGUID: vwWzUlflQi2Z52kHxq4eWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66450158"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="66450158"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 05:34:25 -0700
X-CSE-ConnectionGUID: IJ6TbbhNS7Oxo1C1RDFV6A==
X-CSE-MsgGUID: 1yAJVhtHTLG3NjwZXAdQ0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="186649491"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 30 Jul 2025 05:34:23 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 14/25] drm/xe/svm : Add svm ranges migration policy on
 atomic access
Date: Wed, 30 Jul 2025 18:30:39 +0530
Message-Id: <20250730130050.1001648-15-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
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
 drivers/gpu/drm/xe/xe_pt.c         | 23 ++++++++++--------
 drivers/gpu/drm/xe/xe_svm.c        |  8 ++++--
 drivers/gpu/drm/xe/xe_vm.c         | 39 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h         |  2 ++
 drivers/gpu/drm/xe/xe_vm_madvise.c | 15 +++++++++++-
 5 files changed, 74 insertions(+), 13 deletions(-)

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
index 1d0b444bf2ae..5e78beebe114 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -793,14 +793,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    struct xe_gt *gt, u64 fault_addr,
 			    bool atomic)
 {
+	int need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
+
+	if (need_vram < 0)
+		return need_vram;
+
 	struct drm_gpusvm_ctx ctx = {
 		.read_only = xe_vma_read_only(vma),
 		.devmem_possible = IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
 		.check_pages_threshold = IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K : 0,
-		.devmem_only = atomic && IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
+		.devmem_only = need_vram && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
 		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
 			vm->xe->atomic_svm_timeslice_ms : 0,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d039779412b3..463736db19d9 100644
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
+ *   -EINVAL  - Invalid access for atomic memory attr
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
+		return -EINVAL;
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
index b861c3349b0a..a53b63dd603d 100644
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
+		if (xe_vma_is_userptr(vmas[i])) {
+			if (!(op->atomic.val == DRM_XE_ATOMIC_DEVICE &&
+			      xe->info.has_device_atomics_on_smem))
+				continue;
+		}
+		vmas[i]->attr.atomic_access = op->atomic.val;
+	/*TODO: handle bo backed vmas */
+	}
 }
 
 static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
-- 
2.34.1

