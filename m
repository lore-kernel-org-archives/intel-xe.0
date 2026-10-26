Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFE0606A31B
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 09:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lVseYieH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C6810ED5D;
	Mon, 26 Oct 2026 09:47:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A619910ED55;
 Mon, 26 Oct 2026 09:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793008061; x=1824544061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tvOjlOANCoI1ONXvhKL+B4xjkuWQW0S5KQRUVCGndcQ=;
 b=lVseYieHHhBB5Fp9qByN1jZmdSv+b6O4SQTnWlfNW3fPcHVdYH6DivsB
 eQYJ8WkF6l7hnDh8x1ZRhC8tiwyqOcf0emLAV6OYHIKm0vMFLElQ5MAp0
 Mi11/Lt5EOHiFQFzBRM8bOHOwSh64bXL5OGPKxwTUoocMWngFRlTi0S7v
 hngZz4QujOr2GJ8d5VJtkkMP02+8mmyDnJ2xYc3eykkw5yeLLiLcvvxTI
 HHRA73LBJa5ezT+2MfFhwY07MsAbzjFA9akzjF9QEi0m3856muTif965t
 g7BDiANIqkZlQ44kDIBhSPkmYrNnjWb/Cdfm9N8UQrphpspEHYSeXRGfJ g==;
X-CSE-ConnectionGUID: F5ymr4NhSDOniBHgXBuomw==
X-CSE-MsgGUID: 7X9+JngARnef8rI3tQAFUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1570579"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1570579"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 02:47:41 -0700
X-CSE-ConnectionGUID: O1ZOqhlPSDSpBh5tI84BdQ==
X-CSE-MsgGUID: hjiPC3PdTpy4Qfv9hTBCdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4569260"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.48])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 02:47:39 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v5 2/2] drm/i915/display: separate display and core clock
 gating
Date: Mon, 26 Oct 2026 11:46:08 +0200
Message-ID: <20261026094724.53374-3-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026094724.53374-1-luciano.coelho@intel.com>
References: <20261026094724.53374-1-luciano.coelho@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We still call intel_clock_gating_init() from display when leaving
PC8+ and after a GPU reset.  The core clock gating code then calls
back into display, so we have dependencies in both directions.

Move display and PCH clock gating into the display code and restore
the HSW/BDW GT and uncore workarounds from the device-level resume
paths instead.  Core clock gating is also handled separately when a
GPU reset affects display.

Display doesn't need the core interface anymore, so build its clock
gating implementation for Xe and remove the compatibility header.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 .../i915/display/intel_display_clock_gating.c | 13 ++++
 .../drm/i915/display/intel_display_driver.c   | 12 ++++
 .../drm/i915/display/intel_display_power.c    |  4 +-
 .../drm/i915/display/intel_display_reset.c    |  4 +-
 drivers/gpu/drm/i915/gt/intel_reset.c         |  4 ++
 drivers/gpu/drm/i915/i915_driver.c            |  6 ++
 drivers/gpu/drm/i915/i915_gem.c               |  9 ++-
 drivers/gpu/drm/i915/intel_clock_gating.c     | 70 +++++++------------
 drivers/gpu/drm/i915/intel_clock_gating.h     |  1 +
 drivers/gpu/drm/xe/Makefile                   |  1 +
 .../compat-i915-headers/intel_clock_gating.h  | 14 ----
 11 files changed, 71 insertions(+), 67 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h

diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
index 7961c0f10bb5..b0162d78d1c9 100644
--- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
+++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
@@ -11,6 +11,7 @@
 #include "intel_display_clock_gating.h"
 #include "intel_display_core.h"
 #include "intel_display_regs.h"
