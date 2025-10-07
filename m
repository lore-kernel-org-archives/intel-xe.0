Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4874ECCD183
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 20:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EDF10E38D;
	Tue,  7 Oct 2025 20:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I/WVvvLV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A75E10E38C
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 20:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759870130; x=1791406130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YF+oPF1NxaO57mlFi9awCf5S+g4PGOO01xRRQL0KNOU=;
 b=I/WVvvLVqUbgUnvhhykL21iBL18jCKQLYVdreTJMnVm75YiaCTCmg0Op
 QXczAFdSnCLLooc4Na8/lxYMTkLkypeRi8YH9bxGDFNLPTf5ocGvjdizb
 BKny0Bw5V1Jc8+oLd0c1amkHnrT3ADmJH2H+3u4ddeF/Rki5YSITN2LNF
 riSWrtXsGZ9JHb/dFhceBjh3NeOlVkRHP4MZF8yt29Wso8NbfKSJczz0G
 RA89toDwtazX1B+5hP5pyuJCox1PkQkn+1h3N1gTOEWCmipyixCjgDnf/
 P05xLnDxXs303/GHq8lv//4Oq0CsxxJcxH3zlvARgBflFM1kbjD8gEkus g==;
X-CSE-ConnectionGUID: /0vKOq6JTd+xWBxJc+2GPg==
X-CSE-MsgGUID: Cz03zdLqTqyvvW9LlK/tGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="49616741"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="49616741"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:49 -0700
X-CSE-ConnectionGUID: QJG5V8giQ7yfzzHVrDONrA==
X-CSE-MsgGUID: 3xMMAYQcTICBQb0LA0bACA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="184631072"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 06/23] drm/xe: Move 'has_flatccs' flag back to platform
 descriptor
Date: Tue,  7 Oct 2025 13:48:36 -0700
Message-ID: <20251007204829.1468209-31-matthew.d.roper@intel.com>
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
index 97a3abec8e3f..377588ffeb27 100644
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

