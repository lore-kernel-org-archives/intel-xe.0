Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD656C27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 17:07:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65FC10EB59;
	Thu, 13 Jun 2024 17:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O0uuH3V6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5F310EB52
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 17:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718298447; x=1749834447;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QYXkKwPF6WRpwphyTZdq3YjlZDhHMmUelQ15lQT83Zc=;
 b=O0uuH3V6i1xApnt+X0RbAeScBiocedk7x+fWeCata/5RgqsIjYga2gV4
 S3+4VvZ8JuSPTIU1KKOhmJNBkPTnbzAfGCRNZx7XhUnEf3lqe4HZyHhcF
 1pOmkcZVjskWQxHgPSssCxvlqZ79CoVi+TJMczRvekLInUd/QFOzP0mQA
 MM5nrRgfD7nos2co28L6lp3sDXAxZ9s5J+6XhZRh2yGdpou04ksCW8h2G
 VPznOGndjm/wU0nALjNX8/bqhmhuR7+IHUPBdQkY4vOCpRpFjcutFXkG6
 lKVVmbnZ5yDobI108XuEKER3YUhVr9SDnzalt9K2PI6OrJFALVJDULMhN A==;
X-CSE-ConnectionGUID: 0s9g0eflTFe11JkmguE48Q==
X-CSE-MsgGUID: dEZtAedSTZODiIRw7pawRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="37666332"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="37666332"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 10:04:08 -0700
X-CSE-ConnectionGUID: OZhGZmdUQHK+NNIlenqHJw==
X-CSE-MsgGUID: 5vIp0FaDRCyq4Dy5Be1sbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="44744110"
Received: from jsanche3-mobl.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.249.37.225])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 10:04:06 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/exec_queue: Rename xe_exec_queue::compute to
 xe_exec_queue::lr
Date: Thu, 13 Jun 2024 19:03:48 +0200
Message-ID: <20240613170348.723245-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

The properties of this struct are used in long running context so
make that clear by renaming it to lr, in alignment with the rest
of the code.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       |  6 +--
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 14 +++---
 drivers/gpu/drm/xe/xe_preempt_fence.c    |  2 +-
 drivers/gpu/drm/xe/xe_vm.c               | 58 ++++++++++++------------
 4 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index cf45df0328da..0ba37835849b 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -67,7 +67,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->fence_irq = &gt->fence_irq[hwe->class];
 	q->ring_ops = gt->ring_ops[hwe->class];
 	q->ops = gt->exec_queue_ops;
-	INIT_LIST_HEAD(&q->compute.link);
+	INIT_LIST_HEAD(&q->lr.link);
 	INIT_LIST_HEAD(&q->multi_gt_link);
 
 	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
@@ -633,8 +633,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			return PTR_ERR(q);
 
 		if (xe_vm_in_preempt_fence_mode(vm)) {
-			q->compute.context = dma_fence_context_alloc(1);
-			spin_lock_init(&q->compute.lock);
+			q->lr.context = dma_fence_context_alloc(1);
+			spin_lock_init(&q->lr.lock);
 
 			err = xe_vm_add_compute_exec_queue(vm, q);
 			if (XE_IOCTL_DBG(xe, err))
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index f0c5f82ce7e3..201588ec33c3 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -113,19 +113,19 @@ struct xe_exec_queue {
 		enum xe_exec_queue_priority priority;
 	} sched_props;
 
-	/** @compute: compute exec queue state */
+	/** @lr: long-running exec queue state */
 	struct {
-		/** @compute.pfence: preemption fence */
+		/** @lr.pfence: preemption fence */
 		struct dma_fence *pfence;
-		/** @compute.context: preemption fence context */
+		/** @lr.context: preemption fence context */
 		u64 context;
-		/** @compute.seqno: preemption fence seqno */
+		/** @lr.seqno: preemption fence seqno */
 		u32 seqno;
-		/** @compute.link: link into VM's list of exec queues */
+		/** @lr.link: link into VM's list of exec queues */
 		struct list_head link;
-		/** @compute.lock: preemption fences lock */
+		/** @lr.lock: preemption fences lock */
 		spinlock_t lock;
-	} compute;
+	} lr;
 
 	/** @ops: submission backend exec queue operations */
 	const struct xe_exec_queue_ops *ops;
diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
index 5b243b7feb59..e8b8ae5c6485 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence.c
+++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
@@ -129,7 +129,7 @@ xe_preempt_fence_arm(struct xe_preempt_fence *pfence, struct xe_exec_queue *q,
 	list_del_init(&pfence->link);
 	pfence->q = xe_exec_queue_get(q);
 	dma_fence_init(&pfence->base, &preempt_fence_ops,
-		      &q->compute.lock, context, seqno);
+		      &q->lr.lock, context, seqno);
 
 	return &pfence->base;
 }
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 99bf7412475c..f5480a4c56f3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -83,10 +83,10 @@ static bool preempt_fences_waiting(struct xe_vm *vm)
 	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 
