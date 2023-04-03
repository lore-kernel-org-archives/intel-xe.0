Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2B4C77B62
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 20:17:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957E310E58A;
	Mon,  3 Apr 2023 20:17:15 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111B410E57E
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 20:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680553033; x=1712089033;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cg8wgCBXqEMlJFesnO/qiMwMw25VdaNPYdO2czsvtRI=;
 b=kaf2/nVHA/oV2d3z/L1wpj12wi9WpS1wp72IQAwF3uhDVydMTAbtF9YG
 s76N8wj2C+Pr1z6hFzPquMHi++iBgDPIcSAxbv7HOjC+azCMSMxzDLsi5
 MP26n01KwlFV6sSd0w5O5/1ZRQmGAL80RS5U0dO1YmHGEDVDhJy7Rv1gT
 Br9FEvzxO+Pppc24flqkg+EkPQmVVJqULUJky1DcOydM49OuuF1zCvnjr
 36YFS90TOQoDwY39hndaXuvI5MXbJ5CokD4wdAS9kPypXzifP9H8ikqjm
 qc+ONmwgD2/tUS8dfcWfDm+XgdXgerlrFwo4NiqPJYqOVoWzULyGZLx9b w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="330580143"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="330580143"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 13:17:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="636236496"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="636236496"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 13:17:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  3 Apr 2023 13:17:00 -0700
Message-Id: <20230403201702.996400-5-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403201702.996400-1-matthew.d.roper@intel.com>
References: <20230403201702.996400-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/6] drm/xe: Move engine masks into IP descriptor
 structures
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

