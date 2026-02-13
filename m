Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A62EF48CC
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 08:18:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0304810E7A7;
	Fri, 13 Feb 2026 08:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ne6aq5im";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279DC10E7A7
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 08:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770970735; x=1802506735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HO+SwEkWslqhEx97Ce1rlWT75qhZghkyscS1Eil4qio=;
 b=Ne6aq5imIkk0i3BC0uZgEVhwPw6mCRp5oDzl9mZiQd+9JhnqcU/82++8
 3UPGDQjTieFPfSHLYIEODUCGT6mCHl6HWQqqfzHzyEP3gm/6OSo5sxRwW
 3koWe5r2a0/9XbtTmBSlK2/uU3SxiuLDwz083YTXoX/4HtfWR3pTOWRZx
 e1JBnkBg3sKEkCXEhDInEPN5S3ZwKXcid5KlfWiTF1mQe7AozwXPlkV1/
 3y94qXcgEeOOaVjiO3KldcELi2a/JNBukiBXxdOo/DcIyZhYZKj5E+41M
 aSx1lwfeJqYd0QSd+SaA3krQNurdFC02c/gNtjLHutACTMDfM4yzmVcmV w==;
X-CSE-ConnectionGUID: WNTZYKmjQYqpECV2AeqP2w==
X-CSE-MsgGUID: ZuEGKaE9TheeAf/LVembFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="83522679"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="83522679"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 00:18:55 -0800
X-CSE-ConnectionGUID: f8i084sHQSmkGnHTK/8eHg==
X-CSE-MsgGUID: bz6I7hZfT1y4BACgwkXpWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="212696771"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa009.jf.intel.com with ESMTP; 13 Feb 2026 00:18:52 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 soham.purkait@intel.com, anoop.c.vijay@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 2/4] drm/xe/sysctrl: Add system controller interrupt handler
Date: Fri, 13 Feb 2026 13:46:00 +0530
Message-ID: <20260213081644.2085314-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213081644.2085314-1-raag.jadav@intel.com>
References: <20260213081644.2085314-1-raag.jadav@intel.com>
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

v2: Use system_percpu_wq instead of dedicated (Matthew Brost)

Co-developed-by: Soham Purkait <soham.purkait@intel.com>
Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_irq_regs.h |  1 +
 drivers/gpu/drm/xe/xe_irq.c           |  2 ++
 drivers/gpu/drm/xe/xe_sysctrl.c       | 39 ++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_sysctrl.h       |  3 +++
 drivers/gpu/drm/xe/xe_sysctrl_types.h |  7 +++++
 5 files changed, 45 insertions(+), 7 deletions(-)

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
index 430bccbdc3b9..aba2166650aa 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -7,6 +7,7 @@
 #include <linux/device.h>
 #include <linux/mutex.h>
 
+#include "regs/xe_irq_regs.h"
 #include "regs/xe_sysctrl_regs.h"
 #include "xe_device.h"
 #include "xe_mmio.h"
@@ -28,10 +29,16 @@
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
 
+	cancel_work_sync(&sc->work);
 	xe->soc_remapper.set_sysctrl_region(xe, 0);
 }
 
@@ -56,12 +63,6 @@ int xe_sysctrl_init(struct xe_device *xe)
 	if (!xe->soc_remapper.set_sysctrl_region)
 		return -ENODEV;
 
-	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
-
-	ret = devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fini, xe);
-	if (ret)
-		return ret;
-
 	sc->mmio = devm_kzalloc(xe->drm.dev, sizeof(*sc->mmio), GFP_KERNEL);
 	if (!sc->mmio)
 		return -ENOMEM;
@@ -74,7 +75,31 @@ int xe_sysctrl_init(struct xe_device *xe)
 	if (ret)
 		return ret;
 
+	ret = drmm_mutex_init(&xe->drm, &sc->work_lock);
+	if (ret)
+		return ret;
+
+	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
 	xe_sysctrl_mailbox_init(sc);
+	INIT_WORK(&sc->work, xe_sysctrl_work);
 
-	return 0;
+	return devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fini, xe);
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
+	if (!xe->info.has_sysctrl)
+		return;
+
+	if (master_ctl & SYSCTRL_IRQ)
+		schedule_work(&sc->work);
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
index d4a362564925..bfaa9ad085ce 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
@@ -8,6 +8,7 @@
 
 #include <linux/mutex.h>
 #include <linux/types.h>
+#include <linux/workqueue_types.h>
 
 struct xe_mmio;
 
@@ -28,6 +29,12 @@ struct xe_sysctrl {
 	 * messages to help distinguish message boundaries.
 	 */
 	bool phase_bit;
+
+	/** @work: Pending events work */
+	struct work_struct work;
+
+	/** @work_lock: Mutex protecting pending events */
+	struct mutex work_lock;
 };
 
 #endif /* _XE_SYSCTRL_TYPES_H_ */
-- 
2.43.0

