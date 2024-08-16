Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D511C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 19:00:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0773F10E82C;
	Fri, 16 Aug 2024 19:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U6X4yPba";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F7C10E828
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 19:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723834847; x=1755370847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VVhzrM5a+pQzJR/WqFWRVxxw8DEAFBxVpYqNzgHAgw0=;
 b=U6X4yPbac380JwLrgye9Y7ZMHF7PiO3H2paZdM74S2ZYT/S1qVpaKXV0
 Fm415brgTLtCOz38rw7wewiS/pOcRoHrtMMPBAEIrAgdHHtSpiPktV40N
 afqQoI/TNPfEXlEEZZYhTeqkliZ1pOgRXjvrGEyIx0YrRRG32S5ipdXHx
 VglC5kgJD80vWsO/fN/ucJ774F7EDOV/TVYcUGZNeV6cQbv79pY8Cm4+I
 nYEI6eKGKGmjSArpsd/rbDoh0v1JHFYY+j09QPQsHmq0rN6ioadNf3I3+
 kDynrvT4RHKm3QpeQzP/uxGwWX3E9x6u1dk/yn0chwDHT2LHwT5eStG1y A==;
X-CSE-ConnectionGUID: NW6qNMH3QReaHpXEJWffyA==
X-CSE-MsgGUID: JIiNxNvMQkagmAyS/9efbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21772451"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="21772451"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 12:00:47 -0700
X-CSE-ConnectionGUID: FksgLSC1Sf2JfF7IH45JkQ==
X-CSE-MsgGUID: zMQYaLmCRNyTaIFq7inqTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="59767956"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 12:00:46 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 05/12] drm/xe/pxp: Handle the PXP termination interrupt
Date: Fri, 16 Aug 2024 12:00:14 -0700
Message-ID: <20240816190024.2176976-6-daniele.ceraolospurio@intel.com>
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

When something happen to the session, the HW generates a termination
interrupt. In reply to this, the driver is required to submit an inline
session termination via the VCS, trigger the global termination and
notify the GSC FW that the session is now invalid.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h  |   8 ++
 drivers/gpu/drm/xe/regs/xe_pxp_regs.h |   6 ++
 drivers/gpu/drm/xe/xe_irq.c           |  20 +++-
 drivers/gpu/drm/xe/xe_pxp.c           | 138 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pxp.h           |   3 +
 drivers/gpu/drm/xe/xe_pxp_types.h     |  13 +++
 6 files changed, 184 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 0d1a4a9f4e11..9e9c20f1f1f4 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -570,6 +570,7 @@
 #define   ENGINE1_MASK				REG_GENMASK(31, 16)
 #define   ENGINE0_MASK				REG_GENMASK(15, 0)
 #define GPM_WGBOXPERF_INTR_ENABLE		XE_REG(0x19003c, XE_REG_OPTION_VF)
+#define CRYPTO_RSVD_INTR_ENABLE			XE_REG(0x190040)
 #define GUNIT_GSC_INTR_ENABLE			XE_REG(0x190044, XE_REG_OPTION_VF)
 #define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048, XE_REG_OPTION_VF)
 
@@ -580,6 +581,7 @@
 #define   INTR_ENGINE_INTR(x)			REG_FIELD_GET(GENMASK(15, 0), x)
 #define   OTHER_GUC_INSTANCE			0
 #define   OTHER_GSC_HECI2_INSTANCE		3
+#define   OTHER_KCR_INSTANCE			4
 #define   OTHER_GSC_INSTANCE			6
 
 #define IIR_REG_SELECTOR(x)			XE_REG(0x190070 + ((x) * 4), XE_REG_OPTION_VF)
@@ -591,6 +593,7 @@
 #define HECI2_RSVD_INTR_MASK			XE_REG(0x1900e4)
 #define GUC_SG_INTR_MASK			XE_REG(0x1900e8, XE_REG_OPTION_VF)
 #define GPM_WGBOXPERF_INTR_MASK			XE_REG(0x1900ec, XE_REG_OPTION_VF)