Break the top-level platform_engine_mask field into separate
hw_engine_mask fields in the graphics and media structures.  Since
hardware has more flexibility to mix-and-match IP versions going
forward, this allows each IP to list exactly which engines it provides;
the final per-GT engine list can then be constructured from those:

 * On platforms without a standalone media GT (i.e., media IP versions
   prior to 13), the primary GT's engine list is the union of the
   graphics IP's engine list and the media IP's engine list.
 * Otherwise, GT0's engine list is the graphics IP's engine list.
 * For GT1 and beyond, the type of GT determines which IP's engine list
   is used.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 97 ++++++++++++++++++-------------------
 1 file changed, 46 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ba56f92c3c5f..3e7e57254a6d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -37,7 +37,6 @@ struct xe_subplatform_desc {
 struct xe_gt_desc {
 	enum xe_gt_type type;
 	u8 vram_id;
-	u64 engine_mask;
 	u32 mmio_adj_limit;
 	u32 mmio_adj_offset;
 };
@@ -51,6 +50,8 @@ struct xe_graphics_desc {
 	u8 vm_max_level;
 	u8 vram_flags;
 
+	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
+
 	u8 has_asid:1;
 	u8 has_flat_ccs:1;
 	u8 has_link_copy_engine:1;
@@ -61,14 +62,14 @@ struct xe_graphics_desc {
 struct xe_media_desc {
 	u8 ver;
 	u8 rel;
+
+	u64 hw_engine_mask;	/* hardware engines provided by media IP */
 };
 
 struct xe_device_desc {
 	const struct xe_graphics_desc *graphics;
 	const struct xe_media_desc *media;
 
-	u64 platform_engine_mask; /* Engines supported by the HW */
-
 	enum xe_platform platform;
 	const char *platform_name;
 	const struct xe_subplatform_desc *subplatforms;
@@ -101,6 +102,8 @@ static const struct xe_graphics_desc graphics_xelp = {
 	.ver = 12,
 	.rel = 0,
 
+	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
+
 	.dma_mask_size = 39,
 	.vm_max_level = 3,
 };
@@ -109,6 +112,8 @@ static const struct xe_graphics_desc graphics_xelpp = {
 	.ver = 12,
 	.rel = 10,
 
+	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
+
 	.dma_mask_size = 39,
 	.vm_max_level = 3,
 };
@@ -123,6 +128,11 @@ static const struct xe_graphics_desc graphics_xehpg = {
 	.ver = 12,
 	.rel = 55,
 
+	.hw_engine_mask =
+		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
+		BIT(XE_HW_ENGINE_CCS0) | BIT(XE_HW_ENGINE_CCS1) |
+		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
+
 	XE_HP_FEATURES,
 	.vram_flags = XE_VRAM_FLAGS_NEED64K,
 };
@@ -131,6 +141,15 @@ static const struct xe_graphics_desc graphics_xehpc = {
 	.ver = 12,
 	.rel = 60,
 
+	.hw_engine_mask =
+		BIT(XE_HW_ENGINE_BCS0) | BIT(XE_HW_ENGINE_BCS1) |
+		BIT(XE_HW_ENGINE_BCS2) | BIT(XE_HW_ENGINE_BCS3) |
+		BIT(XE_HW_ENGINE_BCS4) | BIT(XE_HW_ENGINE_BCS5) |
+		BIT(XE_HW_ENGINE_BCS6) | BIT(XE_HW_ENGINE_BCS7) |
+		BIT(XE_HW_ENGINE_BCS8) |
+		BIT(XE_HW_ENGINE_CCS0) | BIT(XE_HW_ENGINE_CCS1) |
+		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
+
 	XE_HP_FEATURES,
 	.dma_mask_size = 52,
 	.max_tiles = 2,
@@ -147,6 +166,10 @@ static const struct xe_graphics_desc graphics_xelpg = {
 	.ver = 12,
 	.rel = 70,
 
+	.hw_engine_mask =
+		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
+		BIT(XE_HW_ENGINE_CCS0),
+
 	XE_HP_FEATURES,
 	.max_tiles = 2,
 
@@ -156,16 +179,28 @@ static const struct xe_graphics_desc graphics_xelpg = {
 static const struct xe_media_desc media_xelp = {
 	.ver = 12,
 	.rel = 0,
+
+	.hw_engine_mask =
+		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
+		BIT(XE_HW_ENGINE_VECS0),
 };
 
 static const struct xe_media_desc media_xehpm = {
 	.ver = 12,
 	.rel = 55,
+
+	.hw_engine_mask =
+		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
+		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VECS1),
 };
 
 static const struct xe_media_desc media_xelpmp = {
 	.ver = 13,
 	.rel = 0,
+
+	.hw_engine_mask =
+		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
+		BIT(XE_HW_ENGINE_VECS0),	/* TODO: add GSC0 */
 };
 
 static const struct xe_device_desc tgl_desc = {
@@ -173,10 +208,6 @@ static const struct xe_device_desc tgl_desc = {
 	.media = &media_xelp,
 	PLATFORM(XE_TIGERLAKE),
 	.require_force_probe = true,
-	.platform_engine_mask =
-		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
-		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0) |
-		BIT(XE_HW_ENGINE_VCS2),
 };
 
 static const struct xe_device_desc adl_s_desc = {
@@ -184,10 +215,6 @@ static const struct xe_device_desc adl_s_desc = {
 	.media = &media_xelp,
 	PLATFORM(XE_ALDERLAKE_S),
 	.require_force_probe = true,
-	.platform_engine_mask =
-		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
-		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0) |
-		BIT(XE_HW_ENGINE_VCS2),
 };
 
 static const u16 adlp_rplu_ids[] = { XE_RPLU_IDS(NOP), 0 };
@@ -197,10 +224,6 @@ static const struct xe_device_desc adl_p_desc = {
 	.media = &media_xelp,
 	PLATFORM(XE_ALDERLAKE_P),
 	.require_force_probe = true,
-	.platform_engine_mask =
-		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
-		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0) |
-		BIT(XE_HW_ENGINE_VCS2),
 	.subplatforms = (const struct xe_subplatform_desc[]) {
 		{ XE_SUBPLATFORM_ADLP_RPLU, "RPLU", adlp_rplu_ids },
 		{},
@@ -216,10 +239,6 @@ static const struct xe_device_desc dg1_desc = {
 	DGFX_FEATURES,
 	PLATFORM(XE_DG1),
 	.require_force_probe = true,
-	.platform_engine_mask =
-		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
-		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VCS0) |
-		BIT(XE_HW_ENGINE_VCS2),
 };
 
 static const u16 dg2_g10_ids[] = { XE_DG2_G10_IDS(NOP), XE_ATS_M150_IDS(NOP), 0 };
@@ -235,12 +254,6 @@ static const u16 dg2_g12_ids[] = { XE_DG2_G12_IDS(NOP), 0 };
 		{ XE_SUBPLATFORM_DG2_G12, "G12", dg2_g12_ids }, \
 		{ } \
 	}, \
-	.platform_engine_mask = \
-		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) | \
-		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VECS1) | \
-		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) | \
-		BIT(XE_HW_ENGINE_CCS0) | BIT(XE_HW_ENGINE_CCS1) | \
-		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3), \
 	.has_4tile = 1
 
 static const struct xe_device_desc ats_m_desc = {
@@ -259,22 +272,10 @@ static const struct xe_device_desc dg2_desc = {
 	DG2_FEATURES,
 };
 
-#define PVC_ENGINES \
-	BIT(XE_HW_ENGINE_BCS0) | BIT(XE_HW_ENGINE_BCS1) | \
-	BIT(XE_HW_ENGINE_BCS2) | BIT(XE_HW_ENGINE_BCS3) | \
-	BIT(XE_HW_ENGINE_BCS4) | BIT(XE_HW_ENGINE_BCS5) | \
-	BIT(XE_HW_ENGINE_BCS6) | BIT(XE_HW_ENGINE_BCS7) | \
-	BIT(XE_HW_ENGINE_BCS8) | \
-	BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS1) | \
-	BIT(XE_HW_ENGINE_VCS2) | \
-	BIT(XE_HW_ENGINE_CCS0) | BIT(XE_HW_ENGINE_CCS1) | \
-	BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3)
-
 static const struct xe_gt_desc pvc_gts[] = {
 	{
 		.type = XE_GT_TYPE_REMOTE,
 		.vram_id = 1,
-		.engine_mask = PVC_ENGINES,
 		.mmio_adj_limit = 0,
 		.mmio_adj_offset = 0,
 	},
@@ -286,27 +287,17 @@ static const struct xe_device_desc pvc_desc = {
 	PLATFORM(XE_PVC),
 	.require_force_probe = true,
 	.extra_gts = pvc_gts,
-	.platform_engine_mask = PVC_ENGINES,
 };
 
-#define MTL_MEDIA_ENGINES \
-	BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) | \
-	BIT(XE_HW_ENGINE_VECS0)	/* TODO: GSC0 */
-
 static const struct xe_gt_desc xelpmp_gts[] = {
 	{
 		.type = XE_GT_TYPE_MEDIA,
 		.vram_id = 0,
-		.engine_mask = MTL_MEDIA_ENGINES,
 		.mmio_adj_limit = 0x40000,
 		.mmio_adj_offset = 0x380000,
 	},
 };
 
