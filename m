Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECBBE77198
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 21:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6833610EA1A;
	Mon,  6 Jan 2025 21:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TShvG+tB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F7B10EA1A
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jan 2025 21:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736197957; x=1767733957;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QfB2lKQDtblLk8NfH1XmpGlxDTMIL/lQJ3+lrzK5lKg=;
 b=TShvG+tBJs1dbu1DKjkXwqF/2m0sZgDHFSn1dVYddBre6EQrvt0O0KSE
 Q49uhA3mhrPECvB2Pcjn+dz18YPolraxIMO2N/yaSh2Q9dBv0Zu4hj6kw
 qtK5fUHzemlcNj5JsFmQ29eJFZZJrm54/mEjXtPb9GgORM+8T+cfRvhgF
 NZOfeaNV8fuc0+CkPtWMsO4r50a4zwYLDxWlnoOyP0FHwo3EzPNaA4KAy
 08qNUIvCZK436jyRdAnUqrX7pPdqchVL/fWI4bm5k15fwNEfPu31iwgrE
 DKNQO80MWhkFspTpGkMKoKTGnJkh36i8IEHKMLWxztHmfDS+oT/vGgIjw Q==;
X-CSE-ConnectionGUID: Uru+Zd0PRtOtVl2+M6gTrw==
X-CSE-MsgGUID: svdhPBz9So+ZEM5aBrjCNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="61734937"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="61734937"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 13:12:37 -0800
X-CSE-ConnectionGUID: I399WsD+R9elZ6nrQvRg2w==
X-CSE-MsgGUID: Leu8RuKgTvmTGlPQGVSCbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="107417835"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 13:12:36 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v4 08/13] drm/xe/pxp: Add userspace and LRC support for
 PXP-using queues
Date: Mon,  6 Jan 2025 13:12:05 -0800
Message-ID: <20250106211212.3418231-9-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250106211212.3418231-1-daniele.ceraolospurio@intel.com>
References: <20250106211212.3418231-1-daniele.ceraolospurio@intel.com>
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

Userspace is required to mark a queue as using PXP to guarantee that the
PXP instructions will work. In addition to managing the PXP sessions,
when a PXP queue is created the driver will set the relevant bits in
its context control register.

On submission of a valid PXP queue, the driver will validate all
encrypted objects mapped to the VM to ensured they were encrypted with
the current key.

v2: Remove pxp_types include outside of PXP code (Jani), better comments
and code cleanup (John)

v3: split the internal PXP management to a separate patch for ease of
review. re-order ioctl checks to always return -EINVAL if parameters are
invalid, rebase on msix changes.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
 drivers/gpu/drm/xe/xe_exec_queue.c       | 56 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.h       |  5 +++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
 drivers/gpu/drm/xe/xe_execlist.c         |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c              | 18 ++++++--
 drivers/gpu/drm/xe/xe_lrc.h              |  4 +-
 drivers/gpu/drm/xe/xe_pxp.c              | 35 +++++++++++++--
 drivers/gpu/drm/xe/xe_pxp.h              |  4 +-
 include/uapi/drm/xe_drm.h                | 40 ++++++++++++++++-
 10 files changed, 153 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index d86219dedde2..c8fd3d5ca502 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -132,6 +132,7 @@
 #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
 
 #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
+#define	  CTX_CTRL_PXP_ENABLE			REG_BIT(10)
 #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
 #define	  CTX_CTRL_RUN_ALONE			REG_BIT(7)
 #define	  CTX_CTRL_INDIRECT_RING_STATE_ENABLE	REG_BIT(4)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 2ec4e2eb6f2a..6051db78d706 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -25,6 +25,7 @@
 #include "xe_ring_ops_types.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
