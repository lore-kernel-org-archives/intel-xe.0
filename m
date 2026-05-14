Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA06CD4F42
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 19:21:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D559210E3E8;
	Thu, 14 May 2026 19:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kyGxNWwI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF2210E3E1;
 Thu, 14 May 2026 19:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778786507; x=1810322507;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=CkZWUYK+YUgeTn9wAfhRWax6Cge31tCfUVkPXj3BFqk=;
 b=kyGxNWwIYOMP9lmsFNiXES0JdVbERNCrKknPAy71wd94mwqnN4Duj49c
 7kncP704lAKI/6jngwK9A1DebzkeqQK8vyhQ+FRfQNOrLvwbCrDx1K6vQ
 H15LzV5DMSm1i6jiYSnbTHcNo9WqoEG7Op42wIFGrSX/J/MQRUuA89YEC
 0v1tceEOTEel/jQTL6r2eyt0ze5xi5+SiGuiqmijuo2lv8fE/6Hn97i6B
 GrIcpuUQ5tuxHIRwLnRWckt0Dpj0zmw6Cgeqk3m4/oMseoVhd2q+zbOAK
 eKuPNVTQ4gAfAMupRgXCLsYI2aY50fpGeSCA4AEqOKpcHADb2+Us8mVuX A==;
X-CSE-ConnectionGUID: reP3AzkPQ4akK1IfMHJEtA==
X-CSE-MsgGUID: 4FmkQPwaSGq/6WWEvmtH7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="83351254"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="83351254"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 12:21:47 -0700
X-CSE-ConnectionGUID: 1XwWG/7IRQK09pCu9Hxypw==
X-CSE-MsgGUID: jEPzu/u4QliXt/8OmrVNbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="237611813"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.189])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 12:21:47 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 14 May 2026 16:19:32 -0300
Subject: [PATCH v3 3/5] drm/i915/bw: Deduplicate intel_sa_info instances
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-separate-platform-from-diplay-ip-specific-bw-params-v3-3-68727d6fe3ec@intel.com>
References: <20260514-separate-platform-from-diplay-ip-specific-bw-params-v3-0-68727d6fe3ec@intel.com>
In-Reply-To: <20260514-separate-platform-from-diplay-ip-specific-bw-params-v3-0-68727d6fe3ec@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
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

Now that intel_sa_info contains bandwidth parameters specific to the
display IP, we can drop many duplicates and reuse from previous
releases.

Let's do that and also simplify intel_bw_init_hw() while at it.

v2:
  - Drop rkl_sa_info and reuse icl_sa_info. (Matt)
  - Add comment explaining RKL's display's peculiarity on using ICL's
    parameters. (Matt)
  - Don't rename xelpdp_sa_info to mtl_sa_info.  Renaming of instances
    to use IP names will be done in upcoming changes.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 51 ++++++++-------------------------
 1 file changed, 12 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 351ecf741b54..a956b09028f3 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -477,36 +477,11 @@ static const struct intel_sa_info tgl_sa_info = {
 	.displayrtids = 256,
 };
 
-static const struct intel_sa_info rkl_sa_info = {
-	.deburst = 8,
-	.displayrtids = 128,
-};
-
-static const struct intel_sa_info adls_sa_info = {
-	.deburst = 16,
-	.displayrtids = 256,
-};
-
-static const struct intel_sa_info adlp_sa_info = {
-	.deburst = 16,
-	.displayrtids = 256,
-};
-
 static const struct intel_sa_info mtl_sa_info = {
 	.deburst = 32,
 	.displayrtids = 256,
 };
 
-static const struct intel_sa_info xe3lpd_sa_info = {
-	.deburst = 32,
-	.displayrtids = 256,
-};
-
-static const struct intel_sa_info xe3lpd_3002_sa_info = {
-	.deburst = 32,
-	.displayrtids = 256,
-};
-
 static int icl_get_bw_info(struct intel_display *display,
 			   const struct dram_info *dram_info,
 			   const struct intel_soc_bw_params *soc_bw_params,
@@ -876,25 +851,23 @@ void intel_bw_init_hw(struct intel_display *display)
 	if (DISPLAY_VER(display) >= 35)
 		drm_WARN_ON(display->drm, dram_info->ecc_impacting_de_bw);
 
-	if (DISPLAY_VER(display) >= 30) {
-		if (DISPLAY_VERx100(display) == 3002)
-			tgl_get_bw_info(display, dram_info, soc_bw_params, &xe3lpd_3002_sa_info);
-		else
-			tgl_get_bw_info(display, dram_info, soc_bw_params, &xe3lpd_sa_info);
-	} else if (DISPLAY_VERx100(display) >= 1401 && display->platform.dgfx) {
+	if (DISPLAY_VERx100(display) >= 1401 && display->platform.dgfx) {
 		xe2_hpd_get_bw_info(display, dram_info, soc_bw_params);
 	} else if (DISPLAY_VER(display) >= 14) {
 		tgl_get_bw_info(display, dram_info, soc_bw_params, &mtl_sa_info);
 	} else if (display->platform.dg2) {
 		dg2_get_bw_info(display);
-	} else if (display->platform.alderlake_p) {
-		tgl_get_bw_info(display, dram_info, soc_bw_params, &adlp_sa_info);
-	} else if (display->platform.alderlake_s) {
-		tgl_get_bw_info(display, dram_info, soc_bw_params, &adls_sa_info);
-	} else if (display->platform.rocketlake) {
-		tgl_get_bw_info(display, dram_info, soc_bw_params, &rkl_sa_info);
-	} else if (DISPLAY_VER(display) == 12) {
-		tgl_get_bw_info(display, dram_info, soc_bw_params, &tgl_sa_info);
+	} else if (DISPLAY_VER(display) >= 12) {
+		/*
+		 * RKL's SoC was based on ICL and the display, even though being
+		 * gen12, had changes to the memory interface to match gen11's,
+		 * consequently inheriting gen11's display-specific bandwidth
+		 * parameters.
+		 */
+		if (display->platform.rocketlake)
+			tgl_get_bw_info(display, dram_info, soc_bw_params, &icl_sa_info);
+		else
+			tgl_get_bw_info(display, dram_info, soc_bw_params, &tgl_sa_info);
 	} else if (DISPLAY_VER(display) == 11) {
 		icl_get_bw_info(display, dram_info, soc_bw_params, &icl_sa_info);
 	}

-- 
2.53.0

