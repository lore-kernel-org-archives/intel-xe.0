Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8A0E8B39C
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 05:18:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E1B10E330;
	Wed,  4 Feb 2026 05:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nG6Lw9zc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731AE10E321;
 Wed,  4 Feb 2026 05:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770182323; x=1801718323;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tFcb1SvBcb4XVkAJFxw3EYCE8g2V3i7WKfnvYg8W6rM=;
 b=nG6Lw9zcw1guTTQFRmhtfRSefGQ5U/ImnSsC3mEOjeLCWQPW3dv2T/Tf
 jhml/OAqANaoisxlg4+L0xS6bb4In8WnHNlEH5m2MKk+LKN9HnlMHQvBE
 FRRisLlXBUXal/b6vrY8Wv/V9gvlFv/v6wPJqLieeaI2BECmSSd+EVL7s
 o5a3bqlKZYJ0IDNe1d2wpzDm4YzO3IWD/rZUNa2KlaEyyi2F1mLp59QdS
 BHTPyv2Ezgd1RvG1oNcnKJ0JWzx+8/mVLe64+6j96gwvgSqIDPQJ7s1Qr
 lOHyvEVz9b6YlaltOv3KyIRT/OOOnKhykULtKjSCgebtLZOTRxIIUNNck Q==;
X-CSE-ConnectionGUID: DcVsNAYyQBSyx8WDRVBNMg==
X-CSE-MsgGUID: EDKW+wjrSwKKGXwiiF0opg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82102824"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="82102824"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 21:18:43 -0800
X-CSE-ConnectionGUID: gjJHyZyNRL++X0nxEoN7jA==
X-CSE-MsgGUID: zDe0mMQvRK23LNhEHCmn2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="210127500"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 21:18:41 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, ville.syrjala@linux.intel.com,
 animesh.manna@intel.com, michal.grzelak@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [RESEND 4/5] drm/i915/alpm: Simplify and align LOBF checks in
 pre/post plane update
Date: Wed,  4 Feb 2026 10:32:49 +0530
Message-ID: <20260204050250.762718-5-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260204050250.762718-1-ankit.k.nautiyal@intel.com>
References: <20260204050250.762718-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The pre_plane_update and post_plane_update hooks essentially
disable/enable lobf feature. Use the existing _is_enabling/is_disabling
logic for this in the pre_plane_update and post_plane_update paths.

Also rename the helpers to intel_alpm_lobf_{en,dis}able().

v2: Remove redeundant checks during enabling/disabling. (Jouni)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c    | 48 ++++++--------------
 drivers/gpu/drm/i915/display/intel_alpm.h    |  6 +--
 drivers/gpu/drm/i915/display/intel_display.c | 25 +++++++++-
 3 files changed, 38 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 3aeab4bebce2..e0a4a59dc025 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -452,25 +452,14 @@ void intel_alpm_port_configure(struct intel_dp *intel_dp,
 	intel_de_write(display, PORT_ALPM_LFPS_CTL(port), lfps_ctl_val);
 }
 