+#include "intel_pch.h"
 
 static void intel_display_gen9_init_clock_gating(struct intel_display *display)
 {
@@ -69,6 +70,8 @@ static void intel_display_kbl_init_clock_gating(struct intel_display *display)
 
 static void intel_display_cfl_init_clock_gating(struct intel_display *display)
 {
+	intel_pch_init_clock_gating(display);
+
 	/*
 	 * WaCompressedResourceDisplayNewHashMode:skl,kbl (and cfl, cml)
 	 * Display WA #0390: skl,kbl (and cfl, cml)
@@ -166,6 +169,8 @@ static void intel_display_bdw_init_clock_gating(struct intel_display *display)
 	intel_display_bdw_clock_gating_disable_fbcq(display);
 	intel_display_bdw_clock_gating_vblank_in_srd(display);
 	intel_display_bdw_clock_gating_kvm_notif(display);
+
+	intel_pch_init_clock_gating(display);
 }
 
 static void intel_display_hsw_init_clock_gating(struct intel_display *display)
@@ -183,6 +188,8 @@ static void intel_display_hsw_init_clock_gating(struct intel_display *display)
 		intel_de_rmw(display, CHICKEN_PIPESL_1(pipe), 0,
 			     HSW_UNMASK_VBL_TO_REGS_IN_SRD);
 	}
+
+	intel_pch_init_clock_gating(display);
 }
 
 static void intel_display_disable_trickle_feed(struct intel_display *display)
@@ -228,6 +235,8 @@ static void intel_display_ilk_init_clock_gating(struct intel_display *display)
 	intel_de_rmw(display, ILK_DISPLAY_CHICKEN2, 0, ILK_ELPIN_409_SELECT);
 
 	intel_display_disable_trickle_feed(display);
+
+	intel_pch_init_clock_gating(display);
 }
 
 static void intel_display_gen6_init_clock_gating(struct intel_display *display)
@@ -260,6 +269,8 @@ static void intel_display_gen6_init_clock_gating(struct intel_display *display)
 		       ILK_DPFDUNIT_CLOCK_GATE_ENABLE);
 
 	intel_display_disable_trickle_feed(display);
+
+	intel_pch_init_clock_gating(display);
 }
 
 static void intel_display_ivb_init_clock_gating(struct intel_display *display)
@@ -268,6 +279,8 @@ static void intel_display_ivb_init_clock_gating(struct intel_display *display)
 	intel_de_rmw(display, ILK_DISPLAY_CHICKEN1, 0, ILK_FBCQ_DIS);
 
 	intel_display_disable_trickle_feed(display);
+
+	intel_pch_init_clock_gating(display);
 }
 
 static void intel_display_g4x_init_clock_gating(struct intel_display *display)
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 77009dca7d0d..87571b1f03a0 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -29,6 +29,7 @@
 #include "intel_crtc.h"
 #include "intel_cursor.h"
 #include "intel_dbuf_bw.h"
+#include "intel_display_clock_gating.h"
 #include "intel_display_core.h"
 #include "intel_display_debugfs.h"
 #include "intel_display_driver.h"
@@ -462,6 +463,15 @@ int intel_display_driver_probe_nogem(struct intel_display *display)
 {
 	int ret;
 
+	/*
+	 * Apply the display and PCH clock gating workarounds before gem/GT
+	 * init starts pushing memory traffic through the GT, matching the
+	 * timing the old core intel_clock_gating_init() hooks used to
+	 * provide.  Do this before the HAS_DISPLAY() check below, since the
+	 * core hooks used to call it unconditionally.
+	 */
+	intel_display_init_clock_gating(display);
+
 	if (!HAS_DISPLAY(display))
 		return 0;
 
@@ -839,6 +849,8 @@ void intel_display_driver_pm_resume(struct intel_display *display)
 	struct drm_modeset_acquire_ctx ctx;
 	int ret;
 
+	intel_display_init_clock_gating(display);
+
 	if (!HAS_DISPLAY(display))
 		return;
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 1b60ce2dd00c..1ec0890f2afb 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -13,11 +13,11 @@
 #include "intel_alpm.h"
 #include "intel_backlight_regs.h"
 #include "intel_cdclk.h"
-#include "intel_clock_gating.h"
 #include "intel_combo_phy.h"
 #include "intel_crtc.h"
 #include "intel_de.h"
 #include "intel_display.h"
+#include "intel_display_clock_gating.h"
 #include "intel_display_power.h"
 #include "intel_display_power_map.h"
 #include "intel_display_power_well.h"
@@ -1597,7 +1597,7 @@ static void hsw_disable_pc8(struct intel_display *display)
 	intel_init_pch_refclk(display);
 
 	/* Many display registers don't survive PC8+ */
-	intel_clock_gating_init(display->drm);
+	intel_display_init_clock_gating(display);
 }
 
 static void intel_pch_reset_handshake(struct intel_display *display,
diff --git a/drivers/gpu/drm/i915/display/intel_display_reset.c b/drivers/gpu/drm/i915/display/intel_display_reset.c
index 504ec7043cd9..a39ab2cc638b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reset.c
+++ b/drivers/gpu/drm/i915/display/intel_display_reset.c
@@ -8,8 +8,8 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_print.h>
 
-#include "intel_clock_gating.h"
 #include "intel_cx0_phy.h"
+#include "intel_display_clock_gating.h"
 #include "intel_display_core.h"
 #include "intel_display_driver.h"
 #include "intel_display_reset.h"
@@ -99,7 +99,7 @@ void intel_display_reset_finish(struct intel_display *display, bool test_only)
 		 */
 		intel_pps_unlock_regs_wa(display);
 		intel_display_driver_init_hw(display);
-		intel_clock_gating_init(display->drm);
+		intel_display_init_clock_gating(display);
 		intel_cx0_pll_power_save_wa(display);
 		intel_hpd_init(display);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index bd1f26336ac4..e3d5d36a1f41 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -24,6 +24,7 @@
 #include "i915_reg.h"
 #include "i915_wait_util.h"
 #include "intel_breadcrumbs.h"
+#include "intel_clock_gating.h"
 #include "intel_engine_pm.h"
 #include "intel_engine_regs.h"
 #include "intel_gt.h"
@@ -1439,6 +1440,9 @@ static void intel_gt_reset_global(struct intel_gt *gt,
 
 		intel_gt_reset(gt, engine_mask, reason);
 
+		if (need_display_reset)
+			intel_clock_gating_init(&i915->drm);
+
 		if (reset_display)
 			intel_display_reset_finish(display, !need_display_reset);
 	}
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 9e047c27a153..40df577cacb4 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1285,6 +1285,8 @@ static int i915_drm_resume_early(struct drm_device *dev)
 
 	intel_display_driver_pm_resume_early(display);
 
+	intel_clock_gating_resume(&dev_priv->drm);
+
 	enable_rpm_wakeref_asserts(&dev_priv->runtime_pm);
 
 	return ret;
@@ -1528,6 +1530,8 @@ static int i915_pm_runtime_suspend(struct device *kdev)
 
 		intel_irq_resume(dev_priv);
 
+		intel_clock_gating_resume(&dev_priv->drm);
+
 		for_each_gt(gt, dev_priv, i)
 			intel_gt_runtime_resume(gt);
 
@@ -1595,6 +1599,8 @@ static int i915_pm_runtime_resume(struct device *kdev)
 
 	intel_irq_resume(dev_priv);
 
+	intel_clock_gating_resume(&dev_priv->drm);
+
 	/*
 	 * No point of rolling back things in case of an error, as the best
 	 * we can do is to hope that things will still work (and disable RPM).
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 1209d5f1fc8d..b746ca66f49c 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1176,11 +1176,10 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
 	}
 
 	/*
-	 * Despite its name intel_clock_gating_init applies both display
-	 * clock gating workarounds; GT mmio workarounds and the occasional
-	 * GT power context workaround. Worse, sometimes it includes a context
-	 * register workaround which we need to apply before we record the
-	 * default HW state for all contexts.
+	 * Despite its name intel_clock_gating_init applies GT MMIO workarounds
+	 * and the occasional GT power context workaround. Worse, sometimes it
+	 * includes a context register workaround which we need to apply before
+	 * we record the default HW state for all contexts.
 	 *
 	 * FIXME: break up the workarounds and apply them at the right time!
 	 */
diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index 6faf29c8d887..bd3cca81f602 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
@@ -30,8 +30,6 @@
 #include <drm/intel/intel_gmd_misc_regs.h>
 #include <drm/intel/mchbar_regs.h>
 
-#include "display/intel_display_clock_gating.h"
-#include "display/intel_pch.h"
 #include "gt/intel_engine_regs.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_mcr.h"
@@ -56,13 +54,6 @@ static void bxt_init_clock_gating(struct drm_i915_private *i915)
 	 * GEN8_HDCUNIT_CLOCK_GATE_DISABLE_HDCREQ applies on 3x6 GT SKUs only.
 	 */
 	intel_uncore_rmw(&i915->uncore, GEN8_UCGCTL6, 0, GEN8_HDCUNIT_CLOCK_GATE_DISABLE_HDCREQ);
-
-	intel_display_init_clock_gating(i915->display);
-}
-
-static void glk_init_clock_gating(struct drm_i915_private *i915)
-{
-	intel_display_init_clock_gating(i915->display);
 }
 
 static void ilk_init_clock_gating(struct drm_i915_private *i915)
@@ -72,9 +63,6 @@ static void ilk_init_clock_gating(struct drm_i915_private *i915)
 			   SVSMUNIT_CLOCK_GATE_DISABLE);
 	intel_uncore_write(&i915->uncore, PCH_3DCGDIS1,
 			   VFMUNIT_CLOCK_GATE_DISABLE);
