Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F44BC54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 11:14:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC27C10E100;
	Mon, 25 Mar 2024 11:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZXumRGS4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FDC10E79A
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 11:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711365294; x=1742901294;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lYD4aMYkBFMLwsiyDVIiOpaZk+L5zLHrnUVzTw1Al2Q=;
 b=ZXumRGS4ZL60jEhhrDGPyvJOgbuLtRwlHu+irebbmTSKcLICP1G1QwwC
 PLlupWA+DniLEYB5e9qn/MYIR9g2j6vYoLhluVNmIOQj136Bn9mhAI0of
 fxqJ0RiAGs2nc+kII1wJ3MlWBaCbzxEKDsjcxxCkg1dZGt/yz4XfPs5xB
 cwM9Ga9JDY3C3g6sEnhGvhfgpypYRNRGLoUYUoj8+raH3tmsa8AM56Ia9
 2hMWx3/9wCfgBAlWmovDv7vylnfwH6BNCrkn/qKV4HzfvzISmHbYpx+pi
 hSH9gF3k63gzgqHVqY54CQYIbWwRCaH+Ikg6h82mlr8bcdi2MWyuhskDQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="10153791"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="10153791"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 04:14:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="15987913"
Received: from jbernspa-mobl1.ger.corp.intel.com (HELO 910b9a07225d.intel.com)
 ([10.252.55.154])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 04:14:51 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Robert Krzemien <robert.krzemien@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 2/2] drm/xe/uapi: Add L3 bank mask to topology query
Date: Mon, 25 Mar 2024 11:14:39 +0000
Message-Id: <20240325111439.7-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325111439.7-1-francois.dugast@intel.com>
References: <20240325111439.7-1-francois.dugast@intel.com>
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

The Metrics Discovery Application Programming Interface (MDAPI) exposes
disaggregated metrics only for available instances of hardware, therefore
it needs to know exactly which L3 banks are enabled on the device. The L3
count is not sufficient information as in some configurations the L3
banks might be individually enabled or disabled. This is why the topology
query is here extended to provide the L3 bank mask.

v2:
- Remove "Fixes" and make uAPI change explicit in commit message
  (Lucas De Marchi and Matt Roper)
- Add separate conditions for Xe2 and for PVC (Matt Roper)
- Return the L3 bank mask instead of the L3 node mask and the L3
  banks per node mask, as the node mask can be derived from the
  bank mask by user space, just like slice masks are derived from
  subslice masks today (Francois Dugast)

v3: Use TOPO_NUMBER_OF_MASKS for the number of masks (Zhanjun Dong)

v4: Detail the user space need in commit message (Lucas De Marchi)

Bspec: 52545, 52546, 62482
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Robert Krzemien <robert.krzemien@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://github.com/intel/metrics-discovery
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 ++
 drivers/gpu/drm/xe/xe_gt_topology.c  | 72 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h     | 14 ++++--
 drivers/gpu/drm/xe/xe_query.c        | 12 ++++-
 include/uapi/drm/xe_drm.h            |  1 +
 5 files changed, 96 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 65af9fe95db5..03388c69af1b 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -156,7 +156,10 @@
 #define	MIRROR_FUSE3				XE_REG(0x9118)
 #define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31, 16)
 #define   L3BANK_PAIR_COUNT			4
+#define   XEHPC_GT_L3_MODE_MASK			REG_GENMASK(7, 4)
+#define   XE2_GT_L3_MODE_MASK			REG_GENMASK(7, 4)
 #define   L3BANK_MASK				REG_GENMASK(3, 0)
+#define   XELP_GT_L3_MODE_MASK			REG_GENMASK(7, 0)
 /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
 #define   MAX_MSLICES				4
 #define   MEML3_EN_MASK				REG_GENMASK(3, 0)
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index f5773a14f3c8..8920426332dd 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -59,6 +59,75 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
 	bitmap_from_arr32(mask, &val, XE_MAX_EU_FUSE_BITS);
 }
 
+static void
+load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	u64 node_mask, bank_mask = 0;
+	u64 banks_per_node_fuse, banks_per_node_mask = 0;
+	int i;
+
+	if (GRAPHICS_VER(xe) >= 20) {
+		node_mask =
+			REG_FIELD_GET(XE2_NODE_ENABLE_MASK,
+				      xe_mmio_read32(gt, MIRROR_FUSE3));
+		banks_per_node_mask =
+			REG_FIELD_GET(XE2_GT_L3_MODE_MASK,
+				      xe_mmio_read32(gt, MIRROR_FUSE3));
+		for (i = 0; i < fls(node_mask); i++)
+			if (node_mask & BIT(i))
+				bank_mask |= banks_per_node_mask << 4 * i;
+	} else if (GRAPHICS_VERx100(xe) >= 1270) {
+		node_mask =
+			REG_FIELD_GET(MEML3_EN_MASK,
+				      xe_mmio_read32(gt, MIRROR_FUSE3));
+		banks_per_node_fuse =
+			REG_FIELD_GET(GT_L3_EXC_MASK,
+				      xe_mmio_read32(gt, XEHP_FUSE4));
+		/* Each bit represents 2 banks in the node. */
+		for (i = 0; i < fls(banks_per_node_fuse); i++)
+			if (banks_per_node_fuse & BIT(i))
+				banks_per_node_mask |= 0x3 << 2 * i;
+		for (i = 0; i < fls(node_mask); i++)
+			if (node_mask & BIT(i))
+				bank_mask |= banks_per_node_mask << 4 * i;
+	} else if (xe->info.platform == XE_PVC) {
+		node_mask =
+			REG_FIELD_GET(MEML3_EN_MASK,
+				      xe_mmio_read32(gt, MIRROR_FUSE3));
+		banks_per_node_fuse =
+			REG_FIELD_GET(XEHPC_GT_L3_MODE_MASK,
+				      xe_mmio_read32(gt, MIRROR_FUSE3));
+		/* Each bit represents 4 banks in the node. */
+		for (i = 0; i < fls(banks_per_node_fuse); i++)
+			if (banks_per_node_fuse & BIT(i))
+				banks_per_node_mask |= 0xf << 4 * i;
+		for (i = 0; i < fls(node_mask); i++)
+			if (node_mask & BIT(i))
+				bank_mask |= banks_per_node_mask << 16 * i;
+	} else if (xe->info.platform == XE_DG2) {
+		node_mask =
+			REG_FIELD_GET(MEML3_EN_MASK,
+				      xe_mmio_read32(gt, MIRROR_FUSE3));
+		/*
+		 * In this case, if a node is present then all 8 banks inside of
+		 * it are present.
+		 */
+		for (i = 0; i < fls(node_mask); i++)
+			if (node_mask & BIT(i))
+				bank_mask |= 0xfful << 8 * i;
+	} else {
+		/*
+		 * Here the mask logic is reversed: a bit is set if the bank is
+		 * disabled.
+		 */
+		bank_mask = REG_FIELD_GET(XELP_GT_L3_MODE_MASK,
+					  ~xe_mmio_read32(gt, MIRROR_FUSE3));
+	}
+
+	bitmap_from_arr64(l3_bank_mask, &bank_mask, XE_MAX_L3_BANK_FUSE_BITS);
+}
+
 static void
 get_num_dss_regs(struct xe_device *xe, int *geometry_regs, int *compute_regs)
 {
@@ -103,6 +172,7 @@ xe_gt_topology_init(struct xe_gt *gt)
 		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
 		      XE2_GT_COMPUTE_DSS_2);
 	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
