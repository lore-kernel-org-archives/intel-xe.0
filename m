Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55ADC83F01
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 09:17:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C6F10E124;
	Wed, 30 Aug 2023 09:17:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB30A10E124
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 09:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693387043; x=1724923043;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=24wPbrOvGx7rS/mBMl3TXSK0qm70a4itwbR6V0zxP18=;
 b=VVxZbi/+MPJQCyIzMP8EH2muHVNwMIhtTXIDbr2ZhFeNb4xM3UV0afeF
 oPIkYKCZ5e213CBdC93W44PtmohrYLoyEfI9Vxmmi8nsIgu4V8k0wVS4L
 MPV/Lh57GV0YD4C85RtuazLqW/1V50Owf2DpREutRcJEm3G2fecGpKxk2
 obPBnPCKdMLNaDGcIaH4ySQw0TOOH1R4hOkB8WZfX+/aHRg2WptmGKWcg
 lqbRvHBvY7ryG2wmYA+EFjKP+bAxm0hjWmcu9DhO+X52gxxiMfs8Pf6p2
 VIGBOAMQWzqHMO31eNRaqTU2VaPYhKWAJ+h15Slj2+khVYGPmJlDRy1EM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="372996235"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="372996235"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 02:17:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="912714769"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="912714769"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 02:17:22 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 30 Aug 2023 02:17:17 -0700
Message-Id: <20230830091717.19617-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] fixup! drm/xe: Rename engine to exec_queue
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
Cc: francois.dugast@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Rename vm's preempt queue list name from vm->preempt.engines
to vm->preempt.exec_queues as it is a list of exec queues.

v2: s/queues/exec_queues/

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       |  2 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 +--
 drivers/gpu/drm/xe/xe_vm.c               | 32 ++++++++++++------------
 drivers/gpu/drm/xe/xe_vm_types.h         | 10 ++++----
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 25216ef93781..e44d71c679cc 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -812,7 +812,7 @@ static void exec_queue_kill_compute(struct xe_exec_queue *q)
 
 	down_write(&q->vm->lock);
 	list_del(&q->compute.link);
