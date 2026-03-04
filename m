Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43148EF8FE0
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 13:14:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB7810E9F5;
	Wed,  4 Mar 2026 13:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WgCaTDNv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4E610E9F0;
 Wed,  4 Mar 2026 13:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772630072; x=1804166072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AIihphTQtIpawKrbgi89eCoKLbMw+pGBouc5IOOOvGo=;
 b=WgCaTDNvYiqp15sVd+Cei2ld+FjB01LeDKWOvsTMbsY0tHEikq6kw5Qe
 2SxhT6dxfecQLG6fYUWo5Dit8yp+2QBZoZC9e3IfONwCIOGMjP1vkBfmt
 dWDAjgTCTbRDpjV7DrzGDArMAhgSSYeTx5T5AlBMfW9u/NgcaSjIPS5HU
 xfzQjlEuZ6fsrM/6movKJjUPPjG3m9BH4GPF5N56Q+K4GP4EcDSGibpFQ
 ZDjifi+L6IUZ5CRNRdpJuHPcQq8zmq/jwPGfvR3HN8hJrfgVy6rP0KWa6
 fqhI5RDiTRKMZULnOHrJA3c6OL/Z8cE3ns6hZ0Oqa7ctJmOCU915Xp53G w==;
X-CSE-ConnectionGUID: wJ+pU9G9TFa5D+zXUQJh/A==
X-CSE-MsgGUID: WbNww4oNR1m9SZdnxOiSwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77293458"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="77293458"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 05:14:32 -0800
X-CSE-ConnectionGUID: jJ+2RDTTRh+rfyWFissGvw==
X-CSE-MsgGUID: rZXboh3GRDifnwUxZEruhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="241350764"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 05:14:31 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v2 05/24] drm/i915/lt_phy: Add lane_count to PLL state
Date: Wed,  4 Mar 2026 13:14:04 +0000
Message-ID: <20260304131423.1017821-6-mika.kahola@intel.com>
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

Cache lane count as part of PLL state.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h | 1 +
 drivers/gpu/drm/i915/display/intel_lt_phy.c   | 9 +++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.h b/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
index 4cc14ce5eebe..d408ccf6f902 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
@@ -278,6 +278,7 @@ struct intel_lt_phy_pll_state {
 	u8 config[3];
 	bool ssc_enabled;
 	bool tbt_mode;
+	int lane_count;
 };
 
 struct intel_dpll_hw_state {
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index ebdcab58df4a..07eab4d7bcff 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -1749,11 +1749,13 @@ intel_lt_phy_pll_calc_state(struct intel_crtc_state *crtc_state,
 			}
 			crtc_state->dpll_hw_state.ltpll.ssc_enabled =
 				intel_lt_phy_pll_is_ssc_enabled(crtc_state, encoder);
+			crtc_state->dpll_hw_state.ltpll.lane_count = crtc_state->lane_count;
 			return 0;
 		}
 	}
 
 	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI)) {
+		crtc_state->dpll_hw_state.ltpll.lane_count = crtc_state->lane_count;
 		return intel_lt_phy_calculate_hdmi_state(&crtc_state->dpll_hw_state.ltpll,
 							 crtc_state->port_clock);
 	}
@@ -1793,11 +1795,11 @@ intel_lt_phy_program_pll(struct intel_encoder *encoder,
 
 static void
 intel_lt_phy_enable_disable_tx(struct intel_encoder *encoder,
-			       const struct intel_lt_phy_pll_state *ltpll,
-			       u8 lane_count)
+			       const struct intel_lt_phy_pll_state *ltpll)
 {
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	bool lane_reversal = dig_port->lane_reversal;
+	u8 lane_count = ltpll->lane_count;
 	bool is_dp_alt =
 		intel_tc_port_in_dp_alt_mode(dig_port);
 	enum intel_tc_pin_assignment tc_pin =
@@ -2006,8 +2008,7 @@ void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
 	intel_lt_phy_powerdown_change_sequence(encoder, owned_lane_mask,
 					       XELPDP_P0_STATE_ACTIVE);
 
-	intel_lt_phy_enable_disable_tx(encoder, &crtc_state->dpll_hw_state.ltpll,
-				       crtc_state->lane_count);
+	intel_lt_phy_enable_disable_tx(encoder, &crtc_state->dpll_hw_state.ltpll);
 	intel_lt_phy_transaction_end(encoder, wakeref);
 }
 
-- 
2.43.0

