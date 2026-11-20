Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4C6606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=leoAcqPw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E443112ADB;
	Fri, 20 Nov 2026 14:24:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17EA112ADC;
 Fri, 20 Nov 2026 14:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184648; x=1826720648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gR7QVxjWbq/a08opmtzMQJ/tEZm1R+YmIXKrP3SwJDM=;
 b=leoAcqPw7UZWiL+gYogPfyzE1THwWUQXTNE71/Piw/EHVUvxdUjdVxsI
 TxJKvsV3UAY8u/ScCH4GmFNcXv2id8IBFjneUwDqf382ArIaGZQJJxv5G
 M9ttzZoVht5U5KTiWAUdQABR2l61vpe7lxXv1EwlK7F2ZDw3KpfN+EIw8
 1cT7K5DvDv/UmLx5noX/VC/L8pAqIzKBEAvXsTsCcRP19vEM4xmuRpy4J
 RNnfqfmjxGtxf3daRxrSggu7X/dRjT0X4DjDMdSEQN/KuSCVQJb8h0tX4
 2OfWW4h+mBKSgsKfHSM4HYwE/PrjgevPWiTlTKrGqWvt99RN0b7a5IDvk w==;
X-CSE-ConnectionGUID: /ldFWpFhToSXfYYpCFciqg==
X-CSE-MsgGUID: 2PGgQRQ3SI2V1qCyyuG5Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4091027"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4091027"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:49 -0800
X-CSE-ConnectionGUID: vAxS/cbDTjalx9FGDX/gyA==
X-CSE-MsgGUID: 5mhtYGxdTEmpK1AoBQDlkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12422062"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:48 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 24/29] drm/i915/dp: Select DSC pass-through in the PCON for
 DSC 1.2a streams
Date: Fri, 20 Nov 2026 19:37:24 +0530
Message-ID: <20261120140729.466177-25-ankit.k.nautiyal@intel.com>
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

When the HDMI link needs DSC, the PCON can only get it from a compressed
DP stream. It can pass a DSC 1.2a stream through to the HDMI sink, and
it can re-encode a DSC 1.1 stream, but only that.

Select the pass-through operation for a DSC 1.2a stream, if the PCON
supports it and the stream is one the HDMI sink can decode: the number
of slices, the compressed bpp and the chunk size have to be within the
limits of the HDMI sink, the format can't change, as the PCON can't
convert a compressed stream, and the stream has to fit the FRL link.
Otherwise fail the config as before.

This makes the PCON enable the DSC pass-through on the sink.

Assisted-by: LLM
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 83 ++++++++++++++++++++-----
 1 file changed, 69 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9d662b5f7b47..83134be623cf 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1312,6 +1312,52 @@ intel_dp_pcon_dsc_enc_compute(struct intel_dp *intel_dp,
 	return true;
 }
 
