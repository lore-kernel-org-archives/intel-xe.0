Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D352BCD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 12:38:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7407A88F94;
	Wed, 10 Apr 2024 12:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VeqS+MIm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1A31132A0
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 12:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712752667; x=1744288667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3KPSP/MeP0n70rjQIfP4GPHWwSe7zHhTcfDntx6ISV8=;
 b=VeqS+MImrAYxj1T1SE4ZAxXGgxX3bNIRgcXUrJRHWOK1toMHJOKjOm1f
 1NhrNvpeR8U2ccYhyawHVJ97pmHf+6bXztscmT3JWqt0XugzlgBsLrAr2
 YJjiCutjUe8bjdW4tYfceVVS4d7MhZK4l8RRAyTSIqRggTg9Id74MiCu3
 pI/AMxGLeUvNGrNMzzlmIk9FJYvjx/hEJJ+/pDLmRPOE/MsrKpB1KOOVz
 /NYyadA5BGiBq2GTGt+oRzMO8yHsLi020xEVcQknM553maAcW+NYrreHB
 1Iy57R3LX3M8a85xBBrQ590XdLX7p8x716bkLB789Q2gWabyuEBVgOtuC Q==;
X-CSE-ConnectionGUID: vBaE50ErQe+f59XQx1bz/w==
X-CSE-MsgGUID: ODQQXIvmTaqXmkffCwitQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18718622"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18718622"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 05:37:41 -0700
X-CSE-ConnectionGUID: l8b3hXy9SKKF1eipbDj4IQ==
X-CSE-MsgGUID: k6x212J4Rlu3D2sRFPYlzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20516626"
Received: from lcoutoda-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.251.215.2])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 05:37:41 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 1/2] drm/xe/gt: Add L3 bank mask to GT topology
Date: Wed, 10 Apr 2024 12:37:22 +0000
Message-Id: <20240410123723.7-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410123723.7-1-francois.dugast@intel.com>
References: <20240410123723.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Generate the mask of enabled L3 banks for the GT. It is stored with the
rest of the GT topology in a consistent representation across platforms.
For now the L3 bank mask is just printed in the log for developers to
easily figure out the fusing characteristics of machines that they are
trying to debug issues on. Later it can be used to replace existing code
in the driver that requires the L3 bank count (not mask). Also the mask
can easily be exposed to user space in a new query if needed.

v2: Better naming of variable and function (Matt Roper)

Bspec: 52545, 52546, 62482
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |   3 +
 drivers/gpu/drm/xe/xe_gt_topology.c  | 112 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h     |  13 +++-
 3 files changed, 124 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 8fe811ea404a..94445810ccc9 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -165,7 +165,10 @@
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
index f5773a14f3c8..7d459e093b06 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -8,6 +8,7 @@
 #include <linux/bitmap.h>
 
 #include "regs/xe_gt_regs.h"
+#include "xe_assert.h"
 #include "xe_gt.h"
 #include "xe_mmio.h"
 
@@ -59,6 +60,114 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
 	bitmap_from_arr32(mask, &val, XE_MAX_EU_FUSE_BITS);
 }
 
