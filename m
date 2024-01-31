Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB7BC47DDF
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 21:48:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB0E10F6BB;
	Wed, 31 Jan 2024 21:48:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BFE10F6BB
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 21:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706737696; x=1738273696;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ccRIb7sKPQGzY0ZRHTwoiyvI+wOhcGUoIgoSxdDynd4=;
 b=TKFO9Gat9N0y/NQOPdLkE1PNFEr4QuE+Hi23621ZIZglfSSeo/TCwTi4
 EKlGIi7jeXhVqHiD0n4SdkZlN6tuHicu47wsLmaVh6s1ABxPir6M0KlF8
 7h340m+IpSS25qrZja/gF7VVAyVSfHIGZBX0UdToQFl69MoUsRta1zeA1
 0rzAeB85yXTJYGnPfBmAMGZzmOLVhzYGsSTMBvKSQiSBz627P5QSy/HWn
 vst/gZkFwGc1O4Kpi6QDDrfKKW6SplqWPyn+eWnAQdt+yAbvamE9GKq8T
 FCWZEGu7vNEifeJ5ULKpr0ZwxG9xk79QyGKDtExn0MsAFl4UgQU+qjCUy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="394178236"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="394178236"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 13:48:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="1119748670"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="1119748670"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmsmga005.fm.intel.com with ESMTP; 31 Jan 2024 13:48:12 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 1/1] drm/xe: Add helper macro to loop each dss
Date: Wed, 31 Jan 2024 13:48:11 -0800
Message-Id: <20240131214811.309263-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240131214811.309263-1-zhanjun.dong@intel.com>
References: <20240131214811.309263-1-zhanjun.dong@intel.com>
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

Add helper macro to loop each dss. This is a precursor patch to allow
for easier iteration through MCR registers and other per-DSS uses.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c      | 34 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_mcr.h      | 14 ++++++++++++
 drivers/gpu/drm/xe/xe_gt_topology.c | 17 ++++++++++++---
 drivers/gpu/drm/xe/xe_gt_topology.h |  1 +
 drivers/gpu/drm/xe/xe_gt_types.h    |  2 ++
 5 files changed, 64 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 8546cd3cc50d..711cbfd8a488 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -291,11 +291,43 @@ static void init_steering_mslice(struct xe_gt *gt)
 	gt->steering[LNCF].instance_target = 0;		/* unused */
 }
 
+static int xe_gt_mcr_get_dss_per_group(struct xe_gt *gt)
+{
+	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
+}
+
+/**
+ * xe_gt_mcr_get_dss_steering - returns the group/instance steering for a DSS
+ * @gt: GT structure
+ * @dss: DSS ID to obtain steering for
+ * @group: pointer to storage for steering group ID
+ * @instance: pointer to storage for steering instance ID
+ *
+ * Returns the steering IDs (via the @group and @instance parameters) that
+ * correspond to a specific DSS ID.
+ */
+bool xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, unsigned int *group,
+				unsigned int *instance)
+{
+	int dss_per_grp;
+
+	if (dss >= XE_MAX_DSS_FUSE_BITS) {
+		xe_gt_dbg(gt, "DSS id out of range: %d\n", dss);
+		return false;
+	}
+
+	dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
+
+	*group = dss / dss_per_grp;
+	*instance = dss % dss_per_grp;
+	return true;
+}
+
 static void init_steering_dss(struct xe_gt *gt)
 {
 	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
 			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
-	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
+	unsigned int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
 
 	gt->steering[DSS].group_target = dss / dss_per_grp;
 	gt->steering[DSS].instance_target = dss % dss_per_grp;
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index 27ca1bc880a0..91cf02b97bc1 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
@@ -7,6 +7,8 @@
 #define _XE_GT_MCR_H_
 
 #include "regs/xe_reg_defs.h"
+#include "xe_gt_types.h"
+#include "xe_gt_topology.h"
 
 struct drm_printer;
 struct xe_gt;
@@ -25,5 +27,17 @@ void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
 			       u32 value);
 
 void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
+bool xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, unsigned int *group,
+				unsigned int *instance);
+
+/*
+ * Loop over each DSS and determine the group and instance IDs that
+ * should be used to steer MCR accesses toward this DSS.
+ */
+#define for_each_dss_steering(dss_, gt_, group_, instance_) \
+	for (dss_ = xe_gt_topology_get_next_dss(gt, 0); \
+	     dss_ >= 0; \
+	     dss_ = xe_gt_topology_get_next_dss(gt, dss_ + 1)) \
+		for_each_if(xe_gt_mcr_get_dss_steering(gt_, dss_, &(group_), &(instance_)))
 
 #endif /* _XE_GT_MCR_H_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index a8d7f272c30a..37596d5f9574 100644
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
@@ -167,3 +164,17 @@ bool xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad)
 
 	return quad_first < (quad + 1) * dss_per_quad;
 }
+
+int xe_gt_topology_get_next_dss(struct xe_gt *gt, int from)
+{
+	xe_dss_mask_t all_dss;
+	unsigned long next;
+
+	bitmap_or(all_dss, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
+		  XE_MAX_DSS_FUSE_BITS);
+
+	next = find_next_bit(all_dss, XE_MAX_DSS_FUSE_BITS, from);
+	if (next == XE_MAX_DSS_FUSE_BITS)
+		return -1;
+	return next;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
index d1b54fb52ea6..44bd8a58f9ce 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.h
+++ b/drivers/gpu/drm/xe/xe_gt_topology.h
@@ -21,5 +21,6 @@ bool xe_dss_mask_empty(const xe_dss_mask_t mask);
 
 bool
 xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad);
+int xe_gt_topology_get_next_dss(struct xe_gt *gt, int from);
 
 #endif /* _XE_GT_TOPOLOGY_H_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 70c615dd1498..b926606edb38 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -25,7 +25,9 @@ enum xe_gt_type {
 };
 
 #define XE_MAX_DSS_FUSE_REGS	3
+#define XE_MAX_DSS_FUSE_BITS	(32 * XE_MAX_DSS_FUSE_REGS)
 #define XE_MAX_EU_FUSE_REGS	1
+#define XE_MAX_EU_FUSE_BITS	(32 * XE_MAX_EU_FUSE_REGS)
 
 typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
 typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
-- 
2.34.1

