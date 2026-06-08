Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C187CD8CAC
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 14:12:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A6510F45F;
	Mon,  8 Jun 2026 14:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQ5aAiSp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C454210F44D;
 Mon,  8 Jun 2026 14:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780927944; x=1812463944;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cwko00IeTwKtBwdvgoOpuDxOUhO7BnbPMEYNMhVeCG4=;
 b=QQ5aAiSpODQVsO9qSqSZxTvAm/84C7zlPxSJtvmTTRFwiw1xcpCh+TQp
 R+0c7Ce8tQvnywFN2aSGnNwP7szgxdvs4KLZ+P+LlE6lce2qMoN01nkRA
 Up0E7/2vaa7n6rj5Oey4HM4+der528nb8VA7j7AcbyBE5fxN9CZkZYHeX
 vblXzbhe2vGa/Xa9MD8fnT+0DhjNkk8CS55NQn5BhHn2stjNMaWWsCfYB
 wvlgnai+dxcOmsFZJyCxqBKDqSf9JQJVJl/JUGl/pK1gAdJuX9Jjv3Hqo
 kPGKB3oBtwtEnv/U1WJuo7ysKcIJS4MiWAZdZ2spIsbz2PTWZKWczPxYC g==;
X-CSE-ConnectionGUID: Id2m99TbS+a0myvbprRBWA==
X-CSE-MsgGUID: BK7Y54L9SjeotiSlIdBfSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81781314"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81781314"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 07:12:24 -0700
X-CSE-ConnectionGUID: k2k2wbn6R8yD49XXXWcBgw==
X-CSE-MsgGUID: waqGSiXJQSOJ+SMPALxrxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="241113718"
Received: from carterle-desk.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.213])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 07:12:23 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 5/7] drm/i915/psr: Move DP/eDP Panel Replay compute config to
 pre compute config
Date: Mon,  8 Jun 2026 17:11:22 +0300
Message-ID: <20260608141124.144878-6-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608141124.144878-1-jouni.hogander@intel.com>
References: <20260608141124.144878-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Move everything possible from Panel Replay compute config into pre compute
config. DSC compression check and ALPM computation can't be moved as
information used for those is available only after we know link parameters.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  2 +-
 drivers/gpu/drm/i915/display/intel_psr.c    | 47 +++++++++++++++------
 drivers/gpu/drm/i915/display/intel_psr.h    |  3 +-
 4 files changed, 38 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index e7782d41224a4..2f36d34ab6871 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3676,7 +3676,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 	if (intel_dp_hdisplay_bad(display, adjusted_mode->crtc_hdisplay))
 		return -EINVAL;
 
