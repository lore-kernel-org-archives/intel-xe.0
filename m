Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83909CD8CA4
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 14:12:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E32710F44D;
	Mon,  8 Jun 2026 14:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SK4gDx8Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2210E10F453;
 Mon,  8 Jun 2026 14:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780927943; x=1812463943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AG1e+PY82yvNhlV0RuhRPlJnmjXAQARdFODiz9RFZ/U=;
 b=SK4gDx8Ydh/l7E+GNRDY1jVBD2ycnm2G0aHZF+mBdAnlzj8JKFAYgW/v
 /aoy0Lsggio6kx/jHc9HQIqjKTructbdlQiMRc9mFigwtUzfBcXZsAsOl
 rBjdhwEEudstZy+Ni5apgbuyQdbqD1F3rTuOdQ0AeLXIBwDpVHezz6bpZ
 clKlnaPl6RUZtl6xIHI6whYREYXt2k2j8LQtmJqFZkUWe0O09tFpINp5p
 mD5d2G7yTEfLbChTSI8RV1soRKhFa95iQCEhONObena7AKmTBqp9ludLs
 hWk0qF7fKunqQ6eFLs099zwvirEhhf7QHBhdiaUfZvwf2Cjknz9mr7jeZ w==;
X-CSE-ConnectionGUID: 36nSvseIQienM5UTPMDFbg==
X-CSE-MsgGUID: ZEr+xbZMTiS5Wdp2X6IscQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81781309"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81781309"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 07:12:23 -0700
X-CSE-ConnectionGUID: CO6GvewfTIOjGSAWA1VA/w==
X-CSE-MsgGUID: zolFDTTLRbCJtJ4m81WzfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="241113709"
Received: from carterle-desk.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.213])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 07:12:21 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 4/7] drm/i915/psr: Split PSR compute config
Date: Mon,  8 Jun 2026 17:11:21 +0300
Message-ID: <20260608141124.144878-5-jouni.hogander@intel.com>
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

DP Panel Replay needs FEC being enabled. Link computation needs to know if
FEC is about to be enabled. Due to this split intel_psr_pre_compute_config
from intel_psr_compute_config. This is a preparation to enable FEC for DP
Panel Replay.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     |  2 ++
 drivers/gpu/drm/i915/display/intel_dp_mst.c |  2 ++
 drivers/gpu/drm/i915/display/intel_psr.c    | 19 +++++++++++++++----
 drivers/gpu/drm/i915/display/intel_psr.h    |  2 ++
 4 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0bbbdf10c427d..e7782d41224a4 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3676,6 +3676,8 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 	if (intel_dp_hdisplay_bad(display, adjusted_mode->crtc_hdisplay))
 		return -EINVAL;
 
+	intel_psr_pre_compute_config(intel_dp, pipe_config);
+
 	/*
 	 * Try to respect downstream TMDS clock limits first, if
 	 * that fails assume the user might know something we don't.
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index f96f26067ab71..24cc347f38ee1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -640,6 +640,8 @@ static int mst_stream_compute_link_for_joined_pipes(struct intel_encoder *encode
 		return -EINVAL;
 	}
 
+	intel_psr_pre_compute_config(intel_dp, pipe_config);
+
 	/* enable compression if the mode doesn't fit available BW */
 	if (dsc_needed) {
 		int dsc_slice_count;
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index f58200d38ac2c..75614abac24bb 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1927,12 +1927,10 @@ void intel_psr_set_non_psr_pipes(struct intel_dp *intel_dp,
 		~BIT(to_intel_crtc(crtc_state->uapi.crtc)->pipe);
 }
 
-void intel_psr_compute_config(struct intel_dp *intel_dp,
-			      struct intel_crtc_state *crtc_state,
-			      struct drm_connector_state *conn_state)
+void intel_psr_pre_compute_config(struct intel_dp *intel_dp,
+				  struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
-	struct intel_connector *connector = to_intel_connector(conn_state->connector);
 	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 
 	if (!psr_global_enabled(intel_dp)) {
@@ -1963,6 +1961,19 @@ void intel_psr_compute_config(struct intel_dp *intel_dp,
 		return;
 	}
 
+	crtc_state->has_psr = true;
+}
+
+void intel_psr_compute_config(struct intel_dp *intel_dp,
+			      struct intel_crtc_state *crtc_state,
+			      struct drm_connector_state *conn_state)
+{
+	struct intel_connector *connector =
+		to_intel_connector(conn_state->connector);
+
+	if (!crtc_state->has_psr)
+		return;
+
 	/* Only used for state verification. */
 	crtc_state->panel_replay_dsc_support = connector->dp.panel_replay_caps.dsc_support;
 	crtc_state->has_panel_replay = _panel_replay_compute_config(crtc_state, conn_state);
diff --git a/drivers/gpu/drm/i915/display/intel_psr.h b/drivers/gpu/drm/i915/display/intel_psr.h
index 29723e63888f8..56af6bde68f86 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.h
+++ b/drivers/gpu/drm/i915/display/intel_psr.h
@@ -47,6 +47,8 @@ void intel_psr_init(struct intel_dp *intel_dp);
 void intel_psr_compute_config(struct intel_dp *intel_dp,
 			      struct intel_crtc_state *crtc_state,
 			      struct drm_connector_state *conn_state);
+void intel_psr_pre_compute_config(struct intel_dp *intel_dp,
+				  struct intel_crtc_state *crtc_state);
 void intel_psr_get_config(struct intel_encoder *encoder,
 			  struct intel_crtc_state *pipe_config);
 void intel_psr_irq_handler(struct intel_dp *intel_dp, u32 psr_iir);
-- 
2.43.0

