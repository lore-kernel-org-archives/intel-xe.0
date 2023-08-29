Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA01C83F12
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 06:56:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B3A10E002;
	Tue, 29 Aug 2023 06:56:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D88210E002
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 06:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693292180; x=1724828180;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7VtdyzABH5oKTbJogNDfpl69Sbxw2SNzT/c20J95aPs=;
 b=iLroTj+/Or58gnqNmHrAzkYziNd5sTpSicdqA7pH0zs6ufNO49r0nDsj
 +DnwRlgGLNWAkMnxFoGoG+VTCxgopkdppmOSsMcGe4xakjtTUDO0WeOT6
 XgaAficUmGkTKluSfCzvpJDKSU4WDuYjz95OaFAEen+iZcyniSvEiX4Hq
 6wiP3ieaAdcRdUhR1qoxGhsO5gtsx00Q9j55sevLDCTMdTb/cu/csYn3v
 kX4viXHDDLf64/O0fu0WKjWEs5gRweNgFtZxOJD0HDATrSNp1sipNgRD5
 sYDMTdyADsQpDfFmOYcLLKszfwD9jqCe0xMlzsvm+WKvb8mqDjtR9j1B2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="439244750"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; d="scan'208";a="439244750"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 23:56:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="882199448"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 23:56:23 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 28 Aug 2023 23:56:14 -0700
Message-Id: <20230829065614.11923-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe: Rename engine to exec_queue
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
Cc: francois.dugast@intel.com, thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Rename vm's preempt queue list name from vm->preempt.engines
to vm->preempt.queues as it is a list of exec queues.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       |  2 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 +--
 drivers/gpu/drm/xe/xe_vm.c               | 32 ++++++++++++------------
 drivers/gpu/drm/xe/xe_vm_types.h         | 10 ++++----
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 25216ef93781..66420d31e7ae 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -812,7 +812,7 @@ static void exec_queue_kill_compute(struct xe_exec_queue *q)
 
 	down_write(&q->vm->lock);
 	list_del(&q->compute.link);
-	--q->vm->preempt.num_engines;
+	--q->vm->preempt.num_queues;
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
index 15bff0783ec9..6d556acc30d3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -172,7 +172,7 @@ static bool preempt_fences_waiting(struct xe_vm *vm)
 	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 
-	list_for_each_entry(q, &vm->preempt.engines, compute.link) {
+	list_for_each_entry(q, &vm->preempt.queues, compute.link) {
 		if (!q->compute.pfence ||
 		    (q->compute.pfence && test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
 						   &q->compute.pfence->flags))) {
@@ -197,10 +197,10 @@ static int alloc_preempt_fences(struct xe_vm *vm, struct list_head *list,
 	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 
-	if (*count >= vm->preempt.num_engines)
+	if (*count >= vm->preempt.num_queues)
 		return 0;
 
-	for (; *count < vm->preempt.num_engines; ++(*count)) {
+	for (; *count < vm->preempt.num_queues; ++(*count)) {
 		struct xe_preempt_fence *pfence = xe_preempt_fence_alloc();
 
 		if (IS_ERR(pfence))
@@ -218,7 +218,7 @@ static int wait_for_existing_preempt_fences(struct xe_vm *vm)
 
 	xe_vm_assert_held(vm);
 
-	list_for_each_entry(q, &vm->preempt.engines, compute.link) {
+	list_for_each_entry(q, &vm->preempt.queues, compute.link) {
 		if (q->compute.pfence) {
 			long timeout = dma_fence_wait(q->compute.pfence, false);
 
@@ -237,7 +237,7 @@ static bool xe_vm_is_idle(struct xe_vm *vm)
 	struct xe_exec_queue *q;
 
 	xe_vm_assert_held(vm);
-	list_for_each_entry(q, &vm->preempt.engines, compute.link) {
+	list_for_each_entry(q, &vm->preempt.queues, compute.link) {
 		if (!xe_exec_queue_is_idle(q))
 			return false;
 	}
@@ -250,7 +250,7 @@ static void arm_preempt_fences(struct xe_vm *vm, struct list_head *list)
 	struct list_head *link;
 	struct xe_exec_queue *q;
 
-	list_for_each_entry(q, &vm->preempt.engines, compute.link) {
+	list_for_each_entry(q, &vm->preempt.queues, compute.link) {
 		struct dma_fence *fence;
 
 		link = list->next;
@@ -270,11 +270,11 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
 	struct ww_acquire_ctx ww;
 	int err;
 
-	err = xe_bo_lock(bo, &ww, vm->preempt.num_engines, true);
+	err = xe_bo_lock(bo, &ww, vm->preempt.num_queues, true);
 	if (err)
 		return err;
 
-	list_for_each_entry(q, &vm->preempt.engines, compute.link)
+	list_for_each_entry(q, &vm->preempt.queues, compute.link)
 		if (q->compute.pfence) {
 			dma_resv_add_fence(bo->ttm.base.resv,
 					   q->compute.pfence,
@@ -311,7 +311,7 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
 	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 
-	list_for_each_entry(q, &vm->preempt.engines, compute.link) {
+	list_for_each_entry(q, &vm->preempt.queues, compute.link) {
 		q->ops->resume(q);
 
 		dma_resv_add_fence(&vm->resv, q->compute.pfence,
@@ -346,8 +346,8 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 		goto out_unlock;
 	}
 
-	list_add(&q->compute.link, &vm->preempt.engines);
-	++vm->preempt.num_engines;
+	list_add(&q->compute.link, &vm->preempt.queues);
+	++vm->preempt.num_queues;
 	q->compute.pfence = pfence;
 
 	down_read(&vm->userptr.notifier_lock);
@@ -528,7 +528,7 @@ static void xe_vm_kill(struct xe_vm *vm)
 	vm->flags |= XE_VM_FLAG_BANNED;
 	trace_xe_vm_kill(vm);
 
-	list_for_each_entry(q, &vm->preempt.engines, compute.link)
+	list_for_each_entry(q, &vm->preempt.queues, compute.link)
 		q->ops->kill(q);
 	xe_vm_unlock(vm, &ww);
 
@@ -586,7 +586,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	}
 
 	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs,
-				  false, vm->preempt.num_engines);
+				  false, vm->preempt.num_queues);
 	if (err)
 		goto out_unlock_outer;
 
@@ -1229,7 +1229,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
 
-	INIT_LIST_HEAD(&vm->preempt.engines);
+	INIT_LIST_HEAD(&vm->preempt.queues);
 	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up to uAPI */
 
 	for_each_tile(tile, xe, id)
@@ -1416,7 +1416,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	struct drm_gpuva *gpuva, *next;
 	u8 id;
 
-	XE_WARN_ON(vm->preempt.num_engines);
+	XE_WARN_ON(vm->preempt.num_queues);
 
 	xe_vm_close(vm);
 	flush_async_ops(vm);
@@ -2083,7 +2083,7 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
 	vm = xa_load(&xef->vm.xa, args->vm_id);
 	if (XE_IOCTL_DBG(xe, !vm))
 		err = -ENOENT;
-	else if (XE_IOCTL_DBG(xe, vm->preempt.num_engines))
+	else if (XE_IOCTL_DBG(xe, vm->preempt.num_queues))
 		err = -EBUSY;
 	else
 		xa_erase(&xef->vm.xa, args->vm_id);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 3681a5ff588b..9d55cec14165 100644
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
+		/** @queues: list of exec queues attached to this VM */
+		struct list_head queues;
+		/** @num_queues: number exec queues attached to this VM */
+		int num_queues;
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

