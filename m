Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045BFC3DA41
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 22:05:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79CF10E6F4;
	Wed, 10 Jul 2024 22:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRNyhKfP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6929210E91C
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 22:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720649101; x=1752185101;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GfB7ngO5oqGjJthH+d4RzGIPTYPTLys7NRa+ZiKk6/k=;
 b=LRNyhKfPO5CqWDzXc64NZLtcMPQDha4N5z2R7uG9RrB+KUJJRjTFY+5l
 ffC3KRtPOiMszHuXQwUbUVv4vcmZY/SF34UPinPB+/FYO3+LyuJG1XKZl
 ni3RTLgd4tSZ7TJ82NhAVy1uoN1jNbTjaweP3F4XlgGdq0ST0YqvkY0wJ
 G7iSCBo92ymRYy+gt96xe0SAF+uwlbUTI0TM8+TgwPzBtGIAYoZzivce2
 GwIJfeJyFRikACAIMPIPO1VM5Xmfo8eIvSSco24lKRYMwDQNCWStzwbtk
 8UQ6Tr3WwmvGjK0V0H3tHpA//M5OEpRh/6s2Ablr9crE2rEhsLg0LAlle A==;
X-CSE-ConnectionGUID: RrstI1d5RYaLywGggJg1Xw==
X-CSE-MsgGUID: /xYZiE4+Sbe7qpgRvGFFZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="28667056"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="28667056"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 15:05:01 -0700
X-CSE-ConnectionGUID: QXC7EoqPSIytDOvSDFlyyA==
X-CSE-MsgGUID: z3rzzYS2SEa+xw9HgQsXDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="48105191"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 15:05:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: jose.souza@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, fei.yang@intel.com,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2] drm/xe/uapi: Expose SIMD16 EU mask in topology query
Date: Wed, 10 Jul 2024 15:02:27 -0700
Message-ID: <20240710220446.2169797-1-lucas.demarchi@intel.com>
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

PVC, Xe2 and later platforms have 16-wide EUs. We were implicitly
reporting for PVC the number of 16-wide EUs without giving userspace any
hint that they were different than for other platforms. Xe2 and later
also have 16-wide, but in those cases the reported number would
correspond to the 8-wide count.

To avoid confusion and make sure the right number is used by userspace
depending on the platform, add a new item to the topology query and drop
the one that is not available. The new mask reported for both PVC and
Xe2 should now match the numbers reported via hwconfig.

v2: Use a different topo item with EU type in its name to report the
    new mask instead of adding the type itself as the item (Matt Roper)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

Tested on LNL to check the behavior in dmesg, debugfs and ioctl.
Test-with: https://lore.kernel.org/igt-dev/20240710220050.2169596-1-lucas.demarchi@intel.com/

 drivers/gpu/drm/xe/xe_gt_topology.c | 27 ++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_gt_types.h    | 11 +++++++++++
 drivers/gpu/drm/xe/xe_query.c       |  4 +++-
 include/uapi/drm/xe_drm.h           | 10 +++++++++-
 4 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 25ff03ab8448..5a1559edf3e9 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -6,6 +6,7 @@
 #include "xe_gt_topology.h"
 
 #include <linux/bitmap.h>
+#include <linux/compiler.h>
 
 #include "regs/xe_gt_regs.h"
 #include "xe_assert.h"
@@ -31,7 +32,7 @@ load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
 }
 
 static void
-load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
+load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask, enum xe_gt_eu_type *eu_type)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 reg_val = xe_mmio_read32(gt, XELP_EU_ENABLE);
@@ -47,11 +48,13 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
 	if (GRAPHICS_VERx100(xe) < 1250)
 		reg_val = ~reg_val & XELP_EU_MASK;
 
-	/* On PVC, one bit = one EU */
-	if (GRAPHICS_VERx100(xe) == 1260) {
+	if (GRAPHICS_VERx100(xe) == 1260 || GRAPHICS_VER(xe) >= 20) {
+		/* SIMD16 EUs, one bit == one EU */
+		*eu_type = XE_GT_EU_TYPE_SIMD16;
 		val = reg_val;
 	} else {
-		/* All other platforms, one bit = 2 EU */
+		/* SIMD8 EUs, one bit == 2 EU */
+		*eu_type = XE_GT_EU_TYPE_SIMD8;
 		for (i = 0; i < fls(reg_val); i++)
 			if (reg_val & BIT(i))
 				val |= 0x3 << 2 * i;
@@ -213,7 +216,7 @@ xe_gt_topology_init(struct xe_gt *gt)
 		      XEHP_GT_COMPUTE_DSS_ENABLE,
 		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
 		      XE2_GT_COMPUTE_DSS_2);
-	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
+	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss, &gt->fuse_topo.eu_type);
 	load_l3_bank_mask(gt, gt->fuse_topo.l3_bank_mask);
 
 	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, "GT topology");
