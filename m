Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D830ACAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 11:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC5C10E04F;
	Wed,  8 Oct 2025 11:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLoPJRBG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380A710E04F
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 11:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759922558; x=1791458558;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d3364Jwf311+4O0Vz0T/9zwIa0+7F4ojhhiVBrfvmLI=;
 b=bLoPJRBGFQvTaExon1A0gBELl6ZObKtbYg5KSUtD0C2RmJlglxc87PFu
 xFrmd2riyfHeDC+0q5PqXwKtTEZo0nFGtXZeWBC6VG0X/uRm8jz8LHRB5
 wLuV1Vmy57MyhRqcsWe805FXb6+FI17Yd2QVuS5+bGFyyCrxOf88SSFw1
 fnF9mrtwN+CGgzMDj36m18GDTSmkrPkJd8MGUSqwik9PJqlrOL0veI8MQ
 l6Rr6OZQ+r6V3zSalbp3B5rluavvfKYenNkS5Prm0ehFVniLd6PV6L4cz
 DqIGbaztldUd1AAf/6nsYouR4vZbLIsC8WyVj+DBFN0z3odZuVt3roSxu A==;
X-CSE-ConnectionGUID: 5hgYBoF/Q5m/1S64BGGRtQ==
X-CSE-MsgGUID: gUIrq/EtRNSBKmNhBd3Jdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="65965492"
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="65965492"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 04:22:37 -0700
X-CSE-ConnectionGUID: 0g7Q7Eo4RviG48syCfjWWA==
X-CSE-MsgGUID: XEigQSjOQk6itNDEhDGLnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="180082310"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.126])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 04:22:36 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Falkowski, John" <john.falkowski@intel.com>,
 "Mrozek, Michal" <michal.mrozek@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: [PATCH] Revert "drm/xe: Reset VMA attributes to default in SVM
 garbage collector"
Date: Wed,  8 Oct 2025 13:22:16 +0200
Message-ID: <20251008112216.293641-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

This reverts commit a2eb8aec3ebe474ce0fe0b6ebb18aade8c1a5c00.

The GPU madvise reset would happen if a CPU vma at the same address
gets removed. (And possibly for a slightly wider region).

It might be desirable for an app to associate and madvise with an
object in memory and thus compelling to reset the madvise when the
object goes away. However, this has some serious drawbacks.

*) It would not work for free()s that don't change the process memory map.
   Nor for stack variables. The application may not be able to
   differentiate and perceive the madvise() reset as erratic and
   unreliable.
*) If an error occurs during madvise() reset we would currently ban the vm.
   In principle we could just skip the madvise reset but that would make
   the feature completely unreliable.
*) The current implementation is racy. Since it's done from a kernel
   thread, in theory it could overwrite a new madvise that was set by the
   user from a newly mapped region.

Fundamentally a GPU madvise is tied to a GPU vma, and changing the GPU vmas
implicitly without a VM_BIND or MADVISE ioctl should be avoided if at all
possible.

Since this is implicit UAPI and unreliable at best, revert it.
Requiring the UMD APIs to reset any madvise explicitly for predictable
behaviour would probably lead to far less bugs in this area.

Cc: "Falkowski, John" <john.falkowski@intel.com>
Cc: "Mrozek, Michal" <michal.mrozek@intel.com>
Cc: "Brost, Matthew" <matthew.brost@intel.com>
Cc: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c |  80 ++----------------
 drivers/gpu/drm/xe/xe_vm.c  | 156 ++++++++++--------------------------
 drivers/gpu/drm/xe/xe_vm.h  |   2 -
 3 files changed, 48 insertions(+), 190 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index fd906eb03d71..94a40d9d40c0 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -286,56 +286,10 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
 	return 0;
 }
 
-static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 range_start, u64 range_end)
-{
-	struct xe_vma *vma;
-	struct xe_vma_mem_attr default_attr = {
-		.preferred_loc = {
-			.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
-			.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
-		},
-		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
-	};
-	int err = 0;
-
-	vma = xe_vm_find_vma_by_addr(vm, range_start);
-	if (!vma)
-		return -EINVAL;
-
-	if (xe_vma_has_default_mem_attrs(vma))
-		return 0;
-
-	vm_dbg(&vm->xe->drm, "Existing VMA start=0x%016llx, vma_end=0x%016llx",
-	       xe_vma_start(vma), xe_vma_end(vma));
-
-	if (xe_vma_start(vma) == range_start && xe_vma_end(vma) == range_end) {
-		default_attr.pat_index = vma->attr.default_pat_index;
-		default_attr.default_pat_index  = vma->attr.default_pat_index;
-		vma->attr = default_attr;
-	} else {
-		vm_dbg(&vm->xe->drm, "Split VMA start=0x%016llx, vma_end=0x%016llx",
-		       range_start, range_end);
-		err = xe_vm_alloc_cpu_addr_mirror_vma(vm, range_start, range_end - range_start);
-		if (err) {
-			drm_warn(&vm->xe->drm, "VMA SPLIT failed: %pe\n", ERR_PTR(err));
-			xe_vm_kill(vm, true);
-			return err;
-		}
-	}
-
-	/*
-	 * On call from xe_svm_handle_pagefault original VMA might be changed
-	 * signal this to lookup for VMA again.
-	 */
-	return -EAGAIN;
-}
-
 static int xe_svm_garbage_collector(struct xe_vm *vm)
 {
 	struct xe_svm_range *range;
-	u64 range_start;
-	u64 range_end;
-	int err, ret = 0;
+	int err;
 
 	lockdep_assert_held_write(&vm->lock);
 
@@ -350,9 +304,6 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 		if (!range)
 			break;
 
-		range_start = xe_svm_range_start(range);
-		range_end = xe_svm_range_end(range);
-
 		list_del(&range->garbage_collector_link);
 		spin_unlock(&vm->svm.garbage_collector.lock);
 
@@ -364,18 +315,10 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 			xe_vm_kill(vm, true);
 			return err;
 		}
