Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFF21061B21
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 10:27:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A0310E9D6;
	Tue, 31 Mar 2026 10:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M7M+6tAG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B1B10E9D6
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 10:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774952843; x=1806488843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YMjJSncEBIx6qLLLnlgJfWnrLqM1tANSuQVUq9XK298=;
 b=M7M+6tAGC5kntHX9yGiuYchsujNPQYqfCzZAP1+/CWNzQCiV02gzbHNA
 NW9Y3RRsrS7zYxwJsgo3VpzXLeXM8HhkuP6ZDOWUlQpfuFkMIB/1kJQOJ
 2+A+ZygzEPg3o2kdsT14EPvCYxJewnV12f3U8WUWdrzXBONYd3YczKWTO
 xM0ho84MzZ+9ArWZZv3PNHpTtlgYGwLEwgWr4KeKQt+l5uOe23wXxWZsR
 gzAh6NyBcp1FkQm+TDhSbY9InsWzv74Q7a65HlQnGc0bGuBdneypW2nCg
 Dm7FCxEFB82lspsWBmZkyHocT7N5mKuBXpw4jNbf0yHSL6o/wo9Qjpeze A==;
X-CSE-ConnectionGUID: Zi858RhQTi27UKO6Hx/Asw==
X-CSE-MsgGUID: v+dACUK+Q1OSvYUCVQ5wMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86655537"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="86655537"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 03:27:23 -0700
X-CSE-ConnectionGUID: QIQNfXjdTDqne+XKnEbMkQ==
X-CSE-MsgGUID: hv+og3zbQSmrh7Izw4v9ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="226576944"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa007.jf.intel.com with ESMTP; 31 Mar 2026 03:27:19 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 soham.purkait@intel.com, anoop.c.vijay@intel.com,
 aravind.iddamsetty@linux.intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 1/3] drm/xe/sysctrl: Add system controller interrupt handler
Date: Tue, 31 Mar 2026 15:53:43 +0530
Message-ID: <20260331102346.1034100-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331102346.1034100-1-raag.jadav@intel.com>
References: <20260331102346.1034100-1-raag.jadav@intel.com>
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
---
v2: Use system_percpu_wq instead of dedicated (Matthew Brost)
v4: Handle IRQ before sysctrl initialization (Mallesh)
---
 drivers/gpu/drm/xe/regs/xe_irq_regs.h |  1 +
 drivers/gpu/drm/xe/xe_irq.c           |  2 ++
 drivers/gpu/drm/xe/xe_sysctrl.c       | 39 ++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_sysctrl.h       |  1 +
 drivers/gpu/drm/xe/xe_sysctrl_types.h |  7 +++++
 5 files changed, 44 insertions(+), 6 deletions(-)

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
index 9a775c6588dc..e9f0b3cad06d 100644
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
index 2bcef304eb9a..afa9654668a2 100644
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
 
+	cancel_work_sync(&sc->work);
 	xe->soc_remapper.set_sysctrl_region(xe, 0);
 }
 
+static void xe_sysctrl_work(struct work_struct *work)
+{
+}
+
 /**
  * xe_sysctrl_init() - Initialize System Controller subsystem
  * @xe: xe device instance
@@ -55,11 +62,7 @@ int xe_sysctrl_init(struct xe_device *xe)
 	if (!xe->info.has_sysctrl)
 		return 0;
 
-	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
-
-	ret = devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
-	if (ret)
-		return ret;
+	xe_assert(xe, xe->soc_remapper.set_sysctrl_region);
 
 	sc->mmio = devm_kzalloc(xe->drm.dev, sizeof(*sc->mmio), GFP_KERNEL);
 	if (!sc->mmio)
@@ -73,9 +76,33 @@ int xe_sysctrl_init(struct xe_device *xe)
 	if (ret)
 		return ret;
 
+	ret = devm_mutex_init(xe->drm.dev, &sc->work_lock);
+	if (ret)
+		return ret;
+
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
index 8217f6befe70..13fbf2990280 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -8,6 +8,7 @@
 
 #include <linux/mutex.h>
 #include <linux/types.h>
+#include <linux/workqueue_types.h>
 
 struct xe_mmio;
 
@@ -27,6 +28,12 @@ struct xe_sysctrl {
 
 	/** @phase_bit: Message boundary phase toggle bit (0 or 1) */
 	bool phase_bit;
+
+	/** @work: Pending events work */
+	struct work_struct work;
+
+	/** @work_lock: Mutex protecting pending events */
+	struct mutex work_lock;
 };
 
 #endif
-- 
2.43.0

