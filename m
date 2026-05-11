Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50199CD484E
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 16:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1432210E80F;
	Mon, 11 May 2026 16:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gPOyX9AW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E591410E80F;
 Mon, 11 May 2026 16:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778517097; x=1810053097;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=JY2rKdCtxx47uXf4A0GJjpOPyTSa+rmrnWYrPo7vcEI=;
 b=gPOyX9AWNstvJNlgG9fGEqfZ064BH/Ry810xvyswwFhBnmDiOWh9UUHl
 SSdphUV7yBrIDGq+AH/sTbFWBHnyub0/ki6b7pU2FzcNsw1n/q0xkPNRa
 TpQiLblzeyqpCg43r/sU5poiDscyGqVn2t4PcGajx61CdpTXO6NYm7ibK
 NMhYdSLFH+JRhSZuK5zRiNPIyxXwO2rXTFCXt6c52Sej91BFVwcQCtrpF
 1ALrQL4x149lhEqf1LvUQV9Jf2o/3TylrOA0LWfoA7xe2++sdXieFhzE0
 N6LzIPCSjkqW6UBRWqRpiZZqU+8M76xyLEFznBgi2mRinhwHvYMuHjV78 g==;
X-CSE-ConnectionGUID: Y+QWUKUpQnmN8b5v46Dh1w==
X-CSE-MsgGUID: K7Zrh2yTQ9aHQ2Cw48NA7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83024169"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="83024169"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:31:37 -0700
X-CSE-ConnectionGUID: kPVp3AfGQ121i/22BkHxEA==
X-CSE-MsgGUID: Ac6sa4oORAWmGkYahXlO+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="267858147"
Received: from khuang2-desk.gar.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.192])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:31:36 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 11 May 2026 13:30:56 -0300
Subject: [PATCH v2 1/4] drm/i915/bw: Extract platform-specific parameters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-separate-platform-from-diplay-ip-specific-bw-params-v2-1-e762cb8662da@intel.com>
References: <20260511-separate-platform-from-diplay-ip-specific-bw-params-v2-0-e762cb8662da@intel.com>
In-Reply-To: <20260511-separate-platform-from-diplay-ip-specific-bw-params-v2-0-e762cb8662da@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Jani Nikula <jani.nikula@intel.com>, Matt Roper <matthew.d.roper@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
X-Mailer: b4 0.15-dev
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

We got confirmation from the hardware team that the bandwidth parameters
deprogbwlimit and derating are platform-specific and not tied to the
display IP.  As such, let's make sure that we use platform checks for
those.

The rest of the members of struct intel_sa_info are tied to the display
IP and we will deal with them as a follow-up.

v2:
  - Use good old if-ladder instead of weird-looking pattern "assign ret,
    check platform, then return ret". (Jani, Matt)
  - Have a single call site for get_platform_bw_params() and pass the
    result as parameter to the *_get_bw_info() functions. (Jani)
  - Avoid using "plat" as abbreviation for "platform". (Jani)
  - s/_plat_bw_params/_bw_params/, since all of the instances are
    prefixed with platform names. (Jani)
  - s/struct intel_platform_bw_params/struct intel_soc_bw_params/.
    (Matt)
  - Do not return a default value; prefer to return NULL and
    intentionally cause a NULL pointer dereference if a platform is
    missing. (Gustavo)

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 161 ++++++++++++++++++++++----------
 1 file changed, 113 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 9c3a9bbb49f6..cf6756b8ae52 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -372,81 +372,147 @@ static int icl_sagv_max_dclk(const struct intel_qgv_info *qi)
 	return dclk;
 }
 
