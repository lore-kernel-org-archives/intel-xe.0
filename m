Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B47C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 09:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A5510EAC4;
	Tue,  8 Sep 2026 09:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gcdv3+eA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3450D10EAC4;
 Tue,  8 Sep 2026 09:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788858585; x=1820394585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1dQHmGzgIX5Sm76l3AnEA8MGw0gVZwv9+Q1wSk7d0hw=;
 b=gcdv3+eA3S+oVY5WHGoPEjzg9pXwXEFtZTEDPyfL6Z9SqrbCHmdONig4
 xEIT7aMDOvZlY9L3rIxmj3CMo1lIf5dUqlLCCro+EXhPdAs0N9JnjYIR/
 f6fO4zIxy6CmTqBJJHOL1aeSd1PXs3HdMLkwvF4lgqGgu+H+COdRZvs1E
 u7/sQsBN+OeSBNK4MRVIdmOQCQPjeWEXyotw2MnoUQqcm/gnD3Pe7rPbA
 EjiwT9URk/ODYXBRR/GYhMbGOBJq4VnfgtcsS4+WgUJPBEixNW4jO3U3I
 /MG2n+YCKmTQ/go0bh3wq9EkQAxU136lu8l/qEYvrNuveZndRLkO5HY8K A==;
X-CSE-ConnectionGUID: fMKcUQ6zRei46Sqbkp5ZbA==
X-CSE-MsgGUID: TnMp5zD/QAiKO7MLqt8D1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89285083"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="89285083"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 02:09:44 -0700
X-CSE-ConnectionGUID: k8dqfKPhR1OB2Efajbg8Ag==
X-CSE-MsgGUID: D5VMiDzHTd2ARUtvRabz4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="267690308"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.144])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 02:09:42 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v4 1/2] drm/i915/display: add a way to restore only
 display/pch registers in clock_gating
Date: Tue,  8 Sep 2026 11:43:02 +0300
Message-ID: <20260908090924.52117-2-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908090924.52117-1-luciano.coelho@intel.com>
References: <20260908090924.52117-1-luciano.coelho@intel.com>
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

Currently, hsw_disable_pc8() calls intel_clock_gating_init() to restore
clock gating after PC8+ exit.  This makes display call into core i915
initialization, which in turn calls back into display code.

Add intel_display_restore_clock_gating() to restore display and PCH
registers directly.  Split out the HSW/BDW GT/uncore programming and
restore it through the display parent interface, preserving the
existing workarounds without calling core clock gating initialization
from display.

Assisted-by: Copilot:claude-sonnet-5
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 .../i915/display/intel_display_clock_gating.c |  7 ++++
 .../i915/display/intel_display_clock_gating.h |  1 +
 .../drm/i915/display/intel_display_power.c    |  7 +++-
 drivers/gpu/drm/i915/display/intel_parent.c   |  9 +++++
 drivers/gpu/drm/i915/display/intel_parent.h   |  3 ++
 drivers/gpu/drm/i915/i915_driver.c            |  1 +
 drivers/gpu/drm/i915/intel_clock_gating.c     | 37 ++++++++++++++++---
 drivers/gpu/drm/i915/intel_clock_gating.h     |  2 +
 drivers/gpu/drm/xe/Makefile                   |  1 +
 include/drm/intel/display_parent_interface.h  |  7 ++++
 10 files changed, 67 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
index ef1ee72494df..6716c377ef93 100644
--- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
+++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
@@ -11,6 +11,7 @@
 #include "intel_display_clock_gating.h"
 #include "intel_display_core.h"
 #include "intel_display_regs.h"
+#include "intel_pch.h"
 
 static void intel_display_gen9_init_clock_gating(struct intel_display *display)
 {
@@ -305,3 +306,9 @@ void intel_display_init_clock_gating(struct intel_display *display)
 	else if (display->platform.i965gm)
 		intel_display_i965gm_init_clock_gating(display);
 }
