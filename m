Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72132C47DA7
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 23:16:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A9210E605;
	Tue, 16 Jan 2024 23:16:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EB810E0C6
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 23:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705446963; x=1736982963;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OunvtUrBNKIjYd78Fg73GCZYNO4cROz/iRLSojQTA9E=;
 b=bYGUlJU969Nn/b0OYLvQcXVb7DAxUrPqaiTxRBwdo9qNyQuLe2STaKtO
 G3WRMcjQTYEREe5nriJpCj3uJXOEetvgWgYgNyMP7cn8uYt5rNjb03zOD
 md7grrI7TrxC8hs9e/8fvlT2C+uBoOZGZC4MoByUCgV03ihOfNjidFylE
 SZyP3fbI2lZxrteXmtLNKioYBjeiCDcv/Xkv3BygfLQWO+0JdjQ6/8bQa
 0GtW1xZqfkS8jVuXVag8llOD926gEuF+xjCFBg7zvSzSl7j3x4kkbH6dC
 NoA0hL++RXD0AYpWz6LQ0F+iQxj7bqog4Kfa9AH1eSbmhU7CYs+Ow3OEv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="397171514"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="397171514"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 15:16:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="1031147494"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="1031147494"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmsmga006.fm.intel.com with ESMTP; 16 Jan 2024 15:16:03 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe/guc: Expose dss per group for GuC error capture
Date: Tue, 16 Jan 2024 15:15:53 -0800
Message-Id: <20240116231600.154097-3-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240116231600.154097-1-zhanjun.dong@intel.com>
References: <20240116231600.154097-1-zhanjun.dong@intel.com>
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

Expose helper for dss per group of mcr, GuC error capture feature
need this info to prepare buffer required.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c          |  2 +-
 drivers/gpu/drm/xe/xe_gt_mcr.h          |  3 +++
 drivers/gpu/drm/xe/xe_gt_topology.c     |  3 ---
 drivers/gpu/drm/xe/xe_guc_capture.c     | 27 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  3 +++
 5 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 77925b35cf8d..5874eb71cbc1 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -295,7 +295,7 @@ static void init_steering_dss(struct xe_gt *gt)
 {
 	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
 			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
-	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
+	unsigned int dss_per_grp = XE_GT_MCR_DSS_PER_GROUP(gt);
 
 	gt->steering[DSS].group_target = dss / dss_per_grp;
 	gt->steering[DSS].instance_target = dss % dss_per_grp;
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index 27ca1bc880a0..fa879bf5c271 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
@@ -7,10 +7,13 @@
 #define _XE_GT_MCR_H_
 
 #include "regs/xe_reg_defs.h"
+#include "xe_gt_types.h"
 
 struct drm_printer;
 struct xe_gt;
 
+#define XE_GT_MCR_DSS_PER_GROUP(gt) (gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4);
+
 void xe_gt_mcr_init(struct xe_gt *gt);
 
 void xe_gt_mcr_set_implicit_defaults(struct xe_gt *gt);
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
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 0870bfd1b88d..09a61894cf6f 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -93,6 +93,33 @@
 	{ SFC_DONE(2),		    0,      0, "SFC_DONE[2]" }, \
 	{ SFC_DONE(3),		    0,      0, "SFC_DONE[3]" }
 
+static inline void xe_gt_mcr_get_ss_steering(struct xe_gt *gt, unsigned int dss,
+					     unsigned int *group, unsigned int *instance)
+{
+	int dss_per_grp = XE_GT_MCR_DSS_PER_GROUP(gt);
+	*group = dss / dss_per_grp;
+	*instance = dss % dss_per_grp;
+}
+
+static inline bool xe_sseu_has_subslice(struct xe_gt *gt, int slice, int subslice)
+{
+	int dss_per_grp = XE_GT_MCR_DSS_PER_GROUP(gt);
+	int index = slice * dss_per_grp + subslice;
+	return index >= XE_MAX_DSS_FUSE_BITS ? false : test_bit(index, gt->fuse_topo.g_dss_mask);
+}
+
+#define _HAS_SS(ss_, gt_, group_, instance_) xe_sseu_has_subslice(gt_, group_, instance_)
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
+
 int xe_guc_capture_init(struct xe_guc *guc)
 {
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index dfeaaac08b7f..c258228b244f 100644
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

