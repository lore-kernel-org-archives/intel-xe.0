Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C386606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SfI9RCDD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511BF112AD6;
	Fri, 20 Nov 2026 14:24:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2079112AC1;
 Fri, 20 Nov 2026 14:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184639; x=1826720639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HHon3Hl6Z39L+yQbY9Jj0Pzj2I018LznD8RuBLyN7O0=;
 b=SfI9RCDDeQnB7MVcRR0wVT/ru2s9dFP0bnbbZwIx11F92Jg6iqBvXwb3
 tfx3MF/ZY2osS2sGKhhBl4lT2d/XUNzAd7qB5IEjxwtpEVuazsE6cT+SV
 7mvemKQo6zy8BqEvuDalJtj7ofWaW6whG10LUGSIb4HlFw/FnmUYoBQL8
 OK2h19KLD4aUqzq29QXG7jTD8lUQRIHTtRkhT7U47sbhOXgJoHQe8N7vd
 fu36BZxU9dLXKKGqGktrQbgFECBdFZLj2F3BhZUMLHMOObh7+29X/3esh
 nmtSTv+Ktlks7CsOVSVEnbDCwwQsP9bpUGeDrvBrRGTqBnyHFzxZziwFu Q==;
X-CSE-ConnectionGUID: OAXDNat9R7q1shS5ryRgmg==
X-CSE-MsgGUID: z4GBPndvRaG7IHlwS2limA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4091005"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4091005"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:41 -0800
X-CSE-ConnectionGUID: PkQn5ld2RUyXL5Z/UyQjjA==
X-CSE-MsgGUID: IWid7UKbTkCovWLHO+i1dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12422044"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:40 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 19/29] drm/i915/dp: Store the PCON FRL rate in the crtc state
Date: Fri, 20 Nov 2026 19:37:19 +0530
Message-ID: <20261120140729.466177-20-ankit.k.nautiyal@intel.com>
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

The FRL training derives the max rate to train the HDMI link at from the
capabilities of the PCON and the HDMI sink, regardless of the stream
that is going to be sent. The rate the stream needs can depend on the
PCON DSC operation, which is only known once the DP link is computed.

Compute the FRL rate together with the PCON DSC operation, store it in
the crtc state and train the link at that rate. For now this is still
the lower of the PCON and sink max rates, so there is no change in
behavior.

A link that is already trained is kept only if it was trained at least
at the rate the new stream needs, otherwise train it again.

Assisted-by: LLM
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/g4x_dp.c         |  2 +-
 .../drm/i915/display/intel_crtc_state_dump.c  |  5 ++-
 drivers/gpu/drm/i915/display/intel_ddi.c      |  4 +-
 .../drm/i915/display/intel_display_types.h    |  2 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 38 +++++++++++--------
 drivers/gpu/drm/i915/display/intel_dp.h       |  3 +-
 6 files changed, 33 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/g4x_dp.c b/drivers/gpu/drm/i915/display/g4x_dp.c
index b867443ff227..f8ac6d51f6ff 100644
--- a/drivers/gpu/drm/i915/display/g4x_dp.c
+++ b/drivers/gpu/drm/i915/display/g4x_dp.c
@@ -709,7 +709,7 @@ static void intel_enable_dp(struct intel_atomic_state *state,
 
 	intel_dp_set_power(intel_dp, DP_SET_POWER_D0);
 	intel_dp_configure_protocol_converter(intel_dp, pipe_config);
-	intel_dp_check_frl_training(intel_dp);
+	intel_dp_check_frl_training(intel_dp, pipe_config);
 	intel_dp_pcon_dsc_configure(intel_dp, pipe_config);
 	intel_dp_start_link_train(state, intel_dp, pipe_config);
 	intel_dp_stop_link_train(intel_dp, pipe_config);
diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 51e8f3688362..3c803371e54a 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -250,8 +250,9 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 			   str_enabled_disabled(pipe_config->fec_enable),
 			   str_enabled_disabled(pipe_config->enhanced_framing));
 
