Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34377CF45DC
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 23:27:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6107B10E435;
	Mon, 12 Jan 2026 23:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="buuHkd6m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887CE10E435
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 23:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768260456; x=1799796456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BiyTWrmRsAJueN+QjyR7M3pdbuIp9kSW+lRpeZ3Kco0=;
 b=buuHkd6mG5BwruZSGf11IeKE+F8KHRt5m9Hr2nG7QmtWmu/t+pGvaVOl
 e+a2xz13uIF5FYKkc5XeVuQHww4ek0ZhqBXIfYAqc6+aOWTFPwyeOZT2F
 OMqAlsi3KsIcckBV/VDWhNfjkbNYVIfBg3hcMkvodN5ezMvbNxFXwBduj
 ZKnoRwXg4z2C1nCbcfEP+TXwSH1gpaauC+BNsw6LpJu5SeXe5Gp3xf3Zm
 3EEyPdZQpO2bnszOL48/PtK+tYkS6F/s0FjHioRx2Q8wHoypwEUyx5P0b
 CcRLYz1EKLrGLklOAll7LyarsxII76nwPO5wNLDJz3zbv8cwfM1MMaHYF g==;
X-CSE-ConnectionGUID: UItk6KSOQTCCJbjD/dlSmw==
X-CSE-MsgGUID: mjbEV0omQ+CW2QxKnaRR+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69594767"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69594767"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 15:27:36 -0800
X-CSE-ConnectionGUID: OZm2U4PeRSioImJnoRyZ/A==
X-CSE-MsgGUID: EV+89DDAS7qRxkyJhRhA/w==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 15:27:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com
Subject: [PATCH v3 04/11] drm/xe: Add vm to exec queues association
Date: Mon, 12 Jan 2026 15:27:23 -0800
Message-Id: <20260112232730.3347414-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112232730.3347414-1-matthew.brost@intel.com>
References: <20260112232730.3347414-1-matthew.brost@intel.com>
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

Maintain a list of exec queues per vm which will be used by TLB
invalidation code to do context-ID based tlb invalidations.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h           |  7 ----
 drivers/gpu/drm/xe/xe_device_types.h     |  7 ++++
 drivers/gpu/drm/xe/xe_exec_queue.c       |  7 +++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
 drivers/gpu/drm/xe/xe_vm.c               | 46 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h               |  3 ++
 drivers/gpu/drm/xe/xe_vm_types.h         | 13 +++++++
 7 files changed, 78 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 10d04c324257..db939fc82f71 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -62,13 +62,6 @@ static inline struct xe_tile *xe_device_get_root_tile(struct xe_device *xe)
 	return &xe->tiles[0];
 }
 
