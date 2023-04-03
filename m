Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F55C761AF
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 20:17:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA1A10E589;
	Mon,  3 Apr 2023 20:17:14 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D894910E564
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 20:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680553032; x=1712089032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=25zHyZxVtx2sIZI1Y9pmN0/gKO0uaC0qOgfvBYqdtkE=;
 b=Z2nXpuPsQ3i4Ds0dVVdsS+Futh56pRGvCz3hrGBBrj6TyysMNeL9/yM8
 Ri5ED+ernWZhRHDSzK5umIbAQteYxvOFPFFb4JiNyUaPz8+n9Qd7+x3Jp
 6y2F7TeJp4VVCOF3K6znEB8seyloOuVM2v0ehL7+3S461nNuqPHKMVHgb
 UiIKj+aNdkFAqJEQaKL4mLUtNkpdCaKOspUvrhywOmzSpJzC3yRVB7VNa
 ikSUBxz2W9ss/eZ9ADBwjX0dxUry7PGjqMQqiYE2+JIhFHTjHIbojDixR
 xT5yKw2HEFjRqCgqW1pVRmRou//3h2fWC5qGlQN0/sci3p0549SX3wS+u w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="330580142"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="330580142"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 13:17:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="636236493"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="636236493"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 13:17:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  3 Apr 2023 13:16:59 -0700
Message-Id: <20230403201702.996400-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403201702.996400-1-matthew.d.roper@intel.com>
References: <20230403201702.996400-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/6] drm/xe: Move most platform traits to
 graphics IP
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

Most of the traits currently in the device descriptor structures are
either tied to the graphics IP or should be inferred from the graphics
IP.  This becomes important on MTL and beyond where IP versions are
supposed to be detected from the hardware's GMD_ID registers rather than
mapped from PCI devid.

