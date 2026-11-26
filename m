Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF53606A321
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 06:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XDedaPx4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE8110FCD5;
	Thu, 26 Nov 2026 06:35:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8642C10FC56;
 Thu, 26 Nov 2026 06:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795674908; x=1827210908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xL5FOIK/RFOm7Pa6kI+vXi41qy9gVa2W/UZZGQouJUY=;
 b=XDedaPx4c0TNC9CyfVM4l56vL6wSEBI3W6CaZPsKjFHQ5CrDt9MJFk3J
 tlzm6IdTQMpbo4GO9wIDEXldqMPSYB1Wfulj4VaHymn6gjCOegrhfHxsM
 oH27pWucCoDvWXTRSYSSVm69pEJFz09o1sKsfKud97t4PWNaUXqGnR+fp
 nLpTEmbp22AgEIHNi7/2QgEyQO2FNhqpq+tjUxrpKRktGLZon+KIjCpqN
 iyX/JavEM0cQoLscE20cNDQKawSooFfMuUP7zy8VYouGdCtmFZrWAFmKM
 FlSyONu9ZB/oPcj4cfFyOKuFNhtWtvSwrCvJalZmtKYtufxslRr4XQGjn A==;
X-CSE-ConnectionGUID: lmIG1jQMRu6g93NjjZb4DA==
X-CSE-MsgGUID: 4g0p2iYqQ7WOksceuUnHjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4462617"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4462617"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 22:35:07 -0800
X-CSE-ConnectionGUID: 1cJ+rQnRR/CCPCS2mrkUCw==
X-CSE-MsgGUID: MVDw9laHR9SK7yoL9JMWRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12346664"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2026 22:35:05 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 01/15] drm/i915/display: Rename port sync master/slave to
 primary/secondary
Date: Thu, 26 Nov 2026 12:04:45 +0530
Message-Id: <20261126063459.863698-2-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126063459.863698-1-suraj.kandpal@intel.com>
References: <20261126063459.863698-1-suraj.kandpal@intel.com>
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

Use primary/secondary for the transcoder sync state and its helpers,
in line with the BSpec terminology. Pipelock is going to reuse the
same state, so do the rename before building on top of it.

