Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A55C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 22:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553A910E850;
	Wed, 13 Dec 2023 22:29:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C521510E850
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Dec 2023 22:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702506574; x=1734042574;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3tGPkU4EYfdps+iNaT2KgBNsDU5rL3YRj2rDP4wt6w8=;
 b=NbCbGRIH68KAywIt5KJGIYIBI/Ywcr3pl0Pl3rIuMPI2/21IzuVw6pyW
 PL8OGmx74xGIAZKR96jE0gH5o3S7kkWyQaUdeyynSyW/E23EMMipGHrqU
 DagUkmt2uIpG280HNzYV9xKvRQIoFzq21HV7BgT0ov4yVmMkTGkIwVNfI
 6dkRz3nQnVlY00hg4S3I26zBemZ5u+NC6Ja2cuy6/QKjEBeH4mvY35Ja6
 3G/GULktmyr+Y3lINDHaEB3dVDEWH0+IwFdRx1ZhbVIghQdt72KskYbLd
 uz0xE3jQI3jsj6I+bHzEaR1tspGBL5eDA02isDgjntpNbWCXCTV9moBkr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="394783132"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="394783132"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 14:29:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="864781806"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="864781806"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 14:29:34 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v3] drm/xe/uapi: Uniform async vs sync handling
Date: Wed, 13 Dec 2023 14:29:57 -0800
Message-Id: <20231213222957.624515-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove concept of async vs sync VM bind queues, rather make async vs
sync a per IOCTL choice. Since this is per IOCTL, it makes sense to have
a singular flag IOCTL rather than per VM bind op flag too. Add
DRM_XE_SYNCS_FLAG_WAIT_FOR_OP which is an input sync flag to support
this. Support this new flag for both the VM bind IOCTL only with a path
to support this for execs too.

v2: Add cookie, move sync wait outside of any locks.
v3: Skip bind operations if *cookie non-zero, check reserved bits zero

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c             |  13 ++-
 drivers/gpu/drm/xe/xe_exec_queue.c       |   7 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 -
 drivers/gpu/drm/xe/xe_vm.c               | 140 ++++++++++++-----------
 drivers/gpu/drm/xe/xe_vm_types.h         |  13 +--
 include/uapi/drm/xe_drm.h                |  65 +++++++----
 6 files changed, 131 insertions(+), 109 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index ba92e5619da3..af2b676c8eef 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -104,7 +104,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_exec *args = data;
-	struct drm_xe_sync __user *syncs_user = u64_to_user_ptr(args->syncs);
+	struct drm_xe_sync __user *syncs_user = u64_to_user_ptr(args->syncs.syncs);
 	u64 __user *addresses_user = u64_to_user_ptr(args->address);
 	struct xe_exec_queue *q;
 	struct xe_sync_entry *syncs = NULL;
@@ -120,7 +120,10 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	int err = 0;
 
 	if (XE_IOCTL_DBG(xe, args->extensions) ||
-	    XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
+	    XE_IOCTL_DBG(xe, args->pad || args->pad2[0] || args->pad2[1] || args->pad2[2]) ||
+	    XE_IOCTL_DBG(xe, args->syncs.flags) ||
+	    XE_IOCTL_DBG(xe, args->syncs.cookie) ||
+	    XE_IOCTL_DBG(xe, args->syncs.reserved[0] || args->syncs.reserved[1]) ||
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
@@ -140,8 +143,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_exec_queue;
 	}
 
