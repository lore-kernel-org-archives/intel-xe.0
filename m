Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F251CCD18C
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 20:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CAC10E500;
	Mon, 13 Oct 2025 20:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ESdNpMOa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6D410E500
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 20:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760386201; x=1791922201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gSFlY/bxtR6M8mQCOhrnBA0yo1zD0+87GnAGByKC6jo=;
 b=ESdNpMOafpLZiyu8qTMLHml6nQK+8HucE/yetaArVEqbRGlGC2BqcZBz
 Msu0uW4N0Hzy1aqde5OS+aeldzQIiV/2zZJNpilWmRe9oehRTLgoF5/iw
 AynBT9S7accmN64PHk7549EHSVJot4L9PYCIH5HXE6PFekSgIWkhb6tiB
 jycDycxZQSY1Sbnl/WXrm6KXGOYcrVTtLMwGVQyu0HQFNZSiAu3uYzs+r
 TGw2Q8NesBkOfNM0SlYugdp2FVCns4pWWeGTlHkk5o4eQmv7TEZJNKzyC
 BKsxCFHmlGnpdGSzt1rntE1a5MgVtJhPRdNvUMDMU/vFH8ankbzNNBDUB Q==;
X-CSE-ConnectionGUID: x3JuOlPKTUSt8YuJ6JuOkg==
X-CSE-MsgGUID: DY3UO105T3K5csAL2LsJag==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="72800526"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="72800526"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:00 -0700
X-CSE-ConnectionGUID: 5c6eONUsS/Ce3rK19YgI3A==
X-CSE-MsgGUID: AIJNGcOlTF2R5DPyig+M+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="185707524"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:00 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v5 03/23] drm/xe: Move 'va_bits' flag back to platform
 descriptor
Date: Mon, 13 Oct 2025 13:09:46 -0700
Message-ID: <20251013200944.2499947-28-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013200944.2499947-25-matthew.d.roper@intel.com>
References: <20251013200944.2499947-25-matthew.d.roper@intel.com>
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

The number of virtual address bits is something that should be tracked
at the platform level rather than the IP level.  Even when mixing and
matching various graphics, media, and display IP blocks, the platform as
a whole has to have consistent page table handling.  This is also a
trait that should be tied to the platform even if the graphics IP itself
is not present (e.g., if we disable the primary GT via configfs).

v2:
 - Drop the default value of 48 and explicitly set it in each relevant
   descriptor.  (Lucas, Michal)
v3:
 - Drop an outdated comment about default value.  (Michal)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c       | 21 +++++++++++++++------
 drivers/gpu/drm/xe/xe_pci_types.h |  2 +-
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 944c698808ac..e9d2e5dca2b6 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -52,13 +52,11 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 static const struct xe_graphics_desc graphics_xelp = {
 	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
 
-	.va_bits = 48,
 	.vm_max_level = 3,
 };
 
 #define XE_HP_FEATURES \
 	.has_range_tlb_inval = true, \
