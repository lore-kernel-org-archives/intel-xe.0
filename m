Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD38C47258
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 21:56:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C446210E0F7;
	Thu, 25 Jan 2024 21:56:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9116C10E0F7
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jan 2024 21:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706219762; x=1737755762;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=II8qTSZRn77doK/vqE14kj9JpHU9WColKRsbWzfIxpU=;
 b=J+azKeG8TdzvmfHYnTQvEVeUMGhH5+wF5mWxpQSO2AxBqtarHTZWHvGP
 662+tS9WTCVPktlc97FtTxLDpiGOsTn8kjL3qCAyP7kI77kNj+e2xwnWX
 bI+IucSJ6KBLJi7wcwOu0wMwRJdJUU9h3BS89/MA6QaR8fxVGXLnBKGp1
 eFAxGSZnRAp9yAoLzj75gBtnHdZmQ3Em53flsvIOaAiOI8ob/ksRMh/6N
 sMWjQ33H/LkHn5rCXjYxACJho3Gu1xdQZ7/FThfQgHJ19heXf5tZJLEzY
 ImQvTpJlTQoW21lcS7m3Xw62koErA+ATTWJQQHPVofd+uSk7YkZQCK7aH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="1234250"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1234250"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 13:56:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="930161304"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="930161304"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.16])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 13:55:56 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/gsc: Handle GSCCS ER interrupt
Date: Thu, 25 Jan 2024 13:55:43 -0800
Message-ID: <20240125215543.3990593-1-daniele.ceraolospurio@intel.com>
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
driver or the GuC hit the GDRST register, the CS is immediately reset
and a success is reported, but the GSC shim keeps resetting in the
background. While the shim reset is ongoing, the CS is able to accept
new context submission, but any commands that require the shim will
be stalled until the reset is completed. This means that we can keep
submitting to the GSCCS as long as we make sure that the preemption
timeout is big enough to cover any delay introduced by the reset
(which it already is).
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

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h |  7 +++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h  |  1 +
 drivers/gpu/drm/xe/xe_gsc.c           | 63 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gsc.h           |  2 +
 drivers/gpu/drm/xe/xe_gsc_types.h     |  1 +
 drivers/gpu/drm/xe/xe_hw_engine.c     |  8 +++-
 drivers/gpu/drm/xe/xe_irq.c           |  2 +-
 7 files changed, 82 insertions(+), 2 deletions(-)

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
index cd27480f6486..4acc8f3d646c 100644
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
index 0b90fd9ef63a..42dd61a197cb 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -25,6 +25,7 @@
 #include "xe_wa.h"
 #include "instructions/xe_gsc_commands.h"
 #include "regs/xe_gsc_regs.h"
+#include "regs/xe_gt_regs.h"
 
 static struct xe_gt *
 gsc_to_gt(struct xe_gsc *gsc)
@@ -271,6 +272,44 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
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
@@ -287,6 +326,12 @@ static void gsc_work(struct work_struct *work)
 	xe_device_mem_access_get(xe);
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
@@ -298,10 +343,28 @@ static void gsc_work(struct work_struct *work)
 	if (actions & GSC_ACTION_SW_PROXY)
 		xe_gsc_proxy_request_handler(gsc);
 
+out:
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
 	xe_device_mem_access_put(xe);
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
index 0d17e32d70c8..8bfe8b7b1e50 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -14,6 +14,7 @@
 #include "xe_device.h"
 #include "xe_execlist.h"
 #include "xe_force_wake.h"
+#include "xe_gsc.h"
 #include "xe_gt.h"
 #include "xe_gt_ccs_mode.h"
 #include "xe_gt_topology.h"
@@ -508,8 +509,13 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
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
index 2fd8cc26fc9f..d1a4bd90c533 100644
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

