Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351FFCD343F
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 05:27:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E366910E678;
	Mon, 18 May 2026 05:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HrUW2RcU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDFE10E66C;
 Mon, 18 May 2026 05:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779082016; x=1810618016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RHRb6nVAl57zrmnzYosbkT0f7PToF6pNtx8Nj+dBYsQ=;
 b=HrUW2RcUvsNVr0bh0YI5rwKuhc0rXoodkOuExvVTghmmeoL/qjrJ+wcT
 UCbHJKmfXmus8XF8BZ1op4h50poNebUbZSbE6ZxTH0El0u2W4/zvuPL9N
 VHCP96XKDO/uTpHB2G40/jFkXt/obC7o787jb1Ope9y562lcoqwJkP8Sf
 O9k+sultMNqOEZhobXVjuIc3Ndy7HvBoAn0/XqLOkOwrun7ORLMCi7oP0
 kRvvxwIcTkus3f42Uz9p7/lBK0uk0vb3EKL8g9ij1X/mtc2HH2aT2rEJJ
 GCXrvJF5NUzT/oT9LLo5ZYWbtrvwu1KZYbaOmrjyxwLjO+4RH24mqJxaq g==;
X-CSE-ConnectionGUID: kAAFg18eQ8K9RwHR4aHlIg==
X-CSE-MsgGUID: hs7bRqA3QT2JzA5n+rqAGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79064926"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="79064926"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 22:26:55 -0700
X-CSE-ConnectionGUID: 8iK8VqXkQZG/ZAESf6udQg==
X-CSE-MsgGUID: 2alZxZW9T6+fX9OvztmHuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="243606196"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 22:26:54 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 06/12] drm/i915/psr: Program Panel Replay CONFIG3 using AS SDP
 transmission time
Date: Mon, 18 May 2026 10:42:09 +0530
Message-ID: <20260518051216.2936634-7-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260518051216.2936634-1-ankit.k.nautiyal@intel.com>
References: <20260518051216.2936634-1-ankit.k.nautiyal@intel.com>
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

