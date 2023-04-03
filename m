Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BBCC77B6C
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 20:17:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A251710E58C;
	Mon,  3 Apr 2023 20:17:15 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351AC10E564
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 20:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680553033; x=1712089033;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O+WFJ+abemJB+w7ib7EuZDdqyF3mDG7ISokoSo7XMpc=;
 b=amGiv55jjlVtm8bErI/FUpM8kBhkzoo1ELfbYiph+xYoAxMRDt6UXCh8
 EZw00oqn9ZEO224VfZfxUgwdnaPE5Hk9FvycX4z1JQ7zb4uGYPsuEPQte
 jdPWG+C3rOaA+tfsFhbaDmXKwvf9DWOvnChlBfwBaeNi1pKYgVZ7GuFMp
 1CsmUMIw1UhfKzLAuzXbee12Bf+JeD9zwAuxSH2bUowo8slX4IhMa19tP
 FaXCIvPiOhCGlFtqCLBo5CGsLdl8t4Rqqg4z5mMBp0jpCjLzLfUVvaHQ2
 SQGs2/6F7HsRNPSBpw3LgVi7MEvGw8pyep5yjVnaOQPEoBuLZ1LfXKFV9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="330580144"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="330580144"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 13:17:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="636236499"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="636236499"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 13:17:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  3 Apr 2023 13:17:01 -0700
Message-Id: <20230403201702.996400-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403201702.996400-1-matthew.d.roper@intel.com>
References: <20230403201702.996400-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/6] drm/xe: Clarify GT counting logic
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

The total number of GTs supported by a platform should be one primary
GT, one media GT (if media version >= 13), and a number of remote tile
GTs dependent on the graphics IP present.  Express this more clearly in
the device setup.

Note that xe->info.tile_count is inaccurately named; the rest of the
driver treats this as the GT count, not just the tile count.  This
will need to be cleaned up at some point down the road.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3e7e57254a6d..d634e781858a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -46,12 +46,13 @@ struct xe_graphics_desc {
 	u8 rel;
 
 	u8 dma_mask_size;	/* available DMA address bits */
-	u8 max_tiles;		/* defaults to 1 if unset */
 	u8 vm_max_level;
 	u8 vram_flags;
 
 	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
 
+	u8 max_remote_tiles:2;
+
 	u8 has_asid:1;
 	u8 has_flat_ccs:1;
 	u8 has_link_copy_engine:1;
@@ -152,7 +153,7 @@ static const struct xe_graphics_desc graphics_xehpc = {
 
 	XE_HP_FEATURES,
 	.dma_mask_size = 52,
-	.max_tiles = 2,
+	.max_remote_tiles = 1,
 	.vm_max_level = 4,
 	.vram_flags = XE_VRAM_FLAGS_NEED64K,
 
@@ -171,8 +172,6 @@ static const struct xe_graphics_desc graphics_xelpg = {
 		BIT(XE_HW_ENGINE_CCS0),
 
 	XE_HP_FEATURES,
-	.max_tiles = 2,
-
 	.has_flat_ccs = 0,
 };
 
@@ -455,7 +454,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	xe->info.platform = desc->platform;
 	xe->info.dma_mask_size = desc->graphics->dma_mask_size;
 	xe->info.vram_flags = desc->graphics->vram_flags;
-	xe->info.tile_count = desc->graphics->max_tiles ?: 1;
 	xe->info.vm_max_level = desc->graphics->vm_max_level;
 	xe->info.supports_usm = desc->graphics->supports_usm;
 	xe->info.has_asid = desc->graphics->has_asid;
@@ -464,6 +462,19 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	xe->info.has_range_tlb_invalidation = desc->graphics->has_range_tlb_invalidation;
 	xe->info.has_link_copy_engine = desc->graphics->has_link_copy_engine;
 
+	/*
+	 * All platforms have at least one primary GT.  Any platform with media
+	 * version 13 or higher has an additional dedicated media GT.  And
+	 * depending on the graphics IP there may be additional "remote tiles."
+	 * All of these together determine the overall GT count.
+	 *
+	 * FIXME: 'tile_count' here is misnamed since the rest of the driver
+	 * treats it as the number of GTs rather than just the number of tiles.
+	 */
+	xe->info.tile_count = 1 + desc->graphics->max_remote_tiles;
+	if (MEDIA_VER(xe) >= 13)
+		xe->info.tile_count++;
+
 	spd = subplatform_get(xe, desc);
 	xe->info.subplatform = spd ? spd->subplatform : XE_SUBPLATFORM_NONE;
 	xe->info.step = xe_step_get(xe);
-- 
2.39.2