+struct intel_soc_bw_params {
+	u8 deprogbwlimit;
+	u8 derating;
+};
+
+static const struct intel_soc_bw_params icl_bw_params = {
+	.deprogbwlimit = 25,
+	.derating = 10,
+};
+
+static const struct intel_soc_bw_params tgl_bw_params = {
+	.deprogbwlimit = 34,
+	.derating = 10,
+};
+
+static const struct intel_soc_bw_params rkl_bw_params = {
+	.deprogbwlimit = 20,
+	.derating = 10,
+};
+
+static const struct intel_soc_bw_params adl_s_bw_params = {
+	.deprogbwlimit = 38,
+	.derating = 10,
+};
+
+static const struct intel_soc_bw_params adl_p_bw_params = {
+	.deprogbwlimit = 38,
+	.derating = 20,
+};
+
+static const struct intel_soc_bw_params bmg_bw_params = {
+	.deprogbwlimit = 53,
+	.derating = 30,
+};
+
+static const struct intel_soc_bw_params bmg_ecc_bw_params = {
+	.deprogbwlimit = 53,
+	.derating = 45,
+};
+
+static const struct intel_soc_bw_params ptl_bw_params = {
+	.deprogbwlimit = 65,
+	.derating = 10,
+};
+
+static const struct intel_soc_bw_params wcl_bw_params = {
+	.deprogbwlimit = 22,
+	.derating = 10,
+};
+
+static const struct intel_soc_bw_params *get_soc_bw_params(struct intel_display *display)
+{
+	if (display->platform.dgfx) {
+		if (display->platform.dg1) {
+			return &tgl_bw_params;
+		} else if (display->platform.battlemage) {
+			const struct dram_info *dram_info = intel_dram_info(display);
+
+			if (dram_info->type == INTEL_DRAM_GDDR_ECC)
+				return &bmg_ecc_bw_params;
+			else
+				return &bmg_bw_params;
+		}
+	} else {
+		if (display->platform.icelake ||
+		    display->platform.jasperlake ||
+		    display->platform.elkhartlake) {
+			return &icl_bw_params;
+		} else if (display->platform.tigerlake) {
+			return &tgl_bw_params;
+		} else if (display->platform.rocketlake) {
+			return &rkl_bw_params;
+		} else if (display->platform.alderlake_s) {
+			return &adl_s_bw_params;
+		} else if (display->platform.alderlake_p) {
+			return &adl_p_bw_params;
+		} else if (display->platform.meteorlake ||
+			   display->platform.lunarlake) {
+			return &adl_s_bw_params;
+		} else if (display->platform.pantherlake ||
+			   display->platform.novalake) {
+			if (display->platform.pantherlake_wildcatlake)
+				return &wcl_bw_params;
+			else
+				return &ptl_bw_params;
+		}
+	}
+
+	drm_WARN(display->drm, 1, "Platform-specific bandwidth parameters not found!\n");
+
+	return NULL;
+}
+
 struct intel_sa_info {
 	u16 displayrtids;
-	u8 deburst, deprogbwlimit, derating;
+	u8 deburst;
 };
 
 static const struct intel_sa_info icl_sa_info = {
 	.deburst = 8,
-	.deprogbwlimit = 25, /* GB/s */
 	.displayrtids = 128,
-	.derating = 10,
 };
 
 static const struct intel_sa_info tgl_sa_info = {
 	.deburst = 16,
-	.deprogbwlimit = 34, /* GB/s */
 	.displayrtids = 256,
-	.derating = 10,
 };
 
 static const struct intel_sa_info rkl_sa_info = {
 	.deburst = 8,
-	.deprogbwlimit = 20, /* GB/s */
 	.displayrtids = 128,
-	.derating = 10,
 };
 
 static const struct intel_sa_info adls_sa_info = {
 	.deburst = 16,
-	.deprogbwlimit = 38, /* GB/s */
 	.displayrtids = 256,
-	.derating = 10,
 };
 
 static const struct intel_sa_info adlp_sa_info = {
 	.deburst = 16,
-	.deprogbwlimit = 38, /* GB/s */
 	.displayrtids = 256,
-	.derating = 20,
 };
 
 static const struct intel_sa_info mtl_sa_info = {
 	.deburst = 32,
-	.deprogbwlimit = 38, /* GB/s */
 	.displayrtids = 256,
-	.derating = 10,
-};
-
-static const struct intel_sa_info xe2_hpd_sa_info = {
-	.derating = 30,
-	.deprogbwlimit = 53,
-	/* Other values not used by simplified algorithm */
-};
-
-static const struct intel_sa_info xe2_hpd_ecc_sa_info = {
-	.derating = 45,
-	.deprogbwlimit = 53,
-	/* Other values not used by simplified algorithm */
 };
 
 static const struct intel_sa_info xe3lpd_sa_info = {
 	.deburst = 32,
-	.deprogbwlimit = 65, /* GB/s */
 	.displayrtids = 256,
-	.derating = 10,
 };
 
 static const struct intel_sa_info xe3lpd_3002_sa_info = {
 	.deburst = 32,
-	.deprogbwlimit = 22, /* GB/s */
 	.displayrtids = 256,
-	.derating = 10,
 };
 
 static int icl_get_bw_info(struct intel_display *display,
 			   const struct dram_info *dram_info,
+			   const struct intel_soc_bw_params *soc_bw_params,
 			   const struct intel_sa_info *sa)
 {
 	struct intel_qgv_info qi = {};
@@ -466,7 +532,7 @@ static int icl_get_bw_info(struct intel_display *display,
 	}
 
 	dclk_max = icl_sagv_max_dclk(&qi);
-	maxdebw = min(sa->deprogbwlimit * 1000, dclk_max * 16 * 6 / 10);
+	maxdebw = min(soc_bw_params->deprogbwlimit * 1000, dclk_max * 16 * 6 / 10);
 	ipqdepth = min(ipqdepthpch, sa->displayrtids / num_channels);
 	qi.deinterleave = DIV_ROUND_UP(num_channels, is_y_tile ? 4 : 2);
 
@@ -496,7 +562,7 @@ static int icl_get_bw_info(struct intel_display *display,
 			bw = DIV_ROUND_UP(sp->dclk * clpchgroup * 32 * num_channels, ct);
 
 			bi->deratedbw[j] = min(maxdebw,
-					       bw * (100 - sa->derating) / 100);
+					       bw * (100 - soc_bw_params->derating) / 100);
 
 			drm_dbg_kms(display->drm,
 				    "BW%d / QGV %d: num_planes=%d deratedbw=%u\n",
@@ -518,6 +584,7 @@ static int icl_get_bw_info(struct intel_display *display,
 
 static int tgl_get_bw_info(struct intel_display *display,
 			   const struct dram_info *dram_info,
+			   const struct intel_soc_bw_params *soc_bw_params,
 			   const struct intel_sa_info *sa)
 {
 	struct intel_qgv_info qi = {};
@@ -554,7 +621,7 @@ static int tgl_get_bw_info(struct intel_display *display,
 	dclk_max = icl_sagv_max_dclk(&qi);
 
 	peakbw = num_channels * DIV_ROUND_UP(qi.channel_width, 8) * dclk_max;
-	maxdebw = min(sa->deprogbwlimit * 1000, peakbw * DEPROGBWPCLIMIT / 100);
+	maxdebw = min(soc_bw_params->deprogbwlimit * 1000, peakbw * DEPROGBWPCLIMIT / 100);
 
 	ipqdepth = min(ipqdepthpch, sa->displayrtids / num_channels);
 	/*
@@ -599,7 +666,7 @@ static int tgl_get_bw_info(struct intel_display *display,
 			bw = DIV_ROUND_UP(sp->dclk * clpchgroup * 32 * num_channels, ct);
 
 			bi->deratedbw[j] = min(maxdebw,
-					       bw * (100 - sa->derating) / 100);
+					       bw * (100 - soc_bw_params->derating) / 100);
 			bi->peakbw[j] = DIV_ROUND_CLOSEST(sp->dclk *
 							  num_channels *
 							  qi.channel_width, 8);
@@ -661,7 +728,7 @@ static void dg2_get_bw_info(struct intel_display *display)
 
 static int xe2_hpd_get_bw_info(struct intel_display *display,
 			       const struct dram_info *dram_info,
-			       const struct intel_sa_info *sa)
+			       const struct intel_soc_bw_params *soc_bw_params)
 {
 	struct intel_qgv_info qi = {};
 	int num_channels = dram_info->num_channels;
@@ -676,14 +743,14 @@ static int xe2_hpd_get_bw_info(struct intel_display *display,
 	}
 
 	peakbw = num_channels * qi.channel_width / 8 * icl_sagv_max_dclk(&qi);
-	maxdebw = min(sa->deprogbwlimit * 1000, peakbw * DEPROGBWPCLIMIT / 10);
+	maxdebw = min(soc_bw_params->deprogbwlimit * 1000, peakbw * DEPROGBWPCLIMIT / 10);
 
 	for (i = 0; i < qi.num_points; i++) {
 		const struct intel_qgv_point *point = &qi.points[i];
 		int bw = num_channels * (qi.channel_width / 8) * point->dclk;
 
 		display->bw.max[0].deratedbw[i] =
-			min(maxdebw, (100 - sa->derating) * bw / 100);
+			min(maxdebw, (100 - soc_bw_params->derating) * bw / 100);
 		display->bw.max[0].peakbw[i] = bw;
 
 		drm_dbg_kms(display->drm, "QGV %d: deratedbw=%u peakbw: %u\n",
@@ -792,6 +859,7 @@ static unsigned int icl_qgv_bw(struct intel_display *display,
 void intel_bw_init_hw(struct intel_display *display)
 {
 	const struct dram_info *dram_info = intel_dram_info(display);
+	const struct intel_soc_bw_params *soc_bw_params = get_soc_bw_params(display);
 
 	if (!HAS_DISPLAY(display))
 		return;
@@ -807,28 +875,25 @@ void intel_bw_init_hw(struct intel_display *display)
 
 	if (DISPLAY_VER(display) >= 30) {
 		if (DISPLAY_VERx100(display) == 3002)
-			tgl_get_bw_info(display, dram_info, &xe3lpd_3002_sa_info);
+			tgl_get_bw_info(display, dram_info, soc_bw_params, &xe3lpd_3002_sa_info);
 		else
-			tgl_get_bw_info(display, dram_info, &xe3lpd_sa_info);
+			tgl_get_bw_info(display, dram_info, soc_bw_params, &xe3lpd_sa_info);
 	} else if (DISPLAY_VERx100(display) >= 1401 && display->platform.dgfx) {
-		if (dram_info->type == INTEL_DRAM_GDDR_ECC)
-			xe2_hpd_get_bw_info(display, dram_info, &xe2_hpd_ecc_sa_info);
-		else
-			xe2_hpd_get_bw_info(display, dram_info, &xe2_hpd_sa_info);
+		xe2_hpd_get_bw_info(display, dram_info, soc_bw_params);
 	} else if (DISPLAY_VER(display) >= 14) {
-		tgl_get_bw_info(display, dram_info, &mtl_sa_info);
+		tgl_get_bw_info(display, dram_info, soc_bw_params, &mtl_sa_info);
 	} else if (display->platform.dg2) {
 		dg2_get_bw_info(display);
 	} else if (display->platform.alderlake_p) {
-		tgl_get_bw_info(display, dram_info, &adlp_sa_info);
+		tgl_get_bw_info(display, dram_info, soc_bw_params, &adlp_sa_info);
 	} else if (display->platform.alderlake_s) {
-		tgl_get_bw_info(display, dram_info, &adls_sa_info);
+		tgl_get_bw_info(display, dram_info, soc_bw_params, &adls_sa_info);
 	} else if (display->platform.rocketlake) {
-		tgl_get_bw_info(display, dram_info, &rkl_sa_info);
+		tgl_get_bw_info(display, dram_info, soc_bw_params, &rkl_sa_info);
 	} else if (DISPLAY_VER(display) == 12) {
-		tgl_get_bw_info(display, dram_info, &tgl_sa_info);
+		tgl_get_bw_info(display, dram_info, soc_bw_params, &tgl_sa_info);
 	} else if (DISPLAY_VER(display) == 11) {
-		icl_get_bw_info(display, dram_info, &icl_sa_info);
+		icl_get_bw_info(display, dram_info, soc_bw_params, &icl_sa_info);
 	}
 }
 

-- 
2.53.0

