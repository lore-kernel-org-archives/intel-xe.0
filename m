Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E327C48297
	for <intel-xe@archiver.kernel.org>; Mon, 12 Feb 2024 16:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED19710E638;
	Mon, 12 Feb 2024 16:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UYL9xOeR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BCA10E638
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Feb 2024 16:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707754629; x=1739290629;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rS1zKTobp9u/LLehu9OYhe0lGw6I8M+Q6EQraQ0Z9ZI=;
 b=UYL9xOeR5gcbDyEnLVsgfLssAm3q3XWBY0G4vrDfSw8HPwuoei/MjVaX
 QJh6NOcqeCyFoiNBCSvXY78XRCHKI9r8EoVDErnoTBIeTSUmRRtnVhaj3
 1aAuY1LkXg9QbwPS67rCrZrB1KZMcClwU/4N59VBCZcNVG4V12F300eip
 x9759Umxohyu/46lvkhteSnw4XTSUvpjTpAnNv7D0hnYeVzHz+Q6i69t1
 0yQSb2ORg2AQjUR+hlp4fomR+fnP3XI4dQnazt9AG3yFwMSpapiizTTKL
 RmAaikCL+Pj5dMQWx2M2iVg1jzVRhxTNkNE6cBCRYx+Z6HhkrgjShw1Nf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1873256"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; 
   d="scan'208";a="1873256"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 08:17:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; 
   d="scan'208";a="7255333"
Received: from rgroves-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.63.22])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 08:17:05 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/uapi: Remove unused flags
Date: Mon, 12 Feb 2024 16:16:54 +0000
Message-Id: <20240212161654.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Those cases missed in previous uAPI cleanups were mostly accidentally
brought in from i915 or created to exercise the possibilities of gpuvm
but they are not used by userspace yet, so let's remove them. They can
still be brought back later if needed.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 90 ------------------------
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 10 ---
 drivers/gpu/drm/xe/xe_lrc.c              | 10 ---
 drivers/gpu/drm/xe/xe_vm.c               | 41 +----------
 drivers/gpu/drm/xe/xe_vm_types.h         |  4 --
 include/uapi/drm/xe_drm.h                | 25 +------
 6 files changed, 5 insertions(+), 175 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 2976635be4d3..b200089bca77 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -359,26 +359,6 @@ static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *
 	return 0;
 }
 
-static int exec_queue_set_preemption_timeout(struct xe_device *xe,
-					     struct xe_exec_queue *q, u64 value,
-					     bool create)
-{
-	u32 min = 0, max = 0;
-
-	xe_exec_queue_get_prop_minmax(q->hwe->eclass,
-				      XE_EXEC_QUEUE_PREEMPT_TIMEOUT, &min, &max);
-
-	if (xe_exec_queue_enforce_schedule_limit() &&
-	    !xe_hw_engine_timeout_in_range(value, min, max))
-		return -EINVAL;
-
-	if (!create)
-		return q->ops->set_preempt_timeout(q, value);
-
-	q->sched_props.preempt_timeout_us = value;
-	return 0;
-}
-
 static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue *q,
 				      u64 value, bool create)
 {
@@ -396,71 +376,6 @@ static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue
 	return 0;
 }
 
-static int exec_queue_set_job_timeout(struct xe_device *xe, struct xe_exec_queue *q,
-				      u64 value, bool create)
-{
-	u32 min = 0, max = 0;
-
-	if (XE_IOCTL_DBG(xe, !create))
-		return -EINVAL;
-
-	xe_exec_queue_get_prop_minmax(q->hwe->eclass,
-				      XE_EXEC_QUEUE_JOB_TIMEOUT, &min, &max);
-
-	if (xe_exec_queue_enforce_schedule_limit() &&
-	    !xe_hw_engine_timeout_in_range(value, min, max))
-		return -EINVAL;
-
-	q->sched_props.job_timeout_ms = value;
-
-	return 0;
-}
-
-static int exec_queue_set_acc_trigger(struct xe_device *xe, struct xe_exec_queue *q,
-				      u64 value, bool create)
-{
-	if (XE_IOCTL_DBG(xe, !create))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
-		return -EINVAL;
-
-	q->usm.acc_trigger = value;
-
-	return 0;
-}
-
-static int exec_queue_set_acc_notify(struct xe_device *xe, struct xe_exec_queue *q,
-				     u64 value, bool create)
-{
-	if (XE_IOCTL_DBG(xe, !create))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
-		return -EINVAL;
-
-	q->usm.acc_notify = value;
-
-	return 0;
-}
-
-static int exec_queue_set_acc_granularity(struct xe_device *xe, struct xe_exec_queue *q,
-					  u64 value, bool create)
-{
-	if (XE_IOCTL_DBG(xe, !create))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, !xe->info.has_usm))
-		return -EINVAL;
-
-	if (value > DRM_XE_ACC_GRANULARITY_64M)
-		return -EINVAL;
-
-	q->usm.acc_granularity = value;
-
-	return 0;
-}
-
 typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 					     struct xe_exec_queue *q,
 					     u64 value, bool create);