No functional change.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c     |  2 +-
 .../drm/i915/display/intel_crtc_state_dump.c  |  6 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      | 58 +++++++++----------
 drivers/gpu/drm/i915/display/intel_display.c  | 45 +++++++-------
 drivers/gpu/drm/i915/display/intel_display.h  |  4 +-
 .../drm/i915/display/intel_display_types.h    |  8 +--
 drivers/gpu/drm/i915/display/intel_dp.c       |  6 +-
 .../drm/i915/display/intel_modeset_setup.c    | 57 +++++++++---------
 8 files changed, 92 insertions(+), 94 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 139c9dae536e..0cc2eb0dc736 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -185,7 +185,7 @@ void intel_crtc_state_reset(struct intel_crtc_state *crtc_state,
 	__drm_atomic_helper_crtc_state_init(&crtc_state->uapi, &crtc->base);
 
 	crtc_state->cpu_transcoder = INVALID_TRANSCODER;
-	crtc_state->master_transcoder = INVALID_TRANSCODER;
+	crtc_state->sync_primary_transcoder = INVALID_TRANSCODER;
 	crtc_state->hsw_workaround_pipe = INVALID_PIPE;
 	crtc_state->scaler_state.scaler_id = -1;
 	crtc_state->mst_master_transcoder = INVALID_TRANSCODER;
diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 57e64dda79c1..89103a298bae 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -213,9 +213,9 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 	drm_printf(&p, "MST master transcoder: %s\n",
 		   transcoder_name(pipe_config->mst_master_transcoder));
 
-	drm_printf(&p, "port sync: master transcoder: %s, slave transcoder bitmask = 0x%x\n",
-		   transcoder_name(pipe_config->master_transcoder),
-		   pipe_config->sync_mode_slaves_mask);
+	drm_printf(&p, "transcoder sync: primary: %s, secondaries: 0x%x\n",
+		   transcoder_name(pipe_config->sync_primary_transcoder),
+		   pipe_config->sync_secondaries_mask);
 
 	drm_printf(&p, "joiner: %s, pipes: 0x%x\n",
 		   intel_crtc_is_joiner_secondary(pipe_config) ? "secondary" :
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index e21c237b39f4..ffd76766e460 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -614,9 +614,9 @@ intel_ddi_transcoder_func_reg_val_get(struct intel_encoder *encoder,
 	}
 
 	if (IS_DISPLAY_VER(display, 8, 10) &&
-	    crtc_state->master_transcoder != INVALID_TRANSCODER) {
+	    crtc_state->sync_primary_transcoder != INVALID_TRANSCODER) {
 		u8 master_select =
-			bdw_trans_port_sync_master_select(crtc_state->master_transcoder);
+			bdw_trans_port_sync_master_select(crtc_state->sync_primary_transcoder);
 
 		temp |= TRANS_DDI_PORT_SYNC_ENABLE |
 			TRANS_DDI_PORT_SYNC_MASTER_SELECT(master_select);
@@ -632,12 +632,12 @@ void intel_ddi_enable_transcoder_func(struct intel_encoder *encoder,
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
 	if (DISPLAY_VER(display) >= 11) {
-		enum transcoder master_transcoder = crtc_state->master_transcoder;
+		enum transcoder primary_transcoder = crtc_state->sync_primary_transcoder;
 		u32 ctl2 = 0;
 
-		if (master_transcoder != INVALID_TRANSCODER) {
+		if (primary_transcoder != INVALID_TRANSCODER) {
 			u8 master_select =
-				bdw_trans_port_sync_master_select(master_transcoder);
+				bdw_trans_port_sync_master_select(primary_transcoder);
 
 			ctl2 |= PORT_SYNC_MODE_ENABLE |
 				PORT_SYNC_MODE_MASTER_SELECT(master_select);
@@ -2739,7 +2739,7 @@ static void mtl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	intel_dp_start_link_train(state, intel_dp, crtc_state);
 
 	/* 6.n Set DP_TP_CTL link training to Normal */
-	if (!is_trans_port_sync_mode(crtc_state))
+	if (!intel_crtc_in_sync_group(crtc_state))
 		intel_dp_stop_link_train(intel_dp, crtc_state);
 
 	/* 6.o Configure and enable FEC if needed */
@@ -2889,7 +2889,7 @@ static void tgl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	intel_dp_start_link_train(state, intel_dp, crtc_state);
 
 	/* 7.k Set DP_TP_CTL link training to Normal */
-	if (!is_trans_port_sync_mode(crtc_state))
+	if (!intel_crtc_in_sync_group(crtc_state))
 		intel_dp_stop_link_train(intel_dp, crtc_state);
 
 	/* 7.l Configure and enable FEC if needed */
@@ -2962,7 +2962,7 @@ static void hsw_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	intel_dp_sink_set_fec_ready(intel_dp, crtc_state, true);
 	intel_dp_start_link_train(state, intel_dp, crtc_state);
 	if ((port != PORT_A || DISPLAY_VER(display) >= 9) &&
-	    !is_trans_port_sync_mode(crtc_state))
+	    !intel_crtc_in_sync_group(crtc_state))
 		intel_dp_stop_link_train(intel_dp, crtc_state);
 
 	intel_ddi_enable_fec(encoder, crtc_state);
@@ -3354,27 +3354,27 @@ static void trans_port_sync_stop_link_train(struct intel_atomic_state *state,
 	struct drm_connector *conn;
 	int i;
 
-	if (!crtc_state->sync_mode_slaves_mask)
+	if (!crtc_state->sync_secondaries_mask)
 		return;
 
 	for_each_new_connector_in_state(&state->base, conn, conn_state, i) {
-		struct intel_encoder *slave_encoder =
+		struct intel_encoder *secondary_encoder =
 			to_intel_encoder(conn_state->best_encoder);
-		struct intel_crtc *slave_crtc = to_intel_crtc(conn_state->crtc);
-		const struct intel_crtc_state *slave_crtc_state;
+		struct intel_crtc *secondary_crtc = to_intel_crtc(conn_state->crtc);
+		const struct intel_crtc_state *secondary_crtc_state;
 
-		if (!slave_crtc)
+		if (!secondary_crtc)
 			continue;
 
-		slave_crtc_state =
-			intel_atomic_get_new_crtc_state(state, slave_crtc);
+		secondary_crtc_state =
+			intel_atomic_get_new_crtc_state(state, secondary_crtc);
 
-		if (slave_crtc_state->master_transcoder !=
+		if (secondary_crtc_state->sync_primary_transcoder !=
 		    crtc_state->cpu_transcoder)
 			continue;
 
-		intel_dp_stop_link_train(enc_to_intel_dp(slave_encoder),
-					 slave_crtc_state);
+		intel_dp_stop_link_train(enc_to_intel_dp(secondary_encoder),
+					 secondary_crtc_state);
 	}
 
 	usleep_range(200, 400);
@@ -3989,7 +3989,7 @@ static void bdw_get_trans_port_sync_config(struct intel_crtc_state *crtc_state)
 		BIT(TRANSCODER_C) | BIT(TRANSCODER_D);
 	enum transcoder cpu_transcoder;
 
-	crtc_state->master_transcoder =
+	crtc_state->sync_primary_transcoder =
 		bdw_transcoder_master_readout(display, crtc_state->cpu_transcoder);
 
 	for_each_cpu_transcoder_masked(display, cpu_transcoder, transcoders) {
@@ -4005,14 +4005,14 @@ static void bdw_get_trans_port_sync_config(struct intel_crtc_state *crtc_state)
 
 		if (bdw_transcoder_master_readout(display, cpu_transcoder) ==
 		    crtc_state->cpu_transcoder)
-			crtc_state->sync_mode_slaves_mask |= BIT(cpu_transcoder);
+			crtc_state->sync_secondaries_mask |= BIT(cpu_transcoder);
 
 		intel_display_power_put(display, power_domain, trans_wakeref);
 	}
 
 	drm_WARN_ON(display->drm,
-		    crtc_state->master_transcoder != INVALID_TRANSCODER &&
-		    crtc_state->sync_mode_slaves_mask);
+		    crtc_state->sync_primary_transcoder != INVALID_TRANSCODER &&
+		    crtc_state->sync_secondaries_mask);
 }
 
 static void intel_ddi_read_func_ctl_dvi(struct intel_encoder *encoder,
@@ -4682,17 +4682,17 @@ static int intel_ddi_compute_config_late(struct intel_atomic_state *state,
 									connector->tile_group->id);
 
 	/*
-	 * EDP Transcoders cannot be ensalved
-	 * make them a master always when present
+	 * EDP Transcoders cannot be secondaries
+	 * make them the primary always when present
 	 */
 	if (port_sync_transcoders & BIT(TRANSCODER_EDP))
-		crtc_state->master_transcoder = TRANSCODER_EDP;
+		crtc_state->sync_primary_transcoder = TRANSCODER_EDP;
 	else
-		crtc_state->master_transcoder = ffs(port_sync_transcoders) - 1;
+		crtc_state->sync_primary_transcoder = ffs(port_sync_transcoders) - 1;
 
-	if (crtc_state->master_transcoder == crtc_state->cpu_transcoder) {
-		crtc_state->master_transcoder = INVALID_TRANSCODER;
-		crtc_state->sync_mode_slaves_mask = port_sync_transcoders &
+	if (crtc_state->sync_primary_transcoder == crtc_state->cpu_transcoder) {
+		crtc_state->sync_primary_transcoder = INVALID_TRANSCODER;
+		crtc_state->sync_secondaries_mask = port_sync_transcoders &
 			~REG_BIT(crtc_state->cpu_transcoder);
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 19caae633d29..2839e2e7965c 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -173,23 +173,20 @@ icl_wa_cursorclkgating(struct intel_display *display, enum pipe pipe,
 		     enable ? CURSOR_GATING_DIS : 0);
 }
 
-static bool
-is_trans_port_sync_slave(const struct intel_crtc_state *crtc_state)
+static bool intel_crtc_is_sync_secondary(const struct intel_crtc_state *crtc_state)
 {
-	return crtc_state->master_transcoder != INVALID_TRANSCODER;
+	return crtc_state->sync_primary_transcoder != INVALID_TRANSCODER;
 }
 
-bool
-is_trans_port_sync_master(const struct intel_crtc_state *crtc_state)
+bool intel_crtc_is_sync_primary(const struct intel_crtc_state *crtc_state)
 {
-	return crtc_state->sync_mode_slaves_mask != 0;
+	return crtc_state->sync_secondaries_mask != 0;
 }
 
-bool
-is_trans_port_sync_mode(const struct intel_crtc_state *crtc_state)
+bool intel_crtc_in_sync_group(const struct intel_crtc_state *crtc_state)
 {
-	return is_trans_port_sync_master(crtc_state) ||
-		is_trans_port_sync_slave(crtc_state);
+	return intel_crtc_is_sync_primary(crtc_state) ||
+		intel_crtc_is_sync_secondary(crtc_state);
 }
 
 /*
@@ -5618,8 +5615,8 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	}
 	PIPE_CONF_CHECK_DP_VSC_SDP(vsc);
 
-	PIPE_CONF_CHECK_X(sync_mode_slaves_mask);
-	PIPE_CONF_CHECK_I(master_transcoder);
+	PIPE_CONF_CHECK_X(sync_secondaries_mask);
+	PIPE_CONF_CHECK_I(sync_primary_transcoder);
 	PIPE_CONF_CHECK_X(joiner_pipes);
 
 	PIPE_CONF_CHECK_BOOL(dsc.config.block_pred_enable);
@@ -6707,11 +6704,11 @@ int intel_atomic_check(struct drm_device *dev,
 				intel_crtc_flag_modeset(new_crtc_state);
 		}
 
-		if (is_trans_port_sync_mode(new_crtc_state)) {
-			u16 trans = new_crtc_state->sync_mode_slaves_mask;
+		if (intel_crtc_in_sync_group(new_crtc_state)) {
+			u16 trans = new_crtc_state->sync_secondaries_mask;
 
-			if (new_crtc_state->master_transcoder != INVALID_TRANSCODER)
-				trans |= BIT(new_crtc_state->master_transcoder);
+			if (new_crtc_state->sync_primary_transcoder != INVALID_TRANSCODER)
+				trans |= BIT(new_crtc_state->sync_primary_transcoder);
 
 			if (intel_cpu_transcoders_need_modeset(state, trans))
 				intel_crtc_flag_modeset(new_crtc_state);
@@ -7178,7 +7175,7 @@ static void intel_commit_modeset_disables(struct intel_atomic_state *state)
 		drm_vblank_work_flush_all(&crtc->base);
 	}
 
-	/* Only disable port sync and MST slaves */
+	/* Only disable port sync secondaries and MST slaves */
 	for_each_old_intel_crtc_in_state(state, crtc, old_crtc_state) {
 		if ((disable_pipes & BIT(crtc->pipe)) == 0)
 			continue;
@@ -7186,12 +7183,12 @@ static void intel_commit_modeset_disables(struct intel_atomic_state *state)
 		if (intel_crtc_is_joiner_secondary(old_crtc_state))
 			continue;
 
-		/* In case of Transcoder port Sync master slave CRTCs can be
-		 * assigned in any order and we need to make sure that
-		 * slave CRTCs are disabled first and then master CRTC since
-		 * Slave vblanks are masked till Master Vblanks.
+		/* In case of Transcoder port Sync primary and secondary CRTCs
+		 * can be assigned in any order and we need to make sure that
+		 * secondary CRTCs are disabled first and then the primary CRTC
+		 * since secondary vblanks are masked till primary vblanks.
 		 */
-		if (!is_trans_port_sync_slave(old_crtc_state) &&
+		if (!intel_crtc_is_sync_secondary(old_crtc_state) &&
 		    !intel_dp_mst_is_slave_trans(old_crtc_state))
 			continue;
 
@@ -7331,7 +7328,7 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 			continue;
 
 		if (intel_dp_mst_is_slave_trans(new_crtc_state) ||
-		    is_trans_port_sync_master(new_crtc_state))
+		    intel_crtc_is_sync_primary(new_crtc_state))
 			continue;
 
 		modeset_pipes &= ~intel_crtc_joined_pipe_mask(new_crtc_state);
@@ -7341,7 +7338,7 @@ static void skl_commit_modeset_enables(struct intel_atomic_state *state)
 
 	/*
 	 * Then we enable all remaining pipes that depend on other
-	 * pipes: MST slaves and port sync masters
+	 * pipes: MST slaves and port sync primaries
 	 */
 	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state) {
 		enum pipe pipe = crtc->pipe;
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index 8bb37dfe47fc..4b31eef229ce 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -364,8 +364,8 @@ enum drm_mode_status
 intel_cpu_transcoder_mode_valid(struct intel_display *display,
 				const struct drm_display_mode *mode);
 enum phy intel_port_to_phy(struct intel_display *display, enum port port);
-bool is_trans_port_sync_mode(const struct intel_crtc_state *state);
-bool is_trans_port_sync_master(const struct intel_crtc_state *state);
+bool intel_crtc_in_sync_group(const struct intel_crtc_state *state);
+bool intel_crtc_is_sync_primary(const struct intel_crtc_state *state);
 u8 intel_joiner_valid_primary_pipe_mask(struct intel_display *display, int num_joined_pipes);
 u8 intel_crtc_joined_pipe_mask(const struct intel_crtc_state *crtc_state);
 bool intel_crtc_is_joiner_secondary(const struct intel_crtc_state *crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 90a5d29169c6..50eeae7414f1 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1399,11 +1399,11 @@ struct intel_crtc_state {
 
 	bool sdp_split_enable;
 
-	/* Pointer to master transcoder in case of tiled displays */
-	enum transcoder master_transcoder;
+	/* Primary transcoder this one is synced to, for tiled displays */
+	enum transcoder sync_primary_transcoder;
 
-	/* Bitmask to indicate slaves attached */
-	u16 sync_mode_slaves_mask;
+	/* Bitmask of secondary transcoders synced to this one */
+	u16 sync_secondaries_mask;
 
 	/* Only valid on TGL+ */
 	enum transcoder mst_master_transcoder;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ef164a797618..1f8fbcf67b68 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6963,9 +6963,9 @@ static int intel_modeset_synced_crtcs(struct intel_atomic_state *state,
 	if (!old_crtc_state->hw.active)
 		return 0;
 
-	transcoders = old_crtc_state->sync_mode_slaves_mask;
-	if (old_crtc_state->master_transcoder != INVALID_TRANSCODER)
-		transcoders |= BIT(old_crtc_state->master_transcoder);
+	transcoders = old_crtc_state->sync_secondaries_mask;
+	if (old_crtc_state->sync_primary_transcoder != INVALID_TRANSCODER)
+		transcoders |= BIT(old_crtc_state->sync_primary_transcoder);
 
 	return intel_modeset_affected_transcoders(state,
 						  transcoders);
diff --git a/drivers/gpu/drm/i915/display/intel_modeset_setup.c b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
index 6aed88173770..4c594373829b 100644
--- a/drivers/gpu/drm/i915/display/intel_modeset_setup.c
+++ b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
@@ -210,37 +210,38 @@ static u16 get_transcoder_pipes(struct intel_display *display,
 }
 
 /*
- * Return the port sync master and slave pipes linked to @crtc.
+ * Return the port sync primary and secondary pipes linked to @crtc.
  * For joiner configs return only the joiner primary pipes.
  */
 static void get_portsync_pipes(struct intel_crtc *crtc,
-			       u16 *master_pipe_mask, u16 *slave_pipes_mask)
+			       u16 *primary_pipe_mask, u16 *secondary_pipes_mask)
 {
 	struct intel_display *display = to_intel_display(crtc);
 	struct intel_crtc_state *crtc_state =
 		to_intel_crtc_state(crtc->base.state);
-	struct intel_crtc *master_crtc;
-	struct intel_crtc_state *master_crtc_state;
-	enum transcoder master_transcoder;
+	struct intel_crtc *primary_crtc;
+	struct intel_crtc_state *primary_crtc_state;
+	enum transcoder primary_transcoder;
 
-	if (!is_trans_port_sync_mode(crtc_state)) {
-		*master_pipe_mask = BIT(crtc->pipe);
-		*slave_pipes_mask = 0;
+	if (!intel_crtc_in_sync_group(crtc_state)) {
+		*primary_pipe_mask = BIT(crtc->pipe);
+		*secondary_pipes_mask = 0;
 
 		return;
 	}
 
-	if (is_trans_port_sync_master(crtc_state))
-		master_transcoder = crtc_state->cpu_transcoder;
+	if (intel_crtc_is_sync_primary(crtc_state))
+		primary_transcoder = crtc_state->cpu_transcoder;
 	else
-		master_transcoder = crtc_state->master_transcoder;
+		primary_transcoder = crtc_state->sync_primary_transcoder;
 
-	*master_pipe_mask = get_transcoder_pipes(display, BIT(master_transcoder));
-	drm_WARN_ON(display->drm, !is_power_of_2(*master_pipe_mask));
+	*primary_pipe_mask = get_transcoder_pipes(display, BIT(primary_transcoder));
+	drm_WARN_ON(display->drm, !is_power_of_2(*primary_pipe_mask));
 
-	master_crtc = intel_crtc_for_pipe(display, ffs(*master_pipe_mask) - 1);
-	master_crtc_state = to_intel_crtc_state(master_crtc->base.state);
-	*slave_pipes_mask = get_transcoder_pipes(display, master_crtc_state->sync_mode_slaves_mask);
+	primary_crtc = intel_crtc_for_pipe(display, ffs(*primary_pipe_mask) - 1);
+	primary_crtc_state = to_intel_crtc_state(primary_crtc->base.state);
+	*secondary_pipes_mask = get_transcoder_pipes(display,
+						     primary_crtc_state->sync_secondaries_mask);
 }
 
 static u16 get_joiner_secondary_pipes(struct intel_display *display, u16 primary_pipes_mask)
@@ -263,34 +264,34 @@ static void intel_crtc_disable_noatomic(struct intel_crtc *crtc,
 {
 	struct intel_display *display = to_intel_display(crtc);
 	struct intel_crtc *temp_crtc;
-	u16 portsync_master_mask;
-	u16 portsync_slaves_mask;
+	u16 portsync_primary_mask;
+	u16 portsync_secondaries_mask;
 	u16 joiner_secondaries_mask;
 
 	/* TODO: Add support for MST */
-	get_portsync_pipes(crtc, &portsync_master_mask, &portsync_slaves_mask);
+	get_portsync_pipes(crtc, &portsync_primary_mask, &portsync_secondaries_mask);
 	joiner_secondaries_mask = get_joiner_secondary_pipes(display,
-							     portsync_master_mask |
-							     portsync_slaves_mask);
+							     portsync_primary_mask |
+							     portsync_secondaries_mask);
 
 	drm_WARN_ON(display->drm,
-		    portsync_master_mask & portsync_slaves_mask ||
-		    portsync_master_mask & joiner_secondaries_mask ||
-		    portsync_slaves_mask & joiner_secondaries_mask);
+		    portsync_primary_mask & portsync_secondaries_mask ||
+		    portsync_primary_mask & joiner_secondaries_mask ||
+		    portsync_secondaries_mask & joiner_secondaries_mask);
 
 	for_each_intel_crtc_in_pipe_mask(display, temp_crtc, joiner_secondaries_mask)
 		intel_crtc_disable_noatomic_begin(temp_crtc, ctx);
 
-	for_each_intel_crtc_in_pipe_mask(display, temp_crtc, portsync_slaves_mask)
+	for_each_intel_crtc_in_pipe_mask(display, temp_crtc, portsync_secondaries_mask)
 		intel_crtc_disable_noatomic_begin(temp_crtc, ctx);
 
-	for_each_intel_crtc_in_pipe_mask(display, temp_crtc, portsync_master_mask)
+	for_each_intel_crtc_in_pipe_mask(display, temp_crtc, portsync_primary_mask)
 		intel_crtc_disable_noatomic_begin(temp_crtc, ctx);
 
 	for_each_intel_crtc_in_pipe_mask(display, temp_crtc,
 					 joiner_secondaries_mask |
-					 portsync_slaves_mask |
-					 portsync_master_mask)
+					 portsync_secondaries_mask |
+					 portsync_primary_mask)
 		intel_crtc_disable_noatomic_complete(temp_crtc);
 }
 
-- 
2.34.1

