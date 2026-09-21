Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE2DC982E1
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 05:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6743B10E253;
	Mon, 21 Sep 2026 05:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X6mgab8s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C6D10E232;
 Mon, 21 Sep 2026 05:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789969044; x=1821505044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4kmfAbCHjAIRHm+yhhcOFYdCIQM7LuCdI9Fo5L0mowc=;
 b=X6mgab8sWAwy3c8z33urexw193GFr29qvU17cZ3AuDNhkwjlAZ2w6XGA
 n96rfn4Bje6C6to4/MJ9BuDz2GKeyri0+op3SOb0rR9E558YkhSqI++fB
 jM0sgnwBskK2fm395d8GYfhomC7oRMvKM1VEJcA+z6fj7UQBe+Lwu2iOT
 CH/Ys4u+Cdo/6lMwUmTMmj4oQlAmJdSN3JL622k+EZ19bllfLm3PSqRXC
 pez6635PDEHX300NL0ilUvZa2FZSsxvDAUEyOELWIBhSt5Akn98jM28+/
 iwJcgNytqcMzKdBmmHQdFVyrmzmCF9sya2yMZ0xghZnST4lmBitNnVHSB Q==;
X-CSE-ConnectionGUID: DMsnJBxoRXe0/nSp4luz6w==
X-CSE-MsgGUID: O+yYWVc2SCugzGGN6mta/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="966623"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="966623"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2026 22:37:23 -0700
X-CSE-ConnectionGUID: dvtiacv7RJOlOL4wY1/NzQ==
X-CSE-MsgGUID: rdWEa4eYQC+z5C2W3ELJ0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="300444484"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa001.fm.intel.com with ESMTP; 20 Sep 2026 22:37:21 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 5/8] drm/i915/dp: log DPCD access errors
Date: Mon, 21 Sep 2026 11:07:07 +0530
Message-Id: <20260921053710.1586776-6-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921053710.1586776-1-suraj.kandpal@intel.com>
References: <20260921053710.1586776-1-suraj.kandpal@intel.com>
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

Now that the DPCD accessors return a proper error code, include it in
the error messages using %pe and ERR_PTR(), instead of just stating
that the access failed.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 31 ++++++++++++++-----------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 89ce6ac7f396..b6982618fcda 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3925,7 +3925,7 @@ intel_dp_init_source_oui(struct intel_dp *intel_dp)
 	 */
 	ret = drm_dp_dpcd_read_data(&intel_dp->aux, DP_SOURCE_OUI, buf, sizeof(buf));
 	if (ret < 0)
-		drm_dbg_kms(display->drm, "Failed to read source OUI\n");
+		drm_dbg_kms(display->drm, "Failed to read source OUI (%pe)\n", ERR_PTR(ret));
 
 	if (memcmp(oui, buf, sizeof(oui)) == 0) {
 		/* Assume the OUI was written now. */
@@ -3935,7 +3935,7 @@ intel_dp_init_source_oui(struct intel_dp *intel_dp)
 
 	ret = drm_dp_dpcd_write_data(&intel_dp->aux, DP_SOURCE_OUI, oui, sizeof(oui));
 	if (ret < 0) {
-		drm_dbg_kms(display->drm, "Failed to write source OUI\n");
+		drm_dbg_kms(display->drm, "Failed to write source OUI (%pe)\n", ERR_PTR(ret));
 		WRITE_ONCE(intel_dp->oui_valid, false);
 	}
 
@@ -4002,9 +4002,9 @@ void intel_dp_set_power(struct intel_dp *intel_dp, u8 mode)
 
 	if (ret < 0)
 		drm_dbg_kms(display->drm,
-			    "[ENCODER:%d:%s] Set power to %s failed\n",
+			    "[ENCODER:%d:%s] Set power to %s failed (%pe)\n",
 			    encoder->base.base.id, encoder->base.name,
-			    mode == DP_SET_POWER_D0 ? "D0" : "D3");
+			    mode == DP_SET_POWER_D0 ? "D0" : "D3", ERR_PTR(ret));
 }
 
 static bool