-	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
-		if (!q->compute.pfence ||
+	list_for_each_entry(q, &vm->preempt.exec_queues, lr.link) {
+		if (!q->lr.pfence ||
 		    test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
-			     &q->compute.pfence->flags)) {
+			     &q->lr.pfence->flags)) {
 			return true;
 		}
 	}
@@ -129,14 +129,14 @@ static int wait_for_existing_preempt_fences(struct xe_vm *vm)
 
 	xe_vm_assert_held(vm);
 
-	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
-		if (q->compute.pfence) {
-			long timeout = dma_fence_wait(q->compute.pfence, false);
+	list_for_each_entry(q, &vm->preempt.exec_queues, lr.link) {
+		if (q->lr.pfence) {
+			long timeout = dma_fence_wait(q->lr.pfence, false);
 
 			if (timeout < 0)
 				return -ETIME;
-			dma_fence_put(q->compute.pfence);
-			q->compute.pfence = NULL;
+			dma_fence_put(q->lr.pfence);
+			q->lr.pfence = NULL;
 		}
 	}
 
@@ -148,7 +148,7 @@ static bool xe_vm_is_idle(struct xe_vm *vm)
 	struct xe_exec_queue *q;
 
 	xe_vm_assert_held(vm);
-	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
+	list_for_each_entry(q, &vm->preempt.exec_queues, lr.link) {
 		if (!xe_exec_queue_is_idle(q))
 			return false;
 	}
@@ -161,17 +161,17 @@ static void arm_preempt_fences(struct xe_vm *vm, struct list_head *list)
 	struct list_head *link;
 	struct xe_exec_queue *q;
 
-	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
+	list_for_each_entry(q, &vm->preempt.exec_queues, lr.link) {
 		struct dma_fence *fence;
 
 		link = list->next;
 		xe_assert(vm->xe, link != list);
 
 		fence = xe_preempt_fence_arm(to_preempt_fence_from_link(link),
-					     q, q->compute.context,
-					     ++q->compute.seqno);
-		dma_fence_put(q->compute.pfence);
-		q->compute.pfence = fence;
+					     q, q->lr.context,
+					     ++q->lr.seqno);
+		dma_fence_put(q->lr.pfence);
+		q->lr.pfence = fence;
 	}
 }
 
@@ -191,10 +191,10 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
 	if (err)
 		goto out_unlock;
 
-	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link)
-		if (q->compute.pfence) {
+	list_for_each_entry(q, &vm->preempt.exec_queues, lr.link)
+		if (q->lr.pfence) {
 			dma_resv_add_fence(bo->ttm.base.resv,
-					   q->compute.pfence,
+					   q->lr.pfence,
 					   DMA_RESV_USAGE_BOOKKEEP);
 		}
 
@@ -211,10 +211,10 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm,
 	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 
-	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
+	list_for_each_entry(q, &vm->preempt.exec_queues, lr.link) {
 		q->ops->resume(q);
 
-		drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, q->compute.pfence,
+		drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, q->lr.pfence,
 					 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_BOOKKEEP);
 	}
 }
@@ -238,16 +238,16 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	if (err)
 		goto out_up_write;
 
-	pfence = xe_preempt_fence_create(q, q->compute.context,
-					 ++q->compute.seqno);
+	pfence = xe_preempt_fence_create(q, q->lr.context,
+					 ++q->lr.seqno);
 	if (!pfence) {
 		err = -ENOMEM;
 		goto out_fini;
 	}
 
-	list_add(&q->compute.link, &vm->preempt.exec_queues);
+	list_add(&q->lr.link, &vm->preempt.exec_queues);
 	++vm->preempt.num_exec_queues;
-	q->compute.pfence = pfence;
+	q->lr.pfence = pfence;
 
 	down_read(&vm->userptr.notifier_lock);
 
@@ -284,12 +284,12 @@ void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 		return;
 
 	down_write(&vm->lock);
-	list_del(&q->compute.link);
+	list_del(&q->lr.link);
 	--vm->preempt.num_exec_queues;
-	if (q->compute.pfence) {
-		dma_fence_enable_sw_signaling(q->compute.pfence);
-		dma_fence_put(q->compute.pfence);
-		q->compute.pfence = NULL;
+	if (q->lr.pfence) {
+		dma_fence_enable_sw_signaling(q->lr.pfence);
+		dma_fence_put(q->lr.pfence);
+		q->lr.pfence = NULL;
 	}
 	up_write(&vm->lock);
 }
@@ -327,7 +327,7 @@ static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
 	vm->flags |= XE_VM_FLAG_BANNED;
 	trace_xe_vm_kill(vm);
 
-	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link)
+	list_for_each_entry(q, &vm->preempt.exec_queues, lr.link)
 		q->ops->kill(q);
 
 	if (unlocked)
-- 
2.43.0

