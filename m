Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBB0C10DCE
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 02:50:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2F110E669;
	Wed,  6 Dec 2023 02:50:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3E310E668
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 02:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701831011; x=1733367011;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LyfZoeFahAsq6QG1Icf6iS4JnYAd5oAQdZRgy4+lOaw=;
 b=bvHW3FT0VylgjybcCbwgoh3F/5bKFpmjBmOOnD9JzpdkaAqpjZCxMbRP
 6GFQvV8YNRbn8xeF0zbXlMIUd56It3Py8X5ge7GuGhCfo6aaqLSY/xfYN
 KaTlv4uM1x2aGSq1aq1m6GH6LZEupp70y/72OKywCmDGV2kmeQqPOa2Is
 SnZZ0t89k9uDK+AcZAmNA9wHg2FlUyYOAMZsDd7Cw3PfxXW54nWcXx8ib
 F1Qw6C5YRNZK3+7Gyd+PnvsqLgqiFW5EkgDXsmstXUffjkpPAnU3hxbFH
 Sly0xlRh8OZ/ybzVOLfPj5HlE3OvNFd0cyiOINSLjPpvhpQqlNjrCT+Lv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1086760"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1086760"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 18:50:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="771144194"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="771144194"
Received: from kbommu-desk.iind.intel.com ([10.145.169.159])
 by orsmga002.jf.intel.com with ESMTP; 05 Dec 2023 18:50:08 -0800
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 08:15:23 +0530
Message-Id: <20231206024523.29164-3-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206024523.29164-1-krishnaiah.bommu@intel.com>
References: <20231206024523.29164-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] drm/xe/uapi: Return correct error code
 for xe_wait_user_fence_ioctl
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

Currently xe_wait_user_fence_ioctl is not checking exec_queue state
and blocking until timeout, with this patch wakeup the blocking wait
if exec_queue reset happen and returning proper error code

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
 drivers/gpu/drm/xe/xe_execlist.c         |  7 ++++++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 10 +++++++++
 drivers/gpu/drm/xe/xe_wait_user_fence.c  | 27 +++++++++++++++++++-----
 4 files changed, 41 insertions(+), 5 deletions(-)

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
index e8754adfc52a..dab41e99f3d3 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -446,6 +446,12 @@ static void execlist_exec_queue_resume(struct xe_exec_queue *q)
 	/* NIY */
 }
 
+static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
+{
+	/* NIY */
+	return false;
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
index 46b132ee1d3a..a42c3574cbec 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -854,6 +854,10 @@ static void simple_error_capture(struct xe_exec_queue *q)
 static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_device *xe = guc_to_xe(guc);
+
+	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
+	wake_up_all(&xe->ufence_wq);
 
 	if (xe_exec_queue_is_lr(q))
 		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
@@ -1394,6 +1398,11 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
 	guc_exec_queue_add_msg(q, msg, RESUME);
 }
 
+static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
+{
+	return exec_queue_reset(q);
+}
+
 /*
  * All of these functions are an abstraction layer which other parts of XE can
  * use to trap into the GuC backend. All of these functions, aside from init,
@@ -1411,6 +1420,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 	.suspend = guc_exec_queue_suspend,
 	.suspend_wait = guc_exec_queue_suspend_wait,
 	.resume = guc_exec_queue_resume,
+	.reset_status = guc_exec_queue_reset_status,
 };
 
 static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 447e4cfd204c..b3740c3d306c 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -13,6 +13,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_macros.h"
+#include "xe_exec_queue.h"
 
 static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
 {
@@ -108,10 +109,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 			     struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
+	struct xe_file *xef = to_xe_file(file);
 	DEFINE_WAIT_FUNC(w_wait, woken_wake_function);
 	struct drm_xe_wait_user_fence *args = data;
+	struct xe_exec_queue *q = NULL;
 	u64 addr = args->addr;
-	int err;
+	int err = 0;
 	long timeout;
 	ktime_t start;
 
@@ -128,6 +131,10 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, addr & 0x7))
 		return -EINVAL;
 
+	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
+	if (XE_IOCTL_DBG(xe, !q))
+		return -ENOENT;
+
 	timeout = to_jiffies_timeout(xe, args);
 
 	start = ktime_get();
@@ -143,6 +150,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 			break;
 		}
 
+		if (q->ops->reset_status(q)) {
+			drm_info(&xe->drm, "exec gueue reset detected\n");
+			err = -EIO;
+			break;
+		}
+
 		if (!timeout) {
 			err = -ETIME;
 			break;
@@ -159,9 +172,13 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 	}
 
 	if (XE_IOCTL_DBG(xe, err < 0))
-		return err;
-	else if (XE_IOCTL_DBG(xe, !timeout))
-		return -ETIME;
+		goto err_exec_queue;
+	else if (XE_IOCTL_DBG(xe, !timeout)) {
+		err = -ETIME;
+		goto err_exec_queue;
+	}
 
-	return 0;
+err_exec_queue:
+	xe_exec_queue_put(q);
+	return err;
 }
-- 
2.25.1

