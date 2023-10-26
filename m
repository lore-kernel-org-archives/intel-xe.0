Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6472C25B6B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 04:02:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968FB10E751;
	Thu, 26 Oct 2023 04:02:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE8810E755
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 04:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698292914; x=1729828914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FWlhiTGI76uXq2OzFIyiIbRoxc0IDznPYRDTt1Vf1Xk=;
 b=OdtL77wYuBBjPftxGWaPvylrguMD/eyLrkENK0RKxpZLPGyv+xotjcw8
 e06UwndfwGDwu1WLRxzY9c0Vin1AT4sW6kwlFaTyHKaYBHnVHHCimQ9PT
 NIa7RkZV9Qv+HrZOhZ1td74ndNv2dnKa6BJcpl0UcKTtd6LiNEAjxhxtV
 fSGskNfRZAJjdMip3D1A/yGndpGlscnkiQyPnDDP6rbHT0pY1mzrcAutt
 JE1EjipgMo/BFuiZUVrqllpyx2vJ+25ZhvRhoWSuJWp+felePcRQwGkLO
 9T1jkRJ/tiPBCUhZvzlwOjjDZja2+Ouga1FJyxsW9vLA8y1v7AKLij8Jg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="377822017"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="377822017"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762682438"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="762682438"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 25 Oct 2023 21:02:13 -0700
Message-Id: <20231026040213.1272993-27-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026040213.1272993-1-matthew.brost@intel.com>
References: <20231026040213.1272993-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 26/26] drm/xe/uapi: Make sync vs async VM bind
 operations per IOCTL rather than queue
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

Making sync vs async per IOCTL simplifies the uAPI while also making it
more flexible. Adjust the uAPI accordingly.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       |  7 +--
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 -
 drivers/gpu/drm/xe/xe_vm.c               | 59 +++++++++---------------
 drivers/gpu/drm/xe/xe_vm_types.h         | 15 +++---
 include/uapi/drm/xe_drm.h                |  6 +--
 5 files changed, 34 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index c2e479c78328..b3a9bf7605cb 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -622,10 +622,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
 		return -EINVAL;
 
-	if (eci[0].engine_class >= DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC) {
-		bool sync = eci[0].engine_class ==
-			DRM_XE_ENGINE_CLASS_VM_BIND_SYNC;
-
+	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
 		for_each_gt(gt, xe, id) {
 			struct xe_exec_queue *new;
 
@@ -651,8 +648,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 						   args->width, hwe,
 						   EXEC_QUEUE_FLAG_PERSISTENT |
 						   EXEC_QUEUE_FLAG_VM |
-						   (sync ? 0 :
-						    EXEC_QUEUE_FLAG_VM_ASYNC) |
 						   (id ?
 						    EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD :
 						    0));
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 35ffe7c55f25..91c1f243aad4 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -71,8 +71,6 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_VM			BIT(4)
 /* child of VM queue for multi-tile VM jobs */
 #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
-/* VM jobs for this queue are asynchronous */
-#define EXEC_QUEUE_FLAG_VM_ASYNC		BIT(6)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 4039ade92dec..c6d34b176f2b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -827,7 +827,8 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
 
 static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
 			    struct xe_exec_queue *q,
-			    struct xe_sync_entry *syncs, u32 num_syncs)
+			    struct xe_sync_entry *syncs, u32 num_syncs,
+			    bool async)
 {
 	memset(vops, 0, sizeof(*vops));
 	INIT_LIST_HEAD(&vops->list);
@@ -835,6 +836,7 @@ static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
 	vops->q = q;
 	vops->syncs = syncs;
 	vops->num_syncs = num_syncs;
+	vops->async = async;
 }
 
 static int xe_vma_ops_alloc(struct xe_vma_ops *vops)
@@ -1431,7 +1433,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	init_rwsem(&vm->lock);
 
