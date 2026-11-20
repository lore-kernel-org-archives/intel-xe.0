Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28332606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 07:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mcd1tZxp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F3B10E20A;
	Fri, 20 Nov 2026 07:07:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9F810E1D0;
 Fri, 20 Nov 2026 07:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795158427; x=1826694427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P2ZWugZdfhW9iYNTCOaAZZ0QK/wpEEP5Jsd6LuymlWs=;
 b=mcd1tZxpLvP2Uc1PunKiKb9sYJ84Y4lB71mtU3aEsHJlkCnLhGGM5PK0
 8MynO7Ye4QcOFS/IMPbfWgie5kINIDvSi8mV2o1+DVLND874UMENOqPHl
 K6SyDq1wnGByjF9Zig6N9gmUZ200LM0PC3yAB9wN4f75mRZJf3jFVsm66
 o54W0Hia4jIq12H8d5EQk1JNJ97cAC9L9T5KhgU8hxAxnqOMtD+4+45hp
 CpwYil10ytIqB4lhrO/9rBJHwxNt51SKx1wodjtH3SjdEjGXVBj+wzYOZ
 BgruPNxPekqzkyjLl4sjVRN65kcCddB31xqLNtkgooo8D+GCSxjJrjI8e w==;
X-CSE-ConnectionGUID: 4SM/DQPNRLK/dAupT1wjbw==
X-CSE-MsgGUID: u6R9AwxZTayXm5sbeV7qLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4029479"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4029479"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 22:37:13 -0800
X-CSE-ConnectionGUID: UXviRA93QZ2de7ptPiKBoA==
X-CSE-MsgGUID: ySdlSfmfQL+GDras1sCf9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="11194614"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by fmviesa010.fm.intel.com with ESMTP; 19 Nov 2026 22:37:10 -0800
From: Eriksen Xie <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>,
 Mika Kahola <mika.kahola@intel.com>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Imre Deak <imre.deak@intel.com>, Eriksen Xie <xiaolu.xie@intel.com>
Subject: [PATCH v2 2/2] drm/i915/lt_phy: Fix the ML to TX mapping for voltage
 swing
Date: Fri, 20 Nov 2026 14:34:59 +0800
Message-ID: <6dc9216c624321b16e66a4bba0f7f8ba442ad9e7.1795156437.git.xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795156437.git.xiaolu.xie@intel.com>
References: <DS4PPFE901A304FFE20F33BBF2CAE5C4009E3782@DS4PPFE901A304F.namprd11.prod.outlook.com>
 <cover.1795156437.git.xiaolu.xie@intel.com>
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
(TX). The mapping depends on the connection type and lane reversal, see
the PHY Lane and Transmitter Usage table in Bspec.

The signal levels (voltage swing, pre- and post-cursor) of an ML are
programmed to TX (ML % 2) of PHY lane (ML / 2). This is correct only
on native ports without lane reversal:

- In DP-alt mode ML0 uses TX2 and ML1 uses TX1 of PHY lane 0, so the
  parameters of the two end up on each other's transmitter.

- On lane reversed native ports ML n uses TX (3 - n), but the lane
  reversal was not taken into account.

Add a helper returning the TX index of a ML and use it to program the
signal levels correctly.

Fixes: 13ba213f921f ("drm/i915/ltphy: Program LT Phy Voltage Swing")
Bspec: 74701
Signed-off-by: Eriksen Xie <xiaolu.xie@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lt_phy.c | 22 +++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index 7af03e5b364..2e2fa8fa64a 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -2110,6 +2110,23 @@ void intel_lt_phy_pll_disable(struct intel_encoder *encoder)
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
@@ -2135,8 +2152,9 @@ void intel_lt_phy_set_signal_levels(struct intel_encoder *encoder,
 
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

