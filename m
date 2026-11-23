Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B7B606A321
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 22:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z6ABM/S/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FEE10ECAB;
	Mon, 23 Nov 2026 22:52:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA77710ECAB;
 Mon, 23 Nov 2026 22:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795474314; x=1827010314;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5HrREnUDnjsW5Kv844DrW75oqUSLYL5qCRlMfq8HhBY=;
 b=Z6ABM/S/lw7vE9KiF+LjeK50uTAw/EQO2PLOhXe7R3ZGUc/91JFKnF3L
 oUABzjdyKeulDkAWYyGIpTnpTuH9B9O7c+tYNjVBjVPYrTZYDcmrtjyy0
 HrhxAuUuliOFsBbM+wlbuwwUwRFeBk76ssOFNStRS7B4oW2+c0Y4NmFER
 sHWV6dmhJPinC9mNHVaCBQIiZqeRBYIzXYJ2tqOr09a/FfsczMGtjoCfs
 6JO8ePiUX/OYFyXOdkITgfqXLQQX97Fr/RIbh4U97TcsQWr9qpdCse0oc
 5+RQ3TxfgsXeN0Sy73J4Wg0V7mxJZsjl3g4BSnPy/gAl83LMBFpZWMzPG g==;
X-CSE-ConnectionGUID: cCjoYGwQSZSAZ46c02Solg==
X-CSE-MsgGUID: bMsKPKVaR6mKwUp9Vh5kTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4147444"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4147444"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 14:51:53 -0800
X-CSE-ConnectionGUID: ecdA/U7LRmaKto5RxgLxPw==
X-CSE-MsgGUID: lcZMizDCRo2THyTRshHO1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11830732"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.100])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 14:51:51 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/9] drm/i915/mst: Pass the full atomic state to
 intel_dp_mtp_tu_compute_config()
Date: Tue, 24 Nov 2026 00:51:32 +0200
Message-ID: <20261123225139.23087-3-ville.syrjala@linux.intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Stop looking at the crtc_state->uapi.state footgun in
intel_dp_mtp_tu_compute_config(). Pass the full atomic
state all the way from the top. Quite a few layers to
get through here.

The crtc_state->uapi.state pointer is only valid up to
swap_state() after which it becomes NULL. Thus any code
using it cannot be reused between atomic_check() and
atomic_commit(). It's best if people just forget that
the pointer even exists. Then they are forced to pass in
the atomic state explicitly, thus guaranteeing its existence.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 77 +++++++++++++--------
 drivers/gpu/drm/i915/display/intel_dp.h     |  3 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 43 +++++++-----
 drivers/gpu/drm/i915/display/intel_dp_mst.h |  3 +-
 4 files changed, 77 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ef164a797618..2647c3df18f9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2062,7 +2062,8 @@ static bool is_bw_sufficient_for_dsc_config(struct intel_dp *intel_dp,
 	return available_bw >= required_bw;
 }
 
