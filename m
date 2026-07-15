Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C9EC44508
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 04:39:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BFD8825B;
	Wed, 15 Jul 2026 04:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cln5Ek6R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CAFB10E6F7
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 04:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784090357; x=1815626357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/3KcTziWl1aKLERhlQK/OyGMKh35y2A5wgxfZkWaP88=;
 b=cln5Ek6R9536PaRE67l6StG5HSoCLrteIbRAsvXt+vnrpQXWz9kxXqc9
 2023Ni/CW9vYITAVzMb4OAf/QPX1SbMfuuU+HqukdkRA0G0pgRUcm4Mqz
 p+R0LSIaSTfwA4TnIbG8OdoWmG/TmEr2AfxR7eG1IEcAlFyuYTyUEndF7
 XGKa6/ySD5NOnLa93K/+0uw+7CmYf0tfR1Oz8lihPcyUvb4O9BJ8Kf9NX
 Q7g3WZO8j2ZOCzK3FzLTfxUyv9n8kOniL+/7yeISTlVjda7IrfQJNf3NL
 nW9sPeWo13YeItfEjXM/O79Qe6qWU0L3SZM0GLytZRVxHbvQ8MkEf4EbW Q==;
X-CSE-ConnectionGUID: rj+1jnPWRP6CAQxv7qisyA==
X-CSE-MsgGUID: O/5s8/5AQeSncWmuHxmcjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="87261762"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="87261762"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 21:39:16 -0700
X-CSE-ConnectionGUID: WgkE3n2sTpGFgLJhiqIJ7w==
X-CSE-MsgGUID: VkQgnLcQSdWQdmEPvVk8DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="252084831"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 21:39:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Carlos Santa <carlos.santa@intel.com>,
	Ryan Neph <ryanneph@google.com>
Subject: [PATCH v3 2/4] drm/xe: Re-prioritize VM's private BOs when adding an
 exec queue
Date: Tue, 14 Jul 2026 21:39:09 -0700
Message-Id: <20260715043911.3626426-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715043911.3626426-1-matthew.brost@intel.com>
References: <20260715043911.3626426-1-matthew.brost@intel.com>
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

When a higher (or lower) priority exec queue is added to a VM, the VM's
existing private BOs were left at whatever TTM LRU priority they had
at creation time, even though the newly added queue changes what
xe_vm_bo_priority() would now compute for that VM. This means a VM's
buffers would not reflect the actual importance userspace has now
assigned to work on that VM until new BOs happen to be allocated,
leaving stale, and potentially too-low, eviction priority on
long-lived buffers.

After dropping vm->exec_queues.lock in xe_vm_add_exec_queue(), take the
VM's dma-resv (xe_vm_lock()) and walk all of the VM's private BOs
(bo->vm == vm, skipping extobjs shared with other VMs), updating each
one's TTM priority to the newly computed level and moving it to the
tail of its new priority's LRU list.

Cc: Carlos Santa <carlos.santa@intel.com>
Cc: Ryan Neph <ryanneph@google.com>
Assisted-by: GitHub_Copilot:claude-sonnet-5
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       |  18 +++--
 drivers/gpu/drm/xe/xe_bo.h       |   3 +-
 drivers/gpu/drm/xe/xe_bo_types.h |   3 +
 drivers/gpu/drm/xe/xe_dma_buf.c  |   2 +-
 drivers/gpu/drm/xe/xe_vm.c       | 126 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm.h       |   1 +
 6 files changed, 145 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c266fa6bade1..0a400c918e2a 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1358,7 +1358,8 @@ int xe_bo_notifier_prepare_pinned(struct xe_bo *bo)
 		if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
 			break;
 
-		backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
+		backup = xe_bo_init_locked(xe, NULL, NULL, NULL, bo->ttm.base.resv, NULL,
+					   xe_bo_size(bo),
 					   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
 					   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
 					   XE_BO_FLAG_PINNED, NULL, &exec);
