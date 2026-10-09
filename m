Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224BCCA601D
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 10:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2918112068;
	Fri,  9 Oct 2026 10:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lHSJirCW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B13112065;
 Fri,  9 Oct 2026 10:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791542166; x=1823078166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hai5UZx780+cSgf3sn7RudHe8ZSQMtBZCRsenDrGpYg=;
 b=lHSJirCW8NOh9xQ+oW52SygrxL6QEiO58+23ta7Ml3hI/1IlXJZmuvBp
 DwXYAOfRKzbGt1mHXizQrX9FdS38dwonqaZ6ovuBbaQHjKTuYLEoETY3a
 Wa6GEXRw8eIRpKpJT+ekhodoyZ4a7w4XvyfPPILx32vrOSYaZ4eANoE7P
 dC70WAg7XSGPyjwGwgVs75+r8KazVWC6gf1q4zmYPHC5G2NOlRPp7ikWb
 ogpbWByBjeWoSJSDlTf/goGzcf7TKG2sF+HMp73JMhQh1GuMxEmg0QsB1
 FwtiUjE3PsKzokqBuj6pEa47fn1bBkUT8dxQXctA3eNYKO9Hz+lSm3L80 Q==;
X-CSE-ConnectionGUID: krG/++VeRt+LQ6ZBsjO18w==
X-CSE-MsgGUID: A2bYtrPCQ3+PZsLUC7E3iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="219343"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="219343"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:36:06 -0700
X-CSE-ConnectionGUID: PhOVA2VdTC+nuh382HXs6g==
X-CSE-MsgGUID: xIYaoiMXTDWPsq4A9Uddew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="399283"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa002.fm.intel.com with ESMTP; 09 Oct 2026 03:36:05 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 5/5] drm/i915/lt_phy: apply the PLL power save W/A on LT PHY
 platforms
Date: Fri,  9 Oct 2026 10:35:51 +0000
Message-ID: <20261009103552.1864818-6-mika.kahola@intel.com>
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

W/A 14022081154 covers PTL+, but only the C10 PHY sequence was ever
implemented. Port A is an LT PHY on display ver 35, so
intel_dpll_power_save_wa() had nothing to run there and the PHY was
left in the reset power state that blocks S0ix.

Add the LT PHY sequence and dispatch on the PHY type. The PLL state is
calculated from the eDP tables at RBR as the C10 sequence does, so the
throwaway state it brings the PLL up with is marked as eDP.

BSpec: 74151
Assisted-by: Copilot:claude-opus-5
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  5 +++-
 drivers/gpu/drm/i915/display/intel_lt_phy.c   | 29 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_lt_phy.h   |  1 +
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 164fe7104545..f30bfc4205eb 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -5247,7 +5247,10 @@ void intel_dpll_power_save_wa(struct intel_display *display)
 		if (intel_encoder_to_phy(encoder) != PHY_A)
 			continue;
 
-		intel_cx0_pll_power_save_wa(encoder);
+		if (HAS_LT_PHY(display))
+			intel_lt_phy_pll_power_save_wa(encoder);
+		else
+			intel_cx0_pll_power_save_wa(encoder);
 	}
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index e05fd23b8a65..d286d33a03ea 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -2313,6 +2313,35 @@ void intel_xe3plpd_pll_disable(struct intel_encoder *encoder)
 
 }
 
+/*
+ * WA 14022081154
+ * LT PHY part of the sequence, see intel_dpll_power_save_wa().
+ */
+void intel_lt_phy_pll_power_save_wa(struct intel_encoder *encoder)
+{
+	struct intel_display *display = to_intel_display(encoder);
+	struct intel_dpll_hw_state hw_state = {};
+	int port_clock = 162000;
+	int lane_count = 4;
+	int err;
+
+	if (intel_lt_phy_pll_is_enabled(encoder))
+		return;
+
+	err = intel_lt_phy_pll_calc_state_from_table(encoder, xe3plpd_lt_edp_tables,
+						     true, true, port_clock, lane_count,
+						     &hw_state.ltpll);
+	if (drm_WARN_ON(display->drm, err))
+		return;
+
+	drm_dbg_kms(display->drm,
+		    "[ENCODER:%d:%s] Applying power saving workaround on disabled PLL\n",
+		    encoder->base.base.id, encoder->base.name);
+
+	intel_lt_phy_pll_enable(encoder, &hw_state);
+	intel_lt_phy_pll_disable(encoder);
+}
+
 static void intel_lt_phy_pll_verify_clock(struct intel_display *display,
 					  int precomputed_clock,
 					  const char *pll_state_name,
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.h b/drivers/gpu/drm/i915/display/intel_lt_phy.h
index 368ceedb1e0a..a918012b71e8 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.h
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.h
@@ -47,6 +47,7 @@ void intel_xe3plpd_pll_enable(struct intel_encoder *encoder,
 			      struct intel_dpll *pll,
 			      const struct intel_dpll_hw_state *dpll_hw_state);
 void intel_xe3plpd_pll_disable(struct intel_encoder *encoder);
+void intel_lt_phy_pll_power_save_wa(struct intel_encoder *encoder);
 void intel_lt_phy_verify_plls(struct intel_display *display);
 
 #endif /* __INTEL_LT_PHY_H__ */
-- 
2.43.0

