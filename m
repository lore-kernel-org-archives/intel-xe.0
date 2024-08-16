Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D41C531DE
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 19:00:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2191D10E82A;
	Fri, 16 Aug 2024 19:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TIk5xBPy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB05F10E82A
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 19:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723834849; x=1755370849;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wvCF9K+Y6a7ALC3bM0c/BJGR7CEKpSnB6TicKX0sNbY=;
 b=TIk5xBPy84ILUAOBJq0hFV0Mw70nEzyfD2/GV7AogKJ3XUF7reb4HKHs
 T+rLdbwV1hia2kKS5FIz5pqGM3DlVzK/789EfWmxDdPA3YvMo9QxNRBY7
 K7El4z/Y6aEHuh+Qp2dA8mtBPQ0mb6hlZKtnvOsP61Vlaq+OfPKyjtGKS
 nPKx6/BhbvVMmZjqejbY8K+U67zzQqJywiGr35ja5UHv94s2UaCzNQpHi
 r9/epHhKj8nJxi0nPweXGI7lrQ2x/C61WRlRrnAmvBnrt2Um+CrNI4a9/
 bKC10Mh7drtoeuqYX2JgSNSEiRyq1bNF0oPtkUqPi7zvbg+IuJgMbxBW3 w==;
X-CSE-ConnectionGUID: TP3r6orhQBi8DX8Hil1fgQ==
X-CSE-MsgGUID: yRJOrZGkSm6wGJL3e/UjOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21772456"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="21772456"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 12:00:49 -0700
X-CSE-ConnectionGUID: MORb6B9OQ3aqiM3Vnt8Igw==
X-CSE-MsgGUID: e6g9jSpMTISwFFdo/kzm3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="59767964"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 12:00:49 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 07/12] drm/xe/pxp: Add spport for PXP-using queues
Date: Fri, 16 Aug 2024 12:00:16 -0700
Message-ID: <20240816190024.2176976-8-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
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
PXP instructions will work. When a PXP queue is created, the driver will
do the following:
- Start the default PXP session if it is not already running;
- set the relevant bits in the context control register;
- assign an rpm ref to the queue to keep for its lifetime (this is
  required because PXP HWDRM sessions are killed by the HW suspend flow).

When a PXP invalidation occurs, all the PXP queue will be killed.
On submission of a valid PXP queue, the driver will validate all
encrypted objects mapped to the VM to ensured they were encrypted with
the current key.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   1 +
 drivers/gpu/drm/xe/xe_exec_queue.c       |  58 ++++-
 drivers/gpu/drm/xe/xe_exec_queue.h       |   5 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   8 +
 drivers/gpu/drm/xe/xe_hw_engine.c        |   2 +-
 drivers/gpu/drm/xe/xe_lrc.c              |  16 +-
 drivers/gpu/drm/xe/xe_lrc.h              |   4 +-
 drivers/gpu/drm/xe/xe_pxp.c              | 295 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pxp.h              |   7 +
 drivers/gpu/drm/xe/xe_pxp_submit.c       |   4 +-
 drivers/gpu/drm/xe/xe_pxp_types.h        |  26 ++
 include/uapi/drm/xe_drm.h                |  40 ++-
 12 files changed, 450 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 81b71903675e..3692e887f503 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -130,6 +130,7 @@
 #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
 
 #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
+#define	  CTX_CTRL_PXP_ENABLE			REG_BIT(10)
 #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
 #define	  CTX_CTRL_RUN_ALONE			REG_BIT(7)
 #define	  CTX_CTRL_INDIRECT_RING_STATE_ENABLE	REG_BIT(4)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index e98e8794eddf..504ba4aa2357 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -22,6 +22,8 @@
 #include "xe_ring_ops_types.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
