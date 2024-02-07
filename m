Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA328C4828D
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 10:31:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7672111320F;
	Wed,  7 Feb 2024 10:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EY851XVf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E00D11320A
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Feb 2024 10:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707301887; x=1738837887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wEaBKW8B9NylkqceOFHXEKx2FvOd6BUd4MQo8brlVko=;
 b=EY851XVfsr0W3MFQFYYSb8YaljjuSs5H3YWFbF3gPidV6GCXZwXzZuct
 0al8X/aDPC+pQ5QSeuls3ujOdwcjUmtWmYx6z++Sjvwq3BF28KptuTV9Z
 66awy0UOMgWyjDCvzPo3j2YwotTxkJ6jV9gO/m6Qag8i9KUFDdpBZsFhp
 iF7NRCBysep0gG1gRvwUp2wp/ALqC60IIwwEmqEJySoacGgA0lbTpqW5X
 6qzn/c+EANGgwdFGZBhvd0lR4G7EjblWgy5B7iKB2p5MvLbrmb5mg2Djq
 qTB/m3JU5KYMyIAdfNO52xReIbG2t71kNM+ULcscNyzTdXiJJs4PrUrNO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="12317336"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; d="scan'208";a="12317336"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:31:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1328855"
Received: from mlyngsie-mobl.ger.corp.intel.com (HELO hazy.ger.corp.intel.com)
 ([10.252.42.69])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:31:12 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com, gustavo.sousa@intel.com
Subject: [PATCH 1/6] drm/i915/display: add support for DMC wakelocks
Date: Wed,  7 Feb 2024 12:30:02 +0200
Message-Id: <20240207103007.665367-2-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240207103007.665367-1-luciano.coelho@intel.com>
References: <20240207103007.665367-1-luciano.coelho@intel.com>
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

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_de.h       |  35 +++-
 drivers/gpu/drm/i915/display/intel_display.c  |   1 +
 .../gpu/drm/i915/display/intel_display_core.h |   4 +
 .../drm/i915/display/intel_display_driver.c   |   1 +
 drivers/gpu/drm/i915/display/intel_dmc_regs.h |  32 +++
 drivers/gpu/drm/i915/display/intel_dmc_wl.c   | 185 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dmc_wl.h   |  35 ++++
 drivers/gpu/drm/xe/Makefile                   |   1 +
 9 files changed, 293 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dmc_wl.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dmc_wl.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index f7d13a7dcd63..05f0f54cc98e 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -312,6 +312,7 @@ i915-y += \
 	display/intel_tc.o \
 	display/intel_vblank.o \
 	display/intel_vga.o \
+	display/intel_dmc_wl.o \
 	display/intel_wm.o \
 	display/skl_scaler.o \
 	display/skl_universal_plane.o \
diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index 42552d8c151e..ef24748d522d 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -42,16 +42,47 @@ intel_de_write(struct drm_i915_private *i915, i915_reg_t reg, u32 val)
 }
 
 static inline u32
-intel_de_rmw(struct drm_i915_private *i915, i915_reg_t reg, u32 clear, u32 set)
+__intel_de_rmw_nowl(struct drm_i915_private *i915, i915_reg_t reg,
+		    u32 clear, u32 set)
 {
 	return intel_uncore_rmw(&i915->uncore, reg, clear, set);
 }
 
+static inline u32
+intel_de_rmw(struct drm_i915_private *i915, i915_reg_t reg, u32 clear, u32 set)
+{
+	u32 val;
+
+	intel_dmc_wl_get(i915, reg);
+
+	val = __intel_de_rmw_nowl(i915, reg, clear, set);
+
+	intel_dmc_wl_put(i915, reg);
+
+	return val;
+}
+
+static inline int
+__intel_wait_for_register_nowl(struct drm_i915_private *i915, i915_reg_t reg,
+			       u32 mask, u32 value, unsigned int timeout)
+{
+	return intel_wait_for_register(&i915->uncore, reg, mask,
+				       value, timeout);
+}
+
 static inline int
 intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t reg,
 			   u32 mask, u32 value, unsigned int timeout)
 {
-	return intel_wait_for_register(&i915->uncore, reg, mask, value, timeout);
+	int ret;
+
+	intel_dmc_wl_get(i915, reg);
+
+	ret = __intel_wait_for_register_nowl(i915, reg, mask, value, timeout);
+
+	intel_dmc_wl_put(i915, reg);
+
+	return ret;
 }
 
 static inline int
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index c3a46272d3a3..f38146690298 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -115,6 +115,7 @@
 #include "intel_vdsc_regs.h"
 #include "intel_vga.h"
 #include "intel_vrr.h"
+#include "intel_dmc_wl.h"
 #include "intel_wm.h"
 #include "skl_scaler.h"
 #include "skl_universal_plane.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
