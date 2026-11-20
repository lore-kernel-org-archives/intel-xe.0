Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD48606A337
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RfdXs23W
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE6A112AE7;
	Fri, 20 Nov 2026 14:24:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE680112ADF;
 Fri, 20 Nov 2026 14:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184649; x=1826720649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k8oFI/+0k9YONqEKabbVZ+Huk32BQqBQfFQYU/XPLQA=;
 b=RfdXs23WCbjfWH0O7RtjgyC/3sz02CErFaCzFJw+XUu5URyELbAmHDP2
 SXLusKsExDapYqeKrKNVkUaMFUcjHm+1i7cQvCZ84sdGZUv0VnbMhHmsr
 aZuh/+73r7Cj0MpwAka8oJEcBn3g7wkw4A5mQGLkhjJx3hiCZKKXKAWV3
 U6FmBAU2uqT2dQFyV9dQ/uMnxNGFnb4Mqh5km5PBIdSUGBr6nq3JYlryc
 XMdzahfmCi+QdGweYAq/CRSA3jKrp8nhiJRixiLrVl3CKMvMVdP/37KAA
 m5rCfluGUZYlg7tLBEQT1t63/xUMxj3W25+a/wXqJlX9k1vhT7EtnBXDV w==;
X-CSE-ConnectionGUID: RhFtD61rTEqKj4yvIf3wGg==
X-CSE-MsgGUID: Y5fqfnSaSvOf/sE7a5yrmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4091029"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4091029"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:51 -0800
X-CSE-ConnectionGUID: LU+3YaIhRJWFGgk/xrD8Rg==
X-CSE-MsgGUID: wpE6uHoVQSOys8w5s95hFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12422066"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:50 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 25/29] drm/i915/dp: Allow limiting the DSC slice count for the
 downstream device
Date: Fri, 20 Nov 2026 19:37:25 +0530
Message-ID: <20261120140729.466177-26-ankit.k.nautiyal@intel.com>
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

The DP side picks the smallest DSC slice count that satisfies the DP
sink. A device downstream of the DP sink, like an HDMI sink behind a
PCON that passes the DSC stream through, can have its own limits for
the slice count.

Add the minimum and the maximum slice count to the link config limits,
and apply them when picking the slice config. No limit is set yet, so
there is no change in behavior.

Assisted-by: LLM
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 13 ++++++++++++-
 drivers/gpu/drm/i915/display/intel_dp.h |  8 ++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 83134be623cf..691148fba8f8 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -910,6 +910,7 @@ static bool
 intel_dp_dsc_get_slice_config(const struct intel_connector *connector,
 			      int mode_clock, int mode_hdisplay,
 			      int num_joined_pipes,
+			      int dfp_min_slices, int dfp_max_slices,
 			      struct intel_dsc_slice_config *config_ret)
 {
 	struct intel_display *display = to_intel_display(connector);
@@ -921,6 +922,8 @@ intel_dp_dsc_get_slice_config(const struct intel_connector *connector,
 		drm_dp_dsc_sink_slice_count_mask(connector->dp.dsc_dpcd, is_edp);
 	int slices_per_pipe;
 
+	min_slice_count = max(min_slice_count, dfp_min_slices);
+
 	/*
 	 * Find the closest match to the valid slice count values
 	 *
@@ -950,6 +953,9 @@ intel_dp_dsc_get_slice_config(const struct intel_connector *connector,
 		      sink_slice_count_mask))
 			continue;
 
+		if (slices_per_line > dfp_max_slices)
+			continue;
+
 		if (mode_hdisplay % slices_per_line)
 			continue;
 
@@ -979,7 +985,7 @@ u8 intel_dp_dsc_get_slice_count(const struct intel_connector *connector,
 
 	if (!intel_dp_dsc_get_slice_config(connector,
 					   mode_clock, mode_hdisplay,
-					   num_joined_pipes, &config))
+					   num_joined_pipes, 0, INT_MAX, &config))
 		return 0;
 
 	return intel_dsc_line_slice_count(&config);
@@ -2741,6 +2747,8 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 
 	if (!intel_dp_dsc_get_slice_config(connector, adjusted_mode->crtc_clock,
 					   adjusted_mode->crtc_hdisplay, num_joined_pipes,
+					   limits->dfp_dsc.min_slices,
+					   limits->dfp_dsc.max_slices,
 					   &pipe_config->dsc.slice_config))
 		return -EINVAL;
 
@@ -3092,6 +3100,9 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
 
 	limits->link_config_filter = INTEL_DP_LINK_CAPS_FILTER_ALL;
 
+	limits->dfp_dsc.min_slices = 0;
+	limits->dfp_dsc.max_slices = INT_MAX;
+
 	limits->pipe.min_bpp = intel_dp_min_bpp(crtc_state->output_format);
 	if (is_mst) {
 		/*
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 83954c2c28e6..f02ae879fca2 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -38,6 +38,14 @@ struct link_config_limits {
 		/* Compressed or uncompressed link output bpp in 1/16 bpp units */
 		int min_bpp_x16, max_bpp_x16;
 	} link;
+	struct {
+		/*
+		 * DSC limits of the downstream facing port: the slice count per
+		 * line, for an HDMI sink behind a PCON passing the DSC stream
+		 * through. No limit: 0 and INT_MAX.
+		 */
+		int min_slices, max_slices;
+	} dfp_dsc;
 };
 
 void intel_edp_fixup_vbt_bpp(struct intel_encoder *encoder, int pipe_bpp);
-- 
2.50.1

