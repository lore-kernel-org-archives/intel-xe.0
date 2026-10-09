Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DC2CA601D
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 10:36:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEE1112060;
	Fri,  9 Oct 2026 10:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GXSwfszM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5CC11205C;
 Fri,  9 Oct 2026 10:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791542161; x=1823078161;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JQQ/PLB+CSyHs4f2RREW4O4+khbYz8XbZye/PTAohSY=;
 b=GXSwfszMQKccwI1aQmfytSveqVSYXfOG2BxwE2HGBbLhHSQ9ORA/mOV7
 Be73uCcWuIKKUSkFKBbksKwY5rd0D6TUSYvrTVDlVmVIs8oGU0DRV17jp
 UqO0LbDGfVPd2qAuAP2LjifyO1VEwKB7ujp7rGR0zX6Jo52j1xGi9Us7q
 4qP81msoPEGsQ6hSRtHzd72tu5OJVhIgIkXAjhkzQuHnn+Ldy2uHYM+AY
 d8a63TIfXZm0r1O4WfHO/azbQ3f9LuQRSW41X1oWuKrzBERb0qEX/ibk+
 gwqIm3RBX6OAKEz1Pmo/jnlK2OKh0k00pc8REAfP5VXBHx6mqEvc0lIZh Q==;
X-CSE-ConnectionGUID: /a5id3Q6Tsuug+ppLsUjuA==
X-CSE-MsgGUID: w5Lb22ycRDK2WjMcbFe1aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="219337"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="219337"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:36:01 -0700
X-CSE-ConnectionGUID: 3cHKhb9vSDaB1DU0Vz0rjw==
X-CSE-MsgGUID: N7A6ou70RdCk4jCY7CaTwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="399267"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa002.fm.intel.com with ESMTP; 09 Oct 2026 03:35:59 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 1/5] drm/i915/dpll: move the PLL power save W/A to the display
 W/A framework
Date: Fri,  9 Oct 2026 10:35:47 +0000
Message-ID: <20261009103552.1864818-2-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009103552.1864818-1-mika.kahola@intel.com>
References: <20261009103552.1864818-1-mika.kahola@intel.com>
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

The condition for W/A 14022081154 was open-coded as a DISPLAY_VER()
check in intel_cx0_pll_power_save_wa(), which also walked the encoders
itself. Neither is specific to the C10 PHY.

Add intel_dpll_power_save_wa(), holding the W/A condition as
INTEL_DISPLAY_WA_14022081154 and the encoder walk, and leave
intel_cx0_pll_power_save_wa() with only the C10 PHY sequence for a
single encoder.

The spec lists the W/A for PTL+, so use DISPLAY_VER() >= 30 instead of
the == 30 the code had. No functional change: the sequence is C10 PHY
specific and intel_encoder_is_c10phy() is never true on display ver 35.

While at it, let the drm_WARN_ON() on the table lookup check the return
value.

