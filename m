Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA6AC47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 15:38:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764CB10FB98;
	Fri, 26 Jan 2024 15:38:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C94810FBB9
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 15:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706283535; x=1737819535;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZRxXtWv2NM8ECQ7glJFVx3yXZglZMrpiJ0fqSZqkVZM=;
 b=YxcZkBfFpNa4d5M+1w/2r9WRwIMQzxAzdIMFbDHKim3TOhkpDyTedqsa
 8iM2E+NX83BOlxPSmG8WlL26dTG8h68YsDtok2EXDLSKYQz5R/lClFepx
 bBC8CgGh6gMJ6Xdp/f1GHAUeHIYSGGw2aMh1ws/Oqn6Q8VawiwTmK+mFv
 zk+ykLgys3SHEGln4R14OxsPr7J2pwd+x5x+Jx4DBWr7eWy7tgB9nnOMR
 TQnXcYiM8FLq77bQL+s+iKjk3hk9dZUE4foFkRw4tPCDMHvIHe6BEs8o+
 RMSBCa9COu8kB3XP0deTXzv4Mhpkv/tm8nsQjhQKBpfB1YE6y5fPSNH62 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="402155375"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="402155375"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 07:38:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2608302"
Received: from mmensche-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.57.201])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 07:38:54 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Add L3 bank and node masks to topology query
Date: Fri, 26 Jan 2024 15:38:40 +0000
Message-Id: <20240126153840.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Robert Krzemien <robert.krzemien@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Expose the masks of L3 banks and of L3 nodes to user space. L3 count is not
sufficient because in some configuration not all banks are enabled, so user
space needs to know which ones.

Bspec: 52545, 52546, 62482
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Robert Krzemien <robert.krzemien@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
 drivers/gpu/drm/xe/xe_gt_topology.c  | 38 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h     | 14 ++++++++--
 drivers/gpu/drm/xe/xe_query.c        | 20 +++++++++++++--
 include/uapi/drm/xe_drm.h            |  2 ++
 5 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index cd27480f6486..f8606649d1e2 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -156,6 +156,7 @@
 #define	MIRROR_FUSE3				XE_REG(0x9118)
 #define   XE2_NODE_ENABLE_MASK			REG_GENMASK(31, 16)
 #define   L3BANK_PAIR_COUNT			4
+#define   L3MODE_MASK				REG_GENMASK(7, 4)
 #define   L3BANK_MASK				REG_GENMASK(3, 0)
 /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
 #define   MAX_MSLICES				4
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index a8d7f272c30a..6f4cf147a7aa 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -13,6 +13,8 @@
 
 #define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
 #define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
+#define XE_MAX_L3_BANK_FUSE_BITS (32 * XE_MAX_L3_BANK_FUSE_REGS)
+#define XE_MAX_L3_NODE_FUSE_BITS (32 * XE_MAX_L3_NODE_FUSE_REGS)
 
 static void
 load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
@@ -62,6 +64,36 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
 	bitmap_from_arr32(mask, &val, XE_MAX_EU_FUSE_BITS);
 }
 
+static void
+load_l3_masks(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask,
+	      xe_l3_node_mask_t l3_node_mask)
+{
+	u32 bank, node;
+
+	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
+		node = REG_FIELD_GET(MEML3_EN_MASK,
+				     xe_mmio_read32(gt, MIRROR_FUSE3));
+		bank = REG_FIELD_GET(GT_L3_EXC_MASK,
+				     xe_mmio_read32(gt, XEHP_FUSE4));
+	} else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250) {
+		node = REG_FIELD_GET(MEML3_EN_MASK,
+				     xe_mmio_read32(gt, MIRROR_FUSE3));
+		bank = REG_FIELD_GET(L3MODE_MASK,
+				     xe_mmio_read32(gt, MIRROR_FUSE3));
+	} else {
+		/*
+		 * Here the mask logic is reversed: a bit is set if the bank is
+		 * disabled.
+		 */
+		bank = REG_FIELD_GET(L3BANK_MASK,
+				     ~xe_mmio_read32(gt, MIRROR_FUSE3));
+		node = 0; /* Unused */
+	}
+
+	bitmap_from_arr32(l3_bank_mask, &bank, XE_MAX_L3_BANK_FUSE_BITS);
+	bitmap_from_arr32(l3_node_mask, &node, XE_MAX_L3_NODE_FUSE_BITS);
+}
+
 static void
 get_num_dss_regs(struct xe_device *xe, int *geometry_regs, int *compute_regs)
 {
@@ -106,6 +138,8 @@ xe_gt_topology_init(struct xe_gt *gt)
 		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
 		      XE2_GT_COMPUTE_DSS_2);
 	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