+/*
+ * The PCON passes the DSC stream of the source to the HDMI sink as is, so
+ * the stream has to be one the HDMI sink can decode.
+ */
+static bool
+intel_dp_pcon_dsc_passthrough_ok(struct intel_dp *intel_dp,
+				 const struct intel_crtc_state *crtc_state)
+{
+	struct intel_connector *connector = intel_dp->attached_connector;
+	const struct drm_display_info *info = &connector->base.display_info;
+	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
+	int num_slices = intel_dsc_line_slice_count(&crtc_state->dsc.slice_config);
+	int bpp_x16 = crtc_state->dsc.compressed_bpp_x16;
+	int bpc = crtc_state->pipe_bpp / 3;
+	int min_dsc_bpp, max_dsc_bpp;
+
+	if (!intel_dp_pcon_can_passthrough_dsc(intel_dp))
+		return false;
+
+	/* The PCON can't convert the format of a compressed stream */
+	if (crtc_state->output_format != crtc_state->sink_format)
+		return false;
+
+	if (num_slices > info->hdmi.dsc_cap.max_slices ||
+	    !intel_hdmi_dsc_get_num_slices(adjusted_mode, adjusted_mode->crtc_clock,
+					   crtc_state->sink_format, num_slices,
+					   INT_MAX, info->hdmi.dsc_cap.max_slices,
+					   info->hdmi.dsc_cap.clk_per_slice))
+		return false;
+
+	intel_hdmi_dsc_get_min_max_bpp(crtc_state->sink_format, bpc,
+				       info->hdmi.dsc_cap.all_bpp,
+				       &min_dsc_bpp, &max_dsc_bpp);
+	if (bpp_x16 < min_dsc_bpp * 16 || bpp_x16 > max_dsc_bpp * 16)
+		return false;
+
+	if (!intel_hdmi_dsc_bpp_fits_chunk_bytes(DIV_ROUND_UP(bpp_x16, 16), num_slices,
+						 crtc_state->dsc.config.slice_width,
+						 info->hdmi.dsc_cap.total_chunk_kbytes * 1024))
+		return false;
+
+	/* The compressed stream has to fit the FRL link */
+	return DIV_ROUND_UP(adjusted_mode->crtc_clock * bpp_x16, 16) <=
+		intel_dp_hdmi_frl_payload_bw(intel_dp, true);
+}
+
 /*
  * Whether the PCON can compress a stream that doesn't fit the HDMI FRL link
  * uncompressed. The DP stream has to be compressed for that as well.
@@ -3216,24 +3262,33 @@ intel_dp_pcon_compute_config(struct intel_dp *intel_dp,
 		return 0;
 
 	/*
-	 * The HDMI link needs DSC. The PCON can only get it from a compressed DP
-	 * stream, and re-encoding is only valid for a DSC 1.1 stream.
+	 * The HDMI link needs DSC, which the PCON can only get from a compressed
+	 * DP stream. It passes a DSC 1.2a stream through, and it can only
+	 * re-encode a DSC 1.1 stream.
 	 */
-	if (!crtc_state->dsc.compression_enable ||
-	    intel_dp_dsc_stream_version_minor(connector) >= 2 ||
-	    !intel_dp_pcon_dsc_enc_compute(intel_dp, adjusted_mode,
-					   adjusted_mode->crtc_clock, bpc,
-					   crtc_state->sink_format,
-					   &crtc_state->pcon_config.dsc_enc)) {
-		drm_dbg_kms(display->drm,
-			    "HDMI link needs DSC, but the PCON can't provide it\n");
-		return -EINVAL;
+	if (crtc_state->dsc.compression_enable) {
+		if (intel_dp_dsc_stream_version_minor(connector) >= 2) {
+			if (intel_dp_pcon_dsc_passthrough_ok(intel_dp, crtc_state)) {
+				crtc_state->pcon_config.dsc_op = INTEL_PCON_DSC_PASSTHROUGH;
+				crtc_state->pcon_config.frl_rate_gbps =
+					intel_dp_pcon_max_frl_rate(intel_dp, true);
+				return 0;
+			}
+		} else if (intel_dp_pcon_dsc_enc_compute(intel_dp, adjusted_mode,
+							 adjusted_mode->crtc_clock, bpc,
+							 crtc_state->sink_format,
+							 &crtc_state->pcon_config.dsc_enc)) {
+			crtc_state->pcon_config.dsc_op = INTEL_PCON_DSC_DECODE_ENCODE;
+			crtc_state->pcon_config.frl_rate_gbps =
+				intel_dp_pcon_max_frl_rate(intel_dp, true);
+			return 0;
+		}
 	}
 
-	crtc_state->pcon_config.dsc_op = INTEL_PCON_DSC_DECODE_ENCODE;
-	crtc_state->pcon_config.frl_rate_gbps = intel_dp_pcon_max_frl_rate(intel_dp, true);
+	drm_dbg_kms(display->drm,
+		    "HDMI link needs DSC, but the PCON can't provide it\n");
 
-	return 0;
+	return -EINVAL;
 }
 
 static int
-- 
2.50.1