+#include "xe_pxp.h"
+#include "xe_pxp_types.h"
 
 enum xe_exec_queue_sched_prop {
 	XE_EXEC_QUEUE_JOB_TIMEOUT = 0,
@@ -35,6 +37,8 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
 
 static void __xe_exec_queue_free(struct xe_exec_queue *q)
 {
+	if (xe_exec_queue_uses_pxp(q))
+		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
 	if (q->vm)
 		xe_vm_put(q->vm);
 
@@ -73,6 +77,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->ops = gt->exec_queue_ops;
 	INIT_LIST_HEAD(&q->lr.link);
 	INIT_LIST_HEAD(&q->multi_gt_link);
+	INIT_LIST_HEAD(&q->pxp.link);
 
 	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
 	q->sched_props.preempt_timeout_us =
@@ -107,6 +112,21 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
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
@@ -115,7 +135,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	}
 
 	for (i = 0; i < q->width; ++i) {
-		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K);
+		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, flags);
 		if (IS_ERR(q->lrc[i])) {
 			err = PTR_ERR(q->lrc[i]);
 			goto err_unlock;
@@ -160,6 +180,17 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
 	if (err)
 		goto err_post_alloc;
 
+	/*
+	 * we can only add the queue to the PXP list after the init is complete,
+	 * because the PXP termination can call exec_queue_kill and that will
+	 * go bad if the queue is only half-initialized.
+	 */
+	if (xe_exec_queue_uses_pxp(q)) {
+		err = xe_pxp_exec_queue_add(xe->pxp, q);
+		if (err)
+			goto err_post_alloc;
+	}
+
 	return q;
 
 err_post_alloc:
@@ -197,6 +228,9 @@ void xe_exec_queue_destroy(struct kref *ref)
 	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
 	struct xe_exec_queue *eq, *next;
 
+	if (xe_exec_queue_uses_pxp(q))
+		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
+
 	xe_exec_queue_last_fence_put_unlocked(q);
 	if (!(q->flags & EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD)) {
 		list_for_each_entry_safe(eq, next, &q->multi_gt_list,
@@ -343,6 +377,24 @@ static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *
 	return 0;
 }
 
+static int
+exec_queue_set_pxp_type(struct xe_device *xe, struct xe_exec_queue *q, u64 value)
+{
+	BUILD_BUG_ON(DRM_XE_PXP_TYPE_NONE != 0);
+
+	if (value == DRM_XE_PXP_TYPE_NONE)
+		return 0;
+
+	if (!xe_pxp_is_enabled(xe->pxp))
+		return -ENODEV;
+
+	/* we only support HWDRM sessions right now */
+	if (XE_IOCTL_DBG(xe, value != DRM_XE_PXP_TYPE_HWDRM))
+		return -EINVAL;
+
+	return xe_pxp_exec_queue_set_type(xe->pxp, q, DRM_XE_PXP_TYPE_HWDRM);
+}
+
 typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 					     struct xe_exec_queue *q,
 					     u64 value);
@@ -350,6 +402,7 @@ typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
+	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
 };
 
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
@@ -369,7 +422,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 			 ARRAY_SIZE(exec_queue_set_property_funcs)) ||
 	    XE_IOCTL_DBG(xe, ext.pad) ||
 	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
-			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE))
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index ded77b0f3b90..7fa97719667a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -53,6 +53,11 @@ static inline bool xe_exec_queue_is_parallel(struct xe_exec_queue *q)
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
index 1408b02eea53..28b56217f1df 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -130,6 +130,14 @@ struct xe_exec_queue {
 		spinlock_t lock;
 	} lr;
 
+	/** @pxp: PXP info tracking */
+	struct {
+		/** @pxp.type: PXP session type used by this queue */
+		u8 type;
+		/** @pxp.link: link into the list of PXP exec queues */
+		struct list_head link;
+	} pxp;
+
 	/** @ops: submission backend exec queue operations */
 	const struct xe_exec_queue_ops *ops;
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index e195022ca836..469932e7d7a6 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -557,7 +557,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 		goto err_name;
 	}
 
-	hwe->kernel_lrc = xe_lrc_create(hwe, NULL, SZ_16K);
+	hwe->kernel_lrc = xe_lrc_create(hwe, NULL, SZ_16K, 0);
 	if (IS_ERR(hwe->kernel_lrc)) {
 		err = PTR_ERR(hwe->kernel_lrc);
 		goto err_hwsp;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 974a9cd8c379..4f3e676db646 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -893,7 +893,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
 
 static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
-		       struct xe_vm *vm, u32 ring_size)
+		       struct xe_vm *vm, u32 ring_size, u32 init_flags)
 {
 	struct xe_gt *gt = hwe->gt;
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -981,6 +981,16 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
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
@@ -1029,7 +1039,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * upon failure.
  */
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size)
+			     u32 ring_size, u32 flags)
 {
 	struct xe_lrc *lrc;
 	int err;
@@ -1038,7 +1048,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 	if (!lrc)
 		return ERR_PTR(-ENOMEM);
 
-	err = xe_lrc_init(lrc, hwe, vm, ring_size);
+	err = xe_lrc_init(lrc, hwe, vm, ring_size, flags);
 	if (err) {
 		kfree(lrc);
 		return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index d411c3fbcbc6..cc8091bba2a0 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -23,8 +23,10 @@ struct xe_vm;
 #define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
 #define LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR (0x40 * 4)
 
+#define XE_LRC_CREATE_RUNALONE 0x1
+#define XE_LRC_CREATE_PXP 0x2
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size);
+			     u32 ring_size, u32 flags);
 void xe_lrc_destroy(struct kref *ref);
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index 382eb0cb0018..acdc25c8e8a1 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -6,11 +6,17 @@
 #include "xe_pxp.h"
 
 #include <drm/drm_managed.h>
