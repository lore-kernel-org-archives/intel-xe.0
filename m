Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5829CD98F6
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 11:42:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B79610F554;
	Fri, 19 Jun 2026 11:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BD8/2CQG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B7F10F554;
 Fri, 19 Jun 2026 11:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781869368; x=1813405368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UwKC0yIZ5Y0LGVIxKqv5moNINXcS+p40Mk2TnIm6Ifs=;
 b=BD8/2CQGsUMsik5iELHMUw3ruovWsRnSoYmKK8TMMGIZiW3NiwSorcLT
 BCpLfccV+Lx8Q4CDnF9Y68FJuuTw+5o6LEQvE1s+zh74+N7AQBZd0EUty
 eTtSEnVNN8R0N6OhEy7r81TeZvuw3BK44uWhebSgbT/utBtuPLbM4C+ka
 WImlO1N7Blovg5TuhGViqDaM+6QFuIt+n926myyRZNkWc+L6lX20m4o9c
 w615pr7uOkdU0Oe05AYvqmWsL5EnpZ4NY+6HCm9jZcOOr7b54fACH+0cl
 9K1LVoJP0UyLANh7f3hrwR8sPeRUVrRI1VcgNguB5f9vtigO5xX+aEVvy g==;
X-CSE-ConnectionGUID: k/SUM/kTSy+KwKL2jBDhvQ==
X-CSE-MsgGUID: EzdOwSlMS5m0E5HA3Xzw/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="70229420"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="70229420"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 04:42:48 -0700
X-CSE-ConnectionGUID: vSkk+bU9RgKF8ZguMB67Mw==
X-CSE-MsgGUID: bc13UGX9RmaRESfb0U5PdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="286738217"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa001.jf.intel.com with ESMTP; 19 Jun 2026 04:42:46 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 4/4] drm/i915/dp: Decode dsc max delta bpp from sink dpcd
Date: Fri, 19 Jun 2026 17:09:05 +0530
Message-Id: <20260619113905.1413453-5-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260619113905.1413453-1-nemesa.garg@intel.com>
References: <20260619113905.1413453-1-nemesa.garg@intel.com>
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

Add intel_dp_dsc_max_delta_bppx16() to parse sink dsc max
delta bpp from dpcd when DP_DSC_MAX_BPP_DELTA_AVAILABILITY
is set. This helper decodes the delta range for both RGB/YCbCr444
and YCbCr420 formats from DP_DSC_MAX_BPP_DELTA.

With this addition, the flow becomes:
1. First, check for a format-specific range and use it to calculate
max compressed bpp.
2. If not, check for sink supported max compressed bpp and
use that
3. If this is also not there go with mandatory
max range supported bpp.

v2: Reorder the check flow for max_bpp. [Ankit]
v3: Put RGB and YCbCr444 mask assignment in the same line. [Ankit]
v4: Zero max_bpp for reserved RGB/YCbCr444 delta values. [sashiko]

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 43 +++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 3569e61e7fee..28b887ee5cf1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2184,17 +2184,56 @@ static int dsc_compute_link_config(struct intel_dp *intel_dp,
 	return -EINVAL;
 }
 
+static u16 intel_dp_dsc_max_delta_bppx16(const struct intel_connector *connector,
+					 enum intel_output_format output_format)
+{
+	const u8 *dsc_dpcd = connector->dp.dsc_dpcd;
+	u8 max_bpp_delta_v1 = dsc_dpcd[DP_DSC_MAX_BPP_DELTA_VERSION_1 - DP_DSC_SUPPORT];
+	int max_bpp;
+
+	if (!(dsc_dpcd[DP_DSC_MAX_BITS_PER_PIXEL_HI - DP_DSC_SUPPORT] &
+	    DP_DSC_MAX_BPP_DELTA_AVAILABILITY))
+		return 0;
+
+	switch (output_format) {
+	case INTEL_OUTPUT_FORMAT_RGB:
+	case INTEL_OUTPUT_FORMAT_YCBCR444:
+		max_bpp =  max_bpp_delta_v1 & DP_DSC_RGB_YCbCr444_MAX_BPP_DELTA_MASK;
+		if (max_bpp >= 1 && max_bpp <= 21)
+			max_bpp =  max_bpp + DP_DSC_BPP_DELTA_444 - 1;
+		else
+			max_bpp = 0;
+		break;
+	case INTEL_OUTPUT_FORMAT_YCBCR420:
+		max_bpp = (max_bpp_delta_v1 & DP_DSC_NATIVE_YCbCr420_MAX_BPP_DELTA_MASK) >>
+			  DP_DSC_BPP_DELTA_SHIFT_420;
+		if (max_bpp >= 1 && max_bpp <= 7)
+			max_bpp = max_bpp + DP_DSC_BPP_DELTA_420 - 1;
+		break;
+	default:
+		MISSING_CASE(output_format);
+		return 0;
+	}
+
+	return max_bpp << 4;
+}
+
 static
 u16 intel_dp_dsc_max_sink_compressed_bppx16(const struct intel_connector *connector,
 					    enum intel_output_format output_format,
 					    int bpc)
 {
-	u16 max_bppx16 = drm_edp_dsc_sink_output_bpp(connector->dp.dsc_dpcd);
+	u16 max_bppx16 = intel_dp_dsc_max_delta_bppx16(connector, output_format);
+
+	if (max_bppx16)
+		return max_bppx16;
+
+	max_bppx16 = drm_edp_dsc_sink_output_bpp(connector->dp.dsc_dpcd);
 
 	if (max_bppx16)
 		return max_bppx16;
 	/*
-	 * If support not given in DPCD 67h, 68h use the Maximum Allowed bit rate
+	 * If support not given in DPCD 67h, 68h, 6Eh, 6Fh use the Maximum Allowed bit rate
 	 * values as given in spec Table 2-157 DP v2.0
 	 */
 	switch (output_format) {
-- 
2.25.1

