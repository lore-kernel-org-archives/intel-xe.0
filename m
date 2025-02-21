Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAF6C021B4
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 00:39:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0057210E1D2;
	Fri, 21 Feb 2025 00:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WiTkdodm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E091610E1D2;
 Fri, 21 Feb 2025 00:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740098339; x=1771634339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0zmEJK9xNDGTa3cTtVBOqoV+fxSXnNMjfwBF/uWhVqE=;
 b=WiTkdodmG/XZtf2eUCHbnLFbvr0VJk0TRWtTxjUUPafGTfFr7qlqN4FJ
 FvKyToRqc3jECOkck4ay7hT1cATUh+7ngtpmYQckgdT68+3xdsPX0WFi+
 xCBZPsZaxAWEsn/w1ni18wNC1K+akLoI6GiECsnv4bCYQdlHE/tTE8dxx
 NNmMSrJK82LrrNp303Uj3OqlA1toC5BxpyX53Lla5MG6EGo3x+/lx/8Eq
 jIocotpGYmMXmQFfxO38dNMywVOMkMNSp7jAvS2SAPC8KRWLP1h4M0gnh
 24xWkxvGVT+EesWJwEj50hNC4zS3xIqIqvy7i3BPBIswpIXKMY1eIppKR A==;
X-CSE-ConnectionGUID: X3X3siM1T02E0KveRPGogQ==
X-CSE-MsgGUID: NRCVcLsiSg2mPCysydygMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44688687"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="44688687"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 16:38:59 -0800
X-CSE-ConnectionGUID: +hMh3CYXSM22atx2SJQG4g==
X-CSE-MsgGUID: Fg+svk8HQh+vZc7WMxUqKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120446840"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 16:38:57 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 1/4] drm/i915/display: Make refclk fetching logic reusable
Date: Thu, 20 Feb 2025 16:38:45 -0800
Message-ID: <20250221003843.443559-7-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221003843.443559-6-matthew.d.roper@intel.com>
References: <20250221003843.443559-6-matthew.d.roper@intel.com>
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

There's cdclk-specific code to obtain the display reference clock,
either by reading a strap register, or by using a platform-specific
hardcoded value.  There's at least one other place in our drivers that
potentially needs this clock frequency, so refactor the logic to make it
more generally usable.

While we're at it, change the fallback frequency we assume if the strap
readout gives us something unrecognizable to 38.4MHz for platforms with
display version 14 and above.  38.4MHz seems to be the sole frequency
that's actually been used in recent history (since MTL), so this is
probably the safest guess to make going forward.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 44 +++++++++++++---------
 drivers/gpu/drm/i915/display/intel_cdclk.h |  1 +
 2 files changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index c6cfc57a0346..57b01f8a7be8 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -1636,38 +1636,48 @@ static u8 xe3lpd_calc_voltage_level(int cdclk)
 	return 0;
 }
 
-static void icl_readout_refclk(struct intel_display *display,
-			       struct intel_cdclk_config *cdclk_config)
+static u32 icl_readout_refclk(struct intel_display *display)
 {
 	u32 dssm = intel_de_read(display, SKL_DSSM) & ICL_DSSM_CDCLK_PLL_REFCLK_MASK;
 
 	switch (dssm) {
-	default:
-		MISSING_CASE(dssm);
-		fallthrough;
 	case ICL_DSSM_CDCLK_PLL_REFCLK_24MHz:
-		cdclk_config->ref = 24000;
-		break;
+		return 24000;
 	case ICL_DSSM_CDCLK_PLL_REFCLK_19_2MHz:
-		cdclk_config->ref = 19200;
-		break;
+		return 19200;
 	case ICL_DSSM_CDCLK_PLL_REFCLK_38_4MHz:
-		cdclk_config->ref = 38400;
-		break;
+		return 38400;
+	default:
+		MISSING_CASE(dssm);
+		return DISPLAY_VER(display) >= 14 ? 38400 : 24000;
 	}
 }
 
+/**
+ * intel_display_get_refclk - Returns the display reference clock
+ * @display: display instance
+ *
+ * Returns the display reference clock in KHz.  The display reference clock
+ * is defined by the SoC; on some platforms the proper value should be read
+ * from a hardware strap register, while on others there's only a single
+ * possible value.
+ */
+u32 intel_display_get_refclk(struct intel_display *display)
+{
+	if (display->platform.dg2)
+		return 38400;
+	else if (DISPLAY_VER(display) >= 11)
+		return icl_readout_refclk(display);
+	else
+		return 19200;
+}
+
 static void bxt_de_pll_readout(struct intel_display *display,
 			       struct intel_cdclk_config *cdclk_config)
 {
 	u32 val, ratio;
 
-	if (display->platform.dg2)
-		cdclk_config->ref = 38400;
-	else if (DISPLAY_VER(display) >= 11)
-		icl_readout_refclk(display, cdclk_config);
-	else
-		cdclk_config->ref = 19200;
+	cdclk_config->ref = intel_display_get_refclk(display);
 
 	val = intel_de_read(display, BXT_DE_PLL_ENABLE);
 	if ((val & BXT_DE_PLL_PLL_ENABLE) == 0 ||
diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.h b/drivers/gpu/drm/i915/display/intel_cdclk.h
index 6b0e7a41eba3..3cfbe1f2b6b5 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.h
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.h
@@ -65,6 +65,7 @@ void intel_init_cdclk_hooks(struct intel_display *display);
 void intel_update_max_cdclk(struct intel_display *display);
 void intel_update_cdclk(struct intel_display *display);
 u32 intel_read_rawclk(struct intel_display *display);
+u32 intel_display_get_refclk(struct intel_display *display);
 bool intel_cdclk_clock_changed(const struct intel_cdclk_config *a,
 			       const struct intel_cdclk_config *b);
 int intel_mdclk_cdclk_ratio(struct intel_display *display,
-- 
2.48.1

