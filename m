Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC2C606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YN10a2g8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C75C112A89;
	Fri, 20 Nov 2026 14:23:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE6F112AAE;
 Fri, 20 Nov 2026 14:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184607; x=1826720607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wm1cv+UVFkqC9w/8JyC7uEPVKqh2jrW/tmGoqke9WOA=;
 b=YN10a2g8Zy3TBhxMvF/R+vgNi7u7KDvQAMeFVdp8ryyNBKWlBIQNQa8a
 esvN6WGy6AE6s2yCXVe/te13BSawBXv7FGZtnJwml2ywD2p69L0PZ6m4F
 /izyhYBv0ufSO5OsO43vxpMnPGNBZz4HoviDZotM79zttJUv63LFFqzEg
 Xzs46IhUfsj6nXWZ/4Z5zY21gWHIZzJ01pstrlYmq0hXwiPFPwcX8nWOW
 1Pz7zLu69+I6OE5Y6IuhEq1dyGQVmENAHaRVMFZ18N/JmxunZF1xfRfzh
 AxJwJGUBuy7wlJEgNos9UnwZKzM4SOrhrt9JwhJW1ua1X5EIzTZz5ClBj w==;
X-CSE-ConnectionGUID: FQptIZ0hRzWy8EO+Bz96kw==
X-CSE-MsgGUID: fDTWH3nhSlmur3nsZLSokg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4090952"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4090952"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:26 -0800
X-CSE-ConnectionGUID: FMwR6RRfTBS0Oh/7RC+eRg==
X-CSE-MsgGUID: O0+i8mUFSOu/2H/SLVFkCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12422014"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:25 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 10/29] drm/i915/dp: Add PCON DSC state to crtc_state
Date: Fri, 20 Nov 2026 19:37:10 +0530
Message-ID: <20261120140729.466177-11-ankit.k.nautiyal@intel.com>
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

A DP->HDMI 2.1 PCON handles DSC in one of three ways, depending on
whether the HDMI link needs DSC and on the DSC version of the DP
stream: decode, pass-through, or decode and re-encode.

Add the state to hold that decision, along with the PCON DSC encoder
PPS override parameters, so that they can be computed during
compute_config and only programmed at enable time.

The state is not read out: it does not map to any register, and
reading back the DPCD is unreliable. Reset it for every link
configuration attempt and print it in the crtc state dump.

No functional change.

Assisted-by: LLM
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 .../drm/i915/display/intel_crtc_state_dump.c  | 16 ++++++++++
 .../drm/i915/display/intel_display_types.h    | 29 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c       |  1 +
 3 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 57e64dda79c1..51e8f3688362 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -73,6 +73,13 @@ static const char * const output_type_str[] = {
 
 #undef OUTPUT_TYPE
 
+static const char * const pcon_dsc_op_str[] = {
+	[INTEL_PCON_NO_DSC] = "none",
+	[INTEL_PCON_DSC_DECODE] = "decode",
+	[INTEL_PCON_DSC_PASSTHROUGH] = "pass-through",
+	[INTEL_PCON_DSC_DECODE_ENCODE] = "decode+encode",
+};
+
 static void snprintf_output_types(char *buf, size_t len,
 				  unsigned int output_types)
 {
@@ -243,6 +250,15 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 			   str_enabled_disabled(pipe_config->fec_enable),
 			   str_enabled_disabled(pipe_config->enhanced_framing));
 
+		drm_printf(&p, "pcon: dsc op %s\n",
+			   pcon_dsc_op_str[pipe_config->pcon_config.dsc_op]);
+		if (pipe_config->pcon_config.dsc_op == INTEL_PCON_DSC_DECODE_ENCODE)
+			drm_printf(&p,
+				   "pcon dsc encoder: slice height: %u, slice width: %u, bpp_x16: %u\n",
+				   pipe_config->pcon_config.dsc_enc.slice_height,
+				   pipe_config->pcon_config.dsc_enc.slice_width,
+				   pipe_config->pcon_config.dsc_enc.bpp_x16);
+
 		drm_printf(&p, "sdp split: %s\n",
 			   str_enabled_disabled(pipe_config->sdp_split_enable));
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 90a5d29169c6..429a071afad5 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -978,6 +978,25 @@ enum intel_output_format {
 	INTEL_OUTPUT_FORMAT_YCBCR444,
 };
 
+enum intel_pcon_dsc_op {
+	/* The PCON does not take part in DSC, also used when there is no HDMI 2.1 PCON */
+	INTEL_PCON_NO_DSC,
+	/* PCON decodes the DSC stream from the DP link, HDMI link is uncompressed */
+	INTEL_PCON_DSC_DECODE,
+	/* PCON forwards the DSC 1.2a stream to the HDMI sink as is */
+	INTEL_PCON_DSC_PASSTHROUGH,
+	/* PCON decodes a DSC 1.1 stream and encodes DSC 1.2a for the HDMI sink */
+	INTEL_PCON_DSC_DECODE_ENCODE,
+};
+
+/* PCON DSC encoder PPS override parameters */
+struct intel_pcon_dsc_enc_config {
+	u16 slice_height;
+	u16 slice_width;
+	/* Compressed Bpp in U6.4 format */
+	u16 bpp_x16;
+};
+
 /* Used by dp and fdi links */
 struct intel_link_m_n {
 	u32 tu;
@@ -1380,6 +1399,16 @@ struct intel_crtc_state {
 		struct drm_dsc_config config;
 	} dsc;
 
+	/*
+	 * Configuration of a DP->HDMI PCON. Only used for state computation,
+	 * not read out from the HW.
+	 */
+	struct {
+		enum intel_pcon_dsc_op dsc_op;
+		/* Only valid for INTEL_PCON_DSC_DECODE_ENCODE */
+		struct intel_pcon_dsc_enc_config dsc_enc;
+	} pcon_config;
+
 	/* DP tunnel used for BW allocation. */
 	struct drm_dp_tunnel_ref dp_tunnel_ref;
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0e32e0f0789a..6412248e9dcc 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2514,6 +2514,7 @@ void intel_dp_dsc_reset_config(struct intel_crtc_state *crtc_state)
 
 	memset(&crtc_state->dsc.slice_config, 0, sizeof(crtc_state->dsc.slice_config));
 	memset(&crtc_state->dsc.config, 0, sizeof(crtc_state->dsc.config));
+	memset(&crtc_state->pcon_config, 0, sizeof(crtc_state->pcon_config));
 }
 
 int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
-- 
2.50.1

