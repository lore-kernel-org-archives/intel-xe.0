Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEB1606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 07:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TYdTEHN4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78FF10EB9B;
	Thu, 19 Nov 2026 07:06:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4684E10EB9B;
 Thu, 19 Nov 2026 07:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795072013; x=1826608013;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jSDXEFLXcqzInHICNffjNWjiIxN/30GpiR2xgBh/h7s=;
 b=TYdTEHN4DGVopkvt2OoWhDVIU/eyKjNZscGIb2jpBmMY2+yg9hQ7qCiL
 a8PkCCeATsUueoch69BRHWOkcj/eFPXGEYkbcHiwSo5BJfIQ34AA/EtcY
 JMdqdwRI6CxWtrDzQZHdxDuoE+7LD3gcac+WGN53nmTGxHJ0xvnIFWZtS
 5GTOkTgTED79FpxaLRgFcFiD5fGBS4lDUwv/sDCqAuHXoUoHZ+3lyxJAf
 RKppJ48mUr/nI+5dGE3H7BugL1YDTlisNUG2Y2sgs6Qk2BtpS+xHBswSs
 4UK69YNe21EbuEC1xUJPa8QzphQEBxGKZIUnn1ojCbBqIY5fV1O1A2gLl A==;
X-CSE-ConnectionGUID: ZUd/duexTPGrz01tSJs7/w==
X-CSE-MsgGUID: 8C1ufrUSQuiaxizWjw3TuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3829562"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3829562"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 23:06:53 -0800
X-CSE-ConnectionGUID: KYVdvXUFS1KecGiqVx+m7g==
X-CSE-MsgGUID: ArdZRRwkQN6OKlkQlqh9ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10693035"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by fmviesa006.fm.intel.com with ESMTP; 18 Nov 2026 23:06:50 -0800
From: Eriksen Xie <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>,
 Mika Kahola <mika.kahola@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Imre Deak <imre.deak@intel.com>, Eriksen Xie <xiaolu.xie@intel.com>
Subject: [PATCH] drm/i915/lt_phy: Fix the main link to TX mapping
Date: Thu, 19 Nov 2026 15:04:44 +0800
Message-ID: <20261119070444.2106229-1-xiaolu.xie@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Each main link (ML) is routed to a specific PHY lane and transmitter
(TX). The mapping depends on the connection type, on the lane reversal
and, in DP-alt mode, on the pin assignment, see the PHY Lane and
Transmitter Usage table in the LT PHY Bspec page. The driver gets it
wrong in two places.

The signal levels (voltage swing, pre- and post-cursor) of an ML are
programmed to TX (ML % 2) of PHY lane (ML / 2). This is correct only on
native ports without lane reversal:

- In DP-alt mode ML0 uses TX2 and ML1 uses TX1 of PHY lane 0, so the
  parameters of the two end up on each other's transmitter. With a
  single lane the only enabled TX, TX2, is not programmed at all while
  the unused TX1 is. Reading the PHY registers back on a DP-alt x1 link
  showed the cursor values on TX1 and TX2 still at its reset values.

- On lane reversed native ports ML n uses TX (3 - n), but the lane
  reversal was not taken into account.

Also, on a single lane DP-alt link with pin assignment D the driver
enables TX1, whereas ML0 uses TX2 with every pin assignment.

Add a helper returning the TX of a ML and use it to program the signal
levels, and enable TX2 for single lane DP-alt links regardless of the
pin assignment. The orientation flip in DP-alt mode is handled by the
FIA, so it does not need to be accounted for.

Fixes: 13ba213f921f ("drm/i915/ltphy: Program LT Phy Voltage Swing")
Fixes: a54bdcb7142d ("drm/i915/ltphy: Enable/Disable Tx after Non TBT Enable sequence")
Bspec: 74701
Signed-off-by: Eriksen Xie <xiaolu.xie@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lt_phy.c | 32 ++++++++++++++-------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index 86492651b0..2e2fa8fa64 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -1827,8 +1827,6 @@ intel_lt_phy_enable_disable_tx(struct intel_encoder *encoder,
 	u8 lane_count = ltpll->lane_count;
 	bool is_dp_alt =
 		intel_tc_port_in_dp_alt_mode(dig_port);
-	enum intel_tc_pin_assignment tc_pin =
-		intel_tc_port_get_pin_assignment(dig_port);
 	u8 transmitter_mask = 0;
 
 	/*
@@ -1841,12 +1839,8 @@ intel_lt_phy_enable_disable_tx(struct intel_encoder *encoder,
 	switch (lane_count) {
 	case 1:
 		transmitter_mask = lane_reversal ? REG_BIT8(3) : REG_BIT8(0);
-		if (is_dp_alt) {
-			if (tc_pin == INTEL_TC_PIN_ASSIGNMENT_D)
-				transmitter_mask = REG_BIT8(0);
-			else
-				transmitter_mask = REG_BIT8(1);
-		}
+		if (is_dp_alt)
+			transmitter_mask = REG_BIT8(1);
 		break;
 	case 2:
 		transmitter_mask = lane_reversal ? REG_GENMASK8(3, 2) : REG_GENMASK8(1, 0);
@@ -2116,6 +2110,23 @@ void intel_lt_phy_pll_disable(struct intel_encoder *encoder)
 	intel_lt_phy_transaction_end(encoder, wakeref);
 }
 
+/*
+ * Get the transmitter (lane * 2 + TX - 1) used by a main link, which is also
+ * the lane and TX to program the voltage swing for, see "PHY Lane and
+ * Transmitter Usage" in Bspec.
+ */
+static int intel_lt_phy_ml_to_tx_idx(struct intel_encoder *encoder, int ml)
+{
+	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
+	static const u8 dp_alt_tx_idx[] = { 1, 0, 2, 3 };
+
+	/* The FIA muxing handles the orientation flip in DP-alt mode. */
+	if (intel_tc_port_in_dp_alt_mode(dig_port))
+		return dp_alt_tx_idx[ml];
+
+	return dig_port->lane_reversal ? 3 - ml : ml;
+}
+
 void intel_lt_phy_set_signal_levels(struct intel_encoder *encoder,
 				    const struct intel_crtc_state *crtc_state)
 {
@@ -2141,8 +2152,9 @@ void intel_lt_phy_set_signal_levels(struct intel_encoder *encoder,
 
 	for (ln = 0; ln < crtc_state->lane_count; ln++) {
 		int level = intel_ddi_level(encoder, crtc_state, ln);
-		int lane = ln / 2;
-		int tx = ln % 2;
+		int tx_idx = intel_lt_phy_ml_to_tx_idx(encoder, ln);
+		int lane = tx_idx / 2;
+		int tx = tx_idx % 2;
 		u8 lane_mask = lane == 0 ? INTEL_LT_PHY_LANE0 : INTEL_LT_PHY_LANE1;
 
 		if (!(lane_mask & owned_lane_mask))
-- 
2.43.0

