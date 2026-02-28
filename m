Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329E81048939
	for <intel-xe@archiver.kernel.org>; Sat, 28 Feb 2026 01:35:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E469110EC64;
	Sat, 28 Feb 2026 01:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ios8eo4w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7008E10E1DA
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Feb 2026 01:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772242511; x=1803778511;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VDIKCamQLm9t8fG6OXIGD7P4tME1ROQYj83lwl3GRaE=;
 b=Ios8eo4wCLdvRDW10yIUV2QBw+Bn8S5yxuts911LQGvcUi3s60jC4U/K
 /IjeD/qDG4ixzP6LeriHqysfV93p+3UsVHHeSeDGZ9xoVvxa24QLheCxy
 M8G3hOU2XaJL8aGS9ZdkN5q6diRAObsfm6zkRJwkwqOs5Ua+ZvJt4UyeR
 xy4OMI12dUOVSlIg5iuCNW4nrnyfWFpnC7NusObIfxAs/L0SpwGimY29T
 3VJpbCpmykMO2KsreFbHjpo5uADNvaXglb8YoJKuKXdP3zczo+IzXoSNR
 7vstfxMsnAcaDpg8IWFclEiiKGK0gfFXdaHRUnuMYioIdoysQInufUs+G Q==;
X-CSE-ConnectionGUID: iRL1w9DNQteV0qNJ9n/xDA==
X-CSE-MsgGUID: K6lKgxGzSH+ox7avxvWCsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="83966354"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="83966354"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:08 -0800
X-CSE-ConnectionGUID: mVpjYDdDSeGIh5QuBZIyhg==
X-CSE-MsgGUID: Pl9l4bHJTCyxGiyRkMx8TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="213854880"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v3 15/25] drm/xe: Make bind queues operate cross-tile
Date: Fri, 27 Feb 2026 17:34:51 -0800
Message-Id: <20260228013501.106680-16-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260228013501.106680-1-matthew.brost@intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
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