+#include "xe_pxp.h"
 
 enum xe_exec_queue_sched_prop {
 	XE_EXEC_QUEUE_JOB_TIMEOUT = 0,
@@ -38,6 +39,8 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
 
 static void __xe_exec_queue_free(struct xe_exec_queue *q)
 {
+	if (xe_exec_queue_uses_pxp(q))
+		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
 	if (q->vm)
 		xe_vm_put(q->vm);
 
@@ -113,6 +116,21 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 {
 	struct xe_vm *vm = q->vm;
 	int i, err;
+	u32 flags = 0;
+
+	/*
+	 * PXP workloads executing on RCS or CCS must run in isolation (i.e. no
+	 * other workload can use the EUs at the same time). On MTL this is done
+	 * by setting the RUNALONE bit in the LRC, while starting on Xe2 there
+	 * is a dedicated bit for it.
+	 */
+	if (xe_exec_queue_uses_pxp(q) &&
+	    (q->class == XE_ENGINE_CLASS_RENDER || q->class == XE_ENGINE_CLASS_COMPUTE)) {
+		if (GRAPHICS_VER(gt_to_xe(q->gt)) >= 20)
+			flags |= XE_LRC_CREATE_PXP;
+		else
+			flags |= XE_LRC_CREATE_RUNALONE;
+	}
 
 	if (vm) {
 		err = xe_vm_lock(vm, true);
@@ -121,7 +139,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	}
 
 	for (i = 0; i < q->width; ++i) {
-		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec);
+		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
 		if (IS_ERR(q->lrc[i])) {
 			err = PTR_ERR(q->lrc[i]);
 			goto err_unlock;
@@ -166,6 +184,19 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
 	if (err)
 		goto err_post_alloc;
 
+	/*
+	 * We can only add the queue to the PXP list after the init is complete,
+	 * because the PXP termination can call exec_queue_kill and that will
+	 * go bad if the queue is only half-initialized. This means that we
+	 * can't do it when we handle the PXP extension in __xe_exec_queue_alloc
+	 * and we need to do it here instead.
+	 */
+	if (xe_exec_queue_uses_pxp(q)) {
+		err = xe_pxp_exec_queue_add(xe->pxp, q);
+		if (err)
+			goto err_post_alloc;
+	}
+
 	return q;
 
 err_post_alloc:
@@ -254,6 +285,9 @@ void xe_exec_queue_destroy(struct kref *ref)
 	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
 	struct xe_exec_queue *eq, *next;
 
+	if (xe_exec_queue_uses_pxp(q))
+		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
+
 	xe_exec_queue_last_fence_put_unlocked(q);
 	if (!(q->flags & EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD)) {
 		list_for_each_entry_safe(eq, next, &q->multi_gt_list,
@@ -409,6 +443,22 @@ static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *
 	return 0;
 }
 
+static int
+exec_queue_set_pxp_type(struct xe_device *xe, struct xe_exec_queue *q, u64 value)
+{
+	if (value == DRM_XE_PXP_TYPE_NONE)
+		return 0;
+
+	/* we only support HWDRM sessions right now */
+	if (XE_IOCTL_DBG(xe, value != DRM_XE_PXP_TYPE_HWDRM))
+		return -EINVAL;
+
+	if (!xe_pxp_is_enabled(xe->pxp))
+		return -ENODEV;
+
+	return xe_pxp_exec_queue_set_type(xe->pxp, q, DRM_XE_PXP_TYPE_HWDRM);
+}
+
 typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 					     struct xe_exec_queue *q,
 					     u64 value);
@@ -416,6 +466,7 @@ typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
+	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
 };
 
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
@@ -435,7 +486,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 			 ARRAY_SIZE(exec_queue_set_property_funcs)) ||
 	    XE_IOCTL_DBG(xe, ext.pad) ||
 	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
-			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE))
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 90c7f73eab88..17bc50a7f05a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -57,6 +57,11 @@ static inline bool xe_exec_queue_is_parallel(struct xe_exec_queue *q)
 	return q->width > 1;
 }
 
+static inline bool xe_exec_queue_uses_pxp(struct xe_exec_queue *q)
+{
+	return q->pxp.type;
+}
+
 bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
 
 bool xe_exec_queue_ring_full(struct xe_exec_queue *q);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 6d85a069947f..6eb7ff091534 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -132,6 +132,8 @@ struct xe_exec_queue {
 
 	/** @pxp: PXP info tracking */
 	struct {
+		/** @pxp.type: PXP session type used by this queue */
+		u8 type;
 		/** @pxp.link: link into the list of PXP exec queues */
 		struct list_head link;
 	} pxp;
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 5ef96deaa881..779a52daf3d7 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -269,7 +269,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
 
 	port->hwe = hwe;
 
-	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K, XE_IRQ_DEFAULT_MSIX);
+	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K, XE_IRQ_DEFAULT_MSIX, 0);
 	if (IS_ERR(port->lrc)) {
 		err = PTR_ERR(port->lrc);
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index bbb9ffbf6367..df3ceddede07 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -883,7 +883,8 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
 
 static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
-		       struct xe_vm *vm, u32 ring_size, u16 msix_vec)
+		       struct xe_vm *vm, u32 ring_size, u16 msix_vec,
+		       u32 init_flags)
 {
 	struct xe_gt *gt = hwe->gt;
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -979,6 +980,16 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 				     RING_CTL_SIZE(lrc->ring.size) | RING_VALID);
 	}
 