+#include <drm/xe_drm.h>
 
 #include "xe_device_types.h"
+#include "xe_exec_queue.h"
+#include "xe_exec_queue_types.h"
 #include "xe_force_wake.h"
+#include "xe_guc_submit.h"
+#include "xe_gsc_proxy.h"
 #include "xe_gt.h"
 #include "xe_gt_types.h"
+#include "xe_huc.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_pxp_submit.h"
@@ -27,18 +33,45 @@
  * integrated parts.
  */
 
-#define ARB_SESSION 0xF /* TODO: move to UAPI */
+#define ARB_SESSION DRM_XE_PXP_HWDRM_DEFAULT_SESSION /* shorter define */
 
 bool xe_pxp_is_supported(const struct xe_device *xe)
 {
 	return xe->info.has_pxp && IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY);
 }
 
-static bool pxp_is_enabled(const struct xe_pxp *pxp)
+bool xe_pxp_is_enabled(const struct xe_pxp *pxp)
 {
 	return pxp;
 }
 
+static bool pxp_prerequisites_done(const struct xe_pxp *pxp)
+{
+	bool ready;
+
+	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pxp->gt), XE_FW_GSC));
+
+	/* PXP requires both HuC authentication via GSC and GSC proxy initialized */
+	ready = xe_huc_is_authenticated(&pxp->gt->uc.huc, XE_HUC_AUTH_VIA_GSC) &&
+		xe_gsc_proxy_init_done(&pxp->gt->uc.gsc);
+
+	xe_force_wake_put(gt_to_fw(pxp->gt), XE_FW_GSC);
+
+	return ready;
+}
+
+static bool pxp_session_is_in_play(struct xe_pxp *pxp, u32 id)
+{
+	struct xe_gt *gt = pxp->gt;
+	u32 sip = 0;
+
+	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+	sip = xe_mmio_read32(gt, KCR_SIP);
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+
+	return sip & BIT(id);
+}
+
 static int pxp_wait_for_session_state(struct xe_pxp *pxp, u32 id, bool in_play)
 {
 	struct xe_gt *gt = pxp->gt;
@@ -56,12 +89,30 @@ static int pxp_wait_for_session_state(struct xe_pxp *pxp, u32 id, bool in_play)
 	return ret;
 }
 
