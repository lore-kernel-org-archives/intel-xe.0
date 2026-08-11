Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A15C5AC67
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 04:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CCF10EA4B;
	Tue, 11 Aug 2026 04:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YmR/Crbw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD78C10E174;
 Tue, 11 Aug 2026 04:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786424373; x=1817960373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=etTwf6bJvs0WT3ROEHttPtHKdz8zW6nlHdfio8QrTQA=;
 b=YmR/Crbw5oIpMddysenSfNJ0/J15mBB/8KZas+A7NIbc6q8GtZUPJ4yA
 ewIxjsfhPAABSChh1FJZ648DUqD9tvP1OJZizV3Kon/mOhrNbDBbiZgv2
 BI9jutXXwlx1UosYYqjJEYHABC3b4n0GQtm8E0r32/q8uukCP8LYigpBL
 c70RqrKObsp92x8HlVs2d0+Y4CDR7wZRlvD84HyVALqodA5ePJ35Z/Sjj
 KYejs4UeZ+7mcycn9X3xQuIFBVrBQlaky4Yo5suOtBMPU1ecg2omvKHTF
 gpBFr5DAWunqoNiL0ZKjAdFtPtaYtHYPhlUxmqF2jR+bc40qFjET80ZyL w==;
X-CSE-ConnectionGUID: uZP00pctSLOkPD8ph7oYaQ==
X-CSE-MsgGUID: A26bwpzwQFSUgzOGZ8bM9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86708318"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="86708318"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 21:59:31 -0700
X-CSE-ConnectionGUID: rIiRwD+pTSSCwKSrlF6hZQ==
X-CSE-MsgGUID: qIXvREiyRzy9AUe/iwf3HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="267082727"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 21:59:26 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 1/8] drm/i915/hdmi: Split the intel_hdmi_dsc_get_bpp()
Date: Tue, 11 Aug 2026 10:12:27 +0530
Message-ID: <20260811044234.593986-2-ankit.k.nautiyal@intel.com>
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

Split the intel_hdmi_dsc_get_bpp() into two helper functions
that can be called independently.

While at it, improve the comments in the helper.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 97 ++++++++++++++---------
 1 file changed, 59 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 9b637e38a1a5..df88d7c141f7 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3325,61 +3325,49 @@ intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
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
-	 * Get min bpp and max bpp as per Table 7.23, in HDMI2.1 spec
+	 * Get min bpp and max bpp that can be supported for a
+	 * given bpc and output format.
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
-	 * Taking into account if all dsc_all_bpp supported by HDMI2.1 sink
-	 * Section 7.7.34 : Source shall not enable compressed Video
-	 * Transport with bpp_target settings above 12 bpp unless
-	 * DSC_all_bpp is set to 1.
+	 * Don't enable DSC bpp_target settings above 12 bpp,
+	 * unless DSC_all_bpp is set to 1.
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
@@ -3423,6 +3411,39 @@ intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
 	return 0;
 }
 
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
+
 int intel_hdmi_sink_max_frl_rate(struct drm_connector *connector)
 {
 	int max_lanes = connector->display_info.hdmi.max_lanes;
-- 
2.50.1

