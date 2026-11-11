Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F7C606A320
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 04:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H7sdoJz3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686F310E30C;
	Wed, 11 Nov 2026 04:08:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A0310E061;
 Wed, 11 Nov 2026 04:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794370127; x=1825906127;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SiPFtUjBHUhHExE8iFy4gOp6EtogiPnzRKecyhUxgcc=;
 b=H7sdoJz3HPmkAW4DAAjriT0Lz15m5Nm34vek6UBqCfuuie2NQJCJwNi1
 rk16TWYiRYUutqN+MicEt/Yz9rkvj3vlGVCmSp3yKSXzsRuP7y3ryjW39
 GL/O9IoikOV9erYSL3ez+iWNjWKVxvf41TaRIvJIUuON3oGXT8LFedxjx
 Y6T8rapUu6wDu3XgNIMXE0zrOVD7i8tqTiclntzav8deD0+Ek7bMZnVh/
 S5jmOisiGHriHKnB/OYcxtF65jHdVA+wfIrFjk+FP7MM2jZnXzl+/xQhC
 o+Wotf2a3Np0Nup+YUtH3QLt8Z/eFZYhpwuf7+XSDA7HkEuU8ZJ0W1K+s A==;
X-CSE-ConnectionGUID: EpJIntdDQu+U6Zm+apcQ0g==
X-CSE-MsgGUID: 7B3tI/LXQnW1McwPvXj9+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3041212"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3041212"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 20:08:47 -0800
X-CSE-ConnectionGUID: kG1jUu1XSl2sKNJAXQLqYQ==
X-CSE-MsgGUID: FQdNrzSeRJiMeF9qeTeVDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8657418"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by fmviesa008.fm.intel.com with ESMTP; 10 Nov 2026 20:08:44 -0800
From: Xiao Lu <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 Xiao Lu <xiaolu.xie@intel.com>
Subject: [PATCH] drm/i915/dp: Avoid YCbCr420 on HDMI2.1 PCONs due to the TMDS
 CLK limit
Date: Wed, 11 Nov 2026 12:06:35 +0800
Message-ID: <20261111040636.3932240-1-xiaolu.xie@intel.com>
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

When the DP->HDMI PCON drives an HDMI 2.1 sink using FRL, the sink's
max TMDS clock is irrelevant: the HDMI link doesn't carry a TMDS clock
at all. However intel_dp_hdmi_compute_bpc() always compares the TMDS
clock against the EDID/DPCD max TMDS clock when the downstream limits
are respected.

For a 4k120 sink behind a PCON with a 600 MHz max TMDS clock this makes
RGB 8bpc (1188 MHz) fail, so intel_dp_max_bpp() returns 0 for RGB.
YCbCr 4:2:0 halves the TMDS clock to 594 MHz and passes, so the driver
ends up sending 4:2:0 to the sink (using DSC to fit the DP link), even
though the FRL link has plenty of bandwidth for RGB.

Check the FRL bandwidth instead when the PCON will use FRL, i.e. when
it supports source control mode and the sink is HDMI 2.1, limited by
the lower of the PCON and sink max FRL rate. Account for the 16b/18b
FRL encoding overhead so that higher bpc values that don't fit are
still rejected. The TMDS clock check is unchanged for TMDS links.

intel_dp_mode_valid_downstream() already checked the FRL bandwidth, but
with a different set of conditions and without the encoding overhead.
Use the same helper there so that the mode list and the bpc/format
selection agree. As a result:

- Modes that need more than the lower of the PCON and sink max FRL rate
  are no longer listed, even if they fit the PCON max FRL rate.
- If the PCON won't use FRL (e.g. an HDMI 2.0 sink), the TMDS limits are
  applied to the mode list instead of the FRL bandwidth. RGB-only modes
  above the max TMDS clock are no longer listed.
- Modes that were previously capped to 8bpc by the TMDS clock limit can
  now use a higher bpc, up to what the sink, the PCON and the FRL
  bandwidth allow.

Signed-off-by: Xiao Lu <xiaolu.xie@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 84 ++++++++++++++++---------
 1 file changed, 56 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ef164a797..1b8cb934a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1154,6 +1154,40 @@ static int intel_dp_max_tmds_clock(struct intel_dp *intel_dp)
 	return max_tmds_clock;
 }
 
