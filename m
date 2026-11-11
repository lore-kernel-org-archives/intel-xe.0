Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714D7606A320
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 05:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A7Zny9aM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD6C10E05F;
	Wed, 11 Nov 2026 05:07:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F5110E05F;
 Wed, 11 Nov 2026 05:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794373674; x=1825909674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aM2ZFlzKprftBfX3cdmoD0cXALqgxh+U/GxZ7qgNdAU=;
 b=A7Zny9aMq2lK4ZaMqjN20smieDxiZGgFnO+mpzmLjyvAHsb3/IeKevu6
 P7olpqosDgb2f/GVBZzqUNqACA7pDzKcN6EB752J/u0wMezXdZu5nyht4
 YQkm9BrbSmwldTpJxpTJpvLgbUfqNIajdu/TfDDoSLTmUQ7SsR4mRm1Mj
 MXhdWLRiuGkZUoWjx3WEXJ5QMJ/yzaqdM1y/MWwwNj/uqT/4DzhzzIBjt
 ml0nkBA1Am9baqqsutj5mijr3QHlkltikVGOKnXUPKL6fIcDgf/m6geZX
 EoJC8Bq1YYgKyCwDCWR+LC0ftPH+Go56H4I6bDVchPyC9QUWOs7c/qx/l A==;
X-CSE-ConnectionGUID: lCtuJ7HkRzu7/Xmt8hlzzA==
X-CSE-MsgGUID: cAyBimdlTluJcitgnXbk2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3058345"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3058345"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 21:07:54 -0800
X-CSE-ConnectionGUID: 3E8zHxTAR7mpQwE6hKYtgQ==
X-CSE-MsgGUID: 0OkcNcWSTBi1WmyG8Fxj6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; d="scan'208";a="10122358"
Received: from xiaolu.sh.intel.com ([10.239.146.103])
 by fmviesa011.fm.intel.com with ESMTP; 10 Nov 2026 21:07:52 -0800
From: Xiao Lu <xiaolu.xie@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 Xiao Lu <xiaolu.xie@intel.com>
Subject: [PATCH v2] drm/i915/dp: Avoid YCbCr420 on HDMI2.1 PCONs due to the
 TMDS CLK limit
Date: Wed, 11 Nov 2026 13:05:42 +0800
Message-ID: <20261111050542.3935869-1-xiaolu.xie@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111040636.3932240-1-xiaolu.xie@intel.com>
References: <20261111040636.3932240-1-xiaolu.xie@intel.com>
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
the lower of the PCON and sink max FRL rate. The TMDS clock check is
unchanged for TMDS links.

intel_dp_mode_valid_downstream() already checked the FRL bandwidth, but
with a different set of conditions. Use the same helper there so that
the mode list and the bpc/format selection agree. As a result:

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

Notes:
    v2: Drop the 16b/18b encoding overhead factor from the FRL bandwidth
    check. The estimate is based on the full pixel clock, which already
    treats blanking like active video and so is an upper bound, since FRL
    carries blanking much more compactly. With the factor, 4k120 10bpc on a
    40 Gbps and 12bpc on a 48 Gbps link were rejected. Reported by the
    Sashiko review.

 drivers/gpu/drm/i915/display/intel_dp.c | 85 +++++++++++++++++--------
 1 file changed, 57 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ef164a797..f1a8e4dd1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1154,6 +1154,41 @@ static int intel_dp_max_tmds_clock(struct intel_dp *intel_dp)
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
+/* max_frl_bw is in Gbps */
+static enum drm_mode_status
+intel_dp_frl_bw_valid(int max_frl_bw, int clock, int bpc,
+		      enum intel_output_format sink_format)
+{
+	/* converting bw from Gbps to Kbps */
+	if (frl_required_bw(clock, bpc, sink_format) > max_frl_bw * 1000000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
 static enum drm_mode_status
 intel_dp_tmds_clock_valid(struct intel_dp *intel_dp,
 			  int clock, int bpc,
@@ -1179,15 +1214,6 @@ intel_dp_tmds_clock_valid(struct intel_dp *intel_dp,
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
@@ -1195,23 +1221,14 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
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
@@ -1728,6 +1745,8 @@ static int intel_dp_hdmi_compute_bpc(struct intel_dp *intel_dp,
 				     int bpc, bool respect_downstream_limits)
 {
 	int clock = crtc_state->hw.adjusted_mode.crtc_clock;
+	int max_frl_bw = intel_dp_hdmi_frl_max_bw(intel_dp);
+	enum drm_mode_status status;
 
 	/*
 	 * Current bpc could already be below 8bpc due to
@@ -1745,10 +1764,20 @@ static int intel_dp_hdmi_compute_bpc(struct intel_dp *intel_dp,
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