+	if (init_flags & XE_LRC_CREATE_RUNALONE)
+		xe_lrc_write_ctx_reg(lrc, CTX_CONTEXT_CONTROL,
+				     xe_lrc_read_ctx_reg(lrc, CTX_CONTEXT_CONTROL) |
+				     _MASKED_BIT_ENABLE(CTX_CTRL_RUN_ALONE));
+
+	if (init_flags & XE_LRC_CREATE_PXP)
+		xe_lrc_write_ctx_reg(lrc, CTX_CONTEXT_CONTROL,
+				     xe_lrc_read_ctx_reg(lrc, CTX_CONTEXT_CONTROL) |
+				     _MASKED_BIT_ENABLE(CTX_CTRL_PXP_ENABLE));
+
 	xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP, 0);
 
 	if (xe->info.has_asid && vm)
@@ -1021,6 +1032,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * @vm: The VM (address space)
  * @ring_size: LRC ring size
  * @msix_vec: MSI-X interrupt vector (for platforms that support it)
+ * @flags: LRC initialization flags
  *
  * Allocate and initialize the Logical Ring Context (LRC).
  *
@@ -1028,7 +1040,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * upon failure.
  */
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size, u16 msix_vec)
+			     u32 ring_size, u16 msix_vec, u32 flags)
 {
 	struct xe_lrc *lrc;
 	int err;
@@ -1037,7 +1049,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 	if (!lrc)
 		return ERR_PTR(-ENOMEM);
 
-	err = xe_lrc_init(lrc, hwe, vm, ring_size, msix_vec);
+	err = xe_lrc_init(lrc, hwe, vm, ring_size, msix_vec, flags);
 	if (err) {
 		kfree(lrc);
 		return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index b27e80cd842a..0b40f349ab95 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -42,8 +42,10 @@ struct xe_lrc_snapshot {
 #define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
 #define LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR (0x40 * 4)
 
+#define XE_LRC_CREATE_RUNALONE 0x1
+#define XE_LRC_CREATE_PXP 0x2
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size, u16 msix_vec);
+			     u32 ring_size, u16 msix_vec, u32 flags);
 void xe_lrc_destroy(struct kref *ref);
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index d0471a360d69..05ed2e71be63 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -6,6 +6,7 @@
 #include "xe_pxp.h"
 
 #include <drm/drm_managed.h>
+#include <uapi/drm/xe_drm.h>
 
 #include "xe_device_types.h"
 #include "xe_exec_queue.h"
@@ -47,7 +48,7 @@ bool xe_pxp_is_supported(const struct xe_device *xe)
 	return xe->info.has_pxp && IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY);
 }
 
-static bool pxp_is_enabled(const struct xe_pxp *pxp)
+bool xe_pxp_is_enabled(const struct xe_pxp *pxp)
 {
 	return pxp;
 }