-	intel_psr_pre_compute_config(intel_dp, pipe_config);
+	intel_psr_pre_compute_config(intel_dp, pipe_config, conn_state);
 
 	/*
 	 * Try to respect downstream TMDS clock limits first, if
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 24cc347f38ee1..a2675defaa3bf 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -640,7 +640,7 @@ static int mst_stream_compute_link_for_joined_pipes(struct intel_encoder *encode
 		return -EINVAL;
 	}
 
-	intel_psr_pre_compute_config(intel_dp, pipe_config);
+	intel_psr_pre_compute_config(intel_dp, pipe_config, conn_state);
 
 	/* enable compression if the mode doesn't fit available BW */
 	if (dsc_needed) {
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 75614abac24bb..a61fa9d0ff82c 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1820,7 +1820,34 @@ static bool _panel_replay_compute_config(struct intel_crtc_state *crtc_state,
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
+	struct intel_display *display = to_intel_display(crtc_state);
+
+	if (crtc_state->dsc.compression_enable &&
+	    connector->dp.panel_replay_caps.dsc_support ==
+	    INTEL_DP_PANEL_REPLAY_DSC_NOT_SUPPORTED) {
+		drm_dbg_kms(display->drm,
+			    "Panel Replay not enabled because it's not supported with DSC\n");
+		return false;
+	}
+
+	if (!intel_dp_is_edp(intel_dp))
+		return true;
+
+	/* Remaining checks are for eDP only */
+
+	if (!alpm_config_valid(intel_dp, crtc_state, true, true, false))
+		return false;
+
+	return true;
+}
+
+static bool _panel_replay_pre_compute_config(struct intel_dp *intel_dp,
+					     struct intel_crtc_state *crtc_state,
+					     struct drm_connector_state *conn_state)
+{
 	struct intel_display *display = to_intel_display(intel_dp);
+	struct intel_connector *connector =
+		to_intel_connector(conn_state->connector);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 
 	if (!CAN_PANEL_REPLAY(intel_dp))
@@ -1840,14 +1867,6 @@ static bool _panel_replay_compute_config(struct intel_crtc_state *crtc_state,
 		return false;
 	}
 
-	if (crtc_state->dsc.compression_enable &&
-	    connector->dp.panel_replay_caps.dsc_support ==
-	    INTEL_DP_PANEL_REPLAY_DSC_NOT_SUPPORTED) {
-		drm_dbg_kms(display->drm,
-			    "Panel Replay not enabled because it's not supported with DSC\n");
-		return false;
-	}
-
 	crtc_state->link_off_after_as_sdp_when_pr_active = compute_link_off_after_as_sdp_when_pr_active(connector);
 	crtc_state->disable_as_sdp_when_pr_active = compute_disable_as_sdp_when_pr_active(connector);
 
@@ -1885,9 +1904,6 @@ static bool _panel_replay_compute_config(struct intel_crtc_state *crtc_state,
 		return false;
 	}
 
-	if (!alpm_config_valid(intel_dp, crtc_state, true, true, false))
-		return false;
-
 	return true;
 }
 
@@ -1928,7 +1944,8 @@ void intel_psr_set_non_psr_pipes(struct intel_dp *intel_dp,
 }
 
 void intel_psr_pre_compute_config(struct intel_dp *intel_dp,
-				  struct intel_crtc_state *crtc_state)
+				  struct intel_crtc_state *crtc_state,
+				  struct drm_connector_state *conn_state)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
 	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
@@ -1962,6 +1979,9 @@ void intel_psr_pre_compute_config(struct intel_dp *intel_dp,
 	}
 
 	crtc_state->has_psr = true;
+	crtc_state->has_panel_replay =
+		_panel_replay_pre_compute_config(intel_dp, crtc_state,
+						 conn_state);
 }
 
 void intel_psr_compute_config(struct intel_dp *intel_dp,
@@ -1976,7 +1996,8 @@ void intel_psr_compute_config(struct intel_dp *intel_dp,
 
 	/* Only used for state verification. */
 	crtc_state->panel_replay_dsc_support = connector->dp.panel_replay_caps.dsc_support;
-	crtc_state->has_panel_replay = _panel_replay_compute_config(crtc_state, conn_state);
+	if (crtc_state->has_panel_replay)
+		crtc_state->has_panel_replay = _panel_replay_compute_config(crtc_state, conn_state);
 
 	crtc_state->has_psr = crtc_state->has_panel_replay ? true :
 		_psr_compute_config(intel_dp, crtc_state, conn_state);
diff --git a/drivers/gpu/drm/i915/display/intel_psr.h b/drivers/gpu/drm/i915/display/intel_psr.h
index 56af6bde68f86..e8171c8b4fb11 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.h
+++ b/drivers/gpu/drm/i915/display/intel_psr.h
@@ -48,7 +48,8 @@ void intel_psr_compute_config(struct intel_dp *intel_dp,
 			      struct intel_crtc_state *crtc_state,
 			      struct drm_connector_state *conn_state);
 void intel_psr_pre_compute_config(struct intel_dp *intel_dp,
-				  struct intel_crtc_state *crtc_state);
+				  struct intel_crtc_state *crtc_state,
+				  struct drm_connector_state *conn_state);
 void intel_psr_get_config(struct intel_encoder *encoder,
 			  struct intel_crtc_state *pipe_config);
 void intel_psr_irq_handler(struct intel_dp *intel_dp, u32 psr_iir);
-- 
2.43.0

