Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF1CC00528
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 01:40:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15B310E08B;
	Thu, 27 Jul 2023 01:40:07 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4B610E068
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 01:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690422005; x=1721958005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fSYBj8DNMLKnMOzFnNL3S1ju7ymYN3wScr5hoK3cKmY=;
 b=EjDjJvDf6/VaMsdcis9DZ/mV4SdbUgiqkOrECIPvDBRY8Te36EIHMWTJ
 CBPP0603E838IoHGjYF3vWAAqdNv4WTw9MGr3m7eKb2mgSV3clGZ4FFkT
 0zAgffEN3Cdo+JSrty4MnvGyq1hohobIT+qpl71uCe7oDeTj3DLJAN7WQ
 qi/oga3Bgco1O/W1Cl55MKqir6Si9S0ZaHdAtFBWikZAnz2r8hOzUWDWq
 +dMAydoWof5wde9afUjvaGmC4Io7lj3BVSDEqnttCQgYZkFsDEwxns52Q
 f9QOoV2LcH0SPtOSaw7C866FVXLlPvCU/OFsm9kbSWlHYz89fnAd7ZXm0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="371788085"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="371788085"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 18:40:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057459544"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="1057459544"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 18:40:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 26 Jul 2023 18:39:55 -0700
Message-Id: <20230727013958.456502-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230727013958.456502-1-matthew.brost@intel.com>
References: <20230727013958.456502-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/5] drm/xe: Fix VM bind out-sync signaling
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

A case existed where an out-sync of a later VM bind operation could
signal before a previous one if the later operation results in a NOP
(e.g. a unbind or prefetch to a VA range without any mappings). This
breaks the ordering rules, fix this. This patch also lays the groundwork
for users to pass in num_binds == 0 and out-syncs.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c       | 75 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_engine.h       |  7 +++
 drivers/gpu/drm/xe/xe_engine_types.h |  6 +++
 drivers/gpu/drm/xe/xe_vm.c           | 44 +++++++++++++---
 4 files changed, 124 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 1c6b84f32823..bef82b40a097 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -135,6 +135,7 @@ void xe_engine_destroy(struct kref *ref)
 	struct xe_engine *e = container_of(ref, struct xe_engine, refcount);
 	struct xe_engine *engine, *next;
 
