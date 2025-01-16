Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F28C02180
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 13:06:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF56110E95A;
	Thu, 16 Jan 2025 13:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vd0EW6TH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5B410E954
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 13:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737032808; x=1768568808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9o8w7W1e3xrKCaVpxJ/qfojRMsmpZve3XP6P9s/6IFE=;
 b=Vd0EW6THHduW/Rg+bmMsrbXYouc9KU5g9TUXb9CR9hr9Nj0ZfPDOEgJo
 ty9Qzf9zLofpsGOkwcWFs4ZMT1pFcEoE8sH6I+2yvKUoh3pWgkCCjj1lB
 WR/+o8CFjhfrfgbvuLxkRYXzY641KJgyCzLe3PKVgcV4LH8ISqZ+rqpbT
 8/LwUvL/A6eaO8TEqulpyNIDPBN1CH5s+zPQ1NxE8xs1DqVAftaqM60VK
 DJ8TQlze3ytawsWFizIOn24FCBcNd7oTliuWJY8BFehcENmXQX86eagNL
 qVp8JcRIzH8HtqhTBj8+hFyRokZYMHVuXkSbZ3PWwukkSU/2eYRZ7Y3I8 A==;
X-CSE-ConnectionGUID: b2jsPrRoSjyWHt1XEzWEkQ==
X-CSE-MsgGUID: /01JkRNVQxGjq57uuZPAlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="41095112"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="41095112"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 05:06:47 -0800
X-CSE-ConnectionGUID: lsNA7axQTS+PXdciammT7w==
X-CSE-MsgGUID: KmXUV5ozQhOAxB7x2WKLOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="106076724"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 05:06:45 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH 1/2] drm/xe: Refactor dma_mask_size
Date: Thu, 16 Jan 2025 18:24:46 +0530
Message-Id: <20250116125447.4025927-2-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250116125447.4025927-1-sai.teja.pottumuttu@intel.com>
References: <20250116125447.4025927-1-sai.teja.pottumuttu@intel.com>
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

Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c       | 22 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_pci_types.h |  1 -
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 48d1c81d441e..f59c1acae23f 100644
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
 	.require_force_probe = true,
@@ -253,6 +253,7 @@ static const struct xe_device_desc adl_p_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(ALDERLAKE_P),
+	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
@@ -266,6 +267,7 @@ static const struct xe_device_desc adl_n_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(ALDERLAKE_N),
+	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
@@ -279,6 +281,7 @@ static const struct xe_device_desc dg1_desc = {
 	.media = &media_xem,
 	DGFX_FEATURES,
 	PLATFORM(DG1),
+	.dma_mask_size = 39,
 	.has_display = true,
 	.has_heci_gscfi = 1,
 	.require_force_probe = true,
@@ -302,6 +305,7 @@ static const u16 dg2_g12_ids[] = { INTEL_DG2_G12_IDS(NOP), 0 };
 static const struct xe_device_desc ats_m_desc = {
 	.graphics = &graphics_xehpg,
 	.media = &media_xehpm,
+	.dma_mask_size = 46,
 	.require_force_probe = true,
 
 	DG2_FEATURES,
@@ -311,6 +315,7 @@ static const struct xe_device_desc ats_m_desc = {
 static const struct xe_device_desc dg2_desc = {
 	.graphics = &graphics_xehpg,
 	.media = &media_xehpm,
+	.dma_mask_size = 46,
 	.require_force_probe = true,
 
 	DG2_FEATURES,
@@ -321,6 +326,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	.graphics = &graphics_xehpc,
 	DGFX_FEATURES,
 	PLATFORM(PVC),
+	.dma_mask_size = 52,
 	.has_display = false,
 	.has_heci_gscfi = 1,
 	.require_force_probe = true,
@@ -330,23 +336,27 @@ static const struct xe_device_desc mtl_desc = {
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
@@ -612,6 +622,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.subplatform = subplatform_desc ?
 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
 
+	xe->info.dma_mask_size = desc->dma_mask_size;
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
@@ -676,7 +687,6 @@ static int xe_info_init(struct xe_device *xe,
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

