Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79125C7618D
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 20:18:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B7710ECE7;
	Thu,  6 Apr 2023 20:18:58 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13C310ECCE
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 20:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680812332; x=1712348332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cUi0xQd8RRDpKOCLZFKzfHbsDvCOX5SC0MsjEr1BUus=;
 b=dZOceBqOWlg0B9xE/zZYQvQcOZeXOu1Com4/AY1u8qRdEtUzrPqwpoq+
 NNdkCEmgyi+OWwn9wChZxjSqeI93Ij3fSX5bfEuOUGSHOcF6KSgJT8GTR
 lrt/01qNYlI4W6kxMMljtcW2CUp2Jz3dAGUNLFrsZ8ylKiLToF2UqpctA
 0Z9k+LI65gexMEILSJqqaSK2QOCxzObxsHdOocY5J3gRriy+r35kQNB+s
 ydaB/DGTj7L239N8tIVKUwdgJyx3K5vjfoD7Vvzc7JSGySoTQVnnqCmhG
 sF3zG1SPw/1Nm/qNUl8TOkUoDikaY4ZgGqlBn2hwLgrLBsTU+E4VpwWLY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="322482252"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="322482252"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 13:18:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="751775475"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="751775475"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 13:18:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 13:18:41 -0700
Message-Id: <20230406201845.1797532-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406201845.1797532-1-matthew.d.roper@intel.com>
References: <20230406201845.1797532-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 5/9] drm/xe: Clarify GT counting logic
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The total number of GTs supported by a platform should be one primary
GT, one media GT (if media version >= 13), and a number of remote tile
GTs dependent on the graphics IP present.  Express this more clearly in
the device setup.

Note that xe->info.tile_count is inaccurately named; the rest of the
driver treats this as the GT count, not just the tile count.  This
will need to be cleaned up at some point down the road.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 4338c66834a9..8845b48518cb 100644
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
 
@@ -418,7 +417,6 @@ static void xe_info_init(struct xe_device *xe,
 	xe->info.platform = desc->platform;
 	xe->info.dma_mask_size = desc->graphics->dma_mask_size;
 	xe->info.vram_flags = desc->graphics->vram_flags;
-	xe->info.tile_count = desc->graphics->max_tiles ?: 1;
 	xe->info.vm_max_level = desc->graphics->vm_max_level;
 	xe->info.supports_usm = desc->graphics->supports_usm;
 	xe->info.has_asid = desc->graphics->has_asid;
@@ -427,6 +425,19 @@ static void xe_info_init(struct xe_device *xe,
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
 	xe->info.subplatform = subplatform_desc ?
 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
 	xe->info.step = xe_step_get(xe);
-- 
2.39.2

