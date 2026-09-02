Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA79C624DB
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 08:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEA710F075;
	Wed,  2 Sep 2026 08:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PrsDUFnH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B66E10F075;
 Wed,  2 Sep 2026 08:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788337080; x=1819873080;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=vtKmj9DaWSglXyr6HeIWiTU6YejHxXPBnt5OzhDKNyU=;
 b=PrsDUFnHeCE/XHNyZLPjoROEKRykv9QPDyCrP+bB8ZuNODZguUopB09q
 1TJzyzHxymXeEJWKNefK70e060T4ITrSQ7Sbf2V+hQCvBoqeNLD+eRUav
 MPO2TYAPEm8u2Hwr11bTQFpJANoELKW7O22hX82NswRazj2oZ0mBsjlON
 9rFNBqDV4nRRgXu9f9mU/6rA86yKpAdvdFyukQ9RSDnuLFV49ZccnWeg3
 GmeFtgCGPLFg0Kkk+eTIkiObtm5/21WxdM+sUctmkcG/i6kBr00++rnQV
 wF74whlqxTMbMLgCvJm+xkS5TP3e0WEFgTYlMD9SDpdZxi53rzq0ShIdc Q==;
X-CSE-ConnectionGUID: eM3zV+CJRAS8jNs8gAbLhQ==
X-CSE-MsgGUID: TK8iGCbnQtOKLeVn6ie9Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="100299820"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="100299820"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 01:18:00 -0700
X-CSE-ConnectionGUID: SOz8C5K2SyS5UyA9lYBXcQ==
X-CSE-MsgGUID: fu4M2+KHSZKNOzV8WIA/JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="263193683"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa009.fm.intel.com with ESMTP; 02 Sep 2026 01:17:59 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [CI 7/9] drm/i915/color: Program Plane Post CSC registers for SDR
 planes
Date: Wed,  2 Sep 2026 13:24:15 +0530
Message-ID: <20260902075417.656673-8-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260902075417.656673-1-chaitanya.kumar.borah@intel.com>
References: <20260902075417.656673-1-chaitanya.kumar.borah@intel.com>
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

Implement plane post-CSC LUT support for SDR planes.

v2:
- Restructure loop to match HDR function pattern

Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Co-developed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 36c8688ed28e..f1df0f9ba762 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -4030,6 +4030,45 @@ xelpd_load_hdr_post_csc_lut(struct intel_display *display,
 	intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
 }
 
+static void
+xelpd_load_sdr_post_csc_lut(struct intel_display *display,
+			    struct intel_dsb *dsb,
+			    enum pipe pipe,
+			    enum plane_id plane,
+			    const struct drm_color_lut32 *post_csc_lut)
+{
+	int i, lut_size = 32;
+	u32 lut_val;
+
+	/*
+	 * First 3 planes are HDR, so reduce by 3 to get to the right
+	 * SDR plane offset
+	 */
+	plane = plane - 3;
+
+	intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX(pipe, plane, 0),
+			   PLANE_PAL_PREC_AUTO_INCREMENT);
+
+	for (i = 0; i < lut_size + 3; i++) {
+		if (post_csc_lut) {
+			if (i < lut_size)
+				lut_val = drm_color_lut32_extract(post_csc_lut[i].green, 16);
+			/* else duplicate last lut_val */
+		} else {
+			if (i < lut_size)
+				lut_val = (i * ((1 << 16) - 1)) / (lut_size - 1);
+			else
+				lut_val = 1 << 16;
+		}
+
+		intel_de_write_dsb(display, dsb,
+				   PLANE_POST_CSC_GAMC_DATA(pipe, plane, 0),
+				   lut_val);
+	}
+
+	intel_de_write_dsb(display, dsb, PLANE_POST_CSC_GAMC_INDEX(pipe, plane, 0), 0);
+}
+
 static void
 xelpd_program_plane_post_csc_lut(struct intel_dsb *dsb,
 				 const struct intel_plane_state *plane_state)
@@ -4043,6 +4082,8 @@ xelpd_program_plane_post_csc_lut(struct intel_dsb *dsb,
 
 	if (icl_is_hdr_plane(display, plane))
 		xelpd_load_hdr_post_csc_lut(display, dsb, pipe, plane, post_csc_lut);
+	else
+		xelpd_load_sdr_post_csc_lut(display, dsb, pipe, plane, post_csc_lut);
 }
 
 static void
-- 
2.50.1