+static void pxp_invalidate_queues(struct xe_pxp *pxp);
+
 static void pxp_terminate(struct xe_pxp *pxp)
 {
 	int ret = 0;
 	struct xe_device *xe = pxp->xe;
 	struct xe_gt *gt = pxp->gt;
 
+	pxp_invalidate_queues(pxp);
+
+	/*
+	 * If we have a termination already in progress, we need to wait for
+	 * it to complete before queueing another one. We update the state
+	 * to signal that another termination is required and leave it to the
+	 * pxp_start() call to take care of it.
+	 */
+	if (!completion_done(&pxp->termination)) {
+		pxp->status = XE_PXP_NEEDS_TERMINATION;
+		return;
+	}
+
+	reinit_completion(&pxp->termination);
+	pxp->status = XE_PXP_TERMINATION_IN_PROGRESS;
+
 	drm_dbg(&xe->drm, "Terminating PXP\n");
 
 	/* terminate the hw session */
@@ -82,13 +133,32 @@ static void pxp_terminate(struct xe_pxp *pxp)
 	ret = xe_pxp_submit_session_invalidation(&pxp->gsc_res, ARB_SESSION);
 
 out:
-	if (ret)
+	if (ret) {
 		drm_err(&xe->drm, "PXP termination failed: %pe\n", ERR_PTR(ret));
+		pxp->status = XE_PXP_ERROR;
+		complete_all(&pxp->termination);
+	}
 }
 
 static void pxp_terminate_complete(struct xe_pxp *pxp)
 {
-	/* TODO mark the session as ready to start */
+	/*
+	 * We expect PXP to be in one of 2 states when we get here:
+	 * - XE_PXP_TERMINATION_IN_PROGRESS: a single termination event was
+	 * requested and it is now completing, so we're ready to start.
+	 * - XE_PXP_NEEDS_TERMINATION: a second termination was requested while
+	 * the first one was still being processed; we don't update the state
+	 * in this case so the pxp_start code will automatically issue that
+	 * second termination.
+	 */
+	if (pxp->status == XE_PXP_TERMINATION_IN_PROGRESS)
+		pxp->status = XE_PXP_READY_TO_START;
+	else if (pxp->status != XE_PXP_NEEDS_TERMINATION)
+		drm_err(&pxp->xe->drm,
+			"PXP termination complete while status was %u\n",
+			pxp->status);
+
+	complete_all(&pxp->termination);
 }
 
 static void pxp_irq_work(struct work_struct *work)
@@ -112,6 +182,8 @@ static void pxp_irq_work(struct work_struct *work)
 	if ((events & PXP_TERMINATION_REQUEST) && !xe_pm_runtime_get_if_active(xe))
 		return;
 
+	mutex_lock(&pxp->mutex);
+
 	if (events & PXP_TERMINATION_REQUEST) {
 		events &= ~PXP_TERMINATION_COMPLETE;
 		pxp_terminate(pxp);
@@ -120,6 +192,8 @@ static void pxp_irq_work(struct work_struct *work)
 	if (events & PXP_TERMINATION_COMPLETE)
 		pxp_terminate_complete(pxp);
 
+	mutex_unlock(&pxp->mutex);
+
 	if (events & PXP_TERMINATION_REQUEST)
 		xe_pm_runtime_put(xe);
 }
