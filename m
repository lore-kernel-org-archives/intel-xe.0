Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510C4C5AC67
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 04:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D6A10EA6C;
	Tue, 11 Aug 2026 04:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yo4gFxxr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F1410EA6A;
 Tue, 11 Aug 2026 04:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786424379; x=1817960379;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5CJVaCBhA5lwZER+iDPB4PhsyvZtUUMhMPqtcxCyQhQ=;
 b=Yo4gFxxrEl/saV/xCX/m1jwVH/Bji7SZ/B9Q9UnOPLtvmWJppP5u146I
 YZ4ktKQsbgQYJbxGQ19vgOZ5UWsFxMA8g60apmOO+1dyyRyAQpo3092JF
 D/21T/1FNVxM1CxHmJr1nTyggBe40DrN1VL7FLN6PDkMDRaIjSVjuZndc
 tiqJuDQRm9epEuBtoxkL14gGlrvVbyX/iVw3SEY4DmYBamcupFiefiQ/d
 N4IH95TwtxL4CDWnxx2sPOuPPJODeGhJYFYbySzOeoOC99m2jQifEVFou
 OZiR0WgX3aFnfkx1/SqZ1bRmPPDuhrGhIA7NZgSXoIcyiJYw2cap/s6ek w==;
X-CSE-ConnectionGUID: zwTLtBeFTPCedS7rg7XgOw==
X-CSE-MsgGUID: KG7XmGyDSxmLj2EaASkWRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86708335"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="86708335"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 21:59:39 -0700
X-CSE-ConnectionGUID: woh5sjCjSXCArlMzN53EPA==
X-CSE-MsgGUID: G46pQwnkTpKfZJBep5UAiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="267082761"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 21:59:37 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 7/8] drm/i915/dp: Allow PCON DSC modes through FRL bw check
Date: Tue, 11 Aug 2026 10:12:33 +0530
Message-ID: <20260811044234.593986-8-ankit.k.nautiyal@intel.com>
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

intel_dp_frl_bw_valid() rejects any mode whose uncompressed FRL
bandwidth exceeds the PCON/sink max FRL bandwidth, even though we are
capable of enabling PCON DSC encoding at modeset time. As a result,
high-bandwidth HDMI2.1 modes (e.g. 4K120, 8K60) get pruned for sinks
behind a PCON, despite the PCON + sink being able to carry them with
DSC compression.

Now, that the HDMI DSC helpers no longer depend on intel_crtc_state,
reuse them from the FRL bandwidth check. When uncompressed transport does
not fit, compute the lowest compressed bpp allowed for the output format
and verify it:
 - fits the sink's per-scanline chunk-bytes limit and
 - resulets in the required FRL bandwidth within the PCON/sink limits.

This takes care of the existing FIXME in the FRL bandwidth check.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 80 ++++++++++++++++++++++---
 1 file changed, 71 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 652215fdb1a7..938e11bc6a46 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -125,6 +125,7 @@ bool intel_dp_is_edp(struct intel_dp *intel_dp)
 
 static void intel_dp_unset_edid(struct intel_dp *intel_dp);
 static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp);
+static bool intel_dp_is_hdmi_2_1_sink(struct intel_dp *intel_dp);
 
 /* Is link rate UHBR and thus 128b/132b? */
 bool intel_dp_is_uhbr(const struct intel_crtc_state *crtc_state)
@@ -1179,8 +1180,58 @@ static int frl_required_bw(int clock, int bpc,
 	return clock * bpc * 3;
 }
 
