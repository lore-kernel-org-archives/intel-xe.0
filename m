Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0D0EF8FE3
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 13:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D72C10EA17;
	Wed,  4 Mar 2026 13:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UXONHMDC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3612C10EA10;
 Wed,  4 Mar 2026 13:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772630090; x=1804166090;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KjWn2oWRaRL/9ef5P06tRynqxuta+nppzkJKhOuLxYE=;
 b=UXONHMDCH7M8fGlTVCNi29rROcXMFcsXu/GPzYI+NgvBOznCvt7DnY0u
 +XRbJeDBFvqfRgqUxqxB/o5/Kg7n1ExY7dzImY2zbdqNrkm3Ov+OSZJOG
 ZZrTc2yh6WXhoCUlgrqGzmRZrCpzOy1ti1ZpGrFFcN/lpf8jd6QTM38vZ
 KptEuW0gu5Fzc2ZTysK4LVaD13La+gOLxh+XkK17MB9WCtCDikSau0ECr
 gaD/ISY+LNgbpP+YIk2WVbKZ04bLIx1aO5+t3WoZpUl31Hpyb6n3AxmGN
 UA8hmZc5cj2pfA8AmcOnQiPgj6OrUv+dXDyiAYz7p7AgT4u6DIm+HyjEP Q==;
X-CSE-ConnectionGUID: mCdScKEqRpqieGWpcOKAqQ==
X-CSE-MsgGUID: 6L36eUD7R4qGZcRAsvTpPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77293483"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="77293483"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 05:14:50 -0800
X-CSE-ConnectionGUID: j7iKn/z+SRygdrYyGQkw9g==
X-CSE-MsgGUID: loLC0RojTRquc7agvpUe/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="241350856"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 05:14:49 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 20/24] drm/i915/lt_phy: Readout lane count
Date: Wed,  4 Mar 2026 13:14:19 +0000
Message-ID: <20260304131423.1017821-21-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304131423.1017821-1-mika.kahola@intel.com>
References: <20260304131423.1017821-1-mika.kahola@intel.com>
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

Readout lane count back from HW. Reuse existing function
for Cx0 for LT PHY case with minor modification to add
lanes as function parameters.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.c | 10 ++++++----
 drivers/gpu/drm/i915/display/intel_cx0_phy.h |  1 +
 drivers/gpu/drm/i915/display/intel_lt_phy.c  |  2 ++
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index 6a471c021c0e..7e59409bbf01 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -2180,7 +2180,7 @@ static int intel_c10pll_calc_state(const struct intel_crtc_state *crtc_state,
 	return 0;
 }
 
-static int readout_enabled_lane_count(struct intel_encoder *encoder)
+int intel_readout_lane_count(struct intel_encoder *encoder, int lane0, int lane1)
 {
 	struct intel_display *display = to_intel_display(encoder);
 	u8 enabled_tx_lane_count = 0;
@@ -2212,7 +2212,7 @@ static int readout_enabled_lane_count(struct intel_encoder *encoder)
 		max_tx_lane_count = round_up(max_tx_lane_count, 2);
 
 	for (tx_lane = 0; tx_lane < max_tx_lane_count; tx_lane++) {
-		u8 phy_lane_mask = tx_lane < 2 ? INTEL_CX0_LANE0 : INTEL_CX0_LANE1;
+		u8 phy_lane_mask = tx_lane < 2 ? lane0 : lane1;
 		int tx = tx_lane % 2 + 1;
 		u8 val;
 
@@ -2252,7 +2252,8 @@ static void intel_c10pll_readout_hw_state(struct intel_encoder *encoder,
 	 */
 	intel_c10_msgbus_access_begin(encoder, lane);
 
-	cx0pll_state->lane_count = readout_enabled_lane_count(encoder);
+	cx0pll_state->lane_count = intel_readout_lane_count(encoder, INTEL_CX0_LANE0,
+							    INTEL_CX0_LANE1);
 
 	for (i = 0; i < ARRAY_SIZE(pll_state->pll); i++)
 		pll_state->pll[i] = intel_cx0_read(encoder, lane, PHY_C10_VDR_PLL(i));
@@ -2707,7 +2708,8 @@ static void intel_c20pll_readout_hw_state(struct intel_encoder *encoder,
 
 	wakeref = intel_cx0_phy_transaction_begin(encoder);
 
-	cx0pll_state->lane_count = readout_enabled_lane_count(encoder);
+	cx0pll_state->lane_count = intel_readout_lane_count(encoder, INTEL_CX0_LANE0,
+							    INTEL_CX0_LANE1);
 
 	/* 1. Read VDR params and current context selection */
 	intel_c20_readout_vdr_params(encoder, &pll_state->vdr, &cntx);
diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.h b/drivers/gpu/drm/i915/display/intel_cx0_phy.h
index 1d4480b8bf39..1428e7a5a318 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.h
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.h
@@ -28,6 +28,7 @@ struct intel_hdmi;
 void intel_cx0_clear_response_ready_flag(struct intel_encoder *encoder,
 					 int lane);
 bool intel_encoder_is_c10phy(struct intel_encoder *encoder);
+int intel_readout_lane_count(struct intel_encoder *encoder, int lane0, int lane1);
 void intel_mtl_pll_enable(struct intel_encoder *encoder,
 			  struct intel_dpll *pll,
 			  const struct intel_dpll_hw_state *dpll_hw_state);
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index 066e2f16791c..232f14d69ec8 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -2227,6 +2227,8 @@ bool intel_lt_phy_pll_readout_hw_state(struct intel_encoder *encoder,
 	lane = owned_lane_mask & INTEL_LT_PHY_LANE0 ? : INTEL_LT_PHY_LANE1;
 	wakeref = intel_lt_phy_transaction_begin(encoder);
 
+	pll_state->lane_count = intel_readout_lane_count(encoder, INTEL_LT_PHY_LANE0,
+							 INTEL_LT_PHY_LANE1);
 	pll_state->config[0] = intel_lt_phy_read(encoder, lane, LT_PHY_VDR_0_CONFIG);
 	pll_state->config[1] = intel_lt_phy_read(encoder, INTEL_LT_PHY_LANE0, LT_PHY_VDR_1_CONFIG);
 	pll_state->config[2] = intel_lt_phy_read(encoder, lane, LT_PHY_VDR_2_CONFIG);
-- 
2.43.0

