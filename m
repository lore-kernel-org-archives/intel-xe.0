Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67DEC5B570
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 04:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A18310EA71;
	Tue, 11 Aug 2026 04:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="koG5r8Id";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084E510EA6C;
 Tue, 11 Aug 2026 04:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786424381; x=1817960381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L0X78rYG6iJaWhfRwBcXLwhNVMe1KGKsoUzda1HOWbE=;
 b=koG5r8Id5GJ4Ma7A+69Gf2JTYJ1r7e+FVvQDwL/rGLOe7PEsCVPWHsmY
 6KLzM6dvI4hB80Ass/S6fo5lMZgjZ92OOOrj/syyyNtt7J0GN7PPtGHqP
 h/B5w3fv9lEJAvGxSWh8TMkchtu/5WrPIXGI6MX+xVKcRBMzkFEWt6lTx
 8bMIPFC7PpGXB9Jton3vCK7+wSo/A7qHmPu33xK1+RzeYX87Zd4XYKZ/m
 /SBWPauSmdiu5dy2N9cOQahtrcr2AlpzYEo4Sf6/55+9FLKKhlCXS0nPv
 gU8NmFSZDUsUkeNCsWXYLF5wgEFWeE/dKhzt0HXNYoP2o6vERYRVxsExI w==;
X-CSE-ConnectionGUID: iiHuGcMpSx61AUC07JqmrA==
X-CSE-MsgGUID: Cor4qBw+SGqiMSNd3tHTcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86708337"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="86708337"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 21:59:41 -0700
X-CSE-ConnectionGUID: tClihTcESwW4B5GMD8htbg==
X-CSE-MsgGUID: CuT4qACPQJeIPqLLQ8c45A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="267082765"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 21:59:39 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 8/8] drm/i915/dp: Clamp PCON DSC bpp to the FRL link
 bandwidth
Date: Tue, 11 Aug 2026 10:12:34 +0530
Message-ID: <20260811044234.593986-9-ankit.k.nautiyal@intel.com>
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

While configuring the PCON DSC encoder, intel_hdmi_dsc_get_bpp() picks
the highest compressed bpp that fits the sink's per-scanline chunk-bytes
limit. However it does not account for the FRL link bandwidth, so the
selected bpp can end up exceeding what the trained PCON/sink FRL link can
actually carry.

Compute the maximum compressed bpp that the FRL bandwidth can carry and
pass it down to intel_hdmi_dsc_get_bpp() as an upper bound, so the chosen
DSC bpp stays within both the sink's chunk-bytes limit and the FRL link
budget. The mode_valid/compute phase already guarantees the lowest
compressed bpp fits the FRL bandwidth, so this cap never falls below the
minimum allowed bpp.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c   | 9 ++++++++-
 drivers/gpu/drm/i915/display/intel_hdmi.c | 8 +++++++-
 drivers/gpu/drm/i915/display/intel_hdmi.h | 3 ++-
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 938e11bc6a46..98c3ef1d39fa 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4425,10 +4425,17 @@ intel_dp_pcon_dsc_enc_bpp(struct intel_dp *intel_dp,
 	int hdmi_max_chunk_bytes =
 		info->hdmi.dsc_cap.total_chunk_kbytes * 1024;
 	int bpc = crtc_state->pipe_bpp / 3;
+	int clock = crtc_state->hw.adjusted_mode.clock;
+	int max_frl_bw, max_frl_bpp;
+
+	max_frl_bw = min(intel_dp->dfp.pcon_max_frl_bw,
+			 intel_dp_hdmi_sink_max_frl(intel_dp)) * 1000000;
+
+	max_frl_bpp = clock ? max_frl_bw / clock : 0;
 
 	return intel_hdmi_dsc_get_bpp(pcon_fractional_bpp, slice_width,
 				      num_slices, output_format, bpc, hdmi_all_bpp,
-				      hdmi_max_chunk_bytes);
+				      hdmi_max_chunk_bytes, max_frl_bpp);
 }
 
 void
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 6ab62a9e941c..7fcba556bdb1 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3451,13 +3451,15 @@ get_dsc_compressed_bpp(int num_slices, int slice_width, int hdmi_max_chunk_bytes
  * @bpc: bits per color
  * @hdmi_all_bpp: sink supports decoding of 1/16th bpp setting
  * @hdmi_max_chunk_bytes: max bytes in a line of chunks supported by sink
+ * @max_link_dsc_bpp: max compressed bpp the link bandwidth can carry, or 0 if not limited
  *
  * @return: compressed bits_per_pixel in step of 1/16 of bits_per_pixel
  */
 int
 intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
 		       enum intel_output_format output_format, int bpc,
-		       bool hdmi_all_bpp, int hdmi_max_chunk_bytes)
+		       bool hdmi_all_bpp, int hdmi_max_chunk_bytes,
+		       int max_link_dsc_bpp)
 {
 	int max_dsc_bpp, min_dsc_bpp;
 	int dsc_bpp_x16;
@@ -3465,6 +3467,10 @@ intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
 	intel_hdmi_dsc_get_min_max_bpp(output_format, bpc, hdmi_all_bpp,
 				       &min_dsc_bpp, &max_dsc_bpp);
 
+	/* Limit the bpp to what the link bandwidth can carry */
+	if (max_link_dsc_bpp)
+		max_dsc_bpp = min(max_dsc_bpp, max_link_dsc_bpp);
+
 	dsc_bpp_x16 = get_dsc_compressed_bpp(num_slices, slice_width,
 					     hdmi_max_chunk_bytes,
 					     src_fractional_bpp,
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
index db87656eb27f..f7a494df19e6 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.h
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
@@ -56,7 +56,8 @@ bool intel_hdmi_bpc_possible(const struct intel_crtc_state *crtc_state,
 int intel_hdmi_tmds_clock(int clock, int bpc, enum intel_output_format sink_format);
 int intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width,
 			   int num_slices, enum intel_output_format output_format,
-			   int bpc, bool hdmi_all_bpp, int hdmi_max_chunk_bytes);
+			   int bpc, bool hdmi_all_bpp, int hdmi_max_chunk_bytes,
+			   int max_link_dsc_bpp);
 void intel_hdmi_dsc_get_min_max_bpp(enum intel_output_format output_format, u8 bpc,
 				    bool hdmi_all_bpp, int *min_dsc_bpp, int *max_dsc_bpp);
 bool intel_hdmi_dsc_bpp_fits_chunk_bytes(int bpp, int num_slices, int slice_width,
-- 
2.50.1