-
-	intel_display_init_clock_gating(i915->display);
-	intel_pch_init_clock_gating(i915->display);
 }
 
 static void gen6_check_mch_setup(struct drm_i915_private *i915)
@@ -90,8 +78,6 @@ static void gen6_check_mch_setup(struct drm_i915_private *i915)
 
 static void gen6_init_clock_gating(struct drm_i915_private *i915)
 {
-	intel_display_init_clock_gating(i915->display);
-
 	intel_uncore_write(&i915->uncore, GEN6_UCGCTL1,
 			   intel_uncore_read(&i915->uncore, GEN6_UCGCTL1) |
 			   GEN6_BLBUNIT_CLOCK_GATE_DISABLE |
@@ -114,8 +100,6 @@ static void gen6_init_clock_gating(struct drm_i915_private *i915)
 			   GEN6_RCPBUNIT_CLOCK_GATE_DISABLE |
 			   GEN6_RCCUNIT_CLOCK_GATE_DISABLE);
 
-	intel_pch_init_clock_gating(i915->display);
-
 	gen6_check_mch_setup(i915);
 }
 
@@ -154,12 +138,8 @@ static void dg2_init_clock_gating(struct drm_i915_private *i915)
 
 static void cfl_init_clock_gating(struct drm_i915_private *i915)
 {
-	intel_pch_init_clock_gating(i915->display);
-
 	/* WAC6entrylatency:cfl */
 	intel_uncore_rmw(&i915->uncore, FBC_LLC_READ_CTRL, 0, FBC_LLC_FULLY_OPEN);
-
-	intel_display_init_clock_gating(i915->display);
 }
 
 static void kbl_init_clock_gating(struct drm_i915_private *i915)