@@ -133,7 +207,7 @@ void xe_pxp_irq_handler(struct xe_device *xe, u16 iir)
 {
 	struct xe_pxp *pxp = xe->pxp;
 
-	if (!pxp_is_enabled(pxp)) {
+	if (!xe_pxp_is_enabled(pxp)) {
 		drm_err(&xe->drm, "PXP irq 0x%x received with PXP disabled!\n", iir);
 		return;
 	}
@@ -230,10 +304,22 @@ int xe_pxp_init(struct xe_device *xe)
 	if (!pxp)
 		return -ENOMEM;
 
+	INIT_LIST_HEAD(&pxp->queues.list);
+	spin_lock_init(&pxp->queues.lock);
 	INIT_WORK(&pxp->irq.work, pxp_irq_work);
 	pxp->xe = xe;
 	pxp->gt = gt;
 
+	/*
+	 * we'll use the completion to check if there is a termination pending,
+	 * so we start it as completed and we reinit it when a termination
+	 * is triggered.
+	 */
+	init_completion(&pxp->termination);
+	complete_all(&pxp->termination);
+
+	mutex_init(&pxp->mutex);
+
 	pxp->irq.wq = alloc_ordered_workqueue("pxp-wq", 0);
 	if (!pxp->irq.wq)
 		return -ENOMEM;
@@ -256,3 +342,202 @@ int xe_pxp_init(struct xe_device *xe)
 	destroy_workqueue(pxp->irq.wq);
 	return err;
 }
+
+static int __pxp_start_arb_session(struct xe_pxp *pxp)
+{
+	int ret;
+
+	if (pxp_session_is_in_play(pxp, ARB_SESSION))
+		return -EEXIST;
+
+	ret = xe_pxp_submit_session_init(&pxp->gsc_res, ARB_SESSION);
+	if (ret) {
+		drm_err(&pxp->xe->drm, "Failed to init PXP arb session\n");
+		goto out;
+	}
+
+	ret = pxp_wait_for_session_state(pxp, ARB_SESSION, true);
+	if (ret) {
+		drm_err(&pxp->xe->drm, "PXP ARB session failed to go in play\n");
+		goto out;
+	}
+
+	drm_dbg(&pxp->xe->drm, "PXP ARB session is active\n");
+
+out:
+	if (!ret)
+		pxp->status = XE_PXP_ACTIVE;
+	else
+		pxp->status = XE_PXP_ERROR;
+
+	return ret;
+}
+
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
+/**
+ * xe_pxp_exec_queue_add - add a queue to the PXP list
+ * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
+ * @q: the queue to add to the list
+ *
+ * If PXP is enabled and the prerequisites are done, start the PXP ARB
+ * session (if not already running) and add the queue to the PXP list. Note
+ * that the queue must have previously been marked as using PXP with
+ * xe_pxp_exec_queue_set_type.
+ *
+ * Returns 0 if the PXP ARB session is running and the queue is in the list,
+ * -ENODEV if PXP is disabled, -EBUSY if the PXP prerequisites are not done,
+ * other errno value if something goes wrong during the session start.
+ */
+#define PXP_TERMINATION_TIMEOUT_MS 500
+int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
+{
+	int ret = 0;
+
+	if (!xe_pxp_is_enabled(pxp))
+		return -ENODEV;
+
+	/* we only support HWDRM sessions right now */
+	xe_assert(pxp->xe, q->pxp.type == DRM_XE_PXP_TYPE_HWDRM);
+
+	/*
+	 * Runtime suspend kills PXP, so we need to turn it off while we have
+	 * active queues that use PXP
+	 */
+	xe_pm_runtime_get(pxp->xe);
+
+	if (!pxp_prerequisites_done(pxp)) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+wait_for_termination:
+	/*
+	 * if there is a termination in progress, wait for it.
+	 * We need to wait outside the lock because the completion is done from
+	 * within the lock
+	 */
+	if (!wait_for_completion_timeout(&pxp->termination,
+					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS)))
+		return -ETIMEDOUT;
+
+	mutex_lock(&pxp->mutex);
+
+	/*
+	 * check if a new termination was issued between the above check and
+	 * grabbing the mutex
+	 */
+	if (!completion_done(&pxp->termination)) {
+		mutex_unlock(&pxp->mutex);
+		goto wait_for_termination;
+	}
+
+	/* If PXP is not already active, turn it on */
+	switch (pxp->status) {
+	case XE_PXP_ERROR:
+		ret = -EIO;
+		break;
+	case XE_PXP_ACTIVE:
+		break;
+	case XE_PXP_READY_TO_START:
+		ret = __pxp_start_arb_session(pxp);
+		break;
+	case XE_PXP_NEEDS_TERMINATION:
+		pxp_terminate(pxp);
+		mutex_unlock(&pxp->mutex);
+		goto wait_for_termination;
+	default:
+		drm_err(&pxp->xe->drm, "unexpected state during PXP start: %u", pxp->status);
+		ret = -EIO;
+		break;
+	}
+
+	/* If everything went ok, add the queue to the list */
+	if (!ret) {
+		spin_lock_irq(&pxp->queues.lock);
+		list_add_tail(&q->pxp.link, &pxp->queues.list);
+		spin_unlock_irq(&pxp->queues.lock);
+	}
+
+	mutex_unlock(&pxp->mutex);
+
+out:
+	/*
+	 * in the successful case the PM ref is released from
+	 * xe_pxp_exec_queue_remove
+	 */
+	if (ret)
+		xe_pm_runtime_put(pxp->xe);
+
+	return ret;
+}
+
+/**
+ * xe_pxp_exec_queue_remove - remove a queue from the PXP list
+ * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
+ * @q: the queue to remove from the list
+ *
+ * If PXP is enabled and the exec_queue is in the list, the queue will be
+ * removed from the list and its PM reference will be released. It is safe to
+ * call this function multiple times for the same queue.
+ */
+void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q)
+{
+	bool need_pm_put = false;
+
+	if (!xe_pxp_is_enabled(pxp))
+		return;
+
+	spin_lock_irq(&pxp->queues.lock);
+
+	if (!list_empty(&q->pxp.link)) {
+		list_del_init(&q->pxp.link);
+		need_pm_put = true;
+	}
+
+	q->pxp.type = DRM_XE_PXP_TYPE_NONE;
+
+	spin_unlock_irq(&pxp->queues.lock);
+
+	if (need_pm_put)
+		xe_pm_runtime_put(pxp->xe);
+}
+
+static void pxp_invalidate_queues(struct xe_pxp *pxp)
+{
+	struct xe_exec_queue *tmp, *q;
+
+	spin_lock_irq(&pxp->queues.lock);
+
+	list_for_each_entry(tmp, &pxp->queues.list,  pxp.link) {
+		q = xe_exec_queue_get_unless_zero(tmp);
+
+		if (!q)
+			continue;
+
+		xe_exec_queue_kill(q);
+		xe_exec_queue_put(q);
+	}
+
+	spin_unlock_irq(&pxp->queues.lock);
+}
+
diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
index 81bafe2714ff..2e0ab186072a 100644
--- a/drivers/gpu/drm/xe/xe_pxp.h
+++ b/drivers/gpu/drm/xe/xe_pxp.h
@@ -9,10 +9,17 @@
 #include <linux/types.h>
 
 struct xe_device;
