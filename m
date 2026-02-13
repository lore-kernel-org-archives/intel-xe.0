Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98FBEF99E6
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:32:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E47310E855;
	Fri, 13 Feb 2026 22:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axv8mI0U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537B710E327
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771021958; x=1802557958;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=WQKKeqR7fYGXkU1/nN3/j4WNnlmg2p2rYiuSKWmM1B8=;
 b=axv8mI0U/tZU+V6VE4GkaFkaCYIT7t6z+blcA58aBPAJ6V3Z0plMYtPl
 gGUHlaWS689x4ARkVdxLvua0l42HDCWjhoIZQeqWd5Pz+ktaRbaVTLvra
 LZ9EbMaafvgN7eT0Bg+GMrOnqIWLzeVa7xkMtWjQXcVzn/R06HxFOlzAH
 UlIU0TwMSrFWSi6sDarJ/VtxFlqddU4wPmvFSTbv0xtdI6cH0MGJbACpt
 LI2WGIEWxFVKGreUSIH3Q0mI4JW4xaXKLUtn1piqguFlPG7InnLxq/p0f
 eT88NgDbFeoqGleslt4COga2wbGjgyR8n6NNL+FMbEySp2V2N3U4ep1Tq A==;
X-CSE-ConnectionGUID: ZKH2j3XpTaarArCDb8Uhrw==
X-CSE-MsgGUID: /QOmVGflSImxkqneZmHwDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83654440"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="83654440"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:37 -0800
X-CSE-ConnectionGUID: IXF1kmn5TAa7MG0mlwPdlg==
X-CSE-MsgGUID: aTDs3CTmRK+041sbHAmdHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211705656"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 13 Feb 2026 14:31:47 -0800
Subject: [PATCH 12/22] drm/xe: Consolidate workaround entries for
 Wa_16021639441
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-forupstream-wa_cleanup-v1-12-961f2dd3a8e9@intel.com>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
In-Reply-To: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4045;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=WQKKeqR7fYGXkU1/nN3/j4WNnlmg2p2rYiuSKWmM1B8=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpj6aCGkysexbMl+d/p1omlxxeL/k5GOB4xfT86
 6X6k/vYxQeJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaY+mggAKCRBNeSQFyHKQ
 BD8iD/oCHb4lHSTYcIEd7vbJ/pqhaZxjrSRiVc8IbRtpXLvI4KJWT9j5tiambTe7Y6DCN8954Hp
 R0Z3fOUdflphQnEdDQteksukiDtiq/huuFqI7YtvQCSufH1RHHYtGw6RN5HbHA4zktT8YcJj5yl
 KVk//F/dYqUNVsUwVTcCJazTu4MndOAooq3674fR9uKBV1xSMYePGVSv93OMOtfBFFd/rcxRNeX
 RpGSVpi5aycCKhIchHQSVwdLwCuLExaKNRHAEDAQizoymWvU7+VmgDN3b6SM8ivqlzJvdeCc5MB
 ySEn39sU1crojRXuufugt8Oez8IiOVTva8ZGvuqHeOnFUWkdEHcQoSPJ84vM1mAIbAUL0BFTcgJ
 aoDNPmIHFtI9tVQaIWkWe2OqBCsuWEchHL/Z4gihR8cTWaUInNqwGhNx0K9Gv0wWbBixEeVRcWA
 txV2Md64GiESGbLHyy0ahGRIoB0BD+D2HIJ4loGDCG5cYUScHIaduz22JrR2+7TVVB41nCVGqT3
 AihhlSfaGFsB/4rH9MXhwuSpr4rj9jBu6RGG5ivYGyXB8bLLJSG1z846tHvlgPhYbLkMXxZxUZp
 f5GHhV61cfSePTdnLCbU1lgQC7PDwVdB7pgItKVnjCnrhg/2jGbolVp4LvC6vvRrbBZMHJD1Qo7
 3HqqlLiwcsMd+LA==
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
index e5b2424305ac5ec4ecd193038ca6231e8bc81fae..460cfabfb4442fa33ff645392788549026dfc9d4 100644
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
@@ -540,18 +539,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
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
@@ -579,26 +566,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
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

