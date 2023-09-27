Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3310FE810CD
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 11:00:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0727A10E4E1;
	Wed, 27 Sep 2023 11:00:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC31F10E4E0
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 11:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695812433; x=1727348433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NI2FHiF+l5a8BULLFsxFRk+L3mp7L7iels1pE9zjrRs=;
 b=O+MoN1oLvvOCwlS4HWcbhI3fWtpbLTkaR/iPq98sTsVxcJ9JrmIBPb4x
 ZYrbXwlSubmUR0mLk/XV21CLPY15CMUzgVZS6yfqQir3yYBfgWoer/LEO
 ses9MgI2XLeUg4I8c8jRrtGF5JJy0wIesWQMxaf5Bap/DiZVQtGtqZ1fE
 joojUY+05Fs9JeoNppJUc4EtCM5nrkIyVyQIfoHfyByQwICr4LwsgwoeI
 r34e7CkkmixMyyoMP4TczrrNmi2BHnOopW5MfizXxYj6kB7nwnmg+m848
 ZuGxe1P5PBhvfTW3aoz/C3Z919eyLSPtpQg7qDx4kYHeGMrby8x2EpMpf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="372139557"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="372139557"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 04:00:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="1080109590"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="1080109590"
Received: from wangyuan-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.12.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 04:00:30 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 12:00:11 +0100
Message-ID: <20230927110005.291917-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230927110005.291917-7-matthew.auld@intel.com>
References: <20230927110005.291917-7-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 5/5] drm/xe/uapi: support pat_index selection
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
Cc: Filip Hazubski <filip.hazubski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Carl Zhang <carl.zhang@intel.com>,
 Effie Yu <effie.yu@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Allow userspace to directly control the pat_index for a given vm
binding. This should allow directly controlling the coherency, caching
and potentially other stuff in the future for the ppGTT binding.

The exact meaning behind the pat_index is very platform specific (see
BSpec or PRMs) but effectively maps to some predefined memory
attributes. From the KMD pov we only care about the coherency that is
provided by the pat_index, which falls into either NONE, 1WAY or 2WAY.
The vm_bind coherency mode for the given pat_index needs to be at least
as coherent as the coh_mode that was set at object creation. For
platforms that lack the explicit coherency mode, we treat UC/WT/WC as
NONE and WB as AT_LEAST_1WAY.

For userptr mappings we lack a corresponding gem object, so the expected
coherency mode is instead implicit and must fall into either 1WAY or
2WAY. Trying to use NONE will be rejected by the kernel. For imported
dma-buf (from a different device) the coherency mode is also implicit
and must also be either 1WAY or 2WAY i.e AT_LEAST_1WAY.

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
---
 drivers/gpu/drm/xe/xe_pt.c       | 11 ++----
 drivers/gpu/drm/xe/xe_vm.c       | 61 +++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_vm_types.h |  7 ++++
 include/uapi/drm/xe_drm.h        | 43 +++++++++++++++++++++-
 4 files changed, 104 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 92b512641b4a..f9f9010dca10 100644
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
@@ -654,13 +652,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
 			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
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
index 962bfd2b0179..d9f43ad05969 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -6,6 +6,7 @@
 #include "xe_vm.h"
 
 #include <linux/dma-fence-array.h>
+#include <linux/nospec.h>
 
 #include <drm/drm_exec.h>
 #include <drm/drm_print.h>
@@ -25,6 +26,7 @@
 #include "xe_gt_pagefault.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
+#include "xe_pat.h"
 #include "xe_pm.h"
 #include "xe_preempt_fence.h"
 #include "xe_pt.h"
@@ -858,7 +860,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    u64 start, u64 end,
 				    bool read_only,
 				    bool is_null,
-				    u8 tile_mask)
+				    u8 tile_mask,
+				    u16 pat_index)
 {
 	struct xe_vma *vma;
 	struct xe_tile *tile;
@@ -897,6 +900,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 			vma->tile_mask |= 0x1 << id;
 	}
 
+	vma->pat_index = pat_index;
+
 	if (vm->xe->info.platform == XE_PVC)
 		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
 
@@ -2389,7 +2394,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 static struct drm_gpuva_ops *
 vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			 u64 bo_offset_or_userptr, u64 addr, u64 range,
-			 u32 operation, u8 tile_mask, u32 region)
+			 u32 operation, u8 tile_mask, u32 region, u16 pat_index)
 {
 	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
 	struct drm_gpuva_ops *ops;
@@ -2416,6 +2421,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 
 			op->tile_mask = tile_mask;
+			op->pat_index = pat_index;
 			op->map.immediate =
 				operation & XE_VM_BIND_FLAG_IMMEDIATE;
 			op->map.read_only =
@@ -2443,6 +2449,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 
 			op->tile_mask = tile_mask;
+			op->pat_index = pat_index;
 			op->prefetch.region = region;
 		}
 		break;
