Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B74C5AD56
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD07A10E832;
	Fri, 20 Feb 2026 17:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eH736Js+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60AF10E82B
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608498; x=1803144498;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=y+P/znUsHmzAfjWmN4luZoFPNsY0uAnAjMpdAWYeoyw=;
 b=eH736Js+EJuHS6FkkTEOZ8ag8nVDopzWJTNlOmpvtHf5g+I5VhwpA6I4
 guvy762aJ0uAol6WK85+6SlGWWXMy6poTy1cI9tfMB2/32QTQV2mLjLY+
 df2R7KHRzQEP0j2gkGvjcUXKr0niOCqGgG9s9p1XFZ+aoxJRfzHUYsbjE
 z0Su63z+CtC36SU6DQeJgnYSr6Xpw7keL6kmdKqYXYOs3Tap6jSv5OwoP
 VcNrjSU8z5wM+fkKh/Y76wF0XCSb9n6zDTm4///84XrRGGGLqm/8jmr8t
 t7HHE2vwIQmttKL9KxjOyLA3Hm1eKyMxew+uS6Qtyo2FDUHARWNoU76DQ Q==;
X-CSE-ConnectionGUID: B0L6OjYnT5yZ8yAaAxXLxg==
X-CSE-MsgGUID: bwabEhvxRF2YmVjetaLcmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606741"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72606741"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:17 -0800
X-CSE-ConnectionGUID: EhMf9fyATp2VSDGYSFl7dQ==
X-CSE-MsgGUID: EOgZlm0RQxaQuq3QZhzwVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214138705"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 20 Feb 2026 09:27:34 -0800
Subject: [PATCH v2 12/23] drm/xe: Consolidate workaround entries for
 Wa_16021639441
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-forupstream-wa_cleanup-v2-12-b12005a05af6@intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4045;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=y+P/znUsHmzAfjWmN4luZoFPNsY0uAnAjMpdAWYeoyw=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpmJmu+aBFcd9KCB56sDmnd+ceZ5nXuY3IovV8t
 TRBo3njTViJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZiZrgAKCRBNeSQFyHKQ
 BPGgEACn/smljeIcqmAglWez5A7HZrGhD/H/JFt7oBE+vYngjsT0zsTnjWZ1I4kyFhlMS3M3i8t
 hRxGZtMseRvVaFAnKQDHDcb+jr4iRab1qcTGhPvnTK++hw/ts6fALgi6dy4x3ZaOhwk+GqZfgM/
 ZmsKdhYvkyxP6NjIhfenVx5dA4m8QsP2Fnho6HlWltAJ7KI2y+w0gwwLfZHyD9moidcznZpPJcH
 xb3BNQOXF/4wcVJ4XVydrpZlgRAIF38JLinFLa49aIjEsGvTPRBX0AYANlHaNgxTIYm2r2KInj6
 GRxlB9NFzM4hli02xTNGhgxwQm0rPMUA9uleotF7Sht+lZjJPZ1AgVOSaRH4cwmaz/lm/vHbI14
 67Y6ulRZ5mikmPzlntw3pJPhmpcaBtZx5HesJDIs7s+abPuQn6fj57GNjXn/cYTOmyQnxCx4FWd
 2ICwwRA2u/FCBBLWUOfB/7rCDMDn/JthVKfKNitdmMpC17Xun46MudAzVasgBL0fOBYoyQz+xCv
 JCuufbMMxMbcX4yVDRWGqcrQZCvD8LlLLC5eGQxHBf+JQjMW0/EfE+dKZzyEA4LBriaFqWRFXJ5
 VNIYVBPuXl8OmU/tEq4jBgiZcd5/mJ1a8TsBJL/eYysxPTHj4EjRtTE3Co+fdADh8EzM/B4njCt
 +6OgDys2/7Bnh2A==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

Wa_16021639441 applies to all graphics versions from 20.01 through 20.04
(inclusive) and all media versions from 13.01 to 20.00 (inclusive).
Consolidate the RTP entries into a single range-based entry.
Also drop the reference to Wa_18032095049 which was only relevant to
pre-production platforms that we no longer support.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 59 ++++++++++------------------------------------
 1 file changed, 13 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 9119ca9ba1031d9180b44c13a702e1bb04fd0ca6..f0c42be062146837e6ba40621af54fcafa34f8e8 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -363,6 +363,19 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
 	},
+	/*
+	 * Although this workaround isn't required for the RCS, disabling these
+	 * reports has no impact for our driver or the GuC, so we go ahead and
+	 * apply this to all engines for simplicity.
+	 */
+	{ XE_RTP_NAME("16021639441"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), OR,
+		       MEDIA_VERSION_RANGE(1301, 2000)),
+	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
+			     GHWSP_CSB_REPORT_DIS |
+			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
+			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+	},
 
 	/* TGL */
 
@@ -505,20 +518,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
 	},
-	/*
-	 * These two workarounds are the same, just applying to different
-	 * engines.  Although Wa_18032095049 (for the RCS) isn't required on
-	 * all steppings, disabling these reports has no impact for our
-	 * driver or the GuC, so we go ahead and treat it the same as
-	 * Wa_16021639441 which does apply to all steppings.
-	 */
-	{ XE_RTP_NAME("18032095049, 16021639441"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004)),
-	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
-			     GHWSP_CSB_REPORT_DIS |
-			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
-			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
-	},
 	{ XE_RTP_NAME("16018610683"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, SLM_WMTP_RESTORE))
@@ -546,18 +545,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
 	},
-	/*
-	 * Although this workaround isn't required for the RCS, disabling these
-	 * reports has no impact for our driver or the GuC, so we go ahead and
-	 * apply this to all engines for simplicity.
-	 */
-	{ XE_RTP_NAME("16021639441"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002)),
-	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
-			     GHWSP_CSB_REPORT_DIS |
-			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
-			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
-	},
 	{ XE_RTP_NAME("14019811474"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
@@ -584,26 +571,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
 	},
 
-	/* Xe2_LPM */
-
-	{ XE_RTP_NAME("16021639441"),
-	  XE_RTP_RULES(MEDIA_VERSION(2000)),
-	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
-			     GHWSP_CSB_REPORT_DIS |
-			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
-			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
-	},
-
-	/* Xe2_HPM */
-
-	{ XE_RTP_NAME("16021639441"),
-	  XE_RTP_RULES(MEDIA_VERSION(1301)),
-	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
-			     GHWSP_CSB_REPORT_DIS |
-			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
-			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
-	},
-
 	/* Xe3_LPG */
 
 	{ XE_RTP_NAME("14021402888"),

-- 
2.53.0

