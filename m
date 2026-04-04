Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E51E88D86
	for <intel-xe@archiver.kernel.org>; Sat,  4 Apr 2026 06:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F52610F4C1;
	Sat,  4 Apr 2026 06:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fP203U8I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59C110F4C1
 for <intel-xe@lists.freedesktop.org>; Sat,  4 Apr 2026 06:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775283469; x=1806819469;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hn2usmkP0q4hT1fXmAxxV8aOx41RO+JIekEwn1vYxS8=;
 b=fP203U8IZhfT2hH9mHS6Lb9OvOZ6EDE0BtqomQlxTe+cd2nHr1GeTnw2
 ckRvX5l3v4INy7onCmSkgp8FqFA1pHgYOAPeLIdOwSGTnjtHivsiQB27C
 P1OtUN3KxmJMXhEW9/AnscqPIs6S08f9MuLr2LI3HmttgOAyZaMNEJXOp
 QEDyS2m3KuskSzY4bm/yu6uINty+R9jIPpqoJHUF6OEBkRIR8jDZOo9hh
 v8qmBB9pMoY98qxDbFYZK9khQJV4moEIRbhWWVlYVEF5ZM1os3yYfSGdA
 Zn1VZaekiqbtes0MxGxAfmxve8Uo8gt2a3aZaWM5WLeu2xhvbZRxYt4a0 g==;
X-CSE-ConnectionGUID: Vx876lRjTJu6Roj1PcA4cQ==
X-CSE-MsgGUID: OHuYLVZIRBO2hdycX0vpig==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="80189329"
X-IronPort-AV: E=Sophos;i="6.23,159,1770624000"; d="scan'208";a="80189329"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 23:17:47 -0700
X-CSE-ConnectionGUID: skpQ+ywkQsq35Y4mXfPWkw==
X-CSE-MsgGUID: eUCluZ97Qpi0JK3/eTAQwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,159,1770624000"; d="scan'208";a="222598009"
Received: from fyang16-desk.jf.intel.com ([10.88.27.164])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2026 23:17:47 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: Fei Yang <fei.yang@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH] drm/xe: Wait for HW clearance before issuing the next TLB
 inval.
Date: Fri,  3 Apr 2026 23:22:49 -0700
Message-ID: <20260404062250.3435419-1-fei.yang@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

From: Fei Yang <fei.yang@intel.com>

Hardware requires the software to poll the valid bit and make sure it's
cleared before issuing a new TLB invalidation request.
We also need to avoid racing against GuC on TLB invalidations by only
allowing KMD to issue TLB invalidation request during GuC reset.

v2: separate ggtt inval to xe_gam_port and call in guc_reset only (Matt)

Signed-off-by: Fei Yang <fei.yang@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/Makefile           |  1 +
 drivers/gpu/drm/xe/xe_gam_port.c      | 72 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gam_port.h      | 15 ++++++
 drivers/gpu/drm/xe/xe_gt.c            |  1 +
 drivers/gpu/drm/xe/xe_gt_types.h      |  7 +++
 drivers/gpu/drm/xe/xe_guc.c           |  4 ++
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 18 -------
 7 files changed, 100 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gam_port.c
 create mode 100644 drivers/gpu/drm/xe/xe_gam_port.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index f9abaf687d46..96127ad60e9b 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -78,6 +78,7 @@ xe-y += xe_bb.o \
 	xe_guc_rc.o \
 	xe_guc_submit.o \
 	xe_guc_tlb_inval.o \
+	xe_gam_port.o \
 	xe_heci_gsc.o \
 	xe_huc.o \
 	xe_hw_engine.o \
