Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C40606A321
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 17:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O+qE0exr
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739C611295C;
	Fri, 30 Oct 2026 17:14:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F338112944;
 Fri, 30 Oct 2026 17:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793380448; x=1824916448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A3J4VciQeeVIAzgkk/JaQvceBCHS0bxxIegvtb4Cbvc=;
 b=O+qE0exri0YAT9TPK+JfIbIts7AvQ6wiV5GGaY3jMCkU3jIxdzNYhMUM
 4OnMB9f33FDf2RrpQNvE/qQpe9ELI8RQU3OOshvgn+ql8hSGGTzle5Znx
 foUraf/NJ/J8vDudkGW4cScpZqnws+m/Ghy3Xp5INm8YG2emcZeguQ4dk
 jiuIP6bMxEabP2NbP4alnqj7WYzATY4u80HFtSJk1ni1TILC+Os8xAsI/
 rPnkAZ3brUfvu3iOIQazT/DZ1GqHOuj9WFH7d+YYxlWbekrO7RlATQUJL
 oyhaDGiZMD+MD2WaywBIhfxjc6yXyzZQk6yPdipRq9ytiwtfK2TWSoleh g==;
X-CSE-ConnectionGUID: Vr8y1koYRVGu0wKfsk6PEA==
X-CSE-MsgGUID: Rx0m0MOyTX2BTciFikNDoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2144592"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2144592"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:14:08 -0700
X-CSE-ConnectionGUID: BFPkoxBJQtWpwGNRFO+qMQ==
X-CSE-MsgGUID: u+d6SJJ8QSi3ZwGNZCX5GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5490950"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.58])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 10:14:07 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 08/10] drm/i915: Document timing generator start/stop
 behaviour on HSW+
Date: Fri, 30 Oct 2026 19:13:24 +0200
Message-ID: <20261030171327.29829-9-ville.syrjala@linux.intel.com>
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Document the HSW+ timing generator start/stop behaviour so
I don't have to reverse engineer it again in the future.

TODO: DSI behavior is unknown

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_crt.c    |  2 ++
 drivers/gpu/drm/i915/display/intel_ddi.c    | 18 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  2 ++
 3 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
index b814b84c650f..532617bf626f 100644
--- a/drivers/gpu/drm/i915/display/intel_crt.c
+++ b/drivers/gpu/drm/i915/display/intel_crt.c
@@ -265,6 +265,7 @@ static void hsw_post_disable_crt(struct intel_atomic_state *state,
 	struct intel_display *display = to_intel_display(encoder);
 	struct intel_crtc *crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
 
+	/* timing generator stops after disabling TRANSCONF */
 	intel_crtc_vblank_off(state, old_crtc_state);
 
 	intel_disable_transcoder(old_crtc_state);
@@ -333,6 +334,7 @@ static void hsw_enable_crt(struct intel_atomic_state *state,
 
 	lpt_pch_enable(state, crtc);
 
+	/* timing generator starts after enabling PCH_TRANSCONF */
 	intel_crtc_vblank_on(state, crtc_state);
 
 	intel_crt_set_dpms(encoder, crtc_state, DRM_MODE_DPMS_ON);
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index ed39f1e265a9..e97e586bed72 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2961,6 +2961,7 @@ static void hsw_ddi_pre_enable_dp(struct intel_atomic_state *state,
 						   crtc_state);
 	intel_dp_sink_set_fec_ready(intel_dp, crtc_state, true);
 	intel_dp_start_link_train(state, intel_dp, crtc_state);
+
 	if ((port != PORT_A || DISPLAY_VER(display) >= 9) &&
 	    !is_trans_port_sync_mode(crtc_state))
 		intel_dp_stop_link_train(intel_dp, crtc_state);
@@ -3282,6 +3283,7 @@ static void intel_ddi_post_disable_hdmi_or_sst(struct intel_atomic_state *state,
 	struct intel_crtc *pipe_crtc;
 	bool is_hdmi = intel_crtc_has_type(old_crtc_state, INTEL_OUTPUT_HDMI);
 
+	/* timing generator stops after disabling TRANSCONF */
 	intel_crtc_vblank_off(state, old_crtc_state);
 
 	intel_disable_transcoder(old_crtc_state);
@@ -3600,6 +3602,22 @@ static void intel_ddi_enable(struct intel_atomic_state *state,
 	else
 		intel_ddi_enable_dp(state, encoder, crtc_state, conn_state);
 
+	/*
+	 * HDMI:
+	 *  timing generator starts after enabling DDI_BUF_CTL
+	 *  TRANSCONF is enabled beforehand
+	 * DP SST:
+	 *  timing generator starts after switching DP_TP_CTL
+	 *  link training to normal or enabling TRANSCONF
+	 *  (whichever happens last).
+	 *
+	 * With port sync the secondaries will be transmitting
+	 * the idle pattern (and thus their timing generators
+	 * will not run) until the primary has finished its
+	 * link training. At that point everyone will switch
+	 * DP_TP_CTL link training to normal all the timings
+	 * generators will start.
+	 */
 	if (is_trans_port_sync_mode(crtc_state))
 		trans_port_sync_vblank_on(state, crtc_state);
 	else
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 84e69f37deff..56734016cd19 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1114,6 +1114,7 @@ static void mst_stream_post_disable(struct intel_atomic_state *state,
 	drm_WARN_ON(display->drm, DISPLAY_VER(display) >= 12 && last_mst_stream &&
 		    !intel_dp_mst_is_master_trans(old_crtc_state));
 
+	/* timing generator stops after disabling TRANSCONF */
 	intel_crtc_vblank_off(state, old_crtc_state);
 
 	intel_disable_transcoder(old_crtc_state);
@@ -1391,6 +1392,7 @@ static void mst_stream_enable(struct intel_atomic_state *state,
 
 	intel_enable_transcoder(pipe_config);
 
+	/* timing generator starts after enabling TRANSCONF */
 	intel_crtc_vblank_on(state, pipe_config);
 
 	intel_hdcp_enable(state, encoder, pipe_config, conn_state);
-- 
2.55.0

