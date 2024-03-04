Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E8AC48BF6
	for <intel-xe@archiver.kernel.org>; Mon,  4 Mar 2024 14:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66192112240;
	Mon,  4 Mar 2024 14:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mw+Bv+mp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0932A11223F
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Mar 2024 14:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709564207; x=1741100207;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O8nPlzfLH2KZL3Ewl+8lOu2+0QBR7Zj5AWi38HTLuSA=;
 b=mw+Bv+mpsdPDVb1fLK6pI9BjN+Yy2Dmigk4/b8wMzJl745UAUmwOheHf
 aq2pfvF+SqNR/WE5RAs/DiQyfYYjTYI9+XR9E7Qi2UU+iECyYwtgxzszH
 GbUmNd0mwPV7nxPQqVsdY5Z9LUn+Y5uUN6uIabORbZXhqLKP1Z6Z3naOk
 /gw6Tf6VzUV/a5mfq53gWkkdhjSqJJINT8w3dHa+45x9+2/GyRgZsLaXe
 836haLHQbH8ve67ePRYvIMEJr10yjd102wuVMbWKrI57My2UKUnPV3UIm
 aupHqD1zntFIpi5V/3BkIOCc1z7xHf53R09cMqCoER1O1qKsZlGAK8tVc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="3913863"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="3913863"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 06:56:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="8965919"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 06:56:46 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH v2] drm/xe/gsc: Handle GSCCS ER interrupt
Date: Mon,  4 Mar 2024 06:56:34 -0800
Message-ID: <20240304145634.820684-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

Starting on Xe2, the GSCCS engine reset is a 2-step process. When the
driver or the GuC hits the GDRST register, the CS is immediately reset
and a success is reported, but the GSC shim continues its reset in the
background. While the shim reset is ongoing, the CS is able to accept
new context submission, but any commands that require the shim will
be stalled until the reset is completed. This means that we can keep
submitting to the GSCCS as long as we make sure that the preemption
timeout is big enough to cover any delay introduced by the reset; since
the GSC preempt timeout is not tunable at runtime, we only need to check
that the value set in kconfig is big enough (and increase it if it
isn't).
When the shim reset completes, a specific CS interrupt is triggered,
in response to which we need to check the GSCI_TIMER_STATUS register
to see if the reset was successful or not.
Note that the GSCI_TIMER_STATUS register is not power save/restored,
so it gets reset on MC6 entry. However, a reset failure stops MC6,
so in that scenario we're always guaranteed to find the correct value.

Since we can't check the register within interrupt context, the
existing GSC worker has been updated to handle it.
The expected action to take on ER failure is to trigger a driver FLR,
but we still don't support that, so for now we just print an error. A
comment has been added to the code to keep track of the FLR requirement.

v2: Add a check for the initial timeout value (Alan)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h |  7 +++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h  |  1 +
 drivers/gpu/drm/xe/xe_gsc.c           | 63 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gsc.h           |  2 +
 drivers/gpu/drm/xe/xe_gsc_types.h     |  1 +
 drivers/gpu/drm/xe/xe_hw_engine.c     | 35 ++++++++++++++-
 drivers/gpu/drm/xe/xe_irq.c           |  2 +-
 7 files changed, 109 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
index 9886ec9cb08e..e2a925be137c 100644
--- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
@@ -38,4 +38,11 @@
 #define HECI_H_GS1(base)	XE_REG((base) + 0xc4c)
 #define   HECI_H_GS1_ER_PREP	REG_BIT(0)
 
+#define GSCI_TIMER_STATUS				XE_REG(0x11ca28)
+#define   GSCI_TIMER_STATUS_VALUE			REG_GENMASK(1, 0)
+#define   GSCI_TIMER_STATUS_RESET_IN_PROGRESS		0
+#define   GSCI_TIMER_STATUS_TIMER_EXPIRED		1
+#define   GSCI_TIMER_STATUS_RESET_COMPLETE		2
+#define   GSCI_TIMER_STATUS_OUT_OF_RESET		3
+
 #endif
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 15ac2d284d48..abb6e86fe367 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -486,6 +486,7 @@
 #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
 #define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
 #define   GT_CONTEXT_SWITCH_INTERRUPT		REG_BIT(8)
+#define   GSC_ER_COMPLETE			REG_BIT(5)
 #define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
 #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
 #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index d9aa815a5bc2..09f6e7899921 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -27,6 +27,7 @@
 #include "xe_wa.h"
 #include "instructions/xe_gsc_commands.h"
 #include "regs/xe_gsc_regs.h"
+#include "regs/xe_gt_regs.h"
 
 static struct xe_gt *
 gsc_to_gt(struct xe_gsc *gsc)
@@ -273,6 +274,44 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
 	return 0;
 }
 
