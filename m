Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B8FD4A61E
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 09:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872F310E042;
	Fri, 16 Jan 2026 09:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUZ98CiP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC91D10E042
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 09:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768556213; x=1800092213;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sJ2b9Ce/yz8jqkftlbfC0alOeGEdQVjXCo+7gxl5drk=;
 b=PUZ98CiPlQuGFe+87MVzI2t0gMs6dEJAc5Fx4WvrFPUXrCoFmrCo6kg5
 8IeQihgJVSN5p3LUooGLz1CaB/a1UTpOaQT/VCQ1D4pKUv8gvEOublbCg
 wCM3UByxVC9eyOo+SJArFRwIE+CtdsMdIdDXGKkwmcajN6Y/QSCLF9vH3
 FPvg49zvjpq05gnk6ZTDYzDgigpSTnvUK7UIYSZrlxy0DuqZOPkC9fwBa
 N86tef5h2ufcN6juJ7BNCfTA6lNW3Q9qOSKSgSuxhZyeQP71PT1w3NEFx
 KldC+/2MZ8wnXUgBC483ZtW4KKBiMQNw2FtwvyWx+6bQsExk/Vl5xzfhi g==;
X-CSE-ConnectionGUID: wjzFxJlIQICyq3BTW9GOkw==
X-CSE-MsgGUID: RBg0EbeMR5yWZ98vb81IGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80174990"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="80174990"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 01:36:53 -0800
X-CSE-ConnectionGUID: CSjw7yfTRJKoWV/aPcOmUQ==
X-CSE-MsgGUID: tgx2Pt/0R/uqPVJHiJSZDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="205619595"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 16 Jan 2026 01:36:51 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, umesh.nerlige.ramappa@intel.com,
 soham.purkait@intel.com, anoop.c.vijay@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 2/4] drm/xe/sysctrl: Add system controller interrupt handler
Date: Fri, 16 Jan 2026 15:03:31 +0530
Message-ID: <20260116093432.914040-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116093432.914040-1-raag.jadav@intel.com>
References: <20260116093432.914040-1-raag.jadav@intel.com>
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
GFX master interrupt register. While at it, add ordered workqueue for
scheduling system controller work.

Co-developed-by: Soham Purkait <soham.purkait@intel.com>
Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_irq_regs.h |  1 +
 drivers/gpu/drm/xe/xe_irq.c           |  2 ++
 drivers/gpu/drm/xe/xe_sysctrl.c       | 39 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sysctrl.h       |  3 +++
 drivers/gpu/drm/xe/xe_sysctrl_types.h |  7 +++++
 5 files changed, 52 insertions(+)

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
index 8daab7703247..1d78916dd6ad 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -7,6 +7,7 @@
 #include <linux/device.h>
 #include <linux/mutex.h>
 
+#include "regs/xe_irq_regs.h"
 #include "regs/xe_sysctrl_regs.h"
 #include "xe_device.h"
 #include "xe_printk.h"
@@ -27,9 +28,17 @@
  * with the System Controller through the mailbox.
  */
 
+static void xe_sysctrl_work(struct work_struct *work)
+{
+}
+
 static void xe_sysctrl_fini(void *arg)
 {
 	struct xe_device *xe = arg;
+	struct xe_sysctrl *sc = &xe->sc;
+
+	cancel_work_sync(&sc->work);
+	destroy_workqueue(sc->wq);
 
 	xe->soc_remapper.set_sysctrl_region(xe, 0);
 }
@@ -56,6 +65,14 @@ int xe_sysctrl_init(struct xe_device *xe)
 
 	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
 
+	INIT_WORK(&sc->work, xe_sysctrl_work);
+
+	sc->wq = alloc_ordered_workqueue("sysctrl-ordered-wq", 0);
+	if (!sc->wq) {
+		ret = -ENOMEM;
+		goto err_sysctrl_fini;
+	}
+
 	ret = devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fini, xe);
 	if (ret)
 		return ret;
@@ -67,4 +84,26 @@ int xe_sysctrl_init(struct xe_device *xe)
 	xe_sysctrl_mailbox_init(sc);
 
 	return 0;
+
+err_sysctrl_fini:
+	xe_sysctrl_fini(xe);
+	return ret;
+}
+
+/**
+ * xe_sysctrl_irq_handler: Handler for System Controller interrupts
+ * @xe: xe device instance
+ * @master_ctl: interrupt register
+ *
+ * Handle interrupts generated by System Controller.
+ */
+void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl)
+{
+	struct xe_sysctrl *sc = &xe->sc;
+
+	if (!xe->info.has_sysctrl)
+		return;
+
+	if (master_ctl & SYSCTRL_IRQ)
+		queue_work(sc->wq, &sc->work);
 }
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
index ee7826fe4c98..5919310b9db9 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
@@ -6,8 +6,11 @@
 #ifndef _XE_SYSCTRL_H_
 #define _XE_SYSCTRL_H_
 
+#include <linux/types.h>
+
 struct xe_device;
 
 int xe_sysctrl_init(struct xe_device *xe);
+void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
 
 #endif /* _XE_SYSCTRL_H_ */
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
index 88a34967688b..14fc80dfee6e 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -8,6 +8,7 @@
 
 #include <linux/mutex.h>
 #include <linux/types.h>
+#include <linux/workqueue_types.h>
 
 /**
  * struct xe_sysctrl - System Controller driver context
@@ -18,6 +19,12 @@ struct xe_sysctrl {
 
 	/** @phase_bit: MKHI message boundary phase toggle bit */
 	u32 phase_bit;
+
+	/** @wq: Queue for sysctrl work */
+	struct workqueue_struct *wq;
+
+	/** @work: Worker for pending events */
+	struct work_struct work;
 };
 
 #endif /* _XE_SYSCTRL_TYPES_H_ */
-- 
2.43.0