+	load_l3_bank_mask(gt, gt->fuse_topo.l3_bank_mask);
 
 	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, "GT topology");
 
@@ -120,6 +190,8 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
 	drm_printf(p, "EU mask per DSS:     %*pb\n", XE_MAX_EU_FUSE_BITS,
 		   gt->fuse_topo.eu_mask_per_dss);
 
+	drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_FUSE_BITS,
+		   gt->fuse_topo.l3_bank_mask);
 }
 
 /*
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index f6da2ad9719f..e1438a478f94 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -24,13 +24,16 @@ enum xe_gt_type {
 	XE_GT_TYPE_MEDIA,
 };
 
-#define XE_MAX_DSS_FUSE_REGS	3
-#define XE_MAX_DSS_FUSE_BITS	(32 * XE_MAX_DSS_FUSE_REGS)
-#define XE_MAX_EU_FUSE_REGS	1
-#define XE_MAX_EU_FUSE_BITS	(32 * XE_MAX_EU_FUSE_REGS)
+#define XE_MAX_DSS_FUSE_REGS		3
+#define XE_MAX_DSS_FUSE_BITS		(32 * XE_MAX_DSS_FUSE_REGS)
+#define XE_MAX_EU_FUSE_REGS		1
+#define XE_MAX_EU_FUSE_BITS		(32 * XE_MAX_EU_FUSE_REGS)
+#define XE_MAX_L3_BANK_FUSE_REGS	2
+#define XE_MAX_L3_BANK_FUSE_BITS	(32 * XE_MAX_L3_BANK_FUSE_REGS)
 
 typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];
 typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(XE_MAX_EU_FUSE_BITS)];
+typedef unsigned long xe_l3_bank_mask_t[BITS_TO_LONGS(XE_MAX_L3_BANK_FUSE_BITS)];
 
 struct xe_mmio_range {
 	u32 start;
@@ -334,6 +337,9 @@ struct xe_gt {
 
 		/** @fuse_topo.eu_mask_per_dss: EU mask per DSS*/
 		xe_eu_mask_t eu_mask_per_dss;
+
+		/** @l3_bank_mask: L3 bank mask */
+		xe_l3_bank_mask_t l3_bank_mask;
 	} fuse_topo;
 
 	/** @steering: register steering for individual HW units */
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 109a96212310..e026d993f246 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -23,7 +23,7 @@
 #include "xe_mmio.h"
 #include "xe_ttm_vram_mgr.h"
 
-#define TOPO_NUMBER_OF_MASKS   (3)
+#define TOPO_NUMBER_OF_MASKS   (4)
 
 static const u16 xe_to_user_engine_class[] = {
 	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
@@ -460,7 +460,8 @@ static size_t calc_topo_query_size(struct xe_device *xe)
 		 * sizeof(struct drm_xe_query_topology_mask) +
 		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
 		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
-		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
+		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss) +
+		 sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask));
 }
 
 static int copy_mask(void __user **ptr,
@@ -519,6 +520,13 @@ static int query_gt_topology(struct xe_device *xe,
 				sizeof(gt->fuse_topo.eu_mask_per_dss));
 		if (err)
 			return err;
+
+		topo.type = DRM_XE_TOPO_L3_BANK;
+		err = copy_mask(&query_ptr, &topo,
+				gt->fuse_topo.l3_bank_mask,
+				sizeof(gt->fuse_topo.l3_bank_mask));
+		if (err)
+			return err;
 	}
 
 	return 0;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 808ad1c308ec..aa917308cdeb 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -521,6 +521,7 @@ struct drm_xe_query_topology_mask {
 #define DRM_XE_TOPO_DSS_GEOMETRY	(1 << 0)
 #define DRM_XE_TOPO_DSS_COMPUTE		(1 << 1)
 #define DRM_XE_TOPO_EU_PER_DSS		(1 << 2)
+#define DRM_XE_TOPO_L3_BANK		(1 << 3)
 	/** @type: type of mask */
 	__u16 type;
 
-- 
2.34.1

