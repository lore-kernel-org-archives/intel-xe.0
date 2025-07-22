Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A39C87FC5
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 13:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF35E10E69B;
	Tue, 22 Jul 2025 13:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fHhZAxWM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B396810E30C
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Jul 2025 13:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753189758; x=1784725758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QzrSrcvj00bCNf/hljmfwvNVohd9YHK4P+JR1VJ2cFA=;
 b=fHhZAxWM9+TfXAj0l/0NeDEMdV9jFYXzBrPnuV3DWD23c6QwKx6ljem2
 L1kKSlKvb2RiNWeX5L1n/ae2vHgdplM5+N4P40likmTh/9xoBdU1d5x3I
 3sPkHAgQ0+uIsLdHta8aHBZ89Gcic6xybMwvrU38ndd6P77ju9W/ABDxu
 S2sEPmy26YOUIME/buD7Nb12KERwdi/oL7NMto76zHqii/K/i/ToQg08S
 BtPO6uymTTupDHw2FbObKIDwD7TXMhD8WjYVvtQYNVjSboaVIkSs5IZI3
 ekTWdSYMFjDHwAaXxj8vSfgN+5Ntkn0pbK3+dYdHWmUIerRauB4My2bMn g==;
X-CSE-ConnectionGUID: tH4/HD4uQTucbZgsNvg0dQ==
X-CSE-MsgGUID: Br7+rWkkT5+rsUoeB/3B+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55530408"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55530408"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 06:09:18 -0700
X-CSE-ConnectionGUID: j89Yv5MIR1meYDOfPX6VcA==
X-CSE-MsgGUID: tOl3t6NtS0aO/ycrudY/9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163420724"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa005.fm.intel.com with ESMTP; 22 Jul 2025 06:09:16 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 20/23] drm/xe: Reset VMA attributes to default in SVM
 garbage collector
Date: Tue, 22 Jul 2025 19:05:23 +0530
Message-Id: <20250722133526.3550547-21-himal.prasad.ghimiray@intel.com>
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

Restore default memory attributes for VMAs during garbage collection
if they were modified by madvise. Reuse existing VMA if fully overlapping;
otherwise, allocate a new mirror VMA.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c |  34 +++++++++
 drivers/gpu/drm/xe/xe_vm.c  | 140 +++++++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_vm.h  |   2 +
 3 files changed, 135 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index ba1233d0d5a2..79709dc066b9 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -255,7 +255,18 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
 static int xe_svm_garbage_collector(struct xe_vm *vm)
 {
 	struct xe_svm_range *range;
+	struct xe_vma *vma;
+	u64 range_start;
+	u64 range_size;
+	u64 range_end;
 	int err;
+	struct xe_vma_mem_attr default_attr = {
+		.preferred_loc = {
+			.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
+			.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
+		},
+		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
+	};
 
 	lockdep_assert_held_write(&vm->lock);
 
@@ -270,6 +281,12 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 		if (!range)
 			break;
 
+		range_start = xe_svm_range_start(range);
+		range_size = xe_svm_range_size(range);
+		range_end = xe_svm_range_end(range);
+
+		vma = xe_vm_find_vma_by_addr(vm, xe_svm_range_start(range));
+
 		list_del(&range->garbage_collector_link);
 		spin_unlock(&vm->svm.garbage_collector.lock);
 
@@ -282,7 +299,24 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 			return err;
 		}
 
+		if (!xe_vma_has_default_mem_attrs(vma)) {
+			vm_dbg(&vm->xe->drm, "Existing VMA start=0x%016llx, vma_end=0x%016llx",
+			       xe_vma_start(vma), xe_vma_end(vma));
+
+			if (xe_vma_start(vma) == range_start && xe_vma_end(vma) == range_end) {
+				default_attr.pat_index = vma->attr.default_pat_index;
+				default_attr.default_pat_index  = vma->attr.default_pat_index;
+				vma->attr = default_attr;
+			} else {
+				vm_dbg(&vm->xe->drm, "Split VMA start=0x%016llx, vma_end=0x%016llx",
+				       range_start, range_end);
+				err = xe_vm_alloc_cpu_addr_mirror_vma(vm, range_start, range_size);
+				if (err)
+					return err;
+			}
+		}
 		spin_lock(&vm->svm.garbage_collector.lock);
+
 	}
 	spin_unlock(&vm->svm.garbage_collector.lock);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d3f08bf9a3ee..003c8209f8bd 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4254,34 +4254,24 @@ bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool
 	}
 }
 
-/**
- * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
- * @vm: Pointer to the xe_vm structure
- * @start: Starting input address
- * @range: Size of the input range
- *
- * This function splits existing vma to create new vma for user provided input range
- *
- *  Return: 0 if success
- */
-int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
+static int xe_vm_alloc_vma(struct xe_vm *vm,
+			   u64 start, u64 range,
+			   enum drm_gpuvm_sm_map_ops_flags flags)
 {
 	struct xe_vma_ops vops;
 	struct drm_gpuva_ops *ops = NULL;
 	struct drm_gpuva_op *__op;
 	bool is_cpu_addr_mirror = false;
 	bool remap_op = false;
+	bool is_madvise = flags == DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE;
 	struct xe_vma_mem_attr tmp_attr;
+	u16 default_pat;
 	int err;
 
-	vm_dbg(&vm->xe->drm, "MADVISE IN: addr=0x%016llx, size=0x%016llx", start, range);
-
 	lockdep_assert_held_write(&vm->lock);
 
-	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
 	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, start, range,
-					  DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE,
-					  NULL, start);
+					  flags, NULL, start);
 	if (IS_ERR(ops))
 		return PTR_ERR(ops);
 
