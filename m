Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3A2C38150
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 05:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E2710E5B0;
	Wed, 10 Jul 2024 05:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YyZIN/VE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C8010E5B0
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 05:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720590891; x=1752126891;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bQNFM1cWIK/m6u+teXGJjDvQxgDZJH1KsjlmIPtlXaY=;
 b=YyZIN/VEJaC3DFOPkOx9uYe+fM6oF+XWBWRVgzJZrYfs/MBZsxfEM9TL
 NSOkONP2o4H/4c9Y2S/Atr7BypvMRixucrjdczyqjjxy56JHUL7t9/RpV
 fFOjiPKLex2UJ/opA5LcZHQ9tMsoWt7/KwV1xqUZNSZVRUjLmvGdc7Rg1
 9vV26obccXVEo6GdVqCBiS2GJRdz2h7y+cq0Ri+LEdYvoYtRyJ08Jyvuv
 hTS692EgD0oVEAjqmiywAPycV+tRCX5UfltWOkwQFNRauAunNbXS6tGm3
 hvIhTTpg61dK5zKWN8RpnyXxw8mwdM3HPNtI4QdYQCOiMJZBShdiXWj3m A==;
X-CSE-ConnectionGUID: I5H2x4BiTj2SCMPSYG/Z4A==
X-CSE-MsgGUID: nR0giPJgRhm2i9/0VytTAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="21655008"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="21655008"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 22:54:50 -0700
X-CSE-ConnectionGUID: 5nVl1zIKQNKuuzzAMf2bBw==
X-CSE-MsgGUID: vzHKpEd5RVu5Y90nJ4bVgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="78824374"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 22:54:50 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: jose.souza@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, fei.yang@intel.com,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe/uapi: Expose EU width via topology query
Date: Tue,  9 Jul 2024 22:53:54 -0700
Message-ID: <20240710055440.1985620-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

PVC, Xe2 and later platforms have a 16 wide EU. We were implicitly
reporting for PVC the number of 16-wide EUs without giving userspace any
hint that they were different than for other platforms. Xe2 and later
also have 16-wide, but in those case the reported number would
correspond to the 8-wide count.

Add a new item to the topology that aims to clarify what the EU_PER_DSS
mask means. This new item uses mask[] as a single u8 value. Xe2 and
later platforms start returning the number of SIMD16 EUs.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

Tested on TGL and LNL to check the behavior in dmesg, debugfs and ioctl.
Test-with: https://lore.kernel.org/igt-dev/20240710054446.1985069-1-lucas.demarchi@intel.com/

 drivers/gpu/drm/xe/xe_gt_topology.c | 13 ++++++++-----
 drivers/gpu/drm/xe/xe_gt_types.h    |  6 ++++++
 drivers/gpu/drm/xe/xe_query.c       | 12 ++++++++++--
 include/uapi/drm/xe_drm.h           | 20 ++++++++++++++++++++
 4 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 25ff03ab8448..55ae1c79048f 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -31,7 +31,7 @@ load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
 }
 
 static void
-load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
+load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask, u8 *eu_width)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 reg_val = xe_mmio_read32(gt, XELP_EU_ENABLE);
@@ -47,11 +47,13 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
 	if (GRAPHICS_VERx100(xe) < 1250)
 		reg_val = ~reg_val & XELP_EU_MASK;
 
-	/* On PVC, one bit = one EU */
-	if (GRAPHICS_VERx100(xe) == 1260) {
+	if (GRAPHICS_VERx100(xe) == 1260 || GRAPHICS_VER(xe) >= 20) {
+		/* SIMD16 EUs, one bit = one EU */
+		*eu_width = DRM_XE_TOPO_EU_WIDTH_SIMD16;
 		val = reg_val;
 	} else {
-		/* All other platforms, one bit = 2 EU */
+		/* SIMD8 EUs, one bit = 2 EU */
+		*eu_width = DRM_XE_TOPO_EU_WIDTH_SIMD8;
 		for (i = 0; i < fls(reg_val); i++)
 			if (reg_val & BIT(i))
 				val |= 0x3 << 2 * i;
@@ -213,7 +215,7 @@ xe_gt_topology_init(struct xe_gt *gt)
 		      XEHP_GT_COMPUTE_DSS_ENABLE,
 		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
 		      XE2_GT_COMPUTE_DSS_2);
-	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
+	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss, &gt->fuse_topo.eu_width);
 	load_l3_bank_mask(gt, gt->fuse_topo.l3_bank_mask);
 
 	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, "GT topology");