-/*
- * Highest GT/tile count for any platform.  Used only for memory allocation
- * sizing.  Any logic looping over GTs or mapping userspace GT IDs into GT
- * structures should use the per-platform xe->info.max_gt_per_tile instead.
- */
-#define XE_MAX_GT_PER_TILE 2
-
 static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
 {
 	struct xe_tile *tile;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4dab3057f58d..8db870aaa382 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -79,6 +79,13 @@ enum xe_wedged_mode {
 #define XE_GT1		1
 #define XE_MAX_TILES_PER_DEVICE	(XE_GT1 + 1)
 
+/*
+ * Highest GT/tile count for any platform.  Used only for memory allocation
+ * sizing.  Any logic looping over GTs or mapping userspace GT IDs into GT
+ * structures should use the per-platform xe->info.max_gt_per_tile instead.
+ */
+#define XE_MAX_GT_PER_TILE 2
+
 #define XE_MAX_ASID	(BIT(20))
 
 #define IS_PLATFORM_STEP(_xe, _platform, min_step, max_step)	\
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index b5737563ee14..ce309d848916 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -154,8 +154,10 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
 	if (xe_exec_queue_is_multi_queue(q))
 		xe_exec_queue_group_cleanup(q);
 
-	if (q->vm)
+	if (q->vm) {
+		xe_vm_remove_exec_queue(q->vm, q);
 		xe_vm_put(q->vm);
+	}
 
 	if (q->xef)
 		xe_file_put(q->xef);
@@ -226,6 +228,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->ring_ops = gt->ring_ops[hwe->class];
 	q->ops = gt->exec_queue_ops;
 	INIT_LIST_HEAD(&q->lr.link);
+	INIT_LIST_HEAD(&q->vm_exec_queue_link);
 	INIT_LIST_HEAD(&q->multi_gt_link);
 	INIT_LIST_HEAD(&q->hw_engine_group_link);
 	INIT_LIST_HEAD(&q->pxp.link);
@@ -1205,6 +1208,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	}
 
 	q->xef = xe_file_get(xef);
+	if (eci[0].engine_class != DRM_XE_ENGINE_CLASS_VM_BIND)
+		xe_vm_add_exec_queue(vm, q);
 
 	/* user id alloc must always be last in ioctl to prevent UAF */
 	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 5fc516b0bb77..d3e2789cf5bc 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -205,6 +205,9 @@ struct xe_exec_queue {
 		struct dma_fence *last_fence;
 	} tlb_inval[XE_EXEC_QUEUE_TLB_INVAL_COUNT];
 
+	/** @vm_exec_queue_link: Link to track exec queue within a VM's list of exec queues. */
+	struct list_head vm_exec_queue_link;
+
 	/** @pxp: PXP info tracking */
 	struct {
 		/** @pxp.type: PXP session type used by this queue */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index bdb04d6bf39c..3a1a1bd74d8d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1530,11 +1530,23 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
 
 	INIT_LIST_HEAD(&vm->preempt.exec_queues);
+	INIT_LIST_HEAD(&vm->exec_queues.list);
 	if (flags & XE_VM_FLAG_FAULT_MODE)
 		vm->preempt.min_run_period_ms = xe->min_run_period_pf_ms;
 	else
 		vm->preempt.min_run_period_ms = xe->min_run_period_lr_ms;
 
+	init_rwsem(&vm->exec_queues.lock);
+	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
+		fs_reclaim_acquire(GFP_KERNEL);
+		might_lock(&vm->exec_queues.lock);
+		fs_reclaim_release(GFP_KERNEL);
+
+		down_read(&vm->exec_queues.lock);
+		might_lock(&xe_root_mmio_gt(xe)->uc.guc.ct.lock);
+		up_read(&vm->exec_queues.lock);
+	}
+
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_init(&vm->rftree[id]);
 
@@ -4570,3 +4582,37 @@ int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t r
 	return xe_vm_alloc_vma(vm, &map_req, false);
 }
 
+/**
+ * xe_vm_add_exec_queue() - Add exec queue to VM
+ * @vm: The VM.
+ * @q: The exec_queue
+ */
+void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
+{
+	/* User VMs and queues only */
+	xe_assert(vm->xe, !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
+	xe_assert(vm->xe, !(q->flags & EXEC_QUEUE_FLAG_PERMANENT));
+	xe_assert(vm->xe, !(q->flags & EXEC_QUEUE_FLAG_VM));
+	xe_assert(vm->xe, !(q->flags & EXEC_QUEUE_FLAG_MIGRATE));
+	xe_assert(vm->xe, vm->xef);
+
+	down_write(&vm->exec_queues.lock);
+	list_add(&q->vm_exec_queue_link, &vm->exec_queues.list);
+	++vm->exec_queues.count[q->gt->info.id];
+	up_write(&vm->exec_queues.lock);
+}
+
+/**
+ * xe_vm_remove_exec_queue() - Remove exec queue from VM
+ * @vm: The VM.
+ * @q: The exec_queue
+ */
+void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
+{
+	down_write(&vm->exec_queues.lock);
+	if (!list_empty(&q->vm_exec_queue_link)) {
+		list_del(&q->vm_exec_queue_link);
+		--vm->exec_queues.count[q->gt->info.id];
+	}
+	up_write(&vm->exec_queues.lock);
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 6cc98df47291..288115c7844a 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -287,6 +287,9 @@ static inline struct dma_resv *xe_vm_resv(struct xe_vm *vm)
 
 void xe_vm_kill(struct xe_vm *vm, bool unlocked);
 
+void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
+void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
+
 /**
  * xe_vm_assert_held(vm) - Assert that the vm's reservation object is held.
  * @vm: The vm
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 437f64202f3b..87318a4f5b08 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -298,6 +298,19 @@ struct xe_vm {
 		struct list_head pm_activate_link;
 	} preempt;
 
+	/** @exec_queues: Manages list of exec queues attached to this VM, protected by lock. */
+	struct {
+		/** @exec_queues.list: list of exec queues attached to this VM */
+		struct list_head list;
+		/**
+		 * @exec_queues.count: count of exec queues attached to this VM,
+		 * per GT
+		 */
+		int count[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
+		/** @exec_queues.lock: lock to protect exec_queues list */
+		struct rw_semaphore lock;
+	} exec_queues;
+
 	/** @um: unified memory state */
 	struct {
 		/** @asid: address space ID, unique to each VM */
-- 
2.34.1