+static int gsc_er_complete(struct xe_gt *gt)
+{
+	u32 er_status;
+
+	if (!gsc_fw_is_loaded(gt))
+		return 0;
+
+	/*
+	 * Starting on Xe2, the GSCCS engine reset is a 2-step process. When the
+	 * driver or the GuC hit the GDRST register, the CS is immediately reset
+	 * and a success is reported, but the GSC shim keeps resetting in the
+	 * background. While the shim reset is ongoing, the CS is able to accept
+	 * new context submission, but any commands that require the shim will
+	 * be stalled until the reset is completed. This means that we can keep
+	 * submitting to the GSCCS as long as we make sure that the preemption
+	 * timeout is big enough to cover any delay introduced by the reset.
+	 * When the shim reset completes, a specific CS interrupt is triggered,
+	 * in response to which we need to check the GSCI_TIMER_STATUS register
+	 * to see if the reset was successful or not.
+	 * Note that the GSCI_TIMER_STATUS register is not power save/restored,
+	 * so it gets reset on MC6 entry. However, a reset failure stops MC6,
+	 * so in that scenario we're always guaranteed to find the correct
+	 * value.
+	 */
+	er_status = xe_mmio_read32(gt, GSCI_TIMER_STATUS) & GSCI_TIMER_STATUS_VALUE;
+
+	if (er_status == GSCI_TIMER_STATUS_TIMER_EXPIRED) {
+		/*
+		 * XXX: we should trigger an FLR here, but we don't have support
+		 * for that yet.
+		 */
+		xe_gt_err(gt, "GSC ER timed out!\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static void gsc_work(struct work_struct *work)
 {
 	struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
@@ -289,6 +328,12 @@ static void gsc_work(struct work_struct *work)
 	xe_pm_runtime_get(xe);
 	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
 
+	if (actions & GSC_ACTION_ER_COMPLETE) {
+		ret = gsc_er_complete(gt);
+		if (ret)
+			goto out;
+	}
+
 	if (actions & GSC_ACTION_FW_LOAD) {
 		ret = gsc_upload_and_init(gsc);
 		if (ret && ret != -EEXIST)
@@ -300,10 +345,28 @@ static void gsc_work(struct work_struct *work)
 	if (actions & GSC_ACTION_SW_PROXY)
 		xe_gsc_proxy_request_handler(gsc);
 
+out:
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
 	xe_pm_runtime_put(xe);
 }
 
+void xe_gsc_hwe_irq_handler(struct xe_hw_engine *hwe, u16 intr_vec)
+{
+	struct xe_gt *gt = hwe->gt;
+	struct xe_gsc *gsc = &gt->uc.gsc;
+
+	if (unlikely(!intr_vec))
+		return;
+
+	if (intr_vec & GSC_ER_COMPLETE) {
+		spin_lock(&gsc->lock);
+		gsc->work_actions |= GSC_ACTION_ER_COMPLETE;
+		spin_unlock(&gsc->lock);
+
+		queue_work(gsc->wq, &gsc->work);
+	}
+}
+
 int xe_gsc_init(struct xe_gsc *gsc)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
index c6fb32e3fd79..dd16e9b8b894 100644
--- a/drivers/gpu/drm/xe/xe_gsc.h
+++ b/drivers/gpu/drm/xe/xe_gsc.h
@@ -9,12 +9,14 @@
 #include "xe_gsc_types.h"
 
 struct xe_gt;
+struct xe_hw_engine;
 
 int xe_gsc_init(struct xe_gsc *gsc);
 int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc);
 void xe_gsc_wait_for_worker_completion(struct xe_gsc *gsc);
 void xe_gsc_load_start(struct xe_gsc *gsc);
 void xe_gsc_remove(struct xe_gsc *gsc);
+void xe_gsc_hwe_irq_handler(struct xe_hw_engine *hwe, u16 intr_vec);
 
 void xe_gsc_wa_14015076503(struct xe_gt *gt, bool prep);
 
diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h b/drivers/gpu/drm/xe/xe_gsc_types.h
index 138d8cc0f19c..5926de20214c 100644
--- a/drivers/gpu/drm/xe/xe_gsc_types.h
+++ b/drivers/gpu/drm/xe/xe_gsc_types.h
@@ -47,6 +47,7 @@ struct xe_gsc {
 	u32 work_actions;
 #define GSC_ACTION_FW_LOAD BIT(0)
 #define GSC_ACTION_SW_PROXY BIT(1)
+#define GSC_ACTION_ER_COMPLETE BIT(2)
 
 	/** @proxy: sub-structure containing the SW proxy-related variables */
 	struct {
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index b5e83ea172f3..df09a666c136 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -14,8 +14,10 @@
 #include "xe_device.h"
 #include "xe_execlist.h"
 #include "xe_force_wake.h"
+#include "xe_gsc.h"
 #include "xe_gt.h"
 #include "xe_gt_ccs_mode.h"
+#include "xe_gt_printk.h"
 #include "xe_gt_topology.h"
 #include "xe_hw_fence.h"
 #include "xe_irq.h"
@@ -463,6 +465,32 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 		hwe->eclass->sched_props.preempt_timeout_us = XE_HW_ENGINE_PREEMPT_TIMEOUT;
 		hwe->eclass->sched_props.preempt_timeout_min = XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN;
 		hwe->eclass->sched_props.preempt_timeout_max = XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX;
+
+		/*
+		 * The GSC engine can accept submissions while the GSC shim is
+		 * being reset, during which time the submission is stalled. In
+		 * the worst case, the shim reset can take up to the maximum GSC
+		 * command execution time (250ms), so the request start can be
+		 * delayed by that much; the request itself can take that long
+		 * without being preemptable, which means worst case it can
+		 * theoretically take up to 500ms for a preemption to go through
+		 * on the GSC engine. Adding to that an extra 100ms as a safety
+		 * margin, we get a minimum recommended timeout of 600ms.
+		 * The preempt_timeout value can't be tuned for OTHER_CLASS
+		 * because the class is reserved for kernel usage, so we just
+		 * need to make sure that the starting value is above that
+		 * threshold; since our default value (640ms) is greater than
+		 * 600ms, the only way we can go below is via a kconfig setting.
+		 * If that happens, log it in dmesg and update the value.
+		 */
+		if (hwe->class == XE_ENGINE_CLASS_OTHER) {
+			const u32 min_preempt_timeout = 600 * 1000;
+			if (hwe->eclass->sched_props.preempt_timeout_us < min_preempt_timeout) {
+				hwe->eclass->sched_props.preempt_timeout_us = min_preempt_timeout;
+				xe_gt_notice(gt, "Increasing preempt_timeout for GSC to 600ms\n");
+			}
+		}
+
 		/* Record default props */
 		hwe->eclass->defaults = hwe->eclass->sched_props;
 	}
@@ -509,8 +537,13 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 		}
 	}
 
-	if (xe_device_uc_enabled(xe))
+	if (xe_device_uc_enabled(xe)) {
+		/* GSCCS has a special interrupt for reset */
+		if (hwe->class == XE_ENGINE_CLASS_OTHER)
+			hwe->irq_handler = xe_gsc_hwe_irq_handler;
+
 		xe_hw_engine_enable_ring(hwe);
+	}
 
 	/* We reserve the highest BCS instance for USM */
 	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY)
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 2f5d179e0d00..2275ca35a3c7 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -187,7 +187,7 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 		 * GSCCS interrupts, but it has its own mask register.
 		 */
 		if (xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_OTHER)) {
-			gsc_mask = irqs;
+			gsc_mask = irqs | GSC_ER_COMPLETE;
 			heci_mask = GSC_IRQ_INTF(1);
 		} else if (HAS_HECI_GSCFI(xe)) {
 			gsc_mask = GSC_IRQ_INTF(1);
-- 
2.43.0

