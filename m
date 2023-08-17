Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75BFC678DD
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 23:04:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B1810E2A3;
	Thu, 17 Aug 2023 23:04:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757F110E27E
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 23:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692313456; x=1723849456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J+yOuzpJw778F0PYbO0bpBfroUGLf7rgv+UFIXRqPOc=;
 b=H9/PpLCAkBbG/+yTdXRsYuo16sPmFTcyoqMRWoQIHuLWdkOi/hPPYHrt
 hTjamaSWcj+jMNVq/d8cuRkIEBFzpJQj8kILdd5+Hm2o2O3EIPHHVvEeP
 5oxSa5GpfvicfSdTb4lh6+mpTIogCVdY16pevNCiCU7Mw1vS6GbTijHVc
 cHmXCz1gPS/bSwKIvDGHPLCCxqd70goNC9S3YPkJsB3E5JbVeR5egqcFO
 mGscPs7cUEyUHEXcCpyBoV8R2VitcodWiLNx+JJdrgoFx3yFq8FVs8snl
 obpNA4MrY3oWDhDIroIaQfcRs3UuUNZ/XVLKj7t1NglnUrnmK0JR0Gaan g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="375736164"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="375736164"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 16:04:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="734827929"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="734827929"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 16:04:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 17 Aug 2023 16:04:12 -0700
Message-ID: <20230817230407.909816-10-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817230407.909816-6-matthew.d.roper@intel.com>
References: <20230817230407.909816-6-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/4] drm/xe: Stop tracking 4-tile support
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

The choice of Y-major tiling format (either the legacy "TileY" or the
newer "Tile4") is based on graphics IP version (12.50 and beyond have
Tile4, earlier platforms have TileY).  Only display was using the
has_4tile feature flag, but that handling is now self-contained within
the display code itself, so we no longer need to track this feature flag
in the main Xe driver.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 --
 drivers/gpu/drm/xe/xe_pci.c          | 10 +---------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 303447c093c5..dbb732e14606 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -227,8 +227,6 @@ struct xe_device {
 		u8 force_execlist:1;
 		/** @has_flat_ccs: Whether flat CCS metadata is used */
 		u8 has_flat_ccs:1;
-		/** @has_4tile: Whether tile-4 tiling is supported */
-		u8 has_4tile:1;
 		/** @has_llc: Device has a shared CPU+GPU last level cache */
 		u8 has_llc:1;
 		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 46e3a9632efe..f6bc6ae1c920 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -80,12 +80,6 @@ struct xe_device_desc {
 	u8 is_dgfx:1;
 	u8 has_display:1;
 
-	/*
-	 * FIXME: Xe doesn't care about presence/lack of 4tile since we can
-	 * already determine that from the graphics IP version.  This flag
-	 * should eventually move entirely into the display code's own logic.
-	 */
-	u8 has_4tile:1;
 	u8 has_llc:1;
 };
 
@@ -277,8 +271,7 @@ static const u16 dg2_g12_ids[] = { XE_DG2_G12_IDS(NOP), 0 };
 		{ XE_SUBPLATFORM_DG2_G11, "G11", dg2_g11_ids }, \
 		{ XE_SUBPLATFORM_DG2_G12, "G12", dg2_g12_ids }, \
 		{ } \
-	}, \
-	.has_4tile = 1
+	}
 
 static const struct xe_device_desc ats_m_desc = {
 	.graphics = &graphics_xehpg,
@@ -555,7 +548,6 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.graphics_name = graphics_desc->name;
 	xe->info.media_name = media_desc ? media_desc->name : "none";
-	xe->info.has_4tile = desc->has_4tile;
 	xe->info.has_llc = desc->has_llc;
 
 	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
-- 
2.41.0

