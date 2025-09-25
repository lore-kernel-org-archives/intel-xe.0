Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66564CAC5BC
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 23:46:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C401410E330;
	Thu, 25 Sep 2025 23:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P3jWlHek";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9A510E13F
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 23:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758844007; x=1790380007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AxVA77wy/RFfEG72FJTavdx2Jj+WLkHCEyY4Lqt3C9I=;
 b=P3jWlHekBncS1gjRibc/2Fou0iIqKYX/aYybvJ351XzQ5iUUbLkHiorm
 mzYAPizCWzh5n/jjPhKaaN3yFPLwljLZjM0BGceoSMrTJyOKK3yi2QsWT
 pIAU9+wc49rvGWyicSm48/+dUHBEB+BY0b/BtXowRuGck3/rO4shcsx/0
 yBvAlJVl6IP7aiNCM4xK59WUBnxT7n1PLOvVswJbd4k+V+BZslDPWcPhV
 C58I5my+AOBALCn0oGNiDtgMev+qspv1Hoa9/xo2AKo728SXHiIIFBz67
 w+EjGMH2nqQL1Uw51MxifHc2G5al6Y+gfsOW3g1UhEHvBlMLNCid2SyXm Q==;
X-CSE-ConnectionGUID: LyFvl8OtSLqhjSfHXWu0mQ==
X-CSE-MsgGUID: M2G/DTkCS7GZanZzso1zzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78817666"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="78817666"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
X-CSE-ConnectionGUID: CA+pZ9kLQK+fCFjJ5ACQEA==
X-CSE-MsgGUID: 5XBafRZ8TRqU1klmsTxa2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="181852956"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 04/22] drm/xe: Move 'vm_max_level' flag back to platform
 descriptor
Date: Thu, 25 Sep 2025 16:46:32 -0700
Message-ID: <20250925234628.2112163-28-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925234628.2112163-24-matthew.d.roper@intel.com>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
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

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c       | 17 +++++++++--------
 drivers/gpu/drm/xe/xe_pci_types.h |  2 +-
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 90dae6fa7fc8..0851fbe92cba 100644
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
@@ -181,6 +176,7 @@ static const struct xe_device_desc rkl_desc = {
 	.has_llc = true,
 	.max_gt_per_tile = 1,
 	.require_force_probe = true,
+	.vm_max_level = 3,
 };
 
 static const u16 adls_rpls_ids[] = { INTEL_RPLS_IDS(NOP), 0 };
@@ -199,6 +195,7 @@ static const struct xe_device_desc adl_s_desc = {
 		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
 		{},
 	},
+	.vm_max_level = 3,
 };
 
 static const u16 adlp_rplu_ids[] = { INTEL_RPLU_IDS(NOP), 0 };
@@ -217,6 +214,7 @@ static const struct xe_device_desc adl_p_desc = {
 		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
 		{},
 	},
+	.vm_max_level = 3,
 };
 
 static const struct xe_device_desc adl_n_desc = {
@@ -229,6 +227,7 @@ static const struct xe_device_desc adl_n_desc = {
 	.has_sriov = true,
 	.max_gt_per_tile = 1,
 	.require_force_probe = true,
+	.vm_max_level = 3,
 };
 
 #define DGFX_FEATURES \
@@ -245,6 +244,7 @@ static const struct xe_device_desc dg1_desc = {
 	.has_heci_gscfi = 1,
 	.max_gt_per_tile = 1,
 	.require_force_probe = true,
+	.vm_max_level = 3,
 };
 
 static const u16 dg2_g10_ids[] = { INTEL_DG2_G10_IDS(NOP), INTEL_ATS_M150_IDS(NOP), 0 };
@@ -261,7 +261,8 @@ static const u16 dg2_g12_ids[] = { INTEL_DG2_G12_IDS(NOP), 0 };
 		{ XE_SUBPLATFORM_DG2_G11, "G11", dg2_g11_ids }, \
 		{ XE_SUBPLATFORM_DG2_G12, "G12", dg2_g12_ids }, \
 		{ } \
-	}
+	}, \
+	.vm_max_level = 3
 
 static const struct xe_device_desc ats_m_desc = {
 	.pre_gmdid_graphics_ip = &graphics_ip_xehpg,
@@ -582,6 +583,7 @@ static int xe_info_init_early(struct xe_device *xe,
 
 	xe->info.dma_mask_size = desc->dma_mask_size;
 	xe->info.va_bits = desc->va_bits ?: 48;
+	xe->info.vm_max_level = desc->vm_max_level ?: 4;
 
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_fan_control = desc->has_fan_control;
@@ -712,7 +714,6 @@ static int xe_info_init(struct xe_device *xe,
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

