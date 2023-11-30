Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E04C10DC2
	for <intel-xe@archiver.kernel.org>; Thu, 30 Nov 2023 18:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F35D10E75D;
	Thu, 30 Nov 2023 18:40:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C9D10E764
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Nov 2023 18:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701369623; x=1732905623;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xM2dHqowHMWUBnSr10nAbdUf74NkCRj6n+4nk2I8sGc=;
 b=fziCBMqCW84/EtwHbe8EMWvvFFo2IsXXQXUXESCpX/Jl06/S0rGkOJcO
 tWQM4ClDFN3Eq2dbB6ZXPC65e9oX3TV6xPGpVKqnj2IOlkGsOaK3C9abj
 GcqU8/n4jbSydB5yMsy5W2NchbxdHd9DS/d562ULfUW8WcHF6MWKrQocG
 bJu+pWdrO+n5etia1dBEJ/w7i1Oap4qUhR2mBftUwJgF24yjQ4w13BU4K
 4JMOirzt/era7sAiPyHixc0LNt+79RUnjHhqGnrkZjFVkwWG/zgEEJ/Lt
 HBgM1zdukE5T08zjYGN4eCXPZTEwTFAPnKti+9I+KBLOVED9uhWQjsrnv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="393111732"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="393111732"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="913294946"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; d="scan'208";a="913294946"
Received: from stefanwe-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.60.146])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2023 10:40:22 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 30 Nov 2023 18:39:48 +0000
Message-Id: <20231130183955.7-10-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130183955.7-1-francois.dugast@intel.com>
References: <20231130183955.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 09/16] drm/xe/uapi: Kill tile_mask
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

It is currently unused, so by the rules it cannot go upstream.
Also there was the desire to convert that to align with the
engine_class_instance selection, but the consensus on that one
is to remain with the global gt_id. So we are keeping the gt_id
there, not converting to a generic sched_group and also killing
this tile_mask and only using the default behavior of 0 that is
to create a mapping / page_table entry on every tile, similar
to what i915.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 40 +++++++-------------------------
 drivers/gpu/drm/xe/xe_vm_types.h |  2 --
 include/uapi/drm/xe_drm.h        |  8 +------
 3 files changed, 10 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index acb061c6ee2d..1d537f129aa3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -866,7 +866,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    u64 start, u64 end,
 				    bool read_only,
 				    bool is_null,
-				    u8 tile_mask,
 				    u16 pat_index)
 {
 	struct xe_vma *vma;
@@ -899,12 +898,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	if (is_null)
 		vma->gpuva.flags |= DRM_GPUVA_SPARSE;
 
-	if (tile_mask) {
-		vma->tile_mask = tile_mask;
-	} else {
-		for_each_tile(tile, vm->xe, id)
-			vma->tile_mask |= 0x1 << id;
-	}
+	for_each_tile(tile, vm->xe, id)
+		vma->tile_mask |= 0x1 << id;
 
 	if (GRAPHICS_VER(vm->xe) >= 20 || vm->xe->info.platform == XE_PVC)
 		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
@@ -2173,7 +2168,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 static struct drm_gpuva_ops *
 vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			 u64 bo_offset_or_userptr, u64 addr, u64 range,
-			 u32 operation, u32 flags, u8 tile_mask,
+			 u32 operation, u32 flags,
 			 u32 prefetch_region, u16 pat_index)
 {
 	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
@@ -2229,7 +2224,6 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 	drm_gpuva_for_each_op(__op, ops) {
 		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 
-		op->tile_mask = tile_mask;
 		if (__op->op == DRM_GPUVA_OP_MAP) {
 			op->map.immediate =
 				flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE;
@@ -2248,8 +2242,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 }
 
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
-			      u8 tile_mask, bool read_only, bool is_null,
-			      u16 pat_index)
+			      bool read_only, bool is_null, u16 pat_index)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct xe_vma *vma;
@@ -2265,7 +2258,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	vma = xe_vma_create(vm, bo, op->gem.offset,
 			    op->va.addr, op->va.addr +
 			    op->va.range - 1, read_only, is_null,
-			    tile_mask, pat_index);
+			    pat_index);
 	if (bo)
 		xe_bo_unlock(bo);
 
@@ -2409,8 +2402,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 		{
 			struct xe_vma *vma;
 
-			vma = new_vma(vm, &op->base.map,
-				      op->tile_mask, op->map.read_only,
+			vma = new_vma(vm, &op->base.map, op->map.read_only,
 				      op->map.is_null, op->map.pat_index);
 			if (IS_ERR(vma))
 				return PTR_ERR(vma);
@@ -2435,8 +2427,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 					op->base.remap.unmap->va->flags &
 					DRM_GPUVA_SPARSE;
 
-				vma = new_vma(vm, op->base.remap.prev,
-					      op->tile_mask, read_only,
+				vma = new_vma(vm, op->base.remap.prev, read_only,
 					      is_null, old->pat_index);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
@@ -2469,8 +2460,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 					op->base.remap.unmap->va->flags &
 					DRM_GPUVA_SPARSE;
 
-				vma = new_vma(vm, op->base.remap.next,
-					      op->tile_mask, read_only,
+				vma = new_vma(vm, op->base.remap.next, read_only,
 					      is_null, old->pat_index);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
@@ -3024,16 +3014,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			err = -EINVAL;
 			goto release_vm_lock;
 		}
-
-		if (bind_ops[i].tile_mask) {
-			u64 valid_tiles = BIT(xe->info.tile_count) - 1;
-
-			if (XE_IOCTL_DBG(xe, bind_ops[i].tile_mask &
-					 ~valid_tiles)) {
-				err = -EINVAL;
-				goto release_vm_lock;
-			}
-		}
 	}
 
 	bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);
@@ -3126,14 +3106,12 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u32 op = bind_ops[i].op;
 		u32 flags = bind_ops[i].flags;
 		u64 obj_offset = bind_ops[i].obj_offset;
-		u8 tile_mask = bind_ops[i].tile_mask;
 		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
 		u16 pat_index = bind_ops[i].pat_index;
 
 		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
 						  addr, range, op, flags,
-						  tile_mask, prefetch_region,
-						  pat_index);
+						  prefetch_region, pat_index);
 		if (IS_ERR(ops[i])) {
 			err = PTR_ERR(ops[i]);
 			ops[i] = NULL;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index be5aca659430..23abdfd8622f 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -407,8 +407,6 @@ struct xe_vma_op {
 	u32 num_syncs;
 	/** @link: async operation link */
 	struct list_head link;
-	/** @tile_mask: gt mask for this operation */
-	u8 tile_mask;
 	/** @flags: operation flags */
 	enum xe_vma_op_flags flags;
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index c7fb252b8d04..a239789f7825 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -743,12 +743,6 @@ struct drm_xe_vm_bind_op {
 	/** @addr: Address to operate on, MBZ for UNMAP_ALL */
 	__u64 addr;
 
-	/**
-	 * @tile_mask: Mask for which tiles to create binds for, 0 == All tiles,
-	 * only applies to creating new VMAs
-	 */
-	__u64 tile_mask;
-
 #define DRM_XE_VM_BIND_OP_MAP		0x0
 #define DRM_XE_VM_BIND_OP_UNMAP		0x1
 #define DRM_XE_VM_BIND_OP_MAP_USERPTR	0x2
@@ -783,7 +777,7 @@ struct drm_xe_vm_bind_op {
 	__u32 prefetch_mem_region_instance;
 
 	/** @reserved: Reserved */
-	__u64 reserved[2];
+	__u64 reserved[3];
 };
 
 struct drm_xe_vm_bind {
-- 
2.34.1