Engine masks are left where they are for now; they'll be dealt with
separately in a future patch.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 110 ++++++++++++++++++------------------
 1 file changed, 56 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e9c92034765c..ba56f92c3c5f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -45,6 +45,17 @@ struct xe_gt_desc {
 struct xe_graphics_desc {
 	u8 ver;
 	u8 rel;
+
+	u8 dma_mask_size;	/* available DMA address bits */
+	u8 max_tiles;		/* defaults to 1 if unset */
+	u8 vm_max_level;
+	u8 vram_flags;
+
+	u8 has_asid:1;
+	u8 has_flat_ccs:1;
+	u8 has_link_copy_engine:1;
+	u8 has_range_tlb_invalidation:1;
+	u8 supports_usm:1;
 };
 
 struct xe_media_desc {
@@ -63,24 +74,18 @@ struct xe_device_desc {
 	const struct xe_subplatform_desc *subplatforms;
 	const struct xe_gt_desc *extra_gts;
 
-	u8 dma_mask_size; /* available DMA address bits */
-
 	u8 gt; /* GT number, 0 if undefined */
 
 #define DEFINE_FLAG(name) u8 name:1
 	DEV_INFO_FOR_EACH_FLAG(DEFINE_FLAG);
 #undef DEFINE_FLAG
 
-	u8 vram_flags;
-	u8 max_tiles;
-	u8 vm_max_level;
-
-	bool supports_usm;
-	bool has_flat_ccs;
+	/*
+	 * FIXME: Xe doesn't care about presence/lack of 4tile since we can
+	 * already determine that from the graphics IP version.  This flag
+	 * should eventually move entirely into the display code's own logic.
+	 */
 	bool has_4tile;
-	bool has_range_tlb_invalidation;
-	bool has_asid;
-	bool has_link_copy_engine;
 };
 
 __diag_push();
@@ -95,26 +100,57 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 static const struct xe_graphics_desc graphics_xelp = {
 	.ver = 12,
 	.rel = 0,
+
+	.dma_mask_size = 39,
+	.vm_max_level = 3,
 };
 
 static const struct xe_graphics_desc graphics_xelpp = {
 	.ver = 12,
 	.rel = 10,
+
+	.dma_mask_size = 39,
+	.vm_max_level = 3,
 };
 
+#define XE_HP_FEATURES \
+	.has_range_tlb_invalidation = true, \
+	.has_flat_ccs = true, \
+	.dma_mask_size = 46, \
+	.vm_max_level = 3
+
 static const struct xe_graphics_desc graphics_xehpg = {
 	.ver = 12,
 	.rel = 55,
+
+	XE_HP_FEATURES,
+	.vram_flags = XE_VRAM_FLAGS_NEED64K,
 };
 
 static const struct xe_graphics_desc graphics_xehpc = {
 	.ver = 12,
 	.rel = 60,
+
+	XE_HP_FEATURES,
+	.dma_mask_size = 52,
+	.max_tiles = 2,
+	.vm_max_level = 4,
+	.vram_flags = XE_VRAM_FLAGS_NEED64K,
+
+	.has_asid = 1,
+	.has_flat_ccs = 0,
+	.has_link_copy_engine = 1,
+	.supports_usm = 1,
 };
 
 static const struct xe_graphics_desc graphics_xelpg = {
 	.ver = 12,
 	.rel = 70,
+
+	XE_HP_FEATURES,
+	.max_tiles = 2,
+
+	.has_flat_ccs = 0,
 };
 
 static const struct xe_media_desc media_xelp = {
@@ -132,17 +168,9 @@ static const struct xe_media_desc media_xelpmp = {
 	.rel = 0,
 };
 
-/* Keep in gen based order, and chronological order within a gen */
-#define GEN12_FEATURES \
-	.dma_mask_size = 39, \
-	.max_tiles = 1, \
-	.vm_max_level = 3, \
-	.vram_flags = 0
-
 static const struct xe_device_desc tgl_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xelp,
-	GEN12_FEATURES,
 	PLATFORM(XE_TIGERLAKE),
 	.require_force_probe = true,
 	.platform_engine_mask =
@@ -154,7 +182,6 @@ static const struct xe_device_desc tgl_desc = {
 static const struct xe_device_desc adl_s_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xelp,
-	GEN12_FEATURES,
 	PLATFORM(XE_ALDERLAKE_S),
 	.require_force_probe = true,
 	.platform_engine_mask =
@@ -168,7 +195,6 @@ static const u16 adlp_rplu_ids[] = { XE_RPLU_IDS(NOP), 0 };
 static const struct xe_device_desc adl_p_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xelp,
-	GEN12_FEATURES,
 	PLATFORM(XE_ALDERLAKE_P),
 	.require_force_probe = true,
 	.platform_engine_mask =
@@ -187,7 +213,6 @@ static const struct xe_device_desc adl_p_desc = {
 static const struct xe_device_desc dg1_desc = {
 	.graphics = &graphics_xelpp,
 	.media = &media_xelp,
-	GEN12_FEATURES,
 	DGFX_FEATURES,
 	PLATFORM(XE_DG1),
 	.require_force_probe = true,
@@ -197,13 +222,6 @@ static const struct xe_device_desc dg1_desc = {
 		BIT(XE_HW_ENGINE_VCS2),
 };
 
-#define XE_HP_FEATURES \
-	.has_range_tlb_invalidation = true, \
-	.has_flat_ccs = true, \
-	.dma_mask_size = 46, \
-	.max_tiles = 1, \
-	.vm_max_level = 3
-
 static const u16 dg2_g10_ids[] = { XE_DG2_G10_IDS(NOP), XE_ATS_M150_IDS(NOP), 0 };
 static const u16 dg2_g11_ids[] = { XE_DG2_G11_IDS(NOP), XE_ATS_M75_IDS(NOP), 0 };
 static const u16 dg2_g12_ids[] = { XE_DG2_G12_IDS(NOP), 0 };
@@ -223,14 +241,12 @@ static const u16 dg2_g12_ids[] = { XE_DG2_G12_IDS(NOP), 0 };
 		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) | \
 		BIT(XE_HW_ENGINE_CCS0) | BIT(XE_HW_ENGINE_CCS1) | \
 		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3), \
-	.vram_flags = XE_VRAM_FLAGS_NEED64K, \
 	.has_4tile = 1
 
 static const struct xe_device_desc ats_m_desc = {
 	.graphics = &graphics_xehpg,
 	.media = &media_xehpm,
 	.require_force_probe = true,
-	XE_HP_FEATURES,
 
 	DG2_FEATURES,
 };
@@ -239,7 +255,6 @@ static const struct xe_device_desc dg2_desc = {
 	.graphics = &graphics_xehpg,
 	.media = &media_xehpm,
 	.require_force_probe = true,
-	XE_HP_FEATURES,
 
 	DG2_FEATURES,
 };
@@ -267,20 +282,11 @@ static const struct xe_gt_desc pvc_gts[] = {
 
 static const struct xe_device_desc pvc_desc = {
 	.graphics = &graphics_xehpc,
-	XE_HP_FEATURES,
 	DGFX_FEATURES,
 	PLATFORM(XE_PVC),
 	.require_force_probe = true,
 	.extra_gts = pvc_gts,
-	.has_flat_ccs = 0,
 	.platform_engine_mask = PVC_ENGINES,
-	.vram_flags = XE_VRAM_FLAGS_NEED64K,
-	.dma_mask_size = 52,
-	.max_tiles = 2,
-	.vm_max_level = 4,
-	.supports_usm = true,
-	.has_asid = true,
-	.has_link_copy_engine = true,
 };
 
 #define MTL_MEDIA_ENGINES \
@@ -309,10 +315,6 @@ static const struct xe_device_desc mtl_desc = {
 	.graphics = &graphics_xelpg,
 	.media = &media_xelpmp,
 	.require_force_probe = true,
-	.dma_mask_size = 46,
-	.max_tiles = 2,
-	.vm_max_level = 3,
-	.has_range_tlb_invalidation = true,
 	PLATFORM(XE_METEORLAKE),
 	.extra_gts = xelpmp_gts,
 	.platform_engine_mask = MTL_MAIN_ENGINES,
@@ -461,16 +463,16 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 					 desc->media->rel;
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.platform = desc->platform;
-	xe->info.dma_mask_size = desc->dma_mask_size;
-	xe->info.vram_flags = desc->vram_flags;
-	xe->info.tile_count = desc->max_tiles;
-	xe->info.vm_max_level = desc->vm_max_level;
-	xe->info.supports_usm = desc->supports_usm;
-	xe->info.has_asid = desc->has_asid;
-	xe->info.has_flat_ccs = desc->has_flat_ccs;
+	xe->info.dma_mask_size = desc->graphics->dma_mask_size;
+	xe->info.vram_flags = desc->graphics->vram_flags;
+	xe->info.tile_count = desc->graphics->max_tiles ?: 1;
+	xe->info.vm_max_level = desc->graphics->vm_max_level;
+	xe->info.supports_usm = desc->graphics->supports_usm;
+	xe->info.has_asid = desc->graphics->has_asid;
+	xe->info.has_flat_ccs = desc->graphics->has_flat_ccs;
 	xe->info.has_4tile = desc->has_4tile;
-	xe->info.has_range_tlb_invalidation = desc->has_range_tlb_invalidation;
-	xe->info.has_link_copy_engine = desc->has_link_copy_engine;
+	xe->info.has_range_tlb_invalidation = desc->graphics->has_range_tlb_invalidation;
+	xe->info.has_link_copy_engine = desc->graphics->has_link_copy_engine;
 
 	spd = subplatform_get(xe, desc);
 	xe->info.subplatform = spd ? spd->subplatform : XE_SUBPLATFORM_NONE;
-- 
2.39.2

