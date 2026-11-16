Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0730E60A2611
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 14:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=duofgZ0o
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C061310F1EF;
	Mon, 16 Nov 2026 14:01:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7216E10F1E7;
 Mon, 16 Nov 2026 14:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794837660; x=1826373660;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R7dTe74ifAMlfIgWoXBXUx94ZWf3uiYvCOOYK/9ZS/0=;
 b=duofgZ0oe8OIfoGyoTnoDX3cXZ7PUUNq0zw/uKtOSpHMdmDHoH/tT6cd
 bu6iUiLd1yhw6YA1U3xQYmbGxZzRWZsLHq4AtIKRFvuciklQVQlHF4sl1
 paZL618AxOuGI1b+uvp69DaXny4ayd/utM3YSJhXf6pGtiThtlBhCilBq
 IBAWR1R7QWGNRXmiojp7mnT4v3IiOUKZd8/r3bIOgE0KsQQsqJts14gAh
 sawLtGqgdwSR90GRKB/sc58lrUbpkWIzSrBEXjr8mC+7+1EuTHHx3beE2
 4AWtGiKseHy8UW+r4woJn9eFkoAdptBwkcZIYYk1JB5VS1iHczh7hcRF8 Q==;
X-CSE-ConnectionGUID: 7c6ffEuNRvOGnk6IiQCthg==
X-CSE-MsgGUID: Ht6VzhXaRXGY2gqdxQ8qbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3609185"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3609185"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 06:00:58 -0800
X-CSE-ConnectionGUID: Bep8G5IgS16Gx9HUm5cwfg==
X-CSE-MsgGUID: HnYWo0K9QSiKpE10cV4Y/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9552071"
Received: from shawnle1-z890-eagle-wifi7.itwn.intel.com ([10.225.64.208])
 by orviesa006.jf.intel.com with ESMTP; 16 Nov 2026 06:00:56 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v2 3/4] drm/i915/dp: Start eDP link training from VBT fast
 link train vswing/pre-emphasis levels
Date: Mon, 16 Nov 2026 13:59:03 +0000
Message-ID: <20261116135904.59365-4-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116135904.59365-1-shawn.c.lee@intel.com>
References: <20261116135904.59365-1-shawn.c.lee@intel.com>
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
0. If the VBT enables fast link training for the eDP panel and, like
the Windows driver requires, the sink supports link training without
AUX handshake, start from the VBT fast link training vswing/pre-emphasis
levels instead, if the link rate and lane count match the VBT params.
The sink's adjust requests are still followed as before, with the
clock recovery retry and max vswing tracking accounting for the
non-zero initial levels.

If link training with the VBT levels fails, the retry starts from level
0 as before, since the VBT levels are only used while link recovery is
idle.

Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 .../drm/i915/display/intel_dp_link_training.c | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index ac1aff6edf05..54fe5900b584 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -422,6 +422,7 @@
  *
  * See also:
  *   - DOC: DisplayPort link training
+ *   - link_recovery_is_idle()
  *   - link_recovery_autoretrain_pending()
  *   - link_recovery_autoretrain_allowed()
  *   - link_recovery_has_no_fallback()
@@ -455,6 +456,12 @@ static struct intel_dp_link_training *connector_to_link_training(struct intel_co
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
@@ -1025,6 +1032,76 @@ void intel_dp_set_signal_levels(struct intel_dp *intel_dp,
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
+	/*
+	 * Like the Windows driver, use the VBT params only if the sink also
+	 * supports link training without AUX handshake.
+	 */
+	if (!panel->vbt.edp.fast_link_training ||
+	    !drm_dp_fast_training_cap(intel_dp->dpcd))
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
@@ -1032,6 +1109,10 @@ intel_dp_reset_link_train(struct intel_dp *intel_dp,
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
@@ -1350,6 +1431,35 @@ intel_dp_dump_link_status(struct intel_dp *intel_dp, enum drm_dp_phy dp_phy,
  * Perform the link training clock recovery phase on the given DP PHY using
  * training pattern 1.
  */
+/*
+ * Fill in the adjust request fields of @link_status with the current
+ * vswing/pre-emphasis levels, so that the first adjust request from the
+ * sink is compared against the levels actually used for the first clock
+ * recovery attempt, which may be non-zero (see
+ * intel_dp_init_train_set_from_vbt()).
+ */
+static void
+intel_dp_train_set_to_adjust_request(struct intel_dp *intel_dp,
+				     const struct intel_crtc_state *crtc_state,
+				     u8 link_status[DP_LINK_STATUS_SIZE])
+{
+	int lane;
+
+	for (lane = 0; lane < crtc_state->lane_count; lane++) {
+		u8 train_set = intel_dp->train_set[lane];
+		u8 v = (train_set & DP_TRAIN_VOLTAGE_SWING_MASK) >>
+			DP_TRAIN_VOLTAGE_SWING_SHIFT;
+		u8 p = (train_set & DP_TRAIN_PRE_EMPHASIS_MASK) >>
+			DP_TRAIN_PRE_EMPHASIS_SHIFT;
+		int i = DP_ADJUST_REQUEST_LANE0_1 - DP_LANE0_1_STATUS + (lane >> 1);
+		int shift = (lane & 1) * 4;
+
+		link_status[i] &= ~(0xf << shift);
+		link_status[i] |= (v << DP_ADJUST_VOLTAGE_SWING_LANE0_SHIFT |
+				   p << DP_ADJUST_PRE_EMPHASIS_LANE0_SHIFT) << shift;
+	}
+}
+
 static bool
 intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp,
 				      const struct intel_crtc_state *crtc_state,
@@ -1373,6 +1483,10 @@ intel_dp_link_training_clock_recovery(struct intel_dp *intel_dp,
 		return false;
 	}
 
+	/* The initial levels may be non-zero, see intel_dp_reset_link_train() */
+	intel_dp_train_set_to_adjust_request(intel_dp, crtc_state, old_link_status);
+	max_vswing_reached = intel_dp_link_max_vswing_reached(intel_dp, crtc_state);
+
 	/*
 	 * The DP 1.4 spec defines the max clock recovery retries value
 	 * as 10 but for pre-DP 1.4 devices we set a very tolerant
-- 
2.53.0

