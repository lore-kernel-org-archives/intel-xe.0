Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9A3FED2E9
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 08:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8093E10E9B2;
	Thu, 12 Mar 2026 08:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7I7hMwJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4254C10E9B9;
 Thu, 12 Mar 2026 08:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773302836; x=1804838836;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FoDBzDYT7Di99mgKlC7YX3xlISSmUDiYV87TXoFnMSg=;
 b=h7I7hMwJqrerNI67xRe2xf+mV42sIj6PUiKj3cf9kKn80j4fwMRYKoW3
 J4Ujby2o7I15aA0QQFSdJZ1O8b66cF5zbyjdCbFnU6G+rymM7XrVIZA+I
 IRTpHBS9B7rHV7/PQxwKHkxaYBa5hM1u8gl2ZqbLub0q4kZfhK1yWEfIm
 M9MXHnWMSaiNzHIEv/ISMoS49hBo+wPOYnxw1fav9TfzIPY3cDtyfq+o4
 BEWRpWMdVUrG3wYd1oInKRtMQpJyDYgga8slN47WRdwdHIJWyL1wiZLW7
 ptEPwwRlylOa55VsLeU0u1ZwLXooi/Vp1wKfPDfF1VgRJEr8HiFtfl5CV g==;
X-CSE-ConnectionGUID: ykxba4QnQyyFfPlRudOJag==
X-CSE-MsgGUID: +CyLRFnTSuakh9Q5/NDUeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85013730"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="85013730"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:07:16 -0700
X-CSE-ConnectionGUID: ma0vz1GcQuScfcIdY9GSPg==
X-CSE-MsgGUID: YWnLaXqNRrONkKM39DDd4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="223206854"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa004.fm.intel.com with ESMTP; 12 Mar 2026 01:07:15 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [CI v3 13/24] drm/i915/lt_phy: Add xe3plpd .get_hw_state hook
Date: Thu, 12 Mar 2026 08:06:46 +0000
Message-ID: <20260312080657.2648265-14-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312080657.2648265-1-mika.kahola@intel.com>
References: <20260312080657.2648265-1-mika.kahola@intel.com>
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

Add .get_hw_state hook to xe3plpd platform for dpll framework
and update intel_lt_phy_pll_readout_hw_state() function
accordingly to support dpll framework.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 13 +++++++++++++
 drivers/gpu/drm/i915/display/intel_lt_phy.c   | 11 ++++++-----
 drivers/gpu/drm/i915/display/intel_lt_phy.h   |  3 +--
 4 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 7f1576bfe4b0..dbf3f344e014 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4248,7 +4248,7 @@ static void xe3plpd_ddi_get_config(struct intel_encoder *encoder,
 {
 	struct intel_display *display = to_intel_display(encoder);
 
-	intel_lt_phy_pll_readout_hw_state(encoder, crtc_state, &crtc_state->dpll_hw_state.ltpll);
+	intel_lt_phy_pll_readout_hw_state(encoder, &crtc_state->dpll_hw_state.ltpll);
 
 	if (crtc_state->dpll_hw_state.ltpll.tbt_mode)
 		crtc_state->port_clock = intel_mtl_tbt_calc_port_clock(encoder);
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index c1d7d9909544..6502916793f5 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4571,7 +4571,20 @@ static const struct intel_dpll_mgr mtl_pll_mgr = {
 	.compare_hw_state = mtl_compare_hw_state,
 };
 
+static bool xe3plpd_pll_get_hw_state(struct intel_display *display,
+				     struct intel_dpll *pll,
+				     struct intel_dpll_hw_state *dpll_hw_state)
+{
+	struct intel_encoder *encoder = get_intel_encoder(display, pll);
+
+	if (!encoder)
+		return false;
+
+	return intel_lt_phy_pll_readout_hw_state(encoder, &dpll_hw_state->ltpll);
+}
+
 static const struct intel_dpll_funcs xe3plpd_pll_funcs = {
+	.get_hw_state = xe3plpd_pll_get_hw_state,
 };
 
 static const struct dpll_info xe3plpd_plls[] = {
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index e9a0631a2012..1760e1a732dc 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -2213,8 +2213,7 @@ static bool intel_lt_phy_pll_is_enabled(struct intel_encoder *encoder)
 			     XELPDP_LANE_PCLK_PLL_ACK(0);
 }
 
-void intel_lt_phy_pll_readout_hw_state(struct intel_encoder *encoder,
-				       const struct intel_crtc_state *crtc_state,
+bool intel_lt_phy_pll_readout_hw_state(struct intel_encoder *encoder,
 				       struct intel_lt_phy_pll_state *pll_state)
 {
 	u8 owned_lane_mask;
@@ -2223,11 +2222,11 @@ void intel_lt_phy_pll_readout_hw_state(struct intel_encoder *encoder,
 	int i, j, k;
 
 	if (!intel_lt_phy_pll_is_enabled(encoder))
-		return;
+		return false;
 
 	pll_state->tbt_mode = intel_tc_port_in_tbt_alt_mode(enc_to_dig_port(encoder));
 	if (pll_state->tbt_mode)
-		return;
+		return false;
 
 	owned_lane_mask = intel_lt_phy_get_owned_lane_mask(encoder);
 	lane = owned_lane_mask & INTEL_LT_PHY_LANE0 ? : INTEL_LT_PHY_LANE1;
@@ -2245,6 +2244,8 @@ void intel_lt_phy_pll_readout_hw_state(struct intel_encoder *encoder,
 	}
 
 	intel_lt_phy_transaction_end(encoder, wakeref);
+
+	return true;
 }
 
 void intel_lt_phy_pll_state_verify(struct intel_atomic_state *state,
@@ -2270,7 +2271,7 @@ void intel_lt_phy_pll_state_verify(struct intel_atomic_state *state,
 		return;
 
 	encoder = intel_get_crtc_new_encoder(state, new_crtc_state);
-	intel_lt_phy_pll_readout_hw_state(encoder, new_crtc_state, &pll_hw_state);
+	intel_lt_phy_pll_readout_hw_state(encoder, &pll_hw_state);
 
 	dig_port = enc_to_dig_port(encoder);
 	if (intel_tc_port_in_tbt_alt_mode(dig_port))
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.h b/drivers/gpu/drm/i915/display/intel_lt_phy.h
index b208bbd6f8ca..0053bb5489e5 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.h
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.h
@@ -32,8 +32,7 @@ void intel_lt_phy_dump_hw_state(struct drm_printer *p,
 bool
 intel_lt_phy_pll_compare_hw_state(const struct intel_lt_phy_pll_state *a,
 				  const struct intel_lt_phy_pll_state *b);
-void intel_lt_phy_pll_readout_hw_state(struct intel_encoder *encoder,
-				       const struct intel_crtc_state *crtc_state,
+bool intel_lt_phy_pll_readout_hw_state(struct intel_encoder *encoder,
 				       struct intel_lt_phy_pll_state *pll_state);
 void intel_lt_phy_pll_state_verify(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc);
-- 
2.43.0

