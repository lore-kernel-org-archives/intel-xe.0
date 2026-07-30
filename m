Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5D0C55160
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 11:10:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C1E10EEF5;
	Thu, 30 Jul 2026 11:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dRCDaW+7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E9F10EEE6;
 Thu, 30 Jul 2026 11:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785409792; x=1816945792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Aab58bIPX7esNz7PkiIgCG9h+c02Dj0eeZK4g9aLhC4=;
 b=dRCDaW+707uY20fYMT7xQbmwHkc9+Hlx3Gti9uQDtd0eKNfRixgRiza3
 kQ3dp4fbgE6qY3WswhrjeDDos36/p2KuIXRQfkD+TR3T3IryNOxUf0rji
 lLulBwF/pXje9aAZIC6VXBX6F1b+BNE2MB/CMaxNxSDrMcknPknx2SoS1
 m0MhaqLTS1iCeF1obBNOnuCgJgArca8KflwEAfAbb581kdLf5PITw+rcX
 MaX4s9YGyp+f+0Aa1ePxM9m6NRGdhwKrczYNjkYJrHvh33qB+KyahG0NM
 GUXc1EdRBwqBIKLx0wfIHun63lPHA571Ly4aooIniSCYHkbs7Hog1HLvE g==;
X-CSE-ConnectionGUID: S7AZQuUaR1mhg8ms+hIb1w==
X-CSE-MsgGUID: prGJAfnkQBGVRwpPDmoj0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97182435"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="97182435"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:52 -0700
X-CSE-ConnectionGUID: z8QzBr9RQUuul5yU8a3e1w==
X-CSE-MsgGUID: JML8qgU9RyunyYyu8IzaXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="265327195"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:49 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 12/14] drm/i915/dp: Clamp PCON DSC bpp to the FRL link
 bandwidth
Date: Thu, 30 Jul 2026 16:22:24 +0530
Message-ID: <20260730105226.2731341-13-ankit.k.nautiyal@intel.com>
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
index ff74a3dd3524..c316ff40d22d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4430,10 +4430,17 @@ intel_dp_pcon_dsc_enc_bpp(struct intel_dp *intel_dp,
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
index c26a3d0b2d2e..95393ec5d561 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3452,13 +3452,15 @@ get_dsc_compressed_bpp(int num_slices, int slice_width, int hdmi_max_chunk_bytes
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
@@ -3466,6 +3468,10 @@ intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
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
index e7d0cd5bc293..072c8d228697 100644
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

