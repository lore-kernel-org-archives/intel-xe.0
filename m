Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085C7C54798
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 23:19:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A00A110EAAF;
	Thu, 22 Feb 2024 23:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bhYfErUL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F0C10EAB4
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 23:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708643971; x=1740179971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SmFwIwwNoRWmopZ1suQe55/EEBEQHJizrouxnXXeHF8=;
 b=bhYfErULB08VZ5mRKHJ/Ey+SdDxJu9sBs3K2uYK8Hq4LtOYSQfg7RZus
 t7fdx6SX23304t1hvsfmew9lcUGWMHGLh9Tuf3lT/vghFMULItAhpHQlV
 BJs9ofe8YNujwhy5ATS/4OMmY0//sD0YwNZcTNTV4IVEYvIKw4gGqjGbI
 9IqXmjukKfag/AZ+XBnvQsqfGZVCv9p0RfqpF5wbmD2kpn2nFCM0LbCon
 Bzcb5Zb0nsxvwMO1htLcE3fX1Du2WTxah2PX98/t6llZarB4v/qPnuNvi
 zCmUYmUEeYcDg5J7V799P3qKxMV+aXegxUU8Xm6QjR1qmUcO2vxAzp4t7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3067683"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3067683"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 15:19:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="827621149"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="827621149"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 15:19:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 2/3] drm/xe: Cleanup some layering in GGTT
Date: Thu, 22 Feb 2024 15:20:20 -0800
Message-Id: <20240222232021.3911545-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222232021.3911545-1-matthew.brost@intel.com>
References: <20240222232021.3911545-1-matthew.brost@intel.com>
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

xe_ggtt.c touched GuC layers which is incorrect. Call into
xe_gt_tlb_invalidation layer instead.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_guc_regs.h       |  7 ++++
 drivers/gpu/drm/xe/xe_ggtt.c                | 37 ++++---------------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 40 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  2 +-
 4 files changed, 53 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index 92320bbc9d3d..4e7f809d2b00 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -110,6 +110,13 @@
 #define MED_VF_SW_FLAG(n)			XE_REG(0x190310 + (n) * 4)
 #define MED_VF_SW_FLAG_COUNT			4
 
+#define GUC_TLB_INV_CR				XE_REG(0xcee8)
+#define   GUC_TLB_INV_CR_INVALIDATE		REG_BIT(0)
+#define PVC_GUC_TLB_INV_DESC0			XE_REG(0xcf7c)
+#define   PVC_GUC_TLB_INV_DESC0_VALID		REG_BIT(0)
+#define PVC_GUC_TLB_INV_DESC1			XE_REG(0xcf80)
+#define   PVC_GUC_TLB_INV_DESC1_INVALIDATE	REG_BIT(6)
+
 /* GuC Interrupt Vector */
 #define GUC_INTR_GUC2HOST			REG_BIT(15)
 #define GUC_INTR_EXEC_ERROR			REG_BIT(14)
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index ab96edb058d6..5d46958e3144 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -19,7 +19,6 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_map.h"
-#include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_wopcm.h"
 
@@ -249,15 +248,11 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
 	return err;
 }
 
-#define GUC_TLB_INV_CR				XE_REG(0xcee8)
-#define   GUC_TLB_INV_CR_INVALIDATE		REG_BIT(0)
-#define PVC_GUC_TLB_INV_DESC0			XE_REG(0xcf7c)
-#define   PVC_GUC_TLB_INV_DESC0_VALID		REG_BIT(0)
-#define PVC_GUC_TLB_INV_DESC1			XE_REG(0xcf80)
-#define   PVC_GUC_TLB_INV_DESC1_INVALIDATE	REG_BIT(6)
-
 static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 {
+	struct xe_device *xe = gt_to_xe(gt);
+	int err;
+
 	if (!gt)
 		return;
 
@@ -267,29 +262,9 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 	 * and GuC are accessible.
 	 */
 	xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-
-	/* TODO: vfunc for GuC vs. non-GuC */
-
-	if (gt->uc.guc.submission_state.enabled) {
-		int seqno;
-
-		seqno = xe_gt_tlb_invalidation_guc(gt);
-		xe_gt_assert(gt, seqno > 0);
-		if (seqno > 0)
-			xe_gt_tlb_invalidation_wait(gt, seqno);
-	} else if (xe_device_uc_enabled(gt_to_xe(gt))) {
-		struct xe_device *xe = gt_to_xe(gt);
-
-		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
-			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
-					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
-			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC0,
-					PVC_GUC_TLB_INV_DESC0_VALID);
-		} else
-			xe_mmio_write32(gt, GUC_TLB_INV_CR,
-					GUC_TLB_INV_CR_INVALIDATE);
-	}
-
+	err = xe_gt_tlb_invalidation_ggtt(gt);
+	if (err)
+		drm_warn(&xe->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index e3a4131ebb58..48bf5fdb0fbe 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -11,7 +11,9 @@
 #include "xe_gt_printk.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
+#include "xe_mmio.h"
 #include "xe_trace.h"
+#include "regs/xe_guc_regs.h"
 
 #define TLB_TIMEOUT	(HZ / 4)
 
@@ -210,7 +212,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
  * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
  * negative error code on error.
  */
-int xe_gt_tlb_invalidation_guc(struct xe_gt *gt)
+static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt)
 {
 	u32 action[] = {
 		XE_GUC_ACTION_TLB_INVALIDATION,
@@ -222,6 +224,42 @@ int xe_gt_tlb_invalidation_guc(struct xe_gt *gt)
 				     ARRAY_SIZE(action));
 }
 
+/**
+ * xe_gt_tlb_invalidation_ggtt - Issue a TLB invalidation on this GT for the GGTT
+ * @gt: graphics tile
+ *
+ * Issue a TLB invalidation for the GGTT. Completion of TLB invalidation is
+ * synchronous.
+ *
+ * Return: 0 on success, negative error code on error
+ */
+int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
+	    gt->uc.guc.submission_state.enabled) {
+		int seqno;
+
+		seqno = xe_gt_tlb_invalidation_guc(gt);
+		if (seqno <= 0)
+			return seqno;
+
+		xe_gt_tlb_invalidation_wait(gt, seqno);
+	} else if (xe_device_uc_enabled(xe)) {
+		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
+			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
+					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
+			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC0,
+					PVC_GUC_TLB_INV_DESC0_VALID);
+		} else
+			xe_mmio_write32(gt, GUC_TLB_INV_CR,
+					GUC_TLB_INV_CR_INVALIDATE);
+	}
+
+	return 0;
+}
+
 /**
  * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for a VMA
  * @gt: graphics tile
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index b333c1709397..fbb743d80d2c 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -16,7 +16,7 @@ struct xe_vma;
 
 int xe_gt_tlb_invalidation_init(struct xe_gt *gt);
 void xe_gt_tlb_invalidation_reset(struct xe_gt *gt);
-int xe_gt_tlb_invalidation_guc(struct xe_gt *gt);
+int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
 int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 			       struct xe_gt_tlb_invalidation_fence *fence,
 			       struct xe_vma *vma);
-- 
2.34.1