Since bind jobs execute on the CPU rather than the GPU, maintaining a
per-tile bind queue no longer provides value. Convert the driver to use
a single bind queue shared across tiles. The primary change is routing
all GT TLB invalidations through this unified bind queue.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 142 +++++++++--------------
 drivers/gpu/drm/xe/xe_exec_queue.h       |  14 +--
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  21 ++--
 drivers/gpu/drm/xe/xe_pt.c               |  22 ++--
 drivers/gpu/drm/xe/xe_sync.c             |  20 +---
 drivers/gpu/drm/xe/xe_tlb_inval_job.c    |  15 ++-
 drivers/gpu/drm/xe/xe_tlb_inval_job.h    |   2 +-
 drivers/gpu/drm/xe/xe_vm.c               |  65 +++++------
 drivers/gpu/drm/xe/xe_vm_types.h         |   2 +-
 9 files changed, 126 insertions(+), 177 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index b3f700a9d425..0201b8159e63 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -142,9 +142,8 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
 {
 	int i;
 
-	for (i = 0; i < XE_EXEC_QUEUE_TLB_INVAL_COUNT; ++i)
-		if (q->tlb_inval[i].dep_scheduler)
-			xe_dep_scheduler_fini(q->tlb_inval[i].dep_scheduler);
+	for_each_tlb_inval(q, i)
+		xe_dep_scheduler_fini(q->tlb_inval[i].dep_scheduler);
 
 	if (xe_exec_queue_uses_pxp(q))
 		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
@@ -166,31 +165,34 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
 
 static int alloc_dep_schedulers(struct xe_device *xe, struct xe_exec_queue *q)
 {
-	struct xe_tile *tile = gt_to_tile(q->gt);
-	int i;
+	struct xe_tile *tile;
+	int i = 0, j;
+	u8 id;
 
-	for (i = 0; i < XE_EXEC_QUEUE_TLB_INVAL_COUNT; ++i) {
-		struct xe_dep_scheduler *dep_scheduler;
-		struct xe_gt *gt;
-		struct workqueue_struct *wq;
+	for_each_tile(tile, xe, id) {
+		for (j = 0; j < (XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT + 1); ++j, ++i) {
+			struct xe_dep_scheduler *dep_scheduler;
+			struct xe_gt *gt;
+			struct workqueue_struct *wq;
 
-		if (i == XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT)
-			gt = tile->primary_gt;
-		else
-			gt = tile->media_gt;
+			if (j == XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT)
+				gt = tile->primary_gt;
+			else
+				gt = tile->media_gt;
 
-		if (!gt)
-			continue;
+			if (!gt)
+				continue;
 
-		wq = gt->tlb_inval.job_wq;
+			wq = gt->tlb_inval.job_wq;
 
 #define MAX_TLB_INVAL_JOBS	16	/* Picking a reasonable value */
-		dep_scheduler = xe_dep_scheduler_create(xe, wq, q->name,
-							MAX_TLB_INVAL_JOBS);
-		if (IS_ERR(dep_scheduler))
-			return PTR_ERR(dep_scheduler);
+			dep_scheduler = xe_dep_scheduler_create(xe, wq, q->name,
+								MAX_TLB_INVAL_JOBS);
+			if (IS_ERR(dep_scheduler))
+				return PTR_ERR(dep_scheduler);
 
-		q->tlb_inval[i].dep_scheduler = dep_scheduler;
+			q->tlb_inval[i].dep_scheduler = dep_scheduler;
+		}
 	}
 #undef MAX_TLB_INVAL_JOBS
 
@@ -227,7 +229,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->ops = gt->exec_queue_ops;
 	INIT_LIST_HEAD(&q->lr.link);
 	INIT_LIST_HEAD(&q->vm_exec_queue_link);
-	INIT_LIST_HEAD(&q->multi_gt_link);
 	INIT_LIST_HEAD(&q->hw_engine_group_link);
 	INIT_LIST_HEAD(&q->pxp.link);
 	spin_lock_init(&q->multi_queue.lock);
@@ -536,7 +537,6 @@ ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
 void xe_exec_queue_destroy(struct kref *ref)
 {
 	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
-	struct xe_exec_queue *eq, *next;
 	int i;
 
 	xe_assert(gt_to_xe(q->gt), atomic_read(&q->job_cnt) == 0);
@@ -548,15 +548,9 @@ void xe_exec_queue_destroy(struct kref *ref)
 		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
 
 	xe_exec_queue_last_fence_put_unlocked(q);
-	for_each_tlb_inval(i)
+	for_each_tlb_inval(q, i)
 		xe_exec_queue_tlb_inval_last_fence_put_unlocked(q, i);
 
-	if (!(q->flags & EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD)) {
-		list_for_each_entry_safe(eq, next, &q->multi_gt_list,
-					 multi_gt_link)
-			xe_exec_queue_put(eq);
-	}
-
 	if (q->user_vm) {
 		xe_vm_put(q->user_vm);
 		q->user_vm = NULL;
@@ -1159,7 +1153,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		u64_to_user_ptr(args->instances);
 	struct xe_hw_engine *hwe;
 	struct xe_vm *vm;
-	struct xe_tile *tile;
 	struct xe_exec_queue *q = NULL;
 	u32 logical_mask;
 	u32 flags = 0;
@@ -1208,31 +1201,16 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			return -ENOENT;
 		}
 
-		for_each_tile(tile, xe, id) {
-			struct xe_exec_queue *new;
-
-			flags |= EXEC_QUEUE_FLAG_VM;
-			if (id)
-				flags |= EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD;
-
-			new = xe_exec_queue_create_bind(xe, tile, vm, flags,
-							args->extensions);
-			if (IS_ERR(new)) {
-				up_read(&vm->lock);
-				xe_vm_put(vm);
-				err = PTR_ERR(new);
-				if (q)
-					goto put_exec_queue;
-				return err;
-			}
-			if (id == 0)
-				q = new;
-			else
-				list_add_tail(&new->multi_gt_list,
-					      &q->multi_gt_link);
-		}
+		flags |= EXEC_QUEUE_FLAG_VM;
+
+		q = xe_exec_queue_create_bind(xe, xe_device_get_root_tile(xe),
+					      vm, flags, args->extensions);
 		up_read(&vm->lock);
 		xe_vm_put(vm);
+		if (IS_ERR(q)) {
+			err = PTR_ERR(q);
+			return err;
+		}
 	} else {
 		logical_mask = calc_validate_logical_mask(xe, eci,
 							  args->width,
@@ -1436,14 +1414,6 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
  */
 void xe_exec_queue_kill(struct xe_exec_queue *q)
 {
-	struct xe_exec_queue *eq = q, *next;
-
-	list_for_each_entry_safe(eq, next, &eq->multi_gt_list,
-				 multi_gt_link) {
-		q->ops->kill(eq);
-		xe_vm_remove_compute_exec_queue(q->vm, eq);
-	}
-
 	q->ops->kill(q);
 	xe_vm_remove_compute_exec_queue(q->vm, q);
 }
@@ -1594,42 +1564,40 @@ void xe_exec_queue_last_fence_set(struct xe_exec_queue *q, struct xe_vm *vm,
  * xe_exec_queue_tlb_inval_last_fence_put() - Drop ref to last TLB invalidation fence
  * @q: The exec queue
  * @vm: The VM the engine does a bind for
- * @type: Either primary or media GT
+ * @idx: Index of tlb invalidation
  */
 void xe_exec_queue_tlb_inval_last_fence_put(struct xe_exec_queue *q,
 					    struct xe_vm *vm,
-					    unsigned int type)
+					    unsigned int idx)
 {
 	xe_exec_queue_last_fence_lockdep_assert(q, vm);
-	xe_assert(vm->xe, type == XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT ||
-		  type == XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
+	xe_assert(vm->xe, idx < XE_EXEC_QUEUE_TLB_INVAL_COUNT);
 
-	xe_exec_queue_tlb_inval_last_fence_put_unlocked(q, type);
+	xe_exec_queue_tlb_inval_last_fence_put_unlocked(q, idx);
 }
 
 /**
  * xe_exec_queue_tlb_inval_last_fence_put_unlocked() - Drop ref to last TLB
  * invalidation fence unlocked
  * @q: The exec queue
- * @type: Either primary or media GT
+ * @idx: Index of tlb invalidation
  *
  * Only safe to be called from xe_exec_queue_destroy().
  */
 void xe_exec_queue_tlb_inval_last_fence_put_unlocked(struct xe_exec_queue *q,
-						     unsigned int type)
+						     unsigned int idx)
 {
-	xe_assert(q->vm->xe, type == XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT ||
-		  type == XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
+	xe_assert(q->vm->xe, idx < XE_EXEC_QUEUE_TLB_INVAL_COUNT);
 
-	dma_fence_put(q->tlb_inval[type].last_fence);
-	q->tlb_inval[type].last_fence = NULL;
+	dma_fence_put(q->tlb_inval[idx].last_fence);
+	q->tlb_inval[idx].last_fence = NULL;
 }
 
 /**
  * xe_exec_queue_tlb_inval_last_fence_get() - Get last fence for TLB invalidation
  * @q: The exec queue
  * @vm: The VM the engine does a bind for
- * @type: Either primary or media GT
+ * @idx: Index of tlb invalidation
  *
  * Get last fence, takes a ref
  *
@@ -1637,22 +1605,21 @@ void xe_exec_queue_tlb_inval_last_fence_put_unlocked(struct xe_exec_queue *q,
  */
 struct dma_fence *xe_exec_queue_tlb_inval_last_fence_get(struct xe_exec_queue *q,
 							 struct xe_vm *vm,
-							 unsigned int type)
+							 unsigned int idx)
 {
 	struct dma_fence *fence;
 
 	xe_exec_queue_last_fence_lockdep_assert(q, vm);
-	xe_assert(vm->xe, type == XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT ||
-		  type == XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
+	xe_assert(vm->xe, idx < XE_EXEC_QUEUE_TLB_INVAL_COUNT);
 	xe_assert(vm->xe, q->flags & (EXEC_QUEUE_FLAG_VM |
 				      EXEC_QUEUE_FLAG_MIGRATE));
 
-	if (q->tlb_inval[type].last_fence &&
+	if (q->tlb_inval[idx].last_fence &&
 	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-		     &q->tlb_inval[type].last_fence->flags))
-		xe_exec_queue_tlb_inval_last_fence_put(q, vm, type);
+		     &q->tlb_inval[idx].last_fence->flags))
+		xe_exec_queue_tlb_inval_last_fence_put(q, vm, idx);
 
-	fence = q->tlb_inval[type].last_fence ?: dma_fence_get_stub();
+	fence = q->tlb_inval[idx].last_fence ?: dma_fence_get_stub();
 	dma_fence_get(fence);
 	return fence;
 }
@@ -1662,26 +1629,25 @@ struct dma_fence *xe_exec_queue_tlb_inval_last_fence_get(struct xe_exec_queue *q
  * @q: The exec queue
  * @vm: The VM the engine does a bind for
  * @fence: The fence
- * @type: Either primary or media GT
+ * @idx: Index of tlb invalidation
  *
- * Set the last fence for the tlb invalidation type on the queue. Increases
+ * Set the last fence for the tlb invalidation client on the queue. Increases
  * reference count for fence, when closing queue
  * xe_exec_queue_tlb_inval_last_fence_put should be called.
  */
 void xe_exec_queue_tlb_inval_last_fence_set(struct xe_exec_queue *q,
 					    struct xe_vm *vm,
 					    struct dma_fence *fence,
-					    unsigned int type)
+					    unsigned int idx)
 {
 	xe_exec_queue_last_fence_lockdep_assert(q, vm);
-	xe_assert(vm->xe, type == XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT ||
-		  type == XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
+	xe_assert(vm->xe, idx < XE_EXEC_QUEUE_TLB_INVAL_COUNT);
 	xe_assert(vm->xe, q->flags & (EXEC_QUEUE_FLAG_VM |
 				      EXEC_QUEUE_FLAG_MIGRATE));
 	xe_assert(vm->xe, !dma_fence_is_container(fence));
 
-	xe_exec_queue_tlb_inval_last_fence_put(q, vm, type);
-	q->tlb_inval[type].last_fence = dma_fence_get(fence);
+	xe_exec_queue_tlb_inval_last_fence_put(q, vm, idx);
+	q->tlb_inval[idx].last_fence = dma_fence_get(fence);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index a82d99bd77bc..b5aabab388c1 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -14,9 +14,9 @@ struct drm_file;
 struct xe_device;
 struct xe_file;
 
-#define for_each_tlb_inval(__i)	\
-	for (__i = XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT; \
-	     __i <= XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT; ++__i)
+#define for_each_tlb_inval(__q, __i)	\
+	for (__i = 0; __i < XE_EXEC_QUEUE_TLB_INVAL_COUNT; ++__i)	\
+		for_each_if((__q)->tlb_inval[__i].dep_scheduler)
 
 struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
 					   u32 logical_mask, u16 width,
@@ -141,19 +141,19 @@ void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
 
 void xe_exec_queue_tlb_inval_last_fence_put(struct xe_exec_queue *q,
 					    struct xe_vm *vm,
-					    unsigned int type);
+					    unsigned int idx);
 
 void xe_exec_queue_tlb_inval_last_fence_put_unlocked(struct xe_exec_queue *q,
-						     unsigned int type);
+						     unsigned int idx);
 
 struct dma_fence *xe_exec_queue_tlb_inval_last_fence_get(struct xe_exec_queue *q,
 							 struct xe_vm *vm,
-							 unsigned int type);
+							 unsigned int idx);
 
 void xe_exec_queue_tlb_inval_last_fence_set(struct xe_exec_queue *q,
 					    struct xe_vm *vm,
 					    struct dma_fence *fence,
-					    unsigned int type);
+					    unsigned int idx);
 
 void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index a1f3938f4173..d2a25db0a835 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -126,14 +126,12 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_PERMANENT		BIT(1)
 /* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
 #define EXEC_QUEUE_FLAG_VM			BIT(2)
-/* child of VM queue for multi-tile VM jobs */
-#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
 /* kernel exec_queue only, set priority to highest level */
-#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
+#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(3)
 /* flag to indicate low latency hint to guc */
-#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
+#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(4)
 /* for migration (kernel copy, clear, bind) jobs */
-#define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
+#define EXEC_QUEUE_FLAG_MIGRATE			BIT(5)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
@@ -141,13 +139,6 @@ struct xe_exec_queue {
 	 */
 	unsigned long flags;
 
-	union {
-		/** @multi_gt_list: list head for VM bind engines if multi-GT */
-		struct list_head multi_gt_list;
-		/** @multi_gt_link: link for VM bind engines if multi-GT */
-		struct list_head multi_gt_link;
-	};
-
 	union {
 		/** @execlist: execlist backend specific state for exec queue */
 		struct xe_execlist_exec_queue *execlist;
@@ -202,7 +193,8 @@ struct xe_exec_queue {
 
 #define XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT	0
 #define XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT	1
-#define XE_EXEC_QUEUE_TLB_INVAL_COUNT		(XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT  + 1)
+#define XE_EXEC_QUEUE_TLB_INVAL_COUNT	\
+	((XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT + 1) * 2)
 
 	/** @tlb_inval: TLB invalidations exec queue state */
 	struct {
@@ -213,7 +205,8 @@ struct xe_exec_queue {
 		struct xe_dep_scheduler *dep_scheduler;
 		/**
 		 * @last_fence: last fence for tlb invalidation, protected by
-		 * vm->lock in write mode
+		 * vm->lock in write mode to user queues, protected by
+		 * tile->m->lock for migration queues
 		 */
 		struct dma_fence *last_fence;
 	} tlb_inval[XE_EXEC_QUEUE_TLB_INVAL_COUNT];
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index ed7cb34c958c..032947a10806 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2510,12 +2510,18 @@ static const struct xe_migrate_pt_update_ops svm_userptr_migrate_ops;
 #endif
 
 static struct xe_dep_scheduler *to_dep_scheduler(struct xe_exec_queue *q,
-						 struct xe_gt *gt)
+						 struct xe_tile *tile,
+						 struct xe_gt *gt,
+						 unsigned int *type)
 {
+	int tile_ofs = tile->id * (XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT + 1);
+
 	if (xe_gt_is_media_type(gt))
-		return q->tlb_inval[XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT].dep_scheduler;
+		*type = tile_ofs + XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT;
+	else
+		*type = tile_ofs + XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT;
 
-	return q->tlb_inval[XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT].dep_scheduler;
+	return q->tlb_inval[*type].dep_scheduler;
 }
 
 /**
@@ -2540,6 +2546,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	struct xe_tlb_inval_job *ijob = NULL, *mjob = NULL;
 	struct xe_range_fence *rfence;
 	struct xe_vma_op *op;
+	unsigned int type;
 	int err = 0, i;
 	struct xe_migrate_pt_update update = {
 		.ops = pt_update_ops->needs_svm_lock ?
@@ -2566,13 +2573,13 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 	if (pt_update_ops->needs_invalidation) {
 		struct xe_dep_scheduler *dep_scheduler =
-			to_dep_scheduler(q, tile->primary_gt);
+			to_dep_scheduler(q, tile, tile->primary_gt, &type);
 
 		ijob = xe_tlb_inval_job_create(q, &tile->primary_gt->tlb_inval,
 					       dep_scheduler, vm,
 					       pt_update_ops->start,
 					       pt_update_ops->last,
-					       XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
+					       type);
 		if (IS_ERR(ijob)) {
 			err = PTR_ERR(ijob);
 			goto kill_vm_tile1;
@@ -2591,14 +2598,15 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 		}
 
 		if (tile->media_gt) {
-			dep_scheduler = to_dep_scheduler(q, tile->media_gt);
+			dep_scheduler = to_dep_scheduler(q, tile,
+							 tile->media_gt, &type);
 
 			mjob = xe_tlb_inval_job_create(q,
 						       &tile->media_gt->tlb_inval,
 						       dep_scheduler, vm,
 						       pt_update_ops->start,
 						       pt_update_ops->last,
-						       XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT);
+						       type);
 			if (IS_ERR(mjob)) {
 				err = PTR_ERR(mjob);
 				goto free_ijob;
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 24d6d9af20d6..8a0de78395f1 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -345,15 +345,9 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
 			return ERR_PTR(-EOPNOTSUPP);
 
 	if (q->flags & EXEC_QUEUE_FLAG_VM) {
-		struct xe_exec_queue *__q;
-		struct xe_tile *tile;
-		u8 id;
-
-		for_each_tile(tile, vm->xe, id) {
+		num_fence++;
+		for_each_tlb_inval(q, i)
 			num_fence++;
-			for_each_tlb_inval(i)
-				num_fence++;
-		}
 
 		fences = kmalloc_objs(*fences, num_fence);
 		if (!fences)
@@ -361,17 +355,9 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
 
 		fences[current_fence++] =
 			xe_exec_queue_last_fence_get(q, vm);
-		for_each_tlb_inval(i)
+		for_each_tlb_inval(q, i)
 			fences[current_fence++] =
 				xe_exec_queue_tlb_inval_last_fence_get(q, vm, i);
-		list_for_each_entry(__q, &q->multi_gt_list,
-				    multi_gt_link) {
-			fences[current_fence++] =
-				xe_exec_queue_last_fence_get(__q, vm);
-			for_each_tlb_inval(i)
-				fences[current_fence++] =
-					xe_exec_queue_tlb_inval_last_fence_get(__q, vm, i);
-		}
 
 		xe_assert(vm->xe, current_fence == num_fence);
 		cf = dma_fence_array_create(num_fence, fences,
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
index 04d21015cd5d..81f560068d3c 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
@@ -39,8 +39,8 @@ struct xe_tlb_inval_job {
 	u64 start;
 	/** @end: End address to invalidate */
 	u64 end;
-	/** @type: GT type */
-	int type;
+	/** @idx: Index of tlb invalidation */
+	int idx;
 	/** @fence_armed: Fence has been armed */
 	bool fence_armed;
 };
@@ -87,7 +87,7 @@ static const struct xe_dep_job_ops dep_job_ops = {
  * @vm: VM which TLB invalidation is being issued for
  * @start: Start address to invalidate
  * @end: End address to invalidate
- * @type: GT type
+ * @idx: Index of tlb invalidation
  *
  * Create a TLB invalidation job and initialize internal fields. The caller is
  * responsible for releasing the creation reference.
@@ -97,7 +97,7 @@ static const struct xe_dep_job_ops dep_job_ops = {
 struct xe_tlb_inval_job *
 xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
 			struct xe_dep_scheduler *dep_scheduler,
-			struct xe_vm *vm, u64 start, u64 end, int type)
+			struct xe_vm *vm, u64 start, u64 end, int idx)
 {
 	struct xe_tlb_inval_job *job;
 	struct drm_sched_entity *entity =
@@ -105,8 +105,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
 	struct xe_tlb_inval_fence *ifence;
 	int err;
 
-	xe_assert(vm->xe, type == XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT ||
-		  type == XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
+	xe_assert(vm->xe, idx < XE_EXEC_QUEUE_TLB_INVAL_COUNT);
 
 	job = kmalloc_obj(*job);
 	if (!job)
@@ -120,7 +119,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
 	job->fence_armed = false;
 	xe_page_reclaim_list_init(&job->prl);
 	job->dep.ops = &dep_job_ops;
-	job->type = type;
+	job->idx = idx;
 	kref_init(&job->refcount);
 	xe_exec_queue_get(q);	/* Pairs with put in xe_tlb_inval_job_destroy */
 	xe_vm_get(vm);		/* Pairs with put in xe_tlb_inval_job_destroy */
@@ -280,7 +279,7 @@ struct dma_fence *xe_tlb_inval_job_push(struct xe_tlb_inval_job *job,
 	/* Let the upper layers fish this out */
 	xe_exec_queue_tlb_inval_last_fence_set(job->q, job->vm,
 					       &job->dep.drm.s_fence->finished,
-					       job->type);
+					       job->idx);
 
 	xe_migrate_job_unlock(m, job->q);
 
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.h b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
index 03d6e21cd611..2a4478f529e6 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
@@ -20,7 +20,7 @@ struct xe_vm;
 struct xe_tlb_inval_job *
 xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
 			struct xe_dep_scheduler *dep_scheduler,
-			struct xe_vm *vm, u64 start, u64 end, int type);
+			struct xe_vm *vm, u64 start, u64 end, int idx);
 
 void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *job,
 				       struct xe_page_reclaim_list *prl);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 4ddfdd6a3c2a..52212b51caa8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1657,7 +1657,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 			struct xe_exec_queue *q;
 			u32 create_flags = EXEC_QUEUE_FLAG_VM;
 
-			if (!vm->pt_root[id])
+			if (!vm->pt_root[id] || vm->q)
 				continue;
 
 			if (!xef) /* Not from userspace */
@@ -1668,7 +1668,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 				err = PTR_ERR(q);
 				goto err_close;
 			}
-			vm->q[id] = q;
+			vm->q = q;
 		}
 	}
 
