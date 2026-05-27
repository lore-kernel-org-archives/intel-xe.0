Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDA7CD6E46
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 04:29:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA33410E735;
	Wed, 27 May 2026 04:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BR6Zu9wG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F73010E725;
 Wed, 27 May 2026 04:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779856147; x=1811392147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tgcXAnhJJ+6OP/++vFhKwteWWunqE+WsrDqcH+Pj+9k=;
 b=BR6Zu9wGPKpqE4RjM49JFowXg/U5uPuNKWae/l2JtlQnHXcKWiDxG0/V
 ID9y/DaGr2K81La41psCRUdGI/1DeeDlMzWFKYjVAHxgVdAgKYV1IjBud
 NFtKs6pkP6HQ3/qS5yO1igBp5QYbJyN0DUE6L+q93ErFEHQySa5jSCDaI
 fuYtJ5NqRCtZ8hAZFgJDNb/NqVTYZI4Vly+oRRTP0+lAWQktZtG87bH5l
 9L8Niwuj4TLI6VABXaB+yZ+mCwKKkUG+VIJCAp8IEZzzXzHmUocWN3tCz
 Bb26HyOoNSphM40zHn+dXqf0rVY+X/KJrR+4t+Yq7toFPJIcsbyc2JE49 Q==;
X-CSE-ConnectionGUID: tSPu9/mLSfC5BKyrHMJuMQ==
X-CSE-MsgGUID: PJDwCyeoRSisbioBdwY9wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80405811"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="80405811"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 21:28:59 -0700
X-CSE-ConnectionGUID: MYQX3cjERFOv6KwcLJ6w/w==
X-CSE-MsgGUID: QmvhzdBmQoOdiC5iE1wxEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="272452393"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 21:28:55 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 06/12] drm/i915/psr: Program Panel Replay CONFIG3 using AS SDP
 transmission time
Date: Wed, 27 May 2026 09:40:44 +0530
Message-ID: <20260527041050.601735-7-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260527041050.601735-1-ankit.k.nautiyal@intel.com>
References: <20260527041050.601735-1-ankit.k.nautiyal@intel.com>
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
index 9ee47881c2e2..a7c012e1571d 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -794,6 +794,7 @@ static void _panel_replay_enable_sink(struct intel_dp *intel_dp,
 				      const struct intel_crtc_state *crtc_state)
 {
 	u8 panel_replay_config[2];
+	u8 panel_replay_config_3;
 
 	panel_replay_config[0] = DP_PANEL_REPLAY_ENABLE |
 				 DP_PANEL_REPLAY_VSC_SDP_CRC_EN |
@@ -801,7 +802,6 @@ static void _panel_replay_enable_sink(struct intel_dp *intel_dp,
 				 DP_PANEL_REPLAY_RFB_STORAGE_ERROR_EN |
 				 DP_PANEL_REPLAY_ACTIVE_FRAME_CRC_ERROR_EN;
 	panel_replay_config[1] = DP_PANEL_REPLAY_CRC_VERIFICATION;
-
 	if (crtc_state->has_sel_update)
 		panel_replay_config[0] |= DP_PANEL_REPLAY_SU_ENABLE;
 
@@ -814,6 +814,9 @@ static void _panel_replay_enable_sink(struct intel_dp *intel_dp,
 
 	drm_dp_dpcd_write(&intel_dp->aux, PANEL_REPLAY_CONFIG,
 			  panel_replay_config, sizeof(panel_replay_config));
+
+	panel_replay_config_3 = intel_dp_as_sdp_transmission_time();
+	drm_dp_dpcd_writeb(&intel_dp->aux, PANEL_REPLAY_CONFIG3, panel_replay_config_3);
 }
 
 static void _psr_enable_sink(struct intel_dp *intel_dp,
-- 
2.45.2