@@ -221,6 +224,18 @@ xe_gt_topology_init(struct xe_gt *gt)
 	xe_gt_topology_dump(gt, &p);
 }
 
+static const char *eu_type_to_str(enum xe_gt_eu_type eu_type)
+{
+	switch (eu_type) {
+	case XE_GT_EU_TYPE_SIMD16:
+		return "simd16";
+	case XE_GT_EU_TYPE_SIMD8:
+		return "simd8";
+	}
+
+	unreachable();
+}
+
 void
 xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
 {
@@ -231,6 +246,8 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
 
 	drm_printf(p, "EU mask per DSS:     %*pb\n", XE_MAX_EU_FUSE_BITS,
 		   gt->fuse_topo.eu_mask_per_dss);
+	drm_printf(p, "EU type:             %s\n",
+		   eu_type_to_str(gt->fuse_topo.eu_type));
 
 	drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_MASK_BITS,
 		   gt->fuse_topo.l3_bank_mask);
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 6b5e0b45efb0..01ea87d8886b 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -27,6 +27,11 @@ enum xe_gt_type {
 	XE_GT_TYPE_MEDIA,
 };
 
+enum xe_gt_eu_type {
+	XE_GT_EU_TYPE_SIMD8,
+	XE_GT_EU_TYPE_SIMD16,
+};
+
 #define XE_MAX_DSS_FUSE_REGS		3
 #define XE_MAX_DSS_FUSE_BITS		(32 * XE_MAX_DSS_FUSE_REGS)
 #define XE_MAX_EU_FUSE_REGS		1
@@ -343,6 +348,12 @@ struct xe_gt {
 
 		/** @fuse_topo.l3_bank_mask: L3 bank mask */
 		xe_l3_bank_mask_t l3_bank_mask;
+
+		/**
+		 * @fuse_tipo.eu_type: type/width of EU stored in
+		 * fuse_topo.eu_mask_per_dss
+		 */
+		enum xe_gt_eu_type eu_type;
 	} fuse_topo;
 
 	/** @steering: register steering for individual HW units */
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 4e01df6b1b7a..73ef6e4c2dc9 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -518,7 +518,9 @@ static int query_gt_topology(struct xe_device *xe,
 		if (err)
 			return err;
 
-		topo.type = DRM_XE_TOPO_EU_PER_DSS;
+		topo.type = gt->fuse_topo.eu_type == XE_GT_EU_TYPE_SIMD16 ?
+			DRM_XE_TOPO_SIMD16_EU_PER_DSS :
+			DRM_XE_TOPO_EU_PER_DSS;
 		err = copy_mask(&query_ptr, &topo,
 				gt->fuse_topo.eu_mask_per_dss,
 				sizeof(gt->fuse_topo.eu_mask_per_dss));
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 19619d4952a8..29425d7fdc77 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -517,7 +517,14 @@ struct drm_xe_query_gt_list {
  *    available per Dual Sub Slices (DSS). For example a query response
  *    containing the following in mask:
  *    ``EU_PER_DSS    ff ff 00 00 00 00 00 00``
- *    means each DSS has 16 EU.
+ *    means each DSS has 16 SIMD8 EUs. This type may be omitted if device
+ *    doesn't have SIMD8 EUs.
+ *  - %DRM_XE_TOPO_SIMD16_EU_PER_DSS - To query the mask of SIMD16 Execution
+ *    Units (EU) available per Dual Sub Slices (DSS). For example a query
+ *    response containing the following in mask:
+ *    ``SIMD16_EU_PER_DSS    ff ff 00 00 00 00 00 00``
+ *    means each DSS has 16 SIMD16 EUs. This type may be omitted if device
+ *    doesn't have SIMD16 EUs.
  */
 struct drm_xe_query_topology_mask {
 	/** @gt_id: GT ID the mask is associated with */
@@ -527,6 +534,7 @@ struct drm_xe_query_topology_mask {
 #define DRM_XE_TOPO_DSS_COMPUTE		2
 #define DRM_XE_TOPO_L3_BANK		3
 #define DRM_XE_TOPO_EU_PER_DSS		4
+#define DRM_XE_TOPO_SIMD16_EU_PER_DSS	5
 	/** @type: type of mask */
 	__u16 type;
 
-- 
2.43.0

