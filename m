Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6E5606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A0Mw5aZl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7C4112AD7;
	Fri, 20 Nov 2026 14:24:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22532112A90;
 Fri, 20 Nov 2026 14:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184635; x=1826720635;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2LT9S/ZSxgKDk7ZS4QaHfHA0eXc46QpIhIZAb6AWHx8=;
 b=A0Mw5aZlk6GwW4FWSIXsd67N48z9dk5nMPxhHkqqy7YuBNx6VABxG/ST
 v4WKQukh8Q1bTDZMP3hH7SIB7NBHzu9/sQzrOTg9AvUhBkU5o9hAQI94u
 ByqWEd8KE4XB/1zsJdapsRUV6xbvDaj39GGRvqSM4uiJ55cXzPXgHFguX
 ldsdnyUY9HsZcvtd8TYA4SiXgNhxQHpy2v+2GrH4WVMV5CWV62254n+Ao
 XPqELSy5YoFkzs/uhFCDuvjpu3UeYzsYG7qmdkLmLqoUXFMYJqN264+UZ
 uIj0pzHY3n8sJDiRq5AldOqAaKZA7Mpk4YHdpefA+TUp+81MfUJuV2T1N A==;
X-CSE-ConnectionGUID: Cq2c6tbXRrefEkklfyGGFw==
X-CSE-MsgGUID: rhquDkjOTAiTxgeD9MX23A==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4090994"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4090994"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:38 -0800
X-CSE-ConnectionGUID: mRa4HgVUQ4WpaFSt5oMLow==
X-CSE-MsgGUID: zsibIeXcRp2yBMIZz8kZLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12422038"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:36 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 17/29] drm/i915/dp: Compute the PCON DSC encoder parameters
Date: Fri, 20 Nov 2026 19:37:17 +0530
Message-ID: <20261120140729.466177-18-ankit.k.nautiyal@intel.com>
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

When the HDMI link needs DSC and the DP stream is a DSC 1.1 stream, the
PCON decodes it and encodes a DSC 1.2a stream for the HDMI sink. The
encoder parameters are the slice height and width, and the compressed
bpp. They describe the stream the HDMI sink receives, so compute them
for the sink format, within the bandwidth of the FRL link.

Do this when the DP link configuration is final, and store the result in
the crtc state, instead of deriving the parameters at enable time from
the stream going out of the pipe, whose format can differ from what the
HDMI sink gets. The enable path now only programs the stored values.

A DSC 1.2a stream can't be re-encoded by the PCON, so reject those. Modes
that need DSC on the HDMI link are not selectable yet, so there is no
change in behavior.

Assisted-by: LLM
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 194 +++++++++++++-----------
 1 file changed, 105 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 07ce99829303..0991f913100e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -130,6 +130,7 @@ bool intel_dp_is_edp(struct intel_dp *intel_dp)
 static void intel_dp_unset_edid(struct intel_dp *intel_dp);
 static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp);
 static bool intel_dp_is_hdmi_2_1_sink(struct intel_dp *intel_dp);
+static int intel_dp_dsc_stream_version_minor(const struct intel_connector *connector);
 
 /* Is link rate UHBR and thus 128b/132b? */
 bool intel_dp_is_uhbr(const struct intel_crtc_state *crtc_state)
@@ -1232,6 +1233,69 @@ intel_dp_pcon_sink_support_frl(struct intel_dp *intel_dp)
 		intel_dp_hdmi_sink_max_frl(intel_dp);
 }
 