@@ -231,6 +233,7 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
 
 	drm_printf(p, "EU mask per DSS:     %*pb\n", XE_MAX_EU_FUSE_BITS,
 		   gt->fuse_topo.eu_mask_per_dss);
+	drm_printf(p, "EU width:            %u\n", gt->fuse_topo.eu_width);
 
 	drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_MASK_BITS,
 		   gt->fuse_topo.l3_bank_mask);
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 6b5e0b45efb0..71b4834080f5 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -343,6 +343,12 @@ struct xe_gt {
 
 		/** @fuse_topo.l3_bank_mask: L3 bank mask */
 		xe_l3_bank_mask_t l3_bank_mask;
+
+		/**
+		 * @fuse_topo.eu_width: EU width - SIMD8, SIMD16, etc. See
+		 * enum drm_xe_topo_eu_width.
+		 */
+		u8 eu_width;
 	} fuse_topo;
 
 	/** @steering: register steering for individual HW units */
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 4e01df6b1b7a..82c966b73302 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -455,11 +455,12 @@ static int query_hwconfig(struct xe_device *xe,
 static size_t calc_topo_query_size(struct xe_device *xe)
 {
 	return xe->info.gt_count *
-		(4 * sizeof(struct drm_xe_query_topology_mask) +
+		(5 * sizeof(struct drm_xe_query_topology_mask) +
 		 sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
 		 sizeof_field(struct xe_gt, fuse_topo.c_dss_mask) +
 		 sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask) +
-		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
+		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss) +
+		 sizeof_field(struct xe_gt, fuse_topo.eu_width));
 }
 
 static int copy_mask(void __user **ptr,
@@ -524,6 +525,13 @@ static int query_gt_topology(struct xe_device *xe,
 				sizeof(gt->fuse_topo.eu_mask_per_dss));
 		if (err)
 			return err;
+
+		topo.type = DRM_XE_TOPO_EU_WIDTH;
+		err = copy_mask(&query_ptr, &topo,
+				&gt->fuse_topo.eu_width,
+				sizeof(gt->fuse_topo.eu_width));
+		if (err)
+			return err;
 	}
 
 	return 0;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 19619d4952a8..6114a9064849 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -491,6 +491,19 @@ struct drm_xe_query_gt_list {
 	struct drm_xe_gt gt_list[];
 };
 
+enum drm_xe_topo_eu_width {
+	/**
+	 * @DRM_XE_TOPO_EU_WIDTH_SIMD8 - EUs reported with
+	 * DRM_XE_TOPO_EU_PER_DSS have SIMD8 width
+	 */
+	DRM_XE_TOPO_EU_WIDTH_SIMD8 = 0,
+	/**
+	 * @DRM_XE_TOPO_EU_WIDTH_SIMD16 - EUs reported with
+	 * DRM_XE_TOPO_EU_PER_DSS have SIMD16 width
+	 */
+	DRM_XE_TOPO_EU_WIDTH_SIMD16,
+};
+
 /**
  * struct drm_xe_query_topology_mask - describe the topology mask of a GT
  *
@@ -518,6 +531,12 @@ struct drm_xe_query_gt_list {
  *    containing the following in mask:
  *    ``EU_PER_DSS    ff ff 00 00 00 00 00 00``
  *    means each DSS has 16 EU.
+ *  - %DRM_XE_TOPO_EU_WIDTH - To query the width of EUs as per
+ *    enum drm_xe_topo_eu_width. It always has num_bytes == 1 and the only byte
+ *    in the mask being the value. For example, a query response containing the
+ *    following in mask:
+ *    ``EU_WIDTH    00``
+ *    means the EUs are SIMD8.
  */
 struct drm_xe_query_topology_mask {
 	/** @gt_id: GT ID the mask is associated with */
@@ -527,6 +546,7 @@ struct drm_xe_query_topology_mask {
 #define DRM_XE_TOPO_DSS_COMPUTE		2
 #define DRM_XE_TOPO_L3_BANK		3
 #define DRM_XE_TOPO_EU_PER_DSS		4
+#define DRM_XE_TOPO_EU_WIDTH		5
 	/** @type: type of mask */
 	__u16 type;
 
-- 
2.43.0

