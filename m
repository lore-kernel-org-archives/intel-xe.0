Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02174606A32C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N1V7ejsy
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA137112A90;
	Fri, 20 Nov 2026 14:23:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CEC210E1CC;
 Fri, 20 Nov 2026 14:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184590; x=1826720590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cyIRckQnwOB729w8euiTezuJ+skC6CfzZNYZODwJ1q0=;
 b=N1V7ejsyE8ng2s/a/MbX7dftQqsktoOPhrOCs3n2gYI8mK9Knsx3d+ut
 QkFJwj6+pz0kQbqKdR7a9eiSLhoGp6jl+5V0ppN1PvLVCkORaD6CjCK/V
 4QClimqol8PT1XWdPk5IAV6nXKz45PuK7iS1AeCSUlSei2VUKoQEiKMDB
 L24dF4xEITcdGUSZHebvYAOK+gilqX8qHOmu0EF9Mc/q5CVd4eY1M9A2b
 D7A/S1XfIbyIAojolGDmLAf5WDEte9stAOHbeYf0DLOslt9t5Igh2srvH
 XnANtnyDMbj/JvTT2oB8cg18XqDXTLtrqjeEpZ/cd7EYtuT4WeRcJ1aBI Q==;
X-CSE-ConnectionGUID: ov+u/eREQW+cxp/DUUfpKQ==
X-CSE-MsgGUID: uVbHEz1gQui2jJNRUpiRmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4090887"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4090887"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:10 -0800
X-CSE-ConnectionGUID: W7W5NS7TRZiRJ+DNsTvMkw==
X-CSE-MsgGUID: MxOFG5pZTHel8+1gBgBc1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12421982"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:09 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 01/29] drm/i915/hdmi: Split the intel_hdmi_dsc_get_bpp()
Date: Fri, 20 Nov 2026 19:37:01 +0530
Message-ID: <20261120140729.466177-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
References: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Split the intel_hdmi_dsc_get_bpp() into two helper functions
that can be called independently.

While at it, improve the comments in the helper.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 97 ++++++++++++++---------
 1 file changed, 59 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 4ec0db8d93fb..a67bcc8ef691 100644
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

