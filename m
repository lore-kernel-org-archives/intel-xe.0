Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB21C5CFC0
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 04:59:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA9F10EA6A;
	Tue, 11 Aug 2026 04:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aXfsep3/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967A510EA59;
 Tue, 11 Aug 2026 04:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786424376; x=1817960376;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hvqZf8B8r5sn3OXGgeYEaDQOsA5gVkTE1g4XMI3P6Gg=;
 b=aXfsep3/vh3BjzHVaG+Uh6i7JS3zT2jG7DYHck4IO9PJ4asVzpCrkD5g
 ZBbw8InGfJRnOV9A3u93ae2TVAveZfBDTcW1wmyIcsIqTTXZcwasF7RF6
 wLBYKti31rbnURGo7qtuLD8b+gI0aA5jLcZ4q+AHpgZPorsK34F9gyXJ5
 FcCqH4T9LOYnnYMBgPFmkDMXaYvcuntAIjjNoFPFqGb1HZlm244H3EuAp
 bJ751g1GwWT0eux/AWWlTlo1SMBkL2Lju2wu/DJwgrJD0cfkte3cV+UQ2
 RBlA0XO6kT9O3vFffNxvrV2PThrCRWZXSZ85RaFzhciDH4yZwNla17ebT g==;
X-CSE-ConnectionGUID: BUrH5bTQQfGkwgjt40EVlw==
X-CSE-MsgGUID: AXD74ewzRXGmQrt77SBw7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86708331"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="86708331"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 21:59:35 -0700
X-CSE-ConnectionGUID: gtSLOmV2TY+sEyBcL3C/4w==
X-CSE-MsgGUID: /5NpQdj8Q4Wjjd1vMABNBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="267082754"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 21:59:34 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v2 5/8] drm/i915/hdmi: Expose DSC min/max bpp helpers
Date: Tue, 11 Aug 2026 10:12:31 +0530
Message-ID: <20260811044234.593986-6-ankit.k.nautiyal@intel.com>
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
index df88d7c141f7..ee6a559762c5 100644
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

