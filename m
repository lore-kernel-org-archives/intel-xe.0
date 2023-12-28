Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C30C3DA6E
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 11:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BEB710E14E;
	Thu, 28 Dec 2023 11:09:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C8010E14E
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 11:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703761789; x=1735297789;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vNs46hD6KXFfYqdJ17NKux4VTbXli1KqGTZFbHnj+aE=;
 b=i7hMHAyuJk7q+rqtLw0aXvNjp06Sikex/3Hecmu3A1aHeUsEWHKACyIl
 Iw8ty+o2YkASgnMHNtQopehNm7Z2RTnXUje0y7+nkf2V/5R/FjFZ0rb3/
 Dw9bxtfTixdh3Lv6rRXxyJRX/RmA88silXiYWtNJfnBcYMbF9emRxsk6I
 KPKssVPlnDbDvxcRN+zBHZOaz1RXxFVxYdAXq3m0rl/IV59/xElHs5keB
 1qrshcEPM2PQKSkVf42jjm0SyIfPlbaaoUF8lAGwItIyur6E1GgNmJGjE
 N2nX7MzgIC63dbuhuUktjduFwYyMV/bHhuVUufMLmA5aHejVUgu5bb00u A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="386971645"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; d="scan'208";a="386971645"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 03:09:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="807399791"
X-IronPort-AV: E=Sophos;i="6.04,311,1695711600"; d="scan'208";a="807399791"
Received: from amajstox-mobl1.ger.corp.intel.com (HELO
 hazy.ger.corp.intel.com) ([10.251.210.144])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2023 03:09:46 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [RFC] drm/i915/display: add support for DMC wakelocks
Date: Thu, 28 Dec 2023 13:09:34 +0200
Message-Id: <20231228110934.383623-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In order to reduce the DC5->DC2 restore time, wakelocks have been
introduced in DMC so the driver can tell it when registers and other
memory areas are going to be accessed and keep their respective blocks
awake.

Implement this in the driver by adding the concept of DMC wakelocks.
When the driver needs to access memory which lies inside pre-defined
ranges, it will tell DMC to set the wakelock, access the memory, then
wait for a while and clear the wakelock.

The wakelock state is protected in the driver with spinlocks to
prevent concurrency issues.

RFC: this is still very rough on the corners and, for now, we are
only handling RMW cases.  The locking mechanisms still need to be
fine-tuned and verified.  Additionally, there are loads of logs that
will be removed and things like hardcoded delays when reading ACKs
will be changed to proper waiting functions etc.  We are also using
dummy ranges for now, but these need to be specified properly,
according to the bspecs.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_de.h       |  16 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   4 +
 .../gpu/drm/i915/display/intel_display_core.h |   4 +
 .../drm/i915/display/intel_display_driver.c   |   1 +
 drivers/gpu/drm/i915/display/intel_dmc_regs.h |  18 ++
 drivers/gpu/drm/i915/display/intel_wakelock.c | 191 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_wakelock.h |  34 ++++
 drivers/gpu/drm/xe/Makefile                   |   1 +
 9 files changed, 269 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_wakelock.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_wakelock.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 16fe43483fe4..c1d5e5b749c5 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -294,6 +294,7 @@ i915-y += \
 	display/intel_tc.o \
 	display/intel_vblank.o \
 	display/intel_vga.o \
+	display/intel_wakelock.o \
 	display/intel_wm.o \
 	display/i9xx_plane.o \
 	display/i9xx_wm.o \
diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index 42552d8c151e..0597ddf49f70 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -42,11 +42,25 @@ intel_de_write(struct drm_i915_private *i915, i915_reg_t reg, u32 val)
 }
 
 static inline u32
-intel_de_rmw(struct drm_i915_private *i915, i915_reg_t reg, u32 clear, u32 set)
+__intel_de_rmw(struct drm_i915_private *i915, i915_reg_t reg, u32 clear, u32 set)
 {
 	return intel_uncore_rmw(&i915->uncore, reg, clear, set);
 }
 
