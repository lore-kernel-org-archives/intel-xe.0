Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233D9C678D5
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 00:55:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDFB110E769;
	Thu,  9 Mar 2023 00:55:42 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32BA10E165
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 00:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678323340; x=1709859340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q2UtrFnMsmWkjcJECesPiBdszaWvG0l5QP61QHNebIk=;
 b=bme2gLzZqn2fz199IR9ApSolpa5HbuEhEdlHE66wxwLWkuJM0iefjy+1
 NlWY70p22fievIdecYftX0YotZNsoMBiDUMVvrhzIZjLi7ZT0CuaSa77O
 4TVyx1QfYbLgZbkas5Rtwh4Joq/DE+YxSME8LSSTLcwxgfmgsQO/2kNrV
 a+DUf7ZnpNxwj25vTSFfCYtYm+gC4rN/DxGv8dMISMj4ZTxbmZjPKvs15
 66cEc5xEcrVC2bUeWhF7PhoAwb4BuP9nPjh1kDGIfKfXpg4kXxQufjp4p
 ckazEPdUmT/ci+rdPX43mML6F1sz+cT1XesXe0vTWUvOkvcz1aC5lc2b2 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="315977856"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="315977856"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 16:55:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="851325640"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="851325640"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 16:55:39 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  8 Mar 2023 16:55:30 -0800
Message-Id: <20230309005530.3140173-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309005530.3140173-1-matthew.d.roper@intel.com>
References: <20230309005530.3140173-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] drm/xe: Add support for CCS engine fusing
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

For Xe_HP platforms that can have multiple CCS engines, the
presence/absence of each CCS is inferred by the presence/absence of any
DSS in the corresponding quadrant of the GT's DSS mask.

This handling is only needed on platforms that can have more than one
CCS.  The CCS is never fused off on platforms like MTL that can only
have one.

v2:
 - Add extra warnings to try to catch mistakes where the register counts
   in get_num_dss_regs() are updated without corresponding updates to
   the register parameters passed to load_dss_mask().  (Lucas)
 - Add kerneldoc for xe_gt_topology_has_dss_in_quadrant() and clarify
   why we care about quadrants of the DSS space.  (Lucas)
 - Ensure CCS engine counting treats engine mask as 64-bit.  (Lucas)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 65 ++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_gt_topology.h |  3 ++
 drivers/gpu/drm/xe/xe_hw_engine.c   | 29 ++++++++++++-
 3 files changed, 85 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 2123f84be336..f2cbee53462b 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -62,6 +62,21 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
 	bitmap_from_arr32(mask, &val, XE_MAX_EU_FUSE_BITS);
 }
 
