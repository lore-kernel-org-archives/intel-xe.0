Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F6FC76188
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 20:17:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6089210E564;
	Mon,  3 Apr 2023 20:17:14 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B8B10E564
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 20:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680553032; x=1712089032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tx4424gop8n/oB2E0mX1vLRkWbod3MBQbDKbfR0mFrU=;
 b=iugAwsEGqfF7yyrHhXRWWl7w0cKwbM+TMBZbMVJV9XVVGDGUwyweoNSE
 NQ/gHCZ0/KrGUgxg46GcP/AsURAC/Qx9paf93hjLuoKnEmu7hG01QblCK
 myrE8mc8gfFS3cZVYiRwZ2BgLIemqW6tx9G3ibiCuKZ2jh8KCWSImnDTy
 mS+jge+fQsCXS62GfbkuK1igKk3rC91a0JQrQxhTq3TBVB3Hfg66NQAbz
 L6h2V2SGBH7NL2yhTgb1QVuAo/r4CpKauFdzqPYw74Kgl+ERrmJX6X7vw
 4Fm75GcHKrW0Jo/ykLUt5lHdcCSVOynKsOQ4NPOOVAWueuGS8HOitbjBI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="330580140"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="330580140"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 13:17:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="636236485"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="636236485"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 13:17:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  3 Apr 2023 13:16:57 -0700
Message-Id: <20230403201702.996400-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403201702.996400-1-matthew.d.roper@intel.com>
References: <20230403201702.996400-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/6] drm/xe: Start splitting xe_device_desc into
 graphics/media structures
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

Rather than storing all characteristics for an entire platform in the
xe_device_desc structure, create secondary graphics and media structures
to hold traits and feature flags specific to those IPs.  This will
eventually allow us to assign the graphics and media characteristics at
runtime based on the contents of the relevant GMD_ID registers.

For now, just move the IP versions into the new structures to keep
things simple.  Other IP-specific fields will migrate to these
structures in future patches.

Note that there's one functional change introduced by this:  previously
PVC was recognized as media version 12.60.  That's technically true, but
in practice the media engines are fused off on all production hardware.
By simply not assigning a media IP structure to PVC it will effectively
be treated as IP version 0.0 now (which the rest of the driver should
treat as non-existent media).

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 103 ++++++++++++++++++++++++++----------
 1 file changed, 74 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 91fed9d3105e..bfc2c61fdb99 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -42,11 +42,19 @@ struct xe_gt_desc {
 	u32 mmio_adj_offset;
 };
 
