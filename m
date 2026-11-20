Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FBE606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RpiXsY/x
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED777112AA6;
	Fri, 20 Nov 2026 14:23:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D244710E8FA;
 Fri, 20 Nov 2026 14:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184598; x=1826720598;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WzZ+1XMlfjwQUqY0WgmJ4KzX8Y+7DkyWvASpfOfIYNo=;
 b=RpiXsY/xsOcQzMM/7NtV/IsDPe3JYaewn6jMhSLke5K2cBIAId5C61rz
 mOpnIr88eb2mXqBW4VQ4/LvFlG6GDLSQ+wp9RJFhEWe+DuePpMmaLwVt6
 w0GGs5HiQUBxBQ6sTO97aVVA2BkWclZDw3vTE4YRwFYQG066rUtfkAFWr
 6S6bd3O4YnGG+V3pitmGdBRQ59KGz0bhYuqtIlK5OCNprpe21II1+GbVb
 numCT05H3sLZGCOVITg8hYjRvVfw/pHIODjkekkE0w260xBmG5BW3B8ql
 5ZnejtZNebviIababK7/loihHWuzzmr+L+FQonCZn+yoaph2K79RGRSDq Q==;
X-CSE-ConnectionGUID: v6DaJbcCRqOhVmEMCv24Uw==
X-CSE-MsgGUID: WWM4TpN1RoSQNH+NKpeipw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4090906"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4090906"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:17 -0800
X-CSE-ConnectionGUID: eYFdstTKQe2+gSSpNPlQmg==
X-CSE-MsgGUID: D0W6KGo3S0ubtWKtxq3Zmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12421996"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:16 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 05/29] drm/i915/hdmi: Expose DSC min/max bpp helpers
Date: Fri, 20 Nov 2026 19:37:05 +0530
Message-ID: <20261120140729.466177-6-ankit.k.nautiyal@intel.com>
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

Expose intel_hdmi_dsc_get_min_max_bpp() to query the allowed compressed
bpp range.
This will be used in the subsequent change to compute the compressed bpp
range in mode_valid() for an HDMI with DSC connected to a DP DFP.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 20 +++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_hdmi.h |  2 ++
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index a67bcc8ef691..3321b673b3b6 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3325,9 +3325,19 @@ intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
 	return target_slices;
 }
 
-static void
-get_dsc_min_max_bpp(enum intel_output_format output_format, u8 bpc,
-		    bool hdmi_all_bpp, int *min_dsc_bpp, int *max_dsc_bpp)
+/*
+ * intel_hdmi_dsc_get_min_max_bpp - get the min and max compressed bpp range
+ * allowed for a given output format and bpc.
+ *
+ * @output_format: video output format
+ * @bpc: bits per color
+ * @hdmi_all_bpp: sink supports decoding of 1/16th bpp setting
+ * @min_dsc_bpp: returns the minimum allowed compressed bpp
+ * @max_dsc_bpp: returns the maximum allowed compressed bpp
+ */
+void
+intel_hdmi_dsc_get_min_max_bpp(enum intel_output_format output_format, u8 bpc,
+			       bool hdmi_all_bpp, int *min_dsc_bpp, int *max_dsc_bpp)
 {
 	/*
 	 * Get min bpp and max bpp that can be supported for a
@@ -3433,8 +3443,8 @@ intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
 	int max_dsc_bpp, min_dsc_bpp;
 	int dsc_bpp_x16;
 
-	get_dsc_min_max_bpp(output_format, bpc, hdmi_all_bpp,
-			    &min_dsc_bpp, &max_dsc_bpp);
+	intel_hdmi_dsc_get_min_max_bpp(output_format, bpc, hdmi_all_bpp,
+				       &min_dsc_bpp, &max_dsc_bpp);
 
 	dsc_bpp_x16 = get_dsc_compressed_bpp(num_slices, slice_width,
 					     hdmi_max_chunk_bytes,
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
index c95ed37bcc0c..3ab75ef4836e 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.h
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
@@ -57,6 +57,8 @@ int intel_hdmi_tmds_clock(int clock, int bpc, enum intel_output_format sink_form
 int intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width,
 			   int num_slices, enum intel_output_format output_format,
 			   int bpc, bool hdmi_all_bpp, int hdmi_max_chunk_bytes);
+void intel_hdmi_dsc_get_min_max_bpp(enum intel_output_format output_format, u8 bpc,
+				    bool hdmi_all_bpp, int *min_dsc_bpp, int *max_dsc_bpp);
 int intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
 				  enum intel_output_format output_format,
 				  int src_max_slices, int src_max_slice_width,
-- 
2.50.1

