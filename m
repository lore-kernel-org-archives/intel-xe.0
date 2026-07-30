Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492EBC5516C
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 11:09:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AA810EED7;
	Thu, 30 Jul 2026 11:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NvR18ehT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC60A10EED0;
 Thu, 30 Jul 2026 11:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785409780; x=1816945780;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bmSQ2Glg1DYJ5fwNGMvE28OQ4ZK7TQL+MupU91dpIKQ=;
 b=NvR18ehTt4RGQN9gR34x4JEsPrquMoZPhMan2jQmAxk3YLpSqOkbq926
 vMzwYSKLEffl/HGXzooE3hxNp3l8sc5uardmu75aVWJECCmdqDOzzE+M1
 k8Pb0hMjC5x3aOKWSaQcN+VfTo6XIwaYMXCa+O1XYdJaAZS4hrnDS4H3x
 4hQyF34OYYL7t+CqT3J7SfgNg2afEiZKK4ygbhTddcekytu0CA2LWpR7G
 x5Rgs9LhrbPB5KZMRu7Vcko548Q+YnGCodiXHdlTfNnZO/AuDkjvJKNdH
 vdiEAgVvHj76oqkMz0MqVg6Rq3NY76E3e+Z+nJsmTYHAzoobvPKn/rkDi w==;
X-CSE-ConnectionGUID: 0LK6y6LSSKW930UVF1Qw9g==
X-CSE-MsgGUID: qelORtgZRam42s6am0wIYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97182413"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="97182413"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:40 -0700
X-CSE-ConnectionGUID: GdcDGgn1SNW9lHYdWqUkEA==
X-CSE-MsgGUID: E+iA0ZQrSly6bbmQI2tIrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="265327112"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:38 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 06/14] drm/i915/dp: Add a wrapper to check frl/tmds downstream
 constraints
Date: Thu, 30 Jul 2026 16:22:18 +0530
Message-ID: <20260730105226.2731341-7-ankit.k.nautiyal@intel.com>
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

Add a wrapper function to check dp_downstream clock/bandwidth
constraints. Based on whether the sink supports FRL/TMDS the wrapper
calls the appropriate FRL/TMDS functions.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 36 ++++++++++++++++++-------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index eb76e6b6d616..6bf42128a81d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1206,6 +1206,28 @@ intel_dp_frl_bw_valid(struct intel_dp *intel_dp, int target_clock,
 	return MODE_OK;
 }
 
+static bool
+intel_dp_pcon_sink_support_frl(struct intel_dp *intel_dp)
+{
+	return intel_dp->dfp.pcon_max_frl_bw &&
+		intel_dp_hdmi_sink_max_frl(intel_dp);
+}
+
+static enum drm_mode_status
+intel_dp_hdmi_bw_valid(struct intel_dp *intel_dp,
+		       int target_clock, int bpc,
+		       enum intel_output_format sink_format,
+		       bool respect_downstream_limits)
+{
+	if (intel_dp_pcon_sink_support_frl(intel_dp))
+		return intel_dp_frl_bw_valid(intel_dp, target_clock, bpc,
+					     sink_format,
+					     respect_downstream_limits);
+
+	return intel_dp_tmds_clock_valid(intel_dp, target_clock, bpc, sink_format,
+					 respect_downstream_limits);
+}
+
 static enum drm_mode_status
 intel_dp_mode_valid_downstream(struct intel_connector *connector,
 			       const struct drm_display_mode *mode,
@@ -1213,20 +1235,14 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
 			       enum intel_output_format sink_format)
 {
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
+	int bpc = 8; /* Assume 8bpc for the DP++/HDMI/DVI TMDS/FRL bw check */
 
-	/* If PCON supports FRL MODE, check FRL bandwidth constraints */
-	if (intel_dp->dfp.pcon_max_frl_bw && intel_dp_hdmi_sink_max_frl(intel_dp)) {
-		/* Assume 8bpc for the HDMI2.1 FRL BW check */
-		return intel_dp_frl_bw_valid(intel_dp, target_clock, 8, sink_format, true);
-	}
-
-	if (intel_dp->dfp.max_dotclock &&
+	if (!intel_dp_hdmi_sink_max_frl(intel_dp) &&
+	    intel_dp->dfp.max_dotclock &&
 	    target_clock > intel_dp->dfp.max_dotclock)
 		return MODE_CLOCK_HIGH;
 
-	/* Assume 8bpc for the DP++/HDMI/DVI TMDS clock check */
-	return intel_dp_tmds_clock_valid(intel_dp, target_clock,
-					 8, sink_format, true);
+	return intel_dp_hdmi_bw_valid(intel_dp, target_clock, bpc, sink_format, true);
 }
 
 static enum drm_mode_status
-- 
2.50.1

