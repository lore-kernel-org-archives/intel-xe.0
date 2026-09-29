Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB4FCA5FAC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 11:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47ACD10EE7B;
	Tue, 29 Sep 2026 11:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IgGs3x+i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F6B10EE6B;
 Tue, 29 Sep 2026 11:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790679917; x=1822215917;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rjNvha9G7sxwuaCKRXpgsPA7IDYpM5GpDUwdh0U+BWM=;
 b=IgGs3x+iP1jqg0vrL0dr0CFFpPQeAyujOjSz5vxZplaHdidpkjo9ILOx
 izGYN9U2w1j9AuisyiJ//SuEjBWb4Bcg1AjNiez0qgh7rQOYUbCNej8w7
 6DPgYrSHO4gNloZd1pA8J29ePeX7xHKgXWEWnpRllnDvpysftl4U3RmgV
 9k1+tHmbr/BakHVoAbGuTWIdOymu/RQL9Z+6TDGAA6Ak3q7uxs6B2a+FG
 YQNPnvxogfBSpAERo2Z1SyLU1JDpyp7W/5L8lLvcolEGaEUo8+VDvpTxg
 5XTZWDaD8Pc67OJwwsJDao8kEgoMYEBxHMYiTX7Oi7jzV4IazuGjDX47u A==;
X-CSE-ConnectionGUID: OJ1r8BdzR5+JXcgm4q9pDw==
X-CSE-MsgGUID: T0INS+UYQLOBNzJH//wm6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90295508"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90295508"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:05:07 -0700
X-CSE-ConnectionGUID: M+B6irdbQvaXkMHDOoYwZA==
X-CSE-MsgGUID: RKVfhbwURJaJPQ9C1Y4IWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274887360"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 04:05:06 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, alexander.kaplan@sms-medipool.de,
 swati2.sharma@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v3 07/10] drm/i915/hdmi: Pass pixel clock to DSC slice helper
Date: Tue, 29 Sep 2026 16:18:32 +0530
Message-ID: <20260929104835.1050882-8-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260929104835.1050882-1-ankit.k.nautiyal@intel.com>
References: <20260929104835.1050882-1-ankit.k.nautiyal@intel.com>
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

Pass the pixel clock explicitly to the DSC slice-count helper so callers
can use the effective clock for throughput validation.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c   | 1 +
 drivers/gpu/drm/i915/display/intel_hdmi.c | 3 ++-
 drivers/gpu/drm/i915/display/intel_hdmi.h | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 3478adb3fba8..412edb5b8c5e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4356,6 +4356,7 @@ intel_dp_pcon_dsc_enc_slices(struct intel_dp *intel_dp,
 	int pcon_max_slice_width = drm_dp_pcon_dsc_max_slice_width(intel_dp->pcon_dsc_dpcd);
 
 	return intel_hdmi_dsc_get_num_slices(&crtc_state->hw.adjusted_mode,
+					     crtc_state->hw.adjusted_mode.crtc_clock,
 					     crtc_state->output_format,
 					     pcon_max_slices,
 					     pcon_max_slice_width,
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index a15dee6ef329..83a5a6e14ebc 100644
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

