Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B66606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CGGVEPnD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B35112AC1;
	Fri, 20 Nov 2026 14:24:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1785112AD2;
 Fri, 20 Nov 2026 14:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184643; x=1826720643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9icv39Ld2p2FOPqPxt2dwhMptlsFpiluzOwozHIKETA=;
 b=CGGVEPnDkzS25Hwx/33DskBTWvg80bQKhS9VHtgiaEy1WVywsfwzITyo
 IWE9+uJ40QA/Vf4xZwjzf0gdVO8s4dDGIvOfGVEpRT07Ux4lc7we2c46e
 6qT2ZXAUtZEwfDF39KMtnsbi1P8mGhqaNuCRvlbM3XxXjmo+ubUZOj4WL
 Z0wLZqjur66LS3xF0dF6sR5JtCxak1YUKx3oFndwSLcOGWry3RLvN/0vm
 OHr5dlfRw6SqAJndiEhS6+k1y+uo4+mgNss05uPEGVRdhTzHAVxKHV09u
 ZLLgcPiEDOSd1xdVez0uCGVc8Me51hhUugEuzbMxuTGNDM+CpmyJS7617 Q==;
X-CSE-ConnectionGUID: 07Af3tL5S8i4uC0pqWUehw==
X-CSE-MsgGUID: MwIiXTbUS8qZWLMqkOVm4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4091015"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4091015"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:44 -0800
X-CSE-ConnectionGUID: RuSFjz5lSameVnBbT+Po5w==
X-CSE-MsgGUID: bkLo1fx5RayjxTjR4U2qAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12422050"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:43 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 21/29] drm/i915/dp: Allow PCON DSC modes through the FRL bw
 check
Date: Fri, 20 Nov 2026 19:37:21 +0530
Message-ID: <20261120140729.466177-22-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
References: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
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

The FRL bandwidth check rejects every mode whose uncompressed bandwidth
exceeds the FRL rate, even though an HDMI 2.1 PCON can decode a DSC 1.1
stream and encode DSC 1.2a for the HDMI sink. High bandwidth modes (e.g.
4k120, 8k60) get pruned for such PCONs, although the PCON and the sink
can carry them.

Accept such a mode if the HDMI link can carry it compressed, and the DP
stream can be compressed too: the PCON can't encode an uncompressed
stream. Do the same when selecting the bpc, but only in the pass that
compresses the DP stream, and only if no bpc fits the HDMI link
uncompressed, so that the HDMI link stays uncompressed whenever it can.

This takes care of the FIXME in the FRL bandwidth check.