-	xe_vma_ops_init(&vm->dummy_ops.vops, vm, NULL, NULL, 0);
+	xe_vma_ops_init(&vm->dummy_ops.vops, vm, NULL, NULL, 0, false);
 	INIT_LIST_HEAD(&vm->dummy_ops.op.link);
 	list_add(&vm->dummy_ops.op.link, &vm->dummy_ops.vops.list);
 	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
@@ -1517,9 +1519,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 			struct xe_gt *gt = tile->primary_gt;
 			struct xe_vm *migrate_vm;
 			struct xe_exec_queue *q;
-			u32 create_flags = EXEC_QUEUE_FLAG_VM |
-				((flags & XE_VM_FLAG_ASYNC_DEFAULT) ?
-				EXEC_QUEUE_FLAG_VM_ASYNC : 0);
 
 			if (!vm->pt_root[id])
 				continue;
@@ -1527,7 +1526,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 			migrate_vm = xe_migrate_get_vm(tile->migrate);
 			q = xe_exec_queue_create_class(xe, gt, migrate_vm,
 						       XE_ENGINE_CLASS_COPY,
-						       create_flags);
+						       EXEC_QUEUE_FLAG_VM);
 			xe_vm_put(migrate_vm);
 			if (IS_ERR(q)) {
 				xe_vm_close_and_put(vm);
@@ -1767,15 +1766,8 @@ to_wait_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	return q ? q : vm->q[0];
 }
 
-static bool xe_vm_sync_mode(struct xe_vm *vm, struct xe_exec_queue *q)
-{
-	return q ? !(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC) :
-		!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT);
-}
-
 #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_SCRATCH_PAGE | \
 				    DRM_XE_VM_CREATE_COMPUTE_MODE | \
-				    DRM_XE_VM_CREATE_ASYNC_DEFAULT | \
 				    DRM_XE_VM_CREATE_FAULT_MODE)
 
 int xe_vm_create_ioctl(struct drm_device *dev, void *data,
@@ -1829,8 +1821,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 		flags |= XE_VM_FLAG_SCRATCH_PAGE;
 	if (args->flags & DRM_XE_VM_CREATE_COMPUTE_MODE)
 		flags |= XE_VM_FLAG_COMPUTE_MODE;
-	if (args->flags & DRM_XE_VM_CREATE_ASYNC_DEFAULT)
-		flags |= XE_VM_FLAG_ASYNC_DEFAULT;
 	if (args->flags & DRM_XE_VM_CREATE_FAULT_MODE)
 		flags |= XE_VM_FLAG_FAULT_MODE;
 
@@ -2594,12 +2584,13 @@ struct dma_fence *xe_vm_ops_execute(struct xe_vm *vm, struct xe_vma_ops *vops)
 	return fence;
 }
 
-static void vm_bind_ioctl_ops_install_fences(struct xe_vm *vm,
-					     struct xe_vma_ops *vops,
-					     struct dma_fence *fence)
+static int vm_bind_ioctl_ops_install_fences(struct xe_vm *vm,
+					    struct xe_vma_ops *vops,
+					    struct dma_fence *fence)
 {
 	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, vops->q);
 	struct xe_vma_op *op;
+	long timeout = 0;
 	int i;
 
 	list_for_each_entry(op, &vops->list, link) {
@@ -2612,9 +2603,13 @@ static void vm_bind_ioctl_ops_install_fences(struct xe_vm *vm,
 	for (i = 0; i < vops->num_syncs; i++)
 		xe_sync_entry_signal(vops->syncs + i, NULL, fence);
 	xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
-	if (xe_vm_sync_mode(vm, vops->q))
-		dma_fence_wait(fence, true);
+	if (!vops->async)
+		timeout = dma_fence_wait(fence, true);
 	dma_fence_put(fence);
+
+	if (timeout < 0)
+		return -EINTR;
+	return 0;
 }
 
 static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
@@ -2637,7 +2632,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 		if (IS_ERR(fence))
 			return PTR_ERR(fence);
 
-		vm_bind_ioctl_ops_install_fences(vm, vops, fence);
+		err = vm_bind_ioctl_ops_install_fences(vm, vops, fence);
 	}
 
 	drm_exec_fini(&exec);