-		drm_printf(&p, "pcon: dsc op %s\n",
-			   pcon_dsc_op_str[pipe_config->pcon_config.dsc_op]);
+		drm_printf(&p, "pcon: dsc op %s, frl rate: %d Gbps\n",
+			   pcon_dsc_op_str[pipe_config->pcon_config.dsc_op],
+			   pipe_config->pcon_config.frl_rate_gbps);
 		if (pipe_config->pcon_config.dsc_op == INTEL_PCON_DSC_DECODE_ENCODE)
 			drm_printf(&p,
 				   "pcon dsc encoder: slice height: %u, slice width: %u, bpp_x16: %u\n",
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index e21c237b39f4..f8357574710c 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2714,7 +2714,7 @@ static void mtl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	 */
 	intel_dp_sink_set_fec_ready(intel_dp, crtc_state, true);
 
-	intel_dp_check_frl_training(intel_dp);
+	intel_dp_check_frl_training(intel_dp, crtc_state);
 	intel_dp_pcon_dsc_configure(intel_dp, crtc_state);
 
 	/*
@@ -2876,7 +2876,7 @@ static void tgl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	 */
 	intel_dp_sink_set_fec_ready(intel_dp, crtc_state, true);
 
-	intel_dp_check_frl_training(intel_dp);
+	intel_dp_check_frl_training(intel_dp, crtc_state);
 	intel_dp_pcon_dsc_configure(intel_dp, crtc_state);
 
 	/*
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 429a071afad5..20f3b29f6e17 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1407,6 +1407,8 @@ struct intel_crtc_state {
 		enum intel_pcon_dsc_op dsc_op;
 		/* Only valid for INTEL_PCON_DSC_DECODE_ENCODE */
 		struct intel_pcon_dsc_enc_config dsc_enc;
+		/* Max FRL rate in Gbps to train the HDMI link at, 0 if no FRL */
+		int frl_rate_gbps;
 	} pcon_config;
 
 	/* DP tunnel used for BW allocation. */
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 61c2917e4b91..ff6fb5eca166 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3101,6 +3101,9 @@ intel_dp_pcon_compute_config(struct intel_dp *intel_dp,
 	if (!intel_dp_is_hdmi_2_1_sink(intel_dp))
 		return 0;
 
+	crtc_state->pcon_config.frl_rate_gbps =
+		min(intel_dp->dfp.pcon_max_frl_bw, intel_dp_hdmi_sink_max_frl(intel_dp));
+
 	if (crtc_state->dsc.compression_enable)
 		crtc_state->pcon_config.dsc_op = INTEL_PCON_DSC_DECODE;
 
@@ -4510,23 +4513,19 @@ intel_dp_pcon_is_frl_trained(struct intel_dp *intel_dp,
 	return false;
 }
 
-static int intel_dp_pcon_start_frl_training(struct intel_dp *intel_dp)
+static int intel_dp_pcon_start_frl_training(struct intel_dp *intel_dp,
+					    const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
 #define TIMEOUT_FRL_READY_MS 500
 #define TIMEOUT_HDMI_LINK_ACTIVE_MS 1000
-	int max_frl_bw, max_pcon_frl_bw, max_edid_frl_bw, ret;
+	int max_frl_bw, ret;
 	u8 max_frl_bw_mask = 0, frl_trained_mask;
 	bool is_active;
 
-	max_pcon_frl_bw = intel_dp->dfp.pcon_max_frl_bw;
-	drm_dbg(display->drm, "PCON max rate = %d Gbps\n", max_pcon_frl_bw);
-
-	max_edid_frl_bw = intel_dp_hdmi_sink_max_frl(intel_dp);
-	drm_dbg(display->drm, "Sink max rate from EDID = %d Gbps\n",
-		max_edid_frl_bw);
-
-	max_frl_bw = min(max_edid_frl_bw, max_pcon_frl_bw);
+	max_frl_bw = crtc_state->pcon_config.frl_rate_gbps;
+	drm_dbg(display->drm, "FRL max rate = %d Gbps (PCON max rate = %d Gbps)\n",
+		max_frl_bw, intel_dp->dfp.pcon_max_frl_bw);
 
 	if (max_frl_bw <= 0)
 		return -EINVAL;
@@ -4610,7 +4609,8 @@ int intel_dp_pcon_set_tmds_mode(struct intel_dp *intel_dp)
 	return 0;
 }
 
-void intel_dp_check_frl_training(struct intel_dp *intel_dp)
+void intel_dp_check_frl_training(struct intel_dp *intel_dp,
+				 const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
 
@@ -4620,11 +4620,15 @@ void intel_dp_check_frl_training(struct intel_dp *intel_dp)
 	 * -sink is HDMI2.1
 	 */
 	if (!(intel_dp->downstream_ports[2] & DP_PCON_SOURCE_CTL_MODE) ||
-	    !intel_dp_is_hdmi_2_1_sink(intel_dp) ||
-	    intel_dp->frl.is_trained)
+	    !intel_dp_is_hdmi_2_1_sink(intel_dp))
 		return;
 
-	if (intel_dp_pcon_start_frl_training(intel_dp) < 0) {
+	/* A link trained at a lower rate than the stream needs has to be retrained */
+	if (intel_dp->frl.is_trained &&
+	    intel_dp->frl.trained_rate_gbps >= crtc_state->pcon_config.frl_rate_gbps)
+		return;
+
+	if (intel_dp_pcon_start_frl_training(intel_dp, crtc_state) < 0) {
 		int ret, mode;
 
 		drm_dbg(display->drm,
@@ -4649,6 +4653,7 @@ int intel_dp_pcon_frl_recover(struct intel_encoder *encoder,
 {
 	struct intel_display *display = to_intel_display(encoder);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
+	struct intel_crtc *crtc;
 	u8 pipe_mask;
 	int ret;
 
@@ -4671,7 +4676,10 @@ int intel_dp_pcon_frl_recover(struct intel_encoder *encoder,
 	if (pipe_mask == 0)
 		return 0;
 
-	intel_dp_check_frl_training(intel_dp);
+	/* The stream is on the pipe of the connector's CRTC, locked above */
+	crtc = intel_crtc_for_pipe(display, ffs(pipe_mask) - 1);
+
+	intel_dp_check_frl_training(intel_dp, to_intel_crtc_state(crtc->base.state));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 070f6229cc39..83954c2c28e6 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -187,7 +187,8 @@ bool intel_dp_initial_fastset_check(struct intel_encoder *encoder,
 void intel_dp_sync_state(struct intel_encoder *encoder,
 			 const struct intel_crtc_state *crtc_state);
 
-void intel_dp_check_frl_training(struct intel_dp *intel_dp);
+void intel_dp_check_frl_training(struct intel_dp *intel_dp,
+				 const struct intel_crtc_state *crtc_state);
 int intel_dp_pcon_frl_recover(struct intel_encoder *encoder,
 			      struct drm_modeset_acquire_ctx *ctx);
 void intel_dp_pcon_dsc_configure(struct intel_dp *intel_dp,
-- 
2.50.1