@@ -2485,7 +2492,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 }
 
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
-			      u8 tile_mask, bool read_only, bool is_null)
+			      u8 tile_mask, bool read_only, bool is_null,
+			      u16 pat_index)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct xe_vma *vma;
@@ -2501,7 +2509,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	vma = xe_vma_create(vm, bo, op->gem.offset,
 			    op->va.addr, op->va.addr +
 			    op->va.range - 1, read_only, is_null,
-			    tile_mask);
+			    tile_mask, pat_index);
 	if (bo)
 		xe_bo_unlock(bo);
 
@@ -2658,7 +2666,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 
 			vma = new_vma(vm, &op->base.map,
 				      op->tile_mask, op->map.read_only,
-				      op->map.is_null);
+				      op->map.is_null, op->pat_index);
 			if (IS_ERR(vma)) {
 				err = PTR_ERR(vma);
 				goto free_fence;
@@ -2686,7 +2694,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 
 				vma = new_vma(vm, op->base.remap.prev,
 					      op->tile_mask, read_only,
-					      is_null);
+					      is_null, op->pat_index);
 				if (IS_ERR(vma)) {
 					err = PTR_ERR(vma);
 					goto free_fence;
@@ -2722,7 +2730,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 
 				vma = new_vma(vm, op->base.remap.next,
 					      op->tile_mask, read_only,
-					      is_null);
+					      is_null, op->pat_index);
 				if (IS_ERR(vma)) {
 					err = PTR_ERR(vma);
 					goto free_fence;
@@ -3235,7 +3243,22 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u32 obj = (*bind_ops)[i].obj;
 		u64 obj_offset = (*bind_ops)[i].obj_offset;
 		u32 region = (*bind_ops)[i].region;
+		u16 pat_index = (*bind_ops)[i].pat_index;
 		bool is_null = op & XE_VM_BIND_FLAG_NULL;
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
+		if (XE_WARN_ON(!coh_mode || coh_mode > XE_GEM_COH_AT_LEAST_1WAY)) {
+			err = -EINVAL;
+			goto free_bind_ops;
+		}
 
 		if (i == 0) {
 			*async = !!(op & XE_VM_BIND_FLAG_ASYNC);
@@ -3277,6 +3300,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL) ||
 		    XE_IOCTL_DBG(xe, obj &&
 				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP_USERPTR) ||
+		    XE_IOCTL_DBG(xe, coh_mode == XE_GEM_COH_NONE &&
+				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, obj &&
 				 VM_BIND_OP(op) == XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, region &&
@@ -3425,6 +3450,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 addr = bind_ops[i].addr;
 		u32 obj = bind_ops[i].obj;
 		u64 obj_offset = bind_ops[i].obj_offset;
+		u16 pat_index = bind_ops[i].pat_index;
+		u16 coh_mode;
 
 		if (!obj)
 			continue;
@@ -3452,6 +3479,23 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 				goto put_obj;
 			}
 		}
+
+		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
+		if (bos[i]->coh_mode) {
+			if (XE_IOCTL_DBG(xe, coh_mode < bos[i]->coh_mode)) {
+				err = -EINVAL;
+				goto put_obj;
+			}
+		} else if (XE_IOCTL_DBG(xe, coh_mode == XE_GEM_COH_NONE)) {
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
@@ -3489,10 +3533,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 obj_offset = bind_ops[i].obj_offset;
 		u8 tile_mask = bind_ops[i].tile_mask;
 		u32 region = bind_ops[i].region;
+		u16 pat_index = bind_ops[i].pat_index;
 
 		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
 						  addr, range, op, tile_mask,
-						  region);
+						  region, pat_index);
 		if (IS_ERR(ops[i])) {
 			err = PTR_ERR(ops[i]);
 			ops[i] = NULL;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 1c5553b842d7..692e1cecb64f 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -111,6 +111,11 @@ struct xe_vma {
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
@@ -418,6 +423,8 @@ struct xe_vma_op {
 	struct async_op_fence *fence;
 	/** @tile_mask: gt mask for this operation */
 	u8 tile_mask;
+	/** @pat_index: The pat index to use for this operation. */
+	u16 pat_index;
 	/** @flags: operation flags */
 	enum xe_vma_op_flags flags;
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 260417b60c41..61012b194f74 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -598,8 +598,49 @@ struct drm_xe_vm_bind_op {
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
+	 * For coherency the @pat_index needs to be least as coherent as
+	 * drm_xe_gem_create.coh_mode. i.e coh_mode(pat_index) >=
+	 * drm_xe_gem_create.coh_mode. The KMD will extract the coherency mode
+	 * from the @pat_index and reject if there is a mismatch (see note below
+	 * for pre-MTL platforms).
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
+	 *	ppGTT UC -> XE_GEM_COH_NONE
+	 *	ppGTT WC -> XE_GEM_COH_NONE
+	 *	ppGTT WT -> XE_GEM_COH_NONE
+	 *	ppGTT WB -> XE_GEM_COH_AT_LEAST_1WAY
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
2.41.0

