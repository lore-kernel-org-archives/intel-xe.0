Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26668D743F9
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 23:44:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790AC10E800;
	Wed, 20 Nov 2024 23:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jcyv2kGk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B49A10E183
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Nov 2024 23:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732146247; x=1763682247;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fa0DszpSjqQVISlr7sxvP/uZQ9Uwfp45/I+FFNpjo6E=;
 b=jcyv2kGkC7JRl0+gDrWbO5dvBqcfFsz83hoL7qHKWjEVnYluD93P7xQE
 EgnkoWg7ALch8iV2pBoyUD4MEz7Y76PmuV5GCFfeMEsHAMZaQFtl7EReN
 XHSchA9BnPro0rYFwBl3SKcMob4AkVBdyWqqfnFKm46qFFk/SFUIlSu9F
 GpZl+3iSLzUpBEC5q2ZuZ1dVTL7jQiUXJ3TdAt7K3XeSk7WzuEgMAxz8i
 CQ+/uYAb7fy7M6bEy79i4sSKDswCph8HTeZQzdWhj91oJ5C2TG7HkyRBR
 Jxug5CYccWmXKoijuqUiGERfoW7VKzUuuMbtYfqzGytsoaBHD3XM6QPrc Q==;
X-CSE-ConnectionGUID: eKSFnSIHR6WyNrl8O9rqcQ==
X-CSE-MsgGUID: uJOyDfwwRBah7yecirLcBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="54733279"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="54733279"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 15:44:07 -0800
X-CSE-ConnectionGUID: /BIKCkPaTqiQvvvN/YUQ6A==
X-CSE-MsgGUID: s7EMPxITS/GaPHQjy7H+Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="90453640"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 15:44:07 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 05/12] drm/xe/pxp: Handle the PXP termination interrupt
Date: Wed, 20 Nov 2024 15:43:45 -0800
Message-ID: <20241120234353.1037180-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
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

v2: rename ARB define to make it cleaner to move it to uapi (John)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/regs/xe_irq_regs.h |   8 ++
 drivers/gpu/drm/xe/regs/xe_pxp_regs.h |   6 ++
 drivers/gpu/drm/xe/xe_irq.c           |  20 +++-
 drivers/gpu/drm/xe/xe_pxp.c           | 139 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pxp.h           |   7 ++
 drivers/gpu/drm/xe/xe_pxp_types.h     |  13 +++
 6 files changed, 189 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
index 1776b3f78ccb..f0ecfcac4003 100644
--- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
@@ -44,6 +44,7 @@
 #define   ENGINE1_MASK				REG_GENMASK(31, 16)
 #define   ENGINE0_MASK				REG_GENMASK(15, 0)
 #define GPM_WGBOXPERF_INTR_ENABLE		XE_REG(0x19003c, XE_REG_OPTION_VF)
+#define CRYPTO_RSVD_INTR_ENABLE			XE_REG(0x190040)
 #define GUNIT_GSC_INTR_ENABLE			XE_REG(0x190044, XE_REG_OPTION_VF)
 #define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048, XE_REG_OPTION_VF)
 
@@ -54,6 +55,7 @@
 #define   INTR_ENGINE_INTR(x)			REG_FIELD_GET(GENMASK(15, 0), x)
 #define   OTHER_GUC_INSTANCE			0
 #define   OTHER_GSC_HECI2_INSTANCE		3
+#define   OTHER_KCR_INSTANCE			4
 #define   OTHER_GSC_INSTANCE			6
 
 #define IIR_REG_SELECTOR(x)			XE_REG(0x190070 + ((x) * 4), XE_REG_OPTION_VF)
@@ -65,6 +67,7 @@
 #define HECI2_RSVD_INTR_MASK			XE_REG(0x1900e4)
 #define GUC_SG_INTR_MASK			XE_REG(0x1900e8, XE_REG_OPTION_VF)
 #define GPM_WGBOXPERF_INTR_MASK			XE_REG(0x1900ec, XE_REG_OPTION_VF)
+#define CRYPTO_RSVD_INTR_MASK			XE_REG(0x1900f0)
 #define GUNIT_GSC_INTR_MASK			XE_REG(0x1900f4, XE_REG_OPTION_VF)
 #define CCS0_CCS1_INTR_MASK			XE_REG(0x190100)
 #define CCS2_CCS3_INTR_MASK			XE_REG(0x190104)
@@ -79,4 +82,9 @@
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
index 7bf7201529ac..6a7a65d5e5d1 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -19,6 +19,7 @@
 #include "xe_hw_engine.h"
 #include "xe_memirq.h"
 #include "xe_mmio.h"