+	load_l3_masks(gt, gt->fuse_topo.l3_bank_mask,
+		      gt->fuse_topo.l3_node_mask);
 
 	xe_gt_topology_dump(gt, &p);
 }
@@ -121,6 +155,10 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
 	drm_printf(p, "EU mask per DSS:     %*pb\n", XE_MAX_EU_FUSE_BITS,
 		   gt->fuse_topo.eu_mask_per_dss);
 
+	drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_FUSE_BITS,
+		   gt->fuse_topo.l3_bank_mask);
+	drm_printf(p, "L3 node mask:        %*pb\n", XE_MAX_L3_NODE_FUSE_BITS,
+		   gt->fuse_topo.l3_node_mask);
 }
 
 /*
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 70c615dd1498..adb1de613e77 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -24,11 +24,15 @@ enum xe_gt_type {
 	XE_GT_TYPE_MEDIA,
 };
 
-#define XE_MAX_DSS_FUSE_REGS	3
-#define XE_MAX_EU_FUSE_REGS	1
+#define XE_MAX_DSS_FUSE_REGS		3
+#define XE_MAX_EU_FUSE_REGS		1
+#define XE_MAX_L3_BANK_FUSE_REGS	1
+#define XE_MAX_L3_NODE_FUSE_REGS	1
 
 typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
 typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
+typedef unsigned long xe_l3_bank_mask_t[BITS_TO_LONGS(32 * XE_MAX_L3_BANK_FUSE_REGS)];
+typedef unsigned long xe_l3_node_mask_t[BITS_TO_LONGS(32 * XE_MAX_L3_NODE_FUSE_REGS)];
 
 struct xe_mmio_range {
 	u32 start;
@@ -332,6 +336,12 @@ struct xe_gt {
 
 		/** @fuse_topo.eu_mask_per_dss: EU mask per DSS*/
 		xe_eu_mask_t eu_mask_per_dss;
+
+		/** @l3_bank_mask: L3 bank mask */
+		xe_l3_bank_mask_t l3_bank_mask;
+
+		/** @l3_node_mask: L3 node mask */
+		xe_l3_node_mask_t l3_node_mask;
 	} fuse_topo;
 
 	/** @steering: register steering for individual HW units */
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 9b35673b286c..fe3906e8f721 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -453,10 +453,12 @@ static int query_hwconfig(struct xe_device *xe,
 static size_t calc_topo_query_size(struct xe_device *xe)
 {
 	return xe->info.gt_count *
-		(3 * sizeof(struct drm_xe_query_topology_mask) +
+		(5 * sizeof(struct drm_xe_query_topology_mask) +
 		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
 		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
-		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
+		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss) +
+		 sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask) +
+		 sizeof_field(struct xe_gt, fuse_topo.l3_node_mask));
 }
 
 static void __user *copy_mask(void __user *ptr,
@@ -515,6 +517,20 @@ static int query_gt_topology(struct xe_device *xe,
 				      sizeof(gt->fuse_topo.eu_mask_per_dss));
 		if (IS_ERR(query_ptr))
 			return PTR_ERR(query_ptr);
+
+		topo.type = DRM_XE_TOPO_L3_BANK;
+		query_ptr = copy_mask(query_ptr, &topo,
+				      gt->fuse_topo.l3_bank_mask,
+				      sizeof(gt->fuse_topo.l3_bank_mask));
+		if (IS_ERR(query_ptr))
+			return PTR_ERR(query_ptr);
+
+		topo.type = DRM_XE_TOPO_L3_NODE;
+		query_ptr = copy_mask(query_ptr, &topo,
+				      gt->fuse_topo.l3_node_mask,
+				      sizeof(gt->fuse_topo.l3_node_mask));
+		if (IS_ERR(query_ptr))
+			return PTR_ERR(query_ptr);
 	}
 
 	return 0;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 50bbea0992d9..eca8f5f502c3 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -513,6 +513,8 @@ struct drm_xe_query_topology_mask {
 #define DRM_XE_TOPO_DSS_GEOMETRY	(1 << 0)
 #define DRM_XE_TOPO_DSS_COMPUTE		(1 << 1)
 #define DRM_XE_TOPO_EU_PER_DSS		(1 << 2)
+#define DRM_XE_TOPO_L3_BANK		(1 << 3)
+#define DRM_XE_TOPO_L3_NODE		(1 << 4)
 	/** @type: type of mask */
 	__u16 type;
 
-- 
2.34.1

