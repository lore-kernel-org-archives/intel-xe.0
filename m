Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2390EC55165
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 11:10:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C6210EEF6;
	Thu, 30 Jul 2026 11:10:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KEq62HI5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7782C10EEE6;
 Thu, 30 Jul 2026 11:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785409796; x=1816945796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AevUTodhmFRMy5Gk9+FlSNxblJcDh3hwRGBTSiorEvg=;
 b=KEq62HI5CLHBpBoJ0OQkjG0AwcrU+D3xifI53QG4e9OUjvTgPHEQZjjN
 bpeXGh/qfJrH7bCE/A1SXIg743oEPLhD8aPXrCLfWjEFdNE13eAZ9cgMl
 HD5cBbBcPvpTcbQjH2leGFCgYTpg6grshAQZdbLx0Yr/8mk1kMhH/RTTI
 7Geyjf/igWoj1jIZiXO0jp2jZ9rBYPqF8keH9S5R63MDv6u4dakZMbeSL
 Enuml+ONZEG6pOwBoLfGjETBDRLABce1/8A9moVPLJbI+5kWT2sPVTNC9
 GA7PIw1ku4Qrh0snPNm2PzJt4JydTkqUjrvPMvnNoiSzBkgk3vJyPbyWE A==;
X-CSE-ConnectionGUID: 3NlLspTNTsaB0y0vq5hKoQ==
X-CSE-MsgGUID: lN391T4JS6uEc9cVKQu6Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97182441"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="97182441"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:56 -0700
X-CSE-ConnectionGUID: rqp5dQ76SnWQl05IlH751w==
X-CSE-MsgGUID: ekNRPW4fR6i32NrvQUKnjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="265327211"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:53 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 14/14] drm/i915/dp: Use helpers for getting max FRL rate
Date: Thu, 30 Jul 2026 16:22:26 +0530
Message-ID: <20260730105226.2731341-15-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260730105226.2731341-1-ankit.k.nautiyal@intel.com>
References: <20260730105226.2731341-1-ankit.k.nautiyal@intel.com>
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
---
 drivers/gpu/drm/i915/display/intel_dp.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index c316ff40d22d..db0f829426ad 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4223,14 +4223,9 @@ static int intel_dp_pcon_set_frl_mask(int max_frl)
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
@@ -4239,12 +4234,8 @@ static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp)
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