@@ -1498,7 +1499,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 			break;
 
 		if (!backup) {
-			backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL,
+			backup = xe_bo_init_locked(xe, NULL, NULL, NULL, bo->ttm.base.resv, NULL,
 						   xe_bo_size(bo),
 						   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
 						   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
@@ -2290,6 +2291,9 @@ void xe_bo_free(struct xe_bo *bo)
  * if the function should allocate a new one.
  * @tile: The tile to select for migration of this bo, and the tile used for
  * GGTT binding if any. Only to be non-NULL for ttm_bo_type_kernel bos.
+ * @vm: The VM this bo will be associated with, used to determine the bo's
+ * TTM LRU priority based on the priority band of the VM's exec queues, or
+ * NULL if the bo is not associated with a user VM.
  * @resv: Pointer to a locked shared reservation object to use for this bo,
  * or NULL for the xe_bo to use its own.
  * @bulk: The bulk move to use for LRU bumping, or NULL for external bos.
@@ -2307,7 +2311,8 @@ void xe_bo_free(struct xe_bo *bo)
  * Return: The buffer object on success. Negative error pointer on failure.
  */
 struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
-				struct xe_tile *tile, struct dma_resv *resv,
+				struct xe_tile *tile, struct xe_vm *vm,
+				struct dma_resv *resv,
 				struct ttm_lru_bulk_move *bulk, size_t size,
 				u16 cpu_caching, enum ttm_bo_type type,
 				u32 flags, struct dma_buf *dma_buf,
@@ -2370,7 +2375,10 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 	bo->flags = flags;
 	bo->cpu_caching = cpu_caching;
 	bo->ttm.base.funcs = &xe_gem_object_funcs;
-	bo->ttm.priority = XE_BO_PRIORITY_NORMAL;
+	if (type != ttm_bo_type_device || !vm)
+		bo->ttm.priority = XE_BO_PRIORITY_HIGHEST;
+	else
+		bo->ttm.priority = xe_vm_bo_priority(vm);
 	INIT_LIST_HEAD(&bo->pinned_link);
 #ifdef CONFIG_PROC_FS
 	INIT_LIST_HEAD(&bo->client_link);
@@ -2524,7 +2532,7 @@ __xe_bo_create_locked(struct xe_device *xe,
 		}
 	}
 
-	bo = xe_bo_init_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
+	bo = xe_bo_init_locked(xe, bo, tile, vm, vm ? xe_vm_resv(vm) : NULL,
 			       vm && !xe_vm_in_fault_mode(vm) &&
 			       flags & XE_BO_FLAG_USER ?
 			       &vm->lru_bulk_move : NULL, size,
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 7ae1d9ac0574..d83464e614f1 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -115,7 +115,8 @@ struct xe_bo *xe_bo_alloc(void);
 void xe_bo_free(struct xe_bo *bo);
 
 struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
-				struct xe_tile *tile, struct dma_resv *resv,
+				struct xe_tile *tile, struct xe_vm *vm,
+				struct dma_resv *resv,
 				struct ttm_lru_bulk_move *bulk, size_t size,
 				u16 cpu_caching, enum ttm_bo_type type,
 				u32 flags, struct dma_buf *dma_buf,
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index e45f24301050..7b02552652d3 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -24,7 +24,10 @@ struct xe_vm;
 #define XE_BO_MAX_PLACEMENTS	3
 
 /* TODO: To be selected with VM_MADVISE */
+#define	XE_BO_PRIORITY_LOW	0
 #define	XE_BO_PRIORITY_NORMAL	1
+#define	XE_BO_PRIORITY_HIGH	2
+#define	XE_BO_PRIORITY_HIGHEST	3
 
 /**
  * struct xe_bo - Xe buffer object
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index bf0728838ead..4ab4a43adc67 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -300,7 +300,7 @@ xe_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
 		if (ret)
 			break;
 
-		bo = xe_bo_init_locked(xe, NULL, NULL, resv, NULL, dma_buf->size,
+		bo = xe_bo_init_locked(xe, NULL, NULL, NULL, resv, NULL, dma_buf->size,
 				       0, /* Will require 1way or 2way for vm_bind */
 				       ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, dma_buf, &exec);
 		drm_exec_retry_on_contention(&exec);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 14c172fe9b90..74ab6f255c70 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -11,6 +11,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_exec.h>
 #include <drm/drm_print.h>
+#include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_tt.h>
 #include <uapi/drm/xe_drm.h>
 #include <linux/ascii85.h>
@@ -1231,6 +1232,37 @@ static void vma_destroy_cb(struct dma_fence *fence,
 	queue_work(system_dfl_wq, &vma->destroy_work);
 }
 
+/*
+ * Change @bo's TTM LRU priority to @priority. @bo's dma-resv must be held.
+ *
+ * Private, user BOs of non-fault-mode VMs have bo->ttm.bulk_move set to
+ * their VM's LRU bulk-move range (see xe_bo_init_locked()), which tracks a
+ * per-(mem_type, priority) first/last position within that range. Simply
+ * writing bo->ttm.priority and calling ttm_bo_move_to_lru_tail_unlocked()
+ * would make ttm_resource_move_to_lru_tail() look up the bulk-move bucket
+ * for the *new* priority while the resource is still physically linked in
+ * the *old* priority's LRU list, corrupting the bulk-move range (and
+ * potentially crashing on a NULL bucket). Temporarily detaching the BO from
+ * its bulk-move range moves it with a plain, non-bulk LRU update instead,
+ * and reattaching afterwards re-inserts it into the new priority's bucket.
+ */
+static void xe_bo_update_ttm_priority(struct xe_bo *bo, int priority)
+{
+	struct ttm_lru_bulk_move *bulk = bo->ttm.bulk_move;
+
+	xe_bo_assert_held(bo);
+
+	if (bo->ttm.priority == priority)
+		return;
+
+	if (bulk)
+		ttm_bo_set_bulk_move(&bo->ttm, NULL);
+	bo->ttm.priority = priority;
+	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
+	if (bulk)
+		ttm_bo_set_bulk_move(&bo->ttm, bulk);
+}
+
 static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -4943,6 +4975,87 @@ int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t r
 	return xe_vm_alloc_vma(vm, &map_req, false);
 }
 