BSpec: 74151
Assisted-by: Copilot:claude-opus-5
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.c  | 60 +++++++------------
 drivers/gpu/drm/i915/display/intel_cx0_phy.h  |  2 +-
 .../drm/i915/display/intel_display_reset.c    |  4 +-
 .../gpu/drm/i915/display/intel_display_wa.c   |  2 +
 .../gpu/drm/i915/display/intel_display_wa.h   |  1 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 31 +++++++++-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h |  1 +
 7 files changed, 57 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index b83f0afaa9b5..73162b3cfc1e 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -3700,54 +3700,34 @@ int intel_cx0pll_calc_port_clock(struct intel_encoder *encoder,
 
 /*
  * WA 14022081154
- * The dedicated display PHYs reset to a power state that blocks S0ix, increasing idle
- * system power. After a system reset (cold boot, S3/4/5, warm reset) if a dedicated
- * PHY is not being brought up shortly, use these steps to move the PHY to the lowest
- * power state to save power. For PTL the workaround is needed only for port A. Port B
- * is not connected.
- *
- * 1. Follow the PLL Enable Sequence, using any valid frequency such as DP 1.62 GHz.
- *    This brings lanes out of reset and enables the PLL to allow powerdown to be moved
- *    to the Disable state.
- * 2. Follow PLL Disable Sequence. This moves powerdown to the Disable state and disables the PLL.
+ * C10 PHY part of the sequence, see intel_dpll_power_save_wa().
  */
-void intel_cx0_pll_power_save_wa(struct intel_display *display)
+void intel_cx0_pll_power_save_wa(struct intel_encoder *encoder)
 {
-	struct intel_encoder *encoder;
+	struct intel_display *display = to_intel_display(encoder);
+	struct intel_cx0pll_state pll_state = {};
+	int port_clock = 162000;
+	int lane_count = 4;
+	int err;
 
-	if (DISPLAY_VER(display) != 30)
+	if (!intel_encoder_is_c10phy(encoder))
 		return;
 
-	for_each_intel_encoder(display->drm, encoder) {
-		struct intel_cx0pll_state pll_state = {};
-		int port_clock = 162000;
-		int lane_count = 4;
-
-		if (!intel_encoder_is_dig_port(encoder))
-			continue;
-
-		if (!intel_encoder_is_c10phy(encoder))
-			continue;
-
-		if (intel_cx0_pll_is_enabled(encoder))
-			continue;
+	if (intel_cx0_pll_is_enabled(encoder))
+		return;
 
-		if (intel_c10pll_calc_state_from_table(encoder,
-						       mtl_c10_edp_tables,
-						       true, port_clock, lane_count,
-						       &pll_state) < 0) {
-			drm_WARN_ON(display->drm,
-				    "Unable to calc C10 state from the tables\n");
-			continue;
-		}
+	err = intel_c10pll_calc_state_from_table(encoder, mtl_c10_edp_tables,
+						 true, port_clock, lane_count,
+						 &pll_state);
+	if (drm_WARN_ON(display->drm, err))
+		return;
 
-		drm_dbg_kms(display->drm,
-			    "[ENCODER:%d:%s] Applying power saving workaround on disabled PLL\n",
-			    encoder->base.base.id, encoder->base.name);
+	drm_dbg_kms(display->drm,
+		    "[ENCODER:%d:%s] Applying power saving workaround on disabled PLL\n",
+		    encoder->base.base.id, encoder->base.name);
 
-		intel_cx0pll_enable(encoder, &pll_state);
-		intel_cx0pll_disable(encoder);
-	}
+	intel_cx0pll_enable(encoder, &pll_state);
+	intel_cx0pll_disable(encoder);
 }
 
 static void intel_c10pll_verify_clock(struct intel_display *display,
diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.h b/drivers/gpu/drm/i915/display/intel_cx0_phy.h
index 95c20eb4b4b7..b63916bfeca7 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.h
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.h
@@ -78,7 +78,7 @@ bool intel_mtl_tbt_pll_readout_hw_state(struct intel_display *display,
 int intel_mtl_tbt_calc_port_clock(struct intel_encoder *encoder);
 
 void intel_cx0pll_verify_plls(struct intel_display *display);
-void intel_cx0_pll_power_save_wa(struct intel_display *display);
+void intel_cx0_pll_power_save_wa(struct intel_encoder *encoder);
 void intel_lnl_mac_transmit_lfps(struct intel_encoder *encoder,
 				 const struct intel_crtc_state *crtc_state);
 void intel_mtl_tbt_pll_enable(struct intel_encoder *encoder,
diff --git a/drivers/gpu/drm/i915/display/intel_display_reset.c b/drivers/gpu/drm/i915/display/intel_display_reset.c
index 504ec7043cd9..375201798413 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reset.c
+++ b/drivers/gpu/drm/i915/display/intel_display_reset.c
@@ -9,12 +9,12 @@
 #include <drm/drm_print.h>
 
 #include "intel_clock_gating.h"
-#include "intel_cx0_phy.h"
 #include "intel_display_core.h"
 #include "intel_display_driver.h"
 #include "intel_display_reset.h"
 #include "intel_display_types.h"
 #include "intel_display_utils.h"
+#include "intel_dpll_mgr.h"
 #include "intel_hotplug.h"
 #include "intel_pps.h"
 
@@ -100,7 +100,7 @@ void intel_display_reset_finish(struct intel_display *display, bool test_only)
 		intel_pps_unlock_regs_wa(display);
 		intel_display_driver_init_hw(display);
 		intel_clock_gating_init(display->drm);
-		intel_cx0_pll_power_save_wa(display);
+		intel_dpll_power_save_wa(display);
 		intel_hpd_init(display);
 
 		ret = __intel_display_driver_resume(display, state, ctx);
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 888676693f5e..eeddf10a4071 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -111,6 +111,8 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 		return DISPLAY_VERx100(display) == 3000 ||
 			DISPLAY_VERx100(display) == 2000 ||
 			DISPLAY_VERx100(display) == 1401;
+	case INTEL_DISPLAY_WA_14022081154:
+		return DISPLAY_VER(display) >= 30;
 	case INTEL_DISPLAY_WA_14025769978:
 		return DISPLAY_VER(display) == 35;
 	case INTEL_DISPLAY_WA_14026643300:
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index 425a300840aa..acb45fa59aef 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -33,6 +33,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_14014143976,
 	INTEL_DISPLAY_WA_14016740474,
 	INTEL_DISPLAY_WA_14020863754,
+	INTEL_DISPLAY_WA_14022081154,
 	INTEL_DISPLAY_WA_14025769978,
 	INTEL_DISPLAY_WA_14026643300,
 	INTEL_DISPLAY_WA_15013987218,
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index bfd6f0a19725..e899b2eb0871 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -33,6 +33,7 @@
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
 #include "intel_display_utils.h"
+#include "intel_display_wa.h"
 #include "intel_dkl_phy.h"
 #include "intel_dkl_phy_regs.h"
 #include "intel_dpio_phy.h"
@@ -5220,12 +5221,40 @@ static void sanitize_dpll_state(struct intel_display *display,
 	_intel_disable_shared_dpll(display, pll);
 }
 
+/*
+ * WA 14022081154
+ * The dedicated display PHYs reset to a power state that blocks S0ix, increasing idle
+ * system power. After a system reset (cold boot, S3/4/5, warm reset) if a dedicated
+ * PHY is not being brought up shortly, use these steps to move the PHY to the lowest
+ * power state to save power. For PTL the workaround is needed only for port A. Port B
+ * is not connected.
+ *
+ * 1. Follow the PLL Enable Sequence, using any valid frequency such as DP 1.62 GHz.
+ *    This brings lanes out of reset and enables the PLL to allow powerdown to be moved
+ *    to the Disable state.
+ * 2. Follow PLL Disable Sequence. This moves powerdown to the Disable state and disables the PLL.
+ */
+void intel_dpll_power_save_wa(struct intel_display *display)
+{
+	struct intel_encoder *encoder;
+
+	if (!intel_display_wa(display, INTEL_DISPLAY_WA_14022081154))
+		return;
+
+	for_each_intel_encoder(display->drm, encoder) {
+		if (!intel_encoder_is_dig_port(encoder))
+			continue;
+
+		intel_cx0_pll_power_save_wa(encoder);
+	}
+}
+
 void intel_dpll_sanitize_state(struct intel_display *display)
 {
 	struct intel_dpll *pll;
 	int i;
 
-	intel_cx0_pll_power_save_wa(display);
+	intel_dpll_power_save_wa(display);
 
 	for_each_dpll(display, pll, i)
 		sanitize_dpll_state(display, pll);
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.h b/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
index f4b84733a58c..0beb8d99fd5e 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
@@ -461,6 +461,7 @@ void intel_dpll_swap_state(struct intel_atomic_state *state);
 void intel_dpll_init(struct intel_display *display);
 void intel_dpll_update_ref_clks(struct intel_display *display);
 void intel_dpll_readout_hw_state(struct intel_display *display);
+void intel_dpll_power_save_wa(struct intel_display *display);
 void intel_dpll_sanitize_state(struct intel_display *display);
 
 void intel_dpll_dump_hw_state(struct intel_display *display,
-- 
2.43.0