+
+void intel_display_restore_clock_gating(struct intel_display *display)
+{
+	intel_display_init_clock_gating(display);
+	intel_pch_init_clock_gating(display);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
index dbfa5892cffe..074708a22436 100644
--- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
+++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
@@ -9,5 +9,6 @@
 struct intel_display;
 
 void intel_display_init_clock_gating(struct intel_display *display);
+void intel_display_restore_clock_gating(struct intel_display *display);
 
 #endif /* __INTEL_DISPLAY_CLOCK_GATING_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 0ebec6e0c240..6e38cabc5581 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -12,7 +12,7 @@
 
 #include "intel_backlight_regs.h"
 #include "intel_cdclk.h"
-#include "intel_clock_gating.h"
+#include "intel_display_clock_gating.h"
 #include "intel_combo_phy.h"
 #include "intel_crtc.h"
 #include "intel_de.h"
@@ -1588,7 +1588,10 @@ static void hsw_disable_pc8(struct intel_display *display)
 	intel_init_pch_refclk(display);
 
 	/* Many display registers don't survive PC8+ */
-	intel_clock_gating_init(display->drm);
+	intel_display_restore_clock_gating(display);
+
+	/* Some GT/uncore clock gating workarounds don't survive PC8+ either */
+	intel_parent_clock_gating_restore_gt(display);
 }
 
 static void intel_pch_reset_handshake(struct intel_display *display,
diff --git a/drivers/gpu/drm/i915/display/intel_parent.c b/drivers/gpu/drm/i915/display/intel_parent.c
index 99cebb17763a..d8c38f138396 100644
--- a/drivers/gpu/drm/i915/display/intel_parent.c
+++ b/drivers/gpu/drm/i915/display/intel_parent.c
@@ -24,6 +24,15 @@
 #include "intel_display_core.h"
 #include "intel_parent.h"
 
+/* clock_gating */
+void intel_parent_clock_gating_restore_gt(struct intel_display *display)
+{
+	if (drm_WARN_ON_ONCE(display->drm, !display->parent->clock_gating))
+		return;
+
+	display->parent->clock_gating->restore_gt(display->drm);
+}
+
 /* dpt */
 struct intel_dpt *intel_parent_dpt_create(struct intel_display *display,
 					  struct drm_gem_object *obj, size_t size)
diff --git a/drivers/gpu/drm/i915/display/intel_parent.h b/drivers/gpu/drm/i915/display/intel_parent.h
index cc4a58f63166..db2272ad9be3 100644
--- a/drivers/gpu/drm/i915/display/intel_parent.h
+++ b/drivers/gpu/drm/i915/display/intel_parent.h
@@ -22,6 +22,9 @@ struct intel_panic;
 struct intel_stolen_node;
 struct iosys_map;
 
+/* clock_gating */
+void intel_parent_clock_gating_restore_gt(struct intel_display *display);
+
 /* dpt */
 struct intel_dpt *intel_parent_dpt_create(struct intel_display *display,
 					  struct drm_gem_object *obj, size_t size);
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index ce6d20958320..8da72cef63c9 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -745,6 +745,7 @@ static bool vgpu_active(struct drm_device *drm)
 
 static const struct intel_display_parent_interface parent = {
 	.bo = &i915_display_bo_interface,
+	.clock_gating = &i915_display_clock_gating_interface,
 	.dpt = &i915_display_dpt_interface,
 	.dsb = &i915_display_dsb_interface,
 	.fb_pin = &i915_display_fb_pin_interface,
diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index c5c4441f3a61..180cb5862016 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
@@ -26,6 +26,7 @@
  */
 
 #include <drm/drm_print.h>
+#include <drm/intel/display_parent_interface.h>
 #include <drm/intel/intel_gmd_interrupt_regs.h>
 #include <drm/intel/intel_gmd_misc_regs.h>
 #include <drm/intel/mchbar_regs.h>
@@ -203,10 +204,8 @@ static void skl_init_clock_gating(struct drm_i915_private *i915)
 	intel_display_init_clock_gating(i915->display);
 }
 
-static void bdw_init_clock_gating(struct drm_i915_private *i915)
+static void bdw_restore_gt_clock_gating(struct drm_i915_private *i915)
 {
-	intel_display_init_clock_gating(i915->display);
-
 	/* WaSwitchSolVfFArbitrationPriority:bdw */
 	intel_uncore_rmw(&i915->uncore, GAM_ECOCHK, 0, HSW_ECOCHK_ARB_PRIO_SOL);
 
@@ -224,8 +223,6 @@ static void bdw_init_clock_gating(struct drm_i915_private *i915)
 	/* WaProgramL3SqcReg1Default:bdw */
 	gen8_set_l3sqc_credits(i915, 30, 2);
 
-	intel_pch_init_clock_gating(i915->display);
-
 	/* WaDisableDopClockGating:bdw
 	 *
 	 * Also see the CHICKEN2 write in bdw_init_workarounds() to disable DOP
@@ -234,16 +231,30 @@ static void bdw_init_clock_gating(struct drm_i915_private *i915)
 	intel_uncore_rmw(&i915->uncore, GEN6_UCGCTL1, 0, GEN6_EU_TCUNIT_CLOCK_GATE_DISABLE);
 }
 
-static void hsw_init_clock_gating(struct drm_i915_private *i915)
+static void bdw_init_clock_gating(struct drm_i915_private *i915)
 {
 	intel_display_init_clock_gating(i915->display);
 
+	bdw_restore_gt_clock_gating(i915);
+
+	intel_pch_init_clock_gating(i915->display);
+}
+
+static void hsw_restore_gt_clock_gating(struct drm_i915_private *i915)
+{
 	/* This is required by WaCatErrorRejectionIssue:hsw */
 	intel_uncore_rmw(&i915->uncore, GEN7_SQ_CHICKEN_MBCUNIT_CONFIG,
 			 0, GEN7_SQ_CHICKEN_MBCUNIT_SQINTMOB);
 
 	/* WaSwitchSolVfFArbitrationPriority:hsw */
 	intel_uncore_rmw(&i915->uncore, GAM_ECOCHK, 0, HSW_ECOCHK_ARB_PRIO_SOL);
+}
+
+static void hsw_init_clock_gating(struct drm_i915_private *i915)
+{
+	intel_display_init_clock_gating(i915->display);
+
+	hsw_restore_gt_clock_gating(i915);
 
 	intel_pch_init_clock_gating(i915->display);
 }
@@ -448,6 +459,20 @@ void intel_clock_gating_init(struct drm_device *drm)
 	i915->clock_gating_funcs->init_clock_gating(i915);
 }
 
