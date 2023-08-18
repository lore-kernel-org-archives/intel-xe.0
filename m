Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9062EE4992
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 22:08:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1ACB10E049;
	Fri, 18 Aug 2023 22:08:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D68B10E106
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 22:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692396512; x=1723932512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pbpsd0x9cbyY1WmxtFLe1iZAAUs2dnx1mQGJA5mu+nw=;
 b=PnPXCjX9xYwngRpHftHb0yL9e2wmFmIQTi5yhn2IVe2pr17p3nLE1sTc
 CtNlCudHBPkgPdr3MaUsXjpohNfkmQlcuwkYX6OxHrtONZmtu3yxTBKG7
 AVDmXxmzy31R+WOdsGpuH0yGFMIjFjEwe39a1cp5KdK9i5T3EzA87GLMp
 AGdFKjoVur9NirO5BoXCd4MNTs4EhLdc+SkfQEMhvPQvTlYOjFnExmSc7
 rJHBN6zzvJS95VdgovBO5HwRELl+n83AqxWqFHqS3U9av/Gum3l683khb
 jDdKDqHlno2m+wwkQ83cssT0jUkMvrP/TLZZGK5/8tP4c34zyOjxTJ6ip A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="439592984"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="439592984"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 15:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="728758179"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; d="scan'208";a="728758179"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 15:08:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 18 Aug 2023 15:08:11 -0700
Message-Id: <20230818220824.700519-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230818220824.700519-1-lucas.demarchi@intel.com>
References: <20230818220824.700519-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 02/15] drm/xe/xe2: Add GT topology readout
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

Xe2 platforms have three DSS fuse registers for both geometry and
compute.

Bspec: 67171, 67537, 67401, 67536
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_gt_topology.c  | 16 +++++++++++-----
 drivers/gpu/drm/xe/xe_gt_types.h     |  2 +-
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index baa00557f114..55367dcca603 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -162,6 +162,9 @@
 #define XELP_GT_GEOMETRY_DSS_ENABLE		XE_REG(0x913c)
 #define XEHP_GT_COMPUTE_DSS_ENABLE		XE_REG(0x9144)
 #define XEHPC_GT_COMPUTE_DSS_ENABLE_EXT		XE_REG(0x9148)
+#define XE2_GT_COMPUTE_DSS_2			XE_REG(0x914c)
+#define XE2_GT_GEOMETRY_DSS_1			XE_REG(0x9150)
+#define XE2_GT_GEOMETRY_DSS_2			XE_REG(0x9154)
 
 #define GDRST					XE_REG(0x941c)
 #define   GRDOM_GUC				REG_BIT(3)
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index d4bbd0a835c2..a8d7f272c30a 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -65,7 +65,10 @@ load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
 static void
 get_num_dss_regs(struct xe_device *xe, int *geometry_regs, int *compute_regs)
 {
-	if (GRAPHICS_VERx100(xe) == 1260) {
+	if (GRAPHICS_VER(xe) > 20) {
+		*geometry_regs = 3;
+		*compute_regs = 3;
+	} else if (GRAPHICS_VERx100(xe) == 1260) {
 		*geometry_regs = 0;
 		*compute_regs = 2;
 	} else if (GRAPHICS_VERx100(xe) >= 1250) {
@@ -90,15 +93,18 @@ xe_gt_topology_init(struct xe_gt *gt)
 	 * Register counts returned shouldn't exceed the number of registers
 	 * passed as parameters below.
 	 */
-	drm_WARN_ON(&xe->drm, num_geometry_regs > 1);
-	drm_WARN_ON(&xe->drm, num_compute_regs > 2);
+	drm_WARN_ON(&xe->drm, num_geometry_regs > 3);
+	drm_WARN_ON(&xe->drm, num_compute_regs > 3);
 
 	load_dss_mask(gt, gt->fuse_topo.g_dss_mask,
 		      num_geometry_regs,
-		      XELP_GT_GEOMETRY_DSS_ENABLE);
+		      XELP_GT_GEOMETRY_DSS_ENABLE,
+		      XE2_GT_GEOMETRY_DSS_1,
+		      XE2_GT_GEOMETRY_DSS_2);
 	load_dss_mask(gt, gt->fuse_topo.c_dss_mask, num_compute_regs,
 		      XEHP_GT_COMPUTE_DSS_ENABLE,
-		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT);
+		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
+		      XE2_GT_COMPUTE_DSS_2);
 	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
 
 	xe_gt_topology_dump(gt, &p);
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 35b8c19fa8bf..48fd698ff62a 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -24,7 +24,7 @@ enum xe_gt_type {
 	XE_GT_TYPE_MEDIA,
 };
 
-#define XE_MAX_DSS_FUSE_REGS	2
+#define XE_MAX_DSS_FUSE_REGS	3
 #define XE_MAX_EU_FUSE_REGS	1
 
 typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
-- 
2.40.1

