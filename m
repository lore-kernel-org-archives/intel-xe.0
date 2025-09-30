Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E3ECCD182
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 22:57:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A7A10E648;
	Tue, 30 Sep 2025 22:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CYp3JUWo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76D110E2E4
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 22:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759272993; x=1790808993;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BH3xF6XpXvupQSQpH+PawkNJun4sdy0mgs58JOHmSi8=;
 b=CYp3JUWoPL0ULfs07C3pNs3Q1Q+lPyDA+3qdOdDmm0GtiiprL8s0GRd6
 kcM5b8i3G3uNbatsO+PST4E+AMpO5YXR/p00T+KAHDNbHAn4r1SNo0WGq
 hCEVg5ot5BVOR/i3zGSf5psn60cJoDGiNguxoyW+K2niwtqwYNCFZnuzc
 GCjoFyrb8jRe14No4y90eixdtv4rgqO6Nt1wTwP9zovxfHxzXvqdKRpTP
 Zqo/eU9V+nmcCfo3msmIz37XCp90a5Z2NJlOpi2mZJ8TuR+wPIYvFycS8
 JsGDfh2nYhH/RhpXTv7jYRtlfrcgX8dxM/MpzQAqLvtBmZT4W/9rskuZo w==;
X-CSE-ConnectionGUID: sf82BzPlQoaKCTUb00xe+g==
X-CSE-MsgGUID: tZDCOa0DRX6Lpz/P31U3CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65397746"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="65397746"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:32 -0700
X-CSE-ConnectionGUID: Jq7m0euWTsSp7EM6LH93oA==
X-CSE-MsgGUID: 7Ces3mPBRamOAR2qP/Ahng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="178229449"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 06/23] drm/xe: Move 'has_flatccs' flag back to platform
 descriptor
Date: Tue, 30 Sep 2025 15:56:23 -0700
Message-ID: <20250930225618.140071-31-matthew.d.roper@intel.com>
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

FlatCCS presence/absence is a flag that should be tracked at the
platform level rather than the IP level.  FlatCCS affects the
device-wide memory initialization and reservations so its effects are
not confined to a single IP block or GT.  This is also a trait that
should be tied to the platform even if the graphics IP itself is not
present (e.g., if we disable the primary GT via configfs).

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c       | 12 ++++++------
 drivers/gpu/drm/xe/xe_pci_types.h |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e0a28276c60a..37ae49f4b648 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -63,8 +63,6 @@ static const struct xe_graphics_desc graphics_xehpg = {
 		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
 
 	XE_HP_FEATURES,
-
-	.has_flat_ccs = 1,
 };
 
 static const struct xe_graphics_desc graphics_xehpc = {
@@ -95,7 +93,6 @@ static const struct xe_graphics_desc graphics_xelpg = {
 #define XE2_GFX_FEATURES \
 	.has_asid = 1, \
 	.has_atomic_enable_pte_bit = 1, \
-	.has_flat_ccs = 1, \
 	.has_range_tlb_inval = 1, \
 	.has_usm = 1, \
 	.has_64bit_timestamp = 1, \
@@ -258,6 +255,7 @@ static const u16 dg2_g12_ids[] = { INTEL_DG2_G12_IDS(NOP), 0 };
 #define DG2_FEATURES \
 	DGFX_FEATURES, \
 	PLATFORM(DG2), \
+	.has_flat_ccs = 1, \
 	.has_gsc_nvm = 1, \
 	.has_heci_gscfi = 1, \
 	.subplatforms = (const struct xe_subplatform_desc[]) { \
@@ -328,6 +326,7 @@ static const struct xe_device_desc lnl_desc = {
 	PLATFORM(LUNARLAKE),
 	.dma_mask_size = 46,
 	.has_display = true,
+	.has_flat_ccs = 1,
 	.has_pxp = true,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
@@ -341,6 +340,7 @@ static const struct xe_device_desc bmg_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.has_fan_control = true,
+	.has_flat_ccs = 1,
 	.has_mbx_power_limits = true,
 	.has_gsc_nvm = 1,
 	.has_heci_cscfi = 1,
@@ -356,6 +356,7 @@ static const struct xe_device_desc ptl_desc = {
 	PLATFORM(PANTHERLAKE),
 	.dma_mask_size = 46,
 	.has_display = true,
+	.has_flat_ccs = 1,
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
@@ -604,6 +605,8 @@ static int xe_info_init_early(struct xe_device *xe,
 
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_fan_control = desc->has_fan_control;
+	/* runtime fusing may force flat_ccs to disabled later */
+	xe->info.has_flat_ccs = desc->has_flat_ccs;
 	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
 	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
@@ -735,9 +738,6 @@ static int xe_info_init(struct xe_device *xe,
 	if (xe->info.platform != XE_PVC)
 		xe->info.has_device_atomics_on_smem = 1;
 
-	/* Runtime detection may change this later */
-	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
-
 	xe->info.has_range_tlb_inval = graphics_desc->has_range_tlb_inval;
 	xe->info.has_usm = graphics_desc->has_usm;
 	xe->info.has_64bit_timestamp = graphics_desc->has_64bit_timestamp;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index e7bc74f4b9b3..6e2875ad2a41 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -39,6 +39,7 @@ struct xe_device_desc {
 
 	u8 has_display:1;
 	u8 has_fan_control:1;
+	u8 has_flat_ccs:1;
 	u8 has_gsc_nvm:1;
 	u8 has_heci_gscfi:1;
 	u8 has_heci_cscfi:1;
@@ -58,7 +59,6 @@ struct xe_graphics_desc {
 
 	u8 has_asid:1;
 	u8 has_atomic_enable_pte_bit:1;
-	u8 has_flat_ccs:1;
 	u8 has_indirect_ring_state:1;
 	u8 has_range_tlb_inval:1;
 	u8 has_usm:1;
-- 
2.51.0

