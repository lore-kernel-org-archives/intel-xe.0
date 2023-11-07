Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D188C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 05:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E214910E02D;
	Tue,  7 Nov 2023 05:26:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B36110E02D
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 05:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699334757; x=1730870757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VpTCMxMqU+PTvS3b19GSEBgo+Un0Q1DJmDfjXTpBGTA=;
 b=PS9EXaorfFmvNmFf6xw/zbsJO04NOuKZXOInB61D6meuzCFjrmpKv+a8
 xFnAX/VDN3DKGLr11Aq0P3KE//8qZlhyrlpBGp38icAppd7HUSzSgvxt5
 BeF7idxysT452z4mOTyvsbQsDunHW2dOvh1+vuWs5fDAIccgw8r5wEPnn
 Ot8jrHITlw71f9u59smYvlxS7HnL7WHMez7EmAzrvGLORdRiUifqpapRG
 /pYmrJ3c38G8NAE6vFRhcl/vb9mbyjuEZeGUm8KkqskvpOE2eEcJdB+h1
 KnOPBqCrcxUJNEhFOtq5900noJbKmLjzImLjE2m1aBiZ/CvJ4KouwNn4O Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368769520"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="368769520"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791689839"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="791689839"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  6 Nov 2023 21:25:44 -0800
Message-Id: <20231107052603.124361-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 08/27] drm/xe: Update xe_vm_rebind to use
 dummy VMA operations
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

All bind interfaces are transitioning to use ops.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       |  43 +++++--
 drivers/gpu/drm/xe/xe_vm_types.h | 199 ++++++++++++++++---------------
 2 files changed, 134 insertions(+), 108 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index afb229cf2149..8dc448bf6222 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -829,10 +829,23 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
 		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
 }
 
-static struct dma_fence *
-xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
-	       struct xe_sync_entry *syncs, u32 num_syncs,
-	       bool first_op, bool last_op);
+static void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma)
+{
+	vm->dummy_ops.op.base.op = DRM_GPUVA_OP_MAP;
+	vm->dummy_ops.op.base.map.va.addr = vma->gpuva.va.addr;
+	vm->dummy_ops.op.base.map.va.range = vma->gpuva.va.range;
+	vm->dummy_ops.op.base.map.gem.obj = vma->gpuva.gem.obj;
+	vm->dummy_ops.op.base.map.gem.offset = vma->gpuva.gem.offset;
+	vm->dummy_ops.op.tile_mask = vma->tile_present;
+	vm->dummy_ops.op.map.vma = vma;
+	vm->dummy_ops.op.map.immediate = true;
+	vm->dummy_ops.op.map.read_only = xe_vma_read_only(vma);
+	vm->dummy_ops.op.map.is_null = xe_vma_is_null(vma);
+}
+
+static struct dma_fence *ops_execute(struct xe_vm *vm,
+				     struct xe_vma_ops *vops,
+				     bool cleanup);
 
 struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 {
@@ -854,7 +867,9 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 			trace_xe_vma_rebind_worker(vma);
 		else
 			trace_xe_vma_rebind_exec(vma);
-		fence = xe_vm_bind_vma(vma, NULL, NULL, 0, false, false);
+
+		xe_vm_populate_dummy_rebind(vm, vma);
+		fence = ops_execute(vm, &vm->dummy_ops.vops, false);
 		if (IS_ERR(fence))
 			return fence;
 	}
