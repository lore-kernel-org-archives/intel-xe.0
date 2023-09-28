Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1540CE7B1B
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 10:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910CB10E60D;
	Thu, 28 Sep 2023 10:59:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A58510E606
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 10:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695898758; x=1727434758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xlFlizABiquS3wlhsGrrsZa96ihXHPIKjt5dQfzAwI0=;
 b=QrPUqpWECvX1rgoP8bS7OgvBw9SuHNk+MkHuYJEtj5wAMlTPsbO0hJIf
 4fik4On1nZ4RlljTB0r2+rhRTeaB/k9E/tAt6NPH3WqYRhdUOlmmam2nf
 VMPZrYT2FElQCZwAG7GydKlwx/dj3WJLeWrWowRdIQxtLT7Gy88gEG9dA
 6ZsSBfM97BEx2YwgjlpLuHstolfeVHoI8KdFcX9znKhNtupP6JKoZ4UgW
 H3c0y7BMVbkvZeIhcCjwEOzqO0/XMuZP2Ae55TBWxwtMHIpH2grTBrGr9
 PnwebrmmXUKq8ec7ryN94pMBF4zle0TcX5sGyA/qX2OwXbrTdG0jKgncG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="640194"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="640194"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 03:59:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="923174484"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="923174484"
Received: from nsolmsdo-mobl.ger.corp.intel.com (HELO 8b338166fae8.intel.com)
 ([10.251.220.162])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 03:59:15 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 10:58:38 +0000
Message-Id: <20230928105843.7-16-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928105843.7-1-francois.dugast@intel.com>
References: <20230928105843.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 15/20] drm/xe: Fix VM bind out-sync signaling
 ordering
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

From: Matthew Brost <matthew.brost@intel.com>

A case existed where an out-sync of a later VM bind operation could
signal before a previous one if the later operation results in a NOP
(e.g. a unbind or prefetch to a VA range without any mappings). This
breaks the ordering rules, fix this. This patch also lays the groundwork
for users to pass in num_binds == 0 and out-syncs.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 75 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h       |  7 +++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 ++
 drivers/gpu/drm/xe/xe_vm.c               | 45 +++++++++++---
 4 files changed, 125 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index be3c8e6db088..dd61c4267e24 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -156,6 +156,7 @@ void xe_exec_queue_destroy(struct kref *ref)
 	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
 	struct xe_exec_queue *eq, *next;
 
+	xe_exec_queue_last_fence_put_unlocked(q);
 	if (!(q->flags & EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD)) {
 		list_for_each_entry_safe(eq, next, &q->multi_gt_list,
 					 multi_gt_link)
@@ -916,3 +917,77 @@ int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
 
 	return ret;
 }
+
+static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
+						    struct xe_vm *vm)
+{
+	lockdep_assert_held_write(&vm->lock);
+}
+
+/**
+ * xe_exec_queue_last_fence_put() - Drop ref to last fence
+ * @q: The exec queue
+ * @vm: The VM the engine does a bind or exec for
+ */
+void xe_exec_queue_last_fence_put(struct xe_exec_queue *q, struct xe_vm *vm)
+{
+	xe_exec_queue_last_fence_lockdep_assert(q, vm);
+
+	if (q->last_fence) {
+		dma_fence_put(q->last_fence);
+		q->last_fence = NULL;
+	}
+}
+
+/**
+ * xe_exec_queue_last_fence_put_unlocked() - Drop ref to last fence unlocked
+ * @q: The exec queue
+ *
+ * Only safe to be called from xe_exec_queue_destroy().
+ */
+void xe_exec_queue_last_fence_put_unlocked(struct xe_exec_queue *q)
+{
+	if (q->last_fence) {
+		dma_fence_put(q->last_fence);
+		q->last_fence = NULL;
+	}
+}
+
+/**
+ * xe_exec_queue_last_fence_get() - Get last fence
+ * @q: The exec queue
+ * @vm: The VM the engine does a bind or exec for
+ *
+ * Get last fence, does not take a ref
+ *
+ * Returns: last fence if not signaled, dma fence stub if signaled
+ */
+struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
+					       struct xe_vm *vm)
+{
+	xe_exec_queue_last_fence_lockdep_assert(q, vm);
+
+	if (q->last_fence &&
+	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
+		xe_exec_queue_last_fence_put(q, vm);
+
+	return q->last_fence ? q->last_fence : dma_fence_get_stub();
+}
+
+/**
+ * xe_exec_queue_last_fence_set() - Set last fence
+ * @q: The exec queue
+ * @vm: The VM the engine does a bind or exec for
+ * @fence: The fence
+ *
+ * Set the last fence for the engine. Increases reference count for fence, when
+ * closing engine xe_exec_queue_last_fence_put should be called.
+ */
+void xe_exec_queue_last_fence_set(struct xe_exec_queue *q, struct xe_vm *vm,
+				  struct dma_fence *fence)
+{
+	xe_exec_queue_last_fence_lockdep_assert(q, vm);
+
+	xe_exec_queue_last_fence_put(q, vm);
+	q->last_fence = dma_fence_get(fence);
+}
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index ce1ec2243b6a..59a54bfb9a8c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -61,4 +61,11 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
 				     struct drm_file *file);
 enum drm_sched_priority xe_exec_queue_device_get_max_priority(struct xe_device *xe);
 
