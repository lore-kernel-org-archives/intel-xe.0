Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A8EC197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 18:20:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CDA10E0FF;
	Mon, 20 Nov 2023 18:20:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8CD10E10C
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 18:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700504419; x=1732040419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PqW/fq+RBSXsf4SOKqEw/pm5xCBu8KgZJ+ZgxGMRRx8=;
 b=ZcspBnNa6KkiGLsvsFXkAq/rX0rQrEpUUYCrgA+0ucDf04DWHDdYucPx
 cwHGNxphd1BywMIHLR7yZdZ1TfvwjPFwr5U92vcarPr1YOaVc1iRAHfjc
 RSs86x8myxNbio9FKQ/AK5dNKeBJlFmW3kG6VCjU3s5NAiiCMwjiYRwqN
 2N37ks/BB3oSYTUfe1BXyIpfs1rxh9p807t6v9+aduTEv3eIhqFxsW68j
 ZzZthlvbG3yFQNI6nn8cfPA5x9hVNWDLTDQfn2OoWLDOAAa7imWxVxMI+
 hca7aL5te3YC7HYANlBHgoGkRWSOUXEEEVcUYym005uOHKE9ZzjhIh3zE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371848879"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="371848879"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 10:20:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="14239281"
Received: from mgrott-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.6.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 10:20:16 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 20 Nov 2023 18:19:54 +0000
Message-ID: <20231120181950.87489-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231120181950.87489-5-matthew.auld@intel.com>
References: <20231120181950.87489-5-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v10 3/3] drm/xe/uapi: support pat_index selection
 with vm_bind
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Zhengguo Xu <zhengguo.xu@intel.com>, Filip Hazubski <filip.hazubski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Carl Zhang <carl.zhang@intel.com>,
 Bartosz Dunajski <bartosz.dunajski@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Allow userspace to directly control the pat_index for a given vm
binding. This should allow directly controlling the coherency, caching
behaviour, compression and potentially other stuff in the future for the
ppGTT binding.

The exact meaning behind the pat_index is very platform specific (see
BSpec or PRMs) but effectively maps to some predefined memory
attributes. From the KMD pov we only care about the coherency that is
provided by the pat_index, which falls into either NONE, 1WAY or 2WAY.
The vm_bind coherency mode for the given pat_index needs to be at least
1way coherent when using cpu_caching with DRM_XE_GEM_CPU_CACHING_WB. For
platforms that lack the explicit coherency mode attribute, we treat
UC/WT/WC as NONE and WB as AT_LEAST_1WAY.

For userptr mappings we lack a corresponding gem object, so the expected
coherency mode is instead implicit and must fall into either 1WAY or
2WAY. Trying to use NONE will be rejected by the kernel. For imported
dma-buf (from a different device) the coherency mode is also implicit
and must also be either 1WAY or 2WAY.

v2:
  - Undefined coh_mode(pat_index) can now be treated as programmer
    error. (Matt Roper)
  - We now allow gem_create.coh_mode <= coh_mode(pat_index), rather than
    having to match exactly. This ensures imported dma-buf can always
    just use 1way (or even 2way), now that we also bundle 1way/2way into
    at_least_1way. We still require 1way/2way for external dma-buf, but
    the policy can now be the same for self-import, if desired.
  - Use u16 for pat_index in uapi. u32 is massive overkill. (José)
  - Move as much of the pat_index validation as we can into
    vm_bind_ioctl_check_args. (José)
v3 (Matt Roper):
  - Split the pte_encode() refactoring into separate patch.
v4:
  - Rebase
v5:
  - Check for and reject !coh_mode which would indicate hw reserved
    pat_index on xe2.
v6:
  - Rebase on removal of coh_mode from uapi. We just need to reject
    cpu_caching=wb + pat_index with coh_none.