+/**
+ * gen_l3_mask_from_pattern - Replicate a bit pattern according to a mask
+ *
+ * It is used to compute the L3 bank masks in a generic format on
+ * various platforms where the internal representation of L3 node
+ * and masks from registers are different.
+ *
+ * @xe: device
+ * @dst: destination
+ * @pattern: pattern to replicate
+ * @patternbits: size of the pattern, in bits
+ * @mask: mask describing where to replicate the pattern
+ *
+ * Example 1:
+ * ----------
+ * @pattern =    0b1111
+ *                 └┬─┘
+ * @patternbits =   4 (bits)
+ * @mask = 0b0101
+ *           ││││
+ *           │││└────────────────── 0b1111 (=1×0b1111)
+ *           ││└──────────── 0b0000    │   (=0×0b1111)
+ *           │└────── 0b1111    │      │   (=1×0b1111)
+ *           └ 0b0000    │      │      │   (=0×0b1111)
+ *                │      │      │      │
+ * @dst =      0b0000 0b1111 0b0000 0b1111
+ *
+ * Example 2:
+ * ----------
+ * @pattern =    0b11111111
+ *                 └┬─────┘
+ * @patternbits =   8 (bits)
+ * @mask = 0b10
+ *           ││
+ *           ││
+ *           ││
+ *           │└────────── 0b00000000 (=0×0b11111111)
+ *           └ 0b11111111      │     (=1×0b11111111)
+ *                  │          │
+ * @dst =      0b11111111 0b00000000
+ */
+static void
+gen_l3_mask_from_pattern(struct xe_device *xe, xe_l3_bank_mask_t dst,
+			 xe_l3_bank_mask_t pattern, int patternbits,
+			 unsigned long mask)
+{
+	unsigned long bit;
+
+	xe_assert(xe, fls(mask) <= patternbits);
+	for_each_set_bit(bit, &mask, 32) {
+		xe_l3_bank_mask_t shifted_pattern = {};
+
+		bitmap_shift_left(shifted_pattern, pattern, bit * patternbits,
+				  XE_MAX_L3_BANK_MASK_BITS);
+		bitmap_or(dst, dst, shifted_pattern, XE_MAX_L3_BANK_MASK_BITS);
+	}
+}
+
+static void
+load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 fuse3 = xe_mmio_read32(gt, MIRROR_FUSE3);
+
+	if (GRAPHICS_VER(xe) >= 20) {
+		xe_l3_bank_mask_t per_node = {};
+		u32 meml3_en = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, fuse3);
+		u32 bank_val = REG_FIELD_GET(XE2_GT_L3_MODE_MASK, fuse3);
+
+		bitmap_from_arr32(per_node, &bank_val, 32);
+		gen_l3_mask_from_pattern(xe, l3_bank_mask, per_node, 4,
+					 meml3_en);
+	} else if (GRAPHICS_VERx100(xe) >= 1270) {
+		xe_l3_bank_mask_t per_node = {};
+		xe_l3_bank_mask_t per_mask_bit = {};
+		u32 meml3_en = REG_FIELD_GET(MEML3_EN_MASK, fuse3);
+		u32 fuse4 = xe_mmio_read32(gt, XEHP_FUSE4);
+		u32 bank_val = REG_FIELD_GET(GT_L3_EXC_MASK, fuse4);
+
+		bitmap_set_value8(per_mask_bit, 0x3, 0);
+	gen_l3_mask_from_pattern(xe, per_node, per_mask_bit, 2, bank_val);
+		gen_l3_mask_from_pattern(xe, l3_bank_mask, per_node, 4,
+					 meml3_en);
+	} else if (xe->info.platform == XE_PVC) {
+		xe_l3_bank_mask_t per_node = {};
+		xe_l3_bank_mask_t per_mask_bit = {};
+		u32 meml3_en = REG_FIELD_GET(MEML3_EN_MASK, fuse3);
+		u32 bank_val = REG_FIELD_GET(XEHPC_GT_L3_MODE_MASK, fuse3);
+
+		bitmap_set_value8(per_mask_bit, 0xf, 0);
+		gen_l3_mask_from_pattern(xe, per_node, per_mask_bit, 4,
+					 bank_val);
+		gen_l3_mask_from_pattern(xe, l3_bank_mask, per_node, 16,
+					 meml3_en);
+	} else if (xe->info.platform == XE_DG2) {
+		xe_l3_bank_mask_t per_node = {};
+		u32 mask = REG_FIELD_GET(MEML3_EN_MASK, fuse3);
+
+		bitmap_set_value8(per_node, 0xff, 0);
+		gen_l3_mask_from_pattern(xe, l3_bank_mask, per_node, 8, mask);
+	} else {
+		/* 1:1 register bit to mask bit (inverted register bits) */
+		u32 mask = REG_FIELD_GET(XELP_GT_L3_MODE_MASK, ~fuse3);
+
+		bitmap_from_arr32(l3_bank_mask, &mask, 32);
+	}
+}
+
 static void
 get_num_dss_regs(struct xe_device *xe, int *geometry_regs, int *compute_regs)
 {
@@ -103,6 +212,7 @@ xe_gt_topology_init(struct xe_gt *gt)
 		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
 		      XE2_GT_COMPUTE_DSS_2);
 	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
+	load_l3_bank_mask(gt, gt->fuse_topo.l3_bank_mask);
 
 	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, "GT topology");
 
@@ -120,6 +230,8 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
 	drm_printf(p, "EU mask per DSS:     %*pb\n", XE_MAX_EU_FUSE_BITS,
 		   gt->fuse_topo.eu_mask_per_dss);
 
+	drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_MASK_BITS,
+		   gt->fuse_topo.l3_bank_mask);
 }
 
 /*
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 2143dffcaf11..e60156871026 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -24,13 +24,15 @@ enum xe_gt_type {
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
+#define XE_MAX_L3_BANK_MASK_BITS	64
 
 typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];
 typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(XE_MAX_EU_FUSE_BITS)];
+typedef unsigned long xe_l3_bank_mask_t[BITS_TO_LONGS(XE_MAX_L3_BANK_MASK_BITS)];
 
 struct xe_mmio_range {
 	u32 start;
@@ -327,6 +329,9 @@ struct xe_gt {
 
 		/** @fuse_topo.eu_mask_per_dss: EU mask per DSS*/
 		xe_eu_mask_t eu_mask_per_dss;
+
+		/** @fuse_topo.l3_bank_mask: L3 bank mask */
+		xe_l3_bank_mask_t l3_bank_mask;
 	} fuse_topo;
 
 	/** @steering: register steering for individual HW units */
-- 
2.34.1

