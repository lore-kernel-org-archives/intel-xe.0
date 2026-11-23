Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA913606A321
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 22:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eMuASnJq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF2F10EFDA;
	Mon, 23 Nov 2026 22:52:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85FC10ECB4;
 Mon, 23 Nov 2026 22:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795474318; x=1827010318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=McW3rEywLbUyL1pkfHycydQIuTvBnyIYwlTe0Gzsjtk=;
 b=eMuASnJq4mVbZ9UU5UGl+r0Ou06ZrGA63zlkP2Heo25KoBUThpQJzCxN
 CiMrv1bFox/gDFcnEW/O0gQ4UOxmTHKnOkm1UTIYl+p1aAwcuexcwg6/G
 NzmE1gorkYNRa9OCzHLdCAnneWH0drqZSPf9H0nf1zcmOpXQncu55Pkej
 yWo7xY++glqJEvnAulyNfmlOxT58mOXP/HLxLfkdAzfSCg0tbU6cbdBKF
 iyFH16W12AlMEj+voXTqOFYe5B2NOzOzS8mLQdjcdMwKWM6/gdETylR/q
 6tP6hKyHB+hT/UTL/wEqpQ6RZTmXEe1YOQdZAup1hIwdqe7n/lPVCK4Mv w==;
X-CSE-ConnectionGUID: 2PBWCnyQTciv6Rsaf0vRFA==
X-CSE-MsgGUID: cbmlumjiRK6fqp5tHKdp2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4147449"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4147449"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 14:51:57 -0800
X-CSE-ConnectionGUID: flfMjPBNSrCmMls4LwXQhw==
X-CSE-MsgGUID: MJJM4zLYSrWNdr0bnNl1IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11830741"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.100])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 14:51:56 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/9] drm/i915/hdmi: Pass the full atomic state to
 intel_hdmi_bpc_possible()
Date: Tue, 24 Nov 2026 00:51:33 +0200
Message-ID: <20261123225139.23087-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123225139.23087-1-ville.syrjala@linux.intel.com>
References: <20261123225139.23087-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Stop looking at the crtc_state->uapi.state footgun in
intel_hdmi_bpc_possible(). Pass the full atomic state
all the way from the top. Quite a few layers to get
through here.

The crtc_state->uapi.state pointer is only valid up to
swap_state() after which it becomes NULL. Thus any code
using it cannot be reused between atomic_check() and
atomic_commit(). It's best if people just forget that
the pointer even exists. Then they are forced to pass in
the atomic state explicitly, thus guaranteeing its existence.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/g4x_hdmi.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_ddi.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c     | 32 ++++++------
 drivers/gpu/drm/i915/display/intel_dp.h     |  3 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 20 ++++----
 drivers/gpu/drm/i915/display/intel_hdmi.c   | 56 ++++++++++++---------
 drivers/gpu/drm/i915/display/intel_hdmi.h   |  7 ++-
 7 files changed, 71 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/g4x_hdmi.c b/drivers/gpu/drm/i915/display/g4x_hdmi.c
