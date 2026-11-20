Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4A9606A32A
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D9AWC1yP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CB9112ADE;
	Fri, 20 Nov 2026 14:24:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881AF112AE4;
 Fri, 20 Nov 2026 14:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795184650; x=1826720650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9f+dU88mXPvJLZEx9m5Umte2tYzPx8Pu3qC1nI7yAr8=;
 b=D9AWC1yPNrZsA9aIaGCaaT9SEi9BkACE2LN8t0flST46LgNv9iOqzLq2
 ZfZJPk8+FlpSyYXg3AO3dMKB4/peuFZ9eaua5JACpcsJ3JUZzB6POD/Zz
 2vULo1H8t0QvD5AamqbYYAYX5rQO885AQrGY8UCRm31WjpNfS4w717GZb
 ZnTZRz4pib+farJAnkFMhjU84CgWIyItIad3ZTzdBcfVSTSzyuO0jDzem
 KiGkDdkS6/2jx5ap6vIHYLdTD0mdzPLKA/+rNr4IcrE0/NPOiC0hiI9nw
 WL+uw/fkxcPJzvaaQsCkk7TPfQ26rGt3HfOny4ky/2s0+VBQNE6ww7eUn w==;
X-CSE-ConnectionGUID: B+3EqlndRKmigQ/U3oKp4w==
X-CSE-MsgGUID: BB8CuLsKS1uxibHDRscjOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4091035"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4091035"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:53 -0800
X-CSE-ConnectionGUID: mwzFqiHOSBqdnUiM3+b8Tg==
X-CSE-MsgGUID: ZlbDQimmQM29zNvfSOUeGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="12422072"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 06:23:51 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 26/29] drm/i915/dp: Check the HDMI sink slice limits for DSC
 pass-through
Date: Fri, 20 Nov 2026 19:37:26 +0530
Message-ID: <20261120140729.466177-27-ankit.k.nautiyal@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The pass-through check only compared the slice count of the DP stream
with the max slices of the HDMI sink. The HDMI sink also needs at least
the slice count its throughput and the slice width limit require.

Add a helper to get the minimum and the maximum slice count of the HDMI
sink, and use it in the pass-through check, so that the same limits can
be used when picking the slice count. Nothing selects pass-through yet
for modes that are affected, so there is no change in behavior.

Assisted-by: LLM
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 37 +++++++++++++++++++++----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 691148fba8f8..9898e6c6266c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1318,6 +1318,32 @@ intel_dp_pcon_dsc_enc_compute(struct intel_dp *intel_dp,
 	return true;
 }
 
+/*
+ * Get the limits of the DSC slice count per line of the HDMI sink: the minimum
+ * its throughput and the slice width limit require, and the maximum it
+ * supports.
+ */
+static bool
+intel_dp_pcon_dsc_hdmi_slice_limits(const struct intel_connector *connector,
+				    const struct drm_display_mode *mode,
+				    int pixel_clock,
+				    enum intel_output_format sink_format,
+				    int *min_slices, int *max_slices)
+{
+	const struct drm_display_info *info = &connector->base.display_info;
+
+	*min_slices = intel_hdmi_dsc_get_num_slices(mode, pixel_clock, sink_format,
+						    16, INT_MAX,
+						    info->hdmi.dsc_cap.max_slices,
+						    info->hdmi.dsc_cap.clk_per_slice);
+	if (!*min_slices)
+		return false;
+
+	*max_slices = info->hdmi.dsc_cap.max_slices;
+
+	return true;
+}
+
 /*
  * The PCON passes the DSC stream of the source to the HDMI sink as is, so
  * the stream has to be one the HDMI sink can decode.
@@ -1333,6 +1359,7 @@ intel_dp_pcon_dsc_passthrough_ok(struct intel_dp *intel_dp,
 	int bpp_x16 = crtc_state->dsc.compressed_bpp_x16;
 	int bpc = crtc_state->pipe_bpp / 3;
 	int min_dsc_bpp, max_dsc_bpp;
+	int min_slices, max_slices;
 
 	if (!intel_dp_pcon_can_passthrough_dsc(intel_dp))
 		return false;
@@ -1341,11 +1368,11 @@ intel_dp_pcon_dsc_passthrough_ok(struct intel_dp *intel_dp,
 	if (crtc_state->output_format != crtc_state->sink_format)
 		return false;
 
-	if (num_slices > info->hdmi.dsc_cap.max_slices ||
-	    !intel_hdmi_dsc_get_num_slices(adjusted_mode, adjusted_mode->crtc_clock,
-					   crtc_state->sink_format, num_slices,
-					   INT_MAX, info->hdmi.dsc_cap.max_slices,
-					   info->hdmi.dsc_cap.clk_per_slice))
+	if (!intel_dp_pcon_dsc_hdmi_slice_limits(connector, adjusted_mode,
+						 adjusted_mode->crtc_clock,
+						 crtc_state->sink_format,
+						 &min_slices, &max_slices) ||
+	    num_slices < min_slices || num_slices > max_slices)
 		return false;
 
 	intel_hdmi_dsc_get_min_max_bpp(crtc_state->sink_format, bpc,
-- 
2.50.1