@@ -1775,24 +1775,18 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	if (xe_vm_in_fault_mode(vm))
 		xe_svm_close(vm);
 
-	down_write(&vm->lock);
-	for_each_tile(tile, xe, id) {
-		if (vm->q[id]) {
-			int i;
+	if (vm->q) {
+		int i;
 
-			xe_exec_queue_last_fence_put(vm->q[id], vm);
-			for_each_tlb_inval(i)
-				xe_exec_queue_tlb_inval_last_fence_put(vm->q[id], vm, i);
-		}
-	}
-	up_write(&vm->lock);
+		down_write(&vm->lock);
+		xe_exec_queue_last_fence_put(vm->q, vm);
+		for_each_tlb_inval(vm->q, i)
+			xe_exec_queue_tlb_inval_last_fence_put(vm->q, vm, i);
+		up_write(&vm->lock);
 
-	for_each_tile(tile, xe, id) {
-		if (vm->q[id]) {
-			xe_exec_queue_kill(vm->q[id]);
-			xe_exec_queue_put(vm->q[id]);
-			vm->q[id] = NULL;
-		}
+		xe_exec_queue_kill(vm->q);
+		xe_exec_queue_put(vm->q);
+		vm->q = NULL;
 	}
 
 	down_write(&vm->lock);
@@ -1924,7 +1918,7 @@ u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
 static struct xe_exec_queue *
 to_wait_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 {
-	return q ? q : vm->q[0];
+	return q ? q : vm->q;
 }
 
 static struct xe_user_fence *
@@ -3159,13 +3153,10 @@ static int vm_ops_setup_tile_args(struct xe_vm *vm, struct xe_vma_ops *vops)
 		if (vops->pt_update_ops[id].q)
 			continue;
 
-		if (q) {
+		if (q)
 			vops->pt_update_ops[id].q = q;
-			if (vm->pt_root[id] && !list_empty(&q->multi_gt_list))
-				q = list_next_entry(q, multi_gt_list);
-		} else {
-			vops->pt_update_ops[id].q = vm->q[id];
-		}
+		else
+			vops->pt_update_ops[id].q = vm->q;
 	}
 
 	return number_tiles;
