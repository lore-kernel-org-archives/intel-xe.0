Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BC6CA5FB1
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 11:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E0810EE5D;
	Tue, 29 Sep 2026 11:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OCmAgeUV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9918A10EE2E;
 Tue, 29 Sep 2026 11:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790679915; x=1822215915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t2IHqCq5PGMZrb46mDMekdg7al5TJnCdFM8oinFe2K0=;
 b=OCmAgeUVdGG6i1knJXguWZwsNnDrIDJ7HuD9Q9dYAnjCAD7ZYq7C6Uo/
 jqDwoPWnHh5xlFXMOi9uD5QtFDPvvTuGCePQgYV+c9Au1lym5/g3eIPbZ
 8VOZpGj2GADPv3gzwCke7+ArRr/KTlxXVbH20D7KVphimMRSrKDS7ttEO
 s14sdZqiHAvmsaczOnQlGbNB7Z/0F+mf+TvdZlacsva+M4amizTrX/gK1
 gltBdS4vBtbJ46gzWyTJIJ6dc5OxFvJ/fnP7Uvt4uYW5XIN78N0R4i3E2
 ukgMg64t6ubtbLVHolhyN0+wWEhoCLk4F6vLxZKjlljXxmpIH/fOrRUOB Q==;
X-CSE-ConnectionGUID: fMYmBCU0QoaeMQ8ESlJfkg==
X-CSE-MsgGUID: aY5wjpvnTMeFOmzvPBXUcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90295485"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90295485"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:04:59 -0700
X-CSE-ConnectionGUID: p6Ic3KeuTBaumUzCYjeALQ==
X-CSE-MsgGUID: pL8eGCFESlurEc+h5vG/Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274887325"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:04:57 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, alexander.kaplan@sms-medipool.de,
 swati2.sharma@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v3 03/10] drm/i915/dp: Add a wrapper to check frl/tmds
 downstream constraints
Date: Tue, 29 Sep 2026 16:18:28 +0530
Message-ID: <20260929104835.1050882-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260929104835.1050882-1-ankit.k.nautiyal@intel.com>
References: <20260929104835.1050882-1-ankit.k.nautiyal@intel.com>
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

v2: Don't modify the dfp.maxdotclock check which deals with VGA.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 34 +++++++++++++++++--------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 11f51d049978..d03340aadc16 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1208,6 +1208,28 @@ intel_dp_frl_bw_valid(struct intel_dp *intel_dp, int target_clock,
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
@@ -1215,21 +1237,13 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
 			       enum intel_output_format sink_format)
 {
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
-
-	/*
-	 * If PCON supports FRL MODE, check FRL bandwidth constraints.
-	 * Assume 8bpc for the HDMI2.1 FRL BW check
-	 */
-	if (intel_dp->dfp.pcon_max_frl_bw && intel_dp_hdmi_sink_max_frl(intel_dp))
-		return intel_dp_frl_bw_valid(intel_dp, target_clock, 8, sink_format, true);
+	int bpc = 8; /* Assume 8bpc for the DP++/HDMI/DVI TMDS/FRL bw check */
 
 	if (intel_dp->dfp.max_dotclock &&
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

