Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836E1C54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 14:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE2D10EAFA;
	Thu, 21 Mar 2024 14:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="giqd1OLn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC2710EAFA
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 14:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711031132; x=1742567132;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tHZIye7KXWWIhSCk68r5+uJUpKFaxW3lEEP7jZc8Nz8=;
 b=giqd1OLnUdiR1etHU+1cBrfVUCv2xd8l9SF6d40E/1+XcdvqLKaH/xZG
 /v7b1FDKNf0niqJC4uuYeXyepLpIFJTtgDPIG9uVCBddogf6XDFnpL7ar
 ucOdXrAMy6gwWanswLhj3LHbYZmPCI42TXvE6D2LTk1QMT9OE4lsrU9tK
 9IqkBANiR75TjsIlVUMuqZdW65E1woQsLY0pSt+o/VRoFYY3rfUi0uoxk
 JyDhfX3U8BzQzu+NlruLK24Bk0XZUQotoMdVhiDuZbtWkgvRBNsPBELDg
 qGeQkwQuxYswLiXopaDfiTSDXYS8g7P2xw7gdTlDft29khu8aeYpu1Ep0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="17469184"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="17469184"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 07:25:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="37633312"
Received: from wanxiufe-mobl.ccr.corp.intel.com (HELO 0f71f048c3a7.intel.com)
 ([10.252.54.215])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 07:25:30 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Robert Krzemien <robert.krzemien@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v4 2/2] drm/xe/uapi: Add L3 bank mask to topology query
Date: Thu, 21 Mar 2024 14:25:21 +0000
Message-Id: <20240321142521.7-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321142521.7-1-francois.dugast@intel.com>
References: <20240321142521.7-1-francois.dugast@intel.com>
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

Extend the existing topology uAPI to expose the masks of L3 banks
to user space. L3 count is not sufficient because in some configuration
not all banks are enabled. User space needs to know which ones are
enabled, in the context of OA.

v2:
- Remove "Fixes" and make uAPI change explicit in commit message
  (Lucas De Marchi and Matt Roper)
- Add separate conditions for Xe2 and for PVC (Matt Roper)
- Return the L3 bank mask instead of the L3 node mask and the L3
  banks per node mask, as the node mask can be derived from the
  bank mask by user space, just like slice masks are derived from
  subslice masks today (Francois Dugast)

v3: Use TOPO_NUMBER_OF_MASKS for the number of masks (Zhanjun Dong)

Bspec: 52545, 52546, 62482
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Robert Krzemien <robert.krzemien@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 ++
 drivers/gpu/drm/xe/xe_gt_topology.c  | 72 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h     | 14 ++++--
 drivers/gpu/drm/xe/xe_query.c        | 12 ++++-
 include/uapi/drm/xe_drm.h            |  1 +
 5 files changed, 96 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 95969935f58b..be5b4936eb53 100644
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
index fa8de1a77b1e..961ca22918cd 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -23,7 +23,7 @@
 #include "xe_mmio.h"
 #include "xe_ttm_vram_mgr.h"
 
-#define TOPO_NUMBER_OF_MASKS   (3)
+#define TOPO_NUMBER_OF_MASKS   (4)
 
 static const u16 xe_to_user_engine_class[] = {
 	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
@@ -459,7 +459,8 @@ static size_t calc_topo_query_size(struct xe_device *xe)
 		 * sizeof(struct drm_xe_query_topology_mask) +
 		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
 		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
-		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
+		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss) +
+		 sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask));
 }
 
 static int copy_mask(void __user **ptr,
@@ -518,6 +519,13 @@ static int query_gt_topology(struct xe_device *xe,
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