Assisted-by: LLM
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 59 ++++++++++++++++++++++---
 1 file changed, 53 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7d3b5f35c206..2d5587ec923c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1226,7 +1226,6 @@ intel_dp_frl_bw_valid(struct intel_dp *intel_dp, int target_clock,
 	/* check for MAX FRL BW for both PCON and HDMI2.1 sink */
 	max_frl_bw = intel_dp_hdmi_frl_payload_bw(intel_dp, false);
 
-	/* #FIXME check bandwidth with DSC if both PCON and HDMI sink support DSC */
 	if (target_bw > max_frl_bw)
 		return MODE_CLOCK_HIGH;
 
@@ -1303,6 +1302,23 @@ intel_dp_pcon_dsc_enc_compute(struct intel_dp *intel_dp,
 	return true;
 }
 
+/*
+ * Whether the PCON can compress a stream that doesn't fit the HDMI FRL link
+ * uncompressed. The DP stream has to be compressed for that as well.
+ */
+static bool
+intel_dp_hdmi_dsc_possible(struct intel_dp *intel_dp,
+			   const struct drm_display_mode *mode, int pixel_clock,
+			   int bpc, enum intel_output_format sink_format)
+{
+	struct intel_connector *connector = intel_dp->attached_connector;
+
+	return intel_dp_pcon_sink_support_frl(intel_dp) &&
+		intel_dp_dsc_stream_version_minor(connector) < 2 &&
+		intel_dp_pcon_dsc_enc_compute(intel_dp, mode, pixel_clock, bpc,
+					      sink_format, NULL);
+}
+
 static enum drm_mode_status
 intel_dp_hdmi_bw_valid(struct intel_dp *intel_dp,
 		       int target_clock, int bpc,
@@ -1326,12 +1342,22 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
 {
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	int bpc = 8; /* Assume 8bpc for the DP++/HDMI/DVI TMDS/FRL bw check */
+	enum drm_mode_status status;
 
 	if (intel_dp->dfp.max_dotclock &&
 	    target_clock > intel_dp->dfp.max_dotclock)
 		return MODE_CLOCK_HIGH;
 
-	return intel_dp_hdmi_bw_valid(intel_dp, target_clock, bpc, sink_format, true);
+	status = intel_dp_hdmi_bw_valid(intel_dp, target_clock, bpc, sink_format, true);
+	if (status != MODE_CLOCK_HIGH)
+		return status;
+
+	/* The PCON may be able to compress the stream for the HDMI link */
+	if (intel_dp_has_dsc(connector) &&
+	    intel_dp_hdmi_dsc_possible(intel_dp, mode, target_clock, bpc, sink_format))
+		return MODE_OK;
+
+	return status;
 }
 
 static enum drm_mode_status
@@ -1836,9 +1862,11 @@ bool intel_dp_supports_dsc(struct intel_dp *intel_dp,
 
 static int intel_dp_hdmi_compute_bpc(struct intel_dp *intel_dp,
 				     const struct intel_crtc_state *crtc_state,
-				     int bpc, bool respect_downstream_limits)
+				     int bpc, bool respect_downstream_limits,
+				     bool dsc)
 {
 	int clock = crtc_state->hw.adjusted_mode.crtc_clock;
+	int max_bpc;
 
 	/*
 	 * Current bpc could already be below 8bpc due to
@@ -1855,6 +1883,8 @@ static int intel_dp_hdmi_compute_bpc(struct intel_dp *intel_dp,
 	if (!respect_downstream_limits)
 		bpc = 8;
 
+	max_bpc = bpc;
+
 	for (; bpc >= 8; bpc -= 2) {
 		if (intel_hdmi_bpc_possible(crtc_state, bpc,
 					    intel_dp_has_hdmi_sink(intel_dp)) &&
@@ -1863,12 +1893,27 @@ static int intel_dp_hdmi_compute_bpc(struct intel_dp *intel_dp,
 			return bpc;
 	}
 
+	/*
+	 * No bpc fits the HDMI link uncompressed. If the DP stream is compressed
+	 * the PCON may be able to compress the stream for the HDMI link as well.
+	 */
+	if (!dsc || !respect_downstream_limits)
+		return -EINVAL;
+
+	for (bpc = max_bpc; bpc >= 8; bpc -= 2) {
+		if (intel_hdmi_bpc_possible(crtc_state, bpc,
+					    intel_dp_has_hdmi_sink(intel_dp)) &&
+		    intel_dp_hdmi_dsc_possible(intel_dp, &crtc_state->hw.adjusted_mode,
+					       clock, bpc, crtc_state->sink_format))
+			return bpc;
+	}
+
 	return -EINVAL;
 }
 
 static int intel_dp_max_bpp(struct intel_dp *intel_dp,
 			    const struct intel_crtc_state *crtc_state,
-			    bool respect_downstream_limits)
+			    bool respect_downstream_limits, bool dsc)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
 	struct intel_connector *connector = intel_dp->attached_connector;
@@ -1883,7 +1928,8 @@ static int intel_dp_max_bpp(struct intel_dp *intel_dp,
 		int max_hdmi_bpc;
 
 		max_hdmi_bpc = intel_dp_hdmi_compute_bpc(intel_dp, crtc_state, bpc,
-							 respect_downstream_limits);
+							 respect_downstream_limits,
+							 dsc);
 		if (max_hdmi_bpc < 0)
 			return 0;
 
@@ -2970,7 +3016,8 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 		limits->pipe.max_bpp = min(crtc_state->max_pipe_bpp, 24);
 	} else {
 		limits->pipe.max_bpp = intel_dp_max_bpp(intel_dp, crtc_state,
-							respect_downstream_limits);
+							respect_downstream_limits,
+							dsc);
 	}
 
 	if (!dsc && intel_dp_in_hdr_mode(conn_state)) {
-- 
2.50.1