+/*
+ * Determine the TTM LRU priority to use for BOs private to @vm, based on the
+ * highest priority band among exec queues currently attached to @vm.
+ *
+ * A VM with a HIGH priority exec queue gets XE_BO_PRIORITY_HIGHEST, same as
+ * BOs that are never subject to this heuristic at all (kernel or shared
+ * BOs) -- userspace has indicated its most important work lives here, so
+ * treat these BOs as equally important. Every other band is then shifted up
+ * one level from its "intuitive" mapping: a NORMAL priority exec queue (or no
+ * exec queues at all yet) yields XE_BO_PRIORITY_HIGH, and a LOW priority exec
+ * queue yields XE_BO_PRIORITY_NORMAL. XE_BO_PRIORITY_LOW is intentionally
+ * never returned here -- it is reserved for xe_vma_destroy() to apply once a
+ * BO has no VMAs left, letting userspace signal "drop this from my working
+ * set" via unbind while still retaining the backing store, without this
+ * heuristic immediately promoting it back up on the next bind.
+ *
+ * Must be called with @vm's exec_queues.lock held, in either read or write
+ * mode.
+ */
+static int xe_vm_bo_priority_locked(struct xe_vm *vm)
+{
+	lockdep_assert_held(&vm->exec_queues.lock);
+
+	if (vm->exec_queues.priority_count[XE_EXEC_QUEUE_PRIORITY_HIGH])
+		return XE_BO_PRIORITY_HIGHEST;
+	if (vm->exec_queues.priority_count[XE_EXEC_QUEUE_PRIORITY_LOW])
+		return XE_BO_PRIORITY_NORMAL;
+
+	return XE_BO_PRIORITY_HIGH;
+}
+
+/**
+ * xe_vm_bo_priority() - Determine TTM LRU priority for a VM's private BOs
+ * @vm: The VM.
+ *
+ * Determine the TTM LRU priority to use for BOs private to @vm, based on the
+ * highest priority band among exec queues currently attached to @vm.
+ *
+ * Return: The TTM LRU priority to use for @vm's private BOs.
+ */
+int xe_vm_bo_priority(struct xe_vm *vm)
+{
+	int priority;
+
+	down_read(&vm->exec_queues.lock);
+	priority = xe_vm_bo_priority_locked(vm);
+	up_read(&vm->exec_queues.lock);
+
+	return priority;
+}
+
+/*
+ * Update the TTM LRU priority of all BOs private to @vm to @priority, moving
+ * each to the tail of its new priority level's LRU list. BOs shared with
+ * other VMs (extobjs) are left untouched.
+ */
+static void xe_vm_update_bo_priority(struct xe_vm *vm, int priority)
+{
+	struct drm_gpuva *gpuva;
+
+	/*
+	 * vm->lock is the outer most lock and serializes against concurrent
+	 * VMA insertion/removal (bind/unbind), so it must be held to safely
+	 * walk vm->gpuvm here. xe_vm_lock() (the VM's dma-resv) is taken
+	 * inside it, as it protects each private BO's bo->ttm.priority.
+	 */
+	down_read(&vm->lock);
+	xe_vm_lock(vm, false);
+	drm_gpuvm_for_each_va(gpuva, &vm->gpuvm) {
+		struct xe_vma *vma = gpuva_to_vma(gpuva);
+		struct xe_bo *bo = xe_vma_bo(vma);
+
+		if (!bo || bo->vm != vm || bo->ttm.priority == priority)
+			continue;
+
+		xe_bo_update_ttm_priority(bo, priority);
+	}
+	xe_vm_unlock(vm);
+	up_read(&vm->lock);
+}
+
 /**
  * xe_vm_add_exec_queue() - Add exec queue to VM
  * @vm: The VM.
@@ -4955,6 +5068,7 @@ int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t r
 void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 {
 	struct xe_device *xe = vm->xe;
+	int priority;
 
 	/* User VMs and queues only */
 	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
