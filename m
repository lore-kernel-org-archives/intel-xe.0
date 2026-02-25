Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EA0F357DA
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 07:42:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D705A10E6CE;
	Wed, 25 Feb 2026 07:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YbKel7BX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E929B10E6C9;
 Wed, 25 Feb 2026 07:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772005356; x=1803541356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ORCbiEoyiZ2JW4B6lY2IVRyIYrbvK39WkJTKu1pRs5U=;
 b=YbKel7BXhUrNZxGR5B+FNjkzU/56XwCsuql4L67nQrBdydy8NFUmw1iY
 nQZist3yQGMnJKLQWcjfsVve48h7xDqRwIps8IblaTQFU1mCMmjXcQE29
 X5IpuTnescMZz/7o3Fc4kkC4ASMUDU4T6xaJOj8fRoTyIgowjakph0DIU
 CPEAV1gfEEoocqVfLiVqfhu1in3ju/6IqZTyGNi4NiKy3GYAxnf6MmeNF
 3UvdEKfCP1JVCUJKl2tQoeBv+KDacp9FZdc+xyeKBwMpGlTrkIKcFuLQ9
 Xo0Zydf4+pTCvf32goLZR0GREtb2SQj9vffzP/10xP3RkwDO846KSgaSC Q==;
X-CSE-ConnectionGUID: tfjD9HLeRFGCiz085sRI8Q==
X-CSE-MsgGUID: anR2Hg27RdiPTOMK4KJp4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="90615843"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="90615843"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 23:42:36 -0800
X-CSE-ConnectionGUID: 23EBc5dlSP2rWxu6W0Szrw==
X-CSE-MsgGUID: mBLxiCjTSu6fVi3BGH1akg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="216295502"
Received: from vpanait-mobl.ger.corp.intel.com (HELO jhogande-mobl3.intel.com)
 ([10.245.244.5])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 23:42:35 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH 2/2] drm/i915/psr: Fix for Panel Replay X granularity DPCD
 register handling
Date: Wed, 25 Feb 2026 09:42:21 +0200
Message-ID: <20260225074221.1744330-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225074221.1744330-1-jouni.hogander@intel.com>
References: <20260225074221.1744330-1-jouni.hogander@intel.com>
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

DP specification is saying value 0xff 0xff in PANEL REPLAY SELECTIVE UPDATE
X GRANULARITY CAPABILITY registers (0xb2 and 0xb3) means full-line
granularity. Take this into account when handling Panel Replay X
granularity informed by the panel.

Fixes: 1cc854647450 ("drm/i915/psr: Use SU granularity information available in intel_connector")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7284
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 5bea2eda744b..9296ca3a4ff4 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1306,9 +1306,14 @@ static bool psr2_granularity_check(struct intel_crtc_state *crtc_state,
 	u16 sink_y_granularity = crtc_state->has_panel_replay ?
 		connector->dp.panel_replay_caps.su_y_granularity :
 		connector->dp.psr_caps.su_y_granularity;
-	u16 sink_w_granularity =  crtc_state->has_panel_replay ?
-		connector->dp.panel_replay_caps.su_w_granularity :
-		connector->dp.psr_caps.su_w_granularity;
+	u16 sink_w_granularity;
+
+	if (crtc_state->has_panel_replay)
+		sink_w_granularity = connector->dp.panel_replay_caps.su_w_granularity ==
+			DP_PANEL_REPLAY_FULL_LINE_GRANULARITY ?
+			crtc_hdisplay : connector->dp.panel_replay_caps.su_w_granularity;
+	else
+		sink_w_granularity = connector->dp.psr_caps.su_w_granularity;
 
 	/* PSR2 HW only send full lines so we only need to validate the width */
 	if (crtc_hdisplay % sink_w_granularity)
-- 
2.43.0

