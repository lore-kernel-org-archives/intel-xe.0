Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF68C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 08:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2221B10E2D2;
	Thu, 30 Jan 2025 08:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jKIY+HEz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5D110E2F1
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 08:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738227553; x=1769763553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=azEHp3QKmuzPWIM5G5t1NyxiPFbx1t7wzHMIlNSy7uQ=;
 b=jKIY+HEzm03tmkjWnJlkP4oaBSbkzmlWFuh/xgB8JGhP/95NhS+LIlhN
 f2bl9JADrcPUXXCHIkq6EjBpl2tdJR9/NnhJ0uWaZm/on2vyweZDnBg+E
 3t8zUDMwchY2zNhJQtjm7m8y9fg9qrQcRj/DSXGB7lZjaTkad0s0k+6qF
 KE26TvHd2IuYcsQP6JWnbYck6NWgyLb99/+a1khdl6nOlWDmZ9EFRn4S7
 GcfFU7ki7dEqqDtqm96nA9Ukj7aJZ2Xcfar2YSnXacETFTNnQHrW2wEf7
 NEw21f1+Ol3H4/MaWn7OtKK88uN+QF2KvwqHrG6NT8JyTgBwepW4AiCmT Q==;
X-CSE-ConnectionGUID: YITYr3ojScumLCX1wcNLYg==
X-CSE-MsgGUID: Xc6BYoGMTIuRLHtx958tag==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="39030195"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="39030195"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 00:59:13 -0800
X-CSE-ConnectionGUID: wzmtfZIgTJSjkHO+v7yU3Q==
X-CSE-MsgGUID: W2CFTqmJQrGBF32jsnnFnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="109177709"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 00:59:11 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH v3 1/2] drm/xe: Refactor dma_mask_size
Date: Thu, 30 Jan 2025 14:28:03 +0530
Message-Id: <20250130085804.4136497-2-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130085804.4136497-1-sai.teja.pottumuttu@intel.com>
References: <20250130085804.4136497-1-sai.teja.pottumuttu@intel.com>
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
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c       | 22 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_pci_types.h |  1 -
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b483c5c90132..3a3e3ed96566 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -55,6 +55,8 @@ struct xe_device_desc {
 
 	enum xe_platform platform;
 
+	u8 dma_mask_size;
+
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
 
@@ -84,7 +86,6 @@ static const struct xe_graphics_desc graphics_xelp = {
 
 	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
 
-	.dma_mask_size = 39,
 	.va_bits = 48,
 	.vm_max_level = 3,
 };
@@ -96,14 +97,12 @@ static const struct xe_graphics_desc graphics_xelpp = {
 
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
 
@@ -138,7 +137,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
 		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
 
 	XE_HP_FEATURES,
-	.dma_mask_size = 52,
 	.max_remote_tiles = 1,
 	.va_bits = 57,
 	.vm_max_level = 4,
@@ -159,7 +157,6 @@ static const struct xe_graphics_desc graphics_xelpg = {
 };
 
 #define XE2_GFX_FEATURES \
-	.dma_mask_size = 46, \
 	.has_asid = 1, \
 	.has_atomic_enable_pte_bit = 1, \
 	.has_flat_ccs = 1, \
@@ -219,6 +216,7 @@ static const struct xe_device_desc tgl_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(TIGERLAKE),
+	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
@@ -228,6 +226,7 @@ static const struct xe_device_desc rkl_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(ROCKETLAKE),
+	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
 	.require_force_probe = true,
@@ -239,6 +238,7 @@ static const struct xe_device_desc adl_s_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(ALDERLAKE_S),
+	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
 	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
@@ -255,6 +255,7 @@ static const struct xe_device_desc adl_p_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(ALDERLAKE_P),
+	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
 	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
@@ -269,6 +270,7 @@ static const struct xe_device_desc adl_n_desc = {
 	.graphics = &graphics_xelp,
 	.media = &media_xem,
 	PLATFORM(ALDERLAKE_N),
+	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
 	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
@@ -283,6 +285,7 @@ static const struct xe_device_desc dg1_desc = {
 	.media = &media_xem,
 	DGFX_FEATURES,
 	PLATFORM(DG1),
+	.dma_mask_size = 39,
 	.has_display = true,
 	.has_heci_gscfi = 1,
 	.require_force_probe = true,
@@ -306,6 +309,7 @@ static const u16 dg2_g12_ids[] = { INTEL_DG2_G12_IDS(NOP), 0 };
 static const struct xe_device_desc ats_m_desc = {
 	.graphics = &graphics_xehpg,
 	.media = &media_xehpm,
+	.dma_mask_size = 46,
 	.require_force_probe = true,
 
 	DG2_FEATURES,
@@ -316,6 +320,7 @@ static const struct xe_device_desc ats_m_desc = {
 static const struct xe_device_desc dg2_desc = {
 	.graphics = &graphics_xehpg,
 	.media = &media_xehpm,
+	.dma_mask_size = 46,
 	.require_force_probe = true,
 
 	DG2_FEATURES,
@@ -326,6 +331,7 @@ static const struct xe_device_desc pvc_desc = {
 	.graphics = &graphics_xehpc,
 	DGFX_FEATURES,
 	PLATFORM(PVC),
+	.dma_mask_size = 52,
 	.has_display = false,
 	.has_heci_gscfi = 1,
 	.require_force_probe = true,
@@ -335,23 +341,27 @@ static const struct xe_device_desc mtl_desc = {
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
@@ -619,6 +629,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.subplatform = subplatform_desc ?
 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
 
+	xe->info.dma_mask_size = desc->dma_mask_size;
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
@@ -683,7 +694,6 @@ static int xe_info_init(struct xe_device *xe,
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

