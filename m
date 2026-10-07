Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F9CCA5FFF
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 08:34:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F95310F4AF;
	Wed,  7 Oct 2026 08:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kTUAGIMj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221B510F4AF;
 Wed,  7 Oct 2026 08:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791362096; x=1822898096;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zKjzEZuGrvRURiv/KV5XJmgbULbGGApaL1bnACPasa0=;
 b=kTUAGIMjM9wmAKY24A/ecmpABTp7VPJN0s/Ok0PM18KKRlvg1PmEcEyQ
 tk+ZeRu1Ze3TLNShttGg1eW6Mj0Ks2LCD/sARH1GN+rPmQcexq214858y
 OyvpGUzNqfVF/Q3SXGLixviJx45158av5/reFtqBzQTHu3oI09qmHPp6h
 9RxgJ7qNX7GYaA46zkIk09xgpIn1q0+r9nrKZEs8WIrAsseP1CdZoZlID
 PhKdF9L2u0TaA2wwMUbFW4DM4IyvAg4wjL/g6dvmwKGfXUtQ7DbHpPwRz
 FkiNwAfxNGtLLvsoZy21xNTM/+XBfnCUH1iGjUmI+PjHiHbCxCTdK1zP4 w==;
X-CSE-ConnectionGUID: z0kioHX4TLeyhY5ScWk3yw==
X-CSE-MsgGUID: 4ds8LzDFRLmxopRxV8CTcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="120425"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="120425"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 01:34:56 -0700
X-CSE-ConnectionGUID: Rhq3BYe1RCCPeZtalbTzMQ==
X-CSE-MsgGUID: fb8euMARR8mnSr3IN/asCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="4439"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 01:34:55 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jake Steinman <j@metarealtyinc.ca>
Subject: [PATCH] drm/i915/psr: ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR not
 valid for eDP
Date: Wed,  7 Oct 2026 11:34:43 +0300
Message-ID: <20261007083443.647649-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
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

EDP1.5 specification says:

"Although defined for the PR function in DP Standard, the
ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR and DSC_DECODE_NOT_SUPPORTED_IN_PR
bits (DPCD 000B1h[3, 2], respectively) are DP-specific and are therefore
not used in eDP."

Stop using SYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR on eDP.

Cc: Jake Steinman <j@metarealtyinc.ca>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 00d0146b26002..c2bb2c4071527 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1698,8 +1698,11 @@ static inline bool compute_link_off_after_as_sdp_when_pr_active(struct intel_con
 
 static inline bool compute_disable_as_sdp_when_pr_active(struct intel_connector *connector)
 {
-	return !(connector->dp.panel_replay_caps.dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_CAPABILITY)] &
-		 DP_PANEL_REPLAY_ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR);
+	struct intel_dp *intel_dp = intel_attached_dp(connector);
+
+	return intel_dp_is_edp(intel_dp) ? false :
+		!(connector->dp.panel_replay_caps.dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_CAPABILITY)] &
+		  DP_PANEL_REPLAY_ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR);
 }
 
 static bool _panel_replay_compute_config(struct intel_crtc_state *crtc_state,
-- 
2.43.0