+static bool intel_dp_pcon_can_encode_dsc(struct intel_dp *intel_dp)
+{
+	struct intel_connector *connector = intel_dp->attached_connector;
+
+	return intel_dp_is_hdmi_2_1_sink(intel_dp) &&
+		connector->base.display_info.hdmi.dsc_cap.v_1p2 &&
+		drm_dp_pcon_enc_is_dsc_1_2(intel_dp->pcon_dsc_dpcd);
+}
+
+/*
+ * Compute the PCON DSC encoder parameters for the stream sent to the HDMI
+ * sink, which is in @sink_format. @enc can be NULL to only check feasibility.
+ */
+static bool
+intel_dp_pcon_dsc_enc_compute(struct intel_dp *intel_dp,
+			      const struct drm_display_mode *mode, int pixel_clock,
+			      int bpc, enum intel_output_format sink_format,
+			      struct intel_pcon_dsc_enc_config *enc)
+{
+	struct intel_connector *connector = intel_dp->attached_connector;
+	const struct drm_display_info *info = &connector->base.display_info;
+	int pcon_max_slices = drm_dp_pcon_dsc_max_slices(intel_dp->pcon_dsc_dpcd);
+	int pcon_max_slice_width = drm_dp_pcon_dsc_max_slice_width(intel_dp->pcon_dsc_dpcd);
+	int slice_height, num_slices, slice_width, max_link_dsc_bpp, bpp_x16;
+
+	if (!intel_dp_pcon_can_encode_dsc(intel_dp))
+		return false;
+
+	slice_height = intel_hdmi_dsc_get_slice_height(mode->vdisplay);
+	if (!slice_height)
+		return false;
+
+	num_slices = intel_hdmi_dsc_get_num_slices(mode, pixel_clock, sink_format,
+						   pcon_max_slices, pcon_max_slice_width,
+						   info->hdmi.dsc_cap.max_slices,
+						   info->hdmi.dsc_cap.clk_per_slice);
+	if (!num_slices)
+		return false;
+
+	slice_width = DIV_ROUND_UP(mode->hdisplay, num_slices);
+
+	/* The compressed stream has to fit the FRL link */
+	max_link_dsc_bpp = intel_dp_hdmi_frl_payload_bw(intel_dp) / pixel_clock;
+	if (!max_link_dsc_bpp)
+		return false;
+
+	bpp_x16 = intel_hdmi_dsc_get_bpp(drm_dp_pcon_dsc_bpp_incr(intel_dp->pcon_dsc_dpcd),
+					 slice_width, num_slices, sink_format, bpc,
+					 info->hdmi.dsc_cap.all_bpp,
+					 info->hdmi.dsc_cap.total_chunk_kbytes * 1024,
+					 max_link_dsc_bpp);
+	if (!bpp_x16)
+		return false;
+
+	if (enc) {
+		enc->slice_height = slice_height;
+		enc->slice_width = slice_width;
+		enc->bpp_x16 = bpp_x16;
+	}
+
+	return true;
+}
+
 static enum drm_mode_status
 intel_dp_hdmi_bw_valid(struct intel_dp *intel_dp,
 		       int target_clock, int bpc,
@@ -3026,14 +3090,44 @@ bool intel_dp_joiner_needs_dsc(struct intel_display *display,
 
 static int
 intel_dp_pcon_compute_config(struct intel_dp *intel_dp,
-			     struct intel_crtc_state *crtc_state)
+			     struct intel_crtc_state *crtc_state,
+			     bool respect_downstream_limits)
 {
+	struct intel_display *display = to_intel_display(intel_dp);
+	struct intel_connector *connector = intel_dp->attached_connector;
+	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
+	int bpc = crtc_state->pipe_bpp / 3;
+
 	if (!intel_dp_is_hdmi_2_1_sink(intel_dp))
 		return 0;
 
 	if (crtc_state->dsc.compression_enable)
 		crtc_state->pcon_config.dsc_op = INTEL_PCON_DSC_DECODE;
 
+	if (!respect_downstream_limits || !intel_dp_pcon_sink_support_frl(intel_dp))
+		return 0;
+
+	if (intel_dp_frl_bw_valid(intel_dp, adjusted_mode->crtc_clock, bpc,
+				  crtc_state->sink_format, true) == MODE_OK)
+		return 0;
+
+	/*
+	 * The HDMI link needs DSC. The PCON can only get it from a compressed DP
+	 * stream, and re-encoding is only valid for a DSC 1.1 stream.
+	 */
+	if (!crtc_state->dsc.compression_enable ||
+	    intel_dp_dsc_stream_version_minor(connector) >= 2 ||
+	    !intel_dp_pcon_dsc_enc_compute(intel_dp, adjusted_mode,
+					   adjusted_mode->crtc_clock, bpc,
+					   crtc_state->sink_format,
+					   &crtc_state->pcon_config.dsc_enc)) {
+		drm_dbg_kms(display->drm,
+			    "HDMI link needs DSC, but the PCON can't provide it\n");
+		return -EINVAL;
+	}
+
+	crtc_state->pcon_config.dsc_op = INTEL_PCON_DSC_DECODE_ENCODE;
+
 	return 0;
 }
 
@@ -3122,7 +3216,8 @@ intel_dp_compute_link_for_joined_pipes(struct intel_encoder *encoder,
 			return -EINVAL;
 	}
 
-	ret = intel_dp_pcon_compute_config(intel_dp, pipe_config);
+	ret = intel_dp_pcon_compute_config(intel_dp, pipe_config,
+					   respect_downstream_limits);
 	if (ret)
 		return ret;
 
@@ -4545,79 +4640,16 @@ void intel_dp_check_frl_training(struct intel_dp *intel_dp)
 	}
 }
 
