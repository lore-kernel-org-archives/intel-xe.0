Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57EAFD7077
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 10:41:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDA210E5BD;
	Tue, 17 Mar 2026 10:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dI7C4sR9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0035B10E4F0;
 Tue, 17 Mar 2026 10:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773744097; x=1805280097;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gl4+hRoT1FLxQnYEVk56eAw3AoDSsKcszo7XmpLciLM=;
 b=dI7C4sR97ZXt8LfkKm98XmUd3nUNjZI6Tl6pHWIVUA7dyu8tWXrfGxd7
 iylsMzrrXlu9qJvPzdDCzNaoO2rlADEC4mD/q2ziq/AGKehrNHWgdF6W5
 O0CBaNjO6CSt/lIUrsqHyLYvucgN8oJziFGJyJz+eaYEQWVf0SYnFIz2A
 r2XONkcmpkaphPComnPsnyeUgPm1pj+1q9ifshKLLvLT7Afm0tZQUkTNl
 4F30E9cbAEA814/0m0NAuM8E8dM7V6JTgZWGkbwN2eTaTKx29VG9rcUsO
 d+T8Yuff6jugJo48JEAbzbdwekM32TvVGrSOMkjdAqlSUIzFhNI+74i+D A==;
X-CSE-ConnectionGUID: 62GuI6URQw2T8ZhDHwXEFg==
X-CSE-MsgGUID: h3Rlb5E4TMC/Xi9HZiCrNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="77381979"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="77381979"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 03:41:37 -0700
X-CSE-ConnectionGUID: MDOlrm4TTXm9fu9xYqU6+g==
X-CSE-MsgGUID: Cu+y3e/eQH2Aa7oQ89kDUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="221455829"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.118])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 03:41:36 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH 2/4] drm/i915: move CPT clock gating init into intel_pch
Date: Tue, 17 Mar 2026 12:40:49 +0200
Message-ID: <20260317104119.1690065-3-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260317104119.1690065-1-luciano.coelho@intel.com>
References: <20260317104119.1690065-1-luciano.coelho@intel.com>
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

Move the CPT PCH clock gating programming into
intel_pch_init_clock_gating() and switch the corresponding IVB callers
to the display-specific code.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_pch.c  | 40 +++++++++++++++++++++++
 drivers/gpu/drm/i915/intel_clock_gating.c | 39 ++--------------------
 2 files changed, 42 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pch.c b/drivers/gpu/drm/i915/display/intel_pch.c
index 65812b720bda..bcd66bdf2a22 100644
--- a/drivers/gpu/drm/i915/display/intel_pch.c
+++ b/drivers/gpu/drm/i915/display/intel_pch.c
@@ -6,6 +6,7 @@
 #include <drm/drm_print.h>
 
 #include "intel_de.h"
+#include "intel_display.h"
 #include "intel_display_regs.h"
 #include "intel_display_core.h"
 #include "intel_display_utils.h"
@@ -227,12 +228,51 @@ static void intel_pch_ibx_init_clock_gating(struct intel_display *display)
 		       PCH_DPLSUNIT_CLOCK_GATE_DISABLE);
 }
 
