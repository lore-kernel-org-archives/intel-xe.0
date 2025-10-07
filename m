Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D38CCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 20:48:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F77910E38C;
	Tue,  7 Oct 2025 20:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Af9gfSQK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D5710E38D
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 20:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759870129; x=1791406129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SvK2iMaGZTYPFVizLkepNp9pzH6p0mJIAsr4yBmrtgM=;
 b=Af9gfSQKiunwvnHpr0UiyXPIRf+Kp/ilwlq17/wydblx7kOVr6QzSLHv
 Wv6OcEp/YgWwpYxIAUHjImh0iFbVA21S/AtpxLehWnIYxG0bLO8bBe5v7
 rieWFs8Dv61FOEWZdr2XPENzNDNEFemYAQ1y+WbVHH3/BfT++mRGzJSbv
 6BQxv+5u5n7FoHk4TBKKFHbwBeaJh9/hWGsw4Dhwu1NeAGD+g5RLwSad8
 nit/uI5unfYaglaZ2nQoW7K09JkzV+uSa2rxhmeFh2Wdi+nYWjCBaK0Xv
 h/2oCwSwRSKoucz+Flj8q/ZWlUxKqAhuQvIaOiJyWN4Wmz6XO4hmjgLlw g==;
X-CSE-ConnectionGUID: iN2DjXHcQW+vgEMq6Kzrqw==
X-CSE-MsgGUID: RNNVR/yHQRm3lerk3pY4SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="49616739"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="49616739"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:49 -0700
X-CSE-ConnectionGUID: oRZDkWEcTXuB28O8awAaug==
X-CSE-MsgGUID: /lyTBjuHT0yr86V+aXfMLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="184631069"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 05/23] drm/xe: Move 'vram_flags' flag back to platform
 descriptor
Date: Tue,  7 Oct 2025 13:48:35 -0700
Message-ID: <20251007204829.1468209-30-matthew.d.roper@intel.com>
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

Restrictions and requirements on VRAM alignment are something that
should be tracked at the platform level rather than the IP level.  Even
when mixing and matching various graphics, media, and display IP blocks,
the platform as a whole has to have consistent memory allocation
handling.  This is also a trait that should be tied to the platform even
if the graphics IP itself is not present (e.g., if we disable the
primary GT via configfs).

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c       | 8 ++++----
 drivers/gpu/drm/xe/xe_pci_types.h | 3 +--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 8688f40f55d8..e0a28276c60a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -63,7 +63,6 @@ static const struct xe_graphics_desc graphics_xehpg = {
 		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
 
 	XE_HP_FEATURES,
-	.vram_flags = XE_VRAM_FLAGS_NEED64K,
 
 	.has_flat_ccs = 1,
 };
@@ -79,7 +78,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
 		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
 
 	XE_HP_FEATURES,
-	.vram_flags = XE_VRAM_FLAGS_NEED64K,
 
 	.has_asid = 1,
 	.has_atomic_enable_pte_bit = 1,
@@ -269,7 +267,8 @@ static const u16 dg2_g12_ids[] = { INTEL_DG2_G12_IDS(NOP), 0 };
 		{ } \
 	}, \
 	.va_bits = 48, \
-	.vm_max_level = 3
+	.vm_max_level = 3, \
+	.vram_flags = XE_VRAM_FLAGS_NEED64K
 
 static const struct xe_device_desc ats_m_desc = {
 	.pre_gmdid_graphics_ip = &graphics_ip_xehpg,
@@ -309,6 +308,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	.require_force_probe = true,
 	.va_bits = 57,
 	.vm_max_level = 4,
+	.vram_flags = XE_VRAM_FLAGS_NEED64K,
 	.has_mbx_power_limits = false,
 };
 
@@ -600,6 +600,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.dma_mask_size = desc->dma_mask_size;
 	xe->info.va_bits = desc->va_bits;
 	xe->info.vm_max_level = desc->vm_max_level;
+	xe->info.vram_flags = desc->vram_flags;
 
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_fan_control = desc->has_fan_control;
@@ -729,7 +730,6 @@ static int xe_info_init(struct xe_device *xe,
 		media_desc = NULL;
 	}
 
-	xe->info.vram_flags = graphics_desc->vram_flags;
 	xe->info.has_asid = graphics_desc->has_asid;
 	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
 	if (xe->info.platform != XE_PVC)
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 6354280584d9..97a3abec8e3f 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -32,6 +32,7 @@ struct xe_device_desc {
 	u8 max_gt_per_tile:2;
 	u8 va_bits;
 	u8 vm_max_level;
+	u8 vram_flags;
 
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
@@ -53,8 +54,6 @@ struct xe_device_desc {
 };
 
 struct xe_graphics_desc {
-	u8 vram_flags;
-
 	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
 
 	u8 has_asid:1;
-- 
2.51.0

