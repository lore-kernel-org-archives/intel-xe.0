Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A7BCCFA05
	for <intel-xe@archiver.kernel.org>; Sat,  1 Nov 2025 01:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3236110E112;
	Sat,  1 Nov 2025 01:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W3RcMzXe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E91E10E058
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Nov 2025 01:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761958954; x=1793494954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aX9tmNPVVxXcNpgOil+IeZ4e9Jw/BJYKK7JSxt0NfA8=;
 b=W3RcMzXehFqiliKjQ5tfQ+96n6mVSj+BrHAGaSKQWg9tdHu1HRPhRD2Q
 Be3Xv3bXB8Gg9UvfF+3ZCuTCMzLfg6fLY3v2RaKy6piw9Ff4G0Qvg/YRh
 1UuXMvDBc63DrYoWbw61X/0dugwyTF8Lg9c48DopEMV+pw0+MYpFfDtjh
 +HVZhFZkG2/Icu9VY6s29dJOtJ7n82wsoEy1AfYY+Ekhu9AH6SwCQDYrB
 Sg4P/1zgM+iV+NkP6sjdOqKwzNSB/p+Hny93KSndcDvwDxbTHQbxLObB2
 o10wUE3Pjdb1dhuf3wYVmwkMU//J8YYwrPpz516QVS2hnGTqSEku1ckv9 g==;
X-CSE-ConnectionGUID: 0YfBeiObSOS2fNnK2B6G2A==
X-CSE-MsgGUID: fyMJ4cbzS1GJ7q/bN+fw7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75575690"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="75575690"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:02:32 -0700
X-CSE-ConnectionGUID: 8SlC2LXxQZuUJ+KLEvTO3Q==
X-CSE-MsgGUID: k5LqL8jcSje7kNgfVy8uQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="217020170"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 18:02:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com
Subject: [PATCH 04/12] drm/xe: Add vm to exec queues association
Date: Fri, 31 Oct 2025 18:02:17 -0700
Message-Id: <20251101010225.3095457-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251101010225.3095457-1-matthew.brost@intel.com>
References: <20251101010225.3095457-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_device.h           |  7 ----
 drivers/gpu/drm/xe/xe_device_types.h     |  7 ++++
 drivers/gpu/drm/xe/xe_exec_queue.c       |  7 +++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
 drivers/gpu/drm/xe/xe_vm.c               | 47 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h               |  3 ++
 drivers/gpu/drm/xe/xe_vm_types.h         | 13 +++++++
 7 files changed, 79 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 538202eebc16..764f24f4adfc 100644
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
index af0ce275b032..145951dd95c9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -57,6 +57,13 @@ struct xe_vram_region;
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
index 1b57d7c2cc94..49822baf5967 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -72,8 +72,10 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
 
 	if (xe_exec_queue_uses_pxp(q))
 		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
-	if (q->vm)
+	if (q->vm) {
+		xe_vm_remove_exec_queue(q->vm, q);
 		xe_vm_put(q->vm);
+	}
 
 	if (q->xef)
 		xe_file_put(q->xef);
@@ -143,6 +145,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->ring_ops = gt->ring_ops[hwe->class];
 	q->ops = gt->exec_queue_ops;
 	INIT_LIST_HEAD(&q->lr.link);
+	INIT_LIST_HEAD(&q->vm_exec_queue_link);
 	INIT_LIST_HEAD(&q->multi_gt_link);
 	INIT_LIST_HEAD(&q->hw_engine_group_link);
 	INIT_LIST_HEAD(&q->pxp.link);
@@ -796,6 +799,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	}
 
 	q->xef = xe_file_get(xef);
+	if (eci[0].engine_class != DRM_XE_ENGINE_CLASS_VM_BIND)
+		xe_vm_add_exec_queue(vm, q);
 
 	/* user id alloc must always be last in ioctl to prevent UAF */
 	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index c8807268ec6c..a2281fcb55b1 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -147,6 +147,9 @@ struct xe_exec_queue {
 		struct xe_dep_scheduler *dep_scheduler;
 	} tlb_inval[XE_EXEC_QUEUE_TLB_INVAL_COUNT];
 
+	/** @vm_exec_queue_link: Link to track exec queue within a VM's list of exec queues. */
+	struct list_head vm_exec_queue_link;
+
 	/** @pxp: PXP info tracking */
 	struct {
 		/** @pxp.type: PXP session type used by this queue */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 84f4c8f1be33..cccdd931dd5e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1507,8 +1507,20 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
 
 	INIT_LIST_HEAD(&vm->preempt.exec_queues);
+	INIT_LIST_HEAD(&vm->exec_queues.list);
 	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up to uAPI */
 
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
 
@@ -4387,3 +4399,38 @@ int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t r
 
 	return xe_vm_alloc_vma(vm, &map_req, false);
 }
+
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
index ef8a5019574e..5f3341ef99d2 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -284,6 +284,9 @@ static inline struct dma_resv *xe_vm_resv(struct xe_vm *vm)
 
 void xe_vm_kill(struct xe_vm *vm, bool unlocked);
 
+void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
+void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
+
 /**
  * xe_vm_assert_held(vm) - Assert that the vm's reservation object is held.
  * @vm: The vm
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 830ed7b05c27..180b48d62480 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -290,6 +290,19 @@ struct xe_vm {
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

