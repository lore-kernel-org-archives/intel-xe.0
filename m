Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E78C197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 20:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E70510E2BF;
	Thu, 16 Nov 2023 20:12:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E865210E2BF
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 20:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700165539; x=1731701539;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h9f3QhuTJd9iblejc4PJQukLw+9Xvm3Pvlo0C4xoXN4=;
 b=Al23LPKpYKKiWB8bu8AuoHyU0ziSKvCwC1lnKVxK8APxY9heGiNDnHCr
 eu5XVq/IipO/t7UsVUeNQiJ9SSD0SzWr+DRyzkcJDhsFQ0m6aVCwBwqVd
 93v7mwFyTAcUQuCQT6EX6LKNzL2zrDz4qSh8aphU+R3cteVlALBlLjGvG
 8d2kVolH231xT44x7qiDwDB+p2nF13ug915IRvxGN8LVo5e9MiB4STRIo
 9m45jCwLjlAyeSJstGw8SO/MUKvn+faLsblF/DZu6oz4VR/TNiBe2Zp1n
 TExjI9/Up5Bp5lAMgsXQXQTOwin2o1/Qe8S/+DpFCgp75ir1k2yomimIe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="370529768"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="370529768"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 12:12:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="13671974"
Received: from kbommu-desk.iind.intel.com ([10.145.169.159])
 by fmviesa001.fm.intel.com with ESMTP; 16 Nov 2023 12:12:16 -0800
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 17 Nov 2023 01:38:19 +0530
Message-Id: <20231116200819.29227-1-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] RFC: drm/xe: Return correct error code for
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

Need to validated the changes

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c      | 24 ++++------
 drivers/gpu/drm/xe/xe_guc_submit.h      | 20 ++++++++
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 64 +++++++------------------
 include/uapi/drm/xe_drm.h               | 16 ++-----
 4 files changed, 50 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9e9e925c7353..de2d2f7303d5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -42,21 +42,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 	return &q->gt->uc.guc;
 }
 
-/*
- * Helpers for engine state, using an atomic as some of the bits can transition
- * as the same time (e.g. a suspend can be happning at the same time as schedule
- * engine done being processed).
- */
-#define EXEC_QUEUE_STATE_REGISTERED		(1 << 0)
-#define ENGINE_STATE_ENABLED		(1 << 1)
-#define EXEC_QUEUE_STATE_PENDING_ENABLE	(1 << 2)
-#define EXEC_QUEUE_STATE_PENDING_DISABLE	(1 << 3)
-#define EXEC_QUEUE_STATE_DESTROYED		(1 << 4)
-#define ENGINE_STATE_SUSPENDED		(1 << 5)
-#define EXEC_QUEUE_STATE_RESET		(1 << 6)
-#define ENGINE_STATE_KILLED		(1 << 7)
-
-static bool exec_queue_registered(struct xe_exec_queue *q)
+bool exec_queue_registered(struct xe_exec_queue *q)
 {
 	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_REGISTERED;
 }
@@ -151,7 +137,7 @@ static void clear_exec_queue_suspended(struct xe_exec_queue *q)
 	atomic_and(~ENGINE_STATE_SUSPENDED, &q->guc->state);
 }
 
-static bool exec_queue_reset(struct xe_exec_queue *q)
+bool exec_queue_reset(struct xe_exec_queue *q)
 {
 	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_RESET;
 }
@@ -1681,6 +1667,9 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (!exec_queue_banned(q))
 		xe_guc_exec_queue_trigger_cleanup(q);
 
+	/* to wakeup xe_wait_user_fence ioctl if exec queue is reset */
+	wake_up_all(&xe->ufence_wq);
+
 	return 0;
 }
 
@@ -1708,6 +1697,9 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 	if (!exec_queue_banned(q))
 		xe_guc_exec_queue_trigger_cleanup(q);
 