@@ -468,12 +383,7 @@ typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
-	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT] = exec_queue_set_preemption_timeout,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE] = exec_queue_set_persistence,
-	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT] = exec_queue_set_job_timeout,
-	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER] = exec_queue_set_acc_trigger,
-	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY] = exec_queue_set_acc_notify,
-	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY] = exec_queue_set_acc_granularity,
 };
 
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 648391961fc4..28b297208a37 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -162,16 +162,6 @@ struct xe_exec_queue {
 		spinlock_t lock;
 	} compute;
 
-	/** @usm: unified shared memory state */
-	struct {
-		/** @usm.acc_trigger: access counter trigger */
-		u32 acc_trigger;
-		/** @usm.acc_notify: access counter notify */
-		u32 acc_notify;
-		/** @usm.acc_granularity: access counter granularity */
-		u32 acc_granularity;
-	} usm;
-
 	/** @ops: submission backend exec queue operations */
 	const struct xe_exec_queue_ops *ops;
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 8c85e90220de..3d615db8edc2 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -706,8 +706,6 @@ static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
 
 #define PVC_CTX_ASID		(0x2e + 1)
 #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
-#define ACC_GRANULARITY_S       20
-#define ACC_NOTIFY_S            16
 
 int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		struct xe_exec_queue *q, struct xe_vm *vm, u32 ring_size)
@@ -777,14 +775,6 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, lrc->ring.tail);
 	xe_lrc_write_ctx_reg(lrc, CTX_RING_CTL,
 			     RING_CTL_SIZE(lrc->ring.size) | RING_VALID);
-	if (xe->info.has_asid && vm)
-		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID,
-				     (q->usm.acc_granularity <<
-				      ACC_GRANULARITY_S) | vm->usm.asid);
-	if (xe->info.has_usm && vm)
-		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ACC_CTR_THOLD,
-				     (q->usm.acc_notify << ACC_NOTIFY_S) |
-				     q->usm.acc_trigger);
 
 	lrc->desc = LRC_VALID;
 	lrc->desc |= LRC_LEGACY_64B_CONTEXT << LRC_ADDRESSING_MODE_SHIFT;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 836a6e849cda..af280e98e67e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2067,8 +2067,6 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
 	struct drm_gpuva_ops *ops;
 	struct drm_gpuva_op *__op;
-	struct drm_gpuvm_bo *vm_bo;
-	int err;
 
 	lockdep_assert_held_write(&vm->lock);
 
@@ -2089,23 +2087,6 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 	case DRM_XE_VM_BIND_OP_PREFETCH:
 		ops = drm_gpuvm_prefetch_ops_create(&vm->gpuvm, addr, range);
 		break;
