Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3BDC87FC9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 12:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB81910E6A3;
	Wed, 30 Jul 2025 12:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UN/WiviH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD3C10E6A2
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 12:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753878880; x=1785414880;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pS2g94aazAE6xEZa4l4t2utiB05j9Pge//iaEtHBAb0=;
 b=UN/WiviHIxqAgOtwuHS8lQpDddvAvfPQwEwZ5b1w6bFU8P2up9LrnyQ9
 HFe5ZD4bQ+XMw2hF3BvGpaw9587OSrJwDJWEfwAQbReciQMY2oAWSKSGc
 ytaBDo1JCg41lwj7z4QxiJdta0TngCeOMADzRXHK0ll8AGKpI86ODgGlz
 9itKp/3PHBStbgpfwXvwogTLDshvahaw7a338QkK+3mOC1znLwJU7DKaH
 K/vMxi3kezblCrQOw0XxJpyx+aaMmXnrz3MSh6fNYeuvnhZ9MTTpI5LHL
 E4QVqXcu79Fq0zxNWXRPDD4OCBbkod9eISisA031FpJiXikOm2vMpDD9o w==;
X-CSE-ConnectionGUID: y0yGCK2wSDuecJuu159R1A==
X-CSE-MsgGUID: BwRA/aXLTzuXIpI5P7DSFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66450195"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="66450195"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 05:34:40 -0700
X-CSE-ConnectionGUID: YVLT8G8oRR6lq8Rqafd2lw==
X-CSE-MsgGUID: Y/EJL/YJROOGde0S8mez4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="186649523"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa002.fm.intel.com with ESMTP; 30 Jul 2025 05:34:38 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 23/25] drm/xe: Reset VMA attributes to default in SVM
 garbage collector
Date: Wed, 30 Jul 2025 18:30:48 +0530
Message-Id: <20250730130050.1001648-24-himal.prasad.ghimiray@intel.com>
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

Restore default memory attributes for VMAs during garbage collection
if they were modified by madvise. Reuse existing VMA if fully overlapping;
otherwise, allocate a new mirror VMA.

v2 (Matthew Brost)
- Add helper for vma split
- Add retry to get updated vma

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 114 +++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_vm.c  | 155 ++++++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_vm.h  |   2 +
 3 files changed, 206 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index aef76e08b460..9b3a3f61758c 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -253,9 +253,55 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
 	return 0;
 }
 
+static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 range_start, u64 range_end)
+{
+	struct xe_vma *vma;
+	struct xe_vma_mem_attr default_attr = {
+		.preferred_loc = {
+			.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
+			.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
+		},
+		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
+	};
+	int err = 0;
+
+	vma = xe_vm_find_vma_by_addr(vm, range_start);
+	if (!vma)
+		return -EINVAL;
+
+	if (xe_vma_has_default_mem_attrs(vma))
+		return 0;
+
+	vm_dbg(&vm->xe->drm, "Existing VMA start=0x%016llx, vma_end=0x%016llx",
+	       xe_vma_start(vma), xe_vma_end(vma));
+
+	if (xe_vma_start(vma) == range_start && xe_vma_end(vma) == range_end) {
+		default_attr.pat_index = vma->attr.default_pat_index;
+		default_attr.default_pat_index  = vma->attr.default_pat_index;
+		vma->attr = default_attr;
+	} else {
+		vm_dbg(&vm->xe->drm, "Split VMA start=0x%016llx, vma_end=0x%016llx",
+		       range_start, range_end);
+		err = xe_vm_alloc_cpu_addr_mirror_vma(vm, range_start, range_end - range_start);
+		if (err) {
+			drm_warn(&vm->xe->drm, "VMA SPLIT failed: %pe\n", ERR_PTR(err));
+			xe_vm_kill(vm, true);
+			return err;
+		}
+	}
+
+	/*
+	 * On call from xe_svm_handle_pagefault original VMA might be changed
+	 * signal this to lookup for VMA again.
+	 */
+	return -EAGAIN;
+}
+
 static int xe_svm_garbage_collector(struct xe_vm *vm)
 {
 	struct xe_svm_range *range;
+	u64 range_start;
+	u64 range_end;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -271,6 +317,9 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 		if (!range)
 			break;
 
+		range_start = xe_svm_range_start(range);
+		range_end = xe_svm_range_end(range);
+
 		list_del(&range->garbage_collector_link);
 		spin_unlock(&vm->svm.garbage_collector.lock);
 
@@ -283,6 +332,10 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 			return err;
 		}
 
+		err = xe_svm_range_set_default_attr(vm, range_start, range_end);
+		if (err)
+			return err;
+
 		spin_lock(&vm->svm.garbage_collector.lock);
 	}
 	spin_unlock(&vm->svm.garbage_collector.lock);
