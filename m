Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E8860A3804
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 17:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gx8s4u9g
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E2F11294F;
	Fri, 30 Oct 2026 17:13:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7352B112945;
 Fri, 30 Oct 2026 17:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793380426; x=1824916426;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yfdy3J7Zxry28C09uyZ1BFn6PRoJMg75KsrB+XUg2+g=;
 b=gx8s4u9gGa43c7qrvLedPmJhRiuWUiESQaE+YyiI+mQrz8QQLbd2dPlE
 Vx0404bGvV+AU3GZHHblk8Y8lHBIh9r4vC6E9o/P20vKs1Xv4PexBK2X7
 srO0n87oCkLNjTVd/WGN5vnodzur+TxkkL3Dw+DK1or0lRZXkw1DDfOxv
 y2plJEetmjnQZZe6gy/63hwsrn/5acXn+IMKgjUuYbGJAs3VTt/T/fnjz
 kH/XsTa3Kzn5r2wPuXjtP8ndkrCe3MraZFfiqiakHimWkxGGUH4Qv1S4N
 kLdGfOBe7XsfBxEwXiQohtU1k0Kr4tNGZdet5vemy6DhMu6jPEIx/upHf g==;
X-CSE-ConnectionGUID: UynUxAyASeulPI5uaIQTXA==
X-CSE-MsgGUID: mXSV7PuuTDCZDtu5WALKMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2174312"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2174312"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:13:45 -0700
X-CSE-ConnectionGUID: XroFHEX8RcKHgngTWbbEzQ==
X-CSE-MsgGUID: mCc/CUpDRiaKoX7wO4QipA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7311375"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:13:43 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 03/10] drm/i915: Handle joined pipes inside
 intel_crtc_vblank_{on, off}()
Date: Fri, 30 Oct 2026 19:13:19 +0200
Message-ID: <20261030171327.29829-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
References: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
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
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Make life easier for the callers of intel_crtc_vblank_{on,off}()
by handling the joined pipes inside the function itself.

We do still need the leave the per-pipe variant exposed for
intel_modeset_setup_hw_state().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/icl_dsi.c        |  4 +--
 drivers/gpu/drm/i915/display/intel_crt.c      |  4 +--
 drivers/gpu/drm/i915/display/intel_crtc.c     | 32 +++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_crtc.h     |  8 +++--
 drivers/gpu/drm/i915/display/intel_ddi.c      | 15 ++-------
 drivers/gpu/drm/i915/display/intel_display.c  | 10 +++---
 drivers/gpu/drm/i915/display/intel_dp_mst.c   | 15 ++-------
 .../drm/i915/display/intel_modeset_setup.c    |  2 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c        |  4 +--
 9 files changed, 52 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index ea0cdb7822f3..381cdf7d5131 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -1304,7 +1304,7 @@ static void gen11_dsi_enable(struct intel_atomic_state *state,
 
 	intel_panel_prepare(crtc_state, conn_state);
 
-	intel_crtc_vblank_on(crtc_state);
+	intel_crtc_vblank_on(state, crtc_state);
 }
 
 static void gen11_dsi_disable_transcoder(struct intel_encoder *encoder)
