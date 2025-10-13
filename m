Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96F8CCD194
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 20:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF3A10E50C;
	Mon, 13 Oct 2025 20:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G9wT88UE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0784210E501
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 20:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760386201; x=1791922201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YNCQPKd6/yWhXFzErJ7m56E06lZwWPQ6pfDZIZuTii4=;
 b=G9wT88UEqmjphcrb0mT11++oA7vtj7csMhCWDU8M03r5wVoj8HBWNDkN
 0jNwdOQsyEkDhqUi0k6D6kyXMnJx8LbajIwcrLCKK4frgJmZmgYMgMLOS
 qxbyz3iUYNHkJ1I2qvJMdCZAVMZwHd7QFOPpwUNwzmPy0cF9PXf0nfSEF
 rhuWgyIkJDXctc4ObMDnDlyn5zHIQv853K42ysT2F9ZIHU2hKXv35v5nc
 XoSmT6zM8/HgDa97J/ZgR+Nbyfu0PS3DF9X/6NkxfChHvPaD7Vm+jv8bn
 TiOnJpi/Hviue97y87dHwcbIIBCh1qowyasOXciVttjZDQGfiCGxmY5iM Q==;
X-CSE-ConnectionGUID: 3DmAinZgSlSWWqJ+JpliXA==
X-CSE-MsgGUID: NGm+vnuIRtqISLGcIioZ1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="72800528"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="72800528"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:01 -0700
X-CSE-ConnectionGUID: F28UATMgR3KFPydUSE7quA==
X-CSE-MsgGUID: QxfdZf/ZRXavoWLe3uNu2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="185707532"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:00 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 05/23] drm/xe: Move 'vram_flags' flag back to platform
 descriptor
Date: Mon, 13 Oct 2025 13:09:48 -0700
Message-ID: <20251013200944.2499947-30-matthew.d.roper@intel.com>
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
index c237313b04e1..8210066ccb32 100644
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
@@ -270,7 +268,8 @@ static const u16 dg2_g12_ids[] = { INTEL_DG2_G12_IDS(NOP), 0 };
 		{ } \
 	}, \
 	.va_bits = 48, \
-	.vm_max_level = 3
+	.vm_max_level = 3, \
+	.vram_flags = XE_VRAM_FLAGS_NEED64K
 
 static const struct xe_device_desc ats_m_desc = {
 	.pre_gmdid_graphics_ip = &graphics_ip_xehpg,
@@ -310,6 +309,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	.require_force_probe = true,
 	.va_bits = 57,
 	.vm_max_level = 4,
+	.vram_flags = XE_VRAM_FLAGS_NEED64K,
 	.has_mbx_power_limits = false,
 };
 
@@ -602,6 +602,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.dma_mask_size = desc->dma_mask_size;
 	xe->info.va_bits = desc->va_bits;
 	xe->info.vm_max_level = desc->vm_max_level;
+	xe->info.vram_flags = desc->vram_flags;
 
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_fan_control = desc->has_fan_control;
@@ -732,7 +733,6 @@ static int xe_info_init(struct xe_device *xe,
 		media_desc = NULL;
 	}
 
-	xe->info.vram_flags = graphics_desc->vram_flags;
 	xe->info.has_asid = graphics_desc->has_asid;
 	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
 	if (xe->info.platform != XE_PVC)
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index e59b59ec636d..3189bd95bb6e 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -32,6 +32,7 @@ struct xe_device_desc {
 	u8 max_gt_per_tile:2;
 	u8 va_bits;
 	u8 vm_max_level;
+	u8 vram_flags;
 
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
@@ -54,8 +55,6 @@ struct xe_device_desc {
 };
 
 struct xe_graphics_desc {
-	u8 vram_flags;
-
 	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
 
 	u8 has_asid:1;
-- 
2.51.0

