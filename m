Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929F1CCD186
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 20:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98CDC10E39C;
	Tue,  7 Oct 2025 20:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AcEHSeY2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D15210E39A
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 20:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759870130; x=1791406130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ulsxoM2BiXdRUtyVaKLaPeFMYIK/DFysNsQ7UjEA9mo=;
 b=AcEHSeY2Ie/HzzrldzooWyd6FneB40y4VwMLAWnsVA4/zOt/fzctP69N
 HjInOJulIbqkAyr/X3w9E5IechZwzAKrdMPCC1LoozCF/0izggDwJ40oR
 bjgLCEqVNhfILA+igxuatxlYGKwSPyBJEKciyDimsQnUM0lVqP9CHukp4
 3MFIdHC8PUKCZPXUR4tSxUpXSo5VR3z6IK0xLieKU7AIWkbXCA//45b8Q
 +SB8QSyU0/gspycxWbrulRKHmGxd1frEE5OM0pVnsNSjV29PwBHuEg63M
 iQwxYVixFg0fOfC5kLZqAoQN38ieGN/AqzgWlwWn6D6Dr6JGYgFOp2TMn A==;
X-CSE-ConnectionGUID: WXv7MtRSSqCwN9hUR/+Tlg==
X-CSE-MsgGUID: X6Ap2RgNTyufCuqG8mgdYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="49616738"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="49616738"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:49 -0700
X-CSE-ConnectionGUID: htyrn1UyR9Sm2W/ezr3MVA==
X-CSE-MsgGUID: LqmkCCWzSH6mYS6afvzssA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="184631066"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v4 04/23] drm/xe: Move 'vm_max_level' flag back to platform
 descriptor
Date: Tue,  7 Oct 2025 13:48:34 -0700
Message-ID: <20251007204829.1468209-29-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007204829.1468209-25-matthew.d.roper@intel.com>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
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

The number of page table levels for PPGTT virtual addresses is something
that should be tracked at the platform level rather than the IP level.
Even when mixing and matching various graphics, media, and display IP
blocks, the platform as a whole has to have consistent page table
handling.  This is also a trait that should be tied to the platform even
if the graphics IP itself is not present (e.g., if we disable the
primary GT via configfs).

v2:
 - Drop default value of 4 and explicitly set the value in each platform
   descriptor.  (Lucas)
v3:
 - Drop outdated code comment and commit message paragraph about default
   value.  (Gustavo)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c       | 22 ++++++++++++++--------
 drivers/gpu/drm/xe/xe_pci_types.h |  2 +-
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 69ed987fef67..8688f40f55d8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -51,13 +51,10 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 
 static const struct xe_graphics_desc graphics_xelp = {
 	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
-
-	.vm_max_level = 3,
 };
 
 #define XE_HP_FEATURES \
