Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9FAE6BF0D
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 13:45:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6451F10E9F2;
	Fri, 30 Jan 2026 13:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lPdG05xs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF2E10E9E9;
 Fri, 30 Jan 2026 13:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769780744; x=1801316744;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mS7hH7MRDRBY1MjYz32KpV4yQppxZpVhhInj9VPI/n0=;
 b=lPdG05xsBAMHuGXJwv7ap8o/B/owLeuX5kCF+cLfjr/AbmdR4rLfRJgF
 7AUwLZ4FTnLBECnauNI8nSqSAUkaOXMsSL4GBhXlYpOn1DjEThQjE731O
 TEc5kFxUlc7O3yXAVKJOePCBoiz4vsbrjNkEOArePDUbEEthOhoFD5sOC
 yyMQEHOnfQpz/e3Bfndt/iXEuVsWdMAlE+Cp8dVnDys70ABG2lyFy8qXD
 cyMFwQBEj4FR/zcys8HBoRCNExeabe8LhJsREqKPJOhuIG5UIXJhpXvzN
 a+8zTW0+U+H3P311LrZ1g6JtYdtla+3QwX0kjU4B6TunKvQvC0VyeHxqF A==;
X-CSE-ConnectionGUID: lpEMqbtRSleK4ojAvxFkvg==
X-CSE-MsgGUID: BgSEgxztQoGj0salgbCOhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74654895"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="74654895"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 05:45:43 -0800
X-CSE-ConnectionGUID: PAOMTzJUTgiqVXLX0a9I0Q==
X-CSE-MsgGUID: jJX77exXT2aD5feF+0DUvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="208451705"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa007.fm.intel.com with ESMTP; 30 Jan 2026 05:45:41 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jani.nikula@linux.intel.com,
 Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v2] drm/i915/power_well: Enable workaround for DSS clock
 gating issue
Date: Fri, 30 Jan 2026 13:45:34 +0000
Message-ID: <20260130134534.63118-1-mika.kahola@intel.com>
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

Prevent display corruption observed after restart, hotplug, or unplug
operations on Meteor Lake and newer platforms. The issue is caused by
DSS clock gating affecting DSC logic when pipe power wells are disabled.

Apply this WA by disabling DSS clock gating for the affected pipes
before turning off their power wells. This avoids DSC corruption on
external displays.

v2: Use single intel_de_rmw() (Jani)
    Switch to use drm_dbg_kms() instead of drm_printf() (Jani)
    Remove WA number from commit message (Suraj)
    rename dss_clock_gating_enable_disable() to
    dss_pipe_gating_enable_disable();

WA: 22021048059
BSpec: 690991, 666241
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 .../i915/display/intel_display_power_well.c   | 55 ++++++++++++++++++-
 .../gpu/drm/i915/display/intel_display_regs.h |  7 +++
 .../gpu/drm/i915/display/intel_display_wa.c   |  2 +
 .../gpu/drm/i915/display/intel_display_wa.h   |  1 +
 4 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index 6f9bc6f9615e..78f707b00550 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -18,6 +18,7 @@
 #include "intel_display_regs.h"
 #include "intel_display_rpm.h"
 #include "intel_display_types.h"
+#include "intel_display_wa.h"
 #include "intel_dkl_phy.h"
 #include "intel_dkl_phy_regs.h"
 #include "intel_dmc.h"
@@ -194,6 +195,48 @@ int intel_power_well_refcount(struct i915_power_well *power_well)
 	return power_well->count;
 }
 
