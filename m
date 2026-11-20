Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F41A606A326
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RVqDb6Mc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9CB112AD4;
	Fri, 20 Nov 2026 14:24:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A88112AD5;
 Fri, 20 Nov 2026 14:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184645; x=1826720645;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P8nXi0tjlc7kZqugwW4KyDiv35B4+qlnOxBuwSS8s1s=;
 b=RVqDb6McsmPycY/FC4/IGhaSNkV0wPE56K6UgohJ1jVAyyz8UpGL3yJ7
 qMutwNNsU1xRYO6dTJ4WvPJwJIvcM7GvVRu45h8TRdMdsx57iSbG5m3HJ
 maro/y1tBtIoo/AUNC2C3F9n8wIRM9uO0HdnxCvny4bVr/vKajg3zhPrV
 iLC0VOJaWtosYs2HIRtCsxqeL39xCxAScqkQgj9Zb8fhzq8loXvP41Foh
 UTKza2rPPYWhxjocYrc62jBq1ieG0NanRJmB+1GXoWKQn1NYxEeUecHw7
 jH3FZ8jskEALNjtxr+Kcn5WF2VFLX7olrv5sVxAWhvPoAvylzZLdgnnL6 w==;
X-CSE-ConnectionGUID: zhZjrxrTQD++zRX7cK9ujg==
X-CSE-MsgGUID: cLbO3jFpSOqBq3C88falXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4091022"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4091022"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:48 -0800
X-CSE-ConnectionGUID: 2jFMqVqzTwm5ZggFVWTuGA==
X-CSE-MsgGUID: wQRcD0eQQGu/OHWkVpOwrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12422058"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:46 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 23/29] drm/i915/dp: Limit the DP link bpp for DSC pass-through
 to the FRL bandwidth
Date: Fri, 20 Nov 2026 19:37:23 +0530
Message-ID: <20261120140729.466177-24-ankit.k.nautiyal@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the PCON passes a DSC 1.2a stream through, the HDMI sink gets the
compressed stream of the source as is. The compressed bpp of the DP
stream therefore also has to fit the HDMI FRL link, which is not
checked when computing the DP link.

If the uncompressed stream doesn't fit the FRL link, limit the maximum
link bpp of the DSC pass to what the FRL link can carry. Fail the
limits computation if this leaves no valid bpp.

This applies to an HDMI 2.1 sink that supports DSC 1.2 behind a PCON
that advertises pass-through support, so add a helper for that
capability. Modes that need DSC on the HDMI link are not accepted for
a DSC 1.2a source yet, so there is no change in behavior.

The function returns bool like the other functions computing the link
config limits, true if the limits are valid. It cannot fail yet, the
following changes add more limits for which it can return false.

Assisted-by: LLM
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 55 +++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9e69035a99eb..9d662b5f7b47 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1248,6 +1248,16 @@ static bool intel_dp_pcon_can_encode_dsc(struct intel_dp *intel_dp)
 		drm_dp_pcon_enc_is_dsc_1_2(intel_dp->pcon_dsc_dpcd);
 }
 
+static bool intel_dp_pcon_can_passthrough_dsc(struct intel_dp *intel_dp)
+{
+	struct intel_connector *connector = intel_dp->attached_connector;
+
+	return intel_dp_is_hdmi_2_1_sink(intel_dp) &&
+		connector->base.display_info.hdmi.dsc_cap.v_1p2 &&
+		(connector->dp.dsc_dpcd[DP_DSC_SUPPORT - DP_DSC_SUPPORT] &
+		 DP_DSC_PASSTHROUGH_IS_SUPPORTED);
+}
+
 /*
  * Compute the PCON DSC encoder parameters for the stream sent to the HDMI
  * sink, which is in @sink_format. @enc can be NULL to only check feasibility.
@@ -2987,6 +2997,39 @@ intel_dp_compute_m_n_ratio_limits(struct intel_dp *intel_dp,
 	return true;
 }
 
+/*
+ * The stream of a PCON passing DSC through is not recompressed, so it has to
+ * fit the HDMI FRL link as is. Limit the compressed bpp of the DP stream.
+ *
+ * This applies only if the HDMI link needs DSC and the DP stream is a DSC 1.2a
+ * stream, as passing it through is the only PCON operation possible then.
+ */
+static bool
+intel_dp_pcon_dsc_compute_passthrough_limits(struct intel_dp *intel_dp,
+					     const struct intel_crtc_state *crtc_state,
+					     struct link_config_limits *limits)
+{
+	struct intel_connector *connector = intel_dp->attached_connector;
+	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
+
+	if (!intel_dp_pcon_sink_support_frl(intel_dp) ||
+	    !intel_dp_pcon_can_passthrough_dsc(intel_dp) ||
+	    intel_dp_dsc_stream_version_minor(connector) < 2 ||
+	    crtc_state->output_format != crtc_state->sink_format)
+		return true;
+
+	if (intel_dp_frl_bw_valid(intel_dp, adjusted_mode->crtc_clock,
+				  limits->pipe.max_bpp / 3, crtc_state->sink_format,
+				  true) == MODE_OK)
+		return true;
+
+	limits->link.max_bpp_x16 =
+		min(limits->link.max_bpp_x16,
+		    intel_dp_hdmi_frl_payload_bw(intel_dp, true) * 16 / adjusted_mode->crtc_clock);
+
+	return true;
+}
+
 bool
 intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 			       struct drm_connector_state *conn_state,
@@ -3110,10 +3153,14 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 	if (!intel_dp_test_compute_config(connector, crtc_state, limits))
 		return false;
 
-	return intel_dp_compute_config_link_bpp_limits(connector,
-						       crtc_state,
-						       dsc,
-						       limits);
+	if (!intel_dp_compute_config_link_bpp_limits(connector, crtc_state, dsc, limits))
+		return false;
+
+	if (dsc && respect_downstream_limits &&
+	    !intel_dp_pcon_dsc_compute_passthrough_limits(intel_dp, crtc_state, limits))
+		return false;
+
+	return limits->link.min_bpp_x16 <= limits->link.max_bpp_x16;
 }
 
 int intel_dp_config_required_rate(const struct intel_crtc_state *crtc_state)
-- 
2.50.1

