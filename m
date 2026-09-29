Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F43CA5FAC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 11:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDE110EE4A;
	Tue, 29 Sep 2026 11:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OV+B84pW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845C610E9D7;
 Tue, 29 Sep 2026 11:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790679915; x=1822215915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/QC3+liBYkNlo5+gzZ/Y1z0/wYiQ0j3yickLzQwDuPg=;
 b=OV+B84pWGkKFEvXbmBvdxSHDs2h9rfB+Yzv/uhNVNSQV19kUukgvUw+3
 NyWBDQODkhwISWny1U1f5/dEb7h4rTnfb1wsJ83Ky6wktqkzJSNdoX7gc
 Amjhef6POq/AP/ZvysZvz8IKQqzSYNzqEmPJ5sqPAXT2QJe3bSFI7b0QC
 nu3CJshIie73FRSzVLH00EQEmQ9jrmvMhnwQLLoxePUGH/ML2Z4s1+EiL
 lzFXOGJx1v0lkNNyRpStiWJ5nrZqZKT2Mk99KkAFaE24YbNYk52sVSJm4
 RkKI1donmkSwI099ZCBXzHZy8RlplVoJjDWBgjmKxpPJbCtWsMgFfUm41 w==;
X-CSE-ConnectionGUID: 0z0jelIqTQufV+v8nSukYA==
X-CSE-MsgGUID: Uh4ITgTUS1uJpb0XiytLAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90295479"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90295479"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:04:57 -0700
X-CSE-ConnectionGUID: 4/k1TRdoR3aUwYVgBuat7w==
X-CSE-MsgGUID: d0XY73XMRr2q23Rai5ab2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274887318"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:04:55 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, alexander.kaplan@sms-medipool.de,
 swati2.sharma@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v3 02/10] drm/i915/dp: Fix FRL BW check for HDMI2.1 DFP
Date: Tue, 29 Sep 2026 16:18:27 +0530
Message-ID: <20260929104835.1050882-3-ankit.k.nautiyal@intel.com>
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

The FRL bandwidth check considers only the PCON's max FRL rate, ignoring
the HDMI2.1 sink's own max FRL rate. Cap the available bandwidth by the
minimum of the two, similar to the TMDS case.

Move the check into a helper intel_dp_frl_bw_valid() so it can also be
used in the compute_config phase in a subsequent change.

The DSC case, where both the PCON and HDMI sink support DSC, is left
as a FIXME and handled later.

v2: Remove extra braces and re-format comment. (Suraj)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 51 ++++++++++++++++---------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index d8c0d9381471..11f51d049978 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -126,6 +126,7 @@ bool intel_dp_is_edp(struct intel_dp *intel_dp)
 }
 
 static void intel_dp_unset_edid(struct intel_dp *intel_dp);
+static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp);
 
 /* Is link rate UHBR and thus 128b/132b? */
 bool intel_dp_is_uhbr(const struct intel_crtc_state *crtc_state)
@@ -1181,30 +1182,46 @@ static int frl_required_bw(int clock, int bpc,
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