-
-		err = xe_svm_range_set_default_attr(vm, range_start, range_end);
-		if (err) {
-			if (err == -EAGAIN)
-				ret = -EAGAIN;
-			else
-				return err;
-		}
 	}
 	spin_unlock(&vm->svm.garbage_collector.lock);
 
-	return ret;
+	return 0;
 }
 
 static void xe_svm_garbage_collector_work_func(struct work_struct *w)
@@ -1167,26 +1110,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    struct xe_gt *gt, u64 fault_addr,
 			    bool atomic)
 {
-	int need_vram, ret;
-retry:
+	int need_vram;
+
 	need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
 	if (need_vram < 0)
 		return need_vram;
 
-	ret =  __xe_svm_handle_pagefault(vm, vma, gt, fault_addr,
-					 need_vram ? true : false);
-	if (ret == -EAGAIN) {
-		/*
-		 * Retry once on -EAGAIN to re-lookup the VMA, as the original VMA
-		 * may have been split by xe_svm_range_set_default_attr.
-		 */
-		vma = xe_vm_find_vma_by_addr(vm, fault_addr);
-		if (!vma)
-			return -EINVAL;
-
-		goto retry;
-	}
-	return ret;
+	return __xe_svm_handle_pagefault(vm, vma, gt, fault_addr, need_vram ? true : false);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 4e914928e0a9..8ca13b1787c4 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4193,26 +4193,35 @@ int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool i
 	}
 }
 
-static int xe_vm_alloc_vma(struct xe_vm *vm,
-			   struct drm_gpuvm_map_req *map_req,
-			   bool is_madvise)
+/**
+ * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
+ * @vm: Pointer to the xe_vm structure
+ * @start: Starting input address
+ * @range: Size of the input range
+ *
+ * This function splits existing vma to create new vma for user provided input range
+ *
+ *  Return: 0 if success
+ */
+int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
 {
+	struct drm_gpuvm_map_req map_req = {
+		.map.va.addr = start,
+		.map.va.range = range,
+	};
+
 	struct xe_vma_ops vops;
 	struct drm_gpuva_ops *ops = NULL;
 	struct drm_gpuva_op *__op;
 	bool is_cpu_addr_mirror = false;
 	bool remap_op = false;
 	struct xe_vma_mem_attr tmp_attr;
-	u16 default_pat;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
 
-	if (is_madvise)
-		ops = drm_gpuvm_madvise_ops_create(&vm->gpuvm, map_req);
-	else
-		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, map_req);
-
+	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
+	ops = drm_gpuvm_madvise_ops_create(&vm->gpuvm, &map_req);
 	if (IS_ERR(ops))
 		return PTR_ERR(ops);
 
@@ -4223,57 +4232,33 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 
 	drm_gpuva_for_each_op(__op, ops) {
 		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
-		struct xe_vma *vma = NULL;
 
-		if (!is_madvise) {
-			if (__op->op == DRM_GPUVA_OP_UNMAP) {
-				vma = gpuva_to_vma(op->base.unmap.va);
-				XE_WARN_ON(!xe_vma_has_default_mem_attrs(vma));
-				default_pat = vma->attr.default_pat_index;
-			}
+		if (__op->op == DRM_GPUVA_OP_REMAP) {
+			xe_assert(vm->xe, !remap_op);
+			remap_op = true;
 
-			if (__op->op == DRM_GPUVA_OP_REMAP) {
-				vma = gpuva_to_vma(op->base.remap.unmap->va);
-				default_pat = vma->attr.default_pat_index;
-			}
+			if (xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.remap.unmap->va)))
+				is_cpu_addr_mirror = true;
+			else
+				is_cpu_addr_mirror = false;
+		}
 
