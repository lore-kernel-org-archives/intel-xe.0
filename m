Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E243CC48286
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 18:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BB1112A92;
	Mon, 29 Jan 2024 18:17:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA643112A93
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 18:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706552276; x=1738088276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FW9jMNgzyigDxWF2OUMwiV2Q3FsAKRi2eaEQmAXovfA=;
 b=YJKL0rCBb/FM6OdO3flhmLXxYB/J1JswnWh6LCAgX/sShWQBsqJR1y1Y
 TpDtomOGRLFYW3ducr1ue2T3dInbcbS8qOXYZHnWDLVri2QSrg6L3K8Dm
 Z84fR+DfE0pufAZ1r3C04CRWS1VMqGQBK/eGahfPWI/bZarwJZcTg8EKC
 hNMgoylSIQ48KPgebH6mE8YmEhsym6oKnEJkLcV1waqACwLfAMxBE/ifm
 ycPSRygQtjhd1Y4K2/ZcBeAS5O+PKxa6cmthTo8IpUXFox4ECjJ67A0vZ
 LhUcjxIL1hlGwtKcquRdvcdI0Rshu7Pmh7oQ8MIuqNTfz1cZLgJvfB6RC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="2903301"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="2903301"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 10:17:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3439243"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 10:17:54 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 4/6] drm/xe: Add misc functions to support read of specific
 DSS registers
Date: Mon, 29 Jan 2024 10:17:40 -0800
Message-ID: <20240129181742.183694-4-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129181742.183694-1-jose.souza@intel.com>
References: <20240129181742.183694-1-jose.souza@intel.com>
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
 drivers/gpu/drm/xe/xe_gt.c          | 17 ++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h          |  3 +++
 drivers/gpu/drm/xe/xe_gt_mcr.c      | 17 +++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_mcr.h      | 31 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_topology.c |  1 -
 drivers/gpu/drm/xe/xe_gt_types.h    |  3 ++-
 6 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 675a2927a19ef..9a3dce45b92ba 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -795,3 +795,20 @@ struct xe_hw_engine *xe_gt_any_hw_engine_by_reset_domain(struct xe_gt *gt,
 
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
index c1675bd44cf6d..36815d8cbc107 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -70,4 +70,7 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
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
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index a8d7f272c30a0..c4942f2b37751 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -11,7 +11,6 @@
 #include "xe_gt.h"
 #include "xe_mmio.h"
 
-#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
 #define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
 
 static void
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 70c615dd14986..bb6dc1fcaa7dd 100644
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
2.43.0