@@ -793,40 +846,59 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    struct xe_gt *gt, u64 fault_addr,
 			    bool atomic)
 {
-	int need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
-
-	if (need_vram < 0)
-		return need_vram;
-
-	struct drm_gpusvm_ctx ctx = {
-		.read_only = xe_vma_read_only(vma),
-		.devmem_possible = IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
-		.check_pages_threshold = IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K : 0,
-		.devmem_only = need_vram && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
-		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
-			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
-			vm->xe->atomic_svm_timeslice_ms : 0,
-	};
+	struct drm_gpusvm_ctx ctx = { };
+	struct drm_pagemap *dpagemap;
 	struct xe_svm_range *range;
 	struct dma_fence *fence;
-	struct drm_pagemap *dpagemap;
 	struct xe_tile *tile = gt_to_tile(gt);
-	int migrate_try_count = ctx.devmem_only ? 3 : 1;
+	bool vma_updated = false;
+	int need_vram;
+	int migrate_try_count;
 	ktime_t end = 0;
 	int err;
 
-	lockdep_assert_held_write(&vm->lock);
+find_vma:
+	if (vma_updated) {
+		vma = xe_vm_find_vma_by_addr(vm, fault_addr);
+		if (!vma)
+			return -EINVAL;
+	}
+
 	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
+	vma_updated = false;
+
+	need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
+	if (need_vram < 0)
+		return need_vram;
+
+	ctx.read_only = xe_vma_read_only(vma);
+	ctx.devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
+	ctx.check_pages_threshold = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
+				    SZ_64K : 0;
+	ctx.devmem_only = need_vram && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
+	ctx.timeslice_ms = atomic && IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
+			   vm->xe->atomic_svm_timeslice_ms : 0;
 
+	migrate_try_count = ctx.devmem_only ? 3 : 1;
+
+	lockdep_assert_held_write(&vm->lock);
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
 
 retry:
 	/* Always process UNMAPs first so view SVM ranges is current */
 	err = xe_svm_garbage_collector(vm);
-	if (err)
-		return err;
+	if (err) {
+		if (err == -EAGAIN) {
+			/*
+			 * VMA might have changed due to garbage
+			 * collection; retry lookup
+			 */
+			vma_updated = true;
+			goto find_vma;
+		} else {
+			return err;
+		}
+	}
 
 	range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5ee38e9cf6c6..e77c04f92d0b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4263,36 +4263,24 @@ int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool i
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
+static int xe_vm_alloc_vma(struct xe_vm *vm, struct drm_gpuva_op_map *map_req)
 {
-	struct drm_gpuva_op_map map_req = {
-		.va.addr = start,
-		.va.range = range,
-		.flags = DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE,
-	};
-
 	struct xe_vma_ops vops;
 	struct drm_gpuva_ops *ops = NULL;
 	struct drm_gpuva_op *__op;
 	bool is_cpu_addr_mirror = false;
 	bool remap_op = false;
+	bool is_madvise = (map_req->flags & DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE);
 	struct xe_vma_mem_attr tmp_attr;
+	u16 default_pat;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
 
-	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
-	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, &map_req);
+	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx",
+	       map_req->va.addr, map_req->va.range);
+
+	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, map_req);
 	if (IS_ERR(ops))
 		return PTR_ERR(ops);
 
@@ -4303,33 +4291,56 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
 
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
@@ -4341,15 +4352,20 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
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
@@ -4357,7 +4373,8 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
 			 * Therefore temp_attr will always have sane values, making it safe to
 			 * copy them to new vma.
 			 */
-			vma->attr = tmp_attr;
+			if (is_madvise)
+				vma->attr = tmp_attr;
 		}
 	}
 
@@ -4371,3 +4388,53 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
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
+	struct drm_gpuva_op_map map_req = {
+		.va.addr = start,
+		.va.range = range,
+		.flags = DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE,
+	};
+
+	lockdep_assert_held_write(&vm->lock);
+
+	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
+
+	return xe_vm_alloc_vma(vm, &map_req);
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
+	struct drm_gpuva_op_map map_req = {
+		.va.addr = start,
+		.va.range = range,
+	};
+
+	lockdep_assert_held_write(&vm->lock);
+
+	vm_dbg(&vm->xe->drm, "CPU_ADDR_MIRROR_VMA_OPS_CREATE: addr=0x%016llx, size=0x%016llx",
+	       start, range);
+
+	return xe_vm_alloc_vma(vm, &map_req);
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index f735d994806d..6538cddf158b 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -177,6 +177,8 @@ int xe_vma_need_vram_for_atomic(struct xe_device *xe, struct xe_vma *vma, bool i
 
 int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
 
+int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
+
 /**
  * to_userptr_vma() - Return a pointer to an embedding userptr vma
  * @vma: Pointer to the embedded struct xe_vma
-- 
2.34.1

