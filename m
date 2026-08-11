Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C123CC5B570
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 04:59:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DE810E27C;
	Tue, 11 Aug 2026 04:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aVSbdfGt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D3A10E270;
 Tue, 11 Aug 2026 04:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786424373; x=1817960373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8LzAUP54bjwzT7pRERRlmtcj3WTTVd1HU9FjoeZyzbs=;
 b=aVSbdfGt+CPYGvPmvidQBUVVkSREZauTkBkuTk98EhN8p9IxfE+QJdSV
 /VSzm2UpL4Bj6EbQp6MqYbCOXrioYEni97hSATGw7cQPqo7gIJK901yJ3
 +/g0igCSj8QwA9IjMnC5qpYZ0V9Ss8+/EUrFAsEJIJ3y0G6W7fFHeoHEV
 6LKO9lFjV+b3Ff9uHKNILw8Q5D9DKqed75N+ndJToeRoW7kkU5PgZ/o5d
 iTIkmbQ+hixKmqxn8XTovr8LW2asiaYgFhV3iyTcLkyLysNiFmRixgniF
 hz6pFtq5yrT73LpWUOsW7KYvvxCPysBj4Yk9EmCM77VJocJ2l2qj/FFDl w==;
X-CSE-ConnectionGUID: XTkGU2JCTHGXKb3xaleOMA==
X-CSE-MsgGUID: 4k5OtuSVTiOURQjnPV5zvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86708323"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="86708323"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 21:59:32 -0700
X-CSE-ConnectionGUID: TN46sOraSQqxLHby2xUIqA==
X-CSE-MsgGUID: QwjiXn8KRfCNxNz5T1DJyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="267082746"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 21:59:30 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 3/8] drm/i915/dp: Add a wrapper to check frl/tmds
 downstream constraints
Date: Tue, 11 Aug 2026 10:12:29 +0530
Message-ID: <20260811044234.593986-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260811044234.593986-1-ankit.k.nautiyal@intel.com>
References: <20260811044234.593986-1-ankit.k.nautiyal@intel.com>
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
---
 drivers/gpu/drm/i915/display/intel_dp.c | 34 +++++++++++++++++--------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index dd706f7de62d..6296c3d32970 100644
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
@@ -1213,21 +1235,13 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
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