+static inline u32
+intel_de_rmw(struct drm_i915_private *i915, i915_reg_t reg, u32 clear, u32 set)
+{
+	u32 val;
+
+	intel_display_wl_get(i915, reg);
+
+	val = __intel_de_rmw(i915, reg, clear, set);
+
+	intel_display_wl_put(i915, reg);
+
+	return val;
+}
+
 static inline int
 intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t reg,
 			   u32 mask, u32 value, unsigned int timeout)
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index e1cdebe3a8a6..c662944e6b98 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -118,6 +118,7 @@
 #include "intel_vdsc_regs.h"
 #include "intel_vga.h"
 #include "intel_vrr.h"
+#include "intel_wakelock.h"
 #include "intel_wm.h"
 #include "skl_scaler.h"
 #include "skl_universal_plane.h"
@@ -7468,6 +7469,9 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 		 * the culprit.
 		 */
 		intel_uncore_arm_unclaimed_mmio_detection(&dev_priv->uncore);
+
+		/* Enable DMC wakelock */
+		intel_display_wl_enable(dev_priv);
 	}
 	/*
 	 * Delay re-enabling DC states by 17 ms to avoid the off->on->off
diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index f2c84ae52217..dcd159c5cfbc 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -26,6 +26,7 @@
 #include "intel_global_state.h"
 #include "intel_gmbus.h"
 #include "intel_opregion.h"
+#include "intel_wakelock.h"
 #include "intel_wm_types.h"
 
 struct drm_i915_private;
@@ -520,7 +521,10 @@ struct intel_display {
 	struct intel_overlay *overlay;
 	struct intel_display_params params;
 	struct intel_vbt_data vbt;
+	struct intel_display_wl wl;
 	struct intel_wm wm;
+
+
 };
 
 #endif /* __INTEL_DISPLAY_CORE_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 44b59ac301e6..176a6241111e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -189,6 +189,7 @@ void intel_display_driver_early_probe(struct drm_i915_private *i915)
 	intel_dpll_init_clock_hook(i915);
 	intel_init_display_hooks(i915);
 	intel_fdi_init_hook(i915);
+	intel_display_wl_init(i915);
 }
 
 /* part #1: call before irq install */
diff --git a/drivers/gpu/drm/i915/display/intel_dmc_regs.h b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
index cf10094acae3..e68a2afcf14f 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
@@ -96,4 +96,22 @@
 #define TGL_DMC_DEBUG3		_MMIO(0x101090)
 #define DG1_DMC_DEBUG3		_MMIO(0x13415c)
 
+#define DMC_WAKELOCK_CFG	_MMIO(0x8F1B0)
+#define  DMC_WAKELOCK_CFG_ENABLE REG_BIT(31)
+#define DMC_WAKELOCK1_CTL	_MMIO(0x8F140)
+#define DMC_WAKELOCK2_CTL	_MMIO(0x8F144)
+#define DMC_WAKELOCK3_CTL	_MMIO(0x8F148)
+#define DMC_WAKELOCK4_CTL	_MMIO(0x8F14C)
+#define DMC_WAKELOCK5_CTL	_MMIO(0x8F150)
+#define DMC_WAKELOCK6_CTL	_MMIO(0x8F154)
+#define DMC_WAKELOCK7_CTL	_MMIO(0x8F158)
+#define DMC_WAKELOCK8_CTL	_MMIO(0x8F15C)
+#define DMC_WAKELOCK9_CTL	_MMIO(0x8F160)
+#define DMC_WAKELOCK10_CTL	_MMIO(0x8F164)
+#define DMC_WAKELOCK11_CTL	_MMIO(0x8F168)
+#define DMC_WAKELOCK12_CTL	_MMIO(0x8F16C)
+#define DMC_WAKELOCK13_CTL	_MMIO(0x8F170)
+#define  DMC_WAKELOCK_CTL_REQ	 REG_BIT(31)
+#define  DMC_WAKELOCK_CTL_ACK	 REG_BIT(15)
+
 #endif /* __INTEL_DMC_REGS_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_wakelock.c b/drivers/gpu/drm/i915/display/intel_wakelock.c
