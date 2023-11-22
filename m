Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70385C61DB1
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 14:39:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A80710E65A;
	Wed, 22 Nov 2023 14:39:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A89810E655
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 14:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700663944; x=1732199944;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kMz03xj7aJsA5vGwhOuttAi96YifM4sCocW9/cM0gWg=;
 b=ZuCQXW6aEN6OzjftUrs0eqMnllW8MAuapAEFwZYO44mrXeUsbkrNGp0W
 kFE3IiIfEZqhBcjxWlAAJe+8Ka2Sz4nougccC0zTajUerY/GLfkI9tTh+
 HVFFYXQJ1Lqnqs4PjmCx2SuzELrRWryzjOvt0FYlRA8epYTH4QzZ/pDwR
 JuA3wTkYbhtwA/mogSkXYiq828XZnTcrw8WDD3Tx0MlOJAmOuNX2XuxHL
 50+vpJMLQ/UVWSvw/1Fd4lmIQYbFLms8R8/CaNHjPWZckWA8mV5TWohlw
 QkNL2GPgYEJfwCTxM0hsuEJi9hs0NwzMdWiOYbd4pXjOTgRmTv62Xjq9C w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="395985155"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="395985155"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:38:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="1098430362"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="1098430362"
Received: from arechber-mobl.ger.corp.intel.com (HELO 039181c9d572.intel.com)
 ([10.249.44.143])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 06:38:54 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Nov 2023 14:38:28 +0000
Message-Id: <20231122143833.7-10-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122143833.7-1-francois.dugast@intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 09/14] drm/xe/uapi: Kill tile_mask
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
---
 drivers/gpu/drm/xe/xe_vm.c       | 41 ++++++++------------------------
 drivers/gpu/drm/xe/xe_vm_types.h |  2 --
 include/uapi/drm/xe_drm.h        |  8 +------
 3 files changed, 11 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b39c6f43f01f..ccd2821e61f8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -863,8 +863,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    u64 bo_offset_or_userptr,
 				    u64 start, u64 end,
 				    bool read_only,
-				    bool is_null,
-				    u8 tile_mask)
+				    bool is_null)
 {
 	struct xe_vma *vma;
 	struct xe_tile *tile;
@@ -896,12 +895,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
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
@@ -2167,7 +2162,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 static struct drm_gpuva_ops *
 vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			 u64 bo_offset_or_userptr, u64 addr, u64 range,
-			 u32 operation, u32 flags, u8 tile_mask,
+			 u32 operation, u32 flags,
 			 u32 prefetch_region)
 {
 	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
@@ -2223,7 +2218,6 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 	drm_gpuva_for_each_op(__op, ops) {
 		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 
-		op->tile_mask = tile_mask;
 		if (__op->op == DRM_GPUVA_OP_MAP) {
 			op->map.immediate =
 				flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE;
@@ -2241,7 +2235,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 }
 
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
-			      u8 tile_mask, bool read_only, bool is_null)
+			      bool read_only, bool is_null)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct xe_vma *vma;
@@ -2256,8 +2250,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	}
 	vma = xe_vma_create(vm, bo, op->gem.offset,
 			    op->va.addr, op->va.addr +
-			    op->va.range - 1, read_only, is_null,
-			    tile_mask);
+			    op->va.range - 1, read_only, is_null);
 	if (bo)
 		xe_bo_unlock(bo);
 
@@ -2401,8 +2394,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 		{
 			struct xe_vma *vma;
 
-			vma = new_vma(vm, &op->base.map,
-				      op->tile_mask, op->map.read_only,
+			vma = new_vma(vm, &op->base.map, op->map.read_only,
 				      op->map.is_null);
 			if (IS_ERR(vma))
 				return PTR_ERR(vma);
@@ -2427,8 +2419,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 					op->base.remap.unmap->va->flags &
 					DRM_GPUVA_SPARSE;
 
-				vma = new_vma(vm, op->base.remap.prev,
-					      op->tile_mask, read_only,
+				vma = new_vma(vm, op->base.remap.prev, read_only,
 					      is_null);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
@@ -2461,8 +2452,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 					op->base.remap.unmap->va->flags &
 					DRM_GPUVA_SPARSE;
 
-				vma = new_vma(vm, op->base.remap.next,
-					      op->tile_mask, read_only,
+				vma = new_vma(vm, op->base.remap.next, read_only,
 					      is_null);
 				if (IS_ERR(vma))
 					return PTR_ERR(vma);
@@ -2994,16 +2984,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
@@ -3076,12 +3056,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u32 op = bind_ops[i].op;
 		u32 flags = bind_ops[i].flags;
 		u64 obj_offset = bind_ops[i].obj_offset;
-		u8 tile_mask = bind_ops[i].tile_mask;
 		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
 
 		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
 						  addr, range, op, flags,
-						  tile_mask, prefetch_region);
+						  prefetch_region);
 		if (IS_ERR(ops[i])) {
 			err = PTR_ERR(ops[i]);
 			ops[i] = NULL;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index aaf0c7101019..9a2f2f23dabd 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -400,8 +400,6 @@ struct xe_vma_op {
 	u32 num_syncs;
 	/** @link: async operation link */
 	struct list_head link;
-	/** @tile_mask: gt mask for this operation */
-	u8 tile_mask;
 	/** @flags: operation flags */
 	enum xe_vma_op_flags flags;
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index f2bdc6e323e4..85b0affc9f89 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -683,12 +683,6 @@ struct drm_xe_vm_bind_op {
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
@@ -723,7 +717,7 @@ struct drm_xe_vm_bind_op {
 	__u32 prefetch_mem_region_instance;
 
 	/** @reserved: Reserved */
-	__u64 reserved[2];
+	__u64 reserved[3];
 };
 
 struct drm_xe_vm_bind {
-- 
2.34.1

