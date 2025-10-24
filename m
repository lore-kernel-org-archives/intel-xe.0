Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761CCCCF9E0
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 22:20:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CE210EB43;
	Fri, 24 Oct 2025 22:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bPOGP7rj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84CF10EB43
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 22:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761344452; x=1792880452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CIDHY9ceRVzFVJOSXWDSKCsk4wlczXxtIYqWfmVYspA=;
 b=bPOGP7rjK7A8z9lc5gnz6l6K4A+hSHefQaAqAZgr0mYOLBEu0WOM7sWx
 h59Gx69WDo5bBMHpKA1SOp7AUEZIRWqsIl/u34a6/bfA16O32ANgoW9Tl
 2ASYuOzwHaNxwrn2VfERZwLZ0X512nPkzkdzBkEqLk1Li7nfmiQNi8tcX
 S9wv+Opz2dW1Jel0lMNPRGWdT6d3dW18QaSa2vDzZKCX0kjerdm6MQA+l
 0XZns6bW2pKlSor1ZdMhVKtW+JoMQgiGTC0TWfX8muA3JD5XdRM7EV8tP
 67cEdhrb84RXGf88ScRGPuZBVxyNhaGjnTwJ5fS8u5q8gbVDg2s2YO6LY w==;
X-CSE-ConnectionGUID: wBsHWDHWTMKec10tjCrH4A==
X-CSE-MsgGUID: ve73DVhKTZG473Or4ryj0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74874633"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="74874633"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 15:20:51 -0700
X-CSE-ConnectionGUID: Y8sO2wAIQbqERRsCn3MNNQ==
X-CSE-MsgGUID: /wicPdHJQxu5aaZuAKiIdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="184241682"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 15:20:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [PATCH v3 1/2] drm/xe: Add last fence attachment to TLB invalidation
 job queues
Date: Fri, 24 Oct 2025 15:20:46 -0700
Message-Id: <20251024222047.1481039-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024222047.1481039-1-matthew.brost@intel.com>
References: <20251024222047.1481039-1-matthew.brost@intel.com>
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

To address serialization issues with bursts of unbind jobs, this patch
adds support for attaching the last fence to TLB invalidation job
queues. The idea is that user fence signaling for a bind job reflects
both the bind job itself and the last fences of all related TLB
invalidations. The submission order of bind jobs and TLB invalidations
depends solely on the state of their respective queues.

This patch only introduces support functions for last fence attachment
to TLB invalidation queues.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