+	xe_engine_last_fence_put_unlocked(e);
 	if (!(e->flags & ENGINE_FLAG_BIND_ENGINE_CHILD)) {
 		list_for_each_entry_safe(engine, next, &e->multi_gt_list,
 					 multi_gt_link)
@@ -834,3 +835,77 @@ int xe_engine_set_property_ioctl(struct drm_device *dev, void *data,
 
 	return ret;
 }
+
+static void xe_engine_last_fence_lockdep_assert(struct xe_engine *e,
+						struct xe_vm *vm)
+{
+	lockdep_assert_held_write(&vm->lock);
+}
+
+/**
+ * xe_engine_last_fence_put() - Drop ref to last fence
+ * @e: The engine
+ * @vm: The VM the engine does a bind or exec for
+ */
+void xe_engine_last_fence_put(struct xe_engine *e, struct xe_vm *vm)
+{
+	xe_engine_last_fence_lockdep_assert(e, vm);
+
+	if (e->last_fence) {
+		dma_fence_put(e->last_fence);
+		e->last_fence = NULL;
+	}
+}
+
+/**
+ * xe_engine_last_fence_put_unlocked() - Drop ref to last fence unlocked
+ * @e: The engine
+ *
+ * Only safe to be called from xe_engine_destroy().
+ */
+void xe_engine_last_fence_put_unlocked(struct xe_engine *e)
+{
+	if (e->last_fence) {
+		dma_fence_put(e->last_fence);
+		e->last_fence = NULL;
+	}
+}
+
+/**
+ * xe_engine_last_fence_get() - Get last fence
+ * @e: The engine
+ * @vm: The VM the engine does a bind or exec for
+ *
+ * Get last fence, does not take a ref
+ *
+ * Returns: last fence if not signaled, dma fence stub if signaled
+ */
+struct dma_fence *xe_engine_last_fence_get(struct xe_engine *e,
+					   struct xe_vm *vm)
+{
+	xe_engine_last_fence_lockdep_assert(e, vm);
+
+	if (e->last_fence &&
+	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &e->last_fence->flags))
+		xe_engine_last_fence_put(e, vm);
+
+	return e->last_fence ? e->last_fence : dma_fence_get_stub();
+}
+
+/**
+ * xe_engine_last_fence_set() - Set last fence
+ * @e: The engine
+ * @vm: The VM the engine does a bind or exec for
+ * @fence: The fence
+ *
+ * Set the last fence for the engine. Increases reference count for fence, when
+ * closing engine xe_engine_last_fence_put should be called.
+ */
+void xe_engine_last_fence_set(struct xe_engine *e, struct xe_vm *vm,
+			      struct dma_fence *fence)
+{
+	xe_engine_last_fence_lockdep_assert(e, vm);
+
+	xe_engine_last_fence_put(e, vm);
+	e->last_fence = dma_fence_get(fence);
+}
diff --git a/drivers/gpu/drm/xe/xe_engine.h b/drivers/gpu/drm/xe/xe_engine.h
index 2e60f6d90226..0aae12ed06ef 100644
--- a/drivers/gpu/drm/xe/xe_engine.h
+++ b/drivers/gpu/drm/xe/xe_engine.h
@@ -60,4 +60,11 @@ int xe_engine_get_property_ioctl(struct drm_device *dev, void *data,
 				 struct drm_file *file);
 enum drm_sched_priority xe_engine_device_get_max_priority(struct xe_device *xe);
 
+void xe_engine_last_fence_put(struct xe_engine *e, struct xe_vm *vm);
+void xe_engine_last_fence_put_unlocked(struct xe_engine *e);
+struct dma_fence *xe_engine_last_fence_get(struct xe_engine *e,
+					   struct xe_vm *vm);
+void xe_engine_last_fence_set(struct xe_engine *e, struct xe_vm *vm,
+			      struct dma_fence *fence);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_engine_types.h b/drivers/gpu/drm/xe/xe_engine_types.h
index 4949edfa0980..9ca19942d72b 100644
--- a/drivers/gpu/drm/xe/xe_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_engine_types.h
@@ -52,6 +52,12 @@ struct xe_engine {
 	/** @fence_irq: fence IRQ used to signal job completion */
 	struct xe_hw_fence_irq *fence_irq;
 
+	/**
+	 * @last_fence: last fence on engine, protected by vm->lock in write
+	 * mode if bind engine
+	 */
+	struct dma_fence *last_fence;
+
 #define ENGINE_FLAG_BANNED		BIT(0)
 #define ENGINE_FLAG_KERNEL		BIT(1)
 #define ENGINE_FLAG_PERSISTENT		BIT(2)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 77723f680f37..3e420b2c12b4 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1366,6 +1366,13 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	if (xe_vm_in_compute_mode(vm))
 		flush_work(&vm->preempt.rebind_work);
 
+	down_write(&vm->lock);
+	for_each_tile(tile, xe, id) {
+		if (vm->eng[id])
+			xe_engine_last_fence_put(vm->eng[id], vm);
+	}
+	up_write(&vm->lock);
+
 	for_each_tile(tile, xe, id) {
 		if (vm->eng[id]) {
 			xe_engine_kill(vm->eng[id]);
@@ -1518,16 +1525,22 @@ u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
 			     XE_CACHE_WB);
 }
 
+static struct xe_engine *to_wait_engine(struct xe_vm *vm, struct xe_engine *e)
+{
+	return e ? e : vm->eng[0];
+}
+
 static struct dma_fence *
 xe_vm_unbind_vma(struct xe_vma *vma, struct xe_engine *e,
 		 struct xe_sync_entry *syncs, u32 num_syncs,
 		 bool first_op, bool last_op)
 {
+	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_engine *wait_engine = to_wait_engine(vm, e);
 	struct xe_tile *tile;
 	struct dma_fence *fence = NULL;
 	struct dma_fence **fences = NULL;
 	struct dma_fence_array *cf = NULL;
-	struct xe_vm *vm = xe_vma_vm(vma);
 	int cur_fence = 0, i;
 	int number_tiles = hweight8(vma->tile_present);
 	int err;
@@ -1579,7 +1592,8 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_engine *e,
 					     cf ? &cf->base : fence);
 	}
 
