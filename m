Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84827C56202
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 04:07:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D27B10EC98;
	Wed,  5 Aug 2026 04:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rox4CJCr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525D010EC98;
 Wed,  5 Aug 2026 04:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785902850; x=1817438850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sak8j/teuQwtV+aa7MJP2te+QYzyj0FhqPjFboNaZ1I=;
 b=Rox4CJCrsV9qeggMTIMP0UVWeR1AtMuTbme0idJsU6WDpvlPrtW6CgHY
 shs3ZY/BQeOwE5hP/UZjJ8TMsy9nR7xkiFdAxjHLoekLEjv6VyrW4conW
 Ol2GKLct4eSdx5+tOOrKFpjxhdTJqkDlTUVcgd2Df0LiuUuvM1oRnN8jW
 4SoDqL+MTnBcMClng1ifbkpoFzbCmFE0UuN54fGG4or8JvAPSsTIiJ0Cp
 OgrO2WBc+5se1VL8mzhsoLATHUvEZheeQkXMg+XqgZrI0A8S8yYlzwhbo
 /vGawFVUlV2AIgdOYv58f1tJYrcKZ5YXNWfDz4Slk/66OrvIGwq51dbmo Q==;
X-CSE-ConnectionGUID: WprcmmE9SdyPJr07xldg/w==
X-CSE-MsgGUID: dNCXyhvwS1K6km/plof7PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90143527"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="90143527"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 21:07:30 -0700
X-CSE-ConnectionGUID: BsmnBeSCSP6B1eB1RV4/LA==
X-CSE-MsgGUID: T5R/ZKqVRsqTsup3vgQdMg==
X-ExtLoop1: 1
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 21:07:27 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: alexander.kaplan@sms-medipool.de, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 2/5] drm/i915/display: Generalize
 intel_hdmi_dsc_get_num_slices helper
Date: Wed,  5 Aug 2026 09:20:24 +0530
Message-ID: <20260805035027.3473398-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260805035027.3473398-1-ankit.k.nautiyal@intel.com>
References: <20260805035027.3473398-1-ankit.k.nautiyal@intel.com>
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

Refactor intel_hdmi_dsc_get_num_slices to remove dependency on
intel_crtc_state structure by accepting display mode and output format
as parameters instead.

This makes the function reusable for mode_valid cases where
crtc_state is not present.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c   |  4 +++-
 drivers/gpu/drm/i915/display/intel_hdmi.c | 14 ++++++++------
 drivers/gpu/drm/i915/display/intel_hdmi.h |  4 +++-
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 7f13595f40c1..76d8ebecec32 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4321,7 +4321,9 @@ intel_dp_pcon_dsc_enc_slices(struct intel_dp *intel_dp,
 	int pcon_max_slices = drm_dp_pcon_dsc_max_slices(intel_dp->pcon_dsc_dpcd);
 	int pcon_max_slice_width = drm_dp_pcon_dsc_max_slice_width(intel_dp->pcon_dsc_dpcd);
 
-	return intel_hdmi_dsc_get_num_slices(crtc_state, pcon_max_slices,
+	return intel_hdmi_dsc_get_num_slices(&crtc_state->hw.adjusted_mode,
+					     crtc_state->output_format,
+					     pcon_max_slices,
 					     pcon_max_slice_width,
 					     hdmi_max_slices, hdmi_throughput);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 9af0f3aba0fc..228c5e2be164 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3216,7 +3216,8 @@ int intel_hdmi_dsc_get_slice_height(int vactive)
  * intel_hdmi_dsc_get_num_slices - get no. of dsc slices based on dsc encoder
  * and dsc decoder capabilities
  *
- * @crtc_state: intel crtc_state
+ * @mode: drm_display_mode for which num of slices are needed
+ * @output_format : pipe output format
  * @src_max_slices: maximum slices supported by the DSC encoder
  * @src_max_slice_width: maximum slice width supported by DSC encoder
  * @hdmi_max_slices: maximum slices supported by sink DSC decoder
@@ -3226,7 +3227,8 @@ int intel_hdmi_dsc_get_slice_height(int vactive)
  * and decoder.
  */
 int
-intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
+intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
+			      enum intel_output_format output_format,
 			      int src_max_slices, int src_max_slice_width,
 			      int hdmi_max_slices, int hdmi_throughput)
 {
@@ -3248,7 +3250,7 @@ intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
 	int max_throughput; /* max clock freq. in khz per slice */
 	int max_slice_width;
 	int slice_width;
-	int pixel_clock = crtc_state->hw.adjusted_mode.crtc_clock;
+	int pixel_clock = mode->crtc_clock;
 
 	if (!hdmi_throughput)
 		return 0;
@@ -3259,8 +3261,8 @@ intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
 	 * for 4:4:4 is 1.0. Multiplying these factors by 10 and later
 	 * dividing adjusted clock value by 10.
 	 */
-	if (crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR444 ||
-	    crtc_state->output_format == INTEL_OUTPUT_FORMAT_RGB)
+	if (output_format == INTEL_OUTPUT_FORMAT_YCBCR444 ||
+	    output_format == INTEL_OUTPUT_FORMAT_RGB)
 		kslice_adjust = 10;
 	else
 		kslice_adjust = 5;
@@ -3315,7 +3317,7 @@ intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
 		else
 			return 0;
 
-		slice_width = DIV_ROUND_UP(crtc_state->hw.adjusted_mode.hdisplay, target_slices);
+		slice_width = DIV_ROUND_UP(mode->hdisplay, target_slices);
 		if (slice_width >= max_slice_width)
 			min_slices = target_slices + 1;
 	} while (slice_width >= max_slice_width);
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
index fb950fdd0e7a..4e2228ca0c5b 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.h
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
@@ -13,6 +13,7 @@ enum intel_output_format;
 enum port;
 struct drm_connector;
 struct drm_connector_state;
+struct drm_display_mode;
 struct drm_encoder;
 struct intel_connector;
 struct intel_crtc_state;
@@ -56,7 +57,8 @@ int intel_hdmi_tmds_clock(int clock, int bpc, enum intel_output_format sink_form
 int intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width,
 			   int num_slices, enum intel_output_format output_format,
 			   bool hdmi_all_bpp, int hdmi_max_chunk_bytes);
-int intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
+int intel_hdmi_dsc_get_num_slices(const struct drm_display_mode *mode,
+				  enum intel_output_format output_format,
 				  int src_max_slices, int src_max_slice_width,
 				  int hdmi_max_slices, int hdmi_throughput);
 int intel_hdmi_dsc_get_slice_height(int vactive);
-- 
2.50.1