-	--q->vm->preempt.num_engines;
+	--q->vm->preempt.num_exec_queues;
 	if (q->compute.pfence) {
 		dma_fence_enable_sw_signaling(q->compute.pfence);
 		dma_fence_put(q->compute.pfence);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 4a9a46d8a759..347d28442701 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -126,7 +126,7 @@ struct xe_exec_queue {
 		u32 preempt_timeout_us;
 	} sched_props;
 
-	/** @compute: compute engine state */
+	/** @compute: compute exec queue state */
 	struct {
 		/** @pfence: preemption fence */
 		struct dma_fence *pfence;
@@ -134,7 +134,7 @@ struct xe_exec_queue {
 		u64 context;
 		/** @seqno: preemption fence seqno */
 		u32 seqno;
-		/** @link: link into VM's list of engines */
+		/** @link: link into VM's list of exec queues */
 		struct list_head link;
 		/** @lock: preemption fences lock */
 		spinlock_t lock;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 15bff0783ec9..9cbf2f63d641 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -172,7 +172,7 @@ static bool preempt_fences_waiting(struct xe_vm *vm)
 	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 
-	list_for_each_entry(q, &vm->preempt.engines, compute.link) {
+	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
 		if (!q->compute.pfence ||
 		    (q->compute.pfence && test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
 						   &q->compute.pfence->flags))) {
@@ -197,10 +197,10 @@ static int alloc_preempt_fences(struct xe_vm *vm, struct list_head *list,
 	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 
-	if (*count >= vm->preempt.num_engines)
+	if (*count >= vm->preempt.num_exec_queues)
 		return 0;
 
-	for (; *count < vm->preempt.num_engines; ++(*count)) {
+	for (; *count < vm->preempt.num_exec_queues; ++(*count)) {
 		struct xe_preempt_fence *pfence = xe_preempt_fence_alloc();
 
 		if (IS_ERR(pfence))
@@ -218,7 +218,7 @@ static int wait_for_existing_preempt_fences(struct xe_vm *vm)
 
 	xe_vm_assert_held(vm);
 
-	list_for_each_entry(q, &vm->preempt.engines, compute.link) {
+	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
 		if (q->compute.pfence) {
 			long timeout = dma_fence_wait(q->compute.pfence, false);
 
@@ -237,7 +237,7 @@ static bool xe_vm_is_idle(struct xe_vm *vm)
 	struct xe_exec_queue *q;
 
 	xe_vm_assert_held(vm);
-	list_for_each_entry(q, &vm->preempt.engines, compute.link) {
+	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
 		if (!xe_exec_queue_is_idle(q))
 			return false;
 	}
@@ -250,7 +250,7 @@ static void arm_preempt_fences(struct xe_vm *vm, struct list_head *list)
 	struct list_head *link;
 	struct xe_exec_queue *q;
 
-	list_for_each_entry(q, &vm->preempt.engines, compute.link) {
+	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
 		struct dma_fence *fence;
 
 		link = list->next;
@@ -270,11 +270,11 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
 	struct ww_acquire_ctx ww;
 	int err;
 
-	err = xe_bo_lock(bo, &ww, vm->preempt.num_engines, true);
+	err = xe_bo_lock(bo, &ww, vm->preempt.num_exec_queues, true);
 	if (err)
 		return err;
 
-	list_for_each_entry(q, &vm->preempt.engines, compute.link)
+	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link)
 		if (q->compute.pfence) {
 			dma_resv_add_fence(bo->ttm.base.resv,
 					   q->compute.pfence,
@@ -311,7 +311,7 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
 	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 
-	list_for_each_entry(q, &vm->preempt.engines, compute.link) {
+	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
 		q->ops->resume(q);
 
 		dma_resv_add_fence(&vm->resv, q->compute.pfence,
@@ -346,8 +346,8 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 		goto out_unlock;
 	}
 
-	list_add(&q->compute.link, &vm->preempt.engines);
-	++vm->preempt.num_engines;
+	list_add(&q->compute.link, &vm->preempt.exec_queues);
+	++vm->preempt.num_exec_queues;
 	q->compute.pfence = pfence;
 
 	down_read(&vm->userptr.notifier_lock);
@@ -528,7 +528,7 @@ static void xe_vm_kill(struct xe_vm *vm)
 	vm->flags |= XE_VM_FLAG_BANNED;
 	trace_xe_vm_kill(vm);
 
-	list_for_each_entry(q, &vm->preempt.engines, compute.link)
+	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link)
 		q->ops->kill(q);
 	xe_vm_unlock(vm, &ww);
 
@@ -586,7 +586,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	}
 
 	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs,
-				  false, vm->preempt.num_engines);
+				  false, vm->preempt.num_exec_queues);
 	if (err)
 		goto out_unlock_outer;
 
@@ -1229,7 +1229,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
 
-	INIT_LIST_HEAD(&vm->preempt.engines);
+	INIT_LIST_HEAD(&vm->preempt.exec_queues);
 	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up to uAPI */
 
 	for_each_tile(tile, xe, id)
@@ -1416,7 +1416,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	struct drm_gpuva *gpuva, *next;
 	u8 id;
 
-	XE_WARN_ON(vm->preempt.num_engines);
+	XE_WARN_ON(vm->preempt.num_exec_queues);
 
 	xe_vm_close(vm);
 	flush_async_ops(vm);
@@ -2083,7 +2083,7 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 	vm = xa_load(&xef->vm.xa, args->vm_id);
 	if (XE_IOCTL_DBG(xe, !vm))
 		err = -ENOENT;
-	else if (XE_IOCTL_DBG(xe, vm->preempt.num_engines))
+	else if (XE_IOCTL_DBG(xe, vm->preempt.num_exec_queues))
 		err = -EBUSY;
 	else
 		xa_erase(&xef->vm.xa, args->vm_id);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 3681a5ff588b..fd2178dbde3a 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -285,10 +285,10 @@ struct xe_vm {
 		 * an engine again
 		 */
 		s64 min_run_period_ms;
-		/** @engines: list of engines attached to this VM */
-		struct list_head engines;
-		/** @num_engines: number user engines attached to this VM */
-		int num_engines;
+		/** @exec_queues: list of exec queues attached to this VM */
+		struct list_head exec_queues;
+		/** @num_exec_queues: number exec queues attached to this VM */
+		int num_exec_queues;
 		/**
 		 * @rebind_deactivated: Whether rebind has been temporarily deactivated
 		 * due to no work available. Protected by the vm resv.
@@ -393,7 +393,7 @@ struct xe_vma_op {
 	 * operations is processed
 	 */
 	struct drm_gpuva_ops *ops;
-	/** @engine: engine for this operation */
+	/** @q: exec queue for this operation */
 	struct xe_exec_queue *q;
 	/**
 	 * @syncs: syncs for this operation, only used on first and last
-- 
2.21.0.rc0.32.g243a4c7e27