-static int dsc_compute_link_config(struct intel_dp *intel_dp,
+static int dsc_compute_link_config(struct intel_atomic_state *state,
+				   struct intel_dp *intel_dp,
 				   struct intel_crtc_state *pipe_config,
 				   struct drm_connector_state *conn_state,
 				   const struct link_config_limits *limits,
@@ -2093,7 +2094,8 @@ static int dsc_compute_link_config(struct intel_dp *intel_dp,
 		if (drm_dp_is_uhbr_rate(link_config.rate)) {
 			int ret;
 
-			ret = intel_dp_mtp_tu_compute_config(intel_dp,
+			ret = intel_dp_mtp_tu_compute_config(state,
+							     intel_dp,
 							     pipe_config,
 							     conn_state,
 							     dsc_bpp_x16,
@@ -2325,7 +2327,8 @@ static int align_max_compressed_bpp_x16(const struct intel_connector *connector,
  * Find the max compressed BPP we can find a link configuration for. The BPPs to
  * try depend on the source (platform) and sink.
  */
-static int dsc_compute_compressed_bpp(struct intel_dp *intel_dp,
+static int dsc_compute_compressed_bpp(struct intel_atomic_state *state,
+				      struct intel_dp *intel_dp,
 				      struct intel_crtc_state *pipe_config,
 				      struct drm_connector_state *conn_state,
 				      const struct link_config_limits *limits,
@@ -2367,11 +2370,9 @@ static int dsc_compute_compressed_bpp(struct intel_dp *intel_dp,
 		if (!intel_dp_dsc_valid_compressed_bpp(intel_dp, bpp_x16))
 			continue;
 
-		ret = dsc_compute_link_config(intel_dp,
-					      pipe_config,
-					      conn_state,
-					      limits,
-					      bpp_x16);
+		ret = dsc_compute_link_config(state, intel_dp,
+					      pipe_config, conn_state,
+					      limits, bpp_x16);
 		if (ret == 0) {
 			pipe_config->dsc.compressed_bpp_x16 = bpp_x16;
 			if (intel_dp->force_dsc_fractional_bpp_en &&
@@ -2425,7 +2426,8 @@ int intel_dp_force_dsc_pipe_bpp(struct intel_dp *intel_dp,
 	return 0;
 }
 
-static int intel_dp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
+static int intel_dp_dsc_compute_pipe_bpp(struct intel_atomic_state *state,
+					 struct intel_dp *intel_dp,
 					 struct intel_crtc_state *pipe_config,
 					 struct drm_connector_state *conn_state,
 					 const struct link_config_limits *limits)
@@ -2439,7 +2441,8 @@ static int intel_dp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
 	else
 		pipe_bpp = limits->pipe.max_bpp;
 
-	ret = dsc_compute_compressed_bpp(intel_dp, pipe_config, conn_state,
+	ret = dsc_compute_compressed_bpp(state, intel_dp,
+					 pipe_config, conn_state,
 					 limits, pipe_bpp);
 	if (ret)
 		return -EINVAL;
@@ -2482,7 +2485,8 @@ void intel_dp_dsc_reset_config(struct intel_crtc_state *crtc_state)
 	memset(&crtc_state->dsc.config, 0, sizeof(crtc_state->dsc.config));
 }
 
-int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
+int intel_dp_dsc_compute_config(struct intel_atomic_state *state,
+				struct intel_dp *intel_dp,
 				struct intel_crtc_state *pipe_config,
 				struct drm_connector_state *conn_state,
 				const struct link_config_limits *limits,
@@ -2511,8 +2515,9 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 	 * figured out for DP MST DSC.
 	 */
 	if (!is_mst) {
-		ret = intel_dp_dsc_compute_pipe_bpp(intel_dp, pipe_config,
-						    conn_state, limits);
+		ret = intel_dp_dsc_compute_pipe_bpp(state, intel_dp,
+						    pipe_config, conn_state,
+						    limits);
 		if (ret) {
 			drm_dbg_kms(display->drm,
 				    "No Valid pipe bpp for given mode ret = %d\n", ret);
@@ -2979,7 +2984,8 @@ bool intel_dp_joiner_needs_dsc(struct intel_display *display,
 }
 
 static int
-intel_dp_compute_link_for_joined_pipes(struct intel_encoder *encoder,
+intel_dp_compute_link_for_joined_pipes(struct intel_atomic_state *state,
+				       struct intel_encoder *encoder,
 				       struct intel_crtc_state *pipe_config,
 				       struct drm_connector_state *conn_state,
 				       bool respect_downstream_limits)
@@ -3013,9 +3019,8 @@ intel_dp_compute_link_for_joined_pipes(struct intel_encoder *encoder,
 		ret = intel_dp_compute_link_config_wide(intel_dp, pipe_config,
 							conn_state, &limits);
 		if (!ret && intel_dp_is_uhbr(pipe_config))
-			ret = intel_dp_mtp_tu_compute_config(intel_dp,
-							     pipe_config,
-							     conn_state,
+			ret = intel_dp_mtp_tu_compute_config(state, intel_dp,
+							     pipe_config, conn_state,
 							     fxp_q4_from_int(pipe_config->pipe_bpp),
 							     fxp_q4_from_int(pipe_config->pipe_bpp),
 							     0, false);
@@ -3048,8 +3053,9 @@ intel_dp_compute_link_for_joined_pipes(struct intel_encoder *encoder,
 						    &limits))
 			return -EINVAL;
 
-		ret = intel_dp_dsc_compute_config(intel_dp, pipe_config,
-						  conn_state, &limits, 64);
+		ret = intel_dp_dsc_compute_config(state, intel_dp,
+						  pipe_config, conn_state,
+						  &limits, 64);
 		if (ret < 0)
 			return ret;
 
@@ -3078,7 +3084,8 @@ intel_dp_compute_link_for_joined_pipes(struct intel_encoder *encoder,
 }
 
 static int
-intel_dp_compute_link_config(struct intel_encoder *encoder,
+intel_dp_compute_link_config(struct intel_atomic_state *state,
+			     struct intel_encoder *encoder,
 			     struct intel_crtc_state *crtc_state,
 			     struct drm_connector_state *conn_state,
 			     bool respect_downstream_limits)
@@ -3119,7 +3126,8 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
 			crtc_state->joiner_pipes = GENMASK(crtc->pipe + num_joined_pipes - 1,
 							   crtc->pipe);
 
-		ret = intel_dp_compute_link_for_joined_pipes(encoder, crtc_state, conn_state,
+		ret = intel_dp_compute_link_for_joined_pipes(state, encoder,
+							     crtc_state, conn_state,
 							     respect_downstream_limits);
 		if (ret == 0 || ret == -EDEADLK)
 			break;
@@ -3520,7 +3528,8 @@ static bool intel_dp_has_audio(struct intel_encoder *encoder,
 }
 
 static int
-intel_dp_compute_output_format(struct intel_encoder *encoder,
+intel_dp_compute_output_format(struct intel_atomic_state *state,
+			       struct intel_encoder *encoder,
 			       struct intel_crtc_state *crtc_state,
 			       struct drm_connector_state *conn_state,
 			       bool respect_downstream_limits,
@@ -3537,12 +3546,14 @@ intel_dp_compute_output_format(struct intel_encoder *encoder,
 	crtc_state->sink_format = sink_format;
 	crtc_state->output_format = intel_dp_output_format(connector, crtc_state->sink_format);
 
-	return intel_dp_compute_link_config(encoder, crtc_state, conn_state,
+	return intel_dp_compute_link_config(state, encoder,
+					    crtc_state, conn_state,
 					    respect_downstream_limits);
 }
 
 static int
-intel_dp_compute_formats(struct intel_encoder *encoder,
+intel_dp_compute_formats(struct intel_atomic_state *state,
+			 struct intel_encoder *encoder,
 			 struct intel_crtc_state *crtc_state,
 			 struct drm_connector_state *conn_state,
 			 bool respect_downstream_limits)
@@ -3555,7 +3566,8 @@ intel_dp_compute_formats(struct intel_encoder *encoder,
 	int ret;
 
 	if (drm_mode_is_420_only(info, adjusted_mode)) {
-		ret = intel_dp_compute_output_format(encoder, crtc_state, conn_state,
+		ret = intel_dp_compute_output_format(state, encoder,
+						     crtc_state, conn_state,
 						     respect_downstream_limits,
 						     INTEL_OUTPUT_FORMAT_YCBCR420);
 
@@ -3563,17 +3575,20 @@ intel_dp_compute_formats(struct intel_encoder *encoder,
 			drm_dbg_kms(display->drm,
 				    "YCbCr 4:2:0 mode but YCbCr 4:2:0 output not possible. Falling back to RGB.\n");
 
-			ret = intel_dp_compute_output_format(encoder, crtc_state, conn_state,
+			ret = intel_dp_compute_output_format(state, encoder,
+							     crtc_state, conn_state,
 							     respect_downstream_limits,
 							     INTEL_OUTPUT_FORMAT_RGB);
 		}
 	} else {
-		ret = intel_dp_compute_output_format(encoder, crtc_state, conn_state,
+		ret = intel_dp_compute_output_format(state, encoder,
+						     crtc_state, conn_state,
 						     respect_downstream_limits,
 						     INTEL_OUTPUT_FORMAT_RGB);
 
 		if (ret && drm_mode_is_420_also(info, adjusted_mode))
-			ret = intel_dp_compute_output_format(encoder, crtc_state, conn_state,
+			ret = intel_dp_compute_output_format(state, encoder,
+							     crtc_state, conn_state,
 							     respect_downstream_limits,
 							     INTEL_OUTPUT_FORMAT_YCBCR420);
 	}
@@ -3758,9 +3773,11 @@ intel_dp_compute_config(struct intel_atomic_state *state,
 	 * Try to respect downstream TMDS clock limits first, if
 	 * that fails assume the user might know something we don't.
 	 */
-	ret = intel_dp_compute_formats(encoder, pipe_config, conn_state, true);
+	ret = intel_dp_compute_formats(state, encoder,
+				       pipe_config, conn_state, true);
 	if (ret)
-		ret = intel_dp_compute_formats(encoder, pipe_config, conn_state, false);
+		ret = intel_dp_compute_formats(state, encoder,
+					       pipe_config, conn_state, false);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 1f4a3aff9abe..1e14e6b1d0f3 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -81,7 +81,8 @@ int intel_dp_compute_config(struct intel_atomic_state *state,
 bool intel_dp_needs_8b10b_fec(const struct intel_crtc_state *crtc_state,
 			      bool dsc_enabled_on_crtc);
 void intel_dp_dsc_reset_config(struct intel_crtc_state *crtc_state);
-int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
+int intel_dp_dsc_compute_config(struct intel_atomic_state *state,
+				struct intel_dp *intel_dp,
 				struct intel_crtc_state *pipe_config,
 				struct drm_connector_state *conn_state,
 				const struct link_config_limits *limits,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 1e6190689e6b..d315aa45de62 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -246,13 +246,13 @@ static void mst_stream_update_slots(const struct intel_crtc_state *crtc_state,
 	drm_dp_mst_update_slots(topology_state, link_coding_cap);
 }
 
-int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
+int intel_dp_mtp_tu_compute_config(struct intel_atomic_state *state,
+				   struct intel_dp *intel_dp,
 				   struct intel_crtc_state *crtc_state,
 				   struct drm_connector_state *conn_state,
 				   int min_bpp_x16, int max_bpp_x16, int bpp_step_x16, bool dsc)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
-	struct drm_atomic_commit *state = crtc_state->uapi.state;
 	struct drm_dp_mst_topology_state *mst_state = NULL;
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
@@ -275,7 +275,8 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
 	}
 
 	if (is_mst) {
-		mst_state = drm_atomic_get_mst_topology_state(state, &intel_dp->mst.mgr);
+		mst_state = drm_atomic_get_mst_topology_state(&state->base,
+							      &intel_dp->mst.mgr);
 		if (IS_ERR(mst_state))
 			return PTR_ERR(mst_state);
 
@@ -395,7 +396,8 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
 			drm_WARN_ON(display->drm, remote_tu < crtc_state->dp_m_n.tu);
 			crtc_state->dp_m_n.tu = remote_tu;
 
-			slots = drm_dp_atomic_find_time_slots(state, &intel_dp->mst.mgr,
+			slots = drm_dp_atomic_find_time_slots(&state->base,
+							      &intel_dp->mst.mgr,
 							      connector->mst.port,
 							      dfixed_trunc(pbn));
 
@@ -442,7 +444,8 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
 	return 0;
 }
 
-static int mst_stream_compute_link_config(struct intel_dp *intel_dp,
+static int mst_stream_compute_link_config(struct intel_atomic_state *state,
+					  struct intel_dp *intel_dp,
 					  struct intel_crtc_state *crtc_state,
 					  struct drm_connector_state *conn_state,
 					  const struct link_config_limits *limits)
@@ -466,13 +469,15 @@ static int mst_stream_compute_link_config(struct intel_dp *intel_dp,
 	 * FIXME: allocate the BW according to link_bpp, which in the case of
 	 * YUV420 is only half of the pipe bpp value.
 	 */
-	return intel_dp_mtp_tu_compute_config(intel_dp, crtc_state, conn_state,
+	return intel_dp_mtp_tu_compute_config(state, intel_dp,
+					      crtc_state, conn_state,
 					      limits->link.min_bpp_x16,
 					      limits->link.max_bpp_x16,
 					      fxp_q4_from_int(2 * 3), false);
 }
 
-static int mst_stream_dsc_compute_link_config(struct intel_dp *intel_dp,
+static int mst_stream_dsc_compute_link_config(struct intel_atomic_state *state,
+					      struct intel_dp *intel_dp,
 					      struct intel_crtc_state *crtc_state,
 					      struct drm_connector_state *conn_state,
 					      const struct link_config_limits *limits)
@@ -499,7 +504,8 @@ static int mst_stream_dsc_compute_link_config(struct intel_dp *intel_dp,
 	crtc_state->port_clock = max_link_config.rate;
 	crtc_state->lane_count = max_link_config.lane_count;
 
-	return intel_dp_mtp_tu_compute_config(intel_dp, crtc_state, conn_state,
+	return intel_dp_mtp_tu_compute_config(state, intel_dp,
+					      crtc_state, conn_state,
 					      limits->link.min_bpp_x16,
 					      limits->link.max_bpp_x16,
 					      intel_dp_dsc_bpp_step_x16(connector),
@@ -637,7 +643,8 @@ mst_stream_compute_config_limits(struct intel_dp *intel_dp,
 							    dsc);
 }
 
-static int mst_stream_compute_link_for_joined_pipes(struct intel_encoder *encoder,
+static int mst_stream_compute_link_for_joined_pipes(struct intel_atomic_state *state,
+						    struct intel_encoder *encoder,
 						    struct intel_crtc_state *pipe_config,
 						    struct drm_connector_state *conn_state,
 						    int num_joined_pipes)
@@ -661,8 +668,9 @@ static int mst_stream_compute_link_for_joined_pipes(struct intel_encoder *encode
 						  pipe_config, false, &limits);
 
 	if (!dsc_needed) {
-		ret = mst_stream_compute_link_config(intel_dp, pipe_config,
-						     conn_state, &limits);
+		ret = mst_stream_compute_link_config(state, intel_dp,
+						     pipe_config, conn_state,
+						     &limits);
 
 		if (ret == -EDEADLK)
 			return ret;
@@ -707,14 +715,15 @@ static int mst_stream_compute_link_for_joined_pipes(struct intel_encoder *encode
 		 */
 		drm_dbg_kms(display->drm, "Trying to find VCPI slots in DSC mode\n");
 
-		ret = mst_stream_dsc_compute_link_config(intel_dp, pipe_config,
-							 conn_state, &limits);
+		ret = mst_stream_dsc_compute_link_config(state, intel_dp,
+							 pipe_config, conn_state,
+							 &limits);
 		if (ret < 0)
 			return ret;
 
-		ret = intel_dp_dsc_compute_config(intel_dp, pipe_config,
-						  conn_state, &limits,
-						  pipe_config->dp_m_n.tu);
+		ret = intel_dp_dsc_compute_config(state, intel_dp,
+						  pipe_config, conn_state,
+						  &limits, pipe_config->dp_m_n.tu);
 		if (ret)
 			return ret;
 
@@ -773,7 +782,7 @@ static int mst_stream_compute_config(struct intel_atomic_state *state,
 			pipe_config->joiner_pipes = GENMASK(crtc->pipe + num_joined_pipes - 1,
 							    crtc->pipe);
 
-		ret = mst_stream_compute_link_for_joined_pipes(encoder,
+		ret = mst_stream_compute_link_for_joined_pipes(state, encoder,
 							       pipe_config,
 							       conn_state,
 							       num_joined_pipes);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.h b/drivers/gpu/drm/i915/display/intel_dp_mst.h
index 8ce89242c05c..8303e9ff3dc6 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.h
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.h
@@ -33,7 +33,8 @@ bool intel_dp_mst_stream_disconnected(struct intel_atomic_state *state,
 void intel_dp_mst_prepare_probe(struct intel_dp *intel_dp);
 bool intel_dp_mst_verify_dpcd_state(struct intel_dp *intel_dp);
 
-int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
+int intel_dp_mtp_tu_compute_config(struct intel_atomic_state *state,
+				   struct intel_dp *intel_dp,
 				   struct intel_crtc_state *crtc_state,
 				   struct drm_connector_state *conn_state,
 				   int min_bpp_x16, int max_bpp_x16, int bpp_step_x16, bool dsc);
-- 
2.56.1