-#define MTL_MAIN_ENGINES \
-	BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) | \
-	BIT(XE_HW_ENGINE_CCS0)
-
 static const struct xe_device_desc mtl_desc = {
 	/*
 	 * FIXME:  Real graphics/media IP will be mapped from hardware
@@ -317,7 +308,6 @@ static const struct xe_device_desc mtl_desc = {
 	.require_force_probe = true,
 	PLATFORM(XE_METEORLAKE),
 	.extra_gts = xelpmp_gts,
-	.platform_engine_mask = MTL_MAIN_ENGINES,
 };
 
 #undef PLATFORM
@@ -486,14 +476,19 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		if (id == 0) {
 			gt->info.type = XE_GT_TYPE_MAIN;
 			gt->info.vram_id = id;
-			gt->info.__engine_mask = desc->platform_engine_mask;
+
+			gt->info.__engine_mask = desc->graphics->hw_engine_mask;
+			if (MEDIA_VER(xe) < 13 && desc->media)
+				gt->info.__engine_mask |= desc->media->hw_engine_mask;
+
 			gt->mmio.adj_limit = 0;
 			gt->mmio.adj_offset = 0;
 		} else {
 			gt->info.type = desc->extra_gts[id - 1].type;
 			gt->info.vram_id = desc->extra_gts[id - 1].vram_id;
-			gt->info.__engine_mask =
-				desc->extra_gts[id - 1].engine_mask;
+			gt->info.__engine_mask = (gt->info.type == XE_GT_TYPE_MEDIA) ?
+				desc->media->hw_engine_mask :
+				desc->graphics->hw_engine_mask;
 			gt->mmio.adj_limit =
 				desc->extra_gts[id - 1].mmio_adj_limit;
 			gt->mmio.adj_offset =
-- 
2.39.2

