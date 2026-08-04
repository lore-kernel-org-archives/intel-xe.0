Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBA5C55ABA
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 09:56:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A57A10E98A;
	Tue,  4 Aug 2026 09:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dXcWfwtp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D54410E98A;
 Tue,  4 Aug 2026 09:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785837414; x=1817373414;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ledaO8Y0jGfNtMtakRCsrV7FSdLTzO487eh9dfx+isE=;
 b=dXcWfwtp4WR3trv7aTqv2NoYnGhjlTqrxLE693fyZzAxV5oKUIrvL8Vu
 VhgicLIDXFZX08U8j0TvXuu6eNuFa/PkcsZzCUT+H9o1R92VowhTMaeeW
 piP9rgPohc722yID+nAMEJxq5eC5yapWCv6uoZmaotj53DxiH7iVzgumC
 ATlny4ppNvr/Pj07leIZQwE9T0rCTYrgLg50rh9jRLaP+pn6hh7M724Gt
 PtgQMOEvsTXopS5OCfmXd4XGtRgWZ5xdmKBPoChPAJ1itZynQLL/EQVCj
 98pmPWDC+i19vT11ZMaJkO/+DbG5EM6orYM9gYSl6WM8ZLm44rMumW686 g==;
X-CSE-ConnectionGUID: 0l5GT06MTPqaaiDBR7FY7A==
X-CSE-MsgGUID: Kro/tATbQha0gfb4b0HJzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="73922214"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="73922214"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 02:56:52 -0700
X-CSE-ConnectionGUID: TsN3i6KQRBOrEDyD7gKfmg==
X-CSE-MsgGUID: 3izzq0G+RgCW9Wg3H2QFVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="284846153"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 04 Aug 2026 02:45:58 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH] drm/i915/mst: let the branch-sink check uncompressed with
 18bpp
Date: Tue,  4 Aug 2026 15:14:50 +0530
Message-Id: <20260804094450.125307-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

mst_connector_mode_valid_ctx() uses a single 18bpp floor for both
the source-link BW check and the last-branch→sink PBN check, and
only drops it to the DSC-compressed minimum when the branch is in
DSC pass-through mode. This rejects modes on topologies where the
branch decodes DSC locally — the source→branch segment is actually
compressed and should not be gated by the 18bpp floor, while only
the last-branch→sink segment needs to remain at 18bpp.

The source-to-first-branch MST link carries DSC-compressed data
whenever any device along the path (a DSC pass-through branch, an
intermediate decoder-in-branch, or the endpoint sink) is able to
decode DSC. In all those cases the source can emit the stream
compressed and the check against the source link BW should use the
minimum compressed bpp, not the uncompressed 18bpp floor.

The last-branch-to-sink segment however is only compressed when the
path is true DSC pass-through; if the branch decodes locally and
re-transmits uncompressed, that segment must still fit at the
uncompressed 18bpp floor. That case is handled via port->full_pbn
below.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16640
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 23 +++++++++------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 3be1643f8d03..2e8f4c31e07f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1519,7 +1519,8 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
 	int max_rate, mode_rate, max_lanes, max_link_clock;
 	unsigned long bw_overhead_flags =
 		DRM_DP_BW_OVERHEAD_MST | DRM_DP_BW_OVERHEAD_SSC_REF_CLK;
-	int min_link_bpp_x16 = fxp_q4_from_int(18);
+	int src_min_link_bpp_x16 = fxp_q4_from_int(18);
+	int sink_min_link_bpp_x16 = fxp_q4_from_int(18);
 	struct intel_dp_link_config max_bw_config;
 	static bool supports_dsc;
 	int ret;
@@ -1549,9 +1550,13 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
 	supports_dsc = intel_dp_has_dsc(connector) &&
 		       drm_dp_sink_supports_fec(connector->dp.fec_capability);
 
+	if (supports_dsc && connector->dp.dsc_decompression_aux)
+		src_min_link_bpp_x16 =
+			intel_dp_compute_min_compressed_bpp_x16(connector,
+								INTEL_OUTPUT_FORMAT_RGB);
+
 	if (supports_dsc && connector->mst.port->passthrough_aux)
-		min_link_bpp_x16 = intel_dp_compute_min_compressed_bpp_x16(connector,
-									   INTEL_OUTPUT_FORMAT_RGB);
+		sink_min_link_bpp_x16 = src_min_link_bpp_x16;
 
 	intel_dp_link_caps_get_max_bw_config(intel_dp->link.caps, &max_bw_config);
 	max_link_clock = max_bw_config.rate;
@@ -1561,19 +1566,11 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
 					       max_link_clock, max_lanes);
 	mode_rate = intel_dp_link_required(max_link_clock, max_lanes,
 					   mode->clock, mode->hdisplay,
-					   min_link_bpp_x16,
+					   src_min_link_bpp_x16,
 					   bw_overhead_flags);
 
 	/*
 	 * TODO:
-	 * - Also check if compression would allow for the mode
-	 *   in non-passthrough mode, i.e. the last branch device
-	 *   decompressing the stream. This makes a difference only if
-	 *   the BW on the link between the last branch device and the
-	 *   sink is higher than the BW on the whole MST path from the
-	 *   source to the last branch device. Relying on the extra BW
-	 *   this provides also requires the
-	 *   DFP_Link_Available_Payload_Bandwidth_Number described below.
 	 * - Calculate the overhead using drm_dp_bw_overhead() /
 	 *   drm_dp_bw_channel_coding_efficiency(), similarly to the
 	 *   compute config code, as drm_dp_calc_pbn_mode() doesn't
@@ -1588,7 +1585,7 @@ mst_connector_mode_valid_ctx(struct drm_connector *_connector,
 		return ret;
 
 	if (mode_rate > max_rate ||
-	    drm_dp_calc_pbn_mode(mode->clock, min_link_bpp_x16) > port->full_pbn) {
+	    drm_dp_calc_pbn_mode(mode->clock, sink_min_link_bpp_x16) > port->full_pbn) {
 		*status = MODE_CLOCK_HIGH;
 		return 0;
 	}
-- 
2.25.1