-	if (args->num_syncs) {
-		syncs = kcalloc(args->num_syncs, sizeof(*syncs), GFP_KERNEL);
+	if (args->syncs.num_syncs) {
+		syncs = kcalloc(args->syncs.num_syncs, sizeof(*syncs), GFP_KERNEL);
 		if (!syncs) {
 			err = -ENOMEM;
 			goto err_exec_queue;
@@ -150,7 +153,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	vm = q->vm;
 
-	for (i = 0; i < args->num_syncs; i++) {
+	for (i = 0; i < args->syncs.num_syncs; i++) {
 		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs++],
 					  &syncs_user[i], SYNC_PARSE_FLAG_EXEC |
 					  (xe_vm_in_lr_mode(vm) ?
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index eeb9605dd45f..a25d67971fdd 100644
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
index c7aefa1c8c31..0f7f6cded4a3 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -84,8 +84,6 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_VM			BIT(4)
 /* child of VM queue for multi-tile VM jobs */
 #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
-/* VM jobs for this queue are asynchronous */
-#define EXEC_QUEUE_FLAG_VM_ASYNC		BIT(6)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2f3df9ee67c9..8407c4d54a45 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1343,9 +1343,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 			struct xe_gt *gt = tile->primary_gt;
 			struct xe_vm *migrate_vm;
 			struct xe_exec_queue *q;
-			u32 create_flags = EXEC_QUEUE_FLAG_VM |
-				((flags & XE_VM_FLAG_ASYNC_DEFAULT) ?
-				EXEC_QUEUE_FLAG_VM_ASYNC : 0);
+			u32 create_flags = EXEC_QUEUE_FLAG_VM;
 
 			if (!vm->pt_root[id])
 				continue;
@@ -1712,12 +1710,6 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 	return ERR_PTR(err);
 }
 
-static bool xe_vm_sync_mode(struct xe_vm *vm, struct xe_exec_queue *q)
-{
-	return q ? !(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC) :
-		!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT);
-}
-
 static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 			struct xe_exec_queue *q, struct xe_sync_entry *syncs,
 			u32 num_syncs, bool immediate, bool first_op,
@@ -1747,8 +1739,6 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 
 	if (last_op)
 		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
-	if (last_op && xe_vm_sync_mode(vm, q))
-		dma_fence_wait(fence, true);
 	dma_fence_put(fence);
 
 	return 0;
@@ -1791,8 +1781,6 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 	xe_vma_destroy(vma, fence);
 	if (last_op)
 		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
-	if (last_op && xe_vm_sync_mode(vm, q))
-		dma_fence_wait(fence, true);
 	dma_fence_put(fence);
 
 	return 0;
@@ -1800,7 +1788,6 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 
 #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
 				    DRM_XE_VM_CREATE_FLAG_LR_MODE | \
-				    DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT | \
 				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
 
 int xe_vm_create_ioctl(struct drm_device *dev, void *data,
@@ -1854,8 +1841,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 		flags |= XE_VM_FLAG_SCRATCH_PAGE;
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE)
 		flags |= XE_VM_FLAG_LR_MODE;
-	if (args->flags & DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT)
-		flags |= XE_VM_FLAG_ASYNC_DEFAULT;
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
 		flags |= XE_VM_FLAG_FAULT_MODE;
 
@@ -2263,8 +2248,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				   struct drm_gpuva_ops *ops,
 				   struct xe_sync_entry *syncs, u32 num_syncs,
-				   struct list_head *ops_list, bool last,
-				   bool async)
+				   struct list_head *ops_list, bool last)
 {
 	struct xe_vma_op *last_op = NULL;
 	struct drm_gpuva_op *__op;
@@ -2696,28 +2680,28 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 
 #ifdef TEST_VM_ASYNC_OPS_ERROR
 #define SUPPORTED_FLAGS	\
-	(FORCE_ASYNC_OP_ERROR | DRM_XE_VM_BIND_FLAG_ASYNC | \
-	 DRM_XE_VM_BIND_FLAG_READONLY | DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
-	 DRM_XE_VM_BIND_FLAG_NULL | 0xffff)
+	(FORCE_ASYNC_OP_ERROR | DRM_XE_VM_BIND_FLAG_READONLY | \
+	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | 0xffff)
 #else
 #define SUPPORTED_FLAGS	\
-	(DRM_XE_VM_BIND_FLAG_ASYNC | DRM_XE_VM_BIND_FLAG_READONLY | \
+	(DRM_XE_VM_BIND_FLAG_READONLY | \
 	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | \
 	 0xffff)
 #endif
 #define XE_64K_PAGE_MASK 0xffffull
+#define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
 
 #define MAX_BINDS	512	/* FIXME: Picking random upper limit */
 
 static int vm_bind_ioctl_check_args(struct xe_device *xe,
 				    struct drm_xe_vm_bind *args,
 				    struct drm_xe_vm_bind_op **bind_ops,
-				    bool *async)
+				    bool *async, bool *skip_ops)
 {
 	int err;
 	int i;
 
-	if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
+	if (XE_IOCTL_DBG(xe, args->pad) ||
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
@@ -2745,6 +2729,30 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		*bind_ops = &args->bind;
 	}
 
+	*async = !(args->syncs.flags & DRM_XE_SYNCS_FLAG_WAIT_FOR_OP);
+	*skip_ops = false;
+
+	if (XE_IOCTL_DBG(xe, args->syncs.flags & ~ALL_DRM_XE_SYNCS_FLAGS) ||
+	    XE_IOCTL_DBG(xe, *async && args->syncs.cookie) ||
+	    XE_IOCTL_DBG(xe, args->syncs.reserved[0] || args->syncs.reserved[1]) ||
+	    XE_IOCTL_DBG(xe, !*async && args->syncs.num_syncs)) {
+		err = -EINVAL;
+		goto free_bind_ops;
+	}
+
+	if (!*async) {
+		u64 __user *cookie = u64_to_user_ptr(args->syncs.cookie);
+		u64 value;
+
+		err = __copy_from_user(&value, cookie, sizeof(u64));
+		if (XE_IOCTL_DBG(xe, err)) {
+			err = -EFAULT;
+			goto free_bind_ops;
+		}
+		if (value)
+			*skip_ops = true;
+	}
+
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = (*bind_ops)[i].range;
 		u64 addr = (*bind_ops)[i].addr;
@@ -2775,18 +2783,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 			goto free_bind_ops;
 		}
 
-		if (i == 0) {
-			*async = !!(flags & DRM_XE_VM_BIND_FLAG_ASYNC);
-			if (XE_IOCTL_DBG(xe, !*async && args->num_syncs)) {
-				err = -EINVAL;
-				goto free_bind_ops;
-			}
-		} else if (XE_IOCTL_DBG(xe, *async !=
-					!!(flags & DRM_XE_VM_BIND_FLAG_ASYNC))) {
-			err = -EINVAL;
-			goto free_bind_ops;
-		}
-
 		if (XE_IOCTL_DBG(xe, op > DRM_XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
 		    XE_IOCTL_DBG(xe, obj && is_null) ||
@@ -2854,12 +2850,25 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
 
 	xe_exec_queue_last_fence_set(to_wait_exec_queue(vm, q), vm,
 				     fence);
+	dma_fence_put(fence);
 
-	if (xe_vm_sync_mode(vm, q)) {
-		long timeout = dma_fence_wait(fence, true);
+	return err;
+}
+
+static int vm_bind_ioctl_sync_wait(struct xe_vm *vm,
+				   struct dma_fence *fence,
+				   u64 __user *cookie)
+{
+	long timeout;
+	int err = 0;
+
+	timeout = dma_fence_wait(fence, true);
+	if (timeout < 0) {
+		u64 value = 1;
 
-		if (timeout < 0)
-			err = -EINTR;
+		err = -ERESTARTSYS;
+		if (copy_to_user(cookie, &value, sizeof(value)))
+			err = -EFAULT;
 	}
 
 	dma_fence_put(fence);
@@ -2875,21 +2884,22 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct drm_xe_sync __user *syncs_user;
 	struct xe_bo **bos = NULL;
 	struct drm_gpuva_ops **ops = NULL;
+	struct dma_fence *fence = NULL;
 	struct xe_vm *vm;
 	struct xe_exec_queue *q = NULL;
 	u32 num_syncs;
 	struct xe_sync_entry *syncs = NULL;
 	struct drm_xe_vm_bind_op *bind_ops;
 	LIST_HEAD(ops_list);
-	bool async;
+	bool async, skip_ops;
 	int err;
 	int i;
 
-	err = vm_bind_ioctl_check_args(xe, args, &bind_ops, &async);
+	err = vm_bind_ioctl_check_args(xe, args, &bind_ops, &async, &skip_ops);
 	if (err)
 		return err;
 
-	if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
+	if (XE_IOCTL_DBG(xe, args->pad) ||
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
 		return -EINVAL;
 
@@ -2904,12 +2914,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
@@ -2918,14 +2922,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
@@ -3015,16 +3011,16 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 	}
 
-	if (args->num_syncs) {
-		syncs = kcalloc(args->num_syncs, sizeof(*syncs), GFP_KERNEL);
+	if (args->syncs.num_syncs) {
+		syncs = kcalloc(args->syncs.num_syncs, sizeof(*syncs), GFP_KERNEL);
 		if (!syncs) {
 			err = -ENOMEM;
 			goto put_obj;
 		}
 	}
 
-	syncs_user = u64_to_user_ptr(args->syncs);
-	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
+	syncs_user = u64_to_user_ptr(args->syncs.syncs);
+	for (num_syncs = 0; num_syncs < args->syncs.num_syncs; num_syncs++) {
 		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
 					  &syncs_user[num_syncs],
 					  (xe_vm_in_lr_mode(vm) ?
@@ -3035,7 +3031,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto free_syncs;
 	}
 
-	if (!args->num_binds) {
+	if (!args->num_binds || skip_ops) {
 		err = -ENODATA;
 		goto free_syncs;
 	}
@@ -3060,8 +3056,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 		err = vm_bind_ioctl_ops_parse(vm, q, ops[i], syncs, num_syncs,
 					      &ops_list,
-					      i == args->num_binds - 1,
-					      async);
+					      i == args->num_binds - 1);
 		if (err)
 			goto unwind_ops;
 	}
@@ -3077,7 +3072,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		xe_exec_queue_get(q);
 
 	err = vm_bind_ioctl_ops_execute(vm, &ops_list);
-
+	if (!err && !async) {
+		fence = xe_exec_queue_last_fence_get(to_wait_exec_queue(vm, q), vm);
+		dma_fence_get(fence);
+	}
 	up_write(&vm->lock);
 
 	if (q)
@@ -3092,13 +3090,19 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (args->num_binds > 1)
 		kfree(bind_ops);
 
-	return err;
+	return fence ? vm_bind_ioctl_sync_wait(vm, fence, u64_to_user_ptr(args->syncs.cookie)) :
+		err;
 
 unwind_ops:
 	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
 free_syncs:
-	if (err == -ENODATA)
+	if (err == -ENODATA) {
 		err = vm_bind_ioctl_signal_fences(vm, q, syncs, num_syncs);
+		if (!async) {
+			fence = xe_exec_queue_last_fence_get(to_wait_exec_queue(vm, q), vm);
+			dma_fence_get(fence);
+		}
+	}
 	while (num_syncs--)
 		xe_sync_entry_cleanup(&syncs[num_syncs]);
 
@@ -3108,6 +3112,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		xe_bo_put(bos[i]);
 release_vm_lock:
 	up_write(&vm->lock);
+	if (fence)
+		err = vm_bind_ioctl_sync_wait(vm, fence, u64_to_user_ptr(args->syncs.cookie));
 put_vm:
 	xe_vm_put(vm);
 put_exec_queue:
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 2e023596cb15..63e8a50b88e9 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -138,13 +138,12 @@ struct xe_vm {
 	 */
 #define XE_VM_FLAG_64K			BIT(0)
 #define XE_VM_FLAG_LR_MODE		BIT(1)
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
index 0895e4d2a981..8cbe7ca6fe57 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -140,8 +140,7 @@ struct drm_xe_engine_class_instance {
 	 * Kernel only classes (not actual hardware engine class). Used for
 	 * creating ordered queues of VM bind operations.
 	 */
-#define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
-#define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6
+#define DRM_XE_ENGINE_CLASS_VM_BIND		5
 	/** @engine_class: engine class id */
 	__u16 engine_class;
 	/** @engine_instance: engine instance id */
@@ -661,7 +660,6 @@ struct drm_xe_vm_create {
 	 * still enable recoverable pagefaults if supported by the device.
 	 */
 #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
-#define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(1 << 2)
 	/*
 	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE requires also
 	 * DRM_XE_VM_CREATE_FLAG_LR_MODE. It allows memory to be allocated
@@ -669,7 +667,7 @@ struct drm_xe_vm_create {
 	 * The xe driver internally uses recoverable pagefaults to implement
 	 * this.
 	 */
-#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 3)
+#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
 	/** @flags: Flags */
 	__u32 flags;
 
@@ -777,12 +775,11 @@ struct drm_xe_vm_bind_op {
 	__u32 op;
 
 #define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
-#define DRM_XE_VM_BIND_FLAG_ASYNC	(1 << 1)
 	/*
 	 * Valid on a faulting VM only, do the MAP operation immediately rather
 	 * than deferring the MAP to the page fault handler.
 	 */
-#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 2)
+#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
 	/*
 	 * When the NULL flag is set, the page tables are setup with a special
 	 * bit which indicates writes are dropped and all reads return zero.  In
@@ -790,7 +787,7 @@ struct drm_xe_vm_bind_op {
 	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
 	 * intended to implement VK sparse bindings.
 	 */
-#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 3)
+#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
 	/** @flags: Bind flags */
 	__u32 flags;
 
@@ -808,6 +805,36 @@ struct drm_xe_vm_bind_op {
 	__u64 reserved[3];
 };
 
+/**
+ * struct drm_xe_syncs - In / out syncs for IOCTLs.
+ */
+struct drm_xe_syncs {
+	/** @num_syncs: amount of syncs to wait on */
+	__u32 num_syncs;
+
+	/*
+	 * Block in IOCTL until operation complete, num_syncs MBZ if set.
+	 */
+#define DRM_XE_SYNCS_FLAG_WAIT_FOR_OP (1 << 0)
+	/** @flags: Sync flags */
+	__u32 flags;
+
+	/**
+	 * @cookie: pointer which is written with an non-zero value if IOCTL
+	 * operation has been committed but the wait for completion
+	 * (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP is set) is interrupted. Value of
+	 * *cookie MBZ for IOCTL operations to be executed, if non-zero
+	 * operations are skipped and blocks until exec queue for IOCTL is idle.
+	 */
+	__u64 cookie;
+
+	/** @syncs: pointer to struct drm_xe_sync array */
+	__u64 syncs;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
 struct drm_xe_vm_bind {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
@@ -839,14 +866,8 @@ struct drm_xe_vm_bind {
 		__u64 vector_of_binds;
 	};
 
-	/** @pad: MBZ */
-	__u32 pad2;
-
-	/** @num_syncs: amount of syncs to wait on */
-	__u32 num_syncs;
-
-	/** @syncs: pointer to struct drm_xe_sync array */
-	__u64 syncs;
+	/** @syncs: syncs for bind */
+	struct drm_xe_syncs syncs;
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
@@ -975,14 +996,14 @@ struct drm_xe_exec {
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
+	/** @pad: MBZ */
+	__u32 pad;
+
 	/** @exec_queue_id: Exec queue ID for the batch buffer */
 	__u32 exec_queue_id;
 
-	/** @num_syncs: Amount of struct drm_xe_sync in array. */
-	__u32 num_syncs;
-
-	/** @syncs: Pointer to struct drm_xe_sync array. */
-	__u64 syncs;
+	/** @syncs: syncs for exec */
+	struct drm_xe_syncs syncs;
 
 	/**
 	 * @address: address of batch buffer if num_batch_buffer == 1 or an
@@ -996,8 +1017,8 @@ struct drm_xe_exec {
 	 */
 	__u16 num_batch_buffer;
 
-	/** @pad: MBZ */
-	__u16 pad[3];
+	/** @pad2: MBZ */
+	__u16 pad2[3];
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
-- 
2.34.1