-	return cf ? &cf->base : !fence ? dma_fence_get_stub() : fence;
+	return cf ? &cf->base : !fence ?
+		xe_engine_last_fence_get(wait_engine, vm) : fence;
 
 err_fences:
 	if (fences) {
@@ -1678,6 +1692,7 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 			bool last_op)
 {
 	struct dma_fence *fence;
+	struct xe_engine *wait_engine = to_wait_engine(vm, e);
 
 	xe_vm_assert_held(vm);
 
@@ -1691,13 +1706,15 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 
 		XE_BUG_ON(!xe_vm_in_fault_mode(vm));
 
-		fence = dma_fence_get_stub();
+		fence = xe_engine_last_fence_get(wait_engine, vm);
 		if (last_op) {
 			for (i = 0; i < num_syncs; i++)
 				xe_sync_entry_signal(&syncs[i], NULL, fence);
 		}
 	}
 
+	if (last_op)
+		xe_engine_last_fence_set(wait_engine, vm, fence);
 	if (last_op && xe_vm_sync_mode(vm, e))
 		dma_fence_wait(fence, true);
 	dma_fence_put(fence);
@@ -1730,6 +1747,7 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 			u32 num_syncs, bool first_op, bool last_op)
 {
 	struct dma_fence *fence;
+	struct xe_engine *wait_engine = to_wait_engine(vm, e);
 
 	xe_vm_assert_held(vm);
 	xe_bo_assert_held(xe_vma_bo(vma));
@@ -1739,6 +1757,8 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 		return PTR_ERR(fence);
 
 	xe_vma_destroy(vma, fence);
+	if (last_op)
+		xe_engine_last_fence_set(wait_engine, vm, fence);
 	if (last_op && xe_vm_sync_mode(vm, e))
 		dma_fence_wait(fence, true);
 	dma_fence_put(fence);
@@ -1875,6 +1895,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 			  struct xe_sync_entry *syncs, u32 num_syncs,
 			  bool first_op, bool last_op)
 {
+	struct xe_engine *wait_engine = to_wait_engine(vm, e);
 	int err;
 
 	XE_BUG_ON(region > ARRAY_SIZE(region_to_mem_type));
@@ -1893,9 +1914,12 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 
 		/* Nothing to do, signal fences now */
 		if (last_op) {
-			for (i = 0; i < num_syncs; i++)
-				xe_sync_entry_signal(&syncs[i], NULL,
-						     dma_fence_get_stub());
+			for (i = 0; i < num_syncs; i++) {
+				struct dma_fence *fence =
+					xe_engine_last_fence_get(wait_engine, vm);
+
+				xe_sync_entry_signal(&syncs[i], NULL, fence);
+			}
 		}
 
 		return 0;
@@ -3028,8 +3052,12 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 unwind_ops:
 	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
 free_syncs:
-	for (i = 0; err == -ENODATA && i < num_syncs; i++)
-		xe_sync_entry_signal(&syncs[i], NULL, dma_fence_get_stub());
+	for (i = 0; err == -ENODATA && i < num_syncs; i++) {
+		struct dma_fence *fence =
+			xe_engine_last_fence_get(to_wait_engine(vm, e), vm);
+
+		xe_sync_entry_signal(&syncs[i], NULL, fence);
+	}
 	while (num_syncs--)
 		xe_sync_entry_cleanup(&syncs[num_syncs]);
 
-- 
2.34.1