---
v3:
 - Fix assert in xe_exec_queue_tlb_inval_last_fence_set (CI)
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 102 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h       |  18 ++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   5 ++
 drivers/gpu/drm/xe/xe_vm.c               |   7 +-
 4 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 90cbc95f8e2e..036640916f97 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -376,11 +376,15 @@ void xe_exec_queue_destroy(struct kref *ref)
 {
 	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
 	struct xe_exec_queue *eq, *next;
+	int i;
 
 	if (xe_exec_queue_uses_pxp(q))
 		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
 
 	xe_exec_queue_last_fence_put_unlocked(q);
+	for_each_tlb_inval(i)
+		xe_exec_queue_tlb_inval_last_fence_put_unlocked(q, i);
+
 	if (!(q->flags & EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD)) {
 		list_for_each_entry_safe(eq, next, &q->multi_gt_list,
 					 multi_gt_link)
@@ -1125,6 +1129,104 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
 	return err;
 }
 
+/**
+ * xe_exec_queue_tlb_inval_last_fence_put() - Drop ref to last TLB invalidation fence
+ * @q: The exec queue
+ * @vm: The VM the engine does a bind for
+ * @type: Either primary or media GT
+ */
+void xe_exec_queue_tlb_inval_last_fence_put(struct xe_exec_queue *q,
+					    struct xe_vm *vm,
+					    unsigned int type)
+{
+	xe_exec_queue_last_fence_lockdep_assert(q, vm);
+	xe_assert(vm->xe, type == XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT ||
+		  type == XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
+
+	xe_exec_queue_tlb_inval_last_fence_put_unlocked(q, type);
+}
+
+/**
+ * xe_exec_queue_tlb_inval_last_fence_put_unlocked() - Drop ref to last TLB
+ * invalidation fence unlocked
+ * @q: The exec queue
+ * @type: Either primary or media GT
+ *
+ * Only safe to be called from xe_exec_queue_destroy().
+ */
+void xe_exec_queue_tlb_inval_last_fence_put_unlocked(struct xe_exec_queue *q,
+						     unsigned int type)
+{
+	xe_assert(q->vm->xe, type == XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT ||
+		  type == XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
+
+	if (q->tlb_inval[type].last_fence) {
+		dma_fence_put(q->tlb_inval[type].last_fence);
+		q->tlb_inval[type].last_fence = NULL;
+	}
+}
+
+/**
+ * xe_exec_queue_tlb_inval_last_fence_get() - Get last fence for TLB invalidation
+ * @q: The exec queue
+ * @vm: The VM the engine does a bind for
+ * @type: Either primary or media GT
+ *
+ * Get last fence, takes a ref
+ *
+ * Returns: last fence if not signaled, dma fence stub if signaled
+ */
+struct dma_fence *xe_exec_queue_tlb_inval_last_fence_get(struct xe_exec_queue *q,
+							 struct xe_vm *vm,
+							 unsigned int type)
+{
+	struct dma_fence *fence;
+
+	xe_exec_queue_last_fence_lockdep_assert(q, vm);
+	xe_assert(vm->xe, type == XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT ||
+		  type == XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
+	xe_assert(vm->xe, q->flags & (EXEC_QUEUE_FLAG_VM |
+				      EXEC_QUEUE_FLAG_MIGRATE));
+
+	if (q->tlb_inval[type].last_fence &&
+	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
+		     &q->tlb_inval[type].last_fence->flags))
+		xe_exec_queue_tlb_inval_last_fence_put(q, vm, type);
+
+	fence = q->tlb_inval[type].last_fence ?: dma_fence_get_stub();
+	dma_fence_get(fence);
+	return fence;
+}
+
+/**
+ * xe_exec_queue_tlb_inval_last_fence_set() - Set last fence for TLB invalidation
+ * @q: The exec queue
+ * @vm: The VM the engine does a bind for
+ * @fence: The fence
+ * @type: Either primary or media GT
+ *
+ * Set the last fence for the tlb invalidation type on the queue. Increases
+ * reference count for fence, when closing queue
+ * xe_exec_queue_tlb_inval_last_fence_put should be called.
+ */
+void xe_exec_queue_tlb_inval_last_fence_set(struct xe_exec_queue *q,
+					    struct xe_vm *vm,
+					    struct dma_fence *fence,
+					    unsigned int type)
+{
+	xe_exec_queue_last_fence_lockdep_assert(q, vm);
+	xe_assert(vm->xe, type == XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT ||
+		  type == XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT);
+	xe_assert(vm->xe, q->flags & (EXEC_QUEUE_FLAG_VM |
+				      EXEC_QUEUE_FLAG_MIGRATE));
+
+	if (!fence)
+		return;
+
+	xe_exec_queue_tlb_inval_last_fence_put(q, vm, type);
+	q->tlb_inval[type].last_fence = dma_fence_get(fence);
+}
+
 /**
  * xe_exec_queue_contexts_hwsp_rebase - Re-compute GGTT references
  * within all LRCs of a queue.
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index a4dfbe858bda..c4b95fad93f1 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -14,6 +14,10 @@ struct drm_file;
 struct xe_device;
 struct xe_file;
 
+#define for_each_tlb_inval(__i)	\
+	for (__i = XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT; \
+	     __i <= XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT; ++__i)
+
 struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *vm,
 					   u32 logical_mask, u16 width,
 					   struct xe_hw_engine *hw_engine, u32 flags,
@@ -86,6 +90,20 @@ void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
 				  struct dma_fence *fence);
 int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
 				      struct xe_vm *vm);
+
+void xe_exec_queue_tlb_inval_last_fence_put(struct xe_exec_queue *q,
+					    struct xe_vm *vm,
+					    unsigned int type);
+void xe_exec_queue_tlb_inval_last_fence_put_unlocked(struct xe_exec_queue *q,
+						     unsigned int type);
+struct dma_fence *xe_exec_queue_tlb_inval_last_fence_get(struct xe_exec_queue *q,
+							 struct xe_vm *vm,
+							 unsigned int type);
+void xe_exec_queue_tlb_inval_last_fence_set(struct xe_exec_queue *q,
+					    struct xe_vm *vm,
+					    struct dma_fence *fence,
+					    unsigned int type);
+
 void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
 
 int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 282505fa1377..b4185fee54e1 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -145,6 +145,11 @@ struct xe_exec_queue {
 		 * dependency scheduler
 		 */
 		struct xe_dep_scheduler *dep_scheduler;
+		/**
+		 * @last_fence: last fence for tlb invalidation, protected by
+		 * vm->lock in write mode
+		 */
+		struct dma_fence *last_fence;
 	} tlb_inval[XE_EXEC_QUEUE_TLB_INVAL_COUNT];
 
 	/** @pxp: PXP info tracking */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 10d77666a425..d2a2f823f1b3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1731,8 +1731,13 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 
 	down_write(&vm->lock);
 	for_each_tile(tile, xe, id) {
-		if (vm->q[id])
+		if (vm->q[id]) {
+			int i;
+
 			xe_exec_queue_last_fence_put(vm->q[id], vm);
+			for_each_tlb_inval(i)
+				xe_exec_queue_tlb_inval_last_fence_put(vm->q[id], vm, i);
+		}
 	}
 	up_write(&vm->lock);
 
-- 
2.34.1

