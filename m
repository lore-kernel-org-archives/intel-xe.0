Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA91C44507
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 08:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FDE10EC4A;
	Tue, 14 Jul 2026 08:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eWhk3U0V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11BF810EC49;
 Tue, 14 Jul 2026 08:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784016472; x=1815552472;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hUAIqdlGVV5aBkm0MiIaVncuX6qRWoK2CcPcizKGpc8=;
 b=eWhk3U0VW7XocU950KNeY4B+f6mm2pdUys579d+GhsXvBsj4+lVpgHxk
 WuHd1obP0yWR+K1CyQbTAbCRmbKHAhxrfIzBuyO7ysz2nSIW6WR+dSWZN
 nkp9alVw0cKfFf97oOeA0I0iINlsdyf9tN8JNjwxwmKrOYdnj6mczxjlp
 f7mZfSEXY+Hhi9cB2ybO6QxwH8LW/d8KNhpemzf0ySHgUz29035GDGPrD
 srXUq8ww2nwcOLmetAaEUZUWGMUt1zKAhUuS0YpR5JWfUfFC41MPC/F2t
 hfxzWhTuxlUMXa3WuJ6LB9kBpTKHKK4WTAQ3yVRwb5IlBd1R9xtpbxlkg g==;
X-CSE-ConnectionGUID: kF5vJGIuTPyP00lEMD9eZw==
X-CSE-MsgGUID: lAmwdBQwQDGX8dpHZaTuVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="95780316"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="95780316"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 01:07:51 -0700
X-CSE-ConnectionGUID: 1HASZlHbRm6vGtBTqBWahg==
X-CSE-MsgGUID: Oh6Lh94jQ+KnBDJbseTZnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="280214044"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa001.fm.intel.com with ESMTP; 14 Jul 2026 01:07:49 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, suraj.kandpal@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH] drm/i915/display/xe3p: Interpret 0xF populated-channel count
 as 16
Date: Tue, 14 Jul 2026 13:56:51 +0530
Message-ID: <20260714082651.4104132-1-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
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

The register MEM_SS_INFO_GLOBAL [Number of populated channels] field
definition is updated with an encoding for 16 channels.

For 16-channel configuration, program 1111b. A programmed value of 1111b
must be interpreted as 16 channels for memory bandwidth calculations.

WA: 16030862157
Bspec: 69131, 68859
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c   | 18 +++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dram.c | 11 +++++++++++
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 41539fdfeac5..f1197ce2d9fa 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -272,7 +272,13 @@ static int icl_get_qgv_points(struct intel_display *display,
 		case INTEL_DRAM_LPDDR4:
 		case INTEL_DRAM_LPDDR5:
 			qi->t_bl = 16;
-			qi->max_numchannels = 8;
+			/*
+			 * Wa_16030862157
+			 * Xe3p supports a fully-populated 16-channel LPDDR
+			 * config (4 memory controllers x 4 channels); earlier
+			 * D14+ platforms top out at 8.
+			 */
+			qi->max_numchannels = DISPLAY_VER(display) >= 35 ? 16 : 8;
 			qi->channel_width = 16;
 			qi->deinterleave = 4;
 			break;
@@ -624,10 +630,16 @@ static int tgl_get_bw_info(struct intel_display *display,
 
 	ipqdepth = min(ipqdepthpch, display_bw_params->displayrtids / num_channels);
 	/*
+	 * Wa_16030862157
 	 * clperchgroup = 4kpagespermempage * clperchperblock,
-	 * clperchperblock = 8 / num_channels * interleave
+	 * clperchperblock = max(8 / num_channels, 1) * interleave
+	 *
+	 * The 8 / num_channels truncating divide collapses to 0 for
+	 * >8-channel configs (16-channel: 8 / 16 = 0); the max(..., 1) floor
+	 * keeps clperchperblock >= 1 there while preserving the literal
+	 * truncating divide for <=8-channel configs.
 	 */
-	clperchgroup = 4 * (8 / num_channels) * qi.deinterleave;
+	clperchgroup = 4 * max(8 / num_channels, 1) * qi.deinterleave;
 
 	display->bw.num_qgv_points = qi.num_qgv_points;
 	display->bw.num_psf_gv_points = qi.num_psf_points;
diff --git a/drivers/gpu/drm/i915/display/intel_dram.c b/drivers/gpu/drm/i915/display/intel_dram.c
index f103f7cba018..df58effca785 100644
--- a/drivers/gpu/drm/i915/display/intel_dram.c
+++ b/drivers/gpu/drm/i915/display/intel_dram.c
@@ -796,6 +796,17 @@ static int xelpdp_get_dram_info(struct intel_display *display, struct dram_info
 	dram_info->num_qgv_points = REG_FIELD_GET(MTL_N_OF_ENABLED_QGV_POINTS_MASK, val);
 	/* PSF GV points not supported in D14+ */
 
+	/*
+	 * Wa_16030862157
+	 * MEM_SS_INFO_GLOBAL populated-channel field is only 4 bits and
+	 * cannot encode 16, so on Xe3p the BIOS programs the saturated field
+	 * value (0xf) to indicate the fully-populated 16-channel config (4
+	 * memory controllers x 4 channels). Interpret it as 16.
+	 */
+	if (DISPLAY_VER(display) >= 35 &&
+	    dram_info->num_channels == REG_FIELD_MAX(MTL_N_OF_POPULATED_CH_MASK))
+		dram_info->num_channels = 16;
+
 	if (DISPLAY_VER(display) >= 35)
 		dram_info->ecc_impacting_de_bw = REG_FIELD_GET(XE3P_ECC_IMPACTING_DE, val);
 
-- 
2.50.1