+static int frl_required_bw_dsc(int target_clock, int comp_bpp_x16)
+{
+	return DIV_ROUND_UP(target_clock * comp_bpp_x16, 16);
+}
+
+static bool
+intel_dp_pcon_dsc_fits_frl_bw(struct intel_dp *intel_dp,
+			      const struct drm_display_mode *mode,
+			      int bpc, enum intel_output_format sink_format,
+			      int max_frl_bw)
+{
+	struct intel_connector *connector = intel_dp->attached_connector;
+	const struct drm_display_info *info = &connector->base.display_info;
+	int min_dsc_bpp, max_dsc_bpp;
+	int num_slices, slice_width;
+	int hdmi_max_chunk_bytes;
+	int pcon_max_slices, pcon_max_slice_width;
+
+	/* PCON and HDMI sink must both support DSC 1.2 */
+	if (!info->hdmi.dsc_cap.v_1p2 ||
+	    !drm_dp_pcon_enc_is_dsc_1_2(intel_dp->pcon_dsc_dpcd))
+		return false;
+
+	pcon_max_slices = drm_dp_pcon_dsc_max_slices(intel_dp->pcon_dsc_dpcd);
+	pcon_max_slice_width = drm_dp_pcon_dsc_max_slice_width(intel_dp->pcon_dsc_dpcd);
+
+	num_slices = intel_hdmi_dsc_get_num_slices(mode, sink_format,
+						   pcon_max_slices,
+						   pcon_max_slice_width,
+						   info->hdmi.dsc_cap.max_slices,
+						   info->hdmi.dsc_cap.clk_per_slice);
+	if (!num_slices)
+		return false;
+
+	slice_width = DIV_ROUND_UP(mode->hdisplay, num_slices);
+
+	intel_hdmi_dsc_get_min_max_bpp(sink_format, bpc, info->hdmi.dsc_cap.all_bpp,
+				       &min_dsc_bpp, &max_dsc_bpp);
+
+	/* Use the lowest allowed compressed bpp for the best-case bandwidth */
+	hdmi_max_chunk_bytes = info->hdmi.dsc_cap.total_chunk_kbytes * 1024;
+	if (!intel_hdmi_dsc_bpp_fits_chunk_bytes(min_dsc_bpp, num_slices, slice_width,
+						 hdmi_max_chunk_bytes))
+		return false;
+
+	return frl_required_bw_dsc(mode->clock, min_dsc_bpp * 16) <= max_frl_bw;
+}
+
 static enum drm_mode_status
-intel_dp_frl_bw_valid(struct intel_dp *intel_dp, int target_clock,
+intel_dp_frl_bw_valid(struct intel_dp *intel_dp,
+		      const struct drm_display_mode *mode,
+		      int target_clock,
 		      int bpc, enum intel_output_format sink_format,
 		      bool respect_downstream_limits)
 {
@@ -1199,11 +1250,19 @@ intel_dp_frl_bw_valid(struct intel_dp *intel_dp, int target_clock,
 	/* converting bw from Gbps to Kbps*/
 	max_frl_bw = max_frl_bw * 1000000;
 
-	/* #FIXME check bandwidth with DSC if both PCON and HDMI sink support DSC */
-	if (target_bw > max_frl_bw)
-		return MODE_CLOCK_HIGH;
+	if (target_bw <= max_frl_bw)
+		return MODE_OK;
 
-	return MODE_OK;
+	/*
+	 * Uncompressed transport doesn't fit; if both PCON and HDMI sink
+	 * support DSC, check whether DSC compression brings it within limits.
+	 */
+	if (intel_dp_is_hdmi_2_1_sink(intel_dp) &&
+	    intel_dp_pcon_dsc_fits_frl_bw(intel_dp, mode, bpc, sink_format,
+					  max_frl_bw))
+		return MODE_OK;
+
+	return MODE_CLOCK_HIGH;
 }
 
 static bool
@@ -1215,13 +1274,14 @@ intel_dp_pcon_sink_support_frl(struct intel_dp *intel_dp)
 
 static enum drm_mode_status
 intel_dp_hdmi_bw_valid(struct intel_dp *intel_dp,
+		       const struct drm_display_mode *mode,
 		       int target_clock, int bpc,
 		       enum intel_output_format sink_format,
 		       bool respect_downstream_limits)
 {
 	if (intel_dp_pcon_sink_support_frl(intel_dp))
-		return intel_dp_frl_bw_valid(intel_dp, target_clock, bpc,
-					     sink_format,
+		return intel_dp_frl_bw_valid(intel_dp, mode,
+					     target_clock, bpc, sink_format,
 					     respect_downstream_limits);
 
 	return intel_dp_tmds_clock_valid(intel_dp, target_clock, bpc, sink_format,
@@ -1241,7 +1301,8 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
 	    target_clock > intel_dp->dfp.max_dotclock)
 		return MODE_CLOCK_HIGH;
 
-	return intel_dp_hdmi_bw_valid(intel_dp, target_clock, bpc, sink_format, true);
+	return intel_dp_hdmi_bw_valid(intel_dp, mode, target_clock, bpc,
+				      sink_format, true);
 }
 
 static enum drm_mode_status
@@ -1661,7 +1722,8 @@ static int intel_dp_hdmi_compute_bpc(struct intel_dp *intel_dp,
 	for (; bpc >= 8; bpc -= 2) {
 		if (intel_hdmi_bpc_possible(crtc_state, bpc,
 					    intel_dp_has_hdmi_sink(intel_dp)) &&
-		    intel_dp_hdmi_bw_valid(intel_dp, clock, bpc, crtc_state->sink_format,
+		    intel_dp_hdmi_bw_valid(intel_dp, &crtc_state->hw.adjusted_mode,
+					   clock, bpc, crtc_state->sink_format,
 					   respect_downstream_limits) == MODE_OK)
 			return bpc;
 	}
-- 
2.50.1