index a90f1aa201be..ec2c16744992 100644
--- a/drivers/gpu/drm/i915/display/intel_display_core.h
+++ b/drivers/gpu/drm/i915/display/intel_display_core.h
@@ -26,6 +26,7 @@
 #include "intel_global_state.h"
 #include "intel_gmbus.h"
 #include "intel_opregion.h"
+#include "intel_dmc_wl.h"
 #include "intel_wm_types.h"
 
 struct task_struct;
@@ -531,7 +532,10 @@ struct intel_display {
 	struct intel_overlay *overlay;
 	struct intel_display_params params;
 	struct intel_vbt_data vbt;
+	struct intel_dmc_wl wl;
 	struct intel_wm wm;
+
+
 };
 
 #endif /* __INTEL_DISPLAY_CORE_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index ecf9cb74734b..491d1a38a313 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -197,6 +197,7 @@ void intel_display_driver_early_probe(struct drm_i915_private *i915)
 	intel_dpll_init_clock_hook(i915);
 	intel_init_display_hooks(i915);
 	intel_fdi_init_hook(i915);
+	intel_dmc_wl_init(i915);
 }
 
 /* part #1: call before irq install */
diff --git a/drivers/gpu/drm/i915/display/intel_dmc_regs.h b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
index 90d0dbb41cfe..ef8642ced911 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
@@ -97,4 +97,36 @@
 #define TGL_DMC_DEBUG3		_MMIO(0x101090)
 #define DG1_DMC_DEBUG3		_MMIO(0x13415c)
 
