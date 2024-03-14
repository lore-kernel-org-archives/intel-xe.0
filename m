Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D42C54E5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 21:07:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D9D10E342;
	Thu, 14 Mar 2024 21:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GdxAhMJs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C6910E342
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 21:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710450460; x=1741986460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HrMS1M/CMoojY6WSey/POdDMsoi4GEeiECnizQsgfZY=;
 b=GdxAhMJsbuQQVPRaCRrkzvzGywE5c5hohdUxpbDfrQwkx2RTrKsRIK8I
 DlyCzilD+hjcGJYG5bqRtGCPKypCrqba1OQeC24xy+f+3hyxIa6hZRvVL
 YHBq/VEm0nIXw1Zf0Wass2KgHebq1sUXZ9sqNl4i7MEMKduqbQjY35gbE
 Hmv3u/rVe9Fu96RDPU9VOJYwofd1QWtk4L8h4ZegcS8QzLlyEUcpLEHZ5
 DgOJEmf7bnMHh7y3GeBs90RAx/bOeQjLBiE/A5kUpt74a3YatOxxsW7xW
 5WggsQL9+AqpfFS1T/yY13/XGtnI1yvo3LM+tcFQTtB/+fdJMvhJiP000 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="27770150"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="27770150"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 14:07:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="12510336"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa006.fm.intel.com with ESMTP; 14 Mar 2024 14:07:37 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v12 1/1] drm/xe: Add helper macro to loop each DSS
Date: Thu, 14 Mar 2024 14:07:35 -0700
Message-Id: <20240314210735.258553-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314210735.258553-1-zhanjun.dong@intel.com>
References: <20240314210735.258553-1-zhanjun.dong@intel.com>
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

Add helper macro to loop each DSS. This is a precursor patch to allow
for easier iteration through MCR registers and other per-DSS uses.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c      | 34 ++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_gt_mcr.h      | 14 ++++++++++++
 drivers/gpu/drm/xe/xe_gt_topology.c |  3 ---
 drivers/gpu/drm/xe/xe_gt_topology.h | 11 ++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h    |  6 +++--
 5 files changed, 57 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index a7ab9ba645f9..866bbd26ba3f 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -6,6 +6,7 @@
 #include "xe_gt_mcr.h"
 
 #include "regs/xe_gt_regs.h"
+#include "xe_assert.h"
 #include "xe_gt.h"
 #include "xe_gt_topology.h"
 #include "xe_gt_types.h"
@@ -294,14 +295,35 @@ static void init_steering_mslice(struct xe_gt *gt)
 	gt->steering[LNCF].instance_target = 0;		/* unused */
 }
 
-static void init_steering_dss(struct xe_gt *gt)
+static unsigned int dss_per_group(struct xe_gt *gt)
+{
+	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
+}
+
+/**
+ * xe_gt_mcr_get_dss_steering - Get the group/instance steering for a DSS
+ * @gt: GT structure
+ * @dss: DSS ID to obtain steering for
+ * @group: pointer to storage for steering group ID
+ * @instance: pointer to storage for steering instance ID
+ */
+void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 *group, u16 *instance)
 {
-	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
-			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
-	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
+	int dss_per_grp = dss_per_group(gt);
+
+	xe_gt_assert(gt, dss < XE_MAX_DSS_FUSE_BITS);
+
+	*group = dss / dss_per_grp;
+	*instance = dss % dss_per_grp;
+}
 
-	gt->steering[DSS].group_target = dss / dss_per_grp;
-	gt->steering[DSS].instance_target = dss % dss_per_grp;
+static void init_steering_dss(struct xe_gt *gt)
+{
+	xe_gt_mcr_get_dss_steering(gt,
+				   min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
+				       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0)),
+				   &gt->steering[DSS].group_target,
+				   &gt->steering[DSS].instance_target);
 }
 
 static void init_steering_oaddrm(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index 27ca1bc880a0..a7f4ab1aa584 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
@@ -7,6 +7,7 @@
 #define _XE_GT_MCR_H_
 
 #include "regs/xe_reg_defs.h"
+#include "xe_gt_topology.h"
 
 struct drm_printer;
 struct xe_gt;
@@ -25,5 +26,18 @@ void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
 			       u32 value);
 
 void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
+void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, u16 *group, u16 *instance);
+
+/*
+ * Loop over each DSS and determine the group and instance IDs that
+ * should be used to steer MCR accesses toward this DSS.
+ * @dss: DSS ID to obtain steering for
+ * @gt: GT structure
+ * @group: steering group ID, data type: u16
+ * @instance: steering instance ID, data type: u16
+ */
+#define for_each_dss_steering(dss, gt, group, instance) \
+	for_each_dss((dss), (gt)) \
+		for_each_if((xe_gt_mcr_get_dss_steering((gt), (dss), &(group), &(instance)), true))
 
 #endif /* _XE_GT_MCR_H_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 5dc62fe1be49..f5773a14f3c8 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -11,9 +11,6 @@
 #include "xe_gt.h"
 #include "xe_mmio.h"
 
-#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
-#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
-
 static void
 load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
 {
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
index d1b54fb52ea6..b3e357777a6e 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.h
+++ b/drivers/gpu/drm/xe/xe_gt_topology.h
@@ -8,6 +8,17 @@
 
 #include "xe_gt_types.h"
 
+/*
+ * Loop over each DSS with the bit is 1 in geometry or compute mask
+ * @dss: iterated DSS bit from the DSS mask
+ * @gt: GT structure
+ */
+#define for_each_dss(dss, gt) \
+	for_each_or_bit((dss), \
+			(gt)->fuse_topo.g_dss_mask, \
+			(gt)->fuse_topo.c_dss_mask, \
+			XE_MAX_DSS_FUSE_BITS)
+
 struct drm_printer;
 
 void xe_gt_topology_init(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 70c615dd1498..f6da2ad9719f 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -25,10 +25,12 @@ enum xe_gt_type {
 };
 
 #define XE_MAX_DSS_FUSE_REGS	3
+#define XE_MAX_DSS_FUSE_BITS	(32 * XE_MAX_DSS_FUSE_REGS)
 #define XE_MAX_EU_FUSE_REGS	1
+#define XE_MAX_EU_FUSE_BITS	(32 * XE_MAX_EU_FUSE_REGS)
 
-typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
-typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
+typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];
+typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(XE_MAX_EU_FUSE_BITS)];
 
 struct xe_mmio_range {
 	u32 start;
-- 
2.34.1

