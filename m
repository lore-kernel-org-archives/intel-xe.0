Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA25C46CD3
	for <intel-xe@archiver.kernel.org>; Sun, 17 Dec 2023 00:50:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455E610E3C7;
	Sun, 17 Dec 2023 00:50:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4613010E3C1
 for <intel-xe@lists.freedesktop.org>; Sun, 17 Dec 2023 00:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702774254; x=1734310254;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uxt5X/c/6qQ0+a8prAK26aBdZ6ifjm2B8xGJQhhGgqo=;
 b=NMB11U+e/cfWMI8EDfe8y/2CotWCs3BOCvL5gb8V8qxhVHztQcj10Lt1
 r6yM9EKyvCbYwh01g8L2WA1fHQdG5w7HOs3IvdB4VkM9v6XihpdbTns2s
 uacZ+oNHekwNfaCe3qpk7pVTnalcu7CVppP/yn/ldgAjxSHQnIpDE16hW
 ugw2HjZtkOAyfM6JgoVDmhBo8Ay6jGAyE4PHl13snfUgbAly3fGyx/F2d
 zjU6mLDKIv6xjZLcFBDoIlAYmufDUG2g4IeAfj+IHgmo3hYW6IfIDxivY
 vYZvdWjOL7tuN+FCziE/oTxdJMKk/MFO3vuFEyviOq/tImBuKDj6ubKc1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="14074771"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; d="scan'208";a="14074771"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2023 13:41:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="768387059"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; d="scan'208";a="768387059"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2023 13:41:24 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/3] drm/xe: Cleanup CCS mode related code
Date: Sat, 16 Dec 2023 13:41:16 -0800
Message-ID: <20231216214120.7394-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231216214120.7394-1-niranjana.vishwanathapura@intel.com>
References: <20231216214120.7394-1-niranjana.vishwanathapura@intel.com>
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

v2: Fix macro usage

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 12 +-------
 drivers/gpu/drm/xe/xe_gt.c           |  4 +--
 drivers/gpu/drm/xe/xe_gt.h           |  2 --
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 45 ++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h  | 12 ++------
 5 files changed, 37 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 1dd361046b5dc..2d9c004838437 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -386,18 +386,8 @@
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
+#define   CCS_MODE_CSLICE_ASSIGNMENT		REG_GENMASK(2, 0)
 
 #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
 #define   FORCEWAKE_KERNEL			BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3af2adec12956..342f82f245f39 100644
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
index f3c780bd266dd..11265e851a811 100644
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
index 529fc286cd06c..ee1065c44da7f 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -12,17 +12,38 @@
 #include "xe_gt_sysfs.h"
 #include "xe_mmio.h"
 
-static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
+#define CCS_MODE_CSLICE_WIDTH		ilog2(CCS_MODE_CSLICE_ASSIGNMENT + 1)
+#define CCS_MODE_CSLICE(cslice, ccs)	\
+	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
+
+#define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
+
+/* Get CCS mode mask to disable all compute slices */
+static u32 xe_gt_ccs_mode_disabled(struct xe_gt *gt)
 {
-	u32 mode = CCS_MODE_CSLICE_0_3_MASK; /* disable all by default */
+	int i, num_slices = hweight32(gt->info.__engine_mask & XE_HW_ENGINE_CCS_MASK);
+	u32 mode = 0;
+
+	for (i = 0; i < num_slices; i++)
+		mode |= CCS_MODE_CSLICE(i, CCS_MODE_CSLICE_ASSIGNMENT);
+
+	return mode;
+}
+
+void xe_gt_ccs_mode_apply(struct xe_gt *gt)
+{
+	u32 mode = xe_gt_ccs_mode_disabled(gt); /* disable all by default */
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
@@ -60,7 +81,7 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
 			while ((CCS_MASK(gt) & BIT(cslice)) == 0)
 				cslice++;
 
-			mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_MASK);
+			mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_ASSIGNMENT);
 			mode |= CCS_MODE_CSLICE(cslice, hwe->instance);
 			cslice++;
 		}
@@ -72,14 +93,6 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
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
@@ -189,3 +202,9 @@ void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
 			 __func__, err);
 	}
 }
+
+bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
+{
+	/* Check if there are more than one compute engines available */
+	return hweight32(CCS_MASK(gt)) > 1;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
index f39975aaaab0d..0dc191a59525c 100644
--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
@@ -6,19 +6,11 @@
 #ifndef _XE_GT_CCS_MODE_H_
 #define _XE_GT_CCS_MODE_H_
 
-#include "xe_device_types.h"
-#include "xe_gt.h"
 #include "xe_gt_types.h"
-#include "xe_platform_types.h"
 
-void xe_gt_apply_ccs_mode(struct xe_gt *gt);
+void xe_gt_ccs_mode_apply(struct xe_gt *gt);
 void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt);
-
-static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
-{
-	/* Check if there are more than one compute engines available */
-	return hweight32(CCS_MASK(gt)) > 1;
-}
+bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt);
 
 #endif
 
-- 
2.43.0

