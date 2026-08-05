Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A860C55182
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 04:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B45010ECAD;
	Wed,  5 Aug 2026 04:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Td6l51f0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8050B10ECAC;
 Wed,  5 Aug 2026 04:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785902856; x=1817438856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gvGif1KaNB94i6Q25FISCsRE1/A2kjFVoPO6vlCmBBo=;
 b=Td6l51f09+Asvrs5bbYq4IrP8Mo9pbfN2CvQrUSlv9+n8o3fxmjKSxEm
 iwZpoSOCP5atp3qNCmRU7Y8082/VVjyYhsow/T/xLT8Rqu2bWFDVo67sK
 vqUBle9xTVkyhCTdpS2BcLLedO9D+H4+kKib4tYc6y4dECCvQW6bxQ3VS
 XY3X0GMtxhJf2+GcOneZKIHajivCPC1cFyStT6RXPINwQsu5My4FbUvJg
 BzJZ3BhYuoMQ/xhE1fNpMTQtr6aGG24EwIoxPhzpznPJfmJS8ybZxHHuG
 /h7D9GcSt9VDFNE22Eb4fhfrgjG2bSKDfeoe91jayn2o8jAjdIA/LYChi A==;
X-CSE-ConnectionGUID: bYckZrrwQtq+XUNi8CFlJg==
X-CSE-MsgGUID: TMxsTc0/SOSjdVguQ5AJtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90143536"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="90143536"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 21:07:36 -0700
X-CSE-ConnectionGUID: h7I549lbRY2ucmK/vo+FLg==
X-CSE-MsgGUID: V2kCBdxGQKiScsaRzEn90w==
X-ExtLoop1: 1
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 21:07:33 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 5/5] drm/i915/dp: Use helpers for getting max FRL rate
Date: Wed,  5 Aug 2026 09:20:27 +0530
Message-ID: <20260805035027.3473398-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260805035027.3473398-1-ankit.k.nautiyal@intel.com>
References: <20260805035027.3473398-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
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

Use intel_hdmi_sink_max_frl_rate() and intel_hdmi_sink_dsc_max_frl_rate()
helpers instead of open-coding the FRL rate calculation.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index d029cea1055d..437b9e7bb864 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4134,14 +4134,9 @@ static int intel_dp_pcon_set_frl_mask(int max_frl)
 static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp)
 {
 	struct intel_connector *connector = intel_dp->attached_connector;
-	const struct drm_display_info *info = &connector->base.display_info;
-	int max_frl_rate;
-	int max_lanes, rate_per_lane;
-	int max_dsc_lanes, dsc_rate_per_lane;
-
-	max_lanes = info->hdmi.max_lanes;
-	rate_per_lane = info->hdmi.max_frl_rate_per_lane;
-	max_frl_rate = max_lanes * rate_per_lane;
+	struct drm_connector *drm_connector = &connector->base;
+	int max_frl_rate = intel_hdmi_sink_max_frl_rate(drm_connector);
+	int dsc_max_frl_rate = intel_hdmi_sink_dsc_max_frl_rate(drm_connector);
 
 	/*
 	 * The sink's DSC max FRL rate only applies to compressed video
@@ -4150,12 +4145,8 @@ static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp)
 	 * the regular max FRL rate is the limit.
 	 */
 	if (drm_dp_pcon_enc_is_dsc_1_2(intel_dp->pcon_dsc_dpcd) &&
-	    info->hdmi.dsc_cap.v_1p2) {
-		max_dsc_lanes = info->hdmi.dsc_cap.max_lanes;
-		dsc_rate_per_lane = info->hdmi.dsc_cap.max_frl_rate_per_lane;
-		if (max_dsc_lanes && dsc_rate_per_lane)
-			max_frl_rate = min(max_frl_rate, max_dsc_lanes * dsc_rate_per_lane);
-	}
+	    dsc_max_frl_rate)
+		return min(max_frl_rate, dsc_max_frl_rate);
 
 	return max_frl_rate;
 }
-- 
2.50.1