-			if (__op->op == DRM_GPUVA_OP_MAP) {
-				op->map.is_cpu_addr_mirror = true;
-				op->map.pat_index = default_pat;
-			}
-		} else {
-			if (__op->op == DRM_GPUVA_OP_REMAP) {
-				vma = gpuva_to_vma(op->base.remap.unmap->va);
-				xe_assert(vm->xe, !remap_op);
-				xe_assert(vm->xe, xe_vma_has_no_bo(vma));
-				remap_op = true;
-
-				if (xe_vma_is_cpu_addr_mirror(vma))
-					is_cpu_addr_mirror = true;
-				else
-					is_cpu_addr_mirror = false;
-			}
+		if (__op->op == DRM_GPUVA_OP_MAP) {
+			xe_assert(vm->xe, remap_op);
+			remap_op = false;
 
-			if (__op->op == DRM_GPUVA_OP_MAP) {
-				xe_assert(vm->xe, remap_op);
-				remap_op = false;
-				/*
-				 * In case of madvise ops DRM_GPUVA_OP_MAP is
-				 * always after DRM_GPUVA_OP_REMAP, so ensure
-				 * we assign op->map.is_cpu_addr_mirror true
-				 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
-				 */
-				op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
-			}
+			/* In case of madvise ops DRM_GPUVA_OP_MAP is always after
+			 * DRM_GPUVA_OP_REMAP, so ensure we assign op->map.is_cpu_addr_mirror true
+			 * if REMAP is for xe_vma_is_cpu_addr_mirror vma
+			 */
+			op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
 		}
+
 		print_op(vm->xe, __op);
 	}
 
 	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
-
-	if (is_madvise)
-		vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
-
+	vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
 	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
 	if (err)
 		goto unwind_ops;
@@ -4285,20 +4270,15 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 		struct xe_vma *vma;
 
 		if (__op->op == DRM_GPUVA_OP_UNMAP) {
-			vma = gpuva_to_vma(op->base.unmap.va);
-			/* There should be no unmap for madvise */
-			if (is_madvise)
-				XE_WARN_ON("UNEXPECTED UNMAP");
-
-			xe_vma_destroy(vma, NULL);
+			/* There should be no unmap */
+			XE_WARN_ON("UNEXPECTED UNMAP");
+			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), NULL);
 		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
 			vma = gpuva_to_vma(op->base.remap.unmap->va);
-			/* In case of madvise ops Store attributes for REMAP UNMAPPED
-			 * VMA, so they can be assigned to newly MAP created vma.
+			/* Store attributes for REMAP UNMAPPED VMA, so they can be assigned
+			 * to newly MAP created vma.
 			 */
-			if (is_madvise)
-				tmp_attr = vma->attr;
-
+			tmp_attr = vma->attr;
 			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
 		} else if (__op->op == DRM_GPUVA_OP_MAP) {
 			vma = op->map.vma;
@@ -4306,8 +4286,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 			 * Therefore temp_attr will always have sane values, making it safe to
 			 * copy them to new vma.
 			 */
-			if (is_madvise)
-				vma->attr = tmp_attr;
+			vma->attr = tmp_attr;
 		}
 	}
 
@@ -4321,52 +4300,3 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 	drm_gpuva_ops_free(&vm->gpuvm, ops);
 	return err;
 }
-
-/**
- * xe_vm_alloc_madvise_vma - Allocate VMA's with madvise ops
- * @vm: Pointer to the xe_vm structure
- * @start: Starting input address
- * @range: Size of the input range
- *
- * This function splits existing vma to create new vma for user provided input range
- *
- * Return: 0 if success
- */
-int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
-{
-	struct drm_gpuvm_map_req map_req = {
-		.map.va.addr = start,
-		.map.va.range = range,
-	};
-
-	lockdep_assert_held_write(&vm->lock);
-
-	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
-
-	return xe_vm_alloc_vma(vm, &map_req, true);
-}
-
-/**
- * xe_vm_alloc_cpu_addr_mirror_vma - Allocate CPU addr mirror vma
- * @vm: Pointer to the xe_vm structure
- * @start: Starting input address
- * @range: Size of the input range
- *
- * This function splits/merges existing vma to create new vma for user provided input range
- *
- * Return: 0 if success
- */
-int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
-{
-	struct drm_gpuvm_map_req map_req = {
-		.map.va.addr = start,
-		.map.va.range = range,
-	};
-
-	lockdep_assert_held_write(&vm->lock);
-
-	vm_dbg(&vm->xe->drm, "CPU_ADDR_MIRROR_VMA_OPS_CREATE: addr=0x%016llx, size=0x%016llx",
-	       start, range);
-
-	return xe_vm_alloc_vma(vm, &map_req, false);
-}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index ef8a5019574e..b2e337468808 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -177,8 +177,6 @@ int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool i
 
 int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
 
-int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
-
 /**
  * to_userptr_vma() - Return a pointer to an embedding userptr vma
  * @vma: Pointer to the embedded struct xe_vma
-- 
2.51.0