@@ -1333,6 +1348,11 @@ static const struct xe_pt_ops xelp_pt_ops = {
 
 static void vm_destroy_work_func(struct work_struct *w);
 
+static void xe_vma_ops_init(struct xe_vma_ops *vops)
+{
+	INIT_LIST_HEAD(&vops->list);
+}
+
 struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 {
 	struct xe_vm *vm;
@@ -1354,6 +1374,10 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	init_rwsem(&vm->lock);
 
+	xe_vma_ops_init(&vm->dummy_ops.vops);
+	INIT_LIST_HEAD(&vm->dummy_ops.op.link);
+	list_add(&vm->dummy_ops.op.link, &vm->dummy_ops.vops.list);
+
 	INIT_LIST_HEAD(&vm->rebind_list);
 
 	INIT_LIST_HEAD(&vm->userptr.repin_list);
@@ -2516,7 +2540,7 @@ static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma *vma,
 {
 	struct dma_fence *fence;
 
-	lockdep_assert_held_write(&vm->lock);
+	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 	xe_bo_assert_held(xe_vma_bo(vma));
 
@@ -2622,7 +2646,7 @@ xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
 {
 	struct dma_fence *fence = ERR_PTR(-ENOMEM);
 
-	lockdep_assert_held_write(&vm->lock);
+	lockdep_assert_held(&vm->lock);
 
 #ifdef TEST_VM_ASYNC_OPS_ERROR
 	if (op->inject_error) {
@@ -3010,11 +3034,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 	return err;
 }
 
-static void xe_vma_ops_init(struct xe_vma_ops *vops)
-{
-	INIT_LIST_HEAD(&vops->list);
-}
-
 int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index eb06a59b6d2f..65cbed7bbdda 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -18,6 +18,7 @@
 #include "xe_range_fence.h"
 
 struct xe_bo;
+struct xe_device;
 struct xe_sync_entry;
 struct xe_vm;
 
@@ -129,7 +130,100 @@ struct xe_vma {
 	struct xe_userptr userptr;
 };
 
-struct xe_device;
+/** struct xe_vma_op_map - VMA map operation */
+struct xe_vma_op_map {
+	/** @vma: VMA to map */
+	struct xe_vma *vma;
+	/** @immediate: Immediate bind */
+	bool immediate;
+	/** @read_only: Read only */
+	bool read_only;
+	/** @is_null: is NULL binding */
+	bool is_null;
+};
+
+/** struct xe_vma_op_remap - VMA remap operation */
+struct xe_vma_op_remap {
+	/** @prev: VMA preceding part of a split mapping */
+	struct xe_vma *prev;
+	/** @next: VMA subsequent part of a split mapping */
+	struct xe_vma *next;
+	/** @start: start of the VMA unmap */
+	u64 start;
+	/** @range: range of the VMA unmap */
+	u64 range;
+	/** @skip_prev: skip prev rebind */
+	bool skip_prev;
+	/** @skip_next: skip next rebind */
+	bool skip_next;
+	/** @unmap_done: unmap operation in done */
+	bool unmap_done;
+};
+
+/** struct xe_vma_op_prefetch - VMA prefetch operation */
+struct xe_vma_op_prefetch {
+	/** @region: memory region to prefetch to */
+	u32 region;
+};
+
+/** enum xe_vma_op_flags - flags for VMA operation */
+enum xe_vma_op_flags {
+	/** @XE_VMA_OP_FIRST: first VMA operation for a set of syncs */
+	XE_VMA_OP_FIRST			= BIT(0),
+	/** @XE_VMA_OP_LAST: last VMA operation for a set of syncs */
+	XE_VMA_OP_LAST			= BIT(1),
+	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
+	XE_VMA_OP_COMMITTED		= BIT(2),
+	/** @XE_VMA_OP_PREV_COMMITTED: Previous VMA operation committed */
+	XE_VMA_OP_PREV_COMMITTED	= BIT(3),
+	/** @XE_VMA_OP_NEXT_COMMITTED: Next VMA operation committed */
+	XE_VMA_OP_NEXT_COMMITTED	= BIT(4),
+};
+
+/** struct xe_vma_op - VMA operation */
+struct xe_vma_op {
+	/** @base: GPUVA base operation */
+	struct drm_gpuva_op base;
+	/**
+	 * @ops: GPUVA ops, when set call drm_gpuva_ops_free after this
+	 * operations is processed
+	 */
+	struct drm_gpuva_ops *ops;
+	/** @q: exec queue for this operation */
+	struct xe_exec_queue *q;
+	/**
+	 * @syncs: syncs for this operation, only used on first and last
+	 * operation
+	 */
+	struct xe_sync_entry *syncs;
+	/** @num_syncs: number of syncs */
+	u32 num_syncs;
+	/** @link: async operation link */
+	struct list_head link;
+	/** @tile_mask: gt mask for this operation */
+	u8 tile_mask;
+	/** @flags: operation flags */
+	enum xe_vma_op_flags flags;
+
+#ifdef TEST_VM_ASYNC_OPS_ERROR
+	/** @inject_error: inject error to test async op error handling */
+	bool inject_error;
+#endif
+
+	union {
+		/** @map: VMA map operation specific data */
+		struct xe_vma_op_map map;
+		/** @remap: VMA remap operation specific data */
+		struct xe_vma_op_remap remap;
+		/** @prefetch: VMA prefetch operation specific data */
+		struct xe_vma_op_prefetch prefetch;
+	};
+};
+
+/** struct xe_vma_ops - VMA operations */
+struct xe_vma_ops {
+	struct list_head list;
+};
 
 #define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
 
@@ -324,105 +418,18 @@ struct xe_vm {
 		bool capture_once;
 	} error_capture;
 
+	/** @dummy_ops: dummy VMA ops to issue rebinds */
+	struct {
+		/** @ops: dummy VMA ops */
+		struct xe_vma_ops vops;
+		/** @op: dummy VMA op */
+		struct xe_vma_op op;
+	} dummy_ops;
+
 	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
 	bool batch_invalidate_tlb;
 	/** @xef: XE file handle for tracking this VM's drm client */
 	struct xe_file *xef;
 };
 
-/** struct xe_vma_op_map - VMA map operation */
-struct xe_vma_op_map {
-	/** @vma: VMA to map */
-	struct xe_vma *vma;
-	/** @immediate: Immediate bind */
-	bool immediate;
-	/** @read_only: Read only */
-	bool read_only;
-	/** @is_null: is NULL binding */
-	bool is_null;
-};
-
-/** struct xe_vma_op_remap - VMA remap operation */
-struct xe_vma_op_remap {
-	/** @prev: VMA preceding part of a split mapping */
-	struct xe_vma *prev;
-	/** @next: VMA subsequent part of a split mapping */
-	struct xe_vma *next;
-	/** @start: start of the VMA unmap */
-	u64 start;
-	/** @range: range of the VMA unmap */
-	u64 range;
-	/** @skip_prev: skip prev rebind */
-	bool skip_prev;
-	/** @skip_next: skip next rebind */
-	bool skip_next;
-	/** @unmap_done: unmap operation in done */
-	bool unmap_done;
-};
-
-/** struct xe_vma_op_prefetch - VMA prefetch operation */
-struct xe_vma_op_prefetch {
-	/** @region: memory region to prefetch to */
-	u32 region;
-};
-
-/** enum xe_vma_op_flags - flags for VMA operation */
-enum xe_vma_op_flags {
-	/** @XE_VMA_OP_FIRST: first VMA operation for a set of syncs */
-	XE_VMA_OP_FIRST			= BIT(0),
-	/** @XE_VMA_OP_LAST: last VMA operation for a set of syncs */
-	XE_VMA_OP_LAST			= BIT(1),
-	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
-	XE_VMA_OP_COMMITTED		= BIT(2),
-	/** @XE_VMA_OP_PREV_COMMITTED: Previous VMA operation committed */
-	XE_VMA_OP_PREV_COMMITTED	= BIT(3),
-	/** @XE_VMA_OP_NEXT_COMMITTED: Next VMA operation committed */
-	XE_VMA_OP_NEXT_COMMITTED	= BIT(4),
-};
-
-/** struct xe_vma_op - VMA operation */
-struct xe_vma_op {
-	/** @base: GPUVA base operation */
-	struct drm_gpuva_op base;
-	/**
-	 * @ops: GPUVA ops, when set call drm_gpuva_ops_free after this
-	 * operations is processed
-	 */
-	struct drm_gpuva_ops *ops;
-	/** @q: exec queue for this operation */
-	struct xe_exec_queue *q;
-	/**
-	 * @syncs: syncs for this operation, only used on first and last
-	 * operation
-	 */
-	struct xe_sync_entry *syncs;
-	/** @num_syncs: number of syncs */
-	u32 num_syncs;
-	/** @link: async operation link */
-	struct list_head link;
-	/** @tile_mask: gt mask for this operation */
-	u8 tile_mask;
-	/** @flags: operation flags */
-	enum xe_vma_op_flags flags;
-
-#ifdef TEST_VM_ASYNC_OPS_ERROR
-	/** @inject_error: inject error to test async op error handling */
-	bool inject_error;
-#endif
-
-	union {
-		/** @map: VMA map operation specific data */
-		struct xe_vma_op_map map;
-		/** @remap: VMA remap operation specific data */
-		struct xe_vma_op_remap remap;
-		/** @prefetch: VMA prefetch operation specific data */
-		struct xe_vma_op_prefetch prefetch;
-	};
-};
-
-/** struct xe_vma_ops - VMA operations */
-struct xe_vma_ops {
-	struct list_head list;
-};
-
 #endif
-- 
2.34.1

