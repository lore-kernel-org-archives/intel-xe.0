Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30288606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O/F9v1Fc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3745112ACA;
	Fri, 20 Nov 2026 14:23:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E4210E8FD;
 Fri, 20 Nov 2026 14:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184630; x=1826720630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k9+lh8MrQLHvNRkkxcbr46bziCRsUkFzPGYRyiCoAwY=;
 b=O/F9v1FcNTjW5s40POvEPP4ctJZ5dOTbNFP6iMMAcnoYH9q3CQzaXuI1
 q/azOYD5PU2pM7p9qB2nlHY56yGM4aBX5zg65sl+EC3wHqlBcR9UNHLBX
 bYSLCVdxPPdoWXs8FRa8TJwZ9b9MY+JDFb9epy2RIFZlSHZNXf+Uh4rpG
 gOelIsTSdwm7otqPfziH7t0G9xPEPB+QWEV3UqXDglBZRLoIWcdHLCVqz
 F0KPc2czOqO+QT4kAd+z+5dkZkDBxrZO8rQCNsnpsaOEzfL64uvJXZDQQ
 B/U6KmG/6AjhY5q2NzO77sfxI0oRmUfBdF0BqwL7zm24YUnlI2JN/k7OY A==;
X-CSE-ConnectionGUID: 7eg887JoTf2h+lRqxBUgdg==
X-CSE-MsgGUID: oeHD71yZT7+FIWliO7JzLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4090982"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4090982"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:34 -0800
X-CSE-ConnectionGUID: Hvjxg7n9Sha6N0yx0BHuJw==
X-CSE-MsgGUID: RaU01/aJTf2N6DRlceqDng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12422031"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:33 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 15/29] drm/i915/dp: Add a helper for the DSC stream version
Date: Fri, 20 Nov 2026 19:37:15 +0530
Message-ID: <20261120140729.466177-16-ankit.k.nautiyal@intel.com>
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

The DSC version of the stream the source sends is the lower of the
source and sink versions. This is open coded twice. Add a helper for it,
so that the following changes can use it as well.

No functional change.

Assisted-by: LLM
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 1b61f36adaa7..14df2cebd17c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1984,6 +1984,15 @@ static int intel_dp_sink_dsc_version_minor(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP
 		DP_DSC_MINOR_SHIFT;
 }
 
+/* The DSC version of the stream the source sends: the lower of the source and sink versions */
+static int intel_dp_dsc_stream_version_minor(const struct intel_connector *connector)
+{
+	struct intel_display *display = to_intel_display(connector);
+
+	return min(intel_dp_source_dsc_version_minor(display),
+		   intel_dp_sink_dsc_version_minor(connector->dp.dsc_dpcd));
+}
+
 static int intel_dp_get_slice_height(int vactive)
 {
 	int slice_height;
@@ -2031,9 +2040,7 @@ static int intel_dp_dsc_compute_params(const struct intel_connector *connector,
 	vdsc_cfg->dsc_version_major =
 		(connector->dp.dsc_dpcd[DP_DSC_REV - DP_DSC_SUPPORT] &
 		 DP_DSC_MAJOR_MASK) >> DP_DSC_MAJOR_SHIFT;
-	vdsc_cfg->dsc_version_minor =
-		min(intel_dp_source_dsc_version_minor(display),
-		    intel_dp_sink_dsc_version_minor(connector->dp.dsc_dpcd));
+	vdsc_cfg->dsc_version_minor = intel_dp_dsc_stream_version_minor(connector);
 	if (vdsc_cfg->convert_rgb)
 		vdsc_cfg->convert_rgb =
 			connector->dp.dsc_dpcd[DP_DSC_DEC_COLOR_FORMAT_CAP - DP_DSC_SUPPORT] &
@@ -2057,7 +2064,6 @@ static int intel_dp_dsc_compute_params(const struct intel_connector *connector,
 static bool intel_dp_dsc_supports_format(const struct intel_connector *connector,
 					 enum intel_output_format output_format)
 {
-	struct intel_display *display = to_intel_display(connector);
 	u8 sink_dsc_format;
 
 	switch (output_format) {
@@ -2068,8 +2074,7 @@ static bool intel_dp_dsc_supports_format(const struct intel_connector *connector
 		sink_dsc_format = DP_DSC_YCbCr444;
 		break;
 	case INTEL_OUTPUT_FORMAT_YCBCR420:
-		if (min(intel_dp_source_dsc_version_minor(display),
-			intel_dp_sink_dsc_version_minor(connector->dp.dsc_dpcd)) < 2)
+		if (intel_dp_dsc_stream_version_minor(connector) < 2)
 			return false;
 		sink_dsc_format = DP_DSC_YCbCr420_Native;
 		break;
-- 
2.50.1