+#include "xe_pxp.h"
 #include "xe_sriov.h"
 
 /*
@@ -202,6 +203,15 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 		}
 		if (heci_mask)
 			xe_mmio_write32(mmio, HECI2_RSVD_INTR_MASK, ~(heci_mask << 16));
+
+		if (xe_pxp_is_supported(xe)) {
+			u32 kcr_mask = KCR_PXP_STATE_TERMINATED_INTERRUPT |
+				       KCR_APP_TERMINATED_PER_FW_REQ_INTERRUPT |
+				       KCR_PXP_STATE_RESET_COMPLETE_INTERRUPT;
+
+			xe_mmio_write32(mmio, CRYPTO_RSVD_INTR_ENABLE, kcr_mask << 16);
+			xe_mmio_write32(mmio, CRYPTO_RSVD_INTR_MASK, ~(kcr_mask << 16));
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
 				if (xe->info.has_heci_gscfi && instance == OTHER_GSC_INSTANCE)
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
index 89d71a69cdff..bc816cfecdd6 100644
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
+#include "regs/xe_irq_regs.h"
 #include "regs/xe_pxp_regs.h"
 
 /**
@@ -25,11 +27,132 @@
  * integrated parts.
  */
 
-static bool pxp_is_supported(const struct xe_device *xe)
+#define ARB_SESSION DRM_XE_PXP_HWDRM_DEFAULT_SESSION /* shorter define */
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
+
+	return xe_mmio_wait32(&gt->mmio, KCR_SIP, mask, in_play ? mask : 0,
+			      250, NULL, false);
+}
+
+static void pxp_terminate(struct xe_pxp *pxp)
+{
+	int ret = 0;
+	struct xe_device *xe = pxp->xe;
+	struct xe_gt *gt = pxp->gt;
+	unsigned int fw_ref;
+
+	drm_dbg(&xe->drm, "Terminating PXP\n");
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FW_GT)) {
+		ret = -EIO;
+		goto out;
+	}
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
+	xe_mmio_write32(&gt->mmio, KCR_GLOBAL_TERMINATE, 1);
+
+	/* now we can tell the GSC to clean up its own state */
+	ret = xe_pxp_submit_session_invalidation(&pxp->gsc_res, ARB_SESSION);
+
+out:
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+
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
@@ -60,6 +183,7 @@ static void pxp_fini(void *arg)
 {
 	struct xe_pxp *pxp = arg;
 
+	destroy_workqueue(pxp->irq.wq);
 	xe_pxp_destroy_execution_resources(pxp);
 
 	/* no need to explicitly disable KCR since we're going to do an FLR */
@@ -83,7 +207,7 @@ int xe_pxp_init(struct xe_device *xe)
 	struct xe_pxp *pxp;
 	int err;
 
-	if (!pxp_is_supported(xe))
+	if (!xe_pxp_is_supported(xe))
 		return -EOPNOTSUPP;
 
 	/* we only support PXP on single tile devices with a media GT */
@@ -105,12 +229,19 @@ int xe_pxp_init(struct xe_device *xe)
 	if (!pxp)
 		return -ENOMEM;
 
+	INIT_WORK(&pxp->irq.work, pxp_irq_work);
 	pxp->xe = xe;
 	pxp->gt = gt;
 
+	pxp->irq.wq = alloc_ordered_workqueue("pxp-wq", 0);
+	if (!pxp->irq.wq) {
+		err = -ENOMEM;
+		goto out_free;
+	}
+
 	err = kcr_pxp_enable(pxp);
 	if (err)
-		goto out_free;
+		goto out_wq;
 
 	err = xe_pxp_allocate_execution_resources(pxp);
 	if (err)
@@ -122,6 +253,8 @@ int xe_pxp_init(struct xe_device *xe)
 
 out_kcr_disable:
 	kcr_pxp_disable(pxp);
+out_wq:
+	destroy_workqueue(pxp->irq.wq);
 out_free:
 	drmm_kfree(&xe->drm, pxp);
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
index 00f5e688c0d9..39435c644dcd 100644
--- a/drivers/gpu/drm/xe/xe_pxp.h
+++ b/drivers/gpu/drm/xe/xe_pxp.h
@@ -6,8 +6,15 @@
 #ifndef __XE_PXP_H__
 #define __XE_PXP_H__
 
+#include <linux/types.h>
+
 struct xe_device;
 
+#define DRM_XE_PXP_HWDRM_DEFAULT_SESSION 0xF /* TODO: move to uapi */
+
+bool xe_pxp_is_supported(const struct xe_device *xe);
+
 int xe_pxp_init(struct xe_device *xe);
+void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
 
 #endif /* __XE_PXP_H__ */
diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
index 25db23180a30..40c28f32f51a 100644
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