-static int
-intel_dp_pcon_dsc_enc_slice_height(const struct intel_crtc_state *crtc_state)
-{
-	int vactive = crtc_state->hw.adjusted_mode.vdisplay;
-
-	return intel_hdmi_dsc_get_slice_height(vactive);
-}
-
-static int
-intel_dp_pcon_dsc_enc_slices(struct intel_dp *intel_dp,
-			     const struct intel_crtc_state *crtc_state)
-{
-	struct intel_connector *connector = intel_dp->attached_connector;
-	const struct drm_display_info *info = &connector->base.display_info;
-	int hdmi_throughput = info->hdmi.dsc_cap.clk_per_slice;
-	int hdmi_max_slices = info->hdmi.dsc_cap.max_slices;
-	int pcon_max_slices = drm_dp_pcon_dsc_max_slices(intel_dp->pcon_dsc_dpcd);
-	int pcon_max_slice_width = drm_dp_pcon_dsc_max_slice_width(intel_dp->pcon_dsc_dpcd);
-
-	return intel_hdmi_dsc_get_num_slices(&crtc_state->hw.adjusted_mode,
-					     crtc_state->hw.adjusted_mode.crtc_clock,
-					     crtc_state->output_format,
-					     pcon_max_slices,
-					     pcon_max_slice_width,
-					     hdmi_max_slices, hdmi_throughput);
-}
-
-static int
-intel_dp_pcon_dsc_enc_bpp(struct intel_dp *intel_dp,
-			  const struct intel_crtc_state *crtc_state,
-			  int num_slices, int slice_width)
-{
-	struct intel_connector *connector = intel_dp->attached_connector;
-	const struct drm_display_info *info = &connector->base.display_info;
-	int output_format = crtc_state->output_format;
-	bool hdmi_all_bpp = info->hdmi.dsc_cap.all_bpp;
-	int pcon_fractional_bpp = drm_dp_pcon_dsc_bpp_incr(intel_dp->pcon_dsc_dpcd);
-	int hdmi_max_chunk_bytes =
-		info->hdmi.dsc_cap.total_chunk_kbytes * 1024;
-	int bpc = crtc_state->pipe_bpp / 3;
-
-	return intel_hdmi_dsc_get_bpp(pcon_fractional_bpp, slice_width,
-				      num_slices, output_format, bpc, hdmi_all_bpp,
-				      hdmi_max_chunk_bytes, 0);
-}
-
 void
 intel_dp_pcon_dsc_configure(struct intel_dp *intel_dp,
 			    const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
-	struct intel_connector *connector = intel_dp->attached_connector;
-	const struct drm_display_info *info;
+	const struct intel_pcon_dsc_enc_config *enc = &crtc_state->pcon_config.dsc_enc;
 	u8 pps_param[6];
-	int slice_height;
-	int slice_width;
-	int num_slices;
-	int bits_per_pixel;
 	int ret;
-	bool hdmi_is_dsc_1_2;
-
-	if (!intel_dp_is_hdmi_2_1_sink(intel_dp))
-		return;
-
-	if (!connector)
-		return;
 
-	info = &connector->base.display_info;
-
-	hdmi_is_dsc_1_2 = info->hdmi.dsc_cap.v_1p2;
-
-	if (!drm_dp_pcon_enc_is_dsc_1_2(intel_dp->pcon_dsc_dpcd) ||
-	    !hdmi_is_dsc_1_2)
+	if (!intel_dp_pcon_can_encode_dsc(intel_dp))
 		return;
 
 	if (crtc_state->pcon_config.dsc_op != INTEL_PCON_DSC_DECODE_ENCODE) {
@@ -4627,28 +4659,12 @@ intel_dp_pcon_dsc_configure(struct intel_dp *intel_dp,
 		return;
 	}
 
-	slice_height = intel_dp_pcon_dsc_enc_slice_height(crtc_state);
-	if (!slice_height)
-		return;
-
-	num_slices = intel_dp_pcon_dsc_enc_slices(intel_dp, crtc_state);
-	if (!num_slices)
-		return;
-
-	slice_width = DIV_ROUND_UP(crtc_state->hw.adjusted_mode.hdisplay,
-				   num_slices);
-
-	bits_per_pixel = intel_dp_pcon_dsc_enc_bpp(intel_dp, crtc_state,
-						   num_slices, slice_width);
-	if (!bits_per_pixel)
-		return;
-
-	pps_param[0] = slice_height & 0xFF;
-	pps_param[1] = slice_height >> 8;
-	pps_param[2] = slice_width & 0xFF;
-	pps_param[3] = slice_width >> 8;
-	pps_param[4] = bits_per_pixel & 0xFF;
-	pps_param[5] = (bits_per_pixel >> 8) & 0x3;
+	pps_param[0] = enc->slice_height & 0xFF;
+	pps_param[1] = enc->slice_height >> 8;
+	pps_param[2] = enc->slice_width & 0xFF;
+	pps_param[3] = enc->slice_width >> 8;
+	pps_param[4] = enc->bpp_x16 & 0xFF;
+	pps_param[5] = (enc->bpp_x16 >> 8) & 0x3;
 
 	ret = drm_dp_pcon_pps_override_param(&intel_dp->aux, pps_param);
 	if (ret < 0)
-- 
2.50.1