+static void intel_pch_cpt_init_clock_gating(struct intel_display *display)
+{
+	enum pipe pipe;
+	u32 val;
+
+	/*
+	 * On Ibex Peak and Cougar Point, we need to disable clock
+	 * gating for the panel power sequencer or it will fail to
+	 * start up when no ports are active.
+	 */
+	intel_de_write(display, SOUTH_DSPCLK_GATE_D,
+		       PCH_DPLSUNIT_CLOCK_GATE_DISABLE |
+		       PCH_DPLUNIT_CLOCK_GATE_DISABLE |
+		       PCH_CPUNIT_CLOCK_GATE_DISABLE);
+	intel_de_rmw(display, SOUTH_CHICKEN2, 0, DPLS_EDP_PPS_FIX_DIS);
+
+	/* The below fixes the weird display corruption, a few pixels shifted
+	 * downward, on (only) LVDS of some HP laptops with IVY.
+	 */
+	for_each_pipe(display, pipe) {
+		val = intel_de_read(display, TRANS_CHICKEN2(pipe));
+		val |= TRANS_CHICKEN2_TIMING_OVERRIDE;
+		val &= ~TRANS_CHICKEN2_FDI_POLARITY_REVERSED;
+		if (display->vbt.fdi_rx_polarity_inverted)
+			val |= TRANS_CHICKEN2_FDI_POLARITY_REVERSED;
+		val &= ~TRANS_CHICKEN2_DISABLE_DEEP_COLOR_COUNTER;
+		val &= ~TRANS_CHICKEN2_DISABLE_DEEP_COLOR_MODESWITCH;
+		intel_de_write(display, TRANS_CHICKEN2(pipe), val);
+	}
+
+	/* WADP0ClockGatingDisable */
+	for_each_pipe(display, pipe)
+		intel_de_write(display, TRANS_CHICKEN1(pipe),
+			       TRANS_CHICKEN1_DP0UNIT_GC_DISABLE);
+}
+
 void intel_pch_init_clock_gating(struct intel_display *display)
 {
 	switch (INTEL_PCH_TYPE(display)) {
 	case PCH_IBX:
 		intel_pch_ibx_init_clock_gating(display);
 		break;
+	case PCH_CPT:
+		intel_pch_cpt_init_clock_gating(display);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index c0382607224d..0218196d183a 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
@@ -196,41 +196,6 @@ static void ilk_init_clock_gating(struct drm_i915_private *i915)
 	intel_pch_init_clock_gating(i915->display);
 }
 
-static void cpt_init_clock_gating(struct drm_i915_private *i915)
-{
-	struct intel_display *display = i915->display;
-	enum pipe pipe;
-	u32 val;
-
-	/*
-	 * On Ibex Peak and Cougar Point, we need to disable clock
-	 * gating for the panel power sequencer or it will fail to
-	 * start up when no ports are active.
-	 */
-	intel_uncore_write(&i915->uncore, SOUTH_DSPCLK_GATE_D, PCH_DPLSUNIT_CLOCK_GATE_DISABLE |
-			   PCH_DPLUNIT_CLOCK_GATE_DISABLE |
-			   PCH_CPUNIT_CLOCK_GATE_DISABLE);
-	intel_uncore_rmw(&i915->uncore, SOUTH_CHICKEN2, 0, DPLS_EDP_PPS_FIX_DIS);
-	/* The below fixes the weird display corruption, a few pixels shifted
-	 * downward, on (only) LVDS of some HP laptops with IVY.
-	 */
-	for_each_pipe(display, pipe) {
-		val = intel_uncore_read(&i915->uncore, TRANS_CHICKEN2(pipe));
-		val |= TRANS_CHICKEN2_TIMING_OVERRIDE;
-		val &= ~TRANS_CHICKEN2_FDI_POLARITY_REVERSED;
-		if (display->vbt.fdi_rx_polarity_inverted)
-			val |= TRANS_CHICKEN2_FDI_POLARITY_REVERSED;
-		val &= ~TRANS_CHICKEN2_DISABLE_DEEP_COLOR_COUNTER;
-		val &= ~TRANS_CHICKEN2_DISABLE_DEEP_COLOR_MODESWITCH;
-		intel_uncore_write(&i915->uncore, TRANS_CHICKEN2(pipe), val);
-	}
-	/* WADP0ClockGatingDisable */
-	for_each_pipe(display, pipe) {
-		intel_uncore_write(&i915->uncore, TRANS_CHICKEN1(pipe),
-				   TRANS_CHICKEN1_DP0UNIT_GC_DISABLE);
-	}
-}
-
 static void gen6_check_mch_setup(struct drm_i915_private *i915)
 {
 	u32 tmp;
@@ -296,7 +261,7 @@ static void gen6_init_clock_gating(struct drm_i915_private *i915)
 
 	g4x_disable_trickle_feed(i915);
 
-	cpt_init_clock_gating(i915);
+	intel_pch_init_clock_gating(i915->display);
 
 	gen6_check_mch_setup(i915);
 }
@@ -536,7 +501,7 @@ static void ivb_init_clock_gating(struct drm_i915_private *i915)
 			 GEN6_MBC_SNPCR_MED);
 
 	if (!HAS_PCH_NOP(display))
-		cpt_init_clock_gating(i915);
+		intel_pch_init_clock_gating(display);
 
 	gen6_check_mch_setup(i915);
 }
-- 
2.51.0

