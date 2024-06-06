Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6A6C25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 13:52:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661B210E958;
	Thu,  6 Jun 2024 13:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WB/Dkk4w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D3210E958
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 13:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717681922; x=1749217922;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G6pQuzRMe6cSkU6EJddgKarHuT8fDTULuN9yIrU+sug=;
 b=WB/Dkk4wuDMn7WOV/2zpdqfu1rz4oOaR57WSGlwjriCcFXYp1RQtH396
 nhRNSztyTRQ8dvNVC2kl8lgPBsnpbhY5vjEBb5OPTlAmAOKtW/wVTIMuA
 7Tt2qL9rdr3X7Ek07qfpGTkG1AvjXa1fGu+ecWldbTYvSir8L9qJzrvfm
 QAJZ6gK/07S03CUchsryBwD3N3x9uwc6Yk2cW8O6yCzr+E2nW4pWk59jW
 33PfVsbUVn64qX7Dy3d7qv0cM+o4w5rSpgbGMkm+mmBnnC0SvxIXVZE3s
 88WGpELTnnI0rJc/E2DTuFmkDL/qLhixhr29CI41Gh41FMVUkmryMKMJS w==;
X-CSE-ConnectionGUID: L9fe24McQdiwWwxDaQ8s+w==
X-CSE-MsgGUID: //RL8sCoTk2Kgme6aKDbIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="25757148"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="25757148"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 06:52:01 -0700
X-CSE-ConnectionGUID: 0MKXBAjMQBuzUPNPGhkUEQ==
X-CSE-MsgGUID: +ovvxoq/QEKT5CmklDrw/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="37924863"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa006.fm.intel.com with ESMTP; 06 Jun 2024 06:51:59 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/xe2lpm: Fixup Wa_14020756599
Date: Thu,  6 Jun 2024 19:22:28 +0530
Message-Id: <20240606135228.998820-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
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

In the current situation, Media 2000 is along with xe2_lpg,
thus WA is already covered.

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2016

Fixes: 131328aa5699 ("drm/xe/xe2lpm: Add permanent Wa_14020756599")
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c |  5 -----
 drivers/gpu/drm/xe/xe_rtp.h | 14 --------------
 drivers/gpu/drm/xe/xe_wa.c  | 13 ++++++-------
 3 files changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 01c32a932780..eff1c9c2f5cc 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -324,8 +324,3 @@ bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
 	return dss >= dss_per_gslice;
 }
 
-bool xe_rtp_match_when_media2000(const struct xe_gt *gt,
-				 const struct xe_hw_engine *hwe)
-{
-	return (gt_to_xe(gt))->info.media_verx100 == 2000;
-}
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index a32645f5f80b..337b1ef1959c 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -427,18 +427,4 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
 bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
 					 const struct xe_hw_engine *hwe);
 
-/*
- * xe_rtp_match_when_media2000 - Match when media GT version 2000
- *
- * @gt: GT structure
- * @hwe: Engine instance
- *
- * Its one of the case where we need to apply workaround on primary GT
- * based on if media GT version 2000 is present. Thus this API will help
- * us to match media version 2000.
- *
- * Returns: true if media GT version 2000, false otherwise.
- */
-bool xe_rtp_match_when_media2000(const struct xe_gt *gt,
-				 const struct xe_hw_engine *hwe);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 26b170a0cdc7..ce6f1b0ca808 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -677,6 +677,12 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP))
 	},
+	/* This WA is also needed on primary GT when the media version is 2000.
+	 * In the current situation, Media 2000 is along with xe2_lpg, thus WA
+	 * is already covered below. In the future, Media version 2000 can be
+	 * used with some other graphics version where WA still needs to be
+	 * implemented.
+	 */
 	{ XE_RTP_NAME("14020756599"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
@@ -705,13 +711,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 			     DIS_AUTOSTRIP))
 	},
 
-	/* Xe2_LPM */
-
-	{ XE_RTP_NAME("14020756599"),
-	  XE_RTP_RULES(ENGINE_CLASS(RENDER), FUNC(xe_rtp_match_when_media2000)),
-	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
-	},
-
 	{}
 };
 
-- 
2.25.1