-	.va_bits = 48, \
 	.vm_max_level = 3
 
 static const struct xe_graphics_desc graphics_xehpg = {
@@ -84,7 +82,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
 		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
 
 	XE_HP_FEATURES,
-	.va_bits = 57,
 	.vm_max_level = 4,
 	.vram_flags = XE_VRAM_FLAGS_NEED64K,
 
@@ -108,7 +105,6 @@ static const struct xe_graphics_desc graphics_xelpg = {
 	.has_range_tlb_inval = 1, \
 	.has_usm = 1, \
 	.has_64bit_timestamp = 1, \
-	.va_bits = 48, \
 	.vm_max_level = 4, \
 	.hw_engine_mask = \
 		BIT(XE_HW_ENGINE_RCS0) | \
@@ -174,6 +170,7 @@ static const struct xe_device_desc tgl_desc = {
 	.has_sriov = true,
 	.max_gt_per_tile = 1,
 	.require_force_probe = true,
+	.va_bits = 48,
 };
 
 static const struct xe_device_desc rkl_desc = {
@@ -185,6 +182,7 @@ static const struct xe_device_desc rkl_desc = {
 	.has_llc = true,
 	.max_gt_per_tile = 1,
 	.require_force_probe = true,
+	.va_bits = 48,
 };
 
 static const u16 adls_rpls_ids[] = { INTEL_RPLS_IDS(NOP), 0 };
@@ -203,6 +201,7 @@ static const struct xe_device_desc adl_s_desc = {
 		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
 		{},
 	},
+	.va_bits = 48,
 };
 
 static const u16 adlp_rplu_ids[] = { INTEL_RPLU_IDS(NOP), 0 };
@@ -221,6 +220,7 @@ static const struct xe_device_desc adl_p_desc = {
 		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
 		{},
 	},
+	.va_bits = 48,
 };
 
 static const struct xe_device_desc adl_n_desc = {
@@ -233,6 +233,7 @@ static const struct xe_device_desc adl_n_desc = {
 	.has_sriov = true,
 	.max_gt_per_tile = 1,
 	.require_force_probe = true,
+	.va_bits = 48,
 };
 
 #define DGFX_FEATURES \
@@ -249,6 +250,7 @@ static const struct xe_device_desc dg1_desc = {
 	.has_heci_gscfi = 1,
 	.max_gt_per_tile = 1,
 	.require_force_probe = true,
+	.va_bits = 48,
 };
 
 static const u16 dg2_g10_ids[] = { INTEL_DG2_G10_IDS(NOP), INTEL_ATS_M150_IDS(NOP), 0 };
@@ -265,7 +267,8 @@ static const u16 dg2_g12_ids[] = { INTEL_DG2_G12_IDS(NOP), 0 };
 		{ XE_SUBPLATFORM_DG2_G11, "G11", dg2_g11_ids }, \
 		{ XE_SUBPLATFORM_DG2_G12, "G12", dg2_g12_ids }, \
 		{ } \
-	}
+	}, \
+	.va_bits = 48
 
 static const struct xe_device_desc ats_m_desc = {
 	.pre_gmdid_graphics_ip = &graphics_ip_xehpg,
@@ -303,6 +306,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	.max_gt_per_tile = 1,
 	.max_remote_tiles = 1,
 	.require_force_probe = true,
+	.va_bits = 57,
 	.has_mbx_power_limits = false,
 };
 
@@ -314,6 +318,7 @@ static const struct xe_device_desc mtl_desc = {
 	.has_display = true,
 	.has_pxp = true,
 	.max_gt_per_tile = 2,
+	.va_bits = 48,
 };
 
 static const struct xe_device_desc lnl_desc = {
@@ -323,6 +328,7 @@ static const struct xe_device_desc lnl_desc = {
 	.has_pxp = true,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
+	.va_bits = 48,
 };
 
 static const struct xe_device_desc bmg_desc = {
@@ -338,6 +344,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
+	.va_bits = 48,
 };
 
 static const struct xe_device_desc ptl_desc = {
@@ -348,6 +355,7 @@ static const struct xe_device_desc ptl_desc = {
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
 	.needs_shared_vf_gt_wq = true,
+	.va_bits = 48,
 };
 
 #undef PLATFORM
@@ -585,6 +593,8 @@ static int xe_info_init_early(struct xe_device *xe,
 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
 
 	xe->info.dma_mask_size = desc->dma_mask_size;
+	xe->info.va_bits = desc->va_bits;
+
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_fan_control = desc->has_fan_control;
 	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
@@ -715,7 +725,6 @@ static int xe_info_init(struct xe_device *xe,
 	}
 
 	xe->info.vram_flags = graphics_desc->vram_flags;
-	xe->info.va_bits = graphics_desc->va_bits;
 	xe->info.vm_max_level = graphics_desc->vm_max_level;
 	xe->info.has_asid = graphics_desc->has_asid;
 	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index b11bf6abda5b..7c27e3742aa7 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -30,6 +30,7 @@ struct xe_device_desc {
 	u8 dma_mask_size;
 	u8 max_remote_tiles:2;
 	u8 max_gt_per_tile:2;
+	u8 va_bits;
 
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
@@ -52,7 +53,6 @@ struct xe_device_desc {
 };
 
 struct xe_graphics_desc {
-	u8 va_bits;
 	u8 vm_max_level;
 	u8 vram_flags;
 
-- 
2.51.0

