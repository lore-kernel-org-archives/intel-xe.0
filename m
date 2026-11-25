Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6A7606A321
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 05:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cGIUBG5k
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8051110F079;
	Wed, 25 Nov 2026 05:18:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E506D10E854;
 Wed, 25 Nov 2026 05:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795583899; x=1827119899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FMF54UyTymw8KfoG7iX1TvOpuDWbOcHIOMAB9zLJs6o=;
 b=cGIUBG5k3oELs0tO5i86oxQEp0GIUGT1GFsRdRoWL9UGc1tz9OE0m53Z
 DlXxCKy6j5i0GPN8c3RZ0BtUc5nrUCwAkGYJc3Bj4gZUtUXyw7KP2SR+W
 w3DQDipWEu7QhcGAYdk/KPM+K1bFcRMdSRMrM0s/iG1MV6N9xx3WESh5N
 U38V9j//VuuEYq+mgbMuKPXnqMBt30t8dmHAL027diMHN1UhRMzi1JjeC
 zz/LGQmv0MprwQ5/lPdVHR4p4AtsZvWbw6G7gh3IaYjIejm21hKEUlhQu
 AOzzzIX2pSdWol4Bm/Anv2IUnQNOmIr2Ieg3pfX+jdHnZ+aL821x9vmwv Q==;
X-CSE-ConnectionGUID: gTf0C8MrT5eip0X3IqP1RA==
X-CSE-MsgGUID: 5FleFQadSqC4wLLCkd4PKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4334181"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4334181"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 21:18:19 -0800
X-CSE-ConnectionGUID: uZrnTMQRSnKHGuCLu8nzEw==
X-CSE-MsgGUID: RJzedjF5Qzqqq7I/lYqwcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="12093000"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 21:18:17 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 7/7] drm/i915/hdmi: Pass pixel clock to DSC slice helper
Date: Wed, 25 Nov 2026 10:32:31 +0530
Message-ID: <20261125050231.1942380-8-ankit.k.nautiyal@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pass the pixel clock explicitly to the DSC slice-count helper so callers
can use the effective clock for throughput validation.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c   | 1 +
 drivers/gpu/drm/i915/display/intel_hdmi.c | 3 ++-
 drivers/gpu/drm/i915/display/intel_hdmi.h | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 657bb56237f0..45e4812777cb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4533,6 +4533,7 @@ intel_dp_pcon_dsc_enc_slices(struct intel_dp *intel_dp,
 	int pcon_max_slice_width = drm_dp_pcon_dsc_max_slice_width(intel_dp->pcon_dsc_dpcd);
 
 	return intel_hdmi_dsc_get_num_slices(&crtc_state->hw.adjusted_mode,
+					     crtc_state->hw.adjusted_mode.crtc_clock,
 					     crtc_state->output_format,
 					     pcon_max_slices,
 					     pcon_max_slice_width,
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 027a337ad8b8..ac2172a5a320 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3217,6 +3217,7 @@ int intel_hdmi_dsc_get_slice_height(int vactive)
  * and dsc decoder capabilities
  *
  * @mode: drm_display_mode for which num of slices are needed
+ * @pixel_clock: pixel clock in kHz used for DSC throughput calculation
  * @output_format : pipe output format
  * @src_max_slices: maximum slices supported by the DSC encoder
  * @src_max_slice_width: maximum slice width supported by DSC encoder
@@ -3228,6 +3229,7 @@ int intel_hdmi_dsc_get_slice_height(int vactive)
  */
 int
 intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
+			      int pixel_clock,
 			      enum intel_output_format output_format,
 			      int src_max_slices, int src_max_slice_width,
 			      int hdmi_max_slices, int hdmi_throughput)
@@ -3250,7 +3252,6 @@ intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
 	int max_throughput; /* max clock freq. in khz per slice */
 	int max_slice_width;
 	int slice_width;
-	int pixel_clock = mode->crtc_clock;
 
 	if (!hdmi_throughput)
 		return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
index db87656eb27f..375f1b4decfb 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.h
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
@@ -62,6 +62,7 @@ void intel_hdmi_dsc_get_min_max_bpp(enum intel_output_format output_format, u8 b
 bool intel_hdmi_dsc_bpp_fits_chunk_bytes(int bpp, int num_slices, int slice_width,
 					 int hdmi_max_chunk_bytes);
 int intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
+				  int pixel_clock,
 				  enum intel_output_format output_format,
 				  int src_max_slices, int src_max_slice_width,
 				  int hdmi_max_slices, int hdmi_throughput);
-- 
2.50.1

