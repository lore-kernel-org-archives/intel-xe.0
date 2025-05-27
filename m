Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C74C5B552
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 16:15:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F98D10E542;
	Tue, 27 May 2025 16:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aas29yTs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91EC10E527
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 16:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748362520; x=1779898520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nV6iq6KCCdSIpDCRnfLK5POmgbSzNJLhgwYLU5k61bw=;
 b=Aas29yTsPgwUXq9b832dUNX82zhxPaLCu5tKAXCcwRyPe0SIvLH1EH7w
 kqc0rYJ6Ov/WUYjj/J9vA2ecm+fAtGC70+jrkswaS8hMn7HcbpZiGWtrM
 1VAlOQW0ae+5dYm4/NoP5HAJ5WRistiOQyPGMGtXSWzcoFrA0W/wTkXhS
 4mmUdRI6YSg8r3K/xL0zwXWviDpHh1kVp4Z+j2sUsmGGA0RNARh01XurH
 jJRGtSsL3aorXHjDygCpnVRlW8TKZzrucSPbkcXlL2FHKNtC9+e2HJc9k
 RfvjOvAC+KrrH3Z3iNAg9WxemSFMazv3B4U9sMxjS5wSt2b9g5lVj/jE2 w==;
X-CSE-ConnectionGUID: L42wTlqESESXSwvkWzga0A==
X-CSE-MsgGUID: USL3ebnnS6as73U72Yi+pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49471898"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="49471898"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 09:14:40 -0700
X-CSE-ConnectionGUID: w1c19R63S9G11KqHGUYRuQ==
X-CSE-MsgGUID: ZsSanr5oRzW41FkOmT28sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="147646122"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa003.jf.intel.com with ESMTP; 27 May 2025 09:14:38 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 12/19] drm/xe/svm : Add svm ranges migration policy on
 atomic access
Date: Tue, 27 May 2025 22:09:56 +0530
Message-Id: <20250527164003.1068118-13-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
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

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c         |  9 +++++--
 drivers/gpu/drm/xe/xe_svm.c        |  4 +++-
 drivers/gpu/drm/xe/xe_vm.c         | 38 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.h         |  2 ++
 drivers/gpu/drm/xe/xe_vm_madvise.c | 10 +++++++-
 5 files changed, 57 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 39bc1964089e..ad17ded0ecaa 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -645,13 +645,18 @@ static bool xe_atomic_for_vram(struct xe_vm *vm)
 	return true;
 }
 
-static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_bo *bo)
+static bool xe_atomic_for_system(struct xe_vm *vm,
+				 struct xe_bo *bo,
+				 struct xe_vma *vma)
 {
 	struct xe_device *xe = vm->xe;
 
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
+		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo, vma) ?
 			XE_USM_PPGTT_PTE_AE : 0;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 5691bb9dbf26..743bb1f7d39c 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -771,6 +771,8 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
 	struct xe_vm *vm = range_to_vm(&range->base);
 	u64 range_size = xe_svm_range_size(range);
 
+	preferred_region_is_vram |=  xe_vma_need_vram_migrate_for_atomic(vm->xe, vma);
+
 	if (!range->base.flags.migrate_devmem || !preferred_region_is_vram)
 		return false;
 
@@ -812,7 +814,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
 		.check_pages_threshold = IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
-		.devmem_only = atomic && IS_DGFX(vm->xe) &&
+		.devmem_only = atomic && xe_vma_need_vram_migrate_for_atomic(vm->xe, vma) &&
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
 		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
 			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8208409485f6..e5fc2c2be8b2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2930,13 +2930,22 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 	ctx.read_only = xe_vma_read_only(vma);
 	ctx.devmem_possible = devmem_possible;
 	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
+	ctx.devmem_only = xe_vma_need_vram_migrate_for_atomic(vm->xe, vma) &&
+			  IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
 
 	/* TODO: Threading the migration */
 	xa_for_each(&op->prefetch_range.range, i, svm_range) {
-		if (!region)
+		bool needs_vram = xe_svm_range_needs_migrate_to_vram(svm_range, vma, region);
+
+		if (!needs_vram) {
 			xe_svm_range_migrate_to_smem(vm, svm_range);
+		} else if (needs_vram) {
+			/* If  migration is mandated by atomic attributes
+			 * in vma and prefetch region is smem force prefetch
+			 * in vram of root tile.
+			 */
+			region = region ? region : 1;
 
-		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
 			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
 			err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
 			if (err) {
@@ -4178,6 +4187,31 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
 	kvfree(snap);
 }
 
+/**
+ * xe_vma_need_vram_migrate_for_atomic - Check if VMA needs VRAM migration for atomic operations
+ * @xe: Pointer to the XE device structure
+ * @vma: Pointer to the virtual memory area (VMA) structure
+ *
+ * This function determines whether the given VMA needs to be migrated to
+ * VRAM in order to do atomic GPU operation.
+ *
+ * Return: true if migration to VRAM is required, false otherwise.
+ */
+bool xe_vma_need_vram_migrate_for_atomic(struct xe_device *xe, struct xe_vma *vma)
+{
+	/* Note: The checks implemented here are platform-specific. For instance,
+	 * on a device supporting CXL atomics, these would ideally work universally
+	 * without additional handling.
+	 */
+	if (!IS_DGFX(xe) || vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_UNDEFINED ||
+	    vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU ||
+	    (xe->info.has_device_atomics_on_smem &&
+	     vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE))
+		return false;
+
+	return true;
+}
+
 /**
  * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
  * @vm: Pointer to the xe_vm structure
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 8151b1b01a13..edd6ffd7c3ac 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -171,6 +171,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 
 struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
 
+bool xe_vma_need_vram_migrate_for_atomic(struct xe_device *xe, struct xe_vma *vma);
+
 int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index f7edefe5f6cf..084719660401 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -69,7 +69,15 @@ static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
 			  struct xe_vma **vmas, int num_vmas,
 			  struct drm_xe_madvise_ops ops)
 {
-	/* Implementation pending */
+	int i;
+
+	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_ATOMIC);
+	xe_assert(vm->xe, ops.atomic.val > DRM_XE_VMA_ATOMIC_UNDEFINED &&
+		  ops.atomic.val <= DRM_XE_VMA_ATOMIC_CPU);
+
+	for (i = 0; i < num_vmas; i++)
+		vmas[i]->attr.atomic_access = ops.atomic.val;
+	/*TODO: handle bo backed vmas */
 	return 0;
 }
 
-- 
2.34.1

