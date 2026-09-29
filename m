Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71336CA5FAE
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 11:05:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222BF10EE52;
	Tue, 29 Sep 2026 11:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EyNKzZ8L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF89810EE4B;
 Tue, 29 Sep 2026 11:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790679918; x=1822215918;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h2GKquOOIJmHX8H7yKp7fMkCaRVtZZ7RP4UMhLcwPTU=;
 b=EyNKzZ8LBI7W6DPwHSh9XE8BYgPcPhciPlZDpEspHTWc5JyHA1bcUnlG
 qbf0iWw8mEFxNh25uZ05oZgEzsFsedZZXEvcLvVSGbJ2cGYZKZTNdmQpq
 La69a4SDg00aXAeDsakT3tH762x70KKM3mrKVy4LLJbkcfVLBTLnpTaUY
 VQFQgKjcxJzVhOLc0Is0tfHKh1ExhVUQYHt4OnbFPimgCm3gDidak7A3F
 A7hggvW6K8B7ZwbSS5i45TTGUR8IUzH3Wl5DaxRoMjpmlMnXuI/hHbxL8
 LGjrLOe1sNMakXqYMWzJsuMmGGdpAvtLO4BzJsyEarbyR0GWBCQ9CO5vY g==;
X-CSE-ConnectionGUID: NL3kJ4hkSQGWWIbZlfXmSA==
X-CSE-MsgGUID: fYHHZpNgQi2KHBT4SLzPCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90295512"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90295512"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:05:09 -0700
X-CSE-ConnectionGUID: 5Opi1LQmTUelw/7wTe8P5Q==
X-CSE-MsgGUID: KMWb424OT4yIx3LqjRLGZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274887369"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:05:08 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, alexander.kaplan@sms-medipool.de,
 swati2.sharma@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v3 08/10] drm/i915/dp: Allow PCON DSC modes through FRL bw
 check
Date: Tue, 29 Sep 2026 16:18:33 +0530
Message-ID: <20260929104835.1050882-9-ankit.k.nautiyal@intel.com>
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

v2: Account for FRL 16b/18b encoding overhead in link bandwidth. (Sashiko)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 84 ++++++++++++++++++++++---
 1 file changed, 75 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 412edb5b8c5e..dee49b99c09d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -127,6 +127,7 @@ bool intel_dp_is_edp(struct intel_dp *intel_dp)
 
 static void intel_dp_unset_edid(struct intel_dp *intel_dp);
 static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp);
+static bool intel_dp_is_hdmi_2_1_sink(struct intel_dp *intel_dp);
 
 /* Is link rate UHBR and thus 128b/132b? */
 bool intel_dp_is_uhbr(const struct intel_crtc_state *crtc_state)
@@ -1181,8 +1182,59 @@ static int frl_required_bw(int clock, int bpc,
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
+	num_slices = intel_hdmi_dsc_get_num_slices(mode, mode->clock,
+						   sink_format,
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
@@ -1201,11 +1253,22 @@ intel_dp_frl_bw_valid(struct intel_dp *intel_dp, int target_clock,
 	/* converting bw from Gbps to Kbps*/
 	max_frl_bw = max_frl_bw * 1000000;
 
-	/* #FIXME check bandwidth with DSC if both PCON and HDMI sink support DSC */
-	if (target_bw > max_frl_bw)
-		return MODE_CLOCK_HIGH;
+	/* FRL uses 16b/18b line coding; only 16/18 of the raw rate is payload */
+	max_frl_bw = max_frl_bw * 16 / 18;
 
-	return MODE_OK;
+	if (target_bw <= max_frl_bw)
+		return MODE_OK;
+
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
@@ -1217,13 +1280,14 @@ intel_dp_pcon_sink_support_frl(struct intel_dp *intel_dp)
 
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
@@ -1243,7 +1307,8 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
 	    target_clock > intel_dp->dfp.max_dotclock)
 		return MODE_CLOCK_HIGH;
 
-	return intel_dp_hdmi_bw_valid(intel_dp, target_clock, bpc, sink_format, true);
+	return intel_dp_hdmi_bw_valid(intel_dp, mode, target_clock, bpc,
+				      sink_format, true);
 }
 
 static enum drm_mode_status
@@ -1653,7 +1718,8 @@ static int intel_dp_hdmi_compute_bpc(struct intel_dp *intel_dp,
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

