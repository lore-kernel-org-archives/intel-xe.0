Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D4EC88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 08:30:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE7310E881;
	Wed, 16 Sep 2026 08:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TSs7qfBb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2703110E881;
 Wed, 16 Sep 2026 08:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789547419; x=1821083419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=doocxSRWTVP5/2Arw0DQsPl2NLJ4BWKPNRGA5KXr/dQ=;
 b=TSs7qfBb8S6Rq25ZunzasSoi1lCpekrn+467ViTB+l+431pIkJkHh6g0
 22oYwublHzadCvY36TGkL78zICSqXxb6+GbAbi3IT7L4SPMNEA3oV8VT3
 KN59rKHWhqCj9IYemQqfLAY2En3sNcmCBc5nkFMjrvEXabQUQrcxtkVxv
 sTCtypHxVkPK3Vwf6HJ5bvvh2Zc6oHFOKmdoVzaPV74BgLfU3t5f8dXON
 eJRdYOObdwj3qTIHJ3t6UTIWfl9E9iYPzLrpwq4EdBjCaankNQmG7equ4
 2TQtvWLau3Gqi8ulx0rawx30CK74y0KJbW3htFmdRcYLkXSKQInAAfnRk Q==;
X-CSE-ConnectionGUID: aTdm8xzBQVSwAE0lAfgbEg==
X-CSE-MsgGUID: 5N8BdtKDTomfoRBe5OMyxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="429641"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="429641"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:30:19 -0700
X-CSE-ConnectionGUID: 8NEZ0aBTTP6MChrieKEclw==
X-CSE-MsgGUID: ZAyyH6DrQV+8FSMKEeGcMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1496960"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:30:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 08/11] drm/i915/dp: switch link training to
 drm_dp_dpcd_{read_byte, read_data, write_byte, write_data}()
Date: Wed, 16 Sep 2026 11:29:39 +0300
Message-ID: <c88130676c7b8187a5e5954cdbd36c316950d89f.1789547331.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789547331.git.jani.nikula@intel.com>
References: <cover.1789547331.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Switch to the modern DPCD access functions that return negative error
codes on errors, -EIO for incomplete access, and 0 on success.

Use local ret variables for the return value instead of checking inline,
where sensible.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../drm/i915/display/intel_dp_link_training.c | 48 ++++++++++---------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index cb92cff90614..6096930fe3a1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -929,7 +929,7 @@ intel_dp_set_link_train(struct intel_dp *intel_dp,
 {
 	int reg = intel_dp_training_pattern_set_reg(intel_dp, dp_phy);
 	u8 buf[sizeof(intel_dp->train_set) + 1];
-	int len;
+	int ret, len;
 
 	intel_dp_program_link_training_pattern(intel_dp, crtc_state,
 					       dp_phy, dp_train_pat);
@@ -939,7 +939,9 @@ intel_dp_set_link_train(struct intel_dp *intel_dp,
 	memcpy(buf + 1, intel_dp->train_set, crtc_state->lane_count);
 	len = crtc_state->lane_count + 1;
 
-	return drm_dp_dpcd_write(&intel_dp->aux, reg, buf, len) == len;
+	ret = drm_dp_dpcd_write_data(&intel_dp->aux, reg, buf, len);
+
+	return !ret;
 }
 
 static char dp_training_pattern_name(u8 train_pat)
@@ -1046,10 +1048,10 @@ intel_dp_update_link_train(struct intel_dp *intel_dp,
 
 	intel_dp_set_signal_levels(intel_dp, crtc_state, dp_phy);
 
-	ret = drm_dp_dpcd_write(&intel_dp->aux, reg,
-				intel_dp->train_set, crtc_state->lane_count);
+	ret = drm_dp_dpcd_write_data(&intel_dp->aux, reg,
+				     intel_dp->train_set, crtc_state->lane_count);
 
-	return ret == crtc_state->lane_count;
+	return !ret;
 }
 
 /* 128b/132b */
@@ -1115,7 +1117,7 @@ void intel_dp_link_training_set_mode(struct intel_dp *intel_dp, int link_rate,
 	link_config[0] |= pr_with_as_sdp_enable ? DP_FIXED_VTOTAL_AS_SDP_EN_IN_PR_ACTIVE : 0;
 	link_config[1] = drm_dp_is_uhbr_rate(link_rate) ?
 			 DP_SET_ANSI_128B132B : DP_SET_ANSI_8B10B;
-	drm_dp_dpcd_write(&intel_dp->aux, DP_DOWNSPREAD_CTRL, link_config, 2);
+	drm_dp_dpcd_write_data(&intel_dp->aux, DP_DOWNSPREAD_CTRL, link_config, 2);
 }
 
 static bool
@@ -1163,8 +1165,8 @@ void intel_dp_link_training_set_bw(struct intel_dp *intel_dp,
 		/* DP and eDP v1.3 and earlier link bw set method. */
 		u8 link_config[] = { link_bw, lane_count };
 
-		drm_dp_dpcd_write(&intel_dp->aux, DP_LINK_BW_SET, link_config,
-				  ARRAY_SIZE(link_config));
+		drm_dp_dpcd_write_data(&intel_dp->aux, DP_LINK_BW_SET, link_config,
+				       sizeof(link_config));
 	} else {
 		/*
 		 * eDP v1.4 and later link rate set method.
@@ -1175,8 +1177,8 @@ void intel_dp_link_training_set_bw(struct intel_dp *intel_dp,
 		 * eDP v1.5 sinks allow choosing either, and the last choice
 		 * shall be active.
 		 */
-		drm_dp_dpcd_writeb(&intel_dp->aux, DP_LANE_COUNT_SET, lane_count);
-		drm_dp_dpcd_writeb(&intel_dp->aux, DP_LINK_RATE_SET, rate_select);
+		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_LANE_COUNT_SET, lane_count);
+		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_LINK_RATE_SET, rate_select);
 	}
 }
 
