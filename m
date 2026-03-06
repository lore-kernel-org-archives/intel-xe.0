Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E92DFCC046
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 17:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E718A10E3E8;
	Fri,  6 Mar 2026 17:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YBn0MT87";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8E210E3E8;
 Fri,  6 Mar 2026 17:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772817543; x=1804353543;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wjt88f970c17+tO51u8kpornq+2QQ/KEm0TI8mYHW5I=;
 b=YBn0MT87526mf4f0x/GMAE0ZE9St1uo9R5UYU4uQgKn5tt8DJHGRnwgM
 kb6CbOLBI8ci/t1zD+WMYjzWNFUsZv5igGu007v9sJIUq9Z5zsW7uHyvu
 pI0LpSsYX9ipH4LMM499idn6ktPKy+PERjN4dRQWp/msAruA5A6bJO6EY
 weF23VSNWkoBwnY3/ohJ6HKKtEN7BD1VIJG0BGpokBLrKqHWb54zx2ku+
 VvosJkQ5IatbLLU9K+9dfatNoT+ae52dp1XzD2/ede7Hzgcjlgl0fOS1u
 FcXbVKHPQ3CBoVAORG6spLE5Ss9eG8SMdeSTx2XgrZHta2k7Ca0s3vRTp Q==;
X-CSE-ConnectionGUID: frxIhlIVR/SmZBffEyOz6A==
X-CSE-MsgGUID: w1rNMPbXSkmplxo++maziw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77530887"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="77530887"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 09:19:02 -0800
X-CSE-ConnectionGUID: LvOWVri9RCCLAXnEHjErJA==
X-CSE-MsgGUID: +QrDFvCjQyqTTxpvUc1lNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="216175228"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa010.fm.intel.com with ESMTP; 06 Mar 2026 09:18:58 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: harry.wentland@amd.com, louis.chauvet@bootlin.com, mwen@igalia.com,
 contact@emersion.fr, alex.hung@amd.com, daniels@collabora.com,
 uma.shankar@intel.com, maarten.lankhorst@intel.com,
 pekka.paalanen@collabora.com, pranay.samala@intel.com,
 swati2.sharma@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH 06/10] drm/i915/color: Extract HDR pre-CSC LUT programming to
 helper function
Date: Fri,  6 Mar 2026 22:23:03 +0530
Message-Id: <20260306165307.3233194-7-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260306165307.3233194-1-chaitanya.kumar.borah@intel.com>
References: <20260306165307.3233194-1-chaitanya.kumar.borah@intel.com>
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

From: Pranay Samala <pranay.samala@intel.com>

As we prepare to add support for LUT programming in SDR planes,
refactor HDR plane pre-CSC LUT programming to a helper.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 92 ++++++++++++----------
 1 file changed, 51 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 6d1cffc6d2be..17ab4364faea 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3943,6 +3943,55 @@ xelpd_load_plane_csc_matrix(struct intel_dsb *dsb,
 			   ctm_to_twos_complement(input[11], 0, 12));
 }
 
+static void
+xelpd_load_hdr_pre_csc_lut(struct intel_display *display,
+			   struct intel_dsb *dsb,
+			   enum pipe pipe,
+			   enum plane_id plane,
+			   const struct drm_color_lut32 *pre_csc_lut)
+{
+	u32 lut_size = 128;
+	u32 lut_val;
+	int i;
+
+	intel_de_write_dsb(display, dsb,
+			   PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
+			   PLANE_PAL_PREC_AUTO_INCREMENT);
+
+	if (pre_csc_lut) {
+		for (i = 0; i < lut_size; i++) {
+			lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
+
+			intel_de_write_dsb(display, dsb,
+					   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+					   lut_val);
+		}
+
+		/* Program the max register to clamp values > 1.0. */
+		/* TODO: Restrict to 0x7ffffff */
+		do {
+			intel_de_write_dsb(display, dsb,
+					   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+					   (1 << 24));
+		} while (i++ < 130);
+	} else {
+		for (i = 0; i < lut_size; i++) {
+			lut_val = (i * ((1 << 24) - 1)) / (lut_size - 1);
+
+			intel_de_write_dsb(display, dsb,
+					   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0), lut_val);
+		}
+
+		do {
+			intel_de_write_dsb(display, dsb,
+					   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
+					   1 << 24);
+		} while (i++ < 130);
+	}
+
+	intel_de_write_dsb(display, dsb, PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
+}
+
 static void
 xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
 				const struct intel_plane_state *plane_state)
@@ -3952,48 +4001,9 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
 	enum pipe pipe = to_intel_plane(state->plane)->pipe;
 	enum plane_id plane = to_intel_plane(state->plane)->id;
 	const struct drm_color_lut32 *pre_csc_lut = plane_state->hw.degamma_lut->data;
-	u32 i, lut_size;
 
-	if (icl_is_hdr_plane(display, plane)) {
-		lut_size = 128;
-
-		intel_de_write_dsb(display, dsb,
-				   PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0),
-				   PLANE_PAL_PREC_AUTO_INCREMENT);
-
-		if (pre_csc_lut) {
-			for (i = 0; i < lut_size; i++) {
-				u32 lut_val = drm_color_lut32_extract(pre_csc_lut[i].green, 24);
-
-				intel_de_write_dsb(display, dsb,
-						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-						   lut_val);
-			}
-
-			/* Program the max register to clamp values > 1.0. */
-			/* TODO: Restrict to 0x7ffffff */
-			do {
-				intel_de_write_dsb(display, dsb,
-						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-						   (1 << 24));
-			} while (i++ < 130);
-		} else {
-			for (i = 0; i < lut_size; i++) {
-				u32 v = (i * ((1 << 24) - 1)) / (lut_size - 1);
-
-				intel_de_write_dsb(display, dsb,
-						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
-			}
-
-			do {
-				intel_de_write_dsb(display, dsb,
-						   PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
-						   1 << 24);
-			} while (i++ < 130);
-		}
-
-		intel_de_write_dsb(display, dsb, PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
-	}
+	if (icl_is_hdr_plane(display, plane))
+		xelpd_load_hdr_pre_csc_lut(display, dsb, pipe, plane, pre_csc_lut);
 }
 
 static void
-- 
2.25.1

