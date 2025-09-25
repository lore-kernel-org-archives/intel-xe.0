Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23CCCAC5B0
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 23:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F4610E13F;
	Thu, 25 Sep 2025 23:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BPasSW/m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7533410E30A
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 23:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758844007; x=1790380007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W/XFMhbzxmlDYE4Q6fpzuoxMyZZpbM7jCLOk18SWUos=;
 b=BPasSW/mtSv5NKz+C6SJYs219/IRCDqD4AbRgG0fnuj/Mnq6WGSOq8EB
 WHMLYC3dIa8UfR0+MXmrHxOwqATXZcBBef03CpLanaOzxauZCszKKd0xn
 hevK8bnWXsmjjf47AU2W45/K9KZ+6Aw9P3nBCOVL8Ougpzge0TKeurEU2
 m+nEcL3OZ1AusxxyOhEwU2S2Dpxah60ElHe+O2s7mvmvMLic8DWrARDIq
 pkFPmLAAR1Rwu7xNhZZEEsmT13+yXkphWQ1LWbr2zPvsZ+xa1ZFyQxOLA
 lwrdwmQrgq6RoIPzvCinB6zIFUd3ChGQDf0s/hNT/XQ3tMQkvKg8loY+Q g==;
X-CSE-ConnectionGUID: cLtcrwZPTuKocl3zPTMIDw==
X-CSE-MsgGUID: PR6nLVreTjiftGPM+yGEkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78817665"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="78817665"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
X-CSE-ConnectionGUID: zlzwMQ59SFaRqFHwlzHgVQ==
X-CSE-MsgGUID: XfAyh2PxSO+JUpKBaGzPcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="181852953"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 03/22] drm/xe: Move 'va_bits' flag back to platform
 descriptor
Date: Thu, 25 Sep 2025 16:46:31 -0700
Message-ID: <20250925234628.2112163-27-matthew.d.roper@intel.com>
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

The number of virtual address bits is something that should be tracked
at the platform level rather than the IP level.  Even when mixing and
matching various graphics, media, and display IP blocks, the platform as
a whole has to have consistent page table handling.  This is also a
trait that should be tied to the platform even if the graphics IP itself
is not present (e.g., if we disable the primary GT via configfs).

Since all platforms except PVC use the same value (48 bits), let's make
this the default if a platform descriptor doesn't specify the value.  If
more platforms show up in the future with virtual addresses of 57-bits
(or other sizes), we can go back to requiring this to be explicitly
specified for every platform at that time.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c       | 8 +++-----
 drivers/gpu/drm/xe/xe_pci_types.h | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3f42b91efa28..90dae6fa7fc8 100644
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
@@ -303,6 +299,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	.max_gt_per_tile = 1,
 	.max_remote_tiles = 1,
 	.require_force_probe = true,
+	.va_bits = 57,
 	.has_mbx_power_limits = false,
 };
 
@@ -584,6 +581,8 @@ static int xe_info_init_early(struct xe_device *xe,
 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
 
 	xe->info.dma_mask_size = desc->dma_mask_size;
+	xe->info.va_bits = desc->va_bits ?: 48;
+
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_fan_control = desc->has_fan_control;
 	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
@@ -713,7 +712,6 @@ static int xe_info_init(struct xe_device *xe,
 	}
 
 	xe->info.vram_flags = graphics_desc->vram_flags;
-	xe->info.va_bits = graphics_desc->va_bits;
 	xe->info.vm_max_level = graphics_desc->vm_max_level;
 	xe->info.has_asid = graphics_desc->has_asid;
 	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 9b9766a3baa3..095133a1aa44 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -30,6 +30,7 @@ struct xe_device_desc {
 	u8 dma_mask_size;
 	u8 max_remote_tiles:2;
 	u8 max_gt_per_tile:2;
+	u8 va_bits;		/* default is 48 bits if not specified */
 
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
@@ -51,7 +52,6 @@ struct xe_device_desc {
 };
 
 struct xe_graphics_desc {
-	u8 va_bits;
 	u8 vm_max_level;
 	u8 vram_flags;
 
-- 
2.51.0

