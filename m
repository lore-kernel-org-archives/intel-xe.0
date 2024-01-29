Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376B4C47DA9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 22:34:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EE010EF1B;
	Mon, 29 Jan 2024 22:34:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C31B112B7E
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 22:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706567649; x=1738103649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B8XmBBXxerDv4uE8aytqItUvEJa5neU6OCoofuWv+m8=;
 b=R1mBtFUj/t4T2wdlnqf03wg2i1WOUjC4RJg5wq0Hy/mDMiCdKTjSF//K
 GRYmFq+eFDDnASpcY/2o15ljbglL7gnoo+1H+OD8Xg6FZGNpzbb8wx9Sb
 vnYyqTi1QkFHbSZkXxwXRFHzOjhh0BhHnAVYUPrl69rNVnhgvFJxBSugp
 clQbkuJqjPpEFwihGV8JblWfBZ7t+OK2nIX4qDulre2UtMwcfsnhgbbNf
 K+xkXMAZ9g4zzvDFbLpFHFJgXxCWO4+MIRLyPv6IbqEaGBGCUKEfnLVsv
 eojejyoXjU77Rue2ATXpJ+0iTU5/6eeU1N+/v0ehgAEJYQyFIGdyb8jVR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="434279944"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="434279944"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 14:34:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3544079"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa004.fm.intel.com with ESMTP; 29 Jan 2024 14:34:07 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 1/1] drm/xe: Expose number of dss per group and helpers
Date: Mon, 29 Jan 2024 14:34:03 -0800
Message-Id: <20240129223403.150578-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129223403.150578-1-zhanjun.dong@intel.com>
References: <20240129223403.150578-1-zhanjun.dong@intel.com>
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

Expose helper for dss per group, features like GuC register
capture will need this info to prepare buffer required.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c          | 40 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_mcr.h          | 17 +++++++++++
 drivers/gpu/drm/xe/xe_gt_topology.c     |  3 --
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  3 ++
 4 files changed, 59 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 77925b35cf8d..706f9fd43f6e 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -291,11 +291,16 @@ static void init_steering_mslice(struct xe_gt *gt)
 	gt->steering[LNCF].instance_target = 0;		/* unused */
 }
 
+int xe_gt_get_dss_per_group(struct xe_gt *gt)
+{
+	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
+}
+
 static void init_steering_dss(struct xe_gt *gt)
 {
 	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
 			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
-	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
+	unsigned int dss_per_grp = xe_gt_get_dss_per_group(gt);
 
 	gt->steering[DSS].group_target = dss / dss_per_grp;
 	gt->steering[DSS].instance_target = dss % dss_per_grp;
@@ -683,3 +688,36 @@ void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p)
 		}
 	}
 }
+
+/**
+ * xe_gt_mcr_get_ss_steering - returns the group/instance steering for a SS
+ * @gt: GT structure
+ * @dss: DSS ID to obtain steering for
+ * @group: pointer to storage for steering group ID
+ * @instance: pointer to storage for steering instance ID
+ *
+ * Returns the steering IDs (via the @group and @instance parameters) that
+ * correspond to a specific subslice/DSS ID.
+ */
+void xe_gt_get_ss_steering(struct xe_gt *gt, unsigned int dss, unsigned int *group,
+			   unsigned int *instance)
+{
+	int dss_per_grp = xe_gt_get_dss_per_group(gt);
+
+	*group = dss / dss_per_grp;
+	*instance = dss % dss_per_grp;
+}
+
+bool xe_gt_dss_has_subslice(struct xe_gt *gt, int slice, int subslice)
+{
+	int dss_per_grp = xe_gt_get_dss_per_group(gt);
+	int index = slice * dss_per_grp + subslice;
+
+	if (index >= XE_MAX_DSS_FUSE_BITS) {
+		xe_gt_dbg(gt, "DSS id is out of range. slice: %d subslice: %d\n", slice, subslice);
+		return false;
+	} else {
+		return test_bit(index, gt->fuse_topo.g_dss_mask) ||
+		       test_bit(index, gt->fuse_topo.c_dss_mask);
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index 27ca1bc880a0..81b2efcb04c3 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
@@ -7,6 +7,7 @@
 #define _XE_GT_MCR_H_
 
 #include "regs/xe_reg_defs.h"
+#include "xe_gt_types.h"
 
 struct drm_printer;
 struct xe_gt;
@@ -25,5 +26,21 @@ void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
 			       u32 value);
 
 void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
+int xe_gt_get_dss_per_group(struct xe_gt *gt);
+void xe_gt_get_ss_steering(struct xe_gt *gt, unsigned int dss, unsigned int *group,
+			   unsigned int *instance);
+bool xe_gt_dss_has_subslice(struct xe_gt *gt, int slice, int subslice);
+
+#define _HAS_SS(gt_, group_, instance_) xe_gt_dss_has_subslice(gt_, group_, instance_)
+
+/*
+ * Loop over each subslice/DSS and determine the group and instance IDs that
+ * should be used to steer MCR accesses toward this DSS.
+ */
+#define for_each_ss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_get_ss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_DSS_FUSE_BITS; \
+	     ss_++, xe_gt_get_ss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(gt_, group_, instance_))
 
 #endif /* _XE_GT_MCR_H_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index a8d7f272c30a..e973eeaac7f1 100644
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
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index d7f828c76cc5..3e978a190041 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -65,6 +65,9 @@ struct xe_bo;
 struct xe_execlist_port;
 struct xe_gt;
 
+#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
+#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
+
 /**
  * struct xe_hw_engine_class_intf - per hw engine class struct interface
  *
-- 
2.34.1