new file mode 100644
index 000000000000..63ec2976a8f7
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_wakelock.c
@@ -0,0 +1,191 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (C) 2023 Intel Corporation
+ */
+
+#include <linux/kernel.h>
+
+#include "intel_de.h"
+#include "intel_dmc_regs.h"
+#include "intel_wakelock.h"
+
+static struct intel_display_wl_range lnl_wl_range[] = {
+	{ .start = 0x60000, .end = 0x7ffff },
+};
+
+static void __intel_display_wl_release(struct drm_i915_private *i915)
+{
+	struct intel_display_wl *wl = &i915->display.wl;
+
+	WARN_ON(refcount_read(&wl->refcount));
+
+	drm_info(&i915->drm,
+		 "DMC_WAKELOCK1_CTL to be released (refcount = %d)\n",
+		 refcount_read(&wl->refcount));
+
+	queue_delayed_work(i915->unordered_wq, &wl->work,
+			   msecs_to_jiffies(2000));
+}
+
+static void intel_display_wl_work(struct work_struct *work)
+{
+	struct intel_display_wl *wl =
+		container_of(work, struct intel_display_wl, work.work);
+	struct drm_i915_private *i915 =
+		container_of(wl, struct drm_i915_private, display.wl);
+	unsigned long flags;
+	u32 ctl_value;
+
+	spin_lock_irqsave(&wl->lock, flags);
+
+	drm_info(&i915->drm, "DMC_WAKELOCK1_CTL work running (refcount = %d)\n",
+		 refcount_read(&wl->refcount));
+
+	ctl_value = __intel_de_rmw(i915, DMC_WAKELOCK1_CTL,
+				   DMC_WAKELOCK_CFG_ENABLE, 0);
+
+	drm_info(&i915->drm, "DMC_WAKELOCK1_CTL 0x%0x before\n", ctl_value);
+
+	drm_info(&i915->drm, "DMC_WAKELOCK1_CTL read 0x%0x immediately after\n",
+		 intel_de_read(i915, DMC_WAKELOCK1_CTL));
+
+	udelay(100);
+
+	drm_info(&i915->drm, "DMC_WAKELOCK1_CTL read 0x%0x after delay\n",
+		 intel_de_read(i915, DMC_WAKELOCK1_CTL));
+
+	spin_unlock_irqrestore(&wl->lock, flags);
+}
+
+static bool intel_display_wl_check_range(u32 address)
+{
+	int i;
+	bool wl_needed = false;
+
+	for (i = 0; i < ARRAY_SIZE(lnl_wl_range); i++) {
+		if (address >= lnl_wl_range[i].start &&
+		    address <= lnl_wl_range[i].end) {
+			wl_needed = true;
+			break;
+		}
+	}
+
+	return wl_needed;
+}
+
+void intel_display_wl_init(struct drm_i915_private *i915)
+{
+	struct intel_display_wl *wl = &i915->display.wl;
+	unsigned long flags;
+
+	spin_lock_init(&wl->lock);
+
+	spin_lock_irqsave(&wl->lock, flags);
+	refcount_set(&wl->refcount, 0);
+	spin_unlock_irqrestore(&wl->lock, flags);
+}
+
+void intel_display_wl_enable(struct drm_i915_private *i915)
+{
+	struct intel_display_wl *wl = &i915->display.wl;
+	unsigned long flags;
+
+	spin_lock_irqsave(&wl->lock, flags);
+
+	if (wl->enabled)
+		goto out_unlock;
+
+	drm_info(&i915->drm, "DMC_WAKELOCK_CFG refcount %d\n",
+		 refcount_read(&wl->refcount));
+
+	INIT_DELAYED_WORK(&wl->work, intel_display_wl_work);
+
+	/*
+	 * Enable wakelock in DMC.  We shouldn't try to take the
+	 * wakelock, because we're just enabling it, so call the
+	 * non-locking version directly here.
+	 */
+	__intel_de_rmw(i915, DMC_WAKELOCK_CFG, 0, DMC_WAKELOCK_CFG_ENABLE);
+
+	drm_info(&i915->drm, "DMC_WAKELOCK_CFG read 0x%0x\n",
+		 intel_de_read(i915, DMC_WAKELOCK_CFG));
+
+	wl->enabled = true;
+
+out_unlock:
+	spin_unlock_irqrestore(&wl->lock, flags);
+	return;
+}
+
+void intel_display_wl_get(struct drm_i915_private *i915, i915_reg_t reg)
+{
+	struct intel_display_wl *wl = &i915->display.wl;
+	unsigned long flags;
+	u32 ctl_value;
+
+	if (!intel_display_wl_check_range(reg.reg))
+		return;
+
+	spin_lock_irqsave(&wl->lock, flags);
+
+	if (!wl->enabled)
+		goto out_unlock;
+
+	if (refcount_inc_not_zero(&wl->refcount)) {
+		drm_info(&i915->drm,
+			 "DMC_WAKELOCK1_CTL refcount is now %d -- wakelock already taken\n",
+			 refcount_read(&wl->refcount));
+		goto out_unlock;
+	}
+
+	refcount_set(&wl->refcount, 1);
+
+	drm_info(&i915->drm, "DMC_WAKELOCK1_CTL refcount is now %d\n",
+		 refcount_read(&wl->refcount));
+
+	/* TODO: split this to a separate function to align with _release() */
+	ctl_value = __intel_de_rmw(i915, DMC_WAKELOCK1_CTL,
+				   0, DMC_WAKELOCK_CFG_ENABLE);
+
+	drm_info(&i915->drm, "DMC_WAKELOCK1_CTL 0x%0x before\n", ctl_value);
+
+	drm_info(&i915->drm, "DMC_WAKELOCK1_CTL read 0x%0x immediately after\n",
+		 intel_de_read(i915, DMC_WAKELOCK1_CTL));
+
+	udelay(100);
+
+	drm_info(&i915->drm, "DMC_WAKELOCK1_CTL read 0x%0x after delay\n",
+		 intel_de_read(i915, DMC_WAKELOCK1_CTL));
+
+out_unlock:
+	spin_unlock_irqrestore(&wl->lock, flags);
+}
+
+void intel_display_wl_put(struct drm_i915_private *i915, i915_reg_t reg)
+{
+	struct intel_display_wl *wl = &i915->display.wl;
+	unsigned long flags;
+
+	if (!intel_display_wl_check_range(reg.reg))
+		return;
+
+	spin_lock_irqsave(&wl->lock, flags);
+
+	if (!wl->enabled || !refcount_read(&wl->refcount))
+		goto out_unlock;
+
+	if (refcount_dec_and_test(&wl->refcount)) {
+		drm_info(&i915->drm,
+			 "DMC_WAKELOCK1_CTL refcount is now ZERO\n");
+
+		__intel_display_wl_release(i915);
+
+		goto out_unlock;
+	}
+
+	drm_info(&i915->drm, "DMC_WAKELOCK1_CTL refcount is now %d\n",
+		 refcount_read(&wl->refcount));
+
+out_unlock:
+	spin_unlock_irqrestore(&wl->lock, flags);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_wakelock.h b/drivers/gpu/drm/i915/display/intel_wakelock.h
new file mode 100644
index 000000000000..a47205e1ea32
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_wakelock.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (C) 2023 Intel Corporation
+ */
+
+#ifndef __INTEL_WAKELOCK_H__
+#define __INTEL_WAKELOCK_H__
+
+#include <linux/types.h>
+#include <linux/workqueue.h>
+#include <linux/refcount.h>
+
+#include "i915_reg_defs.h"
+
+struct drm_i915_private;
+
+struct intel_display_wl {
+	spinlock_t lock;
+	bool enabled;
+	refcount_t refcount;
+	struct delayed_work work;
+};
+
+struct intel_display_wl_range {
+	u32 start;
+	u32 end;
+};
+
+void intel_display_wl_init(struct drm_i915_private *i915);
+void intel_display_wl_enable(struct drm_i915_private *i915);
+void intel_display_wl_get(struct drm_i915_private *i915, i915_reg_t reg);
+void intel_display_wl_put(struct drm_i915_private *i915, i915_reg_t reg);
+
+#endif /* __INTEL_WAKELOCK_H__ */
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a8f778325420..2f6cc8cc6845 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -254,6 +254,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_vdsc.o \
 	i915-display/intel_vga.o \
 	i915-display/intel_vrr.o \
+	i915-display/intel_wakelock.o \
 	i915-display/intel_wm.o \
 	i915-display/skl_scaler.o \
 	i915-display/skl_universal_plane.o \
-- 
2.39.2