+static bool intel_dp_is_hdmi_2_1_sink(struct intel_dp *intel_dp);
+static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp);
+
+static int frl_required_bw(int clock, int bpc,
+			   enum intel_output_format sink_format)
+{
+	if (sink_format == INTEL_OUTPUT_FORMAT_YCBCR420)
+		clock /= 2;
+
+	return clock * bpc * 3;
+}
+
+/* Max HDMI FRL rate in Gbps if the PCON will use FRL to the sink, 0 for TMDS */
+static int intel_dp_hdmi_frl_max_bw(struct intel_dp *intel_dp)
+{
+	if (!(intel_dp->downstream_ports[2] & DP_PCON_SOURCE_CTL_MODE) ||
+	    !intel_dp_is_hdmi_2_1_sink(intel_dp))
+		return 0;
+
+	return min(intel_dp->dfp.pcon_max_frl_bw,
+		   intel_dp_hdmi_sink_max_frl(intel_dp));
+}
+
+/* Check the pixel data fits the FRL link, including the 16b/18b encoding overhead */
+static enum drm_mode_status
+intel_dp_frl_bw_valid(int max_frl_bw, int clock, int bpc,
+		      enum intel_output_format sink_format)
+{
+	u64 required_bw = (u64)frl_required_bw(clock, bpc, sink_format) * 18;
+	u64 available_bw = (u64)max_frl_bw * 1000000 * 16;
+
+	return required_bw > available_bw ? MODE_CLOCK_HIGH : MODE_OK;
+}
+
 static enum drm_mode_status
 intel_dp_tmds_clock_valid(struct intel_dp *intel_dp,
 			  int clock, int bpc,
@@ -1179,15 +1213,6 @@ intel_dp_tmds_clock_valid(struct intel_dp *intel_dp,
 	return MODE_OK;
 }
 
-static int frl_required_bw(int clock, int bpc,
-			   enum intel_output_format sink_format)
-{
-	if (sink_format == INTEL_OUTPUT_FORMAT_YCBCR420)
-		clock /= 2;
-
-	return clock * bpc * 3;
-}
-
 static enum drm_mode_status
 intel_dp_mode_valid_downstream(struct intel_connector *connector,
 			       const struct drm_display_mode *mode,
@@ -1195,23 +1220,14 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
 			       enum intel_output_format sink_format)
 {
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
+	int max_frl_bw;
 
-	/* If PCON supports FRL MODE, check FRL bandwidth constraints */
-	if (intel_dp->dfp.pcon_max_frl_bw) {
-		int target_bw, max_frl_bw;
-
+	/* If the PCON will use FRL, check FRL bandwidth constraints */
+	max_frl_bw = intel_dp_hdmi_frl_max_bw(intel_dp);
+	if (max_frl_bw) {
 		/* Assume 8bpc for the FRL bandwidth check */
-		target_bw = frl_required_bw(target_clock, 8, sink_format);
-
-		max_frl_bw = intel_dp->dfp.pcon_max_frl_bw;
-
-		/* converting bw from Gbps to Kbps*/
-		max_frl_bw = max_frl_bw * 1000000;
-
-		if (target_bw > max_frl_bw)
-			return MODE_CLOCK_HIGH;
-
-		return MODE_OK;
+		return intel_dp_frl_bw_valid(max_frl_bw, target_clock, 8,
+					     sink_format);
 	}
 
 	if (intel_dp->dfp.max_dotclock &&
@@ -1728,6 +1744,8 @@ static int intel_dp_hdmi_compute_bpc(struct intel_dp *intel_dp,
 				     int bpc, bool respect_downstream_limits)
 {
 	int clock = crtc_state->hw.adjusted_mode.crtc_clock;
+	int max_frl_bw = intel_dp_hdmi_frl_max_bw(intel_dp);
+	enum drm_mode_status status;
 
 	/*
 	 * Current bpc could already be below 8bpc due to
@@ -1745,10 +1763,20 @@ static int intel_dp_hdmi_compute_bpc(struct intel_dp *intel_dp,
 		bpc = 8;
 
 	for (; bpc >= 8; bpc -= 2) {
-		if (intel_hdmi_bpc_possible(crtc_state, bpc,
-					    intel_dp_has_hdmi_sink(intel_dp)) &&
-		    intel_dp_tmds_clock_valid(intel_dp, clock, bpc, crtc_state->sink_format,
-					      respect_downstream_limits) == MODE_OK)
+		if (!intel_hdmi_bpc_possible(crtc_state, bpc,
+					     intel_dp_has_hdmi_sink(intel_dp)))
+			continue;
+
+		/* The TMDS clock limits don't apply when the PCON uses FRL */
+		if (max_frl_bw && respect_downstream_limits)
+			status = intel_dp_frl_bw_valid(max_frl_bw, clock, bpc,
+						       crtc_state->sink_format);
+		else
+			status = intel_dp_tmds_clock_valid(intel_dp, clock, bpc,
+							   crtc_state->sink_format,
+							   respect_downstream_limits);
+
+		if (status == MODE_OK)
 			return bpc;
 	}
 
-- 
2.43.0

