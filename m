Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3B2C61D92
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 04:26:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1094B10E06A;
	Wed, 22 Nov 2023 04:26:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0CB10E02F
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 04:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700627155; x=1732163155;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NRuBtINp1hkUWhZ39KCaGLisSVUNzjl9uTMeTUTvnZc=;
 b=JPAZPRyqumGprZn7NWf7cvx21YFJeDMNqgjzVh85g+GHIg7+wldbGV2M
 tv4CBHTQEnYVHV/ujUPOxmSpLghL5eN3tVBtsHMyhWlcax0PKE/Is03D0
 D46m42ogQC27lbTzts4b17ExJMsBlCj/+qlD6d7R/l+tMD9tLAuya3eif
 QbqMaLK5AyjVkPmiI1Qy8YPnDosMB8ZgNxwDIgIb8m2DX30iiOOWavbdJ
 +nnPZtUUOiDzZEMRqBUYK5a0dmTo/jOKwhfsddAa8BpmUWdTgRe5aUfLX
 jtwHvG7kkHBmwN5kFFk6Vvg3ZN1A2K2mxTEnl+K/hhfbQ/GzoCHk3iBJV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="13528341"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; d="scan'208";a="13528341"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 20:25:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="857524519"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; d="scan'208";a="857524519"
Received: from kbommu-desk.iind.intel.com ([10.145.169.159])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Nov 2023 20:25:51 -0800
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Nov 2023 09:51:42 +0530
Message-Id: <20231122042142.6648-1-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] RFC: drm/xe: Return correct error code for
 xe_wait_user_fence_ioctl
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

return correct error code if exec_queue is reset/engine is hung
remove the num_engines/instances members from drm_xe_wait_user_fence structure
and add a exec_queue_id member

v2: Addressed the review comments

Need to validated the changes

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
 drivers/gpu/drm/xe/xe_execlist.c         |  7 +++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 13 +++++
 drivers/gpu/drm/xe/xe_wait_user_fence.c  | 60 +++++-------------------
 include/uapi/drm/xe_drm.h                | 13 +----
 5 files changed, 37 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 5ba47a5cfdbd..84ccf7242247 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -206,6 +206,8 @@ struct xe_exec_queue_ops {
 	 * signalled when this function is called.
 	 */
 	void (*resume)(struct xe_exec_queue *q);
+	/** @reset_status: check exec queue reset status */
+	bool (*reset_status)(struct xe_exec_queue *q);
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index e8754adfc52a..3b390f047108 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -446,6 +446,12 @@ static void execlist_exec_queue_resume(struct xe_exec_queue *q)
 	/* NIY */
 }
 
+static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
+{
+	 /* NIY */
+	 return false;
+}
+
 static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
 	.init = execlist_exec_queue_init,
 	.kill = execlist_exec_queue_kill,
@@ -457,6 +463,7 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
 	.suspend = execlist_exec_queue_suspend,
 	.suspend_wait = execlist_exec_queue_suspend_wait,
 	.resume = execlist_exec_queue_resume,
+	.reset_status = execlist_exec_queue_reset_status,
 };
 
 int xe_execlist_init(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9e9e925c7353..e13792e49a67 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -852,6 +852,10 @@ static void simple_error_capture(struct xe_exec_queue *q)
 static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_device *xe = guc_to_xe(guc);
+
+	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
+	wake_up_all(&xe->ufence_wq);
 
 	if (xe_exec_queue_is_lr(q))
 		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
@@ -1392,6 +1396,14 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
 	guc_exec_queue_add_msg(q, msg, RESUME);
 }
 
