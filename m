Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC9BC54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 15:49:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEA210E7ED;
	Mon, 18 Mar 2024 15:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N4slhBCx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D7C10E7ED
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 15:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710776975; x=1742312975;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OqUZRLTyYsyUDlQDxRibicLRtgt45EJ/TjAJ/o/OX1w=;
 b=N4slhBCxsekk5WgVY3N5TBn2ZJMMm2D3R7h4b5h/ttRQf3/uKnxxxSv+
 sSNXXX3QdLyQoiQs1NNG1udLCToWfBJZtmF3F6OYxb++/+AjbRG5e4YGs
 /YWbrdfk9NqXzCE0RJffjjGnfUzZO5T33iRCyXsIeCqD0xEgExgUAlVu/
 Fs5aa7PevoQrczDsEBEXSvz0oFWo9TENjpoBMNPykHxNp02YVCYE8kjz3
 22Up/SwsDkzavRjoOD6NbHbLxjyAqVY4/4yALwGOpzX3OAZjRDj4/4/Rz
 sAXOmDPxNfyaki8JonVqVjtPmzJusjhlKOOXVhGwPZGTuuaF5uWBYVmbg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16323526"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="16323526"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 08:49:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13609468"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 08:49:34 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2] drm/xe: Always check force_wake_get return code
Date: Mon, 18 Mar 2024 08:49:24 -0700
Message-ID: <20240318154924.3453513-1-daniele.ceraolospurio@intel.com>
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

v2: use gt_WARN_ON where appropriate

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c         | 9 +++++++--
 drivers/gpu/drm/xe/xe_gsc.c                 | 2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 +-
 drivers/gpu/drm/xe/xe_guc.c                 | 5 +++--
 drivers/gpu/drm/xe/xe_guc_pc.c              | 2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c          | 4 +++-
 drivers/gpu/drm/xe/xe_query.c               | 3 ++-
 7 files changed, 18 insertions(+), 9 deletions(-)

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
index 09f6e7899921..8339b0b49dfb 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -326,7 +326,7 @@ static void gsc_work(struct work_struct *work)
 	spin_unlock_irq(&gsc->lock);
 
 	xe_pm_runtime_get(xe);
-	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
+	xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC));
 
 	if (actions & GSC_ACTION_ER_COMPLETE) {
 		ret = gsc_er_complete(gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index a3c4ffba679d..25b4111097bc 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -247,7 +247,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 
 		xe_gt_tlb_invalidation_wait(gt, seqno);
 	} else if (xe_device_uc_enabled(xe)) {
-		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
 		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
 			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
 					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index caa86ccbe9e7..9ed939c20602 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -250,10 +250,11 @@ static void guc_write_params(struct xe_guc *guc)
 static void guc_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_guc *guc = arg;
+	struct xe_gt *gt = guc_to_gt(guc);
 
-	xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
+	xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
-	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
+	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 }
 
 /**
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
index 82c955a2a15c..d51cb9a4a6b7 100644
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
index e80321b34918..fcd8680d2ccc 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -148,7 +148,8 @@ query_engine_cycles(struct xe_device *xe,
 	if (!hwe)
 		return -EINVAL;
 
-	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL))
+		return -EIO;
 
 	__read_timestamps(gt,
 			  RING_TIMESTAMP(hwe->mmio_base),
-- 
2.43.0