+static void intel_clock_gating_restore_gt(struct drm_device *drm)
+{
+	struct drm_i915_private *i915 = to_i915(drm);
+
+	if (IS_BROADWELL(i915))
+		bdw_restore_gt_clock_gating(i915);
+	else if (IS_HASWELL(i915))
+		hsw_restore_gt_clock_gating(i915);
+}
+
+const struct intel_display_clock_gating_interface i915_display_clock_gating_interface = {
+	.restore_gt = intel_clock_gating_restore_gt,
+};
+
 static void nop_init_clock_gating(struct drm_i915_private *i915)
 {
 	drm_dbg_kms(&i915->drm,
diff --git a/drivers/gpu/drm/i915/intel_clock_gating.h b/drivers/gpu/drm/i915/intel_clock_gating.h
index 3a4b443d9b8b..5c0f7c91c4f7 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.h
+++ b/drivers/gpu/drm/i915/intel_clock_gating.h
@@ -11,4 +11,6 @@ struct drm_device;
 void intel_clock_gating_init(struct drm_device *drm);
 void intel_clock_gating_hooks_init(struct drm_device *drm);
 
+extern const struct intel_display_clock_gating_interface i915_display_clock_gating_interface;
+
 #endif /* __INTEL_CLOCK_GATING_H__ */
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 67b8b5477639..7737fb27b259 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -260,6 +260,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_ddi_buf_trans.o \
 	i915-display/intel_de.o \
 	i915-display/intel_display.o \
+	i915-display/intel_display_clock_gating.o \
 	i915-display/intel_display_conversion.o \
 	i915-display/intel_display_device.o \
 	i915-display/intel_display_driver.o \
diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
index 5e44c022d1ae..c6638c108009 100644
--- a/include/drm/intel/display_parent_interface.h
+++ b/include/drm/intel/display_parent_interface.h
@@ -65,6 +65,10 @@ struct intel_display_bo_interface {
 #endif
 };
 
+struct intel_display_clock_gating_interface {
+	void (*restore_gt)(struct drm_device *drm);
+};
+
 struct intel_display_dpt_interface {
 	struct intel_dpt *(*create)(struct drm_gem_object *obj, size_t size);
 	void (*destroy)(struct intel_dpt *dpt);
@@ -250,6 +254,9 @@ struct intel_display_parent_interface {
 	/** @bo: BO interface */
 	const struct intel_display_bo_interface *bo;
 
+	/** @clock_gating: Clock gating interface. Optional. */
+	const struct intel_display_clock_gating_interface *clock_gating;
+
 	/** @dpt: DPT interface. Optional. */
 	const struct intel_display_dpt_interface *dpt;
 
-- 
2.53.0