@@ -3185,15 +3176,15 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 	if (number_tiles == 0)
 		return ERR_PTR(-ENODATA);
 
-	for_each_tile(tile, vm->xe, id) {
+	for_each_tile(tile, vm->xe, id)
 		++n_fence;
 
-		if (!(vops->flags & XE_VMA_OPS_FLAG_SKIP_TLB_WAIT))
-			for_each_tlb_inval(i)
-				++n_fence;
+	if (!(vops->flags & XE_VMA_OPS_FLAG_SKIP_TLB_WAIT)) {
+		for_each_tlb_inval(vops->pt_update_ops[0].q, i)
+			++n_fence;
 	}
 
-	fences = kmalloc_objs(*fences, n_fence);
+	fences = kcalloc(n_fence, sizeof(*fences), GFP_KERNEL);
 	if (!fences) {
 		fence = ERR_PTR(-ENOMEM);
 		goto err_trace;
@@ -3235,9 +3226,15 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 			continue;
 
 		xe_migrate_job_lock(tile->migrate, q);
-		for_each_tlb_inval(i)
-			fences[current_fence++] =
-				xe_exec_queue_tlb_inval_last_fence_get(q, vm, i);
+		for_each_tlb_inval(q, i) {
+			if (i >= (tile->id + 1) * XE_MAX_GT_PER_TILE ||
+			    i < tile->id * XE_MAX_GT_PER_TILE)
+				continue;
+
+			fences[current_fence++] = fence ?
+				xe_exec_queue_tlb_inval_last_fence_get(q, vm, i) :
+				dma_fence_get_stub();
+		}
 		xe_migrate_job_unlock(tile->migrate, q);
 	}
 
@@ -3746,7 +3743,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	syncs_user = u64_to_user_ptr(args->syncs);
 	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
-		struct xe_exec_queue *__q = q ?: vm->q[0];
+		struct xe_exec_queue *__q = q ?: vm->q;
 
 		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
 					  &syncs_user[num_syncs],
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 1f6f7e30e751..2c173550346a 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -209,7 +209,7 @@ struct xe_vm {
 	struct xe_device *xe;
 
 	/* exec queue used for (un)binding vma's */
-	struct xe_exec_queue *q[XE_MAX_TILES_PER_DEVICE];
+	struct xe_exec_queue *q;
 
 	/** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
 	struct ttm_lru_bulk_move lru_bulk_move;
-- 
2.34.1

