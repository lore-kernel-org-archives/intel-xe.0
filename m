Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFE1C2FC0F
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 04:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1B610E138;
	Thu, 17 Aug 2023 04:31:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F1F10E138
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 04:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692246706; x=1723782706;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AjopCzVHAnVE0xcZmUxzfTPJrs5ys19uayAHu/E90/4=;
 b=XPnLLsFuY2dVq4zKbL3xq/zcS3DkN+2abnyr987m3Q0qBptaDvKkLRLH
 81XhlAupa2oaoF77bOnUFptb1CQ0YUWyJENGPDr0wKvt6Ky153O2DbfH6
 p2j1ao1SFcPyuN1dezt/+pDAyQqlc28YSrjStb0HfSnDp8vZ8lYaP40z7
 cM9YmItG9HREDQfV8wMx0H+EoaGtB262Q7VPCgpyht4FlDdpNUpeZRArj
 3X4KQp/a1LCjJ+jfYsHV7tzyquYwrCrD8FbhK0S4bsdUYRlpd4gy/5ZdG
 WpE7yb7kOxupYWi7j/yLYhfwPowqkBHJYNsyo4ayTwZdph5ahx08EZr2k Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371608921"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="371608921"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 21:31:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="799875029"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="799875029"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 21:31:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 16 Aug 2023 21:31:48 -0700
Message-Id: <20230817043148.740495-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817043148.740495-1-matthew.brost@intel.com>
References: <20230817043148.740495-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe: Fix array of binds
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

If multiple bind ops in an array of binds touch the same address range
invalid GPUVA operations are generated as each GPUVA operation is
generated based on the orignal GPUVA state. To fix this, after each
GPUVA operations is generated, commit the GPUVA operation updating the
GPUVA state so subsequent bind ops can see a current GPUVA state.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 418 +++++++++++++++++++------------------
 1 file changed, 212 insertions(+), 206 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index bd20840616ca..2452e24fbc81 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2426,24 +2426,73 @@ static u64 xe_vma_set_pte_size(struct xe_vma *vma, u64 size)
 	return SZ_4K;
 }
 
-/*
- * Parse operations list and create any resources needed for the operations
- * prior to fully committing to the operations. This setup can fail.
- */
+static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
+{
+	int err = 0;
+
+	lockdep_assert_held_write(&vm->lock);
+
+	switch (op->base.op) {
+	case DRM_GPUVA_OP_MAP:
+		err |= xe_vm_insert_vma(vm, op->map.vma);
+		if (!err)
+			op->flags |= XE_VMA_OP_COMMITTED;
+		break;
+	case DRM_GPUVA_OP_REMAP:
+		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
+				 true);
+		op->flags |= XE_VMA_OP_COMMITTED;
+
+		if (op->remap.prev) {
+			err |= xe_vm_insert_vma(vm, op->remap.prev);
+			if (!err)
+				op->flags |= XE_VMA_OP_PREV_COMMITTED;
+			if (!err && op->remap.skip_prev)
+				op->remap.prev = NULL;
+		}
+		if (op->remap.next) {
+			err |= xe_vm_insert_vma(vm, op->remap.next);
+			if (!err)
+				op->flags |= XE_VMA_OP_NEXT_COMMITTED;
+			if (!err && op->remap.skip_next)
+				op->remap.next = NULL;
+		}
+
+		/* Adjust for partial unbind after removin VMA from VM */
+		if (!err) {
+			op->base.remap.unmap->va->va.addr = op->remap.start;
+			op->base.remap.unmap->va->va.range = op->remap.range;
+		}
+		break;
+	case DRM_GPUVA_OP_UNMAP:
+		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
+		op->flags |= XE_VMA_OP_COMMITTED;
+		break;
+	case DRM_GPUVA_OP_PREFETCH:
+		op->flags |= XE_VMA_OP_COMMITTED;
+		break;
+	default:
+		XE_WARN_ON("NOT POSSIBLE");
+	}
+
+	return err;
+}
+
+
 static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
