Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4754EC54E58
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 19:43:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045EE10E248;
	Tue, 12 Mar 2024 19:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MCmX3q65";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444DB10E248
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 19:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710272585; x=1741808585;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vu1UxnkWeYq2aSuTzhD2TEMLC2YzWbzz6vwmLO6X0pY=;
 b=MCmX3q65ZWPd4AtdRA2ztG+71avSCejqLqHOi8VxELq5KKDJWRZ/9pvX
 sa2YNnVVPXoA7RCJ5U4bWVz509Me7P70cmRBGDTe3klsheqGXcQ9XbGBw
 ed67hcjoyfS/qjndOpXBeop+2nl0hxQDziHFV2/abUIAlIbnLvJS1BZoY
 bT9bevMFqxdeiaFl+MuJtDXB1VIT6pc9+Ng5jvgiAEoorCpwGpnwTpgD0
 4Wg2keeOKt0NbjMZPQkIZz8+t8+vS3oj7XX+Ro/VB4b9OTJbvO15Q30mc
 iuOhCqqoH57NtyoNPS7AYu0dT6hN+we0Algt6ftOrGwouZ92k41W/WhsM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="22457293"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="22457293"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 12:43:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11572662"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 12:43:04 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe: Always check force_wake_get return code
Date: Tue, 12 Mar 2024 12:42:56 -0700
Message-ID: <20240312194256.965685-1-daniele.ceraolospurio@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

A force_wake_get failure means that the HW might not be awake for the
access we're doing; this can lead to an immediate error or it can be a
more subtle problem (e.g. a register read might return an incorrect
value that is still valid, leading the driver to make a wrong choice
instead of flagging an error).
We avoid an error from the force_wake function because callers might
handle or tolerate the error, but this only works if all callers
are checking the error code. The majority already do, but a few are not.
These are mainly falling into 3 categories, which are each handled
differently:

1) error capture: in this case we want to continue the capture, but we
   log an info message in dmesg to notify the user that the capture
   might have incorrect data.

2) ioctl: in this case we return a -EIO error to userspace

3) unabortable actions: these are scenarios where we can't simply abort
   and retry and so it's better to just try it anyway because there is a
   chance the HW is awake even with the failure. In this case we throw a
   warning so we know there was a forcewake problem if something fails
   down the line.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c         | 9 +++++++--
 drivers/gpu/drm/xe/xe_gsc.c                 | 2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 +-
 drivers/gpu/drm/xe/xe_guc.c                 | 2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c              | 2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c          | 4 +++-
 drivers/gpu/drm/xe/xe_query.c               | 3 ++-
 7 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 0fcd30680323..7d3aa6bd3524 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -13,6 +13,7 @@
 #include "xe_exec_queue.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_submit.h"
 #include "xe_hw_engine.h"
@@ -64,7 +65,9 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 {
 	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
 
-	xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
+	/* keep going if fw fails as we still want to save the memory and SW data */
+	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
+		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
 	xe_vm_snapshot_capture_delayed(ss->vm);
 	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
 	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
@@ -180,7 +183,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
 		}
 	}
 
-	xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
+	/* keep going if fw fails as we still want to save the memory and SW data */
+	if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
+		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
 
 	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
 	coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(job);
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index d9aa815a5bc2..902c52d95a8a 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -287,7 +287,7 @@ static void gsc_work(struct work_struct *work)
 	spin_unlock_irq(&gsc->lock);
 
 	xe_pm_runtime_get(xe);
-	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
+	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC));
 
 	if (actions & GSC_ACTION_FW_LOAD) {
 		ret = gsc_upload_and_init(gsc);
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index a3c4ffba679d..7f1ac02b96c6 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -247,7 +247,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 
 		xe_gt_tlb_invalidation_wait(gt, seqno);
 	} else if (xe_device_uc_enabled(xe)) {
-		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
 		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
 			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
 					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index caa86ccbe9e7..32b6da891f72 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -251,7 +251,7 @@ static void guc_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_guc *guc = arg;
 
-	xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
+	XE_WARN_ON(xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL));
 	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
 	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index f4b031b8d9de..b4b39bfcb5d5 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -927,7 +927,7 @@ static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
 		return;
 	}
 
-	xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
+	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
 	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
 	XE_WARN_ON(xe_guc_pc_stop(pc));
 	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 19efdb2f881f..d7462969af1e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -833,7 +833,9 @@ static void simple_error_capture(struct xe_exec_queue *q)
 			}
 		}
 
-		xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
+		if (xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL))
+			xe_gt_info(guc_to_gt(guc),
+				   "failed to get forcewake for error capture");
 		xe_guc_ct_print(&guc->ct, &p, true);
 		guc_exec_queue_print(q, &p);
 		for_each_hw_engine(hwe, guc_to_gt(guc), id) {
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index a6a20a6dd360..3975f99fdca5 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -147,7 +147,8 @@ query_engine_cycles(struct xe_device *xe,
 	if (!hwe)
 		return -EINVAL;
 
-	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL))
+		return -EIO;
 
 	__read_timestamps(gt,
 			  RING_TIMESTAMP(hwe->mmio_base),
-- 
2.43.0