@@ -176,8 +156,6 @@ static void kbl_init_clock_gating(struct drm_i915_private *i915)
 	if (IS_KABYLAKE(i915) && IS_GRAPHICS_STEP(i915, 0, STEP_C0))
 		intel_uncore_rmw(&i915->uncore, GEN6_UCGCTL1,
 				 0, GEN6_GAMUNIT_CLOCK_GATE_DISABLE);
-
-	intel_display_init_clock_gating(i915->display);
 }
 
 static void skl_init_clock_gating(struct drm_i915_private *i915)
@@ -188,14 +166,10 @@ static void skl_init_clock_gating(struct drm_i915_private *i915)
 
 	/* WAC6entrylatency:skl */
 	intel_uncore_rmw(&i915->uncore, FBC_LLC_READ_CTRL, 0, FBC_LLC_FULLY_OPEN);
-
-	intel_display_init_clock_gating(i915->display);
 }
 
 static void bdw_init_clock_gating(struct drm_i915_private *i915)
 {
-	intel_display_init_clock_gating(i915->display);
-
 	/* WaSwitchSolVfFArbitrationPriority:bdw */
 	intel_uncore_rmw(&i915->uncore, GAM_ECOCHK, 0, HSW_ECOCHK_ARB_PRIO_SOL);
 
@@ -213,8 +187,6 @@ static void bdw_init_clock_gating(struct drm_i915_private *i915)
 	/* WaProgramL3SqcReg1Default:bdw */
 	gen8_set_l3sqc_credits(i915, 30, 2);
 
-	intel_pch_init_clock_gating(i915->display);
-
 	/* WaDisableDopClockGating:bdw
 	 *
 	 * Also see the CHICKEN2 write in bdw_init_workarounds() to disable DOP
@@ -225,24 +197,16 @@ static void bdw_init_clock_gating(struct drm_i915_private *i915)
 
 static void hsw_init_clock_gating(struct drm_i915_private *i915)
 {
-	intel_display_init_clock_gating(i915->display);
-
 	/* This is required by WaCatErrorRejectionIssue:hsw */
 	intel_uncore_rmw(&i915->uncore, GEN7_SQ_CHICKEN_MBCUNIT_CONFIG,
 			 0, GEN7_SQ_CHICKEN_MBCUNIT_SQINTMOB);
 
 	/* WaSwitchSolVfFArbitrationPriority:hsw */
 	intel_uncore_rmw(&i915->uncore, GAM_ECOCHK, 0, HSW_ECOCHK_ARB_PRIO_SOL);
-
-	intel_pch_init_clock_gating(i915->display);
 }
 
 static void ivb_init_clock_gating(struct drm_i915_private *i915)
 {
-	struct intel_display *display = i915->display;
-
-	intel_display_init_clock_gating(display);
-
 	/* WaDisableBackToBackFlipFix:ivb */
 	intel_uncore_write(&i915->uncore, IVB_CHICKEN3,
 			   CHICKEN3_DGMG_REQ_OUT_FIX_DISABLE |
@@ -273,8 +237,6 @@ static void ivb_init_clock_gating(struct drm_i915_private *i915)
 	intel_uncore_rmw(&i915->uncore, GEN6_MBCUNIT_SNPCR, GEN6_MBC_SNPCR_MASK,
 			 GEN6_MBC_SNPCR_MED);
 
-	intel_pch_init_clock_gating(display);
-
 	gen6_check_mch_setup(i915);
 }
 
@@ -345,7 +307,6 @@ static void g4x_init_clock_gating(struct drm_i915_private *i915)
 			   GS_UNIT_CLOCK_GATE_DISABLE |
 			   CL_UNIT_CLOCK_GATE_DISABLE);
 	intel_uncore_write(&i915->uncore, RAMCLK_GATE_D, 0);