@@ -1455,7 +1455,7 @@ static void gen11_dsi_post_disable(struct intel_atomic_state *state,
 	struct intel_dsi *intel_dsi = enc_to_intel_dsi(encoder);
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
 
-	intel_crtc_vblank_off(old_crtc_state);
+	intel_crtc_vblank_off(state, old_crtc_state);
 
 	/* step2d,e: disable transcoder and wait */
 	gen11_dsi_disable_transcoder(encoder);
diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
index 5b8968197fbc..b814b84c650f 100644
--- a/drivers/gpu/drm/i915/display/intel_crt.c
+++ b/drivers/gpu/drm/i915/display/intel_crt.c
@@ -265,7 +265,7 @@ static void hsw_post_disable_crt(struct intel_atomic_state *state,
 	struct intel_display *display = to_intel_display(encoder);
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
 
-	intel_crtc_vblank_off(old_crtc_state);
+	intel_crtc_vblank_off(state, old_crtc_state);
 
 	intel_disable_transcoder(old_crtc_state);
 
@@ -333,7 +333,7 @@ static void hsw_enable_crt(struct intel_atomic_state *state,
 
 	lpt_pch_enable(state, crtc);
 
-	intel_crtc_vblank_on(crtc_state);
+	intel_crtc_vblank_on(state, crtc_state);
 
 	intel_crt_set_dpms(encoder, crtc_state, DRM_MODE_DPMS_ON);
 
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 139c9dae536e..fe7af983f9f5 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -126,7 +126,7 @@ u32 intel_crtc_max_vblank_count(const struct intel_crtc_state *crtc_state)
 		return 0; /* Gen2 doesn't have a hardware frame counter */
 }
 
-void intel_crtc_vblank_on(const struct intel_crtc_state *crtc_state)
+void intel_pipe_vblank_on(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 
@@ -145,7 +145,7 @@ void intel_crtc_vblank_on(const struct intel_crtc_state *crtc_state)
 	trace_intel_pipe_enable(crtc);
 }
 
-void intel_crtc_vblank_off(const struct intel_crtc_state *crtc_state)
+void intel_pipe_vblank_off(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
@@ -165,6 +165,34 @@ void intel_crtc_vblank_off(const struct intel_crtc_state *crtc_state)
 	flush_work(&display->irq.vblank_notify_work);
 }
 
+void intel_crtc_vblank_on(struct intel_atomic_state *state,
+			  const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(state);
+	struct intel_crtc *pipe_crtc;
+
+	for_each_pipe_crtc_modeset_enable(display, pipe_crtc, crtc_state) {
+		const struct intel_crtc_state *pipe_crtc_state =
+			intel_atomic_get_new_crtc_state(state, pipe_crtc);
+
+		intel_pipe_vblank_on(pipe_crtc_state);
+	}
+}
+
+void intel_crtc_vblank_off(struct intel_atomic_state *state,
+			   const struct intel_crtc_state *old_crtc_state)
+{
+	struct intel_display *display = to_intel_display(state);
+	struct intel_crtc *pipe_crtc;
+
+	for_each_pipe_crtc_modeset_disable(display, pipe_crtc, old_crtc_state) {
+		const struct intel_crtc_state *old_pipe_crtc_state =
+			intel_atomic_get_old_crtc_state(state, pipe_crtc);
+
+		intel_pipe_vblank_off(old_pipe_crtc_state);
+	}
+}
+
 struct intel_crtc_state *intel_crtc_state_alloc(struct intel_crtc *crtc)
 {
 	struct intel_crtc_state *crtc_state;
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.h b/drivers/gpu/drm/i915/display/intel_crtc.h
index 12507b51ee77..959a009efd3e 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.h
+++ b/drivers/gpu/drm/i915/display/intel_crtc.h
@@ -44,8 +44,12 @@ struct intel_crtc_state *intel_crtc_state_alloc(struct intel_crtc *crtc);
 void intel_crtc_state_reset(struct intel_crtc_state *crtc_state,
 			    struct intel_crtc *crtc);
 u32 intel_crtc_get_vblank_counter(struct intel_crtc *crtc);
-void intel_crtc_vblank_on(const struct intel_crtc_state *crtc_state);
-void intel_crtc_vblank_off(const struct intel_crtc_state *crtc_state);
+void intel_pipe_vblank_on(const struct intel_crtc_state *crtc_state);
+void intel_pipe_vblank_off(const struct intel_crtc_state *crtc_state);
+void intel_crtc_vblank_on(struct intel_atomic_state *state,
+			  const struct intel_crtc_state *crtc_state);
+void intel_crtc_vblank_off(struct intel_atomic_state *state,
+			   const struct intel_crtc_state *old_crtc_state);
 void intel_pipe_update_start(struct intel_atomic_state *state,
 			     struct intel_crtc *crtc);
 void intel_pipe_update_end(struct intel_atomic_state *state,
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 9fb455d980ce..12222e5096d4 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3253,12 +3253,7 @@ static void intel_ddi_post_disable_hdmi_or_sst(struct intel_atomic_state *state,
 	struct intel_crtc *pipe_crtc;
 	bool is_hdmi = intel_crtc_has_type(old_crtc_state, INTEL_OUTPUT_HDMI);
 
-	for_each_pipe_crtc_modeset_disable(display, pipe_crtc, old_crtc_state) {
-		const struct intel_crtc_state *old_pipe_crtc_state =
-			intel_atomic_get_old_crtc_state(state, pipe_crtc);
-
-		intel_crtc_vblank_off(old_pipe_crtc_state);
-	}
+	intel_crtc_vblank_off(state, old_crtc_state);
 
 	intel_disable_transcoder(old_crtc_state);
 
@@ -3536,7 +3531,6 @@ static void intel_ddi_enable(struct intel_atomic_state *state,
 			     const struct drm_connector_state *conn_state)
 {
 	struct intel_display *display = to_intel_display(encoder);
-	struct intel_crtc *pipe_crtc;
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	bool is_hdmi = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI);
 
@@ -3577,12 +3571,7 @@ static void intel_ddi_enable(struct intel_atomic_state *state,
 	else
 		intel_ddi_enable_dp(state, encoder, crtc_state, conn_state);
 
-	for_each_pipe_crtc_modeset_enable(display, pipe_crtc, crtc_state) {
-		const struct intel_crtc_state *pipe_crtc_state =
-			intel_atomic_get_new_crtc_state(state, pipe_crtc);
-
-		intel_crtc_vblank_on(pipe_crtc_state);
-	}
+	intel_crtc_vblank_on(state, crtc_state);
 
 	intel_hdcp_enable(state, encoder, crtc_state, conn_state);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 5e40487e9ab0..7dd857b0b8e7 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1626,7 +1626,7 @@ static void ilk_crtc_enable(struct intel_atomic_state *state,
 	if (new_crtc_state->has_pch_encoder)
 		ilk_pch_enable(state, crtc);
 
-	intel_crtc_vblank_on(new_crtc_state);
+	intel_crtc_vblank_on(state, new_crtc_state);
 
 	intel_encoders_enable(state, crtc);
 
@@ -1828,7 +1828,7 @@ static void ilk_crtc_disable(struct intel_atomic_state *state,
 
 	intel_encoders_disable(state, crtc);
 
-	intel_crtc_vblank_off(old_crtc_state);
+	intel_crtc_vblank_off(state, old_crtc_state);
 
 	intel_disable_transcoder(old_crtc_state);
 
@@ -2175,7 +2175,7 @@ static void valleyview_crtc_enable(struct intel_atomic_state *state,
 	intel_initial_watermarks(state, crtc);
 	intel_enable_transcoder(new_crtc_state);
 
-	intel_crtc_vblank_on(new_crtc_state);
+	intel_crtc_vblank_on(state, new_crtc_state);
 
 	intel_encoders_enable(state, crtc);
 }
@@ -2212,7 +2212,7 @@ static void i9xx_crtc_enable(struct intel_atomic_state *state,
 		intel_update_watermarks(display);
 	intel_enable_transcoder(new_crtc_state);
 
-	intel_crtc_vblank_on(new_crtc_state);
+	intel_crtc_vblank_on(state, new_crtc_state);
 
 	intel_encoders_enable(state, crtc);
 
@@ -2238,7 +2238,7 @@ static void i9xx_crtc_disable(struct intel_atomic_state *state,
 
 	intel_encoders_disable(state, crtc);
 
-	intel_crtc_vblank_off(old_crtc_state);
+	intel_crtc_vblank_off(state, old_crtc_state);
 
 	intel_disable_transcoder(old_crtc_state);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 1e6190689e6b..84e69f37deff 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1114,12 +1114,7 @@ static void mst_stream_post_disable(struct intel_atomic_state *state,
 	drm_WARN_ON(display->drm, DISPLAY_VER(display) >= 12 && last_mst_stream &&
 		    !intel_dp_mst_is_master_trans(old_crtc_state));
 
-	for_each_pipe_crtc_modeset_disable(display, pipe_crtc, old_crtc_state) {
-		const struct intel_crtc_state *old_pipe_crtc_state =
-			intel_atomic_get_old_crtc_state(state, pipe_crtc);
-
-		intel_crtc_vblank_off(old_pipe_crtc_state);
-	}
+	intel_crtc_vblank_off(state, old_crtc_state);
 
 	intel_disable_transcoder(old_crtc_state);
 
@@ -1351,7 +1346,6 @@ static void mst_stream_enable(struct intel_atomic_state *state,
 		drm_atomic_get_new_mst_topology_state(&state->base, &intel_dp->mst.mgr);
 	enum transcoder trans = pipe_config->cpu_transcoder;
 	bool first_mst_stream = intel_dp_mst_active_streams(intel_dp) == 1;
-	struct intel_crtc *pipe_crtc;
 	int ret;
 
 	drm_WARN_ON(display->drm, pipe_config->has_pch_encoder);
@@ -1397,12 +1391,7 @@ static void mst_stream_enable(struct intel_atomic_state *state,
 
 	intel_enable_transcoder(pipe_config);
 
-	for_each_pipe_crtc_modeset_enable(display, pipe_crtc, pipe_config) {
-		const struct intel_crtc_state *pipe_crtc_state =
-			intel_atomic_get_new_crtc_state(state, pipe_crtc);
-
-		intel_crtc_vblank_on(pipe_crtc_state);
-	}
+	intel_crtc_vblank_on(state, pipe_config);
 
 	intel_hdcp_enable(state, encoder, pipe_config, conn_state);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_modeset_setup.c b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
index 6aed88173770..db8af96782f8 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_setup.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
@@ -969,7 +969,7 @@ void intel_modeset_setup_hw_state(struct intel_display *display,
 
 		if (crtc_state->hw.active) {
 			intel_dmc_enable_pipe(crtc_state);
-			intel_crtc_vblank_on(crtc_state);
+			intel_pipe_vblank_on(crtc_state);
 		}
 	}
 
diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index 8829f365592e..ee3196e40ca7 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -821,7 +821,7 @@ static void bxt_dsi_enable(struct intel_atomic_state *state,
 			   const struct intel_crtc_state *crtc_state,
 			   const struct drm_connector_state *conn_state)
 {
-	intel_crtc_vblank_on(crtc_state);
+	intel_crtc_vblank_on(state, crtc_state);
 }
 
 /*
@@ -877,7 +877,7 @@ static void intel_dsi_post_disable(struct intel_atomic_state *state,
 	drm_dbg_kms(display->drm, "\n");
 
 	if (display->platform.geminilake || display->platform.broxton) {
-		intel_crtc_vblank_off(old_crtc_state);
+		intel_crtc_vblank_off(state, old_crtc_state);
 
 		skl_scaler_disable(old_crtc_state);
 	}
-- 
2.55.0