diff --git a/drivers/gpu/drm/xe/xe_gam_port.c b/drivers/gpu/drm/xe/xe_gam_port.c
new file mode 100644
index 000000000000..137887cf93b8
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gam_port.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_gt_stats.h"
+#include "xe_gt_types.h"
+#include "xe_gt_printk.h"
+#include "xe_mmio.h"
+#include "xe_gam_port.h"
+
+#include "regs/xe_guc_regs.h"
+
+/*
+ * GGTT TLB invalidation as part of GuC reset flow while the communication
+ * between host and GuC is disabled.
+ */
+
+int xe_gam_port_tlb_inval_ggtt(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_mmio *mmio = &gt->mmio;
+	int ret = 0;
+
+	spin_lock(&gt->mmio_tlb_invl_lock);
+
+	if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
+		/* Wait 1-second for the valid bit to be cleared */
+		ret = xe_mmio_wait32(mmio, PVC_GUC_TLB_INV_DESC0, PVC_GUC_TLB_INV_DESC0_VALID,
+				     0, 1000 * USEC_PER_MSEC, NULL, true);
+		if (ret) {
+			ret = -ECANCELED;
+			goto out;
+		}
+
+		xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1, PVC_GUC_TLB_INV_DESC1_INVALIDATE);
+		xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0, PVC_GUC_TLB_INV_DESC0_VALID);
+
+		/* Wait 1-second for the valid bit to be cleared */
+		ret = xe_mmio_wait32(mmio, PVC_GUC_TLB_INV_DESC0, PVC_GUC_TLB_INV_DESC0_VALID,
+				     0, 1000 * USEC_PER_MSEC, NULL, true);
+		if (ret) {
+			ret = -ECANCELED;
+			goto out;
+		}
+	} else {
+		/* Wait 1-second for the valid bit to be cleared */
+		ret = xe_mmio_wait32(mmio, GUC_TLB_INV_CR, GUC_TLB_INV_CR_INVALIDATE,
+				     0, 1000 * USEC_PER_MSEC, NULL, true);
+		if (ret) {
+			ret = -ECANCELED;
+			goto out;
+		}
+
+		xe_mmio_write32(mmio, GUC_TLB_INV_CR, GUC_TLB_INV_CR_INVALIDATE);
+
+		/* Wait 1-second for the valid bit to be cleared */
+		ret = xe_mmio_wait32(mmio, GUC_TLB_INV_CR, GUC_TLB_INV_CR_INVALIDATE,
+				     0, 1000 * USEC_PER_MSEC, NULL, true);
+		if (ret) {
+			ret = -ECANCELED;
+			goto out;
+		}
+	}
+
+out:
+	spin_unlock(&gt->mmio_tlb_invl_lock);
+
+	if (ret)
+		xe_gt_warn(gt, "TLB INVAL cancelled due to uncleared valid bit\n");
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_gam_port.h b/drivers/gpu/drm/xe/xe_gam_port.h
new file mode 100644
index 000000000000..b5c383d635f1
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gam_port.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_GAM_PORT_H_
+#define _XE_GAM_PORT_H_
+
+#include <linux/types.h>
+
+struct xe_gt;
+
+int xe_gam_port_tlb_inval_ggtt(struct xe_gt *gt);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 8a31c963c372..6bb990069eff 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -514,6 +514,7 @@ int xe_gt_init_early(struct xe_gt *gt)
 
 	xe_force_wake_init_gt(gt, gt_to_fw(gt));
 	spin_lock_init(&gt->global_invl_lock);
+	spin_lock_init(&gt->mmio_tlb_invl_lock);
 
 	err = xe_gt_tlb_inval_init_early(gt);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 8b55cf25a75f..2418a0b2f19c 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -324,6 +324,13 @@ struct xe_gt {
 	 */
 	spinlock_t global_invl_lock;
 
+	/**
+	 * @mmio_tlb_invl_lock: prevents back to back TLB invalidation
+	 *    without polling for hardware clearance for the previous
+	 *    invalidation
+	 */
+	spinlock_t mmio_tlb_invl_lock;
+
 	/** @wa_active: keep track of active workarounds */
 	struct {
 		/** @wa_active.gt: bitmap with active GT workarounds */
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index e762eada21db..70eff5b22fbb 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -48,6 +48,7 @@
 #include "xe_uc_fw.h"
 #include "xe_wa.h"
 #include "xe_wopcm.h"
+#include "xe_gam_port.h"
 
 static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
 			    struct xe_bo *bo)
@@ -991,6 +992,9 @@ int xe_guc_reset(struct xe_guc *guc)
 		goto err_out;
 	}
 
+	if (xe_gam_port_tlb_inval_ggtt(gt))
+		xe_gt_warn(gt, "GGTT TLB invalidation timed out\n");
+
 	return 0;
 
 err_out:
diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
index ced58f46f846..7c3e63e49760 100644
--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
@@ -61,8 +61,6 @@ static int send_tlb_inval_all(struct xe_tlb_inval *tlb_inval, u32 seqno)
 static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 {
 	struct xe_guc *guc = tlb_inval->private;
-	struct xe_gt *gt = guc_to_gt(guc);
-	struct xe_device *xe = guc_to_xe(guc);
 
 	/*
 	 * Returning -ECANCELED in this function is squashed at the caller and
@@ -77,22 +75,6 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
 		};
 
 		return send_tlb_inval(guc, action, ARRAY_SIZE(action));
-	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
-		struct xe_mmio *mmio = &gt->mmio;
-
-		if (IS_SRIOV_VF(xe))
-			return -ECANCELED;
-
-		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
-		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
-			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
-					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
-			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0,
-					PVC_GUC_TLB_INV_DESC0_VALID);
-		} else {
-			xe_mmio_write32(mmio, GUC_TLB_INV_CR,
-					GUC_TLB_INV_CR_INVALIDATE);
-		}
 	}
 
 	return -ECANCELED;
-- 
2.43.0

