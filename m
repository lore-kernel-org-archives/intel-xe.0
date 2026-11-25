Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6891E606A321
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 05:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KQI/4ZbX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1412510EE63;
	Wed, 25 Nov 2026 05:18:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2675810E8F3;
 Wed, 25 Nov 2026 05:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795583895; x=1827119895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WzZ+1XMlfjwQUqY0WgmJ4KzX8Y+7DkyWvASpfOfIYNo=;
 b=KQI/4ZbX3qvWh0HVw7EE1+Z8WG3LkUAZlmVW7R/KJvIiNmAgk3FDftUP
 /A8fY9SpAjFgsDrC5bme5hzIc8l/GfozZF9pRfYHfNHZz03hY/bUcgMyE
 U3h0ieI+MTpDF5qar/yfvEDmgAibNfzredEI9Bp9U4VMSlEld5/sdg2Jb
 Fj+bk4CmsdkJelx6ZhAypQBnnAEpXwCyzs4uJnI9Okt/EBmbUJ6AQb9LH
 iYtVopq75qHoCA06dM506JgXdpTS+HB892sAsPgZo0OUXQE+UTMivFA9T
 n2el5WpmeV1wZFPGlgTN1hKS2YsMfQ6v+TVful7JYFVQYhQy6ACSRRwaI Q==;
X-CSE-ConnectionGUID: AXi4FP8tSHCF/9REHjuLcQ==
X-CSE-MsgGUID: H1rDdLq4RmWY2QV0TxZRMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4334172"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4334172"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 21:18:15 -0800
X-CSE-ConnectionGUID: ugb0Nzr/SDOo9QmXlw0PQw==
X-CSE-MsgGUID: NauN834oTOWsM0z5wZkHUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="12092990"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 21:18:13 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 5/7] drm/i915/hdmi: Expose DSC min/max bpp helpers
Date: Wed, 25 Nov 2026 10:32:29 +0530
Message-ID: <20261125050231.1942380-6-ankit.k.nautiyal@intel.com>
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

