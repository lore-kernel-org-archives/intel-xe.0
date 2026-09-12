Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8672C88E5A
	for <intel-xe@archiver.kernel.org>; Sat, 12 Sep 2026 17:25:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704DE10E295;
	Sat, 12 Sep 2026 17:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Urao3h1x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1C310E00A;
 Sat, 12 Sep 2026 17:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789233914; x=1820769914;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iPPmeZR4H3jd1dsJV0067eLxMSe3GD7xJfHWO4f+4E0=;
 b=Urao3h1x0hFTZ9ZJzCpoGM08o0mN1Ko8qQEp03EeP8FsQe8RWwsOEmB+
 hLDOSYs1RCewYui+1vXS8rwanRvysnlRUpehqTcJdgRzEiE8XDcv+jXoU
 gL2D2fV313ntydflHvlyRXUj9boPFI/vOEWD6/Tizc2wMAI1ESJlT6/T8
 MPDrrvthdyHHC+zPGbRcw/yU2zvFBk8SJEBBaqijUCV7NVcNzSeuOgEVM
 zlq76gbqvWj9lOfpVgLBQk7QVrkPamhshbq+rwnffZUWFIAozc06FbMSN
 hOl98obrM5ru9Df5JO17JKhcCKM8fhzQuE/WxhtEGP1MSBC5Nf2WzbxkC w==;
X-CSE-ConnectionGUID: m0IPI6UzSfe2YfGDfDu4NQ==
X-CSE-MsgGUID: YnCazfjsRHWHSDxhiPtKpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="89676747"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="89676747"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2026 10:25:12 -0700
X-CSE-ConnectionGUID: jkA7GCSbS225a4KGa19LvQ==
X-CSE-MsgGUID: iNX4/Y2WSlmStlUxk9DO5w==
X-ExtLoop1: 1
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 10:25:10 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH] drm/i915/dp: Expose sink max compressed bpp in debugfs
Date: Sat, 12 Sep 2026 23:04:04 +0530
Message-Id: <20260912173404.946030-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add DSC_Sink_Max_Compressed_BPP to the i915_dsc_fec_support
debugfs file, derived from the sink's DPCD DSC capabilities.

Max compressed bpp differs by output format, so print one
value per format: RGB, YCBCR420, and YCBCR444.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 .../drm/i915/display/intel_display_debugfs.c  | 23 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c       |  1 -
 drivers/gpu/drm/i915/display/intel_dp.h       |  3 +++
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 2bbf4760dc30..2e2956d6c28c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -906,7 +906,17 @@ static int i915_dsc_fec_support_show(struct seq_file *m, void *data)
 	struct intel_dp *intel_dp;
 	struct drm_modeset_acquire_ctx ctx;
 	struct intel_crtc_state *crtc_state = NULL;
+	static const struct {
+		enum intel_output_format format;
+		const char *name;
+	} dsc_formats[] = {
+		{ INTEL_OUTPUT_FORMAT_RGB, "RGB" },
+		{ INTEL_OUTPUT_FORMAT_YCBCR420, "YCBCR420" },
+		{ INTEL_OUTPUT_FORMAT_YCBCR444, "YCBCR444" },
+	};
+	u8 dsc_bpc[3] = {};
 	int ret = 0;
+	int i;
 	bool try_again = false;
 
 	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
@@ -955,6 +965,19 @@ static int i915_dsc_fec_support_show(struct seq_file *m, void *data)
 			   drm_dp_dsc_sink_bpp_incr(connector->dp.dsc_dpcd));
 		seq_printf(m, "DSC_Sink_Max_Slice_Count: %d\n",
 			   drm_dp_dsc_sink_max_slice_count((connector->dp.dsc_dpcd), intel_dp_is_edp(intel_dp)));
+		drm_dp_dsc_sink_supported_input_bpcs(connector->dp.dsc_dpcd, dsc_bpc);
+
+		seq_puts(m, "DSC_Sink_Max_Compressed_BPP:");
+		for (i = 0; i < ARRAY_SIZE(dsc_formats); i++) {
+			u16 max_bppx16 =
+				intel_dp_dsc_max_sink_compressed_bppx16(connector,
+									dsc_formats[i].format,
+									dsc_bpc[0]);
+
+			seq_printf(m, " %s: " FXP_Q4_FMT, dsc_formats[i].name,
+				   FXP_Q4_ARGS(max_bppx16));
+		}
+		seq_putc(m, '\n');
 		seq_printf(m, "Force_DSC_Enable: %s\n",
 			   str_yes_no(intel_dp->force_dsc_en));
 		if (!intel_dp_is_edp(intel_dp))
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 437b9e7bb864..5ef98102cdc1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2044,7 +2044,6 @@ static u16 intel_dp_dsc_max_delta_bppx16(const struct intel_connector *connector
 	return max_bpp << 4;
 }
 
-static
 u16 intel_dp_dsc_max_sink_compressed_bppx16(const struct intel_connector *connector,
 					    enum intel_output_format output_format,
 					    int bpc)
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 04fae203bb69..881674043c17 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -212,6 +212,9 @@ bool intel_dp_has_connector(struct intel_dp *intel_dp,
 int intel_dp_dsc_max_src_input_bpc(struct intel_display *display);
 int intel_dp_dsc_min_src_input_bpc(void);
 int intel_dp_dsc_min_src_compressed_bpp(void);
+u16 intel_dp_dsc_max_sink_compressed_bppx16(const struct intel_connector *connector,
+					    enum intel_output_format output_format,
+					    int bpc);
 int intel_dp_compute_min_hblank(struct intel_crtc_state *crtc_state,
 				const struct drm_connector_state *conn_state);
 
-- 
2.25.1

