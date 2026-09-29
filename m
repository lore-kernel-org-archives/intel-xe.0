Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C042FCA5FB2
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 11:05:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1E410EE57;
	Tue, 29 Sep 2026 11:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PXbhZW1C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8DE10EE6B;
 Tue, 29 Sep 2026 11:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790679918; x=1822215918;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vH+842TfuSHToQ0pn7qALq170Gl6Rs/04bbIjw8bU0o=;
 b=PXbhZW1Ceu7tuCfJamo+6V2QGf7zcr8ihznb87wDLp6GLsvjniYrmHgz
 BBpKAmjtcYJVD1pxzsCFhhbxVGxK+3164+AKSNW53edgbmU7UXGiXZEt7
 xLYch/Qc1u8VbALPwVF755PCSWHfp+mlIJ1EmtMaS7dxFMxvLCLO1oK24
 hSuMaT4qQqvMIUXL6jOL6UxFWmV9yURw2r7sLebnG3qBPrtW/BRfsC1Mk
 cHzUtcM/cmY4mL/UTjhIBgOlEkZJ/z7+gRA/paP5tY0B9SsxGuPuoXndc
 whhNRC452u2XsQsgEA2g/EIEK7FTK9ZsKd76z/A6s7T4Axr4HopJJ+GQi A==;
X-CSE-ConnectionGUID: 8mtImI/fRzKp4m7ild5wwA==
X-CSE-MsgGUID: s7yi9mTRR2GNp9ffLOIFHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90295516"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90295516"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:05:11 -0700
X-CSE-ConnectionGUID: HV9AtkIdT5+V9+cFFLdIaw==
X-CSE-MsgGUID: wtwPdXF+QZC1aSXRovyO5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274887374"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:05:09 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, alexander.kaplan@sms-medipool.de,
 swati2.sharma@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v3 09/10] drm/i915/hdmi: Clamp the target_bpp only when it
 equals the pipe bpp
Date: Tue, 29 Sep 2026 16:18:34 +0530
Message-ID: <20260929104835.1050882-10-ankit.k.nautiyal@intel.com>
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

The max bpp from intel_hdmi_dsc_get_min_max_bpp() is at most the pipe
bpp, so when picking the compressed bpp we reduce the target to keep it
below the uncompressed pipe bpp. Doing this unconditionally makes the
search skip both the max and min boundaries, returning 0 when
max_dsc_bpp equals min_dsc_bpp.

That case isn't hit as of now, but an upcoming FRL link-bandwidth clamp
can make max_dsc_bpp == min_dsc_bpp.

Reduce the target only when it equals the uncompressed pipe bpp, start
at max_dsc_bpp otherwise, and iterate down to and including min_dsc_bpp.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Assisted-by: Claude:claude-opus-4.8
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 27 +++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 83a5a6e14ebc..ee76391c77e8 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3390,14 +3390,26 @@ intel_hdmi_dsc_bpp_fits_chunk_bytes(int bpp, int num_slices, int slice_width,
 	return target_bytes <= hdmi_max_chunk_bytes;
 }
 
+static int intel_hdmi_output_format_link_bpp_x16(enum intel_output_format output_format, int bpc)
+{
+	int pipe_bpp = 3 * bpc;
+
+	if (output_format == INTEL_OUTPUT_FORMAT_YCBCR420)
+		pipe_bpp /= 2;
+
+	return fxp_q4_from_int(pipe_bpp);
+}
+
 static int
-get_dsc_compressed_bpp(int num_slices, int slice_width, int hdmi_max_chunk_bytes,
+get_dsc_compressed_bpp(enum intel_output_format output_format, int bpc,
+		       int num_slices, int slice_width, int hdmi_max_chunk_bytes,
 		       int src_fractional_bpp, int min_dsc_bpp, int max_dsc_bpp)
 {
 	bool bpp_found = false;
 	int bpp_decrement_x16;
 	int bpp_target;
 	int bpp_target_x16;
+	int link_bpp_x16 = intel_hdmi_output_format_link_bpp_x16(output_format, bpc);
 
 	/*
 	 * The Sink has a limit of compressed data in bytes for a scanline,
@@ -3421,10 +3433,16 @@ get_dsc_compressed_bpp(int num_slices, int slice_width, int hdmi_max_chunk_bytes
 	/* src does not support fractional bpp implies decrement by 16 for bppx16 */
 	if (!src_fractional_bpp)
 		src_fractional_bpp = 1;
+
 	bpp_decrement_x16 = DIV_ROUND_UP(16, src_fractional_bpp);
-	bpp_target_x16 = (bpp_target * 16) - bpp_decrement_x16;
 
-	while (bpp_target_x16 > (min_dsc_bpp * 16)) {
+	bpp_target_x16 = (bpp_target * 16);
+
+	/* the compressed bpp cannot be same as the uncompressed pipe bpp */
+	if (link_bpp_x16 == bpp_target_x16)
+		bpp_target_x16 -= bpp_decrement_x16;
+
+	while (bpp_target_x16 >= (min_dsc_bpp * 16)) {
 		int bpp;
 
 		bpp = DIV_ROUND_UP(bpp_target_x16, 16);
@@ -3466,7 +3484,8 @@ intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
 	intel_hdmi_dsc_get_min_max_bpp(output_format, bpc, hdmi_all_bpp,
 				       &min_dsc_bpp, &max_dsc_bpp);
 
-	dsc_bpp_x16 = get_dsc_compressed_bpp(num_slices, slice_width,
+	dsc_bpp_x16 = get_dsc_compressed_bpp(output_format, bpc,
+					     num_slices, slice_width,
 					     hdmi_max_chunk_bytes,
 					     src_fractional_bpp,
 					     min_dsc_bpp, max_dsc_bpp);
-- 
2.50.1

