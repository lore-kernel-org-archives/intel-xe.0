Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2467DCAC5BE
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 23:46:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4019610E9D4;
	Thu, 25 Sep 2025 23:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PbMVL6PG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67D810E30A
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 23:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758844007; x=1790380007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FnKE7A7bBK1LqWK5OKD28/CH6GTVVo8ZQ2mg5D4C77Y=;
 b=PbMVL6PGfCb7eu1N9CVVrLDIPjPaQHS8s9K5NbPf7/vMFN8MFI2ROdqh
 pco90b7kvGj5m1BFbNXDXlRp9LAQBYI/9jrSM37q2QW6BpFtVFlq0mttC
 +xrC7OKmRy5v95QzCAfKswWqzJKn2dgIgLP7/ULkeacp46pCK9tZ0ocqk
 4JyGKP8n1adVgiLCrLLCCjPKhzNlCjSjidcLkkDSKUAQ1V06BgwG5NbJi
 RaZ0U4dCM1YTOtHvkBotpl/toqBO00kOnT3c9NmH+6VhStILzI3U+6LMS
 vWia+CT7StT/5kh+vFSLHmTRu+DT7v5kGGplyDUpUOy7Crbgwfi8ap8zF g==;
X-CSE-ConnectionGUID: rzyQGva3Sr63jy3XbemPEA==
X-CSE-MsgGUID: 59XdJ86sRA+dqBvPrf2BCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78817668"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="78817668"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
X-CSE-ConnectionGUID: QJvJ5suxQYiOJ1ZkK7Xs3w==
X-CSE-MsgGUID: WOdGTowUTMez1vq2VCwqEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="181852962"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 06/22] drm/xe: Move 'has_flatccs' flag back to platform
 descriptor
Date: Thu, 25 Sep 2025 16:46:34 -0700
Message-ID: <20250925234628.2112163-30-matthew.d.roper@intel.com>
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

FlatCCS presence/absence is a flag that should be tracked at the
platform level rather than the IP level.  FlatCCS affects the
device-wide memory initialization and reservations so its effects are
not confined to a single IP block or GT.  This is also a trait that
should be tied to the platform even if the graphics IP itself is not
present (e.g., if we disable the primary GT via configfs).

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c       | 12 ++++++------
 drivers/gpu/drm/xe/xe_pci_types.h |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 21255ee5a830..976002aae301 100644
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
@@ -252,6 +249,7 @@ static const u16 dg2_g12_ids[] = { INTEL_DG2_G12_IDS(NOP), 0 };
 #define DG2_FEATURES \
 	DGFX_FEATURES, \
 	PLATFORM(DG2), \
+	.has_flat_ccs = 1, \
 	.has_gsc_nvm = 1, \
 	.has_heci_gscfi = 1, \
 	.subplatforms = (const struct xe_subplatform_desc[]) { \
@@ -318,6 +316,7 @@ static const struct xe_device_desc lnl_desc = {
 	PLATFORM(LUNARLAKE),
 	.dma_mask_size = 46,
 	.has_display = true,
+	.has_flat_ccs = 1,
 	.has_pxp = true,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
@@ -329,6 +328,7 @@ static const struct xe_device_desc bmg_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.has_fan_control = true,
+	.has_flat_ccs = 1,
 	.has_mbx_power_limits = true,
 	.has_gsc_nvm = 1,
 	.has_heci_cscfi = 1,
@@ -342,6 +342,7 @@ static const struct xe_device_desc ptl_desc = {
 	PLATFORM(PANTHERLAKE),
 	.dma_mask_size = 46,
 	.has_display = true,
+	.has_flat_ccs = 1,
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
 	.needs_scratch = true,
@@ -588,6 +589,8 @@ static int xe_info_init_early(struct xe_device *xe,
 
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.has_fan_control = desc->has_fan_control;
+	/* runtime fusing may force flat_ccs to disabled later */
+	xe->info.has_flat_ccs = desc->has_flat_ccs;
 	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
 	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
@@ -719,9 +722,6 @@ static int xe_info_init(struct xe_device *xe,
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

