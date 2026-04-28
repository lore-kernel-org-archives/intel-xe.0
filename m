Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB27BFF886F
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 05:51:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687E610E2F3;
	Tue, 28 Apr 2026 05:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SsLSaF6v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C0810E2F3
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 05:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777355486; x=1808891486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uqF2Hn7WPcZColJx5PDI/GJ1RXdcSpBEusCpdN4GFhA=;
 b=SsLSaF6vpiSZOHBSSmlEKxypYrwEbkWGQH0And3ynQIQQYfS2iZXyz4K
 CLS+r6wQTNEgUCRVxNuJCm6BpZyJOo5zsct3xR7/2s2M8zPqDCN/jHPtv
 m0hfMmt4PbYKWrxfLVymp/HNFDrLKtNDv8Id37Djn0jkmEoFuRX0UT6lW
 tbcJr+1mtqL1P5JmtLg1vuA+5mvfE830h78uiNtjyesyPcJBgrUSDk37J
 paIF++/GyJ8vdEik8spe3sLTCes1RxTIi2Sw8k31biJkP8GCqaCbi/0p9
 UIPruHmBgCPMxyWzV5bSgYVeT9RL3TvAywpHfiBT3XIYPU30iM62vxeNd w==;
X-CSE-ConnectionGUID: 8HJZVMHJTre1QcOFoLA/5w==
X-CSE-MsgGUID: AEbkxu7AQvOrJNQ4DXOBUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="82119229"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="82119229"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 22:51:26 -0700
X-CSE-ConnectionGUID: J7GeThi2RLGpeB4cMAMWAg==
X-CSE-MsgGUID: VkyYcZh8QkKIC4NI9V2PNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="271978578"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 27 Apr 2026 22:51:22 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 soham.purkait@intel.com, anoop.c.vijay@intel.com,
 aravind.iddamsetty@linux.intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v7 1/3] drm/xe/sysctrl: Add system controller interrupt handler
Date: Tue, 28 Apr 2026 11:18:24 +0530
Message-ID: <20260428054826.1202076-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428054826.1202076-1-raag.jadav@intel.com>
References: <20260428054826.1202076-1-raag.jadav@intel.com>
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

Add system controller interrupt handler which is denoted by 11th bit in
GFX master interrupt register. While at it, add worker for scheduling
system controller work.

Co-developed-by: Soham Purkait <soham.purkait@intel.com>
Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
v2: Use system_percpu_wq instead of dedicated (Matthew Brost)
v4: Handle IRQ before sysctrl initialization (Mallesh)
v6: Introduce work_lock in the patch it is used in (Riana)
---
 drivers/gpu/drm/xe/regs/xe_irq_regs.h |  1 +
 drivers/gpu/drm/xe/xe_irq.c           |  2 ++
 drivers/gpu/drm/xe/xe_sysctrl.c       | 35 +++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_sysctrl.h       |  1 +
 drivers/gpu/drm/xe/xe_sysctrl_types.h |  4 +++
 5 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
index 9d74f454d3ff..1d6b976c4de0 100644
--- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
@@ -22,6 +22,7 @@
 #define   DISPLAY_IRQ				REG_BIT(16)
 #define   SOC_H2DMEMINT_IRQ			REG_BIT(13)
 #define   I2C_IRQ				REG_BIT(12)
+#define   SYSCTRL_IRQ				REG_BIT(11)
 #define   GT_DW_IRQ(x)				REG_BIT(x)
 
 /*
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 7560a45f7f64..9e49e2241da4 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -24,6 +24,7 @@
 #include "xe_mmio.h"
 #include "xe_pxp.h"
 #include "xe_sriov.h"
+#include "xe_sysctrl.h"
 #include "xe_tile.h"
 
 /*
@@ -525,6 +526,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 				xe_heci_csc_irq_handler(xe, master_ctl);
 			xe_display_irq_handler(xe, master_ctl);
 			xe_i2c_irq_handler(xe, master_ctl);
+			xe_sysctrl_irq_handler(xe, master_ctl);
 			xe_mert_irq_handler(xe, master_ctl);
 			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
 		}
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
index 2bcef304eb9a..7de3e73bd8e0 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -8,6 +8,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "regs/xe_irq_regs.h"
 #include "regs/xe_sysctrl_regs.h"
 #include "xe_device.h"
 #include "xe_mmio.h"
@@ -30,10 +31,16 @@
 static void sysctrl_fini(void *arg)
 {
 	struct xe_device *xe = arg;
+	struct xe_sysctrl *sc = &xe->sc;
 
+	disable_work_sync(&sc->work);
 	xe->soc_remapper.set_sysctrl_region(xe, 0);
 }
 
+static void xe_sysctrl_work(struct work_struct *work)
+{
+}
+
 /**
  * xe_sysctrl_init() - Initialize System Controller subsystem
  * @xe: xe device instance
@@ -55,12 +62,6 @@ int xe_sysctrl_init(struct xe_device *xe)
 	if (!xe->info.has_sysctrl)
 		return 0;
 
-	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
-
-	ret = devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
-	if (ret)
-		return ret;
-
 	sc->mmio = devm_kzalloc(xe->drm.dev, sizeof(*sc->mmio), GFP_KERNEL);
 	if (!sc->mmio)
 		return -ENOMEM;
@@ -73,9 +74,29 @@ int xe_sysctrl_init(struct xe_device *xe)
 	if (ret)
 		return ret;
 
+	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
 	xe_sysctrl_mailbox_init(sc);
+	INIT_WORK(&sc->work, xe_sysctrl_work);
 
-	return 0;
+	return devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
+}
+
+/**
+ * xe_sysctrl_irq_handler() - Handler for System Controller interrupts
+ * @xe: xe device instance
+ * @master_ctl: interrupt register
+ *
+ * Handle interrupts generated by System Controller.
+ */
+void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl)
+{
+	struct xe_sysctrl *sc = &xe->sc;
+
+	if (!xe->info.has_sysctrl || !sc->work.func)
+		return;
+
+	if (master_ctl & SYSCTRL_IRQ)
+		schedule_work(&sc->work);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
index f3b0f3716b2f..f7469bfc9324 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
@@ -17,6 +17,7 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
 }
 
 int xe_sysctrl_init(struct xe_device *xe);
+void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
 void xe_sysctrl_pm_resume(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
index 8217f6befe70..5f408d6491ef 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -8,6 +8,7 @@
 
 #include <linux/mutex.h>
 #include <linux/types.h>
+#include <linux/workqueue_types.h>
 
 struct xe_mmio;
 
@@ -27,6 +28,9 @@ struct xe_sysctrl {
 
 	/** @phase_bit: Message boundary phase toggle bit (0 or 1) */
 	bool phase_bit;
+
+	/** @work: Pending events worker */
+	struct work_struct work;
 };
 
 #endif
-- 
2.43.0

