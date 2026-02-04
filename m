Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F94E8B386
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 00:25:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D030D10E555;
	Wed,  4 Feb 2026 00:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UHgd7ZKo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8094210E555
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 00:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770164756; x=1801700756;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H0XcZDVo7CX2b7C6K6j7R85Iragaf5a7DEQ3j+N2E5c=;
 b=UHgd7ZKodAFCwryn25lnzwGPdYzzBAhxCInPVomjMaCEpn8r5Hp6BYEY
 1d2lUsYHnXQsjUsdLfC9e0WXezlC/LfRPFlaHXptcnsWoQCZBBrS9PZqA
 StMFBf/DqpPFSsME8K9YPZux2/mXDGbLteWVKwUUtkO6YbfxtB3OdStb/
 cyZOQ8lTdrdNUrbUvakZqHoqI7dpRm+fk14YDsCoY7hY2LwD7qtO7p7ZM
 Ie0K8tCF+85jxpdiSRL2OBb5B65e+kQ4EI4zJbEMXgDCEs8fLgJaaeRSl
 LAcZvHRdsUSrp9Sf/NujK+RUmDpS6Ktvos9qhNrut7ySMTTVWiiQHeFw8 A==;
X-CSE-ConnectionGUID: qAzIqM7WQ1yZ5mOYowMqAw==
X-CSE-MsgGUID: ix5rZMsRS9agG8WC/fI3bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82716518"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="82716518"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 16:25:55 -0800
X-CSE-ConnectionGUID: EiuwlsX+THCdDMmQgPI4EA==
X-CSE-MsgGUID: KPE1zSEAQlWi1/TfnrXnww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="210087586"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 16:25:55 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 1/2] drm/xe: Move number of XeCore fuse registers to graphics
 descriptor
Date: Tue,  3 Feb 2026 16:25:50 -0800
Message-ID: <20260204002549.3888274-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.52.0
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

The number of registers used to express the XeCore mask has some
"special cases" that don't always get inherited by later IP versions so
it's cleaner and simpler to record the numbers in the IP descriptor
rather than adding extra conditions to the standalone get_num_dss_regs()
function.

Note that a minor change here is that we now always treat the number of
registers as 0 for the media GT.  Technically a copy of these fuse
registers does exist in the media GT as well (at the usual
0x380000+$offset location), but the value of those is always supposed to
read back as 0 because media GTs never have any XeCores or EUs.

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 37 ++++++-----------------------
 drivers/gpu/drm/xe/xe_gt_types.h    | 10 ++++++++
 drivers/gpu/drm/xe/xe_pci.c         | 12 ++++++++++
 drivers/gpu/drm/xe/xe_pci_types.h   |  2 ++
 4 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index bd5260221d8d..575dcfd5eb9d 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -205,24 +205,6 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
 	}
 }
 
-static void
-get_num_dss_regs(struct xe_device *xe, int *geometry_regs, int *compute_regs)
-{
-	if (GRAPHICS_VER(xe) > 20) {
-		*geometry_regs = 3;
-		*compute_regs = 3;
-	} else if (GRAPHICS_VERx100(xe) == 1260) {
-		*geometry_regs = 0;
-		*compute_regs = 2;
-	} else if (GRAPHICS_VERx100(xe) >= 1250) {
-		*geometry_regs = 1;
-		*compute_regs = 1;
-	} else {
-		*geometry_regs = 1;
-		*compute_regs = 0;
-	}
-}
-
 void
 xe_gt_topology_init(struct xe_gt *gt)
 {
@@ -236,23 +218,19 @@ xe_gt_topology_init(struct xe_gt *gt)
 		XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
 		XE2_GT_COMPUTE_DSS_2,
 	};
-	int num_geometry_regs, num_compute_regs;
-	struct xe_device *xe = gt_to_xe(gt);
 	struct drm_printer p;
 
-	get_num_dss_regs(xe, &num_geometry_regs, &num_compute_regs);
-
 	/*
 	 * Register counts returned shouldn't exceed the number of registers
 	 * passed as parameters below.
 	 */
-	xe_gt_assert(gt, num_geometry_regs <= ARRAY_SIZE(geometry_regs));
-	xe_gt_assert(gt, num_compute_regs <= ARRAY_SIZE(compute_regs));
+	xe_gt_assert(gt, gt->info.num_geometry_xecore_fuse_regs <= ARRAY_SIZE(geometry_regs));
+	xe_gt_assert(gt, gt->info.num_compute_xecore_fuse_regs <= ARRAY_SIZE(compute_regs));
 
 	load_dss_mask(gt, gt->fuse_topo.g_dss_mask,
-		      num_geometry_regs, geometry_regs);
+		      gt->info.num_geometry_xecore_fuse_regs, geometry_regs);
 	load_dss_mask(gt, gt->fuse_topo.c_dss_mask,
-		      num_compute_regs, compute_regs);
+		      gt->info.num_compute_xecore_fuse_regs, compute_regs);
 
 	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss, &gt->fuse_topo.eu_type);
 	load_l3_bank_mask(gt, gt->fuse_topo.l3_bank_mask);