-				   struct drm_gpuva_ops **ops, int num_ops_list,
+				   struct drm_gpuva_ops *ops,
 				   struct xe_sync_entry *syncs, u32 num_syncs,
-				   struct list_head *ops_list, bool async)
+				   struct list_head *ops_list, bool last,
+				   bool async)
 {
 	struct xe_vma_op *last_op = NULL;
-	struct list_head *async_list = NULL;
 	struct async_op_fence *fence = NULL;
-	int err, i;
+	struct drm_gpuva_op *__op;
+	int err = 0;
 
 	lockdep_assert_held_write(&vm->lock);
-	XE_WARN_ON(num_ops_list > 1 && !async);
 
-	if (num_syncs && async) {
+	if (last && num_syncs && async) {
 		u64 seqno;
 
 		fence = kmalloc(sizeof(*fence), GFP_KERNEL);
@@ -2462,145 +2511,145 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 		}
 	}
 
-	for (i = 0; i < num_ops_list; ++i) {
-		struct drm_gpuva_ops *__ops = ops[i];
-		struct drm_gpuva_op *__op;
+	drm_gpuva_for_each_op(__op, ops) {
+		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
+		bool first = list_empty(ops_list);
 
-		drm_gpuva_for_each_op(__op, __ops) {
-			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
-			bool first = !async_list;
+		XE_WARN_ON(!first && !async);
+
+		INIT_LIST_HEAD(&op->link);
+		list_add_tail(&op->link, ops_list);
 
-			XE_WARN_ON(!first && !async);
+		if (first) {
+			op->flags |= XE_VMA_OP_FIRST;
+			op->num_syncs = num_syncs;
+			op->syncs = syncs;
+		}
 
-			INIT_LIST_HEAD(&op->link);
-			if (first)
-				async_list = ops_list;
-			list_add_tail(&op->link, async_list);
+		op->q = q;
+
+		switch (op->base.op) {
+		case DRM_GPUVA_OP_MAP:
+		{
+			struct xe_vma *vma;
 
-			if (first) {
-				op->flags |= XE_VMA_OP_FIRST;
-				op->num_syncs = num_syncs;
-				op->syncs = syncs;
+			vma = new_vma(vm, &op->base.map,
+				      op->tile_mask, op->map.read_only,
+				      op->map.is_null);
+			if (IS_ERR(vma)) {
+				err = PTR_ERR(vma);
+				goto free_fence;
 			}
 
-			op->q = q;
+			op->map.vma = vma;
+			break;
+		}
+		case DRM_GPUVA_OP_REMAP:
+		{
+			struct xe_vma *old =
+				gpuva_to_vma(op->base.remap.unmap->va);
 
-			switch (op->base.op) {
-			case DRM_GPUVA_OP_MAP:
-			{
-				struct xe_vma *vma;
+			op->remap.start = xe_vma_start(old);
+			op->remap.range = xe_vma_size(old);
 
-				vma = new_vma(vm, &op->base.map,
-					      op->tile_mask, op->map.read_only,
-					      op->map.is_null);
+			if (op->base.remap.prev) {
+				struct xe_vma *vma;
+				bool read_only =
+					op->base.remap.unmap->va->flags &
+					XE_VMA_READ_ONLY;
+				bool is_null =
+					op->base.remap.unmap->va->flags &
+					DRM_GPUVA_SPARSE;
+
+				vma = new_vma(vm, op->base.remap.prev,
+					      op->tile_mask, read_only,
+					      is_null);
 				if (IS_ERR(vma)) {
 					err = PTR_ERR(vma);
 					goto free_fence;
 				}
 
-				op->map.vma = vma;
-				break;
+				op->remap.prev = vma;
+
+				/*
+				 * Userptr creates a new SG mapping so
+				 * we must also rebind.
+				 */
+				op->remap.skip_prev = !xe_vma_is_userptr(old) &&
+					IS_ALIGNED(xe_vma_end(vma),
+						   xe_vma_max_pte_size(old));
+				if (op->remap.skip_prev) {
+					xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
+					op->remap.range -=
+						xe_vma_end(vma) -
+						xe_vma_start(old);
+					op->remap.start = xe_vma_end(vma);
+				}
 			}
-			case DRM_GPUVA_OP_REMAP:
-			{
-				struct xe_vma *old =
-					gpuva_to_vma(op->base.remap.unmap->va);
-
-				op->remap.start = xe_vma_start(old);
-				op->remap.range = xe_vma_size(old);
-
-				if (op->base.remap.prev) {
-					struct xe_vma *vma;
-					bool read_only =
-						op->base.remap.unmap->va->flags &
-						XE_VMA_READ_ONLY;
-					bool is_null =
-						op->base.remap.unmap->va->flags &
-						DRM_GPUVA_SPARSE;
-
-					vma = new_vma(vm, op->base.remap.prev,
-						      op->tile_mask, read_only,
-						      is_null);
-					if (IS_ERR(vma)) {
-						err = PTR_ERR(vma);
-						goto free_fence;
-					}
-
-					op->remap.prev = vma;
-
-					/*
-					 * Userptr creates a new SG mapping so
-					 * we must also rebind.
-					 */
-					op->remap.skip_prev = !xe_vma_is_userptr(old) &&
-						IS_ALIGNED(xe_vma_end(vma),
-							   xe_vma_max_pte_size(old));
-					if (op->remap.skip_prev) {
-						xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
-						op->remap.range -=
-							xe_vma_end(vma) -
-							xe_vma_start(old);
-						op->remap.start = xe_vma_end(vma);
-					}
+
+			if (op->base.remap.next) {
+				struct xe_vma *vma;
+				bool read_only =
+					op->base.remap.unmap->va->flags &
+					XE_VMA_READ_ONLY;
+
+				bool is_null =
+					op->base.remap.unmap->va->flags &
+					DRM_GPUVA_SPARSE;
+
+				vma = new_vma(vm, op->base.remap.next,
+					      op->tile_mask, read_only,
+					      is_null);
+				if (IS_ERR(vma)) {
+					err = PTR_ERR(vma);
+					goto free_fence;
 				}
 
-				if (op->base.remap.next) {
-					struct xe_vma *vma;
-					bool read_only =
-						op->base.remap.unmap->va->flags &
-						XE_VMA_READ_ONLY;
-
-					bool is_null =
-						op->base.remap.unmap->va->flags &
-						DRM_GPUVA_SPARSE;
-
-					vma = new_vma(vm, op->base.remap.next,
-						      op->tile_mask, read_only,
-						      is_null);
-					if (IS_ERR(vma)) {
-						err = PTR_ERR(vma);
-						goto free_fence;
-					}
-
-					op->remap.next = vma;
-
-					/*
-					 * Userptr creates a new SG mapping so
-					 * we must also rebind.
-					 */
-					op->remap.skip_next = !xe_vma_is_userptr(old) &&
-						IS_ALIGNED(xe_vma_start(vma),
-							   xe_vma_max_pte_size(old));
-					if (op->remap.skip_next) {
-						xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
-						op->remap.range -=
-							xe_vma_end(old) -
-							xe_vma_start(vma);
-					}
+				op->remap.next = vma;
+
+				/*
+				 * Userptr creates a new SG mapping so
+				 * we must also rebind.
+				 */
+				op->remap.skip_next = !xe_vma_is_userptr(old) &&
+					IS_ALIGNED(xe_vma_start(vma),
+						   xe_vma_max_pte_size(old));
+				if (op->remap.skip_next) {
+					xe_vma_set_pte_size(vma, xe_vma_max_pte_size(old));
+					op->remap.range -=
+						xe_vma_end(old) -
+						xe_vma_start(vma);
 				}
-				break;
-			}
-			case DRM_GPUVA_OP_UNMAP:
-			case DRM_GPUVA_OP_PREFETCH:
-				/* Nothing to do */
-				break;
-			default:
-				XE_WARN_ON("NOT POSSIBLE");
 			}
-
-			last_op = op;
+			break;
+		}
+		case DRM_GPUVA_OP_UNMAP:
+		case DRM_GPUVA_OP_PREFETCH:
+			/* Nothing to do */
+			break;
+		default:
+			XE_WARN_ON("NOT POSSIBLE");
 		}
 
-		last_op->ops = __ops;
+		last_op = op;
+
+		err = xe_vma_op_commit(vm, op);
+		if (err)
+			goto free_fence;
 	}
 
-	if (!last_op)
-		return -ENODATA;
+	/* FIXME: Unhandled corner case */
+	XE_WARN_ON(!last_op && last && !list_empty(ops_list));
 
-	last_op->flags |= XE_VMA_OP_LAST;
-	last_op->num_syncs = num_syncs;
-	last_op->syncs = syncs;
-	last_op->fence = fence;
+	if (!last_op)
+		goto free_fence;
+	last_op->ops = ops;
+	if (last) {
+		last_op->flags |= XE_VMA_OP_LAST;
+		last_op->num_syncs = num_syncs;
+		last_op->syncs = syncs;
+		last_op->fence = fence;
+	}
 
 	return 0;
 
@@ -2609,58 +2658,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 	return err;
 }
 
-static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
-{
-	int err = 0;
-
-	lockdep_assert_held_write(&vm->lock);
-
-	switch (op->base.op) {
-	case DRM_GPUVA_OP_MAP:
-		err |= xe_vm_insert_vma(vm, op->map.vma);
-		if (!err)
-			op->flags |= XE_VMA_OP_COMMITTED;
-		break;
-	case DRM_GPUVA_OP_REMAP:
-		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
-				 true);
-		op->flags |= XE_VMA_OP_COMMITTED;
-
-		if (op->remap.prev) {
-			err |= xe_vm_insert_vma(vm, op->remap.prev);
-			if (!err)
-				op->flags |= XE_VMA_OP_PREV_COMMITTED;
-			if (!err && op->remap.skip_prev)
-				op->remap.prev = NULL;
-		}
-		if (op->remap.next) {
-			err |= xe_vm_insert_vma(vm, op->remap.next);
-			if (!err)
-				op->flags |= XE_VMA_OP_NEXT_COMMITTED;
-			if (!err && op->remap.skip_next)
-				op->remap.next = NULL;
-		}
-
-		/* Adjust for partial unbind after removin VMA from VM */
-		if (!err) {
-			op->base.remap.unmap->va->va.addr = op->remap.start;
-			op->base.remap.unmap->va->va.range = op->remap.range;
-		}
-		break;
-	case DRM_GPUVA_OP_UNMAP:
-		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
-		op->flags |= XE_VMA_OP_COMMITTED;
-		break;
-	case DRM_GPUVA_OP_PREFETCH:
-		op->flags |= XE_VMA_OP_COMMITTED;
-		break;
-	default:
-		XE_WARN_ON("NOT POSSIBLE");
-	}
-
-	return err;
-}
-
 static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
 			       struct xe_vma_op *op)
 {
@@ -2878,11 +2875,13 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 	{
 		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
 
-		down_read(&vm->userptr.notifier_lock);
-		vma->gpuva.flags &= ~XE_VMA_DESTROYED;
-		up_read(&vm->userptr.notifier_lock);
-		if (post_commit)
-			xe_vm_insert_vma(vm, vma);
+		if (vma) {
+			down_read(&vm->userptr.notifier_lock);
+			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
+			up_read(&vm->userptr.notifier_lock);
+			if (post_commit)
+				xe_vm_insert_vma(vm, vma);
+		}
 		break;
 	}
 	case DRM_GPUVA_OP_REMAP:
@@ -2897,11 +2896,13 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 			prep_vma_destroy(vm, op->remap.next, next_post_commit);
 			xe_vma_destroy_unlocked(op->remap.next);
 		}
-		down_read(&vm->userptr.notifier_lock);
-		vma->gpuva.flags &= ~XE_VMA_DESTROYED;
-		up_read(&vm->userptr.notifier_lock);
-		if (post_commit)
-			xe_vm_insert_vma(vm, vma);
+		if (vma) {
+			down_read(&vm->userptr.notifier_lock);
+			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
+			up_read(&vm->userptr.notifier_lock);
+			if (post_commit)
+				xe_vm_insert_vma(vm, vma);
+		}
 		break;
 	}
 	case DRM_GPUVA_OP_PREFETCH:
@@ -2990,20 +2991,16 @@ static void xe_vma_op_work_func(struct work_struct *w)
 	}
 }
 
-static int vm_bind_ioctl_ops_commit(struct xe_vm *vm,
-				    struct list_head *ops_list, bool async)
+static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
+				     struct list_head *ops_list, bool async)
 {
 	struct xe_vma_op *op, *last_op, *next;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
 
-	list_for_each_entry(op, ops_list, link) {
+	list_for_each_entry(op, ops_list, link)
 		last_op = op;
-		err = xe_vma_op_commit(vm, op);
-		if (err)
-			goto unwind;
-	}
 
 	if (!async) {
 		err = xe_vma_op_execute(vm, last_op);
@@ -3042,28 +3039,29 @@ static int vm_bind_ioctl_ops_commit(struct xe_vm *vm,
 	return err;
 }
 
-/*
- * Unwind operations list, called after a failure of vm_bind_ioctl_ops_create or
- * vm_bind_ioctl_ops_parse.
- */
 static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 				     struct drm_gpuva_ops **ops,
 				     int num_ops_list)
 {
 	int i;
 
-	for (i = 0; i < num_ops_list; ++i) {
+	for (i = num_ops_list - 1; i; ++i) {
 		struct drm_gpuva_ops *__ops = ops[i];
 		struct drm_gpuva_op *__op;
 
 		if (!__ops)
 			continue;
 
-		drm_gpuva_for_each_op(__op, __ops) {
+		drm_gpuva_for_each_op_reverse(__op, __ops) {
 			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 
-			xe_vma_op_unwind(vm, op, false, false, false);
+			xe_vma_op_unwind(vm, op,
+					 op->flags & XE_VMA_OP_COMMITTED,
+					 op->flags & XE_VMA_OP_PREV_COMMITTED,
+					 op->flags & XE_VMA_OP_NEXT_COMMITTED);
 		}
+
+		drm_gpuva_ops_free(&vm->mgr, __ops);
 	}
 }
 
@@ -3384,14 +3382,22 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			ops[i] = NULL;
 			goto unwind_ops;
 		}
+
+		err = vm_bind_ioctl_ops_parse(vm, q, ops[i], syncs, num_syncs,
+					      &ops_list,
+					      i == args->num_binds - 1,
+					      async);
+		if (err)
+			goto unwind_ops;
 	}
 
-	err = vm_bind_ioctl_ops_parse(vm, q, ops, args->num_binds,
-				      syncs, num_syncs, &ops_list, async);
-	if (err)
+	/* Nothing to do */
+	if (list_empty(&ops_list)) {
+		err = -ENODATA;
 		goto unwind_ops;
+	}
 
-	err = vm_bind_ioctl_ops_commit(vm, &ops_list, async);
+	err = vm_bind_ioctl_ops_execute(vm, &ops_list, async);
 	up_write(&vm->lock);
 
 	for (i = 0; i < args->num_binds; ++i)
-- 
2.34.1