@@ -4972,7 +5086,10 @@ void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	if (q->sched_props.priority >= XE_EXEC_QUEUE_PRIORITY_LOW &&
 	    q->sched_props.priority <= XE_EXEC_QUEUE_PRIORITY_HIGH)
 		++vm->exec_queues.priority_count[q->sched_props.priority];
+	priority = xe_vm_bo_priority_locked(vm);
 	up_write(&vm->exec_queues.lock);
+
+	xe_vm_update_bo_priority(vm, priority);
 }
 
 /**
@@ -4984,10 +5101,14 @@ void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
  * exec queue from the per-GT list, skipped if the device does not have
  * context based TLB invalidations. No-op if @q is not a user exec queue,
  * or is a VM exec queue (VM exec queues are never tracked by
- * xe_vm_add_exec_queue()).
+ * xe_vm_add_exec_queue()). Also re-prioritizes the VM's private BOs in
+ * case removing @q lowered the highest priority band with an attached
+ * exec queue.
  */
 void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 {
+	int priority;
+
 	if (!q->xef || (q->flags & EXEC_QUEUE_FLAG_VM))
 		return;
 
@@ -4999,5 +5120,8 @@ void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	if (q->sched_props.priority >= XE_EXEC_QUEUE_PRIORITY_LOW &&
 	    q->sched_props.priority <= XE_EXEC_QUEUE_PRIORITY_HIGH)
 		--vm->exec_queues.priority_count[q->sched_props.priority];
+	priority = xe_vm_bo_priority_locked(vm);
 	up_write(&vm->exec_queues.lock);
+
+	xe_vm_update_bo_priority(vm, priority);
 }
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index c5b900f38ded..64d3665bb05a 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -305,6 +305,7 @@ void xe_vm_kill(struct xe_vm *vm, bool unlocked);
 
 void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
 void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
+int xe_vm_bo_priority(struct xe_vm *vm);
 
 /**
  * xe_vm_assert_held(vm) - Assert that the vm's reservation object is held.
-- 
2.34.1

