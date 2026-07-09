Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82290C43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 16:59:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E2B10E590;
	Thu,  9 Jul 2026 16:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UiRcwRqh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C3610E0A8;
 Thu,  9 Jul 2026 16:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783616369; x=1815152369;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WPmLVLsJMtrLtKKue8ZgUbrYZPna/puxy+Qmwwf4Nyo=;
 b=UiRcwRqhBAN3MYfJbH36X8rV/aSn/Al3fXiJ+w8q5XbJ63t69Mgh5oh+
 XesQOnGHfE3Lm90SjziK0mZH8nhpyf+xG6PPZv2I6lq/qVr2p3n8yi/v7
 FtKqOsntKbApRdsKxXckTtxv5Eu/HqsUFqFzAtuTvEXzacswgMkclxsBi
 bAElTF8ZC5yNNm5AFEyHolCViR3mFLy9OUhtGkHLm4Quk1/Jdgg60+reE
 pz7nfhuked5zG7Gr+9d8KUR5JmRpVPaYE0+Jd7IeRZByRNsk1mcQIzffX
 lA/mcR0QrKflYed6E5g9qdenTv+713VJNfwNX02BFWEETbKn+r7OiS5cr w==;
X-CSE-ConnectionGUID: LVMf7lTTSySg64EzFlEZVg==
X-CSE-MsgGUID: xwRrSe7tQ8mi37ALvxYkKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84419333"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84419333"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 09:59:29 -0700
X-CSE-ConnectionGUID: 6ZayB3rjTbW4+P7VMhxeLg==
X-CSE-MsgGUID: Ogbka+SQSwWu/VtrPYZ11A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="279038911"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa001.fm.intel.com with ESMTP; 09 Jul 2026 09:59:27 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 kai.vehmanen@intel.com, ankit.k.nautiyal@intel.com,
 chaitanya.kumar.borah@intel.com
Subject: [PATCH v1] drm/i915/dp: Gate UHBR SST SDP splitting on sink capability
Date: Thu,  9 Jul 2026 22:19:03 +0530
Message-ID: <20260709164903.1949947-1-mitulkumar.ajitkumar.golani@intel.com>
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

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  2 ++
 drivers/gpu/drm/i915/display/intel_dp.c       | 22 ++++++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index c048da7d6fea..272b14289e38 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1938,6 +1938,8 @@ struct intel_dp {
 
 	bool colorimetry_support;
 
+	bool sst_split_sdp_supported;
+
 	struct {
 		enum transcoder transcoder;
 		struct mutex lock;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0922d23b284c..77c348509a0e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3359,12 +3359,15 @@ intel_dp_audio_compute_config(struct intel_encoder *encoder,
 			      struct intel_crtc_state *pipe_config,
 			      struct drm_connector_state *conn_state)
 {
+	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
+
 	pipe_config->has_audio =
 		intel_dp_has_audio(encoder, conn_state) &&
 		intel_audio_compute_config(encoder, pipe_config, conn_state);
 
 	pipe_config->sdp_split_enable = pipe_config->has_audio &&
-					intel_dp_is_uhbr(pipe_config);
+					intel_dp_is_uhbr(pipe_config) &&
+					intel_dp->sst_split_sdp_supported;
 }
 
 void
@@ -4413,6 +4416,17 @@ static bool intel_dp_get_colorimetry_status(struct intel_dp *intel_dp)
 	return dprx & DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED;
 }
 
+static bool intel_dp_get_sst_split_sdp_status(struct intel_dp *intel_dp)
+{
+	u8 dprx = 0;
+
+	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_DPRX_FEATURE_ENUMERATION_LIST,
+			      &dprx) != 1)
+		return false;
+	return dprx & DP_SST_SPLIT_SDP_CAP;
+}
+
+
 static int intel_dp_read_dsc_dpcd(struct drm_dp_aux *aux,
 				  u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
 {
@@ -4726,6 +4740,9 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp, struct intel_connector *connector
 	intel_dp->colorimetry_support =
 		intel_dp_get_colorimetry_status(intel_dp);
 
+	intel_dp->sst_split_sdp_supported =
+		intel_dp_get_sst_split_sdp_status(intel_dp);
+
 	/*
 	 * Read the eDP display control registers.
 	 *
@@ -4823,6 +4840,9 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
 		intel_dp->colorimetry_support =
 			intel_dp_get_colorimetry_status(intel_dp);
 
+		intel_dp->sst_split_sdp_supported =
+			intel_dp_get_sst_split_sdp_status(intel_dp);
+
 		intel_dp_update_sink_caps(intel_dp);
 	}
 
-- 
2.48.1

