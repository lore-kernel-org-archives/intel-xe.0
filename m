Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23B2CD8CA8
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 17:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D17410F60F;
	Fri, 12 Jun 2026 17:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1BC/b0k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D0A10F60B;
 Fri, 12 Jun 2026 17:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781285828; x=1812821828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gWAXIDvM4cmWNjBIJRfO7Aln5R7BCQaV9vh5K8CauFU=;
 b=V1BC/b0km5dT3CHGAJxLJ4pjGLhXimT4yk4Sw+ngbWeHwQ+R5YCpkD23
 VAh+oPQbyM8Jzd0e83VvRhXbLZJcy0DGbnoHsdSggLximvbfLtRsRQs9h
 +YB9wuHT+U3pGcKfAYiTcEenES72YHDS6ZBSey+0eFGzoq3xA/UGgluXZ
 4kf6I6fI0gGogyWE8J6q9jms3eE38+oa5UjwYM6AmXggCYGl9kvG977F5
 ZAQFyqXOVo+GaBTHpi0886D1CGbmra8zjT4sl4Js4lX4xy7gLdzCI+Bjd
 WHdT8WjDH1nKF4LW1g9Ox7E6qs0yNvUjMDpNCLNTmTBJiuJho+5CSXPtC Q==;
X-CSE-ConnectionGUID: y6067SfHRqWJqWpa6phx3A==
X-CSE-MsgGUID: h98bdgvBQFGngfFLdwiKMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="107555871"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="107555871"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:37:08 -0700
X-CSE-ConnectionGUID: anO3SoZ5SnejR3uQbtd3aw==
X-CSE-MsgGUID: gvoSldAIRZSmgQkDj5gigg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="242500639"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 10:37:06 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/6] drm/i915/cdclk: Print the reason for the CDCLK
 sanitization
Date: Fri, 12 Jun 2026 20:36:49 +0300
Message-ID: <20260612173653.7830-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612173653.7830-1-ville.syrjala@linux.intel.com>
References: <20260612173653.7830-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Make debugging a bit easier by printing out the specific reason
for the CDCLK sanitization. Currently one is forced to guess what
is actually happening.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 37 +++++++++++++++-------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 7bc9b956554b..b612ab6f462a 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -1229,23 +1229,28 @@ static void skl_set_cdclk(struct intel_display *display,
 
 static void skl_sanitize_cdclk(struct intel_display *display)
 {
-	u32 cdctl, expected;
+	u32 cdctl, expected, swf18;
 
 	/*
 	 * check if the pre-os initialized the display
 	 * There is SWF18 scratchpad register defined which is set by the
 	 * pre-os which can be used by the OS drivers to check the status
 	 */
-	if ((intel_de_read(display, SWF_ILK(0x18)) & 0x00FFFFFF) == 0)
+	swf18 = intel_de_read(display, SWF_ILK(0x18));
+	if ((swf18 & 0x00FFFFFF) == 0) {
+		drm_dbg_kms(display->drm, "Sanitizing CDCLK due to SWF18 0x%x\n", swf18);
 		goto sanitize;
+	}
 
 	intel_update_cdclk(display);
 	intel_cdclk_dump_config(display, &display->cdclk.hw, "Current CDCLK");
 
 	/* Is PLL enabled and locked ? */
 	if (display->cdclk.hw.vco == 0 ||
-	    display->cdclk.hw.cdclk == display->cdclk.hw.bypass)
+	    display->cdclk.hw.cdclk == display->cdclk.hw.bypass) {
+		drm_dbg_kms(display->drm, "Sanitizing CDCLK due to PLL not enabled/locked\n");
 		goto sanitize;
+	}
 
 	/* DPLL okay; verify the cdclock
 	 *
@@ -1261,8 +1266,11 @@ static void skl_sanitize_cdclk(struct intel_display *display)
 		cdctl &= ~CDCLK_FREQ_DECIMAL_MASK;
 		cdctl |= expected & CDCLK_FREQ_DECIMAL_MASK;
 
-		if (cdctl != expected)
+		if (cdctl != expected) {
+			drm_dbg_kms(display->drm, "Sanitizing CDCLK due to CDCLK_CTL 0x%x, expected 0x%x)\n",
+				    intel_de_read(display, CDCLK_CTL), expected);
 			goto sanitize;
+		}
 
 		drm_dbg_kms(display->drm, "Sanitizing CDCLK decimal divider (CDCLK_CTL 0x%x, expected 0x%x)\n",
 			    intel_de_read(display, CDCLK_CTL), expected);
@@ -1274,8 +1282,6 @@ static void skl_sanitize_cdclk(struct intel_display *display)
 	return;
 
 sanitize:
-	drm_dbg_kms(display->drm, "Sanitizing cdclk programmed by pre-os\n");
-
 	/* force cdclk programming */
 	display->cdclk.hw.cdclk = 0;
 	/* force full PLL disable + enable */
@@ -2340,18 +2346,24 @@ static void bxt_sanitize_cdclk(struct intel_display *display)
 	intel_cdclk_dump_config(display, &display->cdclk.hw, "Current CDCLK");
 
 	if (display->cdclk.hw.vco == 0 ||
-	    display->cdclk.hw.cdclk == display->cdclk.hw.bypass)
+	    display->cdclk.hw.cdclk == display->cdclk.hw.bypass) {
+		drm_dbg_kms(display->drm, "Sanitizing CDCLK due to PLL not enabled/locked\n");
 		goto sanitize;
+	}
 
 	/* Make sure this is a legal cdclk value for the platform */
 	cdclk = bxt_calc_cdclk(display, display->cdclk.hw.cdclk);
-	if (cdclk != display->cdclk.hw.cdclk)
+	if (cdclk != display->cdclk.hw.cdclk) {
+		drm_dbg_kms(display->drm, "Sanitizing CDCLK due to bad CDCLK frequency\n");
 		goto sanitize;
+	}
 
 	/* Make sure the VCO is correct for the cdclk */
 	vco = bxt_calc_cdclk_pll_vco(display, cdclk);
-	if (vco != display->cdclk.hw.vco)
+	if (vco != display->cdclk.hw.vco) {
+		drm_dbg_kms(display->drm, "Sanitizing CDCLK due to bad VCO frequency\n");
 		goto sanitize;
+	}
 
 	/*
 	 * Some BIOS versions leave an incorrect decimal frequency value and
@@ -2375,8 +2387,11 @@ static void bxt_sanitize_cdclk(struct intel_display *display)
 			cdctl |= expected & CDCLK_FREQ_DECIMAL_MASK;
 		}
 
-		if (cdctl != expected)
+		if (cdctl != expected) {
+			drm_dbg_kms(display->drm, "Sanitizing CDCLK due to CDCLK_CTL 0x%x, expected 0x%x\n",
+				    intel_de_read(display, CDCLK_CTL), expected);
 			goto sanitize;
+		}
 
 		drm_dbg_kms(display->drm, "Sanitizing CDCLK decimal divider (CDCLK_CTL 0x%x, expected 0x%x)\n",
 			    intel_de_read(display, CDCLK_CTL), expected);
@@ -2388,8 +2403,6 @@ static void bxt_sanitize_cdclk(struct intel_display *display)
 	return;
 
 sanitize:
-	drm_dbg_kms(display->drm, "Sanitizing cdclk programmed by pre-os\n");
-
 	/* force cdclk programming */
 	display->cdclk.hw.cdclk = 0;
 
-- 
2.53.0

