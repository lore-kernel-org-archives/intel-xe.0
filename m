Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712E7CCD193
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 20:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25BDE10E505;
	Mon, 13 Oct 2025 20:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jJ4Ys732";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CE310E500
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 20:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760386201; x=1791922201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8D7ULn6aCOQ7qysdj2yfPWeZCla6MO1PPKROsZo8cs8=;
 b=jJ4Ys732lOfhkrPp6TKVLhfGsJMJQg/i0f4OFbAzdLENqeUFgzwWCtao
 nGWOm/02d854e451SbHHsIK24bB8llmFradcJnBwrD99NU76uofXECcQZ
 jd8xaMH3r9N0DR2YrufsE4BL8yaw8wL76cJiEckpauYM/IGbfNcv0fBNX
 dP/CXWTGI0fDDHwvnu0UAB3k4Kh8muLJpvoaaIYQWe58VtSCC5E7jc5hw
 Esq4klbzMxPsynieV1a4ta2V+kSp8l3Rqy4ueKnSkKxhl/6QFL+rEGh7Z
 33uRirNAePJF228lBFkNyk8I2+KeaXcKn18B41JPA3kLyFsowXJn+KO60 Q==;
X-CSE-ConnectionGUID: V5fPCxhCR+O4bzelm+qBVw==
X-CSE-MsgGUID: jRB1WDitQI6mh8QX/qit9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="72800527"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="72800527"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:01 -0700
X-CSE-ConnectionGUID: x5cNrZLxRf2co2eUMO9Omg==
X-CSE-MsgGUID: ZeA6d8wUQ9+cU07lmRy+ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="185707528"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:00 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v5 04/23] drm/xe: Move 'vm_max_level' flag back to platform
 descriptor
Date: Mon, 13 Oct 2025 13:09:47 -0700
Message-ID: <20251013200944.2499947-29-matthew.d.roper@intel.com>
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
v4:
 - Add missing setting for tgl_desc.  (Gustavo)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c       | 23 +++++++++++++++--------
 drivers/gpu/drm/xe/xe_pci_types.h |  2 +-
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e9d2e5dca2b6..c237313b04e1 100644
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
@@ -171,6 +166,7 @@ static const struct xe_device_desc tgl_desc = {
 	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 	.va_bits = 48,
+	.vm_max_level = 3,
 };
 
 static const struct xe_device_desc rkl_desc = {
@@ -183,6 +179,7 @@ static const struct xe_device_desc rkl_desc = {
 	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 	.va_bits = 48,
+	.vm_max_level = 3,
 };
 
 static const u16 adls_rpls_ids[] = { INTEL_RPLS_IDS(NOP), 0 };
@@ -202,6 +199,7 @@ static const struct xe_device_desc adl_s_desc = {
 		{},
 	},
 	.va_bits = 48,
+	.vm_max_level = 3,
 };
 
 static const u16 adlp_rplu_ids[] = { INTEL_RPLU_IDS(NOP), 0 };
@@ -221,6 +219,7 @@ static const struct xe_device_desc adl_p_desc = {
 		{},
 	},
 	.va_bits = 48,
+	.vm_max_level = 3,
 };
 
 static const struct xe_device_desc adl_n_desc = {
@@ -234,6 +233,7 @@ static const struct xe_device_desc adl_n_desc = {
 	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 	.va_bits = 48,
+	.vm_max_level = 3,
 };
 
 #define DGFX_FEATURES \
@@ -251,6 +251,7 @@ static const struct xe_device_desc dg1_desc = {
 	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 	.va_bits = 48,
+	.vm_max_level = 3,
 };
 
 static const u16 dg2_g10_ids[] = { INTEL_DG2_G10_IDS(NOP), INTEL_ATS_M150_IDS(NOP), 0 };
@@ -268,7 +269,8 @@ static const u16 dg2_g12_ids[] = { INTEL_DG2_G12_IDS(NOP), 0 };
 		{ XE_SUBPLATFORM_DG2_G12, "G12", dg2_g12_ids }, \
 		{ } \
 	}, \
-	.va_bits = 48
+	.va_bits = 48, \
+	.vm_max_level = 3
 
 static const struct xe_device_desc ats_m_desc = {
 	.pre_gmdid_graphics_ip = &graphics_ip_xehpg,
@@ -307,6 +309,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	.max_remote_tiles = 1,
 	.require_force_probe = true,
 	.va_bits = 57,
+	.vm_max_level = 4,
 	.has_mbx_power_limits = false,
 };
 
@@ -319,6 +322,7 @@ static const struct xe_device_desc mtl_desc = {
 	.has_pxp = true,
 	.max_gt_per_tile = 2,
 	.va_bits = 48,
+	.vm_max_level = 4,
 };
 
 static const struct xe_device_desc lnl_desc = {
@@ -329,6 +333,7 @@ static const struct xe_device_desc lnl_desc = {
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
 	.va_bits = 48,
+	.vm_max_level = 4,
 };
 
 static const struct xe_device_desc bmg_desc = {
@@ -345,6 +350,7 @@ static const struct xe_device_desc bmg_desc = {
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
 	.va_bits = 48,
+	.vm_max_level = 4,
 };
 
 static const struct xe_device_desc ptl_desc = {
@@ -356,6 +362,7 @@ static const struct xe_device_desc ptl_desc = {
 	.needs_scratch = true,
 	.needs_shared_vf_gt_wq = true,
 	.va_bits = 48,
+	.vm_max_level = 4,
 };
 
 #undef PLATFORM
@@ -594,6 +601,7 @@ static int xe_info_init_early(struct xe_device *xe,
 
 	xe->info.dma_mask_size = desc->dma_mask_size;
 	xe->info.va_bits = desc->va_bits;
+	xe->info.vm_max_level = desc->vm_max_level;
 
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_fan_control = desc->has_fan_control;
@@ -725,7 +733,6 @@ static int xe_info_init(struct xe_device *xe,
 	}
 
 	xe->info.vram_flags = graphics_desc->vram_flags;
-	xe->info.vm_max_level = graphics_desc->vm_max_level;
 	xe->info.has_asid = graphics_desc->has_asid;
 	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
 	if (xe->info.platform != XE_PVC)
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 7c27e3742aa7..e59b59ec636d 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -31,6 +31,7 @@ struct xe_device_desc {
 	u8 max_remote_tiles:2;
 	u8 max_gt_per_tile:2;
 	u8 va_bits;
+	u8 vm_max_level;
 
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
@@ -53,7 +54,6 @@ struct xe_device_desc {
 };
 
 struct xe_graphics_desc {
-	u8 vm_max_level;
 	u8 vram_flags;
 
 	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
-- 
2.51.0