+/**
+ * DOC: DMC wakelock support
+ *
+ * The wakelock mechanism in DMC is used to make sure it doesn't enter
+ * deeper power-saving modes in order to reduce the latency in
+ * DC5->DC2 restore.
+ *
+ * The mechanism can be enabled and disabled by writing to the
+ * DMC_WAKELOCK_CFG register.  There are also 13 control registers
+ * that can be used to hold and release different wakelocks.  In the
+ * current implementation, we only need one wakelock, so only
+ * DMC_WAKELOCK1_CTL is used.  The other definitions are here for
+ * potential future use.
+ */
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
diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.c b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
new file mode 100644
index 000000000000..abe1ea92cf65
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
@@ -0,0 +1,185 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (C) 2023 Intel Corporation
+ */
+
+#include <linux/kernel.h>
+
+#include "intel_de.h"
+#include "intel_dmc_regs.h"
+#include "intel_dmc_wl.h"
+
+#define DMC_WAKELOCK_CTL_TIMEOUT 100
+
+static struct intel_dmc_wl_range lnl_wl_range[] = {
+	{ .start = 0x60000, .end = 0x7ffff },
+};
+
+static void __intel_dmc_wl_release(struct drm_i915_private *i915)
+{
+	struct intel_dmc_wl *wl = &i915->display.wl;
+
+	WARN_ON(refcount_read(&wl->refcount));
+
+	queue_delayed_work(i915->unordered_wq, &wl->work,
+			   msecs_to_jiffies(2000));
+}
+
+static void intel_dmc_wl_work(struct work_struct *work)
+{
+	struct intel_dmc_wl *wl =
+		container_of(work, struct intel_dmc_wl, work.work);
+	struct drm_i915_private *i915 =
+		container_of(wl, struct drm_i915_private, display.wl);
+	unsigned long flags;
+	u32 ctl_value;
+
+	spin_lock_irqsave(&wl->lock, flags);
+
+	ctl_value = __intel_de_rmw_nowl(i915, DMC_WAKELOCK1_CTL,
+					DMC_WAKELOCK_CTL_REQ, 0);
+
+	__intel_wait_for_register_nowl(i915,  DMC_WAKELOCK1_CTL,
+				       DMC_WAKELOCK_CTL_ACK, 0,
+				       DMC_WAKELOCK_CTL_TIMEOUT);
+
+	spin_unlock_irqrestore(&wl->lock, flags);
+}
+
+static bool intel_dmc_wl_check_range(u32 address)
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
+void intel_dmc_wl_init(struct drm_i915_private *i915)
+{
+	struct intel_dmc_wl *wl = &i915->display.wl;
+	unsigned long flags;
+
+	spin_lock_init(&wl->lock);
+
+	spin_lock_irqsave(&wl->lock, flags);
+	refcount_set(&wl->refcount, 0);
+	spin_unlock_irqrestore(&wl->lock, flags);
+}
+
+void intel_dmc_wl_enable(struct drm_i915_private *i915)
+{
+	struct intel_dmc_wl *wl = &i915->display.wl;
+	unsigned long flags;
+
+	spin_lock_irqsave(&wl->lock, flags);
+
+	if (wl->enabled)
+		goto out_unlock;
+
+	INIT_DELAYED_WORK(&wl->work, intel_dmc_wl_work);
+
+	/*
+	 * Enable wakelock in DMC.  We shouldn't try to take the
+	 * wakelock, because we're just enabling it, so call the
+	 * non-locking version directly here.
+	 */
+	__intel_de_rmw_nowl(i915, DMC_WAKELOCK_CFG, 0, DMC_WAKELOCK_CFG_ENABLE);
+
+	wl->enabled = true;
+
+out_unlock:
+	spin_unlock_irqrestore(&wl->lock, flags);
+	return;
+}
+
+void intel_dmc_wl_disable(struct drm_i915_private *i915)
+{
+	struct intel_dmc_wl *wl = &i915->display.wl;
+	unsigned long flags;
+
+	spin_lock_irqsave(&wl->lock, flags);
+
+	/* FIXME: should we cancel the work? */
+
+	if (!wl->enabled)
+		goto out_unlock;
+
+	drm_info(&i915->drm, "DMC_WAKELOCK_CFG refcount %d\n",
+		 refcount_read(&wl->refcount));
+
+	/* Disable wakelock in DMC */
+	__intel_de_rmw_nowl(i915, DMC_WAKELOCK_CFG, DMC_WAKELOCK_CFG_ENABLE, 0);
+
+	drm_info(&i915->drm, "DMC_WAKELOCK_CFG read 0x%0x\n",
+		 intel_de_read(i915, DMC_WAKELOCK_CFG));
+
+	refcount_set(&wl->refcount, 0);
+	wl->enabled = false;
+
+out_unlock:
+	spin_unlock_irqrestore(&wl->lock, flags);
+	return;
+}
+
+void intel_dmc_wl_get(struct drm_i915_private *i915, i915_reg_t reg)
+{
+	struct intel_dmc_wl *wl = &i915->display.wl;
+	unsigned long flags;
+	u32 ctl_value;
+
+	if (!intel_dmc_wl_check_range(reg.reg))
+		return;
+
+	spin_lock_irqsave(&wl->lock, flags);
+
+	if (!wl->enabled)
+		goto out_unlock;
+
+	if (refcount_inc_not_zero(&wl->refcount))
+		goto out_unlock;
+
+	refcount_set(&wl->refcount, 1);
+
+	ctl_value = __intel_de_rmw_nowl(i915, DMC_WAKELOCK1_CTL, 0,
+					DMC_WAKELOCK_CTL_REQ);
+
+	__intel_wait_for_register_nowl(i915,  DMC_WAKELOCK1_CTL,
+				       DMC_WAKELOCK_CTL_ACK,
+				       DMC_WAKELOCK_CTL_ACK,
+				       DMC_WAKELOCK_CTL_TIMEOUT);
+
+
+out_unlock:
+	spin_unlock_irqrestore(&wl->lock, flags);
+}
+
+void intel_dmc_wl_put(struct drm_i915_private *i915, i915_reg_t reg)
+{
+	struct intel_dmc_wl *wl = &i915->display.wl;
+	unsigned long flags;
+
+	if (!intel_dmc_wl_check_range(reg.reg))
+		return;
+
+	spin_lock_irqsave(&wl->lock, flags);
+
+	if (!wl->enabled || !refcount_read(&wl->refcount))
+		goto out_unlock;
+
+	if (refcount_dec_and_test(&wl->refcount)) {
+		__intel_dmc_wl_release(i915);
+
+		goto out_unlock;
+	}
+
+out_unlock:
+	spin_unlock_irqrestore(&wl->lock, flags);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.h b/drivers/gpu/drm/i915/display/intel_dmc_wl.h
new file mode 100644
index 000000000000..3de6c8dc1c19
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.h
@@ -0,0 +1,35 @@
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
+struct intel_dmc_wl {
+	spinlock_t lock;
+	bool enabled;
+	refcount_t refcount;
+	struct delayed_work work;
+};
+
+struct intel_dmc_wl_range {
+	u32 start;
+	u32 end;
+};
+
+void intel_dmc_wl_init(struct drm_i915_private *i915);
+void intel_dmc_wl_enable(struct drm_i915_private *i915);
+void intel_dmc_wl_disable(struct drm_i915_private *i915);
+void intel_dmc_wl_get(struct drm_i915_private *i915, i915_reg_t reg);
+void intel_dmc_wl_put(struct drm_i915_private *i915, i915_reg_t reg);
+
+#endif /* __INTEL_WAKELOCK_H__ */
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a38849acc9fe..474ce58b5e3c 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -281,6 +281,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_vdsc.o \
 	i915-display/intel_vga.o \
 	i915-display/intel_vrr.o \
+	i915-display/intel_dmc_wl.o \
 	i915-display/intel_wm.o \
 	i915-display/skl_scaler.o \
 	i915-display/skl_universal_plane.o \
-- 
2.39.2

