Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C156DC4828D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 23:36:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB40112F69;
	Tue,  6 Feb 2024 23:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PHEicNak";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A227112F65
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 23:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707262614; x=1738798614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SDsVoiZ2fcMw6sGDh3LaxjXzy/dI+6LzjEpcxJQmvjs=;
 b=PHEicNakSDg4m1be8CtTrRfoUPjSaV2C6l27/49olNz03eZmkZWg1ldJ
 Eg0Ra59RK7uCCqE/VC/xt2kxG5IbM+ofk8tlLCVfVviCrUOSwFEG7g2Er
 WQwjedXPFjC03O8jv5Em2dc/4gPMWJ3NSZ52MXBLay/Dl8Qr0KaUyEX3m
 NrbQ+wJ+eCu+6znATHV5EKJC7U1e8YM9d65Kf56mVsYxWSE+gPe/BetLR
 ZAFdHC8DsqTxAh58YADht8RTdlQyCeP4UNao4b8ZhxHYfvAuuFTOQZY4E
 1BCDS7vV7njFiiUePavD+qzfPsp6gKKE/7GuDneriSLCKEEzg654R/UmC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="776787"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="776787"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5793792"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 05/22] drm/xe: Update xe_vm_rebind to use dummy VMA
 operations
Date: Tue,  6 Feb 2024 15:37:12 -0800
Message-Id: <20240206233729.3173206-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206233729.3173206-1-matthew.brost@intel.com>
References: <20240206233729.3173206-1-matthew.brost@intel.com>
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

All bind interfaces are transitioning to use VMA ops, update
xe_vm_rebind to use VMA ops.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       |  44 ++++---
 drivers/gpu/drm/xe/xe_vm_types.h | 191 ++++++++++++++++---------------
 2 files changed, 130 insertions(+), 105 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 768fb223019b..f59439500095 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -753,10 +753,22 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
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
@@ -778,7 +790,9 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
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
@@ -1267,6 +1281,11 @@ static void xe_vm_free_scratch(struct xe_vm *vm)
 	}
 }
 
+static void xe_vma_ops_init(struct xe_vma_ops *vops)
+{
+	INIT_LIST_HEAD(&vops->list);
+}
+
 struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 {
 	struct drm_gem_object *vm_resv_obj;
@@ -1287,6 +1306,10 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	init_rwsem(&vm->lock);
 
+	xe_vma_ops_init(&vm->dummy_ops.vops);
+	INIT_LIST_HEAD(&vm->dummy_ops.op.link);
+	list_add(&vm->dummy_ops.op.link, &vm->dummy_ops.vops.list);
+
 	INIT_LIST_HEAD(&vm->rebind_list);
 
 	INIT_LIST_HEAD(&vm->userptr.repin_list);
@@ -2391,7 +2414,7 @@ static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma *vma,
 {
 	struct dma_fence *fence = NULL;
 
-	lockdep_assert_held_write(&vm->lock);
+	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 	xe_bo_assert_held(xe_vma_bo(vma));
 
@@ -2481,7 +2504,7 @@ __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
 retry_userptr:
 	fence = op_execute(vm, vma, op);
 	if (IS_ERR(fence) && PTR_ERR(fence) == -EAGAIN) {
-		lockdep_assert_held_write(&vm->lock);
+		lockdep_assert_held(&vm->lock);
 
 		if (op->base.op == DRM_GPUVA_OP_REMAP) {
 			if (!op->remap.unmap_done)
@@ -2510,7 +2533,7 @@ xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
 {
 	struct dma_fence *fence = ERR_PTR(-ENOMEM);
 
-	lockdep_assert_held_write(&vm->lock);
+	lockdep_assert_held(&vm->lock);
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
@@ -2922,11 +2945,6 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
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
index 0c70062f3065..56665f946949 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -18,6 +18,7 @@
 #include "xe_range_fence.h"
 
 struct xe_bo;
+struct xe_device;
 struct xe_sync_entry;
 struct xe_vm;
 
@@ -114,7 +115,96 @@ struct xe_userptr_vma {
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
+	/** @pat_index: The pat index to use for this operation. */
+	u16 pat_index;
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
+	/** @flags: operation flags */
+	enum xe_vma_op_flags flags;
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
+	/** @list: list of VMA operations */
+	struct list_head list;
+};
 
 struct xe_vm {
 	/** @gpuvm: base GPUVM used to track VMAs */
@@ -276,101 +366,18 @@ struct xe_vm {
 		bool capture_once;
 	} error_capture;
 
+	/** @dummy_ops: dummy VMA ops to issue rebinds */
+	struct {
+		/** @dummy_ops.ops: dummy VMA ops */
+		struct xe_vma_ops vops;
+		/** @dummy_ops.op: dummy VMA op */
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
-	/** @pat_index: The pat index to use for this operation. */
-	u16 pat_index;
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
-	/** @flags: operation flags */
-	enum xe_vma_op_flags flags;
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
-	/** @list: list of VMA operations */
-	struct list_head list;
-};
-
 #endif
-- 
2.34.1

