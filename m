Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818A6C48BEB
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 15:59:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3131C10E7CA;
	Wed, 21 Feb 2024 15:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A3i+QZ6o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE00F10E7CA
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 15:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708531190; x=1740067190;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/iJqsf5qlNNESKhn6ASDChbQa92nUOr7TOM9pm1nA00=;
 b=A3i+QZ6oOlpX0urNM/4mhAjpCa8VBEaCM586h4hMw+fDRykgk2KEUyJZ
 ylVboDlZPXTLBPGP/C6VWWLwgwCfQ/KMqTdaaR6G0GmiY4TUx4wvPTeP7
 XKe2sSOLclg3Ml0c0m4BmB3FdLVcH85RswzBPwcs3tPCv7KLCqu3n7SXt
 M4seMSWzovUOmhD9vo4PhJZY9VuHiuChbaFyYxRdU9XeYQYsRKQwCFDK3
 JzoRXDwf/yAWgGyhcPu0Q3SN76xjsRiqo3yewT7vDBNhi2baKHTYu+2Y/
 wYHDovZIb1CJ7SJ8Ng1ocVNAIX65mQDJu9kQ+EGUPaWd11IELyXPjJ39k w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="25160925"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="25160925"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 07:59:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="9870930"
Received: from tnienhux-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.251.221.55])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 07:59:38 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3] drm/xe/uapi: Remove unused flags
Date: Wed, 21 Feb 2024 15:59:30 +0000
Message-Id: <20240221155930.7-1-francois.dugast@intel.com>
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

v2:
- Fix XE_VM_FLAG_FAULT_MODE support in xe_lrc.c (Brian Welty)
- Leave DRM_XE_VM_BIND_OP_UNMAP_ALL (José Roberto de Souza)
- Ensure invalid flag values are rejected (Rodrigo Vivi)

v3: Rebase after removal of persistent exec_queues (Francois Dugast)

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       | 94 +-----------------------
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 10 ---
 drivers/gpu/drm/xe/xe_lrc.c              | 10 +--
 drivers/gpu/drm/xe/xe_vm.c               | 12 +--
 drivers/gpu/drm/xe/xe_vm_types.h         |  4 -
 include/uapi/drm/xe_drm.h                | 19 -----
 6 files changed, 6 insertions(+), 143 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index dda90f0c9890..99f8b328f68a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -354,91 +354,6 @@ static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *
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
@@ -446,11 +361,6 @@ typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
-	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT] = exec_queue_set_preemption_timeout,
-	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT] = exec_queue_set_job_timeout,
-	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER] = exec_queue_set_acc_trigger,
-	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY] = exec_queue_set_acc_notify,
-	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY] = exec_queue_set_acc_granularity,
 };
 
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
@@ -469,7 +379,9 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 
 	if (XE_IOCTL_DBG(xe, ext.property >=
 			 ARRAY_SIZE(exec_queue_set_property_funcs)) ||
-	    XE_IOCTL_DBG(xe, ext.pad))
+	    XE_IOCTL_DBG(xe, ext.pad) ||
+	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index c40240e88068..62b3d9d1d7cd 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -141,16 +141,6 @@ struct xe_exec_queue {
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
index 8c85e90220de..7ad853b0788a 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -706,8 +706,6 @@ static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
 
 #define PVC_CTX_ASID		(0x2e + 1)
 #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
-#define ACC_GRANULARITY_S       20
-#define ACC_NOTIFY_S            16
 
 int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		struct xe_exec_queue *q, struct xe_vm *vm, u32 ring_size)
@@ -778,13 +776,7 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	xe_lrc_write_ctx_reg(lrc, CTX_RING_CTL,
 			     RING_CTL_SIZE(lrc->ring.size) | RING_VALID);
 	if (xe->info.has_asid && vm)
-		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID,
-				     (q->usm.acc_granularity <<
-				      ACC_GRANULARITY_S) | vm->usm.asid);
-	if (xe->info.has_usm && vm)
-		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ACC_CTR_THOLD,
-				     (q->usm.acc_notify << ACC_NOTIFY_S) |
-				     q->usm.acc_trigger);
+		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID, vm->usm.asid);
 
 	lrc->desc = LRC_VALID;
 	lrc->desc |= LRC_LEGACY_64B_CONTEXT << LRC_ADDRESSING_MODE_SHIFT;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 836a6e849cda..23b7036c8315 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2117,10 +2117,6 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 
 		if (__op->op == DRM_GPUVA_OP_MAP) {
-			op->map.immediate =
-				flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE;
-			op->map.read_only =
-				flags & DRM_XE_VM_BIND_FLAG_READONLY;
 			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
 			op->map.pat_index = pat_index;
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
@@ -2307,8 +2303,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 		switch (op->base.op) {
 		case DRM_GPUVA_OP_MAP:
 		{
-			flags |= op->map.read_only ?
-				VMA_CREATE_FLAG_READ_ONLY : 0;
 			flags |= op->map.is_null ?
 				VMA_CREATE_FLAG_IS_NULL : 0;
 
@@ -2439,7 +2433,7 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
 	case DRM_GPUVA_OP_MAP:
 		err = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
 				 op->syncs, op->num_syncs,
-				 op->map.immediate || !xe_vm_in_fault_mode(vm),
+				 !xe_vm_in_fault_mode(vm),
 				 op->flags & XE_VMA_OP_FIRST,
 				 op->flags & XE_VMA_OP_LAST);
 		break;
@@ -2714,9 +2708,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 	return 0;
 }
 
-#define SUPPORTED_FLAGS	\
-	(DRM_XE_VM_BIND_FLAG_READONLY | \
-	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL)
+#define SUPPORTED_FLAGS	(DRM_XE_VM_BIND_FLAG_NULL)
 #define XE_64K_PAGE_MASK 0xffffull
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
 
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
index dce06de592d0..5a5a31888a54 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -862,10 +862,6 @@ struct drm_xe_vm_destroy {
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
@@ -958,8 +954,6 @@ struct drm_xe_vm_bind_op {
 	/** @op: Bind operation to perform */
 	__u32 op;
 
-#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
-#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
 #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
 	/** @flags: Bind flags */
 	__u32 flags;
@@ -1075,19 +1069,6 @@ struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
-#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
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

