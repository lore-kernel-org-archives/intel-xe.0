Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F15CCD180
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 22:56:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1468E10E2EA;
	Tue, 30 Sep 2025 22:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WdQyLDVU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA5B10E63F
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 22:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759272993; x=1790808993;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2nROAwXNcfX0oGNtmor5CJ48m6ESmDqUkY4+STdtGak=;
 b=WdQyLDVUEpxN9HliGRgaW4n6T2j/Yqj+aW8uFohPGhuv1T5ql5aMBjpd
 u+TKSA4srUyGOSCWLyxXh4t+F7tdMPjT3EM6BGkMxZwwvn71SDldngVd2
 xZvRGRSBzEIu+vBBWD209K1XkinCHTOfFRLqhDfkWivRgtT+24Xn/180y
 vJ1GV9v6JtHBnoGVhFDjKNWEQzwm33/GQ/qFMWzTYVxYMSYzr8ApoXiPX
 L7RizagW2KTNcG9rA68NdAqvZdysCfc6qSCla3xql1T6s7wMCVfUK6UD/
 6OU/b6omU9zV52A4E2nzFnU5Rpam5h2A6I6M8Y8ElLojUpZ/AVv0hOT2d g==;
X-CSE-ConnectionGUID: tbd19sdeRpKV1tQMhohlvg==
X-CSE-MsgGUID: 7ih0aGIhRQK02gadxF4F7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65397744"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="65397744"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:32 -0700
X-CSE-ConnectionGUID: SrfCXJidS5mEV0nhYCwNug==
X-CSE-MsgGUID: 6gaXqOwjTG+fZYRF00dPIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="178229442"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 04/23] drm/xe: Move 'vm_max_level' flag back to platform
 descriptor
Date: Tue, 30 Sep 2025 15:56:21 -0700
Message-ID: <20250930225618.140071-29-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930225618.140071-25-matthew.d.roper@intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
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

Since all platforms officially supported by the Xe driver use the same
value (4 levels) and only some old Xe1 platforms have a different value,
let's make this the default if a platform descriptor doesn't specify the
value.  If more platforms show up in the future with different numbers
of page table levels, we can go back to requiring this to be explicitly
specified for every platform at that time.

v2:
 - Drop default value of 4 and explicitly set the value in each platform
   desciptor.  (Lucas)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
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
index 095133a1aa44..f45b45a7f76a 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -31,6 +31,7 @@ struct xe_device_desc {
 	u8 max_remote_tiles:2;
 	u8 max_gt_per_tile:2;
 	u8 va_bits;		/* default is 48 bits if not specified */
+	u8 vm_max_level;	/* default is 4 if not specified */
 
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