+void xe_exec_queue_last_fence_put(struct xe_exec_queue *e, struct xe_vm *vm);
+void xe_exec_queue_last_fence_put_unlocked(struct xe_exec_queue *e);
+struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
+					       struct xe_vm *vm);
+void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
+				  struct dma_fence *fence);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index d0ab51acc651..ecd761177567 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -52,6 +52,12 @@ struct xe_exec_queue {
 	/** @fence_irq: fence IRQ used to signal job completion */
 	struct xe_hw_fence_irq *fence_irq;
 
+	/**
+	 * @last_fence: last fence on engine, protected by vm->lock in write
+	 * mode if bind engine
+	 */
+	struct dma_fence *last_fence;
+
 /* queue no longer allowed to submit */
 #define EXEC_QUEUE_FLAG_BANNED			BIT(0)
 /* queue used for kernel submission only */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index be716b5622b9..acf097c57259 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1384,6 +1384,13 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	if (xe_vm_in_compute_mode(vm))
 		flush_work(&vm->preempt.rebind_work);
 
+	down_write(&vm->lock);
+	for_each_tile(tile, xe, id) {
+		if (vm->q[id])
+			xe_exec_queue_last_fence_put(vm->q[id], vm);
+	}
+	up_write(&vm->lock);
+
 	for_each_tile(tile, xe, id) {
 		if (vm->q[id]) {
 			xe_exec_queue_kill(vm->q[id]);
@@ -1535,16 +1542,23 @@ u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
 			     XE_CACHE_WB);
 }
 
+static struct xe_exec_queue *
+to_wait_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
+{
+	return q ? q : vm->q[0];
+}
+
 static struct dma_fence *
 xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 		 struct xe_sync_entry *syncs, u32 num_syncs,
 		 bool first_op, bool last_op)
 {
+	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
 	struct xe_tile *tile;
 	struct dma_fence *fence = NULL;
 	struct dma_fence **fences = NULL;
 	struct dma_fence_array *cf = NULL;
-	struct xe_vm *vm = xe_vma_vm(vma);
 	int cur_fence = 0, i;
 	int number_tiles = hweight8(vma->tile_present);
 	int err;
@@ -1596,7 +1610,8 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 					     cf ? &cf->base : fence);
 	}
 
-	return cf ? &cf->base : !fence ? dma_fence_get_stub() : fence;
+	return cf ? &cf->base : !fence ?
+		xe_exec_queue_last_fence_get(wait_exec_queue, vm) : fence;
 
 err_fences:
 	if (fences) {
@@ -1695,6 +1710,7 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 			bool last_op)
 {
 	struct dma_fence *fence;
+	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
 
 	xe_vm_assert_held(vm);
 
@@ -1708,13 +1724,15 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 
 		xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
 
-		fence = dma_fence_get_stub();
+		fence = xe_exec_queue_last_fence_get(wait_exec_queue, vm);
 		if (last_op) {
 			for (i = 0; i < num_syncs; i++)
 				xe_sync_entry_signal(&syncs[i], NULL, fence);
 		}
 	}
 
+	if (last_op)
+		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
 	if (last_op && xe_vm_sync_mode(vm, q))
 		dma_fence_wait(fence, true);
 	dma_fence_put(fence);
@@ -1747,6 +1765,7 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 			u32 num_syncs, bool first_op, bool last_op)
 {
 	struct dma_fence *fence;
+	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
 
 	xe_vm_assert_held(vm);
 	xe_bo_assert_held(xe_vma_bo(vma));
@@ -1756,6 +1775,8 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 		return PTR_ERR(fence);
 
 	xe_vma_destroy(vma, fence);
+	if (last_op)
+		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
 	if (last_op && xe_vm_sync_mode(vm, q))
 		dma_fence_wait(fence, true);
 	dma_fence_put(fence);
@@ -1905,6 +1926,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 			  struct xe_sync_entry *syncs, u32 num_syncs,
 			  bool first_op, bool last_op)
 {
+	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
 	int err;
 
 	xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
@@ -1923,9 +1945,12 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 
 		/* Nothing to do, signal fences now */
 		if (last_op) {
-			for (i = 0; i < num_syncs; i++)
-				xe_sync_entry_signal(&syncs[i], NULL,
-						     dma_fence_get_stub());
+			for (i = 0; i < num_syncs; i++) {
+				struct dma_fence *fence =
+					xe_exec_queue_last_fence_get(wait_exec_queue, vm);
+
+				xe_sync_entry_signal(&syncs[i], NULL, fence);
+			}
 		}
 
 		return 0;
@@ -2979,8 +3004,12 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 unwind_ops:
 	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
 free_syncs:
-	for (i = 0; err == -ENODATA && i < num_syncs; i++)
-		xe_sync_entry_signal(&syncs[i], NULL, dma_fence_get_stub());
+	for (i = 0; err == -ENODATA && i < num_syncs; i++) {
+		struct dma_fence *fence =
+			xe_exec_queue_last_fence_get(to_wait_exec_queue(vm, q), vm);
+
+		xe_sync_entry_signal(&syncs[i], NULL, fence);
+	}
 	while (num_syncs--)
 		xe_sync_entry_cleanup(&syncs[num_syncs]);
 
-- 
2.34.1