-	.has_range_tlb_inval = true, \
-	.vm_max_level = 3
+	.has_range_tlb_inval = true
 
 static const struct xe_graphics_desc graphics_xehpg = {
 	.hw_engine_mask =
@@ -82,7 +79,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
 		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
 
 	XE_HP_FEATURES,
-	.vm_max_level = 4,
 	.vram_flags = XE_VRAM_FLAGS_NEED64K,
 
 	.has_asid = 1,
@@ -105,7 +101,6 @@ static const struct xe_graphics_desc graphics_xelpg = {
 	.has_range_tlb_inval = 1, \
 	.has_usm = 1, \
 	.has_64bit_timestamp = 1, \
-	.vm_max_level = 4, \
 	.hw_engine_mask = \
 		BIT(XE_HW_ENGINE_RCS0) | \
 		BIT(XE_HW_ENGINE_BCS8) | BIT(XE_HW_ENGINE_BCS0) | \
@@ -183,6 +178,7 @@ static const struct xe_device_desc rkl_desc = {
 	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 	.va_bits = 48,
+	.vm_max_level = 3,
 };
 
 static const u16 adls_rpls_ids[] = { INTEL_RPLS_IDS(NOP), 0 };
@@ -202,6 +198,7 @@ static const struct xe_device_desc adl_s_desc = {
 		{},
 	},
 	.va_bits = 48,
+	.vm_max_level = 3,
 };
 
 static const u16 adlp_rplu_ids[] = { INTEL_RPLU_IDS(NOP), 0 };
@@ -221,6 +218,7 @@ static const struct xe_device_desc adl_p_desc = {
 		{},
 	},
 	.va_bits = 48,
+	.vm_max_level = 3,
 };
 
 static const struct xe_device_desc adl_n_desc = {
@@ -234,6 +232,7 @@ static const struct xe_device_desc adl_n_desc = {
 	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 	.va_bits = 48,
+	.vm_max_level = 3,
 };
 
 #define DGFX_FEATURES \
@@ -251,6 +250,7 @@ static const struct xe_device_desc dg1_desc = {
 	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 	.va_bits = 48,
+	.vm_max_level = 3,
 };
 
 static const u16 dg2_g10_ids[] = { INTEL_DG2_G10_IDS(NOP), INTEL_ATS_M150_IDS(NOP), 0 };
@@ -268,7 +268,8 @@ static const u16 dg2_g12_ids[] = { INTEL_DG2_G12_IDS(NOP), 0 };
 		{ XE_SUBPLATFORM_DG2_G12, "G12", dg2_g12_ids }, \
 		{ } \
 	}, \
-	.va_bits = 48
+	.va_bits = 48, \
+	.vm_max_level = 3
 
 static const struct xe_device_desc ats_m_desc = {
 	.pre_gmdid_graphics_ip = &graphics_ip_xehpg,
@@ -307,6 +308,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	.max_remote_tiles = 1,
 	.require_force_probe = true,
 	.va_bits = 57,
+	.vm_max_level = 4,
 	.has_mbx_power_limits = false,
 };
 
@@ -319,6 +321,7 @@ static const struct xe_device_desc mtl_desc = {
 	.has_pxp = true,
 	.max_gt_per_tile = 2,
 	.va_bits = 48,
+	.vm_max_level = 4,
 };
 
 static const struct xe_device_desc lnl_desc = {
@@ -329,6 +332,7 @@ static const struct xe_device_desc lnl_desc = {
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
 	.va_bits = 48,
+	.vm_max_level = 4,
 };
 
 static const struct xe_device_desc bmg_desc = {
@@ -345,6 +349,7 @@ static const struct xe_device_desc bmg_desc = {
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
 	.va_bits = 48,
+	.vm_max_level = 4,
 };
 
 static const struct xe_device_desc ptl_desc = {
@@ -355,6 +360,7 @@ static const struct xe_device_desc ptl_desc = {
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
 	.va_bits = 48,
+	.vm_max_level = 4,
 };
 
 #undef PLATFORM
@@ -593,6 +599,7 @@ static int xe_info_init_early(struct xe_device *xe,
 
 	xe->info.dma_mask_size = desc->dma_mask_size;
 	xe->info.va_bits = desc->va_bits;
+	xe->info.vm_max_level = desc->vm_max_level;
 
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_fan_control = desc->has_fan_control;
@@ -723,7 +730,6 @@ static int xe_info_init(struct xe_device *xe,
 	}
 
 	xe->info.vram_flags = graphics_desc->vram_flags;
-	xe->info.vm_max_level = graphics_desc->vm_max_level;
 	xe->info.has_asid = graphics_desc->has_asid;
 	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
 	if (xe->info.platform != XE_PVC)
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 796439571abe..6354280584d9 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -31,6 +31,7 @@ struct xe_device_desc {
 	u8 max_remote_tiles:2;
 	u8 max_gt_per_tile:2;
 	u8 va_bits;
+	u8 vm_max_level;
 
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
@@ -52,7 +53,6 @@ struct xe_device_desc {
 };
 
 struct xe_graphics_desc {
-	u8 vm_max_level;
 	u8 vram_flags;
 
 	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
-- 
2.51.0

