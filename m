Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED05BC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 20:54:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B776110EB32;
	Fri,  8 Dec 2023 20:54:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1A110EB32
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 20:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702068877; x=1733604877;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YVgjtslg8g2a1oa6RFmZsL8+MscgvOgA9FXZkjEbb9Y=;
 b=IZx9TBYWUqhk1l/c4liH+ksWOPFSi5Gx5sWgLyWQ8tm7Qvz2f4WxGmvX
 /uuXFcnOW9EigSctOFlmqXFpWv2VMdEUMFn9WUXwgldK5kvU9r5mhDI+R
 AgYquZCbUK+y8RLhWEW4rbaZZ9HEyFj3RwWbwvFbMQ8OQsFX3uaPJPJ5y
 3D2dSMRJt9quoM2g5uDgoqiciTJ6Y2Rcmc/8ne7qmCssiayyVBuYb0ve1
 keeXZyqfbEASghMrSNPNa4g5WILoygVv1wpzj3arzoO+pdpJhRR1feIFg
 zwIWUIqBN4+ueCavCQs/uEIk/K3JPMYyxaCGhGZopV1omE6RuAaoxUGJB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1547407"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="1547407"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 12:54:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1019470251"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="1019470251"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 12:54:29 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Cleanup CCS mode related code
Date: Fri,  8 Dec 2023 12:54:24 -0800
Message-ID: <20231208205424.29759-1-niranjana.vishwanathapura@intel.com>
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
Cc: lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Refactor some of the CCS mode related code to make it compliant
with the coding guidelines.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 13 ++-----------
 drivers/gpu/drm/xe/xe_gt.c           |  4 ++--
 drivers/gpu/drm/xe/xe_gt.h           |  2 --
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 23 +++++++++++------------
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h  |  7 +++----
 5 files changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 5f5a72e9d0d8..cb9a1a34c2e5 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -405,18 +405,9 @@
 #define   RCU_MODE_FIXED_SLICE_CCS_MODE		REG_BIT(1)
 #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
 
-/*
- * Total of 4 cslices, where each cslice is in the form:
- *   [0-3]     CCS ID
- *   [4-6]     RSVD
- *   [7]       Disabled
- */
 #define CCS_MODE				XE_REG(0x14804)
-#define   CCS_MODE_CSLICE_0_3_MASK		REG_GENMASK(11, 0) /* 3 bits per cslice */
-#define   CCS_MODE_CSLICE_MASK			0x7 /* CCS0-3 + rsvd */
-#define   CCS_MODE_CSLICE_WIDTH			ilog2(CCS_MODE_CSLICE_MASK + 1)
-#define   CCS_MODE_CSLICE(cslice, ccs) \
-	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
+#define   CCS_MODE_CSLICE_0_3_MASK		REG_GENMASK(11, 0)
+#define   CCS_MODE_CSLICE_0_MASK		REG_GENMASK(2, 0)
 
 #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
 #define   FORCEWAKE_KERNEL			BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index dfd9cf01a5d5..523942cd1157 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -462,7 +462,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	/* Configure default CCS mode of 1 engine with all resources */
 	if (xe_gt_ccs_mode_enabled(gt)) {
 		gt->ccs_mode = 1;
-		xe_gt_apply_ccs_mode(gt);
+		xe_gt_ccs_mode_apply(gt);
 	}
 
 	if (IS_SRIOV_PF(gt_to_xe(gt)) && !xe_gt_is_media_type(gt))
@@ -584,7 +584,7 @@ static int do_gt_restart(struct xe_gt *gt)
 	}
 
 	/* Get CCS mode in sync between sw/hw */
-	xe_gt_apply_ccs_mode(gt);
+	xe_gt_ccs_mode_apply(gt);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index f3c780bd266d..11265e851a81 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -17,8 +17,6 @@
 		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
 			  xe_hw_engine_is_valid((hwe__)))
 
-#define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
-
 #ifdef CONFIG_FAULT_INJECTION
 extern struct fault_attr gt_reset_failure;
 static inline bool xe_fault_inject_gt_reset(void)
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
index 529fc286cd06..7e847c8eab32 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -12,17 +12,24 @@
 #include "xe_gt_sysfs.h"
 #include "xe_mmio.h"
 
-static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
+#define CCS_MODE_CSLICE_WIDTH		ilog2(CCS_MODE_CSLICE_0_MASK + 1)
+#define CCS_MODE_CSLICE(cslice, ccs)	\
+	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
+
+void xe_gt_ccs_mode_apply(struct xe_gt *gt)
 {
 	u32 mode = CCS_MODE_CSLICE_0_3_MASK; /* disable all by default */
 	int num_slices = hweight32(CCS_MASK(gt));
 	struct xe_device *xe = gt_to_xe(gt);
+	u32 num_engines = gt->ccs_mode;
 	int width, cslice = 0;
 	u32 config = 0;
 
-	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
+	if (!num_engines)
+		return;
 
-	xe_assert(xe, num_engines && num_engines <= num_slices);
+	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
+	xe_assert(xe, num_engines <= num_slices);
 	xe_assert(xe, !(num_slices % num_engines));
 
 	/*
@@ -60,7 +67,7 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
 			while ((CCS_MASK(gt) & BIT(cslice)) == 0)
 				cslice++;
 
-			mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_MASK);
+			mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_0_MASK);
 			mode |= CCS_MODE_CSLICE(cslice, hwe->instance);
 			cslice++;
 		}
@@ -72,14 +79,6 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
 		   mode, config, num_engines, num_slices);
 }
 
-void xe_gt_apply_ccs_mode(struct xe_gt *gt)
-{
-	if (!gt->ccs_mode)
-		return;
-
-	__xe_gt_apply_ccs_mode(gt, gt->ccs_mode);
-}
-
 static ssize_t
 num_cslices_show(struct device *kdev,
 		 struct device_attribute *attr, char *buf)
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
index f39975aaaab0..1d9d5f0bd222 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
@@ -6,12 +6,11 @@
 #ifndef _XE_GT_CCS_MODE_H_
 #define _XE_GT_CCS_MODE_H_
 
-#include "xe_device_types.h"
-#include "xe_gt.h"
 #include "xe_gt_types.h"
-#include "xe_platform_types.h"
 
-void xe_gt_apply_ccs_mode(struct xe_gt *gt);
+#define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
+
+void xe_gt_ccs_mode_apply(struct xe_gt *gt);
 void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt);
 
 static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
-- 
2.43.0

