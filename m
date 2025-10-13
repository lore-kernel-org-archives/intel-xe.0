Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8E3CCD19A
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 20:10:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6CE10E512;
	Mon, 13 Oct 2025 20:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S96n3uyQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5511810E500
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 20:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760386201; x=1791922201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=54+KPabr21utp7/ZTD3cdowsou8FhUks/45QT2DEZik=;
 b=S96n3uyQDQNOAIo+APugYamD55pt/jk0IdXXocubY/O1dUTp6n5zw2/w
 JVwyVY7Y/A85mabyxlKXNXA+sPD5ANCZT57EwhkRr800CXnwOXua/MR83
 ekUTTeLE9pulOzOJNI1OI6na0VyX/6nWtqusrwT0M8VPRV31oKvE7/loA
 fHn9n/JtNsx5hvP5Y2Azl22aw/YXPutM/J42amA44okg63po6h8aFYaYz
 FeQuynZLSyqFYqYty8JY++fd5ld4VF/lY/tQYaDVDTbWrkcZSnWlWZ/GU
 ADpJzmvJUd9Cingne/QuIiQrOMC92ML+n+IQZFytwM6r/Kvjj8uslDXTK Q==;
X-CSE-ConnectionGUID: 5HfRdZ2vQiSNJEedkeZFVw==
X-CSE-MsgGUID: M1n7wki0TgCAE0AKs7uKTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="72800531"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="72800531"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:01 -0700
X-CSE-ConnectionGUID: VfrLiDOCShiv9yxn22JpnQ==
X-CSE-MsgGUID: WHQjND9lR+WCnbakJuwo1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="185707538"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 06/23] drm/xe: Move 'has_flatccs' flag back to platform
 descriptor
Date: Mon, 13 Oct 2025 13:09:49 -0700
Message-ID: <20251013200944.2499947-31-matthew.d.roper@intel.com>
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
index 8210066ccb32..076d944cce6a 100644
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
@@ -259,6 +256,7 @@ static const u16 dg2_g12_ids[] = { INTEL_DG2_G12_IDS(NOP), 0 };
 #define DG2_FEATURES \
 	DGFX_FEATURES, \
 	PLATFORM(DG2), \
+	.has_flat_ccs = 1, \
 	.has_gsc_nvm = 1, \
 	.has_heci_gscfi = 1, \
 	.subplatforms = (const struct xe_subplatform_desc[]) { \
@@ -329,6 +327,7 @@ static const struct xe_device_desc lnl_desc = {
 	PLATFORM(LUNARLAKE),
 	.dma_mask_size = 46,
 	.has_display = true,
+	.has_flat_ccs = 1,
 	.has_pxp = true,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
@@ -342,6 +341,7 @@ static const struct xe_device_desc bmg_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.has_fan_control = true,
+	.has_flat_ccs = 1,
 	.has_mbx_power_limits = true,
 	.has_gsc_nvm = 1,
 	.has_heci_cscfi = 1,
@@ -357,6 +357,7 @@ static const struct xe_device_desc ptl_desc = {
 	PLATFORM(PANTHERLAKE),
 	.dma_mask_size = 46,
 	.has_display = true,
+	.has_flat_ccs = 1,
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
@@ -606,6 +607,8 @@ static int xe_info_init_early(struct xe_device *xe,
 
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_fan_control = desc->has_fan_control;
+	/* runtime fusing may force flat_ccs to disabled later */
+	xe->info.has_flat_ccs = desc->has_flat_ccs;
 	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
 	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
@@ -738,9 +741,6 @@ static int xe_info_init(struct xe_device *xe,
 	if (xe->info.platform != XE_PVC)
 		xe->info.has_device_atomics_on_smem = 1;
 
-	/* Runtime detection may change this later */
-	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
-
 	xe->info.has_range_tlb_inval = graphics_desc->has_range_tlb_inval;
 	xe->info.has_usm = graphics_desc->has_usm;
 	xe->info.has_64bit_timestamp = graphics_desc->has_64bit_timestamp;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 3189bd95bb6e..a4451bdc79fb 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -39,6 +39,7 @@ struct xe_device_desc {
 
 	u8 has_display:1;
 	u8 has_fan_control:1;
+	u8 has_flat_ccs:1;
 	u8 has_gsc_nvm:1;
 	u8 has_heci_gscfi:1;
 	u8 has_heci_cscfi:1;
@@ -59,7 +60,6 @@ struct xe_graphics_desc {
 
 	u8 has_asid:1;
 	u8 has_atomic_enable_pte_bit:1;
-	u8 has_flat_ccs:1;
 	u8 has_indirect_ring_state:1;
 	u8 has_range_tlb_inval:1;
 	u8 has_usm:1;
-- 
2.51.0