-	case DRM_XE_VM_BIND_OP_UNMAP_ALL:
-		xe_assert(vm->xe, bo);
-
-		err = xe_bo_lock(bo, true);
-		if (err)
-			return ERR_PTR(err);
-
-		vm_bo = drm_gpuvm_bo_obtain(&vm->gpuvm, obj);
-		if (IS_ERR(vm_bo)) {
-			xe_bo_unlock(bo);
-			return ERR_CAST(vm_bo);
-		}
-
-		ops = drm_gpuvm_bo_unmap_ops_create(vm_bo);
-		drm_gpuvm_bo_put(vm_bo);
-		xe_bo_unlock(bo);
-		break;
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 		ops = ERR_PTR(-EINVAL);
@@ -2117,10 +2098,6 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 
 		if (__op->op == DRM_GPUVA_OP_MAP) {
-			op->map.immediate =
-				flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE;
-			op->map.read_only =
-				flags & DRM_XE_VM_BIND_FLAG_READONLY;
 			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
 			op->map.pat_index = pat_index;
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
@@ -2307,8 +2284,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 		switch (op->base.op) {
 		case DRM_GPUVA_OP_MAP:
 		{
-			flags |= op->map.read_only ?
-				VMA_CREATE_FLAG_READ_ONLY : 0;
 			flags |= op->map.is_null ?
 				VMA_CREATE_FLAG_IS_NULL : 0;
 
@@ -2439,7 +2414,7 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
 	case DRM_GPUVA_OP_MAP:
 		err = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
 				 op->syncs, op->num_syncs,
-				 op->map.immediate || !xe_vm_in_fault_mode(vm),
+				 !xe_vm_in_fault_mode(vm),
 				 op->flags & XE_VMA_OP_FIRST,
 				 op->flags & XE_VMA_OP_LAST);
 		break;
@@ -2714,9 +2689,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 	return 0;
 }
 
-#define SUPPORTED_FLAGS	\
-	(DRM_XE_VM_BIND_FLAG_READONLY | \
-	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL)
+#define SUPPORTED_FLAGS	(DRM_XE_VM_BIND_FLAG_NULL)
 #define XE_64K_PAGE_MASK 0xffffull
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
 
@@ -2796,12 +2769,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		    XE_IOCTL_DBG(xe, !obj &&
 				 op == DRM_XE_VM_BIND_OP_MAP &&
 				 !is_null) ||
-		    XE_IOCTL_DBG(xe, !obj &&
-				 op == DRM_XE_VM_BIND_OP_UNMAP_ALL) ||
-		    XE_IOCTL_DBG(xe, addr &&
-				 op == DRM_XE_VM_BIND_OP_UNMAP_ALL) ||
-		    XE_IOCTL_DBG(xe, range &&
-				 op == DRM_XE_VM_BIND_OP_UNMAP_ALL) ||
 		    XE_IOCTL_DBG(xe, obj &&
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
@@ -2820,9 +2787,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 
 		if (XE_IOCTL_DBG(xe, obj_offset & ~PAGE_MASK) ||
 		    XE_IOCTL_DBG(xe, addr & ~PAGE_MASK) ||
-		    XE_IOCTL_DBG(xe, range & ~PAGE_MASK) ||
-		    XE_IOCTL_DBG(xe, !range &&
-				 op != DRM_XE_VM_BIND_OP_UNMAP_ALL)) {
+		    XE_IOCTL_DBG(xe, range & ~PAGE_MASK)) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 5ac9c5bebabc..fe92f9fc766e 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -286,10 +286,6 @@ struct xe_vm {
 struct xe_vma_op_map {
 	/** @vma: VMA to map */
 	struct xe_vma *vma;
-	/** @immediate: Immediate bind */
-	bool immediate;
-	/** @read_only: Read only */
-	bool read_only;
 	/** @is_null: is NULL binding */
 	bool is_null;
 	/** @pat_index: The pat index to use for this operation. */
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 50bbea0992d9..868e3ea10078 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -827,14 +827,9 @@ struct drm_xe_vm_destroy {
  *  - %DRM_XE_VM_BIND_OP_MAP
  *  - %DRM_XE_VM_BIND_OP_UNMAP
  *  - %DRM_XE_VM_BIND_OP_MAP_USERPTR
- *  - %DRM_XE_VM_BIND_OP_UNMAP_ALL
  *  - %DRM_XE_VM_BIND_OP_PREFETCH
  *
  * and the @flags can be:
- *  - %DRM_XE_VM_BIND_FLAG_READONLY
- *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - Valid on a faulting VM only, do the
- *    MAP operation immediately rather than deferring the MAP to the page
- *    fault handler.
  *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
  *    tables are setup with a special bit which indicates writes are
  *    dropped and all reads return zero. In the future, the NULL flags
@@ -912,23 +907,20 @@ struct drm_xe_vm_bind_op {
 	};
 
 	/**
-	 * @range: Number of bytes from the object to bind to addr, MBZ for UNMAP_ALL
+	 * @range: Number of bytes from the object to bind to addr
 	 */
 	__u64 range;
 
-	/** @addr: Address to operate on, MBZ for UNMAP_ALL */
+	/** @addr: Address to operate on */
 	__u64 addr;
 
 #define DRM_XE_VM_BIND_OP_MAP		0x0
 #define DRM_XE_VM_BIND_OP_UNMAP		0x1
 #define DRM_XE_VM_BIND_OP_MAP_USERPTR	0x2
-#define DRM_XE_VM_BIND_OP_UNMAP_ALL	0x3
 #define DRM_XE_VM_BIND_OP_PREFETCH	0x4
 	/** @op: Bind operation to perform */
 	__u32 op;
 
-#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
-#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
 #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
 	/** @flags: Bind flags */
 	__u32 flags;
@@ -1044,20 +1036,7 @@ struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
-/* Monitor 128KB contiguous region with 4K sub-granularity */
-#define     DRM_XE_ACC_GRANULARITY_128K				0
-/* Monitor 2MB contiguous region with 64KB sub-granularity */
-#define     DRM_XE_ACC_GRANULARITY_2M				1
-/* Monitor 16MB contiguous region with 512KB sub-granularity */
-#define     DRM_XE_ACC_GRANULARITY_16M				2
-/* Monitor 64MB contiguous region with 2M sub-granularity */
-#define     DRM_XE_ACC_GRANULARITY_64M				3
 
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
-- 
2.34.1