+static void
+get_num_dss_regs(struct xe_device *xe, int *geometry_regs, int *compute_regs)
+{
+	if (GRAPHICS_VERx100(xe) == 1260) {
+		*geometry_regs = 0;
+		*compute_regs = 2;
+	} else if (GRAPHICS_VERx100(xe) >= 1250) {
+		*geometry_regs = 1;
+		*compute_regs = 1;
+	} else {
+		*geometry_regs = 1;
+		*compute_regs = 0;
+	}
+}
+
 void
 xe_gt_topology_init(struct xe_gt *gt)
 {
@@ -69,18 +84,17 @@ xe_gt_topology_init(struct xe_gt *gt)
 	struct drm_printer p = drm_debug_printer("GT topology");
 	int num_geometry_regs, num_compute_regs;
 
-	if (GRAPHICS_VERx100(xe) == 1260) {
-		num_geometry_regs = 0;
-		num_compute_regs = 2;
-	} else if (GRAPHICS_VERx100(xe) >= 1250) {
-		num_geometry_regs = 1;
-		num_compute_regs = 1;
-	} else {
-		num_geometry_regs = 1;
-		num_compute_regs = 0;
-	}
+	get_num_dss_regs(xe, &num_geometry_regs, &num_compute_regs);
 
-	load_dss_mask(gt, gt->fuse_topo.g_dss_mask, num_geometry_regs,
+	/*
+	 * Register counts returned shouldn't exceed the number of registers
+	 * passed as parameters below.
+	 */
+	drm_WARN_ON(&xe->drm, num_geometry_regs > 1);
+	drm_WARN_ON(&xe->drm, num_compute_regs > 2);
+
+	load_dss_mask(gt, gt->fuse_topo.g_dss_mask,
+		      num_geometry_regs,
 		      XELP_GT_GEOMETRY_DSS_ENABLE.reg);
 	load_dss_mask(gt, gt->fuse_topo.c_dss_mask, num_compute_regs,
 		      XEHP_GT_COMPUTE_DSS_ENABLE.reg,
@@ -113,3 +127,32 @@ xe_dss_mask_group_ffs(xe_dss_mask_t mask, int groupsize, int groupnum)
 {
 	return find_next_bit(mask, XE_MAX_DSS_FUSE_BITS, groupnum * groupsize);
 }
+
+/**
+ * xe_gt_topology_has_dss_in_quadrant - check fusing of DSS in GT quadrant
+ * @gt: GT to check
+ * @quad: Which quadrant of the DSS space to check
+ *
+ * Since Xe_HP platforms can have up to four CCS engines, those engines
+ * are each logically associated with a quarter of the possible DSS.  If there
+ * are no DSS present in one of the four quadrants of the DSS space, the
+ * corresponding CCS engine is also not available for use.
+ *
+ * Returns false if all DSS in a quadrant of the GT are fused off, else true.
+ */
+bool xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	xe_dss_mask_t all_dss;
+	int g_dss_regs, c_dss_regs, dss_per_quad, quad_first;
+
+	bitmap_or(all_dss, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
+		  XE_MAX_DSS_FUSE_BITS);
+
+	get_num_dss_regs(xe, &g_dss_regs, &c_dss_regs);
+	dss_per_quad = 32 * max(g_dss_regs, c_dss_regs) / 4;
+
+	quad_first = xe_dss_mask_group_ffs(all_dss, dss_per_quad, quad);
+
+	return quad_first < (quad + 1) * dss_per_quad;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
index b2540dc266f2..f47ab1b1269c 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.h
+++ b/drivers/gpu/drm/xe/xe_gt_topology.h
@@ -17,4 +17,7 @@ void xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p);
 unsigned int
 xe_dss_mask_group_ffs(xe_dss_mask_t mask, int groupsize, int groupnum);
 
+bool
+xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad);
+
 #endif /* _XE_GT_TOPOLOGY_H_ */
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index abfd35491b47..63a4efd5edcc 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -436,13 +436,40 @@ static void read_copy_fuses(struct xe_gt *gt)
 	}
 }
 
+static void read_compute_fuses(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	/*
+	 * CCS fusing based on DSS masks only applies to platforms that can
+	 * have more than one CCS.
+	 */
+	if (hweight64(gt->info.engine_mask &
+		      GENMASK_ULL(XE_HW_ENGINE_CCS3, XE_HW_ENGINE_CCS0)) <= 1)
+		return;
+
+	/*
+	 * CCS availability on Xe_HP is inferred from the presence of DSS in
+	 * each quadrant.
+	 */
+	for (int i = XE_HW_ENGINE_CCS0, j = 0; i <= XE_HW_ENGINE_CCS3; ++i, ++j) {
+		if (!(gt->info.engine_mask & BIT(i)))
+			continue;
+
+		if (!xe_gt_topology_has_dss_in_quadrant(gt, j)) {
+			gt->info.engine_mask &= ~BIT(i);
+			drm_info(&xe->drm, "ccs%u fused off\n", j);
+		}
+	}
+}
+
 int xe_hw_engines_init_early(struct xe_gt *gt)
 {
 	int i;
 
 	read_media_fuses(gt);
 	read_copy_fuses(gt);
-	/* TODO: compute engines */
+	read_compute_fuses(gt);
 
 	for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++)
 		hw_engine_init_early(gt, &gt->hw_engines[i], i);
-- 
2.39.2

