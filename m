Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7F5606A325
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 11:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ELhygDki
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0DF10F5C2;
	Tue, 10 Nov 2026 11:56:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB1110F4EB;
 Tue, 10 Nov 2026 11:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794311778; x=1825847778;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E2Hc0dJ1tRLx6kpmEdX6B5biu4GEYTS27bmAkWWzFPA=;
 b=ELhygDkiUBtOonRNAy7ognAdBw4jkrSKChkICMYOBPJh3vzaciYWxgY1
 Z9VGZECHZfiMeCQ13CWDEyoaM30qc6hHOLUT3m2c53g8AihxdtxCE52F5
 Hl8Qn+c7P30nqPNXrZboVQK9AuWWLn9pxevY5Gv+FFFjz8juxkEgjQBWt
 9fPYMiaVuW0DkFlxUwNt3MVKGQQYdEEjo1akp7ecXGf8e9ybrRl1Qhyjj
 CyncYZk1mwRbhybRLhOokKXWfjbD1qi+PusZ3JBHiWpEoOQln4s6oPpS3
 D7/kIMXMoeHatGLE1vhk3xC63pyFeZEzFbv6OBfGt4fMXNVjep55gF0vq A==;
X-CSE-ConnectionGUID: cRYS2oDKT3Cgx8e27F8COg==
X-CSE-MsgGUID: Uco6awiLTiSTxE14XUDNMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3055639"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3055639"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 03:56:16 -0800
X-CSE-ConnectionGUID: HDAR/dJSQcWnToONlJzfYw==
X-CSE-MsgGUID: XAhgCcSHT1uwii2a2YqGxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8004339"
Received: from shawnle1-z890-eagle-wifi7.itwn.intel.com ([10.225.64.208])
 by orviesa005.jf.intel.com with ESMTP; 10 Nov 2026 03:56:15 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 3/4] drm/i915/dp: Start eDP link training from VBT fast link
 train vswing/pre-emphasis levels
Date: Tue, 10 Nov 2026 11:54:31 +0000
Message-ID: <20261110115432.894616-4-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110115432.894616-1-shawn.c.lee@intel.com>
References: <20261110115432.894616-1-shawn.c.lee@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Link training starts clock recovery at voltage swing/pre-emphasis level
0. If the VBT enables fast link training for eDP, start from VBT's fast
link training vswing/pre-emphasis levels instead. The sink's adjust
requests are still followed as before.

If link training with the VBT levels fails, the retry starts from level
0 as before, since the VBT levels are only used while link recovery is
idle.

Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 .../drm/i915/display/intel_dp_link_training.c | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 8c58cc5ddd40..836834505c56 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -423,6 +423,7 @@
  *
  * See also:
  *   - DOC: DisplayPort link training
+ *   - link_recovery_is_idle()
  *   - link_recovery_autoretrain_pending()
  *   - link_recovery_autoretrain_allowed()
  *   - link_recovery_has_no_fallback()
@@ -456,6 +457,12 @@ static struct intel_dp_link_training *connector_to_link_training(struct intel_co
 	return intel_attached_dp(connector)->link.training;
 }
 
+static bool
+link_recovery_is_idle(struct intel_dp_link_training *link_training)
+{
+	return link_training->recovery_state == INTEL_DP_LINK_RECOVERY_IDLE;
+}
+
 static void intel_dp_reset_lttpr_common_caps(struct intel_dp *intel_dp)
 {
 	memset(intel_dp->lttpr_common_caps, 0, sizeof(intel_dp->lttpr_common_caps));
@@ -1026,6 +1033,71 @@ void intel_dp_set_signal_levels(struct intel_dp *intel_dp,
 		encoder->set_signal_levels(encoder, crtc_state);
 }
 
+/*
+ * Use the VBT eDP fast link training vswing/pre-emphasis levels as the
+ * starting point of link training, if the VBT enables fast link training
+ * for the panel and the link config matches the VBT fast link training
+ * params the levels were provided for. Only do this while link recovery
+ * is idle, so that the retry after a failed link training starts from
+ * the default levels.
+ */
+static bool
+intel_dp_use_vbt_fast_link_levels(struct intel_dp *intel_dp,
+				  const struct intel_crtc_state *crtc_state,
+				  enum drm_dp_phy dp_phy)
+{
+	const struct intel_panel *panel = &intel_dp->attached_connector->panel;
+
+	if (dp_phy != DP_PHY_DPRX || !intel_dp_is_edp(intel_dp) ||
+	    intel_dp_is_uhbr(crtc_state))
+		return false;
+
+	if (!panel->vbt.edp.fast_link_training)
+		return false;
+
+	if (panel->vbt.edp.rate &&
+	    panel->vbt.edp.rate != crtc_state->port_clock)
+		return false;
+
+	if (panel->vbt.edp.lanes &&
+	    panel->vbt.edp.lanes != crtc_state->lane_count)
+		return false;
+
+	return link_recovery_is_idle(intel_dp->link.training);
+}
+
+/*
+ * Clamp the VBT levels to the PHY limits in the same way as the levels
+ * requested by the sink in intel_dp_get_lane_adjust_vswing_preemph().
+ */
+static void
+intel_dp_init_train_set_from_vbt(struct intel_dp *intel_dp,
+				 const struct intel_crtc_state *crtc_state,
+				 enum drm_dp_phy dp_phy)
+{
+	const struct intel_panel *panel = &intel_dp->attached_connector->panel;
+	u8 v = panel->vbt.edp.vswing;
+	u8 p = panel->vbt.edp.preemphasis;
+	u8 preemph_max, voltage_max;
+
+	preemph_max = intel_dp_phy_preemph_max(intel_dp, dp_phy);
+	if (p >= preemph_max)
+		p = preemph_max | DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
+
+	v = min(v, dp_voltage_max(p));
+
+	voltage_max = intel_dp_phy_voltage_max(intel_dp, crtc_state, dp_phy);
+	if (v >= voltage_max)
+		v = voltage_max | DP_TRAIN_MAX_SWING_REACHED;
+
+	memset(intel_dp->train_set, v | p, sizeof(intel_dp->train_set));
+
+	lt_dbg(intel_dp, dp_phy,
+	       "Using VBT fast link training levels: vswing %d, pre-emphasis %d\n",
+	       (v & DP_TRAIN_VOLTAGE_SWING_MASK) >> DP_TRAIN_VOLTAGE_SWING_SHIFT,
+	       (p & DP_TRAIN_PRE_EMPHASIS_MASK) >> DP_TRAIN_PRE_EMPHASIS_SHIFT);
+}
+
 static bool
 intel_dp_reset_link_train(struct intel_dp *intel_dp,
 			  const struct intel_crtc_state *crtc_state,
@@ -1033,6 +1105,10 @@ intel_dp_reset_link_train(struct intel_dp *intel_dp,
 			  u8 dp_train_pat)
 {
 	memset(intel_dp->train_set, 0, sizeof(intel_dp->train_set));
+
+	if (intel_dp_use_vbt_fast_link_levels(intel_dp, crtc_state, dp_phy))
+		intel_dp_init_train_set_from_vbt(intel_dp, crtc_state, dp_phy);
+
 	intel_dp_set_signal_levels(intel_dp, crtc_state, dp_phy);
 	return intel_dp_set_link_train(intel_dp, crtc_state, dp_phy, dp_train_pat);
 }
-- 
2.53.0

