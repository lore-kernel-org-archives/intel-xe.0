Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3ECC55165
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 11:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EB610EECA;
	Thu, 30 Jul 2026 11:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ADK89Ez4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C492D10EECE;
 Thu, 30 Jul 2026 11:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785409778; x=1816945778;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2Vabscv2NJIzwy0z1ar8Jbf80uWIJWeG8z7mhaidJv0=;
 b=ADK89Ez44lcxqEg4E0vXZTQk/j0QbLAhQnYvJTKfDjIq5cTIFqkzCq4I
 0jHIChZb9NjRWAD7T7KCLlbuhJHS3XJThDpQDCtK9l31BY5xjBlbHJi4q
 pg0ft5RR/eTRwVuASw9k56oT6L0WquQbSu1N8nPYRxqth+1d069LB985v
 17dHBy0AQY/5OKC2lKqrfxeFEkIiVzsr7qU5ho+CUtzM+vJ+iECQSn2Xf
 aoep8mxG+NMqUGTPOJjLP3awgdelk8ifEopatCx2Wsj1OVYZvIYAW74Fg
 I/lWjZteyHMiDpqtgE+vqlfIrMCcVFG1c929MLjJoSufXu+rbY+lPKcAh Q==;
X-CSE-ConnectionGUID: oj9KVi4DR+CRII/zbM3P3g==
X-CSE-MsgGUID: STfLrZEEQ6SM7PRif2jHDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97182411"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="97182411"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:38 -0700
X-CSE-ConnectionGUID: Gmw6g5lSSZynva4aH2hzZQ==
X-CSE-MsgGUID: uASTSTwXTX6E8tCpmeDB5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="265327106"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:36 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 05/14] drm/i915/dp: Fix FRL BW check for HDMI2.1 DFP
Date: Thu, 30 Jul 2026 16:22:17 +0530
Message-ID: <20260730105226.2731341-6-ankit.k.nautiyal@intel.com>
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

The FRL bandwidth check considers only the PCON's max FRL rate, ignoring
the HDMI2.1 sink's own max FRL rate. Cap the available bandwidth by the
minimum of the two, similar to the TMDS case.

Move the check into a helper intel_dp_frl_bw_valid() so it can also be
used in the compute_config phase in a subsequent change.

The DSC case, where both the PCON and HDMI sink support DSC, is left
as a FIXME and handled later.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 46 +++++++++++++++++--------
 1 file changed, 31 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9d6f144d935f..eb76e6b6d616 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -124,6 +124,7 @@ bool intel_dp_is_edp(struct intel_dp *intel_dp)
 }
 
 static void intel_dp_unset_edid(struct intel_dp *intel_dp);
+static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp);
 
 /* Is link rate UHBR and thus 128b/132b? */
 bool intel_dp_is_uhbr(const struct intel_crtc_state *crtc_state)
@@ -1178,6 +1179,33 @@ static int frl_required_bw(int clock, int bpc,
 	return clock * bpc * 3;
 }
 
+static enum drm_mode_status
+intel_dp_frl_bw_valid(struct intel_dp *intel_dp, int target_clock,
+		      int bpc, enum intel_output_format sink_format,
+		      bool respect_downstream_limits)
+{
+	int target_bw;
+	int max_frl_bw;
+
+	if (!respect_downstream_limits)
+		return MODE_OK;
+
+	target_bw = frl_required_bw(target_clock, bpc, sink_format);
+
+	/* check for MAX FRL BW for both PCON and HDMI2.1 sink */
+	max_frl_bw = min(intel_dp->dfp.pcon_max_frl_bw,
+			 intel_dp_hdmi_sink_max_frl(intel_dp));
+
+	/* converting bw from Gbps to Kbps*/
+	max_frl_bw = max_frl_bw * 1000000;
+
+	/* #FIXME check bandwidth with DSC if both PCON and HDMI sink support DSC */
+	if (target_bw > max_frl_bw)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
 static enum drm_mode_status
 intel_dp_mode_valid_downstream(struct intel_connector *connector,
 			       const struct drm_display_mode *mode,
@@ -1187,21 +1215,9 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 
 	/* If PCON supports FRL MODE, check FRL bandwidth constraints */
-	if (intel_dp->dfp.pcon_max_frl_bw) {
-		int target_bw, max_frl_bw;
-
-		/* Assume 8bpc for the FRL bandwidth check */
-		target_bw = frl_required_bw(target_clock, 8, sink_format);
-
-		max_frl_bw = intel_dp->dfp.pcon_max_frl_bw;
-
-		/* converting bw from Gbps to Kbps*/
-		max_frl_bw = max_frl_bw * 1000000;
-
-		if (target_bw > max_frl_bw)
-			return MODE_CLOCK_HIGH;
-
-		return MODE_OK;
+	if (intel_dp->dfp.pcon_max_frl_bw && intel_dp_hdmi_sink_max_frl(intel_dp)) {
+		/* Assume 8bpc for the HDMI2.1 FRL BW check */
+		return intel_dp_frl_bw_valid(intel_dp, target_clock, 8, sink_format, true);
 	}
 
 	if (intel_dp->dfp.max_dotclock &&
-- 
2.50.1