+	/* to wakeup xe_wait_user_fence ioctl if exec queue is reset */
+	wake_up_all(&xe->ufence_wq);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index fc97869c5b86..4a0566e7e9f7 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -8,12 +8,32 @@
 
 #include <linux/types.h>
 
+#include "xe_exec_queue_types.h"
+#include "xe_guc_exec_queue_types.h"
+
+/*
+ * Helpers for engine state, using an atomic as some of the bits can transition
+ * as the same time (e.g. a suspend can be happning at the same time as schedule
+ * engine done being processed).
+ */
+#define EXEC_QUEUE_STATE_REGISTERED	(1 << 0)
+#define ENGINE_STATE_ENABLED		(1 << 1)
+#define EXEC_QUEUE_STATE_PENDING_ENABLE	(1 << 2)
+#define EXEC_QUEUE_STATE_PENDING_DISABLE	(1 << 3)
+#define EXEC_QUEUE_STATE_DESTROYED	(1 << 4)
+#define ENGINE_STATE_SUSPENDED		(1 << 5)
+#define EXEC_QUEUE_STATE_RESET		(1 << 6)
+#define ENGINE_STATE_KILLED		(1 << 7)
+
 struct drm_printer;
 struct xe_exec_queue;
 struct xe_guc;
 
 int xe_guc_submit_init(struct xe_guc *guc);
 
+bool exec_queue_reset(struct xe_exec_queue *q);
+bool exec_queue_registered(struct xe_exec_queue *q);
+
 int xe_guc_submit_reset_prepare(struct xe_guc *guc);
 void xe_guc_submit_reset_wait(struct xe_guc *guc);
 int xe_guc_submit_stop(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 78686908f7fb..5ee1062a4623 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -13,6 +13,10 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_macros.h"
+#include "xe_guc_submit.h"
+#include "xe_exec_queue.h"
+#include "xe_exec_queue_types.h"
+#include "xe_guc_exec_queue_types.h"
 
 static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
 {
@@ -58,27 +62,6 @@ static const enum xe_engine_class user_to_xe_engine_class[] = {
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
 #define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_SOFT_OP | \
 			 DRM_XE_UFENCE_WAIT_ABSTIME)
 #define MAX_OP		DRM_XE_UFENCE_WAIT_LTE
@@ -130,14 +113,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
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
-	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_SOFT_OP;
 	long timeout;
 	ktime_t start;
 
@@ -151,35 +132,17 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
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
@@ -203,6 +166,13 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 		}
 
 		timeout = wait_woken(&w_wait, TASK_INTERRUPTIBLE, timeout);
+
+		if (exec_queue_registered(q)) {
+			if (exec_queue_reset(q)) {
+				drm_info(&xe->drm, "exec gueue reset detected\n");
+				err = -EIO;
+			}
+		}
 	}
 	remove_wait_queue(&xe->ufence_wq, &w_wait);
 
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index e007dbefd627..0bcd7914db36 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -132,8 +132,7 @@ struct drm_xe_engine_class_instance {
 #define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
 #define DRM_XE_ENGINE_CLASS_COMPUTE		4
 	/*
-	 * Kernel only classes (not actual hardware engine class). Used for
-	 * creating ordered queues of VM bind operations.
+	 * Used for creating ordered queues of VM bind operations.
 	 */
 #define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
 #define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6
@@ -955,16 +954,11 @@ struct drm_xe_wait_user_fence {
 	__s64 timeout;
 
 	/**
-	 * @num_engines: number of engine instances to wait on, must be zero
-	 * when DRM_XE_UFENCE_WAIT_SOFT_OP set
-	 */
-	__u64 num_engines;
-
-	/**
-	 * @instances: user pointer to array of drm_xe_engine_class_instance to
-	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_SOFT_OP set
+	 * @exec_queue_id: exec_queue_id, must be of class DRM_XE_ENGINE_CLASS_VM_BIND
+	 * and exec queue must have same vm_id. If zero, the default VM bind engine
+	 * is used.
 	 */
-	__u64 instances;
+	__u32 exec_queue_id;
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
-- 
2.25.1

