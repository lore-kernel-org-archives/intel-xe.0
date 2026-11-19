Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0433606A324
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 11:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MCBsv16t
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6804E112301;
	Thu, 19 Nov 2026 11:48:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048D9112310;
 Thu, 19 Nov 2026 11:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795088914; x=1826624914;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M7hTfvXmzZB75DWamDLT+5A1Yomx/USvVRDXDscoa9U=;
 b=MCBsv16tA7Wj9cyhlrzl64nm8ZfFL1+WuMASUC3AvWlPBqCYJIDncVQx
 12CQoMwWRKioqckU3tox/i0lkEHoL7oci+mFZlU6ADJWqcCmbMLa4dKTT
 0WEaiBXnyf0x5mo1AgnGZoyQ+z2S2CVmsbN2B7jQZofylp4RVvcYHTN/H
 MyJnEZr3sGfXVJLMMHU+bFFuudYGn/5XSeckpcXLgT4vqgzyFLe6h06mG
 KA1xHX+yXIpnSzHTKBlfGb9LKqa1MrxAr3Vw3+QUSzPcVr1EVLqu0+NTg
 nC6+MGaCAHPmAxKIlBW8+0b/9aRX/urMd2OgASXFRXLM6bk9LdZmOQtt+ Q==;
X-CSE-ConnectionGUID: jdK5pxmsQDOfiYAyeBz0og==
X-CSE-MsgGUID: tYhnSnl3QUS165TQfvPjkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3960791"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3960791"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 03:48:34 -0800
X-CSE-ConnectionGUID: jU76xjMwSFSYCm5+6c19sQ==
X-CSE-MsgGUID: zA5w1b6ZRAuIdH1tUy0Kjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10324827"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by orviesa007.jf.intel.com with ESMTP; 19 Nov 2026 03:48:31 -0800
From: Eriksen Xie <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>,
 Mika Kahola <mika.kahola@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Imre Deak <imre.deak@intel.com>, Eriksen Xie <xiaolu.xie@intel.com>
Subject: [PATCH] drm/i915/lt_phy: Move only the active PHY lanes to the active
 power state
Date: Thu, 19 Nov 2026 19:46:25 +0800
Message-ID: <20261119114625.2129144-1-xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The LT PHY Bspec page lists, per connection type, lane reversal and lane
count, both the PHY lanes owned by the display and the PHY lanes that
are active, see PHY Lane and Transmitter Usage. The two differ for x1
and x2 links: both PHY lanes are owned, but only PHY lane 0 is active
(PHY lane 1 on a lane reversed native port). An owned, inactive lane has
to stay in the ready state, with both its transmitters disabled.

The last step of the non-Thunderbolt PLL enable sequence moves the PHY
powerdown state to active for the active PHY lanes only.
intel_lt_phy_pll_enable() passes all the owned lanes, so with x1/x2
links on native ports and on DP-alt ports with pin assignment C/E the
unused PHY lane gets activated as well. The earlier steps moving the
owned lanes out of reset and to the ready state, and the disable
sequence, are correct as they are.

Move only the lanes that have a transmitter in use to the active state.
When both lanes are used they are still changed by a single powerdown
change sequence, as the PHY requires them to move from P2 to P0 on the
same pclk edge.

Fixes: 32865c2da516 ("drm/i915/ltphy: Program the rest of the LT Phy Enable sequence")
Bspec: 74492, 74701
Signed-off-by: Eriksen Xie <xiaolu.xie@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lt_phy.c | 25 ++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index 86492651b0..c3d563d9f5 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -969,6 +969,26 @@ static u8 intel_lt_phy_get_owned_lane_mask(struct intel_encoder *encoder)
 		? INTEL_LT_PHY_BOTH_LANES : INTEL_LT_PHY_LANE0;
 }
 
+/*
+ * Get the owned PHY lanes that have a transmitter in use, and so need to be in
+ * the active power state, see "PHY Lane and Transmitter Usage" in Bspec. The
+ * rest of the owned lanes stay in the ready state.
+ */
+static u8 intel_lt_phy_get_active_lane_mask(struct intel_encoder *encoder, u8 lane_count)
+{
+	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
+	u8 owned_lane_mask = intel_lt_phy_get_owned_lane_mask(encoder);
+
+	if (lane_count > 2)
+		return owned_lane_mask;
+
+	/* The FIA muxing handles the orientation flip in DP-alt mode. */
+	if (!intel_tc_port_in_dp_alt_mode(dig_port) && dig_port->lane_reversal)
+		return owned_lane_mask & INTEL_LT_PHY_LANE1;
+
+	return owned_lane_mask & INTEL_LT_PHY_LANE0;
+}
+
 static u8 intel_lt_phy_read(struct intel_encoder *encoder, u8 lane_mask, u16 addr)
 {
 	return intel_cx0_read(encoder, lane_mask, addr);
@@ -1913,6 +1933,7 @@ void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
 	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
 	bool lane_reversal = dig_port->lane_reversal;
 	u8 owned_lane_mask = intel_lt_phy_get_owned_lane_mask(encoder);
+	u8 active_lane_mask;
 	enum phy phy = intel_encoder_to_phy(encoder);
 	enum port port = encoder->port;
 	struct ref_tracker *wakeref = 0;
@@ -2033,7 +2054,9 @@ void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
 	 * We handle this step in bxt_set_cdclk()
 	 */
 	/* 19. Move the PHY powerdown state to Active and program to enable/disable transmitters */
-	intel_lt_phy_powerdown_change_sequence(encoder, owned_lane_mask,
+	active_lane_mask = intel_lt_phy_get_active_lane_mask(encoder,
+							     dpll_hw_state->ltpll.lane_count);
+	intel_lt_phy_powerdown_change_sequence(encoder, active_lane_mask,
 					       XELPDP_P0_STATE_ACTIVE);
 
 	intel_lt_phy_enable_disable_tx(encoder, &dpll_hw_state->ltpll);
-- 
2.43.0

