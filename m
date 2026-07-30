Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B92EC55165
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 11:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA59910EEDB;
	Thu, 30 Jul 2026 11:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BuA1EzsI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67D710EEC7;
 Thu, 30 Jul 2026 11:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785409776; x=1816945776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dI/g9sNyglzolJXwopbI8qA9Kf1cEh8GxaS3HwAAepQ=;
 b=BuA1EzsIBD/qJ9wsxAuAQdyd126D3C+NSvQsrXwlQAey6ev1t/HqUOTH
 viLoNTolMRCN+4/3ifxlgrYhXxgYt9DXaT5fqIzuJQQswDBqy1BIMCUle
 6pi0HkX6cAOaEu9wfGTe18pcGCxrHqj9uTr5aipZlEu6i/rMkkDtbdvUy
 zGe1ry7G2c8EcwfLBGVQLEjvd7C+Z4TCyUYjE2wbJ74q51Uy5JQa+M86j
 Lt8WFPHP7B85vGiRvyiCs4hM0ZswDiaA7VceTBmZjVY0tAK28T7OzT3YD
 oqCfvCf1/BgEBRUGlVXY2Gw+g69/dNdv9zy6pavoMY2NbEDoQxtwSSCxu Q==;
X-CSE-ConnectionGUID: SWf3mc9mRTKrFjugkxKgyA==
X-CSE-MsgGUID: bRuZQfoIT7CP9ERlcasMMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97182407"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="97182407"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:36 -0700
X-CSE-ConnectionGUID: FYojo1koS3yiH+e3iTKRKQ==
X-CSE-MsgGUID: b9vrOqgWRn2kj0tn1c8IUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="265327100"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:34 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 04/14] drm/i915/hdmi21/mtl: Split the intel_hdmi_dsc_get_bpp()
Date: Thu, 30 Jul 2026 16:22:16 +0530
Message-ID: <20260730105226.2731341-5-ankit.k.nautiyal@intel.com>
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

Split the intel_hdmi_dsc_get_bpp() into two helper functions
that can be called independently.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 88 ++++++++++++++---------
 1 file changed, 55 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index d3efd9e4e86a..428631abca74 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3325,51 +3325,29 @@ intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
 	return target_slices;
 }
 
-/*
- * intel_hdmi_dsc_get_bpp - get the appropriate compressed bits_per_pixel based on
- * source and sink capabilities.
- *
- * @src_fraction_bpp: fractional bpp supported by the source
- * @slice_width: dsc slice width supported by the source and sink
- * @num_slices: num of slices supported by the source and sink
- * @output_format: video output format
- * @bpc: bits per color
- * @hdmi_all_bpp: sink supports decoding of 1/16th bpp setting
- * @hdmi_max_chunk_bytes: max bytes in a line of chunks supported by sink
- *
- * @return: compressed bits_per_pixel in step of 1/16 of bits_per_pixel
- */
-int
-intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
-		       enum intel_output_format output_format, int bpc,
-		       bool hdmi_all_bpp, int hdmi_max_chunk_bytes)
+static void
+get_dsc_min_max_bpp(enum intel_output_format output_format, u8 bpc,
+		    bool hdmi_all_bpp, int *min_dsc_bpp, int *max_dsc_bpp)
 {
-	int max_dsc_bpp, min_dsc_bpp;
-	int target_bytes;
-	bool bpp_found = false;
-	int bpp_decrement_x16;
-	int bpp_target;
-	int bpp_target_x16;
-
 	/*
 	 * Get min bpp and max bpp as per Table 7.23, in HDMI2.1 spec
 	 * Start with the max bpp and keep on decrementing with
-	 * fractional bpp, if supported by PCON DSC encoder
+	 * fractional bpp, if supported by the DSC encoder
 	 *
 	 * for each bpp we check if no of bytes can be supported by HDMI sink
 	 */
 
 	if (output_format == INTEL_OUTPUT_FORMAT_YCBCR420) {
-		min_dsc_bpp = 6;
-		max_dsc_bpp = 3 * bpc / 2;
+		*min_dsc_bpp = 6;
+		*max_dsc_bpp = 3 * bpc / 2;
 	} else if (output_format == INTEL_OUTPUT_FORMAT_YCBCR444 ||
 		   output_format == INTEL_OUTPUT_FORMAT_RGB) {
-		min_dsc_bpp = 8;
-		max_dsc_bpp = 3 * bpc;
+		*min_dsc_bpp = 8;
+		*max_dsc_bpp = 3 * bpc;
 	} else {
 		/* Assuming 4:2:2 encoding */
-		min_dsc_bpp = 7;
-		max_dsc_bpp = 2 * bpc;
+		*min_dsc_bpp = 7;
+		*max_dsc_bpp = 2 * bpc;
 	}
 
 	/*
@@ -3379,7 +3357,18 @@ intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
 	 * DSC_all_bpp is set to 1.
 	 */
 	if (!hdmi_all_bpp)
-		max_dsc_bpp = min(max_dsc_bpp, 12);
+		*max_dsc_bpp = min(*max_dsc_bpp, 12);
+}
+
+static int
+get_dsc_compressed_bpp(int num_slices, int slice_width, int hdmi_max_chunk_bytes,
+		       int src_fractional_bpp, int min_dsc_bpp, int max_dsc_bpp)
+{
+	int target_bytes;
+	bool bpp_found = false;
+	int bpp_decrement_x16;
+	int bpp_target;
+	int bpp_target_x16;
 
 	/*
 	 * The Sink has a limit of compressed data in bytes for a scanline,
@@ -3422,3 +3411,36 @@ intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
 
 	return 0;
 }
+
+/*
+ * intel_hdmi_dsc_get_bpp - get the appropriate compressed bits_per_pixel based on
+ * source and sink capabilities.
+ *
+ * @src_fraction_bpp: fractional bpp supported by the source
+ * @slice_width: dsc slice width supported by the source and sink
+ * @num_slices: num of slices supported by the source and sink
+ * @output_format: video output format
+ * @bpc: bits per color
+ * @hdmi_all_bpp: sink supports decoding of 1/16th bpp setting
+ * @hdmi_max_chunk_bytes: max bytes in a line of chunks supported by sink
+ *
+ * @return: compressed bits_per_pixel in step of 1/16 of bits_per_pixel
+ */
+int
+intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
+		       enum intel_output_format output_format, int bpc,
+		       bool hdmi_all_bpp, int hdmi_max_chunk_bytes)
+{
+	int max_dsc_bpp, min_dsc_bpp;
+	int dsc_bpp_x16;
+
+	get_dsc_min_max_bpp(output_format, bpc, hdmi_all_bpp,
+			    &min_dsc_bpp, &max_dsc_bpp);
+
+	dsc_bpp_x16 = get_dsc_compressed_bpp(num_slices, slice_width,
+					     hdmi_max_chunk_bytes,
+					     src_fractional_bpp,
+					     min_dsc_bpp, max_dsc_bpp);
+
+	return dsc_bpp_x16;
+}
-- 
2.50.1

