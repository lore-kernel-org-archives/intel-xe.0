Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C99FC61DB2
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 12:30:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D4810E986;
	Fri, 13 Jun 2025 12:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RNZN9B0w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E824710E91C
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 12:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749817820; x=1781353820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VxaO0ML8J1O11b6qc5g0q8L64BC5L+G3VZfhZLeZvko=;
 b=RNZN9B0w0DzKBhLCzdbf4xoTBZurg1pPVnA+FS346xoOuc+8Fq4tf3qt
 6B9pEmA6Bm1GluZqlYzFjxGEoIvBgvaTSzd9jgYGfLKqgOG1VcB08g9f5
 W/LBOhuqeD4bf7sa+X7n7TTdilBdoSMESTQNQpPV/D9kqVjeCAqymRdVO
 Pi/O2MCRboDer5Oq4LGJTwO5LUE/+ieOVsiDlK0sVv81pfmPyIElD7kvX
 KXKWPUamVRTl6qcyVNZ+HMRCFdhUL8hpeOqtN8iqLpx7S6sWhfAlzmYZ3
 pjESq45yw4Y4V7kRvBVY4Ptb1ilKEHXZS0xMJQYuGoBfigRL0pKwbqOzJ A==;
X-CSE-ConnectionGUID: v90zhxakQae0k0Z6rMKOMw==
X-CSE-MsgGUID: oWyT8dUXSg6zN8GHeyrwrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69610173"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="69610173"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 05:30:20 -0700
X-CSE-ConnectionGUID: c+9Ovu9JSWmYe9tKWj6a+Q==
X-CSE-MsgGUID: f86rtQsKQpyO8eJETdIMwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="148290343"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jun 2025 05:30:18 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 12/20] drm/xe/svm : Add svm ranges migration policy on
 atomic access
Date: Fri, 13 Jun 2025 18:25:50 +0530
Message-Id: <20250613125558.2607665-13-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
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

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c         |  9 ++++++--
 drivers/gpu/drm/xe/xe_svm.c        |  2 +-
 drivers/gpu/drm/xe/xe_vm.c         | 36 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h         |  2 ++
 drivers/gpu/drm/xe/xe_vm_madvise.c |  9 +++++++-
 5 files changed, 54 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 9a390ef10852..9dd286853654 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -645,13 +645,18 @@ static bool xe_atomic_for_vram(struct xe_vm *vm)
 	return true;
 }
 
-static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_bo *bo)
+static bool xe_atomic_for_system(struct xe_vm *vm,
+				 struct xe_vma *vma)
 {
 	struct xe_device *xe = vm->xe;
+	struct xe_bo *bo = xe_vma_bo(vma);
 
 	if (!xe->info.has_device_atomics_on_smem)
 		return false;
 
+	if (vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE)
+		return true;
+
 	/*
 	 * If a SMEM+LMEM allocation is backed by SMEM, a device
 	 * atomics will cause a gpu page fault and which then
@@ -745,7 +750,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 
 	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
 		xe_walk.default_vram_pte = xe_atomic_for_vram(vm) ? XE_USM_PPGTT_PTE_AE : 0;
-		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo) ?
+		xe_walk.default_system_pte = xe_atomic_for_system(vm, vma) ?
 			XE_USM_PPGTT_PTE_AE : 0;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index df6992ee2e2d..003aae9a0d82 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -815,7 +815,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
 		.check_pages_threshold = IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
-		.devmem_only = atomic && IS_DGFX(vm->xe) &&
+		.devmem_only = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic) &&
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
 		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0872df8d0b15..6dd1f868942d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4177,6 +4177,42 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
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
+	/* Note: The checks implemented here are platform-specific. For instance,
+	 * on a device supporting CXL atomics, these would ideally work universally
+	 * without additional handling.
+	 */
+	switch (vma->attr.atomic_access) {
+	case DRM_XE_VMA_ATOMIC_DEVICE:
+		return !xe->info.has_device_atomics_on_smem;
+
+	case DRM_XE_VMA_ATOMIC_CPU:
+	case DRM_XE_VMA_ATOMIC_UNDEFINED:
+		return is_atomic;
+
+	case DRM_XE_VMA_ATOMIC_GLOBAL:
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
index 66bb6babd319..1fb639a33ffb 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -171,6 +171,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 
 struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
 
+bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool is_atomic);
+
 int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index ff560914ad7e..403337d79ea6 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -89,7 +89,14 @@ static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 			   struct xe_vma **vmas, int num_vmas,
 			   struct drm_xe_madvise *op)
 {
-	/* Implementation pending */
+	int i;
+
+	xe_assert(vm->xe, op->type == DRM_XE_VMA_ATTR_ATOMIC);
+	xe_assert(vm->xe, op->atomic.val <= DRM_XE_VMA_ATOMIC_CPU);
+
+	for (i = 0; i < num_vmas; i++)
+		vmas[i]->attr.atomic_access = op->atomic.val;
+	/*TODO: handle bo backed vmas */
 }
 
 static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
-- 
2.34.1