index 4c33aa1d1d32..047e3d637365 100644
--- a/drivers/gpu/drm/i915/display/g4x_hdmi.c
+++ b/drivers/gpu/drm/i915/display/g4x_hdmi.c
@@ -143,7 +143,7 @@ static int g4x_hdmi_compute_config(struct intel_atomic_state *state,
 		crtc_state->has_hdmi_sink =
 			intel_hdmi_compute_has_hdmi_sink(encoder, crtc_state, conn_state);
 
-	return intel_hdmi_compute_config(encoder, crtc_state, conn_state);
+	return intel_hdmi_compute_config(state, encoder, crtc_state, conn_state);
 }
 
 static void intel_hdmi_get_config(struct intel_encoder *encoder,
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 504265fd2671..25e8dedd1709 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4550,7 +4550,7 @@ static int intel_ddi_compute_config(struct intel_atomic_state *state,
 		pipe_config->has_hdmi_sink =
 			intel_hdmi_compute_has_hdmi_sink(encoder, pipe_config, conn_state);
 
-		ret = intel_hdmi_compute_config(encoder, pipe_config, conn_state);
+		ret = intel_hdmi_compute_config(state, encoder, pipe_config, conn_state);
 	} else {
 		ret = intel_dp_compute_config(state, encoder, pipe_config, conn_state);
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2647c3df18f9..5fd2626ec31e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1723,7 +1723,8 @@ bool intel_dp_supports_dsc(struct intel_dp *intel_dp,
 	return intel_dsc_source_support(crtc_state);
 }
 
-static int intel_dp_hdmi_compute_bpc(struct intel_dp *intel_dp,
+static int intel_dp_hdmi_compute_bpc(struct intel_atomic_state *state,
+				     struct intel_dp *intel_dp,
 				     const struct intel_crtc_state *crtc_state,
 				     int bpc, bool respect_downstream_limits)
 {
@@ -1745,7 +1746,7 @@ static int intel_dp_hdmi_compute_bpc(struct intel_dp *intel_dp,
 		bpc = 8;
 
 	for (; bpc >= 8; bpc -= 2) {
-		if (intel_hdmi_bpc_possible(crtc_state, bpc,
+		if (intel_hdmi_bpc_possible(state, crtc_state, bpc,
 					    intel_dp_has_hdmi_sink(intel_dp)) &&
 		    intel_dp_tmds_clock_valid(intel_dp, clock, bpc, crtc_state->sink_format,
 					      respect_downstream_limits) == MODE_OK)
@@ -1755,7 +1756,8 @@ static int intel_dp_hdmi_compute_bpc(struct intel_dp *intel_dp,
 	return -EINVAL;
 }
 
-static int intel_dp_max_bpp(struct intel_dp *intel_dp,
+static int intel_dp_max_bpp(struct intel_atomic_state *state,
+			    struct intel_dp *intel_dp,
 			    const struct intel_crtc_state *crtc_state,
 			    bool respect_downstream_limits)
 {
@@ -1771,8 +1773,8 @@ static int intel_dp_max_bpp(struct intel_dp *intel_dp,
 	if (intel_dp->dfp.min_tmds_clock) {
 		int max_hdmi_bpc;
 
-		max_hdmi_bpc = intel_dp_hdmi_compute_bpc(intel_dp, crtc_state, bpc,
-							 respect_downstream_limits);
+		max_hdmi_bpc = intel_dp_hdmi_compute_bpc(state, intel_dp, crtc_state,
+							 bpc, respect_downstream_limits);
 		if (max_hdmi_bpc < 0)
 			return 0;
 
@@ -2830,7 +2832,8 @@ intel_dp_compute_m_n_ratio_limits(struct intel_dp *intel_dp,
 }
 
 bool
-intel_dp_compute_config_limits(struct intel_dp *intel_dp,
+intel_dp_compute_config_limits(struct intel_atomic_state *state,
+			       struct intel_dp *intel_dp,
 			       struct drm_connector_state *conn_state,
 			       struct intel_crtc_state *crtc_state,
 			       bool respect_downstream_limits,
@@ -2857,7 +2860,8 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 		 */
 		limits->pipe.max_bpp = min(crtc_state->max_pipe_bpp, 24);
 	} else {
-		limits->pipe.max_bpp = intel_dp_max_bpp(intel_dp, crtc_state,
+		limits->pipe.max_bpp = intel_dp_max_bpp(state, intel_dp,
+							crtc_state,
 							respect_downstream_limits);
 	}
 
@@ -3006,10 +3010,10 @@ intel_dp_compute_link_for_joined_pipes(struct intel_atomic_state *state,
 	joiner_needs_dsc = intel_dp_joiner_needs_dsc(display, num_joined_pipes);
 
 	dsc_needed = joiner_needs_dsc || intel_dp->force_dsc_en ||
-		     !intel_dp_compute_config_limits(intel_dp, conn_state, pipe_config,
-						     respect_downstream_limits,
-						     false,
-						     &limits);
+		!intel_dp_compute_config_limits(state, intel_dp,
+						conn_state, pipe_config,
+						respect_downstream_limits,
+						false, &limits);
 
 	if (!dsc_needed) {
 		/*
@@ -3047,10 +3051,10 @@ intel_dp_compute_link_for_joined_pipes(struct intel_atomic_state *state,
 			    str_yes_no(ret), str_yes_no(joiner_needs_dsc),
 			    str_yes_no(intel_dp->force_dsc_en));
 
-		if (!intel_dp_compute_config_limits(intel_dp, conn_state, pipe_config,
+		if (!intel_dp_compute_config_limits(state, intel_dp,
+						    conn_state, pipe_config,
 						    respect_downstream_limits,
-						    true,
-						    &limits))
+						    true, &limits))
 			return -EINVAL;
 
 		ret = intel_dp_dsc_compute_config(state, intel_dp,
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 1e14e6b1d0f3..92794612c0bc 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -197,7 +197,8 @@ void intel_dp_wait_source_oui(struct intel_dp *intel_dp);
 int intel_dp_output_format_link_bpp_x16(enum intel_output_format output_format,
 					int pipe_bpp);
 
-bool intel_dp_compute_config_limits(struct intel_dp *intel_dp,
+bool intel_dp_compute_config_limits(struct intel_atomic_state *state,
+				    struct intel_dp *intel_dp,
 				    struct drm_connector_state *conn_state,
 				    struct intel_crtc_state *crtc_state,
 				    bool respect_downstream_limits,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index d315aa45de62..0d9f0b653fba 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -622,7 +622,8 @@ adjust_limits_for_dsc_hblank_expansion_quirk(struct intel_dp *intel_dp,
 }
 
 static bool
-mst_stream_compute_config_limits(struct intel_dp *intel_dp,
+mst_stream_compute_config_limits(struct intel_atomic_state *state,
+				 struct intel_dp *intel_dp,
 				 struct drm_connector_state *conn_state,
 				 struct intel_crtc_state *crtc_state,
 				 bool dsc,
@@ -631,9 +632,9 @@ mst_stream_compute_config_limits(struct intel_dp *intel_dp,
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
 
-	if (!intel_dp_compute_config_limits(intel_dp, conn_state,
-					    crtc_state, false, dsc,
-					    limits))
+	if (!intel_dp_compute_config_limits(state, intel_dp,
+					    conn_state, crtc_state,
+					    false, dsc, limits))
 		return false;
 
 	return adjust_limits_for_dsc_hblank_expansion_quirk(intel_dp,
@@ -664,8 +665,9 @@ static int mst_stream_compute_link_for_joined_pipes(struct intel_atomic_state *s
 	joiner_needs_dsc = intel_dp_joiner_needs_dsc(display, num_joined_pipes);
 
 	dsc_needed = joiner_needs_dsc || intel_dp->force_dsc_en ||
-		!mst_stream_compute_config_limits(intel_dp, conn_state,
-						  pipe_config, false, &limits);
+		!mst_stream_compute_config_limits(state, intel_dp,
+						  conn_state, pipe_config,
+						  false, &limits);
 
 	if (!dsc_needed) {
 		ret = mst_stream_compute_link_config(state, intel_dp,
@@ -698,9 +700,9 @@ static int mst_stream_compute_link_for_joined_pipes(struct intel_atomic_state *s
 			    str_yes_no(intel_dp->force_dsc_en));
 
 
-		if (!mst_stream_compute_config_limits(intel_dp, conn_state,
-						      pipe_config, true,
-						      &limits))
+		if (!mst_stream_compute_config_limits(state, intel_dp,
+						      conn_state, pipe_config,
+						      true, &limits))
 			return -EINVAL;
 
 		/*
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 66149aff7993..385393c94f7d 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2130,10 +2130,10 @@ intel_hdmi_mode_valid(struct drm_connector *_connector,
 	return intel_mode_valid_max_plane_size(display, mode, 1);
 }
 
-bool intel_hdmi_bpc_possible(const struct intel_crtc_state *crtc_state,
+bool intel_hdmi_bpc_possible(struct intel_atomic_state *state,
+			     const struct intel_crtc_state *crtc_state,
 			     int bpc, bool has_hdmi_sink)
 {
-	struct intel_atomic_state *state = to_intel_atomic_state(crtc_state->uapi.state);
 	struct intel_digital_connector_state *connector_state;
 	struct intel_connector *connector;
 	int i;
@@ -2150,7 +2150,8 @@ bool intel_hdmi_bpc_possible(const struct intel_crtc_state *crtc_state,
 	return true;
 }
 
-static bool hdmi_bpc_possible(const struct intel_crtc_state *crtc_state, int bpc)
+static bool hdmi_bpc_possible(struct intel_atomic_state *state,
+			      const struct intel_crtc_state *crtc_state, int bpc)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	const struct drm_display_mode *adjusted_mode =
@@ -2166,10 +2167,12 @@ static bool hdmi_bpc_possible(const struct intel_crtc_state *crtc_state, int bpc
 	     adjusted_mode->crtc_hblank_start) % 8 == 2)
 		return false;
 
-	return intel_hdmi_bpc_possible(crtc_state, bpc, crtc_state->has_hdmi_sink);
+	return intel_hdmi_bpc_possible(state, crtc_state, bpc,
+				       crtc_state->has_hdmi_sink);
 }
 
-static int intel_hdmi_compute_bpc(struct intel_encoder *encoder,
+static int intel_hdmi_compute_bpc(struct intel_atomic_state *state,
+				  struct intel_encoder *encoder,
 				  struct intel_crtc_state *crtc_state,
 				  int clock, bool respect_downstream_limits)
 {
@@ -2194,7 +2197,7 @@ static int intel_hdmi_compute_bpc(struct intel_encoder *encoder,
 		int tmds_clock = intel_hdmi_tmds_clock(clock, bpc,
 						       crtc_state->sink_format);
 
-		if (hdmi_bpc_possible(crtc_state, bpc) &&
+		if (hdmi_bpc_possible(state, crtc_state, bpc) &&
 		    hdmi_port_clock_valid(intel_hdmi, tmds_clock,
 					  respect_downstream_limits,
 					  crtc_state->has_hdmi_sink) == MODE_OK)
@@ -2204,7 +2207,8 @@ static int intel_hdmi_compute_bpc(struct intel_encoder *encoder,
 	return -EINVAL;
 }
 
-static int intel_hdmi_compute_clock(struct intel_encoder *encoder,
+static int intel_hdmi_compute_clock(struct intel_atomic_state *state,
+				    struct intel_encoder *encoder,
 				    struct intel_crtc_state *crtc_state,
 				    bool respect_downstream_limits)
 {
@@ -2216,8 +2220,8 @@ static int intel_hdmi_compute_clock(struct intel_encoder *encoder,
 	if (adjusted_mode->flags & DRM_MODE_FLAG_DBLCLK)
 		clock *= 2;
 
-	bpc = intel_hdmi_compute_bpc(encoder, crtc_state, clock,
-				     respect_downstream_limits);
+	bpc = intel_hdmi_compute_bpc(state, encoder, crtc_state,
+				     clock, respect_downstream_limits);
 	if (bpc < 0)
 		return bpc;
 
@@ -2289,7 +2293,8 @@ intel_hdmi_output_format(const struct intel_crtc_state *crtc_state)
 	return crtc_state->sink_format;
 }
 
-static int intel_hdmi_compute_output_format(struct intel_encoder *encoder,
+static int intel_hdmi_compute_output_format(struct intel_atomic_state *state,
+					    struct intel_encoder *encoder,
 					    struct intel_crtc_state *crtc_state,
 					    struct intel_connector *connector,
 					    bool respect_downstream_limits,
@@ -2304,10 +2309,12 @@ static int intel_hdmi_compute_output_format(struct intel_encoder *encoder,
 	crtc_state->sink_format = sink_format;
 	crtc_state->output_format = intel_hdmi_output_format(crtc_state);
 
-	return intel_hdmi_compute_clock(encoder, crtc_state, respect_downstream_limits);
+	return intel_hdmi_compute_clock(state, encoder, crtc_state,
+					respect_downstream_limits);
 }
 
-static int intel_hdmi_compute_formats(struct intel_encoder *encoder,
+static int intel_hdmi_compute_formats(struct intel_atomic_state *state,
+				      struct intel_encoder *encoder,
 				      struct intel_crtc_state *crtc_state,
 				      const struct drm_connector_state *conn_state,
 				      bool respect_downstream_limits)
@@ -2319,26 +2326,26 @@ static int intel_hdmi_compute_formats(struct intel_encoder *encoder,
 	int ret;
 
 	if (drm_mode_is_420_only(info, adjusted_mode)) {
-		ret = intel_hdmi_compute_output_format(encoder, crtc_state, connector,
-						       respect_downstream_limits,
+		ret = intel_hdmi_compute_output_format(state, encoder, crtc_state,
+						       connector, respect_downstream_limits,
 						       INTEL_OUTPUT_FORMAT_YCBCR420);
 
 		if (ret && !respect_downstream_limits) {
 			drm_dbg_kms(display->drm,
 				    "YCbCr 4:2:0 mode but YCbCr 4:2:0 output not possible. Falling back to RGB.\n");
 
-			ret = intel_hdmi_compute_output_format(encoder, crtc_state, connector,
-							       respect_downstream_limits,
+			ret = intel_hdmi_compute_output_format(state, encoder, crtc_state,
+							       connector, respect_downstream_limits,
 							       INTEL_OUTPUT_FORMAT_RGB);
 		}
 	} else {
-		ret = intel_hdmi_compute_output_format(encoder, crtc_state, connector,
-						       respect_downstream_limits,
+		ret = intel_hdmi_compute_output_format(state, encoder, crtc_state,
+						       connector, respect_downstream_limits,
 						       INTEL_OUTPUT_FORMAT_RGB);
 
 		if (ret && drm_mode_is_420_also(info, adjusted_mode))
-			ret = intel_hdmi_compute_output_format(encoder, crtc_state, connector,
-							       respect_downstream_limits,
+			ret = intel_hdmi_compute_output_format(state, encoder, crtc_state,
+							       connector, respect_downstream_limits,
 							       INTEL_OUTPUT_FORMAT_YCBCR420);
 	}
 
@@ -2380,7 +2387,8 @@ bool intel_hdmi_compute_has_hdmi_sink(struct intel_encoder *encoder,
 		!intel_hdmi_is_cloned(crtc_state);
 }
 
-int intel_hdmi_compute_config(struct intel_encoder *encoder,
+int intel_hdmi_compute_config(struct intel_atomic_state *state,
+			      struct intel_encoder *encoder,
 			      struct intel_crtc_state *pipe_config,
 			      struct drm_connector_state *conn_state)
 {
@@ -2412,9 +2420,11 @@ int intel_hdmi_compute_config(struct intel_encoder *encoder,
 	 * Try to respect downstream TMDS clock limits first, if
 	 * that fails assume the user might know something we don't.
 	 */
-	ret = intel_hdmi_compute_formats(encoder, pipe_config, conn_state, true);
+	ret = intel_hdmi_compute_formats(state, encoder,
+					 pipe_config, conn_state, true);
 	if (ret)
-		ret = intel_hdmi_compute_formats(encoder, pipe_config, conn_state, false);
+		ret = intel_hdmi_compute_formats(state, encoder,
+						 pipe_config, conn_state, false);
 	if (ret) {
 		drm_dbg_kms(display->drm,
 			    "unsupported HDMI clock (%d kHz), rejecting mode\n",
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
index c95ed37bcc0c..f9c21abbe609 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.h
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
@@ -15,6 +15,7 @@ struct drm_connector;
 struct drm_connector_state;
 struct drm_display_mode;
 struct drm_encoder;
+struct intel_atomic_state;
 struct intel_connector;
 struct intel_crtc_state;
 struct intel_digital_port;
@@ -27,7 +28,8 @@ bool intel_hdmi_init_connector(struct intel_digital_port *dig_port,
 bool intel_hdmi_compute_has_hdmi_sink(struct intel_encoder *encoder,
 				      const struct intel_crtc_state *crtc_state,
 				      const struct drm_connector_state *conn_state);
-int intel_hdmi_compute_config(struct intel_encoder *encoder,
+int intel_hdmi_compute_config(struct intel_atomic_state *state,
+			      struct intel_encoder *encoder,
 			      struct intel_crtc_state *pipe_config,
 			      struct drm_connector_state *conn_state);
 void intel_hdmi_encoder_shutdown(struct intel_encoder *encoder);
@@ -51,7 +53,8 @@ void intel_read_infoframe(struct intel_encoder *encoder,
 			  union hdmi_infoframe *frame);
 bool intel_hdmi_limited_color_range(const struct intel_crtc_state *crtc_state,
 				    const struct drm_connector_state *conn_state);
-bool intel_hdmi_bpc_possible(const struct intel_crtc_state *crtc_state,
+bool intel_hdmi_bpc_possible(struct intel_atomic_state *state,
+			     const struct intel_crtc_state *crtc_state,
 			     int bpc, bool has_hdmi_sink);
 int intel_hdmi_tmds_clock(int clock, int bpc, enum intel_output_format sink_format);
 int intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width,
-- 
2.56.1