@@ -330,15 +308,14 @@ xe_l3_bank_mask_ffs(const xe_l3_bank_mask_t mask)
  */
 bool xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad)
 {
-	struct xe_device *xe = gt_to_xe(gt);
 	xe_dss_mask_t all_dss;
-	int g_dss_regs, c_dss_regs, dss_per_quad, quad_first;
+	int dss_per_quad, quad_first;
 
 	bitmap_or(all_dss, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
 		  XE_MAX_DSS_FUSE_BITS);
 
-	get_num_dss_regs(xe, &g_dss_regs, &c_dss_regs);
-	dss_per_quad = 32 * max(g_dss_regs, c_dss_regs) / 4;
+	dss_per_quad = 32 * max(gt->info.num_geometry_xecore_fuse_regs,
+				gt->info.num_compute_xecore_fuse_regs) / 4;
 
 	quad_first = xe_dss_mask_group_ffs(all_dss, dss_per_quad, quad);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 5318d92fd473..bede105f37b4 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -149,6 +149,16 @@ struct xe_gt {
 		u8 id;
 		/** @info.has_indirect_ring_state: GT has indirect ring state support */
 		u8 has_indirect_ring_state:1;
+		/**
+		 * @info.num_geometry_xecore_fuse_regs: Number of 32b-bit fuse
+		 * registers the geometry XeCore mask spans.
+		 */
+		u8 num_geometry_xecore_fuse_regs;
+		/**
+		 * @info.num_compute_xecore_fuse_regs: Number of 32b-bit fuse
+		 * registers the compute XeCore mask spans.
+		 */
+		u8 num_compute_xecore_fuse_regs;
 	} info;
 
 #if IS_ENABLED(CONFIG_DEBUG_FS)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b5e8935fff1d..e3a574835f35 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -52,6 +52,7 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 
 static const struct xe_graphics_desc graphics_xelp = {
 	.hw_engine_mask = BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0),
+	.num_geometry_xecore_fuse_regs = 1,
 };
 
 #define XE_HP_FEATURES \
@@ -62,6 +63,8 @@ static const struct xe_graphics_desc graphics_xehpg = {
 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
 		BIT(XE_HW_ENGINE_CCS0) | BIT(XE_HW_ENGINE_CCS1) |
 		BIT(XE_HW_ENGINE_CCS2) | BIT(XE_HW_ENGINE_CCS3),
+	.num_geometry_xecore_fuse_regs = 1,
+	.num_compute_xecore_fuse_regs = 1,
 
 	XE_HP_FEATURES,
 };
@@ -81,12 +84,15 @@ static const struct xe_graphics_desc graphics_xehpc = {
 	.has_asid = 1,
 	.has_atomic_enable_pte_bit = 1,
 	.has_usm = 1,
+	.num_compute_xecore_fuse_regs = 2,
 };
 
 static const struct xe_graphics_desc graphics_xelpg = {
 	.hw_engine_mask =
 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
 		BIT(XE_HW_ENGINE_CCS0),
+	.num_geometry_xecore_fuse_regs = 1,
+	.num_compute_xecore_fuse_regs = 1,
 
 	XE_HP_FEATURES,
 };
@@ -104,6 +110,8 @@ static const struct xe_graphics_desc graphics_xelpg = {
 
 static const struct xe_graphics_desc graphics_xe2 = {
 	XE2_GFX_FEATURES,
+	.num_geometry_xecore_fuse_regs = 3,
+	.num_compute_xecore_fuse_regs = 3,
 };
 
 static const struct xe_graphics_desc graphics_xe3p_xpc = {
@@ -114,6 +122,8 @@ static const struct xe_graphics_desc graphics_xe3p_xpc = {
 		GENMASK(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0),
 	.multi_queue_engine_class_mask = BIT(XE_ENGINE_CLASS_COPY) |
 					 BIT(XE_ENGINE_CLASS_COMPUTE),
+	.num_geometry_xecore_fuse_regs = 3,
+	.num_compute_xecore_fuse_regs = 3,
 };
 
 static const struct xe_media_desc media_xem = {
@@ -783,6 +793,8 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
 	gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
 	gt->info.multi_queue_engine_class_mask = graphics_desc->multi_queue_engine_class_mask;
 	gt->info.engine_mask = graphics_desc->hw_engine_mask;
+	gt->info.num_geometry_xecore_fuse_regs = graphics_desc->num_geometry_xecore_fuse_regs;
+	gt->info.num_compute_xecore_fuse_regs = graphics_desc->num_compute_xecore_fuse_regs;
 
 	/*
 	 * Before media version 13, the media IP was part of the primary GT
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 8b2ff3f25607..470d31a1f0d6 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -66,6 +66,8 @@ struct xe_device_desc {
 struct xe_graphics_desc {
 	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
 	u16 multi_queue_engine_class_mask; /* bitmask of engine classes which support multi queue */
+	u8 num_geometry_xecore_fuse_regs;
+	u8 num_compute_xecore_fuse_regs;
 
 	u8 has_asid:1;
 	u8 has_atomic_enable_pte_bit:1;
-- 
2.52.0

