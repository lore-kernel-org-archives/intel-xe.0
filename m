Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC14C02187
	for <intel-xe@archiver.kernel.org>; Sun, 19 Jan 2025 12:48:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4EF10E0DD;
	Sun, 19 Jan 2025 12:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kf3wup8q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0556610E0DD
 for <intel-xe@lists.freedesktop.org>; Sun, 19 Jan 2025 12:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737290929; x=1768826929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S4T8vBxMJ0ry9fvMwDKDOJOiI3pWFPzK8ZX8B0hbVpc=;
 b=kf3wup8qWY9pLBnY1jubWqBbckMFcY8LiYlwRspU2WXHFrdNbz+w4qG6
 7TkJNEYj4LOEuJXg1z3jMX0McNNix3P0h/N3rwrQ8JEEog4m3wHQPWZC9
 gLo0+KFusftYzEG2XLMdbi0njKERqRfoHZx5YFdzIYadkHh5lVYCJjFNS
 SI2hAWWh2pxQl/ettbH0olDW2e3XB0hVbrwJVfgYoB4VRXGPP6CaGQFLZ
 bCrbWi+3Av+K0JTHM8r3ytjrnEnwoQ/hAZoBVR3Thizq6+zNmqcDBfveK
 L6nwZWrY51ixLIdMr+h8DQfKX9omvH0SCrXvH5T3V/6htDUL6395TaxBH Q==;
X-CSE-ConnectionGUID: P/hSrgCTT6SAqv6jMbouTA==
X-CSE-MsgGUID: ZyE3Z1G/T9O1wji5jQeujw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="40473029"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; d="scan'208";a="40473029"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 04:48:49 -0800
X-CSE-ConnectionGUID: S4CE7oPVSNO3RJcqP0hTog==
X-CSE-MsgGUID: GQzOVXZ9QpCOEVQeTAkVdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; d="scan'208";a="106077913"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 04:48:46 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH v2 1/2] drm/xe: Refactor dma_mask_size
Date: Sun, 19 Jan 2025 18:06:43 +0530
Message-Id: <20250119123644.2881474-2-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250119123644.2881474-1-sai.teja.pottumuttu@intel.com>
References: <20250119123644.2881474-1-sai.teja.pottumuttu@intel.com>
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

dma_mask_size is more related to the platform than the GT IP. Thus
move it to platform descriptors.

v2:
 - Rebase

Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c       | 22 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_pci_types.h |  1 -
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e6ad189294c1..a6395050a19f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -54,6 +54,8 @@ struct xe_device_desc {
 
 	enum xe_platform platform;
 
+	u8 dma_mask_size;
+
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
 
@@ -83,7 +85,6 @@ static const struct xe_graphics_desc graphics_xelp = {
 
 	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
 
-	.dma_mask_size = 39,
 	.va_bits = 48,
 	.vm_max_level = 3,
 };
@@ -95,14 +96,12 @@ static const struct xe_graphics_desc graphics_xelpp = {
 
 	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
 
-	.dma_mask_size = 39,
 	.va_bits = 48,
 	.vm_max_level = 3,
 };
 
 #define XE_HP_FEATURES \
 	.has_range_tlb_invalidation = true, \
-	.dma_mask_size = 46, \
 	.va_bits = 48, \
 	.vm_max_level = 3
 
@@ -137,7 +136,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
 		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
 
 	XE_HP_FEATURES,
-	.dma_mask_size = 52,
 	.max_remote_tiles = 1,
 	.va_bits = 57,
 	.vm_max_level = 4,
@@ -158,7 +156,6 @@ static const struct xe_graphics_desc graphics_xelpg = {
 };
 
 #define XE2_GFX_FEATURES \
-	.dma_mask_size = 46, \
 	.has_asid = 1, \
 	.has_atomic_enable_pte_bit = 1, \
 	.has_flat_ccs = 1, \
@@ -218,6 +215,7 @@ static const struct xe_device_desc tgl_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(TIGERLAKE),
+	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
@@ -227,6 +225,7 @@ static const struct xe_device_desc rkl_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(ROCKETLAKE),
+	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
@@ -238,6 +237,7 @@ static const struct xe_device_desc adl_s_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(ALDERLAKE_S),
+	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
 	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
@@ -254,6 +254,7 @@ static const struct xe_device_desc adl_p_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(ALDERLAKE_P),
+	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
 	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
@@ -268,6 +269,7 @@ static const struct xe_device_desc adl_n_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(ALDERLAKE_N),
+	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
 	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
@@ -282,6 +284,7 @@ static const struct xe_device_desc dg1_desc = {
 	.media = &media_xem,
 	DGFX_FEATURES,
 	PLATFORM(DG1),
+	.dma_mask_size = 39,
 	.has_display = true,
 	.has_heci_gscfi = 1,
 	.require_force_probe = true,
@@ -305,6 +308,7 @@ static const u16 dg2_g12_ids[] = { INTEL_DG2_G12_IDS(NOP), 0 };
 static const struct xe_device_desc ats_m_desc = {
 	.graphics = &graphics_xehpg,
 	.media = &media_xehpm,
+	.dma_mask_size = 46,
 	.require_force_probe = true,
 
 	DG2_FEATURES,
@@ -315,6 +319,7 @@ static const struct xe_device_desc ats_m_desc = {
 static const struct xe_device_desc dg2_desc = {
 	.graphics = &graphics_xehpg,
 	.media = &media_xehpm,
+	.dma_mask_size = 46,
 	.require_force_probe = true,
 
 	DG2_FEATURES,
@@ -325,6 +330,7 @@ static const struct xe_device_desc pvc_desc = {
 	.graphics = &graphics_xehpc,
 	DGFX_FEATURES,
 	PLATFORM(PVC),
+	.dma_mask_size = 52,
 	.has_display = false,
 	.has_heci_gscfi = 1,
 	.require_force_probe = true,
@@ -334,23 +340,27 @@ static const struct xe_device_desc mtl_desc = {
 	/* .graphics and .media determined via GMD_ID */
 	.require_force_probe = true,
 	PLATFORM(METEORLAKE),
+	.dma_mask_size = 46,
 	.has_display = true,
 };
 
 static const struct xe_device_desc lnl_desc = {
 	PLATFORM(LUNARLAKE),
+	.dma_mask_size = 46,
 	.has_display = true,
 };
 
 static const struct xe_device_desc bmg_desc = {
 	DGFX_FEATURES,
 	PLATFORM(BATTLEMAGE),
+	.dma_mask_size = 46,
 	.has_display = true,
 	.has_heci_cscfi = 1,
 };
 
 static const struct xe_device_desc ptl_desc = {
 	PLATFORM(PANTHERLAKE),
+	.dma_mask_size = 46,
 	.has_display = true,
 	.require_force_probe = true,
 };
@@ -618,6 +628,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.subplatform = subplatform_desc ?
 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
 
+	xe->info.dma_mask_size = desc->dma_mask_size;
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
@@ -682,7 +693,6 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.graphics_name = graphics_desc->name;
 	xe->info.media_name = media_desc ? media_desc->name : "none";
 
-	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
 	xe->info.vram_flags = graphics_desc->vram_flags;
 	xe->info.va_bits = graphics_desc->va_bits;
 	xe->info.vm_max_level = graphics_desc->vm_max_level;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 873efec5cdee..7437415a54d5 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -13,7 +13,6 @@ struct xe_graphics_desc {
 	u8 ver;
 	u8 rel;
 
-	u8 dma_mask_size;	/* available DMA address bits */
 	u8 va_bits;
 	u8 vm_max_level;
 	u8 vram_flags;
-- 
2.34.1

