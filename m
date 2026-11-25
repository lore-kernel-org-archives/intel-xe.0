Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F068606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 05:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KDh7cqv2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151EF10E7C6;
	Wed, 25 Nov 2026 05:18:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB90B10E5E3;
 Wed, 25 Nov 2026 05:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795583888; x=1827119888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cyIRckQnwOB729w8euiTezuJ+skC6CfzZNYZODwJ1q0=;
 b=KDh7cqv2x3dLbdWB3pOaEkoBDZwl0qw4qS9kJsWRRKAqy7rDoNlDX8Yf
 D11Ff1DR12Ngl78rnyCG5d+kFkzOmn8cNy3C+dtbLFrpa/Swx14cy0LcG
 K6SzCA7k3CX6yexTe3pcV1GMRlJwb6aa4shv5kCKiVd5+oLBk5ut5XB0B
 ru5FfM3tildiyeae5G4s6byzJR1ohd7vbc80yM50jsNW50fGm2N1lH58x
 l9iAIz4wFZrCCL6z+pJFfs70otd2evqNxevG41lrmnI5Ljdl4SlXnSrbH
 nSnD0y8TUM9tCRUUeSa94uVI+dklcspCNzYmVGv6E/XHr4oHd5M+9bi8o w==;
X-CSE-ConnectionGUID: RYsYG6g3ThGHGWZCtx+Ivw==
X-CSE-MsgGUID: 2iEmjhqxTXS+aTeYhFwhaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4334163"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4334163"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 21:18:08 -0800
X-CSE-ConnectionGUID: wU3zKEpeRhuhHv0Bm1sGaQ==
X-CSE-MsgGUID: Ww543QeqT2SJiBVimweFuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="12092971"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 21:18:06 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 1/7] drm/i915/hdmi: Split the intel_hdmi_dsc_get_bpp()
Date: Wed, 25 Nov 2026 10:32:25 +0530
Message-ID: <20261125050231.1942380-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261125050231.1942380-1-ankit.k.nautiyal@intel.com>
References: <20261125050231.1942380-1-ankit.k.nautiyal@intel.com>
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

