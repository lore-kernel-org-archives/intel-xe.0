Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C706FC001B2
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 05:26:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F06E510E4C2;
	Tue,  7 Nov 2023 05:26:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7436010E4B1
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 05:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699334758; x=1730870758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hBlT/yMKNzXKHSkv/plJ8JxnfWMhaYB6Uo4orTw0rbg=;
 b=YG7cv5tihcr07zgT6QvSta+D/xq1L1u9vFnGx7SjDuX5NYrSjZKXVNah
 PHTnofskZnd7RCJghEJjyX6VBeUXggBbd0r6ZbskxBwAzgb1yjHCM9rOp
 e5Rpmyy8RSuHBITBx0NqYGvUvEjRPC1EpYpHaA1IkYO5xjty5U+oH3jlU
 YApxI0Q7Z6F4bjn1qArkalc9OXhGQtwu4QHuIeWUs88L8r8kfugWpIhWu
 GnIxRDgyctJ82B7CmqqlDDR57NHckZXeRxLKblG7FjU/r0Nc7HknW36aI
 M1QPSe+s251NwCVUu0OgRRfrBlLkNACxujGLiuOfw/TGCQg9zQfZen1Hp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368769539"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="368769539"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791689896"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="791689896"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  6 Nov 2023 21:26:03 -0800
Message-Id: <20231107052603.124361-28-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 27/27] drm/xe/uapi: Make sync vs async VM bind
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
 drivers/gpu/drm/xe/xe_exec_queue.c       |  7 +---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 -
 drivers/gpu/drm/xe/xe_vm.c               | 53 ++++++++----------------
 drivers/gpu/drm/xe/xe_vm_types.h         | 15 +++----
 include/uapi/drm/xe_drm.h                |  6 +--
 5 files changed, 28 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6d142fb75dfc..57a4b688505f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -625,10 +625,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
 		return -EINVAL;
 
-	if (eci[0].engine_class >= DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC) {
-		bool sync = eci[0].engine_class ==
-			DRM_XE_ENGINE_CLASS_VM_BIND_SYNC;
-
+	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
 		for_each_gt(gt, xe, id) {
 			struct xe_exec_queue *new;
 
@@ -654,8 +651,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
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
index 52f563580fc3..9ec0896e5ac6 100644
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
 
@@ -2605,12 +2595,13 @@ struct dma_fence *xe_vm_ops_execute(struct xe_vm *vm, struct xe_vma_ops *vops)
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
@@ -2623,9 +2614,13 @@ static void vm_bind_ioctl_ops_install_fences(struct xe_vm *vm,
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
@@ -2648,7 +2643,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 		if (IS_ERR(fence))
 			return PTR_ERR(fence);
 
-		vm_bind_ioctl_ops_install_fences(vm, vops, fence);
+		err = vm_bind_ioctl_ops_install_fences(vm, vops, fence);
 	}
 
 	drm_exec_fini(&exec);
@@ -2805,12 +2800,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
@@ -2819,14 +2808,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
@@ -2928,7 +2909,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto free_syncs;
 	}
 
-	xe_vma_ops_init(&vops, vm, q, syncs, num_syncs);
+	xe_vma_ops_init(&vops, vm, q, syncs, num_syncs, async);
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
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
index 9bd7092a7ea4..78a346960240 100644
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

