Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CECC5AC67
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 03:59:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D7B10E27D;
	Tue, 11 Aug 2026 03:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bcta8Bzc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943BD10E27D;
 Tue, 11 Aug 2026 03:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786420774; x=1817956774;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1erWWjAjL8lU4NUyy6Rr+XOzGTbsDZjWAUQhf6ckF90=;
 b=Bcta8Bzc1RAkrVotaiB6nvD4DAapRDKDUOw/X6v8fdCM/j/OITr3ANNV
 W7PUjPNeXZjsTYiWgSMcLVUvRLRxTwmsNZRs1KgwxyE0Qh97am29wYGzQ
 3H5fV6iP88UpdFfw6rcT+1S3Ve/Rgno5zXVBpThLv8bFdvnK2eMperfuA
 j3QZT71EmbedhKFQ0pJXj00hKljW4KBish7FwEe91SvhOY6ZDuQFjul3o
 idD35EZ2vAclSAYmHovXov5J0gw+sUxL0D1PNuTgOBrpCQIaH3sWB5+KW
 2OZ6n2C0miKSZmh2Gan6/spW7YIuCQrA5yQmofVPFuWtTr6KMHP15hAEk w==;
X-CSE-ConnectionGUID: oPhqR2UZSOazjt81NPi4wg==
X-CSE-MsgGUID: x2zCMGiKSqe+jVDTjx00eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="97294825"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="97294825"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 20:59:34 -0700
X-CSE-ConnectionGUID: BaGg/+yqRAGfPuGIv+y5gA==
X-CSE-MsgGUID: FqpVSLWiS5mFB7zdPgeBQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="268383805"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa005.fm.intel.com with ESMTP; 10 Aug 2026 20:59:31 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	suraj.kandpal@intel.com
Subject: [PATCH v2] drm/i915/dp: Gate UHBR SST SDP splitting on sink capability
Date: Tue, 11 Aug 2026 09:19:28 +0530
Message-ID: <20260811034928.556990-1-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
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

SDP splitting for 128b/132b (UHBR) SST audio must only be enabled when
the sink advertises support for it. Previously sdp_split_enable
was set for every UHBR SST stream carrying audio, regardless of sink
capability.

In MST mode SDP splitting is inherently supported, so the sink
capability check (DP_SST_SPLIT_SDP_CAP) is applied only to the SST path.

Fixes: 8853750dbad8 ("drm/i915: Enable SDP split for DP2.0")
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Assisted-by: Claude:claude-opus-4-8
---
 .../drm/i915/display/intel_display_types.h    |  2 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 44 ++++++++++++++++---
 2 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 20a07ea06b5e..5f0fe18c0614 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1951,6 +1951,8 @@ struct intel_dp {
 
 	bool colorimetry_support;
 
+	bool sst_split_sdp_support;
+
 	struct {
 		enum transcoder transcoder;
 		struct mutex lock;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 437b9e7bb864..81c9248516fd 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3414,12 +3414,22 @@ intel_dp_audio_compute_config(struct intel_encoder *encoder,
 			      struct intel_crtc_state *pipe_config,
 			      struct drm_connector_state *conn_state)
 {
+	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
+
 	pipe_config->has_audio =
 		intel_dp_has_audio(encoder, conn_state) &&
 		intel_audio_compute_config(encoder, pipe_config, conn_state);
 
 	pipe_config->sdp_split_enable = pipe_config->has_audio &&
 					intel_dp_is_uhbr(pipe_config);
+
+	/*
+	 * SDP splitting for UHBR audio requires explicit sink capability in
+	 * SST mode, whereas in MST mode it is inherently supported.
+	 */
+	if (pipe_config->sdp_split_enable &&
+	    !intel_crtc_has_type(pipe_config, INTEL_OUTPUT_DP_MST))
+		pipe_config->sdp_split_enable = intel_dp->sst_split_sdp_support;
 }
 
 void
@@ -4461,16 +4471,25 @@ void intel_dp_configure_protocol_converter(struct intel_dp *intel_dp,
 			    str_enable_disable(tmp));
 }
 
-static bool intel_dp_get_colorimetry_status(struct intel_dp *intel_dp)
+static u8 intel_dp_read_dprx_feature_enum(struct intel_dp *intel_dp)
 {
 	u8 dprx = 0;
 
-	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_DPRX_FEATURE_ENUMERATION_LIST,
-			      &dprx) != 1)
-		return false;
+	drm_dp_dpcd_readb(&intel_dp->aux, DP_DPRX_FEATURE_ENUMERATION_LIST,
+			  &dprx);
+	return dprx;
+}
+
+static bool intel_dp_get_colorimetry_status(u8 dprx)
+{
 	return dprx & DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED;
 }
 
+static bool intel_dp_get_sst_split_sdp_status(u8 dprx)
+{
+	return dprx & DP_SST_SPLIT_SDP_CAP;
+}
+
 static int intel_dp_read_dsc_dpcd(struct drm_dp_aux *aux,
 				  u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
 {
@@ -4770,6 +4789,7 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector
 {
 	struct intel_display *display = to_intel_display(intel_dp);
 	int ret;
+	u8 dprx;
 
 	/* this function is meant to be called only once */
 	drm_WARN_ON(display->drm, intel_dp->dpcd[DP_DPCD_REV] != 0);
@@ -4781,8 +4801,13 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector
 			 drm_dp_is_branch(intel_dp->dpcd));
 	intel_init_dpcd_quirks(intel_dp, &intel_dp->desc.ident);
 
+	dprx = intel_dp_read_dprx_feature_enum(intel_dp);
+
 	intel_dp->colorimetry_support =
-		intel_dp_get_colorimetry_status(intel_dp);
+		intel_dp_get_colorimetry_status(dprx);
+
+	intel_dp->sst_split_sdp_support =
+		intel_dp_get_sst_split_sdp_status(dprx);
 
 	/*
 	 * Read the eDP display control registers.
@@ -4873,13 +4898,20 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
 	 * the OUI/ID since we know it won't change.
 	 */
 	if (!intel_dp_is_edp(intel_dp)) {
+		u8 dprx;
+
 		drm_dp_read_desc(&intel_dp->aux, &intel_dp->desc,
 				 drm_dp_is_branch(intel_dp->dpcd));
 
 		intel_init_dpcd_quirks(intel_dp, &intel_dp->desc.ident);
 
+		dprx = intel_dp_read_dprx_feature_enum(intel_dp);
+
 		intel_dp->colorimetry_support =
-			intel_dp_get_colorimetry_status(intel_dp);
+			intel_dp_get_colorimetry_status(dprx);
+
+		intel_dp->sst_split_sdp_support =
+			intel_dp_get_sst_split_sdp_status(dprx);
 
 		intel_dp_update_sink_caps(intel_dp);
 	}
-- 
2.48.1

