Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A63C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 21:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AF710EDA3;
	Fri, 12 Jul 2024 21:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZQI9YBjE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD9110EB81
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 21:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720819768; x=1752355768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HUk6xuu7D/eYe057z4WJE4YXUEAH7LQOIyFe2si6u2I=;
 b=ZQI9YBjEPMLifedipM8Wuuoz8cIm8h7DsOHdhfGVbqA9/1GnS8zUE/vw
 WweN59cpLc7+0nx4rJzTZ5XCwf0N5iMFoxtJbdoEG4t6Letv0VICd44xh
 aG/S2jYE3DHAIhk/7Y4O05BT74IYrX967e9f3LLmsj0Yww9B62fwEMv2d
 sv7r6iCOavWLma38/IB5kij7Jzhpnk+9PQh9eIrHzVO2Fmxc5rYbH0yMz
 8fky456kNO5LxUZuya3V9+3uVfKP41X3UNCoMJUA8XxTaDPRkI9/W1ubw
 zV++eojjDmAl5EIY56mjk1x+WUYCMN186u4jjkD7WjyNpXt0KzO35dFZQ A==;
X-CSE-ConnectionGUID: cQIJz/y0QtemtOP2bce3cw==
X-CSE-MsgGUID: Xc5KlAJTQcK5cv+kzhNCIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="17990171"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="17990171"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 14:29:28 -0700
X-CSE-ConnectionGUID: zvn3Qls/QQefxIYD/G4jkg==
X-CSE-MsgGUID: k7tbrRKRSg2Gxdqr752ncw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="53864598"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 14:29:28 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [RFC 09/14] drm/xe/pxp: Add API to mark a queue as using PXP
Date: Fri, 12 Jul 2024 14:28:53 -0700
Message-ID: <20240712212901.2684239-10-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
References: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
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
- make sure that the default PXP session is running
- set the relevant bits in the context control register
- assign an rpm ref to the queue to keep for its lifetime (this is
  required because PXP session are killed by the HW suspend flow).

When a PXP invalidation occurs, all the PXP queue will be killed.
On submission of a valid PXP queue, the driver will validate all
encrypted objects mapped to the VM to ensured they were encrypted with
the current key.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
 drivers/gpu/drm/xe/xe_exec_queue.c       | 45 ++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_exec_queue.h       |  5 +++
 drivers/gpu/drm/xe/xe_hw_engine.c        |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c              | 14 ++++++--
 drivers/gpu/drm/xe/xe_lrc.h              |  4 ++-
 drivers/gpu/drm/xe/xe_pxp.c              | 37 +++++++++++++++----
 drivers/gpu/drm/xe/xe_pxp.h              |  1 +
 drivers/gpu/drm/xe/xe_pxp_submit.c       |  2 +-
 include/uapi/drm/xe_drm.h                | 40 ++++++++++++++++++++-
 10 files changed, 136 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index c38db2a74614..0bdbda4369c5 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -129,6 +129,7 @@
 #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
 
 #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
+#define	  CTX_CTRL_PXP_ENABLE			REG_BIT(10)
 #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
 #define	  CTX_CTRL_RUN_ALONE			REG_BIT(7)
 #define	  CTX_CTRL_INDIRECT_RING_STATE_ENABLE	REG_BIT(4)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index bc6e867aba17..ed0c49847a33 100644
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
 	kfree(q);
@@ -69,6 +73,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->ops = gt->exec_queue_ops;
 	INIT_LIST_HEAD(&q->lr.link);
 	INIT_LIST_HEAD(&q->multi_gt_link);
+	INIT_LIST_HEAD(&q->pxp.link);
 
 	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
 	q->sched_props.preempt_timeout_us =
