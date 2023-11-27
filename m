Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB152C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 19:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9C510E3CB;
	Mon, 27 Nov 2023 19:03:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF0010E3CB
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 19:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701111816; x=1732647816;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7kF35j92PtPGmpQ+0tHMEKpafgiIjf0U+Ff1r/TUxDE=;
 b=PMlYj3ugtcmacC+zDKIEy+USt6WmCOuRQnnsOzyeuFpakolfAg1DZuM8
 CXspUiZd67VLA3YNRl95W5sJ6X9X/Aw4AB9CijI2YmFyt0H6K1hnKqEC1
 waOghcykIWaMz3eTDovim8qsqgG0hIgJj0lmFWUZbKRaO+PcZy9PeLntn
 tnJpGnvNTdNgVIbHADkzx1buzkY2uiT0B975C/WXvuc3lpIkQpxKx303/
 4/zNjIkv2vvsFjBPcgHNPvLOT9BFJ8QLy8BKLUafz0/9WFmyMGZyW8Wds
 6a7BAoGXhilWdqcVBd2jkWGHBe14SloBwmawxCyCzPFsEgW9LNFxPggEj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="396672745"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="396672745"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 11:03:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="941667877"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="941667877"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 11:03:35 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 11:03:33 -0800
Message-ID: <20231127190332.4099519-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/dg2: Drop Wa_22014600077
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The workaround database has been updated to drop this workaround for all
DG2 variants.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 81ae0232146e..e0853ab30c00 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -522,27 +522,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7,
 			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA))
 	},
-	{ XE_RTP_NAME("22014600077"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(B0, FOREVER),
-		       ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
-			     ENABLE_EU_COUNT_FOR_TDL_FLUSH,
-			     /*
-			      * Wa_14012342262 write-only reg, so skip
-			      * verification
-			      */
-			     .read_mask = 0))
-	},
-	{ XE_RTP_NAME("22014600077"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
-			     ENABLE_EU_COUNT_FOR_TDL_FLUSH,
-			     /*
-			      * Wa_14012342262 write-only reg, so skip
-			      * verification
-			      */
-			     .read_mask = 0))
-	},
 	{ XE_RTP_NAME("14015150844"),
 	  XE_RTP_RULES(PLATFORM(DG2), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(XEHP_HDC_CHICKEN0, DIS_ATOMIC_CHAINING_TYPED_WRITES,
-- 
2.41.0