Testcase: igt@xe_pat
Bspec: 45101, 44235 #xe
Bspec: 70552, 71582, 59400 #xe2
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Filip Hazubski <filip.hazubski@intel.com>
Cc: Carl Zhang <carl.zhang@intel.com>
Cc: Effie Yu <effie.yu@intel.com>
Cc: Zhengguo Xu <zhengguo.xu@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Tested-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
Acked-by: Zhengguo Xu <zhengguo.xu@intel.com>
Acked-by: Bartosz Dunajski <bartosz.dunajski@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       | 11 +-----
 drivers/gpu/drm/xe/xe_vm.c       | 68 ++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_vm_types.h |  7 ++++
 include/uapi/drm/xe_drm.h        | 42 +++++++++++++++++++-
 4 files changed, 110 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 31afab617b4e..a0f31f991f34 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -290,8 +290,6 @@ struct xe_pt_stage_bind_walk {
 	struct xe_vm *vm;
 	/** @tile: The tile we're building for. */
 	struct xe_tile *tile;
-	/** @cache: Desired cache level for the ptes */
-	enum xe_cache_level cache;
 	/** @default_pte: PTE flag only template. No address is associated */
 	u64 default_pte;
 	/** @dma_offset: DMA offset to add to the PTE. */
@@ -511,7 +509,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 {
 	struct xe_pt_stage_bind_walk *xe_walk =
 		container_of(walk, typeof(*xe_walk), base);
-	u16 pat_index = tile_to_xe(xe_walk->tile)->pat.idx[xe_walk->cache];
+	u16 pat_index = xe_walk->vma->pat_index;
 	struct xe_pt *xe_parent = container_of(parent, typeof(*xe_parent), base);
 	struct xe_vm *vm = xe_walk->vm;
 	struct xe_pt *xe_child;
@@ -657,13 +655,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 	if (is_devmem) {
 		xe_walk.default_pte |= XE_PPGTT_PTE_DM;
 		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
-		xe_walk.cache = XE_CACHE_WB;
-	} else {
-		if (!xe_vma_has_no_bo(vma) && bo->flags & XE_BO_SCANOUT_BIT)
-			xe_walk.cache = XE_CACHE_WT;
-		else
-			xe_walk.cache = XE_CACHE_WB;
 	}
+
 	if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
 		xe_walk.dma_offset = xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f8559ebad9bc..d23018a5c0d0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -6,6 +6,7 @@
 #include "xe_vm.h"
 
 #include <linux/dma-fence-array.h>
+#include <linux/nospec.h>
 
 #include <drm/drm_exec.h>
 #include <drm/drm_print.h>
@@ -26,6 +27,7 @@
 #include "xe_gt_pagefault.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
+#include "xe_pat.h"
 #include "xe_pm.h"
 #include "xe_preempt_fence.h"
 #include "xe_pt.h"
@@ -864,7 +866,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    u64 start, u64 end,
 				    bool read_only,
 				    bool is_null,
-				    u8 tile_mask)
+				    u8 tile_mask,
+				    u16 pat_index)
 {
 	struct xe_vma *vma;
 	struct xe_tile *tile;
@@ -906,6 +909,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	if (GRAPHICS_VER(vm->xe) >= 20 || vm->xe->info.platform == XE_PVC)
 		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
 
+	vma->pat_index = pat_index;
+
 	if (bo) {
 		xe_bo_assert_held(bo);
 
@@ -2168,7 +2173,7 @@ static struct drm_gpuva_ops *
 vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			 u64 bo_offset_or_userptr, u64 addr, u64 range,
 			 u32 operation, u32 flags, u8 tile_mask,
-			 u32 prefetch_region)
+			 u32 prefetch_region, u16 pat_index)
 {
 	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
 	struct drm_gpuva_ops *ops;
@@ -2195,6 +2200,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 
 			op->tile_mask = tile_mask;
+			op->pat_index = pat_index;
 			op->map.immediate =
 				flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE;
 			op->map.read_only =
@@ -2223,6 +2229,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 
 			op->tile_mask = tile_mask;
 			op->prefetch.region = prefetch_region;
+			op->pat_index = pat_index;
 		}
 		break;
 	case DRM_XE_VM_BIND_OP_UNMAP_ALL:
@@ -2264,7 +2271,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 }
 
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
-			      u8 tile_mask, bool read_only, bool is_null)
+			      u8 tile_mask, bool read_only, bool is_null,
+			      u16 pat_index)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct xe_vma *vma;
@@ -2280,7 +2288,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	vma = xe_vma_create(vm, bo, op->gem.offset,
 			    op->va.addr, op->va.addr +
 			    op->va.range - 1, read_only, is_null,
-			    tile_mask);
+			    tile_mask, pat_index);
 	if (bo)
 		xe_bo_unlock(bo);
 
@@ -2426,7 +2434,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 
 			vma = new_vma(vm, &op->base.map,
 				      op->tile_mask, op->map.read_only,
-				      op->map.is_null);
+				      op->map.is_null, op->pat_index);
 			if (IS_ERR(vma))
 				return PTR_ERR(vma);
 
@@ -2452,7 +2460,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 
 				vma = new_vma(vm, op->base.remap.prev,
 					      op->tile_mask, read_only,
-					      is_null);
+					      is_null, op->pat_index);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
@@ -2486,7 +2494,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 
 				vma = new_vma(vm, op->base.remap.next,
 					      op->tile_mask, read_only,
-					      is_null);
+					      is_null, op->pat_index);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
 
@@ -2884,6 +2892,26 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u64 obj_offset = (*bind_ops)[i].obj_offset;
 		u32 prefetch_region = (*bind_ops)[i].prefetch_mem_region_instance;
 		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