+struct xe_graphics_desc {
+	u8 ver;
+	u8 rel;
+};
+
+struct xe_media_desc {
+	u8 ver;
+	u8 rel;
+};
+
 struct xe_device_desc {
-	u8 graphics_ver;
-	u8 graphics_rel;
-	u8 media_ver;
-	u8 media_rel;
+	const struct xe_graphics_desc *graphics;
+	const struct xe_media_desc *media;
 
 	u64 platform_engine_mask; /* Engines supported by the HW */
 
@@ -84,17 +92,57 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 
 #define NOP(x)	x
 
+static const struct xe_graphics_desc graphics_xelp = {
+	.ver = 12,
+	.rel = 0,
+};
+
+static const struct xe_graphics_desc graphics_xelpp = {
+	.ver = 12,
+	.rel = 10,
+};
+
+static const struct xe_graphics_desc graphics_xehpg = {
+	.ver = 12,
+	.rel = 55,
+};
+
+static const struct xe_graphics_desc graphics_xehpc = {
+	.ver = 12,
+	.rel = 60,
+};
+
+static const struct xe_graphics_desc graphics_xelpg = {
+	.ver = 12,
+	.rel = 70,
+};
+
+static const struct xe_media_desc media_xelp = {
+	.ver = 12,
+	.rel = 0,
+};
+
+static const struct xe_media_desc media_xehpm = {
+	.ver = 12,
+	.rel = 55,
+};
+
+static const struct xe_media_desc media_xelpmp = {
+	.ver = 13,
+	.rel = 0,
+};
+
 /* Keep in gen based order, and chronological order within a gen */
 #define GEN12_FEATURES \
 	.require_force_probe = true, \
-	.graphics_ver = 12, \
-	.media_ver = 12, \
 	.dma_mask_size = 39, \
 	.max_tiles = 1, \
 	.vm_max_level = 3, \
 	.vram_flags = 0
 
 static const struct xe_device_desc tgl_desc = {
+	.graphics = &graphics_xelp,
+	.media = &media_xelp,
 	GEN12_FEATURES,
 	PLATFORM(XE_TIGERLAKE),
 	.platform_engine_mask =
@@ -104,6 +152,8 @@ static const struct xe_device_desc tgl_desc = {
 };
 
 static const struct xe_device_desc adl_s_desc = {
+	.graphics = &graphics_xelp,
+	.media = &media_xelp,
 	GEN12_FEATURES,
 	PLATFORM(XE_ALDERLAKE_S),
 	.platform_engine_mask =
@@ -115,6 +165,8 @@ static const struct xe_device_desc adl_s_desc = {
 static const u16 adlp_rplu_ids[] = { XE_RPLU_IDS(NOP), 0 };
 
 static const struct xe_device_desc adl_p_desc = {
+	.graphics = &graphics_xelp,
+	.media = &media_xelp,
 	GEN12_FEATURES,
 	PLATFORM(XE_ALDERLAKE_P),
 	.platform_engine_mask =
@@ -131,9 +183,10 @@ static const struct xe_device_desc adl_p_desc = {
 	.is_dgfx = 1
 
 static const struct xe_device_desc dg1_desc = {
+	.graphics = &graphics_xelpp,
+	.media = &media_xelp,
 	GEN12_FEATURES,
 	DGFX_FEATURES,
-	.graphics_rel = 10,
 	PLATFORM(XE_DG1),
 	.platform_engine_mask =
 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
@@ -143,26 +196,18 @@ static const struct xe_device_desc dg1_desc = {
 
 #define XE_HP_FEATURES \
 	.require_force_probe = true, \
-	.graphics_ver = 12, \
-	.graphics_rel = 50, \
 	.has_range_tlb_invalidation = true, \
 	.has_flat_ccs = true, \
 	.dma_mask_size = 46, \
 	.max_tiles = 1, \
 	.vm_max_level = 3
 
-#define XE_HPM_FEATURES \
-	.media_ver = 12, \
-	.media_rel = 50
-
 static const u16 dg2_g10_ids[] = { XE_DG2_G10_IDS(NOP), XE_ATS_M150_IDS(NOP), 0 };
 static const u16 dg2_g11_ids[] = { XE_DG2_G11_IDS(NOP), XE_ATS_M75_IDS(NOP), 0 };
 static const u16 dg2_g12_ids[] = { XE_DG2_G12_IDS(NOP), 0 };
 
 #define DG2_FEATURES \
 	DGFX_FEATURES, \
-	.graphics_rel = 55, \
-	.media_rel = 55, \
 	PLATFORM(XE_DG2), \
 	.subplatforms = (const struct xe_subplatform_desc[]) { \
 		{ XE_SUBPLATFORM_DG2_G10, "G10", dg2_g10_ids }, \
@@ -181,15 +226,17 @@ static const u16 dg2_g12_ids[] = { XE_DG2_G12_IDS(NOP), 0 };
 	.has_4tile = 1
 
 static const struct xe_device_desc ats_m_desc = {
+	.graphics = &graphics_xehpg,
+	.media = &media_xehpm,
 	XE_HP_FEATURES,
-	XE_HPM_FEATURES,
 
 	DG2_FEATURES,
 };
 
 static const struct xe_device_desc dg2_desc = {
+	.graphics = &graphics_xehpg,
+	.media = &media_xehpm,
 	XE_HP_FEATURES,
-	XE_HPM_FEATURES,
 
 	DG2_FEATURES,
 };
@@ -216,14 +263,12 @@ static const struct xe_gt_desc pvc_gts[] = {
 };
 
 static const struct xe_device_desc pvc_desc = {
+	.graphics = &graphics_xehpc,
 	XE_HP_FEATURES,
-	XE_HPM_FEATURES,
 	DGFX_FEATURES,
 	PLATFORM(XE_PVC),
 	.extra_gts = pvc_gts,
-	.graphics_rel = 60,
 	.has_flat_ccs = 0,
-	.media_rel = 60,
 	.platform_engine_mask = PVC_ENGINES,
 	.vram_flags = XE_VRAM_FLAGS_NEED64K,
 	.dma_mask_size = 52,
@@ -254,16 +299,15 @@ static const struct xe_gt_desc xelpmp_gts[] = {
 
 static const struct xe_device_desc mtl_desc = {
 	/*
-	 * Real graphics IP version will be obtained from hardware GMD_ID
-	 * register.  Value provided here is just for sanity checking.
+	 * FIXME:  Real graphics/media IP will be mapped from hardware
+	 * GMD_ID register.  Hardcoded assignments here will go away soon.
 	 */
+	.graphics = &graphics_xelpg,
+	.media = &media_xelpmp,
 	.require_force_probe = true,
-	.graphics_ver = 12,
-	.graphics_rel = 70,
 	.dma_mask_size = 46,
 	.max_tiles = 2,
 	.vm_max_level = 3,
-	.media_ver = 13,
 	.has_range_tlb_invalidation = true,
 	PLATFORM(XE_METEORLAKE),
 	.extra_gts = xelpmp_gts,
@@ -406,10 +450,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (IS_ERR(xe))
 		return PTR_ERR(xe);
 
-	xe->info.graphics_verx100 = desc->graphics_ver * 100 +
-				    desc->graphics_rel;
-	xe->info.media_verx100 = desc->media_ver * 100 +
-				 desc->media_rel;
+	xe->info.graphics_verx100 = desc->graphics->ver * 100 +
+				    desc->graphics->rel;
+	if (desc->media)
+		xe->info.media_verx100 = desc->media->ver * 100 +
+					 desc->media->rel;
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.platform = desc->platform;
 	xe->info.dma_mask_size = desc->dma_mask_size;
-- 
2.39.2