@@ -4104,8 +4104,8 @@ static void intel_dp_get_pcon_dsc_cap(struct intel_dp *intel_dp)
 				    intel_dp->pcon_dsc_dpcd,
 				    sizeof(intel_dp->pcon_dsc_dpcd));
 	if (ret < 0)
-		drm_err(display->drm, "Failed to read DPCD register 0x%x\n",
-			DP_PCON_DSC_ENCODER);
+		drm_err(display->drm, "Failed to read DPCD register 0x%x (%pe)\n",
+			DP_PCON_DSC_ENCODER, ERR_PTR(ret));
 
 	drm_dbg_kms(display->drm, "PCON ENCODER DSC DPCD: %*ph\n",
 		    (int)sizeof(intel_dp->pcon_dsc_dpcd), intel_dp->pcon_dsc_dpcd);
@@ -4428,8 +4428,9 @@ void intel_dp_configure_protocol_converter(struct intel_dp *intel_dp,
 				     DP_PROTOCOL_CONVERTER_CONTROL_0, tmp);
 	if (ret < 0)
 		drm_dbg_kms(display->drm,
-			    "Failed to %s protocol converter HDMI mode\n",
-			    str_enable_disable(intel_dp_has_hdmi_sink(intel_dp)));
+			    "Failed to %s protocol converter HDMI mode (%pe)\n",
+			    str_enable_disable(intel_dp_has_hdmi_sink(intel_dp)),
+			    ERR_PTR(ret));
 
 	if (crtc_state->sink_format == INTEL_OUTPUT_FORMAT_YCBCR420) {
 		switch (crtc_state->output_format) {
@@ -4465,16 +4466,17 @@ void intel_dp_configure_protocol_converter(struct intel_dp *intel_dp,
 				     DP_PROTOCOL_CONVERTER_CONTROL_1, tmp);
 	if (ret < 0)
 		drm_dbg_kms(display->drm,
-			    "Failed to %s protocol converter YCbCr 4:2:0 conversion mode\n",
-			    str_enable_disable(intel_dp->dfp.ycbcr_444_to_420));
+			    "Failed to %s protocol converter YCbCr 4:2:0 conversion mode (%pe)\n",
+			    str_enable_disable(intel_dp->dfp.ycbcr_444_to_420),
+			    ERR_PTR(ret));
 
 	tmp = rgb_to_ycbcr ? DP_CONVERSION_BT709_RGB_YCBCR_ENABLE : 0;
 
 	ret = drm_dp_pcon_convert_rgb_to_ycbcr(&intel_dp->aux, tmp);
 	if (ret < 0)
 		drm_dbg_kms(display->drm,
-			    "Failed to %s protocol converter RGB->YCbCr conversion mode\n",
-			    str_enable_disable(tmp));
+			    "Failed to %s protocol converter RGB->YCbCr conversion mode (%pe)\n",
+			    str_enable_disable(tmp), ERR_PTR(ret));
 }
 
 static u8 intel_dp_read_dprx_feature_enum(struct intel_dp *intel_dp)
@@ -4573,7 +4575,8 @@ void intel_dp_get_dsc_sink_cap(u8 dpcd_rev,
 	ret = drm_dp_dpcd_read_byte(connector->dp.dsc_decompression_aux, DP_FEC_CAPABILITY,
 				    &connector->dp.fec_capability);
 	if (ret < 0) {
-		drm_dbg_kms(display->drm, "Could not read FEC DPCD register\n");
+		drm_dbg_kms(display->drm, "Could not read FEC DPCD register (%pe)\n",
+			    ERR_PTR(ret));
 		return;
 	}
 
@@ -4690,7 +4693,7 @@ static void intel_edp_mso_init(struct intel_dp *intel_dp)
 
 	ret = drm_dp_dpcd_read_byte(&intel_dp->aux, DP_EDP_MSO_LINK_CAPABILITIES, &mso);
 	if (ret < 0) {
-		drm_err(display->drm, "Failed to read MSO cap\n");
+		drm_err(display->drm, "Failed to read MSO cap (%pe)\n", ERR_PTR(ret));
 		return;
 	}
 
-- 
2.34.1

