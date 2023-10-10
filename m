Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E31ECD8CAC
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 18:42:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114CB10E16A;
	Tue, 10 Oct 2023 18:42:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CEC10E16A
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 18:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696963329; x=1728499329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HJc9nPXIB6LWbhPShx6SLkplsHSQGSKPx53TYbNGDTU=;
 b=O9bUPgTchgDlbMVPUJEICEtwO4BE6h9FyM+CL34P7YPP6cUuSi+g1LiK
 TwVG91GNLtSP+fJ7b7KU28F+YMj0wnOhGcg/knqheawYG/N8+qiwrt8tV
 ThQine/G7KPuJ6RfH3XUx4F4U7DZa82la+KPdTbnkKMHhH/tKI9O0dByF
 Gg7HUY0wGx7HwnCitjClJADwjup3p4H9c2mQoe7zDn5lravYb6Eh4Sk0F
 cwg89TFVggGpfInzTpA1dkk/kLNUN6h3bF9WwDnaj81uMQ1xpibJbBR08
 jeW+k1LHrXzoXiD8KgJa/i/Twd9gjG8vwBO1Yia87eo6qRRcsXc9YsELy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="364774288"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="364774288"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 11:41:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="753507763"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="753507763"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 11:41:57 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 10 Oct 2023 11:41:50 -0700
Message-ID: <20231010184151.91195-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231010184151.91195-1-jose.souza@intel.com>
References: <20231010184151.91195-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/3] drm/xe: Add misc functions to support
 read of specific DSS registers
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Next patch will read register in specific DSS registers and this
are the functions missing to do so.

xe_gt_mcr_get_dss_steering() calculate and return the group and
instance that will be used by xe_gt_mcr_unicast_read().

xe_gt_has_geometry_dss() and xe_gt_has_compute_dss() returns true
if DSS is available for geometry of compute.

for_each_geometry/compute_dss() to simply the iteration over each
available DSS

v3:
- add for_each_geometry/compute_dss()

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c       | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h       |  3 +++
 drivers/gpu/drm/xe/xe_gt_mcr.c   | 17 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_mcr.h   | 31 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h |  3 ++-
 5 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index c63e2e4750b1e..47860ce94f9fe 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -747,3 +747,20 @@ struct xe_hw_engine *xe_gt_any_hw_engine_by_reset_domain(struct xe_gt *gt,
 
 	return NULL;
 }
+
+static bool has_dss(xe_dss_mask_t dss_mask, unsigned int dss)
+{
+	unsigned long value = bitmap_get_value8(dss_mask, (dss / 8) * 8);
+
+	return value & BIT(dss % 8);
+}
+
+bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss)
+{
+	return has_dss(gt->fuse_topo.g_dss_mask, dss);
+}
+
+bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss)
+{
+	return has_dss(gt->fuse_topo.c_dss_mask, dss);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index caded203a8a03..e7baaa0088041 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -67,4 +67,7 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
 		hwe->instance == gt->usm.reserved_bcs_instance;
 }
 
+bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss);
+bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 77925b35cf8dc..e76cb0ae457aa 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -291,11 +291,17 @@ static void init_steering_mslice(struct xe_gt *gt)
 	gt->steering[LNCF].instance_target = 0;		/* unused */
 }
 
+static unsigned int
+get_dss_per_group(struct xe_gt *gt)
+{
+	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
+}
+
 static void init_steering_dss(struct xe_gt *gt)
 {
 	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
 			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
-	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
+	unsigned int dss_per_grp = get_dss_per_group(gt);
 
 	gt->steering[DSS].group_target = dss / dss_per_grp;
 	gt->steering[DSS].instance_target = dss % dss_per_grp;
@@ -683,3 +689,12 @@ void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p)
 		}
 	}
 }
+
+void
+xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, int *group,
+			   int *instance)
+{
+	unsigned int dss_per_group = get_dss_per_group(gt);
+	*group = dss / dss_per_group;
+	*instance = dss % dss_per_group;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index 27ca1bc880a00..9f5f7dbb6fca8 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
@@ -7,6 +7,7 @@
 #define _XE_GT_MCR_H_
 
 #include "regs/xe_reg_defs.h"
+#include "xe_gt_types.h"
 
 struct drm_printer;
 struct xe_gt;
@@ -24,6 +25,36 @@ void xe_gt_mcr_unicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
 void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
 			       u32 value);
 
+void
+xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, int *group,
+			   int *instance);
+
 void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
 
+/**
+ * for_each_geometry_dss - Iterate over each DSS available for geometry
+ * @gt: GT structure
+ * @dss: DSS id
+ * @grp: group id to be in xe_gt_mcr_unicast_read()
+ * @inst: instance id to be in xe_gt_mcr_unicast_read()
+ */
+#define for_each_geometry_dss(gt, dss, grp, inst) \
+	for (dss = 0, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst); \
+	     dss < XE_MAX_DSS_FUSE_BITS; \
+	     dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
+		if (xe_gt_has_geometry_dss(gt, dss))
+
+/**
+ * for_each_compute_dss - Iterate over each DSS available for compute
+ * @gt: GT structure
+ * @dss: DSS id
+ * @grp: group id to be in xe_gt_mcr_unicast_read()
+ * @inst: instance id to be in xe_gt_mcr_unicast_read()
+ */
+#define for_each_compute_dss(gt, dss, grp, inst) \
+	for (dss = 0, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst); \
+	     dss < XE_MAX_DSS_FUSE_BITS; \
+	     dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
+		if (xe_gt_has_compute_dss(gt, dss))
+
 #endif /* _XE_GT_MCR_H_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index d4310be3e1e7c..1d3e027fb2267 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -25,9 +25,10 @@ enum xe_gt_type {
 };
 
 #define XE_MAX_DSS_FUSE_REGS	3
+#define XE_MAX_DSS_FUSE_BITS   (32 * XE_MAX_DSS_FUSE_REGS)
 #define XE_MAX_EU_FUSE_REGS	1
 
-typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
+typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];
 typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
 
 struct xe_mmio_range {
-- 
2.42.0

