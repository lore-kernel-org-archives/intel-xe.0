Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C71C27C55
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 12:25:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B555410E052;
	Fri,  7 Jun 2024 12:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gSH4966B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3A910E052
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 12:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717763101; x=1749299101;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lrSutnH+20SGzq/v0jaL1dVR6AIDqFi/YZju4Mza+ro=;
 b=gSH4966BkXyNRleawMyBU2TTOrroav3xzF/VIljLbxxFDzStKnRad+ob
 02cAdVdk35sCKm5ON4j0eeYEIC6SJQPsqZE+uAcnTgE4EkJ7PYCNS7tbR
 zx7ywPqH3FHn5985td9ZekDkd+y6qDmnzOYJT5V5qJF10QdevLeRDrMhj
 FJcMvSUyPeyAI7CHfOK7ZGKjJa9/dcK5I1zExzJipe0cE8lLSxZmWP6La
 C1pV4HKDexkpEbmCfGOR1pUuoPj6mdfUsW34+rb1FcPVHj6bs4Jb8BEmR
 xfImnRBxtS5h0y8HVhpPTrzCkv2OZ+g3KW8ti0QyoZOuQ/xwQrELD7Uo7 g==;
X-CSE-ConnectionGUID: KMezREojTKerfvYHCKAjSw==
X-CSE-MsgGUID: XIoVNeeuTQ+YCRgoA/7dhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14434503"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14434503"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 05:25:00 -0700
X-CSE-ConnectionGUID: ItKsQzrWRE2jyp8Bz7dtlQ==
X-CSE-MsgGUID: SWo8M/CITHSpLKm3ZUURaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38229276"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa010.jf.intel.com with ESMTP; 07 Jun 2024 05:24:58 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2] drm/xe/xe2lpm: Fixup Wa_14020756599
Date: Fri,  7 Jun 2024 17:55:28 +0530
Message-Id: <20240607122528.1048610-1-tejas.upadhyay@intel.com>
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

This WA needs to be applied to graphics GT when the media version
is 2000. Currently, media version 2000 is always paired with
graphics version 2004 which will result in writing same register
with same bits twice. We can't add optional rule in rtp
framework and also writing same register with same bits gives
warning.

Currently, media version 2000 is always paired with graphics version
2004, so just checking the latter is sufficient.

V2(Lucas):
  - Add more detail in commit message
  - Improve code comment to follow guideline

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2016
Fixes: 131328aa5699 ("drm/xe/xe2lpm: Add permanent Wa_14020756599")
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c |  5 -----
 drivers/gpu/drm/xe/xe_rtp.h | 14 --------------
 drivers/gpu/drm/xe/xe_wa.c  | 14 +++++++-------
 3 files changed, 7 insertions(+), 26 deletions(-)

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
index 26b170a0cdc7..18a4d5dd5a4c 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -677,6 +677,13 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP))
 	},
+	/*
+	 * This WA is also needed on primary GT when the media version is 2000.
+	 * Currently, media version 2000 is always paired with graphics version
+	 * 2004, so just checking the latter is sufficient. In the future, media
+	 * version 2000 can be used with some other graphics version where WA
+	 * still needs to be implemented
+	 */
 	{ XE_RTP_NAME("14020756599"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
@@ -705,13 +712,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
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