-	intel_display_init_clock_gating(i915->display);
 }
 
 static void i965gm_init_clock_gating(struct drm_i915_private *i915)
@@ -354,7 +315,6 @@ static void i965gm_init_clock_gating(struct drm_i915_private *i915)
 
 	intel_uncore_write(uncore, RENCLK_GATE_D1, I965_RCC_CLOCK_GATE_DISABLE);
 	intel_uncore_write(uncore, RENCLK_GATE_D2, 0);
-	intel_display_init_clock_gating(i915->display);
 	intel_uncore_write(uncore, RAMCLK_GATE_D, 0);
 	intel_uncore_write16(uncore, DEUC, 0);
 	intel_uncore_write(uncore,
@@ -437,6 +397,31 @@ void intel_clock_gating_init(struct drm_device *drm)
 	i915->clock_gating_funcs->init_clock_gating(i915);
 }
 
+/**
+ * intel_clock_gating_resume - restore GT/uncore clock gating after PC8+
+ * @drm: the &struct drm_device
+ *
+ * Some HSW/BDW GT and uncore clock gating workarounds, including BDW's
+ * gen8_set_l3sqc_credits(), don't survive PC8+ and need to be reapplied
+ * once we're out of it.  This duplicates the display->platform.haswell ||
+ * display->platform.broadwell check that gates the hsw_disable_pc8() call
+ * on the display side, since core code can't reuse that check directly.
+ *
+ * The caller must call this after display has left PC8+ and restored
+ * LCPLL, but before GT execution resumes, since gen8_set_l3sqc_credits()
+ * needs the core clock running to access GEN8_L3SQCREG1 via the MCR.
+ * i915_driver.c is the only place that can see both sides of this, so
+ * it's the one enforcing the order, from i915_drm_resume_early(),
+ * i915_pm_runtime_suspend() and i915_pm_runtime_resume().
+ */
+void intel_clock_gating_resume(struct drm_device *drm)
+{
+	struct drm_i915_private *i915 = to_i915(drm);
+
+	if (IS_HASWELL(i915) || IS_BROADWELL(i915))
+		intel_clock_gating_init(drm);
+}
+
 static void nop_init_clock_gating(struct drm_i915_private *i915)
 {
 	drm_dbg_kms(&i915->drm,
@@ -453,7 +438,6 @@ CG_FUNCS(cfl);
 CG_FUNCS(skl);
 CG_FUNCS(kbl);
 CG_FUNCS(bxt);
-CG_FUNCS(glk);
 CG_FUNCS(bdw);
 CG_FUNCS(chv);
 CG_FUNCS(hsw);
@@ -475,7 +459,7 @@ CG_FUNCS(nop);
  * @drm: drm device
  *
  * Setup the hooks that configure which clocks of a given platform can be
- * gated and also apply various GT and display specific workarounds for these
+ * gated and also apply various GT and uncore workarounds for these
  * platforms. Note that some GT specific workarounds are applied separately
  * when GPU contexts or batchbuffers start their execution.
  */
@@ -493,8 +477,6 @@ void intel_clock_gating_hooks_init(struct drm_device *drm)
 		i915->clock_gating_funcs = &kbl_clock_gating_funcs;
 	else if (IS_BROXTON(i915))
 		i915->clock_gating_funcs = &bxt_clock_gating_funcs;
-	else if (IS_GEMINILAKE(i915))
-		i915->clock_gating_funcs = &glk_clock_gating_funcs;
 	else if (IS_BROADWELL(i915))
 		i915->clock_gating_funcs = &bdw_clock_gating_funcs;
 	else if (IS_CHERRYVIEW(i915))
diff --git a/drivers/gpu/drm/i915/intel_clock_gating.h b/drivers/gpu/drm/i915/intel_clock_gating.h
index 3a4b443d9b8b..cf059bac88d4 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.h
+++ b/drivers/gpu/drm/i915/intel_clock_gating.h
@@ -9,6 +9,7 @@
 struct drm_device;
 
 void intel_clock_gating_init(struct drm_device *drm);
+void intel_clock_gating_resume(struct drm_device *drm);
 void intel_clock_gating_hooks_init(struct drm_device *drm);
 
 #endif /* __INTEL_CLOCK_GATING_H__ */
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 6fb916f1699b..a8476e2e8d54 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -264,6 +264,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_de.o \
 	i915-display/intel_dip.o \
 	i915-display/intel_display.o \
+	i915-display/intel_display_clock_gating.o \
 	i915-display/intel_display_conversion.o \
 	i915-display/intel_display_device.o \
 	i915-display/intel_display_driver.o \
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h
deleted file mode 100644
index 552975a30ba2..000000000000
--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2023 Intel Corporation
- */
-
-#ifndef __INTEL_CLOCK_GATING_H__
-#define __INTEL_CLOCK_GATING_H__
-
-struct drm_device;
-
-static inline void intel_clock_gating_init(struct drm_device *drm) {}
-static inline void intel_clock_gating_hooks_init(struct drm_device *drm) {}
-
-#endif /* __INTEL_CLOCK_GATING_H__ */
-- 
2.53.0

