Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AC9C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 22:17:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8996F10FF32;
	Fri, 26 Jan 2024 22:17:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 724BE10FF32
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 22:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706307433; x=1737843433;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TrEK0oGkaBudeO7cx48QuHYMS29bUIOb5r3zS77z0cw=;
 b=Pmr9yi1MI9gyrUcRyNf/lanxKEF4ELirQXCphPh5sPnt6sT+aVHIj7F3
 3ZB9sEmv8fIb3cmbx19qKPG1tvny55eQW+3jcyRlQocBvshvTNTdIneu1
 YFEBkq5wCkEMOHazOxlm/e5ocbX4953YzICHg1hE5aGutgJD0qZG09KB9
 BKGUv67LDe4xUb3gawTJj2K+Xsm36IAXajrZFngwwQHJ+sO/IUF0hVw/M
 oEtnPIJEniGHv9GNFUZlhLSuH5Y7wd5vaRvYN3+bRndLkQYCsHo5kEHKj
 CfkNcKmw0LGX6NFVJ1SDJPDkhhw1hvk7PbKay8vi/ljRrMjBNtln/Xikw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="401458536"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="401458536"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 14:17:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="29221964"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa001.fm.intel.com with ESMTP; 26 Jan 2024 14:17:14 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/guc: Expose number of dss per group and helpers
Date: Fri, 26 Jan 2024 14:17:08 -0800
Message-Id: <20240126221708.304942-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

Expose helper for dss per group of mcr, features like GuC register
capture will need this info to prepare buffer required.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c          | 38 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_mcr.h          | 17 +++++++++++
 drivers/gpu/drm/xe/xe_gt_topology.c     |  3 --
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  3 ++
 4 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 77925b35cf8d..f7002623f3b5 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -291,11 +291,16 @@ static void init_steering_mslice(struct xe_gt *gt)
 	gt->steering[LNCF].instance_target = 0;		/* unused */
 }
 
+int xe_gt_mcr_get_dss_per_group(struct xe_gt *gt)
+{
+	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
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
@@ -683,3 +688,34 @@ void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p)
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
+void xe_gt_mcr_get_ss_steering(struct xe_gt *gt, unsigned int dss, unsigned int *group,
+			       unsigned int *instance)
+{
+	int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
+
+	*group = dss / dss_per_grp;
+	*instance = dss % dss_per_grp;
+}
+
+bool xe_gt_mcr_dss_has_subslice(struct xe_gt *gt, int slice, int subslice)
+{
+	int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
+	int index = slice * dss_per_grp + subslice;
+
+	if (index >= XE_MAX_DSS_FUSE_BITS)
+		return false;
+	else
+		return test_bit(index, gt->fuse_topo.g_dss_mask) ||
+		       test_bit(index, gt->fuse_topo.c_dss_mask);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index 27ca1bc880a0..1365b3e77226 100644
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
+int xe_gt_mcr_get_dss_per_group(struct xe_gt *gt);
+void xe_gt_mcr_get_ss_steering(struct xe_gt *gt, unsigned int dss,
+			       unsigned int *group, unsigned int *instance);
+bool xe_gt_mcr_dss_has_subslice(struct xe_gt *gt, int slice, int subslice);
+
+#define _HAS_SS(ss_, gt_, group_, instance_) xe_gt_mcr_dss_has_subslice(gt_, group_, instance_)
+
+/*
+ * Loop over each subslice/DSS and determine the group and instance IDs that
+ * should be used to steer MCR accesses toward this DSS.
+ */
+#define for_each_ss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_DSS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))
 
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