+#define CRYPTO_RSVD_INTR_MASK			XE_REG(0x1900f0)
 #define GUNIT_GSC_INTR_MASK			XE_REG(0x1900f4, XE_REG_OPTION_VF)
 #define CCS0_CCS1_INTR_MASK			XE_REG(0x190100)
 #define CCS2_CCS3_INTR_MASK			XE_REG(0x190104)
@@ -605,4 +608,9 @@
 #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
 #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
 
+/* irqs for OTHER_KCR_INSTANCE */
+#define   KCR_PXP_STATE_TERMINATED_INTERRUPT		REG_BIT(1)
+#define   KCR_APP_TERMINATED_PER_FW_REQ_INTERRUPT	REG_BIT(2)
+#define   KCR_PXP_STATE_RESET_COMPLETE_INTERRUPT	REG_BIT(3)
+
 #endif
diff --git a/drivers/gpu/drm/xe/regs/xe_pxp_regs.h b/drivers/gpu/drm/xe/regs/xe_pxp_regs.h
index d67cf210d23d..aa158938b42e 100644
--- a/drivers/gpu/drm/xe/regs/xe_pxp_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_pxp_regs.h
@@ -14,4 +14,10 @@
 #define KCR_INIT				XE_REG(0x3860f0)
 #define   KCR_INIT_ALLOW_DISPLAY_ME_WRITES	REG_BIT(14)
 
+/* KCR hwdrm session in play status 0-31 */
+#define KCR_SIP					XE_REG(0x386260)
+
+/* PXP global terminate register for session termination */
+#define KCR_GLOBAL_TERMINATE			XE_REG(0x3860f8)
+
 #endif /* __XE_PXP_REGS_H__ */
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 5f2c368c35ad..f11d9a740627 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -20,6 +20,7 @@
 #include "xe_hw_engine.h"
 #include "xe_memirq.h"
 #include "xe_mmio.h"
+#include "xe_pxp.h"
 #include "xe_sriov.h"
 
 /*
@@ -202,6 +203,15 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 		}
 		if (heci_mask)
 			xe_mmio_write32(gt, HECI2_RSVD_INTR_MASK, ~(heci_mask << 16));
+
+		if (xe_pxp_is_supported(xe)) {
+			u32 kcr_mask = KCR_PXP_STATE_TERMINATED_INTERRUPT |
+				       KCR_APP_TERMINATED_PER_FW_REQ_INTERRUPT |
+				       KCR_PXP_STATE_RESET_COMPLETE_INTERRUPT;
+
+			xe_mmio_write32(gt, CRYPTO_RSVD_INTR_ENABLE, kcr_mask << 16);
+			xe_mmio_write32(gt, CRYPTO_RSVD_INTR_MASK, ~(kcr_mask << 16));
+		}
 	}
 }
 
@@ -324,9 +334,15 @@ static void gt_irq_handler(struct xe_tile *tile,
 			}
 
 			if (class == XE_ENGINE_CLASS_OTHER) {
-				/* HECI GSCFI interrupts come from outside of GT */
+				/*
+				 * HECI GSCFI interrupts come from outside of GT.
+				 * KCR irqs come from inside GT but are handled
+				 * by the global PXP subsystem.
+				 */
 				if (HAS_HECI_GSCFI(xe) && instance == OTHER_GSC_INSTANCE)
 					xe_heci_gsc_irq_handler(xe, intr_vec);
+				else if (instance == OTHER_KCR_INSTANCE)
+					xe_pxp_irq_handler(xe, intr_vec);
 				else
 					gt_other_irq_handler(engine_gt, instance, intr_vec);
 			}
@@ -512,6 +528,8 @@ static void gt_irq_reset(struct xe_tile *tile)
 		xe_mmio_write32(mmio, GUNIT_GSC_INTR_ENABLE, 0);
 		xe_mmio_write32(mmio, GUNIT_GSC_INTR_MASK, ~0);
 		xe_mmio_write32(mmio, HECI2_RSVD_INTR_MASK, ~0);
+		xe_mmio_write32(mmio, CRYPTO_RSVD_INTR_ENABLE, 0);
+		xe_mmio_write32(mmio, CRYPTO_RSVD_INTR_MASK, ~0);
 	}
 
 	xe_mmio_write32(mmio, GPM_WGBOXPERF_INTR_ENABLE, 0);
diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index 56bb7d927c07..382eb0cb0018 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -12,9 +12,11 @@
 #include "xe_gt.h"
 #include "xe_gt_types.h"
 #include "xe_mmio.h"
+#include "xe_pm.h"
 #include "xe_pxp_submit.h"
 #include "xe_pxp_types.h"
 #include "xe_uc_fw.h"
+#include "regs/xe_gt_regs.h"
 #include "regs/xe_pxp_regs.h"
 
 /**
@@ -25,11 +27,133 @@
  * integrated parts.
  */
 
-static bool pxp_is_supported(const struct xe_device *xe)
+#define ARB_SESSION 0xF /* TODO: move to UAPI */
+
+bool xe_pxp_is_supported(const struct xe_device *xe)
 {
 	return xe->info.has_pxp && IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY);
 }
 
+static bool pxp_is_enabled(const struct xe_pxp *pxp)
+{
+	return pxp;
+}
+
+static int pxp_wait_for_session_state(struct xe_pxp *pxp, u32 id, bool in_play)
+{
+	struct xe_gt *gt = pxp->gt;
+	u32 mask = BIT(id);
+	int ret;
+
+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (ret)
+		return ret;
+
+	ret = xe_mmio_wait32(gt, KCR_SIP, mask, in_play ? mask : 0,
+			     250, NULL, false);
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+
+	return ret;
+}
+
+static void pxp_terminate(struct xe_pxp *pxp)
+{
+	int ret = 0;
+	struct xe_device *xe = pxp->xe;
+	struct xe_gt *gt = pxp->gt;
+
+	drm_dbg(&xe->drm, "Terminating PXP\n");
+
+	/* terminate the hw session */
+	ret = xe_pxp_submit_session_termination(pxp, ARB_SESSION);
+	if (ret)
+		goto out;
+
+	ret = pxp_wait_for_session_state(pxp, ARB_SESSION, false);
+	if (ret)
+		goto out;
+
+	/* Trigger full HW cleanup */
+	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+	xe_mmio_write32(gt, KCR_GLOBAL_TERMINATE, 1);
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+
+	/* now we can tell the GSC to clean up its own state */
+	ret = xe_pxp_submit_session_invalidation(&pxp->gsc_res, ARB_SESSION);
+
+out:
+	if (ret)
+		drm_err(&xe->drm, "PXP termination failed: %pe\n", ERR_PTR(ret));
+}
+
+static void pxp_terminate_complete(struct xe_pxp *pxp)
+{
+	/* TODO mark the session as ready to start */
+}
+
+static void pxp_irq_work(struct work_struct *work)
+{
+	struct xe_pxp *pxp = container_of(work, typeof(*pxp), irq.work);
+	struct xe_device *xe = pxp->xe;
+	u32 events = 0;
+
+	spin_lock_irq(&xe->irq.lock);
+	events = pxp->irq.events;
+	pxp->irq.events = 0;
+	spin_unlock_irq(&xe->irq.lock);
+
+	if (!events)
+		return;
+
+	/*
+	 * If we're processing a termination irq while suspending then don't
+	 * bother, we're going to re-init everything on resume anyway.
+	 */
+	if ((events & PXP_TERMINATION_REQUEST) && !xe_pm_runtime_get_if_active(xe))
+		return;
+
+	if (events & PXP_TERMINATION_REQUEST) {
+		events &= ~PXP_TERMINATION_COMPLETE;
+		pxp_terminate(pxp);
+	}
+
+	if (events & PXP_TERMINATION_COMPLETE)
+		pxp_terminate_complete(pxp);
+
+	if (events & PXP_TERMINATION_REQUEST)
+		xe_pm_runtime_put(xe);
+}
+
+/**
+ * xe_pxp_irq_handler - Handles PXP interrupts.
+ * @pxp: pointer to pxp struct
+ * @iir: interrupt vector
+ */
+void xe_pxp_irq_handler(struct xe_device *xe, u16 iir)
+{
+	struct xe_pxp *pxp = xe->pxp;
+
+	if (!pxp_is_enabled(pxp)) {
+		drm_err(&xe->drm, "PXP irq 0x%x received with PXP disabled!\n", iir);
+		return;
+	}
+
+	lockdep_assert_held(&xe->irq.lock);
+
+	if (unlikely(!iir))
+		return;
+
+	if (iir & (KCR_PXP_STATE_TERMINATED_INTERRUPT |
+		   KCR_APP_TERMINATED_PER_FW_REQ_INTERRUPT))
+		pxp->irq.events |= PXP_TERMINATION_REQUEST;
+
+	if (iir & KCR_PXP_STATE_RESET_COMPLETE_INTERRUPT)
+		pxp->irq.events |= PXP_TERMINATION_COMPLETE;
+
+	if (pxp->irq.events)
+		queue_work(pxp->irq.wq, &pxp->irq.work);
+}
+
 static int kcr_pxp_set_status(const struct xe_pxp *pxp, bool enable)
 {
 	u32 val = enable ? _MASKED_BIT_ENABLE(KCR_INIT_ALLOW_DISPLAY_ME_WRITES) :
@@ -60,6 +184,7 @@ static void pxp_fini(void *arg)
 {
 	struct xe_pxp *pxp = arg;
 
+	destroy_workqueue(pxp->irq.wq);
 	xe_pxp_destroy_execution_resources(pxp);
 
 	/* no need to explicitly disable KCR since we're going to do an FLR */
@@ -83,7 +208,7 @@ int xe_pxp_init(struct xe_device *xe)
 	struct xe_pxp *pxp;
 	int err;
 
-	if (!pxp_is_supported(xe))
+	if (!xe_pxp_is_supported(xe))
 		return -EOPNOTSUPP;
 
 	/* we only support PXP on single tile devices with a media GT */
@@ -105,12 +230,17 @@ int xe_pxp_init(struct xe_device *xe)
 	if (!pxp)
 		return -ENOMEM;
 
+	INIT_WORK(&pxp->irq.work, pxp_irq_work);
 	pxp->xe = xe;
 	pxp->gt = gt;
 
+	pxp->irq.wq = alloc_ordered_workqueue("pxp-wq", 0);
+	if (!pxp->irq.wq)
+		return -ENOMEM;
+
 	err = kcr_pxp_enable(pxp);
 	if (err)
-		return err;
+		goto out_wq;
 
 	err = xe_pxp_allocate_execution_resources(pxp);
 	if (err)
@@ -122,5 +252,7 @@ int xe_pxp_init(struct xe_device *xe)
 
 kcr_disable:
 	kcr_pxp_disable(pxp);
+out_wq:
+	destroy_workqueue(pxp->irq.wq);
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
index 79c951667f13..81bafe2714ff 100644
--- a/drivers/gpu/drm/xe/xe_pxp.h
+++ b/drivers/gpu/drm/xe/xe_pxp.h
@@ -10,6 +10,9 @@
 
 struct xe_device;
 
+bool xe_pxp_is_supported(const struct xe_device *xe);
+
 int xe_pxp_init(struct xe_device *xe);
+void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
 
 #endif /* __XE_PXP_H__ */
diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
index 3463caaad101..d5cf8faed7be 100644
--- a/drivers/gpu/drm/xe/xe_pxp_types.h
+++ b/drivers/gpu/drm/xe/xe_pxp_types.h
@@ -8,6 +8,7 @@
 
 #include <linux/iosys-map.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 
 struct xe_bo;
 struct xe_exec_queue;
@@ -69,6 +70,18 @@ struct xe_pxp {
 
 	/** @gsc_exec: kernel-owned objects for PXP submissions to the GSCCS */
 	struct xe_pxp_gsc_client_resources gsc_res;
+
+	/** @irq: wrapper for the worker and queue used for PXP irq support */
+	struct {
+		/** @irq.work: worker that manages irq events. */
+		struct work_struct work;
+		/** @irq.wq: workqueue on which to queue the irq work. */
+		struct workqueue_struct *wq;
+		/** @irq.events: pending events, protected with xe->irq.lock. */
+		u32 events;
+#define PXP_TERMINATION_REQUEST  BIT(0)
+#define PXP_TERMINATION_COMPLETE BIT(1)
+	} irq;
 };
 
 #endif /* __XE_PXP_TYPES_H__ */
-- 
2.43.0

