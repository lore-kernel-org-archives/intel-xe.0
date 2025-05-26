Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA5FC54FB3
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 12:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCE110E345;
	Mon, 26 May 2025 12:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F7M1lYme";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F4510E344
 for <intel-xe@lists.freedesktop.org>; Mon, 26 May 2025 12:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748261139; x=1779797139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VzcLB2FIS2c4jphFdMOPCuK3pPYwVa17MiySlQkUNH8=;
 b=F7M1lYme52saCtafvi1R/v8VhCO5UTrKR8Tm5ZVDvaGjSJxk+cp7qlVr
 PFjGU6xaa89+66zZMy+dAgm6bBCBnOneFiYTK0xruE6PIqccYyaGmogyy
 Oz8fnwWfagyhk0D3xb5h+49nBLYpU2+pcJxe5onfz/BkApGEp8dU0PRc8
 zKiHeTMXi/cplSnzJXH6qUlVucQywsIrU/BzTcYZRvIBqx4By1GAivAbh
 wIGPpUedGRjU/4lJsph0TxAPnwWYs3oSXKXsQrZ8i8FNIqPj4q54KPp+U
 4cveQ6dxfhyh1Cc0BwwVWtFS87LyYM2pS4UydGuTMGKM3rUOgm5q1Si3C Q==;
X-CSE-ConnectionGUID: ifwT608nQXOXlInCf78Wew==
X-CSE-MsgGUID: FZZTZgCpQ6q9qHVYJkhG6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60492293"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="60492293"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:05:39 -0700
X-CSE-ConnectionGUID: jm2P3IoYTxq8diGc3SoISw==
X-CSE-MsgGUID: xrQDTjVoQOurPMf6K8ortw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="147576038"
Received: from johunt-mobl9.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:05:38 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v4 05/12] drm/i915/alpm: Write PR_ALPM_CTL register
Date: Mon, 26 May 2025 15:05:05 +0300
Message-ID: <20250526120512.1702815-6-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250526120512.1702815-1-jouni.hogander@intel.com>
References: <20250526120512.1702815-1-jouni.hogander@intel.com>
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

PR_ALPM_CTL register contains configurations related to Adaptive sync
sdp. Configure these if Adaptive Sync SDP is supported.

v2: avoid using hardcoded indices

Bspec: 71014
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index c176bdbc19a3..0890247085a7 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -348,6 +348,20 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 			ALPM_CTL_AUX_LESS_SLEEP_HOLD_TIME_50_SYMBOLS |
 			ALPM_CTL_AUX_LESS_WAKE_TIME(intel_dp->alpm_parameters.aux_less_wake_lines);
 
+		if (intel_dp->as_sdp_supported) {
+			u32 pr_alpm_ctl = PR_ALPM_CTL_ADAPTIVE_SYNC_SDP_POSITION_T1;
+
+			if (intel_dp->pr_dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_CAPABILITY)] &
+			    DP_PANEL_REPLAY_LINK_OFF_SUPPORTED_IN_PR_AFTER_ADAPTIVE_SYNC_SDP)
+				pr_alpm_ctl |= PR_ALPM_CTL_ALLOW_LINK_OFF_BETWEEN_AS_SDP_AND_SU;
+			if (!(intel_dp->pr_dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_CAPABILITY)] &
+						DP_PANEL_REPLAY_ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR))
+				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
+
+			intel_de_write(display, PR_ALPM_CTL(display, cpu_transcoder),
+				       pr_alpm_ctl);
+		}
+
 		intel_de_write(display,
 			       PORT_ALPM_CTL(port),
 			       PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE |
-- 
2.43.0