+static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
+{
+	if (exec_queue_registered(q))
+		return exec_queue_reset(q);
+
+	return false;
+}
+
 /*
  * All of these functions are an abstraction layer which other parts of XE can
  * use to trap into the GuC backend. All of these functions, aside from init,
@@ -1409,6 +1421,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.suspend = guc_exec_queue_suspend,
 	.suspend_wait = guc_exec_queue_suspend_wait,
 	.resume = guc_exec_queue_resume,
+	.reset_status = guc_exec_queue_reset_status,
 };
 
 static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 4d5c2555ce41..97af879ee923 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -13,6 +13,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_macros.h"
+#include "xe_exec_queue.h"
 
 static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
 {
@@ -58,27 +59,6 @@ static const enum xe_engine_class user_to_xe_engine_class[] = {
 	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
 };
 
-static int check_hw_engines(struct xe_device *xe,
-			    struct drm_xe_engine_class_instance *eci,
-			    int num_engines)
-{
-	int i;
-
-	for (i = 0; i < num_engines; ++i) {
-		enum xe_engine_class user_class =
-			user_to_xe_engine_class[eci[i].engine_class];
-
-		if (eci[i].gt_id >= xe->info.tile_count)
-			return -EINVAL;
-
-		if (!xe_gt_hw_engine(xe_device_get_gt(xe, eci[i].gt_id),
-				     user_class, eci[i].engine_instance, true))
-			return -EINVAL;
-	}
-
-	return 0;
-}
-
 #define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP | \
 			 DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)
 #define MAX_OP		DRM_XE_UFENCE_WAIT_OP_LTE
@@ -130,14 +110,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 			     struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
+	struct xe_file *xef = to_xe_file(file);
 	DEFINE_WAIT_FUNC(w_wait, woken_wake_function);
 	struct drm_xe_wait_user_fence *args = data;
-	struct drm_xe_engine_class_instance eci[XE_HW_ENGINE_MAX_INSTANCE];
-	struct drm_xe_engine_class_instance __user *user_eci =
-		u64_to_user_ptr(args->instances);
+	struct xe_exec_queue *q = NULL;
 	u64 addr = args->addr;
 	int err;
-	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP;
 	long timeout;
 	ktime_t start;
 
@@ -151,35 +129,17 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, args->op > MAX_OP))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, no_engines &&
-			 (args->num_engines || args->instances)))
-		return -EINVAL;
-
-	if (XE_IOCTL_DBG(xe, !no_engines && !args->num_engines))
-		return -EINVAL;
-
 	if (XE_IOCTL_DBG(xe, addr & 0x7))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, args->num_engines > XE_HW_ENGINE_MAX_INSTANCE))
-		return -EINVAL;
-
-	if (!no_engines) {
-		err = copy_from_user(eci, user_eci,
-				     sizeof(struct drm_xe_engine_class_instance) *
-			     args->num_engines);
-		if (XE_IOCTL_DBG(xe, err))
-			return -EFAULT;
-
-		if (XE_IOCTL_DBG(xe, check_hw_engines(xe, eci,
-						      args->num_engines)))
-			return -EINVAL;
-	}
-
 	timeout = to_jiffies_timeout(xe, args);
 
 	start = ktime_get();
 
+	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
+	if (XE_IOCTL_DBG(xe, !q))
+		return -ENOENT;
+
 	/*
 	 * FIXME: Very simple implementation at the moment, single wait queue
 	 * for everything. Could be optimized to have a wait queue for every
@@ -202,6 +162,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 			break;
 		}
 
+		if (q->ops->reset_status(q)) {
+			drm_info(&xe->drm, "exec gueue reset detected\n");
+			err = -EIO;
+			break;
+		}
+
 		timeout = wait_woken(&w_wait, TASK_INTERRUPTIBLE, timeout);
 	}
 	remove_wait_queue(&xe->ufence_wq, &w_wait);
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 88f3aca02b08..ae2457dc30ad 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -962,17 +962,8 @@ struct drm_xe_wait_user_fence {
 	 */
 	__s64 timeout;
 
-	/**
-	 * @num_engines: number of engine instances to wait on, must be zero
-	 * when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
-	 */
-	__u64 num_engines;
-
-	/**
-	 * @instances: user pointer to array of drm_xe_engine_class_instance to
-	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
-	 */
-	__u64 instances;
+	/** @exec_queue_id: exec_queue_id returned from xe_exec_queue_create_ioctl */
+	__u32 exec_queue_id;
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
-- 
2.25.1