@@ -1286,8 +1288,8 @@ intel_dp_prepare_link_train(struct intel_dp *intel_dp,
 
 		lt_dbg(intel_dp, DP_PHY_DPRX, "Reloading eDP link rates\n");
 
-		drm_dp_dpcd_read(&intel_dp->aux, DP_SUPPORTED_LINK_RATES,
-				 sink_rates, sizeof(sink_rates));
+		drm_dp_dpcd_read_data(&intel_dp->aux, DP_SUPPORTED_LINK_RATES,
+				      sink_rates, sizeof(sink_rates));
 	}
 
 	if (link_bw)
@@ -1612,7 +1614,7 @@ static void intel_dp_stop_post_lt_adj_req(struct intel_dp *intel_dp,
 	if (crtc_state->enhanced_framing)
 		lane_count |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
 
-	drm_dp_dpcd_writeb(&intel_dp->aux, DP_LANE_COUNT_SET, lane_count);
+	drm_dp_dpcd_write_byte(&intel_dp->aux, DP_LANE_COUNT_SET, lane_count);
 }
 
 static bool intel_dp_disable_dpcd_training_pattern(struct intel_dp *intel_dp,
@@ -1621,7 +1623,7 @@ static bool intel_dp_disable_dpcd_training_pattern(struct intel_dp *intel_dp,
 	int reg = intel_dp_training_pattern_set_reg(intel_dp, dp_phy);
 	u8 val = DP_TRAINING_PATTERN_DISABLE;
 
-	return drm_dp_dpcd_write(&intel_dp->aux, reg, &val, 1) == 1;
+	return drm_dp_dpcd_write_byte(&intel_dp->aux, reg, val) == 0;
 }
 
 static int
@@ -1631,10 +1633,10 @@ intel_dp_128b132b_intra_hop(struct intel_dp *intel_dp,
 	u8 sink_status;
 	int ret;
 
-	ret = drm_dp_dpcd_readb(&intel_dp->aux, DP_SINK_STATUS, &sink_status);
-	if (ret != 1) {
+	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_SINK_STATUS, &sink_status);
+	if (ret < 0) {
 		lt_dbg(intel_dp, DP_PHY_DPRX, "Failed to read sink status\n");
-		return ret < 0 ? ret : -EIO;
+		return ret;
 	}
 
 	return sink_status & DP_INTRA_HOP_AUX_REPLY_INDICATION ? 1 : 0;
@@ -2173,9 +2175,11 @@ intel_dp_128b132b_lane_cds(struct intel_dp *intel_dp,
 {
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	unsigned long deadline;
+	int ret;
 
-	if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_TRAINING_PATTERN_SET,
-			       DP_TRAINING_PATTERN_2_CDS) != 1) {
+	ret = drm_dp_dpcd_write_byte(&intel_dp->aux, DP_TRAINING_PATTERN_SET,
+				     DP_TRAINING_PATTERN_2_CDS);
+	if (ret < 0) {
 		lt_err(intel_dp, DP_PHY_DPRX, "Failed to start 128b/132b TPS2 CDS\n");
 		return false;
 	}
@@ -2363,9 +2367,9 @@ void intel_dp_128b132b_sdp_crc16(struct intel_dp *intel_dp,
 		return;
 
 	/* DP v2.0 SCR on SDP CRC16 for 128b/132b Link Layer */
-	drm_dp_dpcd_writeb(&intel_dp->aux,
-			   DP_SDP_ERROR_DETECTION_CONFIGURATION,
-			   DP_SDP_CRC16_128B132B_EN);
+	drm_dp_dpcd_write_byte(&intel_dp->aux,
+			       DP_SDP_ERROR_DETECTION_CONFIGURATION,
+			       DP_SDP_CRC16_128B132B_EN);
 
 	lt_dbg(intel_dp, DP_PHY_DPRX, "DP2.0 SDP CRC16 for 128b/132b enabled\n");
 }
-- 
2.47.3

