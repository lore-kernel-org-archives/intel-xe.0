Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A01CCF9EE
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 20:57:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB8E10E849;
	Wed, 29 Oct 2025 20:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jjQJWGns";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DF110E848
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 20:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761771445; x=1793307445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=haWBebx3yNg91cYc+RHi2KVxZ+h7Uy5+tli2Mfta5IY=;
 b=jjQJWGnsZ9F8uaw7o/qSn9e6BnXmCKiU8iq/tuakwcCsvpnWUcaSgLaf
 fk9LG6fIJIWAycBXKhNQriK9XL/BhhuivCNxcy/c68/YJggR/nqE1MdRM
 Va++s/YPy8jdkturOPjWP3g/0q986HEt4jr0gBYoHBPnUe/U/D+qrjrSp
 Rh3sN9d2EWV0SZHeML/B3Wc1kcikFun2t/TFCbz4huOAPvFkNztH4wtzo
 7N2ZkvfwqQmQ6E+jpeuz3y4s2YgXK+f3zBB9VGJIYBwkoX1y9yTzW1cGk
 5E/q5rBcDL4eKEAYOWrMepV3Xc5PvDm/I2f9AhZR0nLcuzuD/ibljm5o/ Q==;
X-CSE-ConnectionGUID: jF5ROTBPSfSMmtXdSNGwhA==
X-CSE-MsgGUID: UvZq0fF0TeK/Uwyi1wraxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="86533175"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="86533175"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:57:24 -0700
X-CSE-ConnectionGUID: XgOVKEctTWmnyIyy2hvjdQ==
X-CSE-MsgGUID: xZ8b58HARceJCbapPxAX9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="190128885"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:57:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [PATCH v5 2/6] drm/xe: Attach last fence to TLB invalidation job
 queues
Date: Wed, 29 Oct 2025 13:57:15 -0700
Message-Id: <20251029205719.2746501-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251029205719.2746501-1-matthew.brost@intel.com>
References: <20251029205719.2746501-1-matthew.brost@intel.com>
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

Add support for attaching the last fence to TLB invalidation job queues
to address serialization issues during bursts of unbind jobs. Ensure
that user fence signaling for a bind job reflects both the bind job
itself and the last fences of all related TLB invalidations. Maintain
submission order based solely on the state of the bind and TLB
invalidation queues.

Introduce support functions for last fence attachment to TLB
invalidation queues.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

---
v3:
 - Fix assert in xe_exec_queue_tlb_inval_last_fence_set (CI)
 - Ensure migrate lock held for migrate queues (Testing)
v5:
 - Style nits (Thomas)
 - Rewrite commit message (Thomas)
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 103 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h       |  21 +++++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   5 ++
 drivers/gpu/drm/xe/xe_migrate.c          |  14 +++
 drivers/gpu/drm/xe/xe_migrate.h          |   8 ++
 drivers/gpu/drm/xe/xe_vm.c               |   7 +-
 6 files changed, 156 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6e168efbac65..b7551592fe3f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -386,6 +386,7 @@ void xe_exec_queue_destroy(struct kref *ref)
 {
 	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
 	struct xe_exec_queue *eq, *next;
+	int i;
 
 	if (q->ufence_syncobj)
 		drm_syncobj_put(q->ufence_syncobj);
@@ -394,6 +395,9 @@ void xe_exec_queue_destroy(struct kref *ref)
 		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
 
 	xe_exec_queue_last_fence_put_unlocked(q);
+	for_each_tlb_inval(i)
+		xe_exec_queue_tlb_inval_last_fence_put_unlocked(q, i);
+
 	if (!(q->flags & EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD)) {
 		list_for_each_entry_safe(eq, next, &q->multi_gt_list,
 					 multi_gt_link)
@@ -1011,7 +1015,9 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
 						    struct xe_vm *vm)
 {
-	if (q->flags & EXEC_QUEUE_FLAG_VM) {
+	if (q->flags & EXEC_QUEUE_FLAG_MIGRATE) {
+		xe_migrate_job_lock_assert(q);
+	} else if (q->flags & EXEC_QUEUE_FLAG_VM) {
 		lockdep_assert_held(&vm->lock);
 	} else {
 		xe_vm_assert_held(vm);
@@ -1110,6 +1116,7 @@ void xe_exec_queue_last_fence_set(struct xe_exec_queue *q, struct xe_vm *vm,
 				  struct dma_fence *fence)
 {
 	xe_exec_queue_last_fence_lockdep_assert(q, vm);
+	xe_assert(vm->xe, !dma_fence_is_container(fence));
 
 	xe_exec_queue_last_fence_put(q, vm);
 	q->last_fence = dma_fence_get(fence);
@@ -1138,6 +1145,100 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
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
+	dma_fence_put(q->tlb_inval[type].last_fence);
+	q->tlb_inval[type].last_fence = NULL;
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
+	xe_assert(vm->xe, !dma_fence_is_container(fence));
+
+	xe_exec_queue_tlb_inval_last_fence_put(q, vm, type);
+	q->tlb_inval[type].last_fence = dma_fence_get(fence);
+}
+
 /**
  * xe_exec_queue_contexts_hwsp_rebase - Re-compute GGTT references
  * within all LRCs of a queue.
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index a4dfbe858bda..1ba7354b33d1 100644
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
@@ -86,6 +90,23 @@ void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
 				  struct dma_fence *fence);
 int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
 				      struct xe_vm *vm);
+
+void xe_exec_queue_tlb_inval_last_fence_put(struct xe_exec_queue *q,
+					    struct xe_vm *vm,
+					    unsigned int type);
+
+void xe_exec_queue_tlb_inval_last_fence_put_unlocked(struct xe_exec_queue *q,
+						     unsigned int type);
+
+struct dma_fence *xe_exec_queue_tlb_inval_last_fence_get(struct xe_exec_queue *q,
+							 struct xe_vm *vm,
+							 unsigned int type);
+
+void xe_exec_queue_tlb_inval_last_fence_set(struct xe_exec_queue *q,
+					    struct xe_vm *vm,
+					    struct dma_fence *fence,
+					    unsigned int type);
+
 void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
 
 int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 838266c3914b..4ef61e803676 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -146,6 +146,11 @@ struct xe_exec_queue {
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
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 921c9c1ea41f..4567bc88a8ec 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2333,6 +2333,20 @@ void xe_migrate_job_unlock(struct xe_migrate *m, struct xe_exec_queue *q)
 		xe_vm_assert_held(q->vm);	/* User queues VM's should be locked */
 }
 
+#if IS_ENABLED(CONFIG_PROVE_LOCKING)
+/**
+ * xe_migrate_job_lock_assert() - Assert migrate job lock held of queue
+ * @q: Migrate queue
+ */
+void xe_migrate_job_lock_assert(struct xe_exec_queue *q)
+{
+	struct xe_migrate *m = gt_to_tile(q->gt)->migrate;
+
+	xe_gt_assert(q->gt, q == m->q);
+	lockdep_assert_held(&m->job_mutex);
+}
+#endif
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_migrate.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 4fad324b6253..9b5791617f5e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -152,6 +152,14 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 
 void xe_migrate_wait(struct xe_migrate *m);
 
+#if IS_ENABLED(CONFIG_PROVE_LOCKING)
+void xe_migrate_job_lock_assert(struct xe_exec_queue *q);
+#else
+static inline void xe_migrate_job_lock_assert(struct xe_exec_queue *q)
+{
+}
+#endif
+
 void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue *q);
 void xe_migrate_job_unlock(struct xe_migrate *m, struct xe_exec_queue *q);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 4058c476aa2d..4241cc433dca 100644
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