@@ -4292,33 +4282,56 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
 
 	drm_gpuva_for_each_op(__op, ops) {
 		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
+		struct xe_vma *vma = NULL;
 
-		if (__op->op == DRM_GPUVA_OP_REMAP) {
-			xe_assert(vm->xe, !remap_op);
-			remap_op = true;
+		if (!is_madvise) {
+			if (__op->op == DRM_GPUVA_OP_UNMAP) {
+				vma = gpuva_to_vma(op->base.unmap.va);
+				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
+				default_pat = vma->attr.default_pat_index;
+			}
 
-			if (xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.remap.unmap->va)))
-				is_cpu_addr_mirror = true;
-			else
-				is_cpu_addr_mirror = false;
-		}
+			if (__op->op == DRM_GPUVA_OP_REMAP) {
+				vma = gpuva_to_vma(op->base.remap.unmap->va);
+				default_pat = vma->attr.default_pat_index;
+			}
 
-		if (__op->op == DRM_GPUVA_OP_MAP) {
-			xe_assert(vm->xe, remap_op);
-			remap_op = false;
+			if (__op->op == DRM_GPUVA_OP_MAP) {
+				op->map.is_cpu_addr_mirror = true;
+				op->map.pat_index = default_pat;
+			}
+		} else {
+			if (__op->op == DRM_GPUVA_OP_REMAP) {
+				vma = gpuva_to_vma(op->base.remap.unmap->va);
+				xe_assert(vm->xe, !remap_op);
+				remap_op = true;
 
-			/* In case of madvise ops DRM_GPUVA_OP_MAP is always after
-			 * DRM_GPUVA_OP_REMAP, so ensure we assign op->map.is_cpu_addr_mirror true
-			 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
-			 */
-			op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
-		}
+				if (xe_vma_is_cpu_addr_mirror(vma))
+					is_cpu_addr_mirror = true;
+				else
+					is_cpu_addr_mirror = false;
+			}
 
+			if (__op->op == DRM_GPUVA_OP_MAP) {
+				xe_assert(vm->xe, remap_op);
+				remap_op = false;
+				/*
+				 * In case of madvise ops DRM_GPUVA_OP_MAP is
+				 * always after DRM_GPUVA_OP_REMAP, so ensure
+				 * we assign op->map.is_cpu_addr_mirror true
+				 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
+				 */
+				op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
+			}
+		}
 		print_op(vm->xe, __op);
 	}
 
 	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
-	vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
+
+	if (is_madvise)
+		vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
+
 	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
 	if (err)
 		goto unwind_ops;
@@ -4330,15 +4343,20 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
 		struct xe_vma *vma;
 
 		if (__op->op == DRM_GPUVA_OP_UNMAP) {
-			/* There should be no unmap */
-			XE_WARN_ON("UNEXPECTED UNMAP");
-			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), NULL);
+			vma = gpuva_to_vma(op->base.unmap.va);
+			/* There should be no unmap for madvise */
+			if (is_madvise)
+				XE_WARN_ON("UNEXPECTED UNMAP");
+
+			xe_vma_destroy(vma, NULL);
 		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
 			vma = gpuva_to_vma(op->base.remap.unmap->va);
-			/* Store attributes for REMAP UNMAPPED VMA, so they can be assigned
-			 * to newly MAP created vma.
+			/* In case of madvise ops Store attributes for REMAP UNMAPPED
+			 * VMA, so they can be assigned to newly MAP created vma.
 			 */
-			tmp_attr = vma->attr;
+			if (is_madvise)
+				tmp_attr = vma->attr;
+
 			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
 		} else if (__op->op == DRM_GPUVA_OP_MAP) {
 			vma = op->map.vma;
@@ -4346,7 +4364,8 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
 			 * Therefore temp_attr will always have sane values, making it safe to
 			 * copy them to new vma.
 			 */
-			vma->attr = tmp_attr;
+			if (is_madvise)
+				vma->attr = tmp_attr;
 		}
 	}
 
@@ -4360,3 +4379,42 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
 	drm_gpuva_ops_free(&vm->gpuvm, ops);
 	return err;
 }
+
+/**
+ * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
+ * @vm: Pointer to the xe_vm structure
+ * @start: Starting input address
+ * @range: Size of the input range
+ *
+ * This function splits existing vma to create new vma for user provided input range
+ *
+ * Return: 0 if success
+ */
+int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
+{
+	lockdep_assert_held_write(&vm->lock);
+
+	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
+
+	return xe_vm_alloc_vma(vm, start, range, DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE);
+}
+
+/**
+ * xe_vm_alloc_cpu_addr_mirror_vma - Allocate CPU addr mirror vma
+ * @vm: Pointer to the xe_vm structure
+ * @start: Starting input address
+ * @range: Size of the input range
+ *
+ * This function splits/merges existing vma to create new vma for user provided input range
+ *
+ * Return: 0 if success
+ */
+int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
+{
+	lockdep_assert_held_write(&vm->lock);
+
+	vm_dbg(&vm->xe->drm, "CPU_ADDR_MIRROR_VMA_OPS_CREATE: addr=0x%016llx, size=0x%016llx",
+	       start, range);
+
+	return xe_vm_alloc_vma(vm, start, range, DRM_GPUVM_SM_MAP_NOT_MADVISE);
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index a4db843de540..f7b9ad83685a 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -177,6 +177,8 @@ bool xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool
 
 int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
 
+int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
+
 /**
  * to_userptr_vma() - Return a pointer to an embedding userptr vma
  * @vma: Pointer to the embedded struct xe_vma
-- 
2.34.1