+static u32 dss_pipe_gating_bits(u8 irq_pipe_mask)
+{
+	u32 bits = 0;
+
+	if (irq_pipe_mask & BIT(PIPE_A))
+		bits |= DSS_PIPE_A_GATING_DISABLED;
+	if (irq_pipe_mask & BIT(PIPE_B))
+		bits |= DSS_PIPE_B_GATING_DISABLED;
+	if (irq_pipe_mask & BIT(PIPE_C))
+		bits |= DSS_PIPE_C_GATING_DISABLED;
+	if (irq_pipe_mask & BIT(PIPE_D))
+		bits |= DSS_PIPE_D_GATING_DISABLED;
+
+	return bits;
+}
+
+static void dss_pipe_gating_enable_disable(struct intel_display *display,
+					   u8 irq_pipe_mask,
+					   bool disable)
+{
+	u32 bits = dss_pipe_gating_bits(irq_pipe_mask);
+	u32 clear, set;
+
+	if (!bits)
+		return;
+
+	/*
+	 * Single intel_de_rmw() for both enable/disable:
+	 *  - disable == true, set bits (disable clock gating)
+	 *  - disable == false, clear bits (re-enable clock gating)
+	 */
+	set = disable ? bits : 0;
+	clear = disable ? 0 : bits;
+
+	intel_de_rmw(display, CLKGATE_DIS_DSSDSC, clear, set);
+
+	drm_dbg_kms(display->drm,
+		    "DSS clock gating %sd for pipe_mask=0x%x (CLKGATE_DIS_DSSDSC=0x%08x)\n",
+		    str_enable_disable(!disable), irq_pipe_mask,
+		    intel_de_read(display, CLKGATE_DIS_DSSDSC));
+}
+
 /*
  * Starting with Haswell, we have a "Power Down Well" that can be turned off
  * when not needed anymore. We have 4 registers that can request the power well
@@ -203,15 +246,23 @@ int intel_power_well_refcount(struct i915_power_well *power_well)
 static void hsw_power_well_post_enable(struct intel_display *display,
 				       u8 irq_pipe_mask)
 {
-	if (irq_pipe_mask)
+	if (irq_pipe_mask) {
 		gen8_irq_power_well_post_enable(display, irq_pipe_mask);
+
+		if (intel_display_wa(display, 22021048059))
+			dss_pipe_gating_enable_disable(display, irq_pipe_mask, false);
+	}
 }
 
 static void hsw_power_well_pre_disable(struct intel_display *display,
 				       u8 irq_pipe_mask)
 {
-	if (irq_pipe_mask)
+	if (irq_pipe_mask) {
+		if (intel_display_wa(display, 22021048059))
+			dss_pipe_gating_enable_disable(display, irq_pipe_mask, true);
+
 		gen8_irq_power_well_pre_disable(display, irq_pipe_mask);
+	}
 }
 
 #define ICL_AUX_PW_TO_PHY(pw_idx)	\
diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 9e0d853f4b61..9740f32ced24 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -2211,6 +2211,13 @@
 #define   HSW_PWR_WELL_FORCE_ON			(1 << 19)
 #define HSW_PWR_WELL_CTL6			_MMIO(0x45414)
 
+/* clock gating DSS DSC disable register */
+#define CLKGATE_DIS_DSSDSC			_MMIO(0x46548)
+#define   DSS_PIPE_D_GATING_DISABLED		REG_BIT(31)
+#define   DSS_PIPE_C_GATING_DISABLED		REG_BIT(29)
+#define   DSS_PIPE_B_GATING_DISABLED		REG_BIT(27)
+#define   DSS_PIPE_A_GATING_DISABLED		REG_BIT(25)
+
 /* SKL Fuse Status */
 enum skl_power_gate {
 	SKL_PG0,
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 86a6cc45b6ab..f8e14aa34dae 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -84,6 +84,8 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 		return intel_display_needs_wa_16025573575(display);
 	case INTEL_DISPLAY_WA_22014263786:
 		return IS_DISPLAY_VERx100(display, 1100, 1400);
+	case INTEL_DISPLAY_WA_22021048059:
+		return DISPLAY_VER(display) >= 14;
 	default:
 		drm_WARN(display->drm, 1, "Missing Wa number: %s\n", name);
 		break;
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index 40f989f19df1..767420d5f406 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -34,6 +34,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_16023588340,
 	INTEL_DISPLAY_WA_16025573575,
 	INTEL_DISPLAY_WA_22014263786,
+	INTEL_DISPLAY_WA_22021048059,
 };
 
 bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa, const char *name);
-- 
2.43.0