@@ -249,7 +250,7 @@ void xe_pxp_irq_handler(struct xe_device *xe, u16 iir)
 {
 	struct xe_pxp *pxp = xe->pxp;
 
-	if (!pxp_is_enabled(pxp)) {
+	if (!xe_pxp_is_enabled(pxp)) {
 		drm_err(&xe->drm, "PXP irq 0x%x received with PXP disabled!\n", iir);
 		return;
 	}
@@ -424,6 +425,27 @@ static int __pxp_start_arb_session(struct xe_pxp *pxp)
 	return ret;
 }
 
+/**
+ * xe_pxp_exec_queue_set_type - Mark a queue as using PXP
+ * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
+ * @q: the queue to mark as using PXP
+ * @type: the type of PXP session this queue will use
+ *
+ * Returns 0 if the selected PXP type is supported, -ENODEV otherwise.
+ */
+int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 type)
+{
+	if (!xe_pxp_is_enabled(pxp))
+		return -ENODEV;
+
+	/* we only support HWDRM sessions right now */
+	xe_assert(pxp->xe, type == DRM_XE_PXP_TYPE_HWDRM);
+
+	q->pxp.type = type;
+
+	return 0;
+}
+
 static void __exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
 {
 	spin_lock_irq(&pxp->queues.lock);
@@ -449,9 +471,12 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
 {
 	int ret = 0;
 
-	if (!pxp_is_enabled(pxp))
+	if (!xe_pxp_is_enabled(pxp))
 		return -ENODEV;
 
+	/* we only support HWDRM sessions right now */
+	xe_assert(pxp->xe, q->pxp.type == DRM_XE_PXP_TYPE_HWDRM);
+
 	/*
 	 * Runtime suspend kills PXP, so we need to turn it off while we have
 	 * active queues that use PXP
@@ -589,7 +614,7 @@ void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q)
 {
 	bool need_pm_put = false;
 
-	if (!pxp_is_enabled(pxp))
+	if (!xe_pxp_is_enabled(pxp))
 		return;
 
 	spin_lock_irq(&pxp->queues.lock);
@@ -599,6 +624,8 @@ void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q)
 		need_pm_put = true;
 	}
 
+	q->pxp.type = DRM_XE_PXP_TYPE_NONE;
+
 	spin_unlock_irq(&pxp->queues.lock);
 
 	if (need_pm_put)
diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
index f482567c27b5..2e0ab186072a 100644
--- a/drivers/gpu/drm/xe/xe_pxp.h
+++ b/drivers/gpu/drm/xe/xe_pxp.h
@@ -12,13 +12,13 @@ struct xe_device;
 struct xe_exec_queue;
 struct xe_pxp;
 
-#define DRM_XE_PXP_HWDRM_DEFAULT_SESSION 0xF /* TODO: move to uapi */
-
 bool xe_pxp_is_supported(const struct xe_device *xe);
+bool xe_pxp_is_enabled(const struct xe_pxp *pxp);
 
 int xe_pxp_init(struct xe_device *xe);
 void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
 
+int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 type);
 int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q);
 void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q);
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index f62689ca861a..5c97a758266d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1087,6 +1087,24 @@ struct drm_xe_vm_bind {
 /**
  * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
  *
+ * This ioctl supports setting the following properties via the
+ * %DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY extension, which uses the
+ * generic @drm_xe_ext_set_property struct:
+ *
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY - set the queue priority.
+ *    CAP_SYS_NICE is required to set a value above normal.
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE - set the queue timeslice
+ *    duration in microseconds.
+ *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE - set the type of PXP session
+ *    this queue will be used with. Valid values are listed in enum
+ *    drm_xe_pxp_session_type. %DRM_XE_PXP_TYPE_NONE is the default behavior, so
+ *    there is no need to explicitly set that. When a queue of type
+ *    %DRM_XE_PXP_TYPE_HWDRM is created, the PXP default HWDRM session
+ *    (%XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if isn't already running.
+ *    Given that going into a power-saving state kills PXP HWDRM sessions,
+ *    runtime PM will be blocked while queues of this type are alive.
+ *    All PXP queues will be killed if a PXP invalidation event occurs.
+ *
  * The example below shows how to use @drm_xe_exec_queue_create to create
  * a simple exec_queue (no parallel submission) of class
  * &DRM_XE_ENGINE_CLASS_RENDER.
@@ -1110,7 +1128,7 @@ struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
-
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -1729,6 +1747,26 @@ struct drm_xe_oa_stream_info {
 	__u64 reserved[3];
 };
 
+/**
+ * enum drm_xe_pxp_session_type - Supported PXP session types.
+ *
+ * We currently only support HWDRM sessions, which are used for protected
+ * content that ends up being displayed, but the HW supports multiple types, so
+ * we might extend support in the future.
+ */
+enum drm_xe_pxp_session_type {
+	/** @DRM_XE_PXP_TYPE_NONE: PXP not used */
+	DRM_XE_PXP_TYPE_NONE = 0,
+	/**
+	 * @DRM_XE_PXP_TYPE_HWDRM: HWDRM sessions are used for content that ends
+	 * up on the display.
+	 */
+	DRM_XE_PXP_TYPE_HWDRM = 1,
+};
+
+/* ID of the protected content session managed by Xe when PXP is active */
+#define DRM_XE_PXP_HWDRM_DEFAULT_SESSION 0xf
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.43.0

