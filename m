Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573A61125842
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 14:19:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1261A10E8F5;
	Wed, 11 Mar 2026 14:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jje8q1Go";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BA310E8F8;
 Wed, 11 Mar 2026 14:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773238755; x=1804774755;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fHeXKlapbLoKokwCEsjqro7hh8rdIPeZB/mUguiF/UY=;
 b=Jje8q1Go1KXQdOwd302dQzCJVgFvt0/Gld1R9mrg+zFQOOGzmaAztySw
 kxPu6TDiKmr7P2aq/sDA11vbyuOf5nxHvsxOEOv5aWqk8y7bG2aokjPJ4
 gXHjALDNhGZkGKTz1RmZ0u1WskrCUlqBs14c96BdAi8lbg9OAHc3jQOP9
 Ojgw7aqzrr08xH/+WSzWOAR7o/cfeFM+b53rcaLRklIsHvy1ZH+StxQZa
 t3LHHf1bGsD3W6pgqOSA9XP8FJfnaKo7gLyNoCwQfLqnURfjxyywO1WFl
 ZCN4fsHeI8r3x2j4GuXDIgjvBFnKdrSeQLSI4Ez9u/CiUHPdyaE6PkeW7 g==;
X-CSE-ConnectionGUID: vaLbRw2jRbOC5gAIVaSEEg==
X-CSE-MsgGUID: 5n0cdHtfQEOIdfn9o92L6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="99775183"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="99775183"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 07:19:14 -0700
X-CSE-ConnectionGUID: 23G57k1vS26ZsJ6tSZWZFA==
X-CSE-MsgGUID: UgFT6ZAZSjGnV9Tz+czPfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="216730407"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa006.fm.intel.com with ESMTP; 11 Mar 2026 07:19:13 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v3 05/24] drm/i915/lt_phy: Add lane_count to PLL state
Date: Wed, 11 Mar 2026 14:18:46 +0000
Message-ID: <20260311141905.2526418-6-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311141905.2526418-1-mika.kahola@intel.com>
References: <20260311141905.2526418-1-mika.kahola@intel.com>
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
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
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
index 7a68465a9801..9aa38d150bae 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -1767,11 +1767,13 @@ intel_lt_phy_pll_calc_state(struct intel_crtc_state *crtc_state,
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
@@ -1811,11 +1813,11 @@ intel_lt_phy_program_pll(struct intel_encoder *encoder,
 
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
@@ -2024,8 +2026,7 @@ void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
 	intel_lt_phy_powerdown_change_sequence(encoder, owned_lane_mask,
 					       XELPDP_P0_STATE_ACTIVE);
 
-	intel_lt_phy_enable_disable_tx(encoder, &crtc_state->dpll_hw_state.ltpll,
-				       crtc_state->lane_count);
+	intel_lt_phy_enable_disable_tx(encoder, &crtc_state->dpll_hw_state.ltpll);
 	intel_lt_phy_transaction_end(encoder, wakeref);
 }
 
-- 
2.43.0