+		u16 pat_index = (*bind_ops)[i].pat_index;
+		u16 coh_mode;
+
+		if (XE_IOCTL_DBG(xe, pat_index >= xe->pat.n_entries)) {
+			err = -EINVAL;
+			goto free_bind_ops;
+		}
+
+		pat_index = array_index_nospec(pat_index, xe->pat.n_entries);
+		(*bind_ops)[i].pat_index = pat_index;
+		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
+		if (XE_IOCTL_DBG(xe, !coh_mode)) { /* hw reserved */
+			err = -EINVAL;
+			goto free_bind_ops;
+		}
+
+		if (XE_WARN_ON(coh_mode > XE_COH_AT_LEAST_1WAY)) {
+			err = -EINVAL;
+			goto free_bind_ops;
+		}
 
 		if (i == 0) {
 			*async = !!(flags & DRM_XE_VM_BIND_FLAG_ASYNC);
@@ -2914,6 +2942,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 				 op == DRM_XE_VM_BIND_OP_UNMAP_ALL) ||
 		    XE_IOCTL_DBG(xe, obj &&
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
+		    XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
+				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, obj &&
 				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, prefetch_region &&
@@ -3047,6 +3077,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 addr = bind_ops[i].addr;
 		u32 obj = bind_ops[i].obj;
 		u64 obj_offset = bind_ops[i].obj_offset;
+		u16 pat_index = bind_ops[i].pat_index;
+		u16 coh_mode;
 
 		if (!obj)
 			continue;
@@ -3074,6 +3106,24 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 				goto put_obj;
 			}
 		}
+
+		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
+		if (bos[i]->cpu_caching) {
+			if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
+					 bos[i]->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB)) {
+				err = -EINVAL;
+				goto put_obj;
+			}
+		} else if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE)) {
+			/*
+			 * Imported dma-buf from a different device should
+			 * require 1way or 2way coherency since we don't know
+			 * how it was mapped on the CPU. Just assume is it
+			 * potentially cached on CPU side.
+			 */
+			err = -EINVAL;
+			goto put_obj;
+		}
 	}
 
 	if (args->num_syncs) {
@@ -3101,10 +3151,12 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 obj_offset = bind_ops[i].obj_offset;
 		u8 tile_mask = bind_ops[i].tile_mask;
 		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
+		u16 pat_index = bind_ops[i].pat_index;
 
 		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
 						  addr, range, op, flags,
-						  tile_mask, prefetch_region);
+						  tile_mask, prefetch_region,
+						  pat_index);
 		if (IS_ERR(ops[i])) {
 			err = PTR_ERR(ops[i]);
 			ops[i] = NULL;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index aaf0c7101019..9ca84e1783ed 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -110,6 +110,11 @@ struct xe_vma {
 	 */
 	u8 tile_present;
 
+	/**
+	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
+	 */
+	u16 pat_index;
+
 	struct {
 		struct list_head rebind_link;
 	} notifier;
@@ -402,6 +407,8 @@ struct xe_vma_op {
 	struct list_head link;
 	/** @tile_mask: gt mask for this operation */
 	u8 tile_mask;
+	/** @pat_index: The pat index to use for this operation. */
+	u16 pat_index;
 	/** @flags: operation flags */
 	enum xe_vma_op_flags flags;
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index ab7d1b26c773..58e655981992 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -636,8 +636,48 @@ struct drm_xe_vm_bind_op {
 	 */
 	__u32 obj;
 
+	/**
+	 * @pat_index: The platform defined @pat_index to use for this mapping.
+	 * The index basically maps to some predefined memory attributes,
+	 * including things like caching, coherency, compression etc.  The exact
+	 * meaning of the pat_index is platform specific and defined in the
+	 * Bspec and PRMs.  When the KMD sets up the binding the index here is
+	 * encoded into the ppGTT PTE.
+	 *
+	 * For coherency the @pat_index needs to be at least 1way coherent when
+	 * drm_xe_gem_create.cpu_caching is DRM_XE_GEM_CPU_CACHING_WB. The KMD
+	 * will extract the coherency mode from the @pat_index and reject if
+	 * there is a mismatch (see note below for pre-MTL platforms).
+	 *
+	 * Note: On pre-MTL platforms there is only a caching mode and no
+	 * explicit coherency mode, but on such hardware there is always a
+	 * shared-LLC (or is dgpu) so all GT memory accesses are coherent with
+	 * CPU caches even with the caching mode set as uncached.  It's only the
+	 * display engine that is incoherent (on dgpu it must be in VRAM which
+	 * is always mapped as WC on the CPU). However to keep the uapi somewhat
+	 * consistent with newer platforms the KMD groups the different cache
+	 * levels into the following coherency buckets on all pre-MTL platforms:
+	 *
+	 *	ppGTT UC -> COH_NONE
+	 *	ppGTT WC -> COH_NONE
+	 *	ppGTT WT -> COH_NONE
+	 *	ppGTT WB -> COH_AT_LEAST_1WAY
+	 *
+	 * In practice UC/WC/WT should only ever used for scanout surfaces on
+	 * such platforms (or perhaps in general for dma-buf if shared with
+	 * another device) since it is only the display engine that is actually
+	 * incoherent.  Everything else should typically use WB given that we
+	 * have a shared-LLC.  On MTL+ this completely changes and the HW
+	 * defines the coherency mode as part of the @pat_index, where
+	 * incoherent GT access is possible.
+	 *
+	 * Note: For userptr and externally imported dma-buf the kernel expects
+	 * either 1WAY or 2WAY for the @pat_index.
+	 */
+	__u16 pat_index;
+
 	/** @pad: MBZ */
-	__u32 pad;
+	__u16 pad;
 
 	union {
 		/**
-- 
2.42.0