+struct xe_exec_queue;
+struct xe_pxp;
 
 bool xe_pxp_is_supported(const struct xe_device *xe);
+bool xe_pxp_is_enabled(const struct xe_pxp *pxp);
 
 int xe_pxp_init(struct xe_device *xe);
 void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
 
+int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 type);
+int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q);
+void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q);
+
 #endif /* __XE_PXP_H__ */
diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
index c9258c861556..becffa6dfd4c 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.c
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
@@ -26,8 +26,6 @@
 #include "instructions/xe_mi_commands.h"
 #include "regs/xe_gt_regs.h"
 
-#define ARB_SESSION 0xF /* TODO: move to UAPI */
-
 /*
  * The VCS is used for kernel-owned GGTT submissions to issue key termination.
  * Terminations are serialized, so we only need a single queue and a single
@@ -495,7 +493,7 @@ int xe_pxp_submit_session_init(struct xe_pxp_gsc_client_resources *gsc_res, u32
 				   FIELD_PREP(PXP43_INIT_SESSION_APPTYPE, 0));
 	msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
 
-	if (id == ARB_SESSION)
+	if (id == DRM_XE_PXP_HWDRM_DEFAULT_SESSION)
 		msg_in.protection_mode = PXP43_INIT_SESSION_PROTECTION_ARB;
 
 	ret = gsccs_send_message(gsc_res, &msg_in, sizeof(msg_in),
diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
index d5cf8faed7be..eb6a0183320a 100644
--- a/drivers/gpu/drm/xe/xe_pxp_types.h
+++ b/drivers/gpu/drm/xe/xe_pxp_types.h
@@ -6,7 +6,10 @@
 #ifndef __XE_PXP_TYPES_H__
 #define __XE_PXP_TYPES_H__
 
+#include <linux/completion.h>
 #include <linux/iosys-map.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
 
@@ -16,6 +19,14 @@ struct xe_device;
 struct xe_gt;
 struct xe_vm;
 
+enum xe_pxp_status {
+	XE_PXP_ERROR = -1,
+	XE_PXP_NEEDS_TERMINATION = 0, /* starting status */
+	XE_PXP_TERMINATION_IN_PROGRESS,
+	XE_PXP_READY_TO_START,
+	XE_PXP_ACTIVE
+};
+
 /**
  * struct xe_pxp_gsc_client_resources - resources for GSC submission by a PXP
  * client. The GSC FW supports multiple GSC client active at the same time.
@@ -82,6 +93,21 @@ struct xe_pxp {
 #define PXP_TERMINATION_REQUEST  BIT(0)
 #define PXP_TERMINATION_COMPLETE BIT(1)
 	} irq;
+
+	/** @mutex: protects the pxp status and the queue list */
+	struct mutex mutex;
+	/** @status: the current pxp status */
+	enum xe_pxp_status status;
+	/** @termination: completion struct that tracks terminations */
+	struct completion termination;
+
+	/** @queues: management of exec_queues that use PXP */
+	struct {
+		/** @queues.lock: spinlock protecting the queue management */
+		spinlock_t lock;
+		/** @queues.list: list of exec_queues that use PXP */
+		struct list_head list;
+	} queues;
 };
 
 #endif /* __XE_PXP_TYPES_H__ */
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b6fbe4988f2e..5f4d08123672 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1085,6 +1085,24 @@ struct drm_xe_vm_bind {
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
+ *    duration.
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
@@ -1108,7 +1126,7 @@ struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
-
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -1694,6 +1712,26 @@ struct drm_xe_oa_stream_info {
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