@@ -102,9 +107,22 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 static int __xe_exec_queue_init(struct xe_exec_queue *q)
 {
 	int i, err;
+	u32 flags = 0;
+
+	/*
+	 * Starting on Xe2, PXP must be enabled in the lrc. On older gens, PXP
+	 * execution on render and compute requires instead the runalone option.
+	 */
+	if (xe_exec_queue_uses_pxp(q)) {
+		if (GRAPHICS_VER(gt_to_xe(q->gt)) >= 20)
+			flags |= XE_LRC_CREATE_PXP;
+		else if ((q->class == XE_ENGINE_CLASS_RENDER ||
+			  q->class == XE_ENGINE_CLASS_COMPUTE))
+			flags |= XE_LRC_CREATE_RUNALONE;
+	}
 
 	for (i = 0; i < q->width; ++i) {
-		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K);
+		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, flags);
 		if (IS_ERR(q->lrc[i])) {
 			err = PTR_ERR(q->lrc[i]);
 			goto err_lrc;
@@ -188,6 +206,9 @@ void xe_exec_queue_destroy(struct kref *ref)
 	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
 	struct xe_exec_queue *eq, *next;
 
+	if (xe_exec_queue_uses_pxp(q))
+		xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp, q);
+
 	xe_exec_queue_last_fence_put_unlocked(q);
 	if (!(q->flags & EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD)) {
 		list_for_each_entry_safe(eq, next, &q->multi_gt_list,
@@ -334,6 +355,24 @@ static int exec_queue_set_timeslice(struct xe_device *xe, struct xe_exec_queue *
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
+	return xe_pxp_exec_queue_add(xe->pxp, q, DRM_XE_PXP_TYPE_HWDRM);
+}
+
 typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 					     struct xe_exec_queue *q,
 					     u64 value);
@@ -341,6 +380,7 @@ typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
 static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] = exec_queue_set_priority,
 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] = exec_queue_set_timeslice,
+	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE] = exec_queue_set_pxp_type,
 };
 
 static int exec_queue_user_ext_set_property(struct xe_device *xe,
@@ -360,7 +400,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
 			 ARRAY_SIZE(exec_queue_set_property_funcs)) ||
 	    XE_IOCTL_DBG(xe, ext.pad) ||
 	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY &&
-			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE))
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE &&
+			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE))
 		return -EINVAL;
 
 	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 289a3a51d2a2..572e5f10a342 100644
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
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 07ed9fd28f19..572b7572cd7a 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -528,7 +528,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 		goto err_name;
 	}
 
-	hwe->kernel_lrc = xe_lrc_create(hwe, NULL, SZ_16K);
+	hwe->kernel_lrc = xe_lrc_create(hwe, NULL, SZ_16K, 0);
 	if (IS_ERR(hwe->kernel_lrc)) {
 		err = PTR_ERR(hwe->kernel_lrc);
 		goto err_hwsp;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 94ff62e1d95e..81c179012e3a 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -890,7 +890,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
 
 static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
-		       struct xe_vm *vm, u32 ring_size)
+		       struct xe_vm *vm, u32 ring_size, u32 init_flags)
 {
 	struct xe_gt *gt = hwe->gt;
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -978,6 +978,14 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 				     RING_CTL_SIZE(lrc->ring.size) | RING_VALID);
 	}
 
+	if (init_flags & XE_LRC_CREATE_RUNALONE)
+		xe_lrc_write_ctx_reg(lrc, CTX_CONTEXT_CONTROL,
+				     _MASKED_BIT_ENABLE(CTX_CTRL_RUN_ALONE));
+
+	if (init_flags & XE_LRC_CREATE_PXP)
+		xe_lrc_write_ctx_reg(lrc, CTX_CONTEXT_CONTROL,
+				     _MASKED_BIT_ENABLE(CTX_CTRL_PXP_ENABLE));
+
 	xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP, 0);
 
 	if (xe->info.has_asid && vm)
