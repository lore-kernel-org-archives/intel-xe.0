Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A63C5B56A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 04:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EF310EA5A;
	Tue, 11 Aug 2026 04:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cpUx0wDa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A77610E270;
 Tue, 11 Aug 2026 04:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786424373; x=1817960373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MWGfjyBdyTKxIl3zq3fqnteNVfUi/RzInK1m5GtykUI=;
 b=cpUx0wDabWlOdxsHHXcKgMVl5u8hJyLquVSmZMTPXzhOzrpBJCI78qWc
 uRJCZsAqkzLPE+JgXiBhBZ+AkEGWapYNdr0kvHZjOJ5XE1kYnSfZBNg2g
 YAT5ixaKXAaG/YDSGyNatkOvAQj61rPBxY9Tw/XCHcRNodm/nFre4FtTR
 6p1/P5fJd5nMmM+mUwEsAhYYGGHERBKxk32RiAWb8UzRuiNKStBQfn9a/
 KGS6AYo4DfOkkkr/hvea3Qhh8jetNN0SoxlpD1XSAORR4a24SDOlqwgM4
 28OLsohjE0/SDuNtcwfpL/tQpIl7goggGRCBskLHdNNPxAWWBPo9JW43r A==;
X-CSE-ConnectionGUID: ksFXfZm2SSe3qranq6B+BA==
X-CSE-MsgGUID: YCgLtO4mSJ+Hcf6E2OJ2Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86708316"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="86708316"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 21:59:31 -0700
X-CSE-ConnectionGUID: TOt9O7N/SZ+36FTW73A7dg==
X-CSE-MsgGUID: qfKKBMiPSxmBnCxhLnSx0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="267082734"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 21:59:28 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 2/8] drm/i915/dp: Fix FRL BW check for HDMI2.1 DFP
Date: Tue, 11 Aug 2026 10:12:28 +0530
Message-ID: <20260811044234.593986-3-ankit.k.nautiyal@intel.com>
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

The FRL bandwidth check considers only the PCON's max FRL rate, ignoring
the HDMI2.1 sink's own max FRL rate. Cap the available bandwidth by the
minimum of the two, similar to the TMDS case.

Move the check into a helper intel_dp_frl_bw_valid() so it can also be
used in the compute_config phase in a subsequent change.

The DSC case, where both the PCON and HDMI sink support DSC, is left
as a FIXME and handled later.

v2: Remove extra braces and re-format comment. (Suraj)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 51 ++++++++++++++++---------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 437b9e7bb864..dd706f7de62d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -124,6 +124,7 @@ bool intel_dp_is_edp(struct intel_dp *intel_dp)
 }
 
 static void intel_dp_unset_edid(struct intel_dp *intel_dp);
+static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp);
 
 /* Is link rate UHBR and thus 128b/132b? */
 bool intel_dp_is_uhbr(const struct intel_crtc_state *crtc_state)
@@ -1179,30 +1180,46 @@ static int frl_required_bw(int clock, int bpc,
 }
 
 static enum drm_mode_status
-intel_dp_mode_valid_downstream(struct intel_connector *connector,
-			       const struct drm_display_mode *mode,
-			       int target_clock,
-			       enum intel_output_format sink_format)
+intel_dp_frl_bw_valid(struct intel_dp *intel_dp, int target_clock,
+		      int bpc, enum intel_output_format sink_format,
+		      bool respect_downstream_limits)
 {
-	struct intel_dp *intel_dp = intel_attached_dp(connector);
+	int target_bw;
+	int max_frl_bw;
 
-	/* If PCON supports FRL MODE, check FRL bandwidth constraints */
-	if (intel_dp->dfp.pcon_max_frl_bw) {
-		int target_bw, max_frl_bw;
+	if (!respect_downstream_limits)
+		return MODE_OK;
 
-		/* Assume 8bpc for the FRL bandwidth check */
-		target_bw = frl_required_bw(target_clock, 8, sink_format);
+	target_bw = frl_required_bw(target_clock, bpc, sink_format);
 
-		max_frl_bw = intel_dp->dfp.pcon_max_frl_bw;
+	/* check for MAX FRL BW for both PCON and HDMI2.1 sink */
+	max_frl_bw = min(intel_dp->dfp.pcon_max_frl_bw,
+			 intel_dp_hdmi_sink_max_frl(intel_dp));
 
-		/* converting bw from Gbps to Kbps*/
-		max_frl_bw = max_frl_bw * 1000000;
+	/* converting bw from Gbps to Kbps*/
+	max_frl_bw = max_frl_bw * 1000000;
 
-		if (target_bw > max_frl_bw)
-			return MODE_CLOCK_HIGH;
+	/* #FIXME check bandwidth with DSC if both PCON and HDMI sink support DSC */
+	if (target_bw > max_frl_bw)
+		return MODE_CLOCK_HIGH;
 
-		return MODE_OK;
-	}
+	return MODE_OK;
+}
+
+static enum drm_mode_status
+intel_dp_mode_valid_downstream(struct intel_connector *connector,
+			       const struct drm_display_mode *mode,
+			       int target_clock,
+			       enum intel_output_format sink_format)
+{
+	struct intel_dp *intel_dp = intel_attached_dp(connector);
+
+	/*
+	 * If PCON supports FRL MODE, check FRL bandwidth constraints.
+	 * Assume 8bpc for the HDMI2.1 FRL BW check
+	 */
+	if (intel_dp->dfp.pcon_max_frl_bw && intel_dp_hdmi_sink_max_frl(intel_dp))
+		return intel_dp_frl_bw_valid(intel_dp, target_clock, 8, sink_format, true);
 
 	if (intel_dp->dfp.max_dotclock &&
 	    target_clock > intel_dp->dfp.max_dotclock)
-- 
2.50.1

