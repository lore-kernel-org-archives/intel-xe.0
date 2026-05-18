Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701F7CD4F50
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 04:09:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3365210E5A3;
	Mon, 18 May 2026 04:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="buBgxYd2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F5A10E5A3;
 Mon, 18 May 2026 04:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779077383; x=1810613383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RHRb6nVAl57zrmnzYosbkT0f7PToF6pNtx8Nj+dBYsQ=;
 b=buBgxYd2kuhHyZmS9aZf2Ydai7U/nA/lCWAffXjEuhlLK7yMzPKLYQWo
 hfkKu2MCJPo6Hj1zetO1eUskFxPqUHY79B8C8s2l2DEXgHQp+ZWEOw+Yv
 v2QyWO/8rJDEfuyqm3S+K/NI7QoYumy0hy16L3NHVnVF+T7wjbzZvXATC
 pWGFV9RBdcfF+PhbG+GbQkPci8vlG4VW+LnCvB1h4Ke9Bgf7nYhyGfBrl
 TVV9uNXcVlxeREQx+zbCDl6r6z9BBbZic1N6U80bj/0vwME2Q/t7uL2Pn
 M645TZZMDiYWC51iZgCfy47qQkP/5Vg9m9rdsrOxh5P9TP0t6CFqtNiNk w==;
X-CSE-ConnectionGUID: E1PosRIMQoWlpdA1nPUeiA==
X-CSE-MsgGUID: H40EY2VhRLu7KI7EZM1vuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="97495620"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="97495620"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 21:09:43 -0700
X-CSE-ConnectionGUID: QC1pMp78QlmFIV1C1TxTnw==
X-CSE-MsgGUID: Gklzpx0DSneBY/QaWeMsWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="277403581"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 21:09:41 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 06/11] drm/i915/psr: Program Panel Replay CONFIG3 using AS SDP
 transmission time
Date: Mon, 18 May 2026 09:24:56 +0530
Message-ID: <20260518035502.2909359-7-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260518035502.2909359-1-ankit.k.nautiyal@intel.com>
References: <20260518035502.2909359-1-ankit.k.nautiyal@intel.com>
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

Panel Replay requires the AS SDP transmission time to be written into
PANEL_REPLAY_CONFIG3. This field was previously not programmed.

Use the AS SDP transmission-time helper to populate CONFIG3.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 363349bdb529..8f70b7dcd881 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -787,6 +787,7 @@ static void _panel_replay_enable_sink(struct intel_dp *intel_dp,
 				      const struct intel_crtc_state *crtc_state)
 {
 	u8 panel_replay_config[2];
+	u8 panel_replay_config_3;
 
 	panel_replay_config[0] = DP_PANEL_REPLAY_ENABLE |
 				 DP_PANEL_REPLAY_VSC_SDP_CRC_EN |
@@ -794,7 +795,6 @@ static void _panel_replay_enable_sink(struct intel_dp *intel_dp,
 				 DP_PANEL_REPLAY_RFB_STORAGE_ERROR_EN |
 				 DP_PANEL_REPLAY_ACTIVE_FRAME_CRC_ERROR_EN;
 	panel_replay_config[1] = DP_PANEL_REPLAY_CRC_VERIFICATION;
-
 	if (crtc_state->has_sel_update)
 		panel_replay_config[0] |= DP_PANEL_REPLAY_SU_ENABLE;
 
@@ -807,6 +807,9 @@ static void _panel_replay_enable_sink(struct intel_dp *intel_dp,
 
 	drm_dp_dpcd_write(&intel_dp->aux, PANEL_REPLAY_CONFIG,
 			  panel_replay_config, sizeof(panel_replay_config));
+
+	panel_replay_config_3 = intel_dp_as_sdp_transmission_time();
+	drm_dp_dpcd_writeb(&intel_dp->aux, PANEL_REPLAY_CONFIG3, panel_replay_config_3);
 }
 
 static void _psr_enable_sink(struct intel_dp *intel_dp,
-- 
2.45.2