@@ -1026,7 +1034,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * upon failure.
  */
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size)
+			     u32 ring_size, u32 flags)
 {
 	struct xe_lrc *lrc;
 	int err;
@@ -1035,7 +1043,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
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
index 159761e19e9b..e979b47f155a 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -6,10 +6,13 @@
 #include "xe_pxp.h"
 
 #include <drm/drm_managed.h>
+#include <drm/xe_drm.h>
 
 #include "xe_device_types.h"
+#include "xe_exec_queue.h"
 #include "xe_exec_queue_types.h"
 #include "xe_force_wake.h"
+#include "xe_guc_submit.h"
 #include "xe_gsc_proxy.h"
 #include "xe_gt.h"
 #include "xe_gt_types.h"
@@ -30,14 +33,14 @@
  * integrated parts.
  */
 
-#define ARB_SESSION 0xF /* TODO: move to UAPI */
+#define ARB_SESSION DRM_XE_PXP_HWDRM_DEFAULT_SESSION /* shorter define */
 
 bool xe_pxp_is_supported(const struct xe_device *xe)
 {
 	return xe->info.has_pxp;
 }
 
-static bool pxp_is_enabled(const struct xe_pxp *pxp)
+bool xe_pxp_is_enabled(const struct xe_pxp *pxp)
 {
 	return pxp;
 }
@@ -86,12 +89,16 @@ static int pxp_wait_for_session_state(struct xe_pxp *pxp, u32 id, bool in_play)
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
 	/*
 	 * If we have a termination already in progress, we need to wait for
 	 * it to complete before queueing another one. We update the state
@@ -202,7 +209,7 @@ void xe_pxp_irq_handler(struct xe_device *xe, u16 iir)
 {
 	struct xe_pxp *pxp = xe->pxp;
 
-	if (!pxp_is_enabled(pxp)) {
+	if (!xe_pxp_is_enabled(pxp)) {
 		drm_err(&xe->drm, "PXP irq 0x%x received with PXP disabled!\n", iir);
 		return;
 	}
@@ -385,9 +392,12 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 type)
 {
 	int ret = 0;
 
-	if (!pxp_is_enabled(pxp))
+	if (!xe_pxp_is_enabled(pxp))
 		return -ENODEV;
 
+	/* we only support HWDRM sessions right now */
+	xe_assert(pxp->xe, type == DRM_XE_PXP_TYPE_HWDRM);
+
 	/*
 	 * Runtime suspend kills PXP, so we need to turn it off while we have
 	 * active queues that use PXP
@@ -472,14 +482,14 @@ void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q)
 {
 	bool need_pm_put = false;
 
-	if (!pxp_is_enabled(pxp))
+	if (!xe_pxp_is_enabled(pxp))
 		return;
 
 	mutex_lock(&pxp->mutex);
 
 	if (!list_empty(&q->pxp.link)) {
 		list_del_init(&q->pxp.link);
-		q->pxp.type = 0;
+		q->pxp.type = DRM_XE_PXP_TYPE_NONE;
 		need_pm_put = true;
 	}
 
@@ -488,3 +498,18 @@ void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q)
 	if (need_pm_put)
 		xe_pm_runtime_put(pxp->xe);
 }
+
+static void pxp_invalidate_queues(struct xe_pxp *pxp)
+{
+	struct xe_exec_queue *tmp, *q;
+
+	list_for_each_entry(tmp, &pxp->queue_list,  pxp.link) {
+		q = xe_exec_queue_get_unless_zero(tmp);
+
+		if (!q)
+			continue;
+
+		xe_exec_queue_kill(q);
+		xe_exec_queue_put(q);
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
index 6c99af072ab0..8f0a3a514fb8 100644
--- a/drivers/gpu/drm/xe/xe_pxp.h
+++ b/drivers/gpu/drm/xe/xe_pxp.h
@@ -13,6 +13,7 @@ struct xe_exec_queue;
 struct xe_pxp;
 
 bool xe_pxp_is_supported(const struct xe_device *xe);
+bool xe_pxp_is_enabled(const struct xe_pxp *pxp);
 
 int xe_pxp_init(struct xe_device *xe);
 void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
index 9c76eeb5535c..1ad0273fde77 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.c
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
@@ -473,7 +473,7 @@ int xe_pxp_submit_session_init(struct xe_pxp *pxp, int id)
 				   FIELD_PREP(PXP43_INIT_SESSION_APPTYPE, 0));
 	msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
 
-	if (id == ARB_SESSION)
+	if (id == DRM_XE_PXP_HWDRM_DEFAULT_SESSION)
 		msg_in.protection_mode = PXP43_INIT_SESSION_PROTECTION_ARB;
 
 	ret = gsccs_send_message(pxp, &msg_in, sizeof(msg_in), &msg_out, sizeof(msg_out));
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 12eaa8532b5c..631fdc2ed493 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1071,6 +1071,24 @@ struct drm_xe_vm_bind {
 /**
  * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
  *
+ * This ioctl supports setting the following properties via the
+ * %DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY extension, which uses the the
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
@@ -1094,7 +1112,7 @@ struct drm_xe_exec_queue_create {
 #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
-
+#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE		2
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
 
@@ -1678,6 +1696,26 @@ struct drm_xe_oa_stream_info {
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
+	DRM_XE_PXP_TYPE_HWDRM
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