@@ -2794,12 +2789,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			err = -EINVAL;
 			goto put_exec_queue;
 		}
-
-		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
-				 !!(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC))) {
-			err = -EINVAL;
-			goto put_exec_queue;
-		}
 	}
 
 	vm = xe_vm_lookup(xef, args->vm_id);
@@ -2808,14 +2797,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto put_exec_queue;
 	}
 
-	if (!args->exec_queue_id) {
-		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
-				 !!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT))) {
-			err = -EINVAL;
-			goto put_vm;
-		}
-	}
-
 	err = down_write_killable(&vm->lock);
 	if (err)
 		goto put_vm;
@@ -2917,7 +2898,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto free_syncs;
 	}
 
-	xe_vma_ops_init(&vops, vm, q, syncs, num_syncs);
+	xe_vma_ops_init(&vops, vm, q, syncs, num_syncs, async);
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
@@ -2968,6 +2949,12 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			xe_exec_queue_last_fence_get(to_wait_exec_queue(vm, q), vm);
 
 		xe_sync_entry_signal(&syncs[i], NULL, fence);
+		if (!async) {
+			long timeout = dma_fence_wait(fence, true);
+
+			if (timeout < 0)
+				err = -EINTR;
+		}
 		dma_fence_put(fence);
 	}
 	while (num_syncs--)
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index adbd8199aa8b..2ff904edb583 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -217,6 +217,8 @@ struct xe_vma_ops {
 	struct xe_sync_entry *syncs;
 	/** @num_syncs: number of syncs */
 	u32 num_syncs;
+	/** @async: VMA operations are asynchronous */
+	bool async;
 	/** @pt_update_ops: page table update operations */
 	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
 };
@@ -252,13 +254,12 @@ struct xe_vm {
 	 */
 #define XE_VM_FLAG_64K			BIT(0)
 #define XE_VM_FLAG_COMPUTE_MODE		BIT(1)
-#define XE_VM_FLAG_ASYNC_DEFAULT	BIT(2)
-#define XE_VM_FLAG_MIGRATION		BIT(3)
-#define XE_VM_FLAG_SCRATCH_PAGE		BIT(4)
-#define XE_VM_FLAG_FAULT_MODE		BIT(5)
-#define XE_VM_FLAG_BANNED		BIT(6)
-#define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(8, 7), flags)
-#define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(8, 7), (tile)->id)
+#define XE_VM_FLAG_MIGRATION		BIT(2)
+#define XE_VM_FLAG_SCRATCH_PAGE		BIT(3)
+#define XE_VM_FLAG_FAULT_MODE		BIT(4)
+#define XE_VM_FLAG_BANNED		BIT(5)
+#define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(7, 6), flags)
+#define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(7, 6), (tile)->id)
 	unsigned long flags;
 
 	/** @composite_fence_ctx: context composite fence */
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 24bf8f0f52e8..36112e0c1e3b 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -137,8 +137,7 @@ struct drm_xe_engine_class_instance {
 	 * Kernel only classes (not actual hardware engine class). Used for
 	 * creating ordered queues of VM bind operations.
 	 */
-#define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
-#define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6
+#define DRM_XE_ENGINE_CLASS_VM_BIND		5
 	__u16 engine_class;
 
 	__u16 engine_instance;
@@ -597,8 +596,7 @@ struct drm_xe_vm_create {
 
 #define DRM_XE_VM_CREATE_SCRATCH_PAGE	(0x1 << 0)
 #define DRM_XE_VM_CREATE_COMPUTE_MODE	(0x1 << 1)
-#define DRM_XE_VM_CREATE_ASYNC_DEFAULT	(0x1 << 2)
-#define DRM_XE_VM_CREATE_FAULT_MODE	(0x1 << 3)
+#define DRM_XE_VM_CREATE_FAULT_MODE	(0x1 << 2)
 	/** @flags: Flags */
 	__u32 flags;
 
-- 
2.34.1