-void intel_alpm_pre_plane_update(struct intel_atomic_state *state,
-				 struct intel_crtc *crtc)
+void intel_alpm_lobf_disable(const struct intel_crtc_state *new_crtc_state)
 {
-	struct intel_display *display = to_intel_display(state);
-	const struct intel_crtc_state *crtc_state =
-		intel_atomic_get_new_crtc_state(state, crtc);
-	const struct intel_crtc_state *old_crtc_state =
-		intel_atomic_get_old_crtc_state(state, crtc);
-	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	struct intel_display *display = to_intel_display(new_crtc_state);
+	enum transcoder cpu_transcoder = new_crtc_state->cpu_transcoder;
 	struct intel_encoder *encoder;
 
-	if (DISPLAY_VER(display) < 20)
-		return;
-
-	if (crtc_state->has_lobf || crtc_state->has_lobf == old_crtc_state->has_lobf)
-		return;
-
 	for_each_intel_encoder_mask(display->drm, encoder,
-				    crtc_state->uapi.encoder_mask) {
+				    new_crtc_state->uapi.encoder_mask) {
 		struct intel_dp *intel_dp;
 
 		if (!intel_encoder_is_dp(encoder))
@@ -481,12 +470,10 @@ void intel_alpm_pre_plane_update(struct intel_atomic_state *state,
 		if (!intel_dp_is_edp(intel_dp))
 			continue;
 
-		if (old_crtc_state->has_lobf) {
-			mutex_lock(&intel_dp->alpm.lock);
-			intel_de_write(display, ALPM_CTL(display, cpu_transcoder), 0);
-			drm_dbg_kms(display->drm, "Link off between frames (LOBF) disabled\n");
-			mutex_unlock(&intel_dp->alpm.lock);
-		}
+		mutex_lock(&intel_dp->alpm.lock);
+		intel_de_write(display, ALPM_CTL(display, cpu_transcoder), 0);
+		drm_dbg_kms(display->drm, "Link off between frames (LOBF) disabled\n");
+		mutex_unlock(&intel_dp->alpm.lock);
 	}
 }
 
@@ -507,22 +494,13 @@ void intel_alpm_enable_sink(struct intel_dp *intel_dp,
 	drm_dp_dpcd_writeb(&intel_dp->aux, DP_RECEIVER_ALPM_CONFIG, val);
 }
 
-void intel_alpm_post_plane_update(struct intel_atomic_state *state,
-				  struct intel_crtc *crtc)
+void intel_alpm_lobf_enable(const struct intel_crtc_state *new_crtc_state)
 {
-	struct intel_display *display = to_intel_display(state);
-	const struct intel_crtc_state *crtc_state =
-		intel_atomic_get_new_crtc_state(state, crtc);
-	const struct intel_crtc_state *old_crtc_state =
-		intel_atomic_get_old_crtc_state(state, crtc);
+	struct intel_display *display = to_intel_display(new_crtc_state);
 	struct intel_encoder *encoder;
 
-	if (crtc_state->has_psr || !crtc_state->has_lobf ||
-	    crtc_state->has_lobf == old_crtc_state->has_lobf)
-		return;
-
 	for_each_intel_encoder_mask(display->drm, encoder,
-				    crtc_state->uapi.encoder_mask) {
+				    new_crtc_state->uapi.encoder_mask) {
 		struct intel_dp *intel_dp;
 
 		if (!intel_encoder_is_dp(encoder))
@@ -531,8 +509,8 @@ void intel_alpm_post_plane_update(struct intel_atomic_state *state,
 		intel_dp = enc_to_intel_dp(encoder);
 
 		if (intel_dp_is_edp(intel_dp)) {
-			intel_alpm_enable_sink(intel_dp, crtc_state);
-			intel_alpm_configure(intel_dp, crtc_state);
+			intel_alpm_enable_sink(intel_dp, new_crtc_state);
+			intel_alpm_configure(intel_dp, new_crtc_state);
 		}
 	}
 }
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index b698979d1f13..1cf70668ab1b 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -25,12 +25,10 @@ void intel_alpm_configure(struct intel_dp *intel_dp,
 			  const struct intel_crtc_state *crtc_state);
 void intel_alpm_enable_sink(struct intel_dp *intel_dp,
 			    const struct intel_crtc_state *crtc_state);
-void intel_alpm_pre_plane_update(struct intel_atomic_state *state,
-				 struct intel_crtc *crtc);
+void intel_alpm_lobf_disable(const struct intel_crtc_state *new_crtc_state);
 void intel_alpm_port_configure(struct intel_dp *intel_dp,
 			       const struct intel_crtc_state *crtc_state);
-void intel_alpm_post_plane_update(struct intel_atomic_state *state,
-				  struct intel_crtc *crtc);
+void intel_alpm_lobf_enable(const struct intel_crtc_state *new_crtc_state);
 void intel_alpm_lobf_debugfs_add(struct intel_connector *connector);
 bool intel_alpm_aux_wake_supported(struct intel_dp *intel_dp);
 bool intel_alpm_aux_less_wake_supported(struct intel_dp *intel_dp);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 564d11925af3..739a0a74e008 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1008,6 +1008,24 @@ static bool intel_casf_disabling(const struct intel_crtc_state *old_crtc_state,
 	return is_disabling(hw.casf_params.casf_enable, old_crtc_state, new_crtc_state);
 }
 
+static bool intel_crtc_lobf_enabling(const struct intel_crtc_state *old_crtc_state,
+				     const struct intel_crtc_state *new_crtc_state)
+{
+	if (!new_crtc_state->hw.active)
+		return false;
+
+	return is_enabling(has_lobf, old_crtc_state, new_crtc_state);
+}
+
+static bool intel_crtc_lobf_disabling(const struct intel_crtc_state *old_crtc_state,
+				      const struct intel_crtc_state *new_crtc_state)
+{
+	if (!old_crtc_state->hw.active)
+		return false;
+
+	return is_disabling(has_lobf, old_crtc_state, new_crtc_state);
+}
+
 #undef is_disabling
 #undef is_enabling
 
@@ -1055,7 +1073,8 @@ static void intel_post_plane_update(struct intel_atomic_state *state,
 			adl_scaler_ecc_unmask(new_crtc_state);
 	}
 
-	intel_alpm_post_plane_update(state, crtc);
+	if (intel_crtc_lobf_enabling(old_crtc_state, new_crtc_state))
+		intel_alpm_lobf_enable(new_crtc_state);
 
 	intel_psr_post_plane_update(state, crtc);
 }
@@ -1152,7 +1171,9 @@ static void intel_pre_plane_update(struct intel_atomic_state *state,
 		intel_atomic_get_new_crtc_state(state, crtc);
 	enum pipe pipe = crtc->pipe;
 
-	intel_alpm_pre_plane_update(state, crtc);
+	if (intel_crtc_lobf_disabling(old_crtc_state, new_crtc_state))
+		intel_alpm_lobf_disable(new_crtc_state);
+
 	intel_psr_pre_plane_update(state, crtc);
 
 	if (intel_crtc_vrr_disabling(state, crtc)) {
-- 
2.45.2

