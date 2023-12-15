Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91F3C41535
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 15:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C74810EA3E;
	Fri, 15 Dec 2023 15:46:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B273810EA3E
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 15:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702655168; x=1734191168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XqNkSl5/UFxHFWTqSu4jBf/4a4aks3/TlsVRsimlAQ0=;
 b=MCEYT9ntxWGm2Zu1hBMQGo/R1wbTCzud7e5W4Bw4E912VX/aqaadEDsm
 sR+VUQNcphBD46xrhkEj+4f1ClUa6jH4ScTTzt4ARyQy8KjAI+ocMY2j3
 KUSMRz+OeQkOsqHXPW30hxSJ+2Za2U2yEtjeb2ojPrJe+uA2Q2mB58NtP
 BfJyh+EmZDkBtjA1/Xwstl+Wim4++Jzib3Hj4ofG5SdgjW8cLnHxRcBn0
 5l2g9CYiCYtO4Tt4jiTCtV+3P9785066FJ9lwm091O12uc5m1u/hzQRJY
 xjA6yu0Ek/K098VA6/Kazqp8yFMG8E73suwvvqfO7jJUL5RpJsy6loi8n A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2141846"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="2141846"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="16324393"
Received: from sdiolatz-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.48.85])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:46:06 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 02/21] drm/xe/uapi: Return correct error code for
 xe_wait_user_fence_ioctl
Date: Fri, 15 Dec 2023 15:45:34 +0000
Message-Id: <20231215154553.7-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215154553.7-1-francois.dugast@intel.com>
References: <20231215154553.7-1-francois.dugast@intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>

Currently xe_wait_user_fence_ioctl is not checking exec_queue state
and blocking until timeout, with this patch wakeup the blocking wait
if exec_queue reset happen and returning proper error code

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
 drivers/gpu/drm/xe/xe_execlist.c         |  7 ++++++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 10 ++++++++
 drivers/gpu/drm/xe/xe_wait_user_fence.c  | 30 +++++++++++++++++++-----
 4 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index c7aefa1c8c31..bcf08b00d94a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -217,6 +217,8 @@ struct xe_exec_queue_ops {
 	 * signalled when this function is called.
 	 */
 	void (*resume)(struct xe_exec_queue *q);
+	/** @reset_status: check exec queue reset status */
+	bool (*reset_status)(struct xe_exec_queue *q);
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 507b6baec3dc..96b5224eb478 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -442,6 +442,12 @@ static void execlist_exec_queue_resume(struct xe_exec_queue *q)
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
@@ -453,6 +459,7 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
 	.suspend = execlist_exec_queue_suspend,
 	.suspend_wait = execlist_exec_queue_suspend_wait,
 	.resume = execlist_exec_queue_resume,
+	.reset_status = execlist_exec_queue_reset_status,
 };
 
 int xe_execlist_init(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ad5e19ecd33c..21ac68e3246f 100644
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
index 59af65b6ed89..b0a7896f7fcb 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -13,6 +13,7 @@
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_macros.h"
+#include "xe_exec_queue.h"
 
 static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
 {
@@ -100,10 +101,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
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
 
@@ -121,6 +124,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, addr & 0x7))
 		return -EINVAL;
 
+	if (args->exec_queue_id) {
+		q = xe_exec_queue_lookup(xef, args->exec_queue_id);
+		if (XE_IOCTL_DBG(xe, !q))
+			return -ENOENT;
+	}
+
 	timeout = to_jiffies_timeout(xe, args);
 
 	start = ktime_get();
@@ -136,6 +145,14 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 			break;
 		}
 
+		if (q) {
+			if (q->ops->reset_status(q)) {
+				drm_info(&xe->drm, "exec gueue reset detected\n");
+				err = -EIO;
+				break;
+			}
+		}
+
 		if (!timeout) {
 			err = -ETIME;
 			break;
@@ -151,10 +168,11 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 			args->timeout = 0;
 	}
 
-	if (XE_IOCTL_DBG(xe, err < 0))
-		return err;
-	else if (XE_IOCTL_DBG(xe, !timeout))
-		return -ETIME;
+	if (!timeout && !(err < 0))
+		err = -ETIME;
+
+	if (q)
+		xe_exec_queue_put(q);
 
-	return 0;
+	return err;
 }
-- 
2.34.1

