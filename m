Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7B0CD5BD1
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 09:02:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B3310E471;
	Tue, 26 May 2026 09:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NcHqdanj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9402710E1A5
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 09:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779786141; x=1811322141;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3fPXg8isnKng4w5MNobInpw4WShJ5VpQa+U2OiJqwb8=;
 b=NcHqdanjGoOmivSmnRxYGkCWk+rEcGes4MoX0+jNIxC7JsX9i63mUQfm
 Ets2WQGX2/U5MoQA6ge4NBEzuJB6uZa56yEfDooQMnp7k6bD/M7O5WgLT
 jPdylDlT4pQz4Zh/bZC4hvcBOOwyl7x9/8D5XQXfcvm8PqPCB/Zkyf+F+
 y8U2OPqr6L3GftPBGKADHu8cjxH08Xu4Kfa99LLkvuh8JDDaqxW9AQh2X
 bKXHsj9lVYLQS3MadRN8ekfTRX6xFmnBSHZA5V5LauuT7P86AqhR1p8Kh
 C9szs1tIXIUPfBhLzWuua2iJ03gD/mc8/e6jhy7iNWO232sEbo061Hm6M g==;
X-CSE-ConnectionGUID: U/KbcQMvQWCrO0fxk3w9pw==
X-CSE-MsgGUID: gpIPisd7TqOIZywrVY641g==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="84449608"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="84449608"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 02:02:21 -0700
X-CSE-ConnectionGUID: MklDaleBRR2K/Otvu+N35g==
X-CSE-MsgGUID: zZKwdZRoRdWPGLl1Fd+qgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="246130884"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 02:02:19 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com
Subject: [PATCH] drm/xe/guc: Avoid self-deadlock in queue destruction
Date: Tue, 26 May 2026 14:32:02 +0530
Message-ID: <20260526090202.2957453-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

GuC exec queue destruction can run on xe->destroy_wq. During queue
cleanup, xe_exec_queue_fini() can drop the last reference to objects
which eventually release the DRM device and run drmm cleanup actions.

guc_submit_sw_fini(), registered as a drmm action, drains
xe->destroy_wq. If the final drm_dev_put() happens from an
xe->destroy_wq worker, teardown can try to drain the same workqueue
the current worker is running on, causing a self-deadlock.

Fix this by taking an extra drm_device reference across async exec queue
cleanup and dropping it from system_dfl_wq. The deferred put work
is preallocated during queue init, so the destroy worker does not need
to allocate memory.

This keeps the final drm_dev_put() out of xe->destroy_wq while preserving
exec queue teardown ordering.

Fixes: 2d2be279f1ca ("drm/xe: fix UAF around queue destruction")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  3 +
 drivers/gpu/drm/xe/xe_guc_submit.c           | 62 ++++++++++++++++++--
 2 files changed, 59 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index e5e53b421f29..b5dfc9c9092d 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -13,6 +13,7 @@
 
 struct dma_fence;
 struct xe_exec_queue;
+struct xe_drm_dev_put_work;
 
 /**
  * struct xe_guc_exec_queue - GuC specific state for an xe_exec_queue
@@ -35,6 +36,8 @@ struct xe_guc_exec_queue {
 	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
 	/** @destroy_async: do final destroy async from this worker */
 	struct work_struct destroy_async;
+	/** @dev_put_work: deferred drm_dev_put worker to avoid self-deadlock */
+	struct xe_drm_dev_put_work *dev_put_work;
 	/** @resume_time: time of last resume */
 	u64 resume_time;
 	/** @state: GuC specific state for this xe_exec_queue */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index afd8cc7bd231..81d513d1f54d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -10,6 +10,7 @@
 #include <linux/circ_buf.h>
 #include <linux/dma-fence-array.h>
 
+#include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 
 #include "abi/guc_actions_abi.h"
@@ -47,6 +48,11 @@
 
 #define XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN		6
 
+struct xe_drm_dev_put_work {
+	struct work_struct work;
+	struct drm_device *drm;
+};
+
 static int guc_submit_reset_prepare(struct xe_guc *guc);
 
 static struct xe_guc *
@@ -1677,6 +1683,8 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
 	xe_sched_entity_fini(&ge->entity);
 	xe_sched_fini(&ge->sched);
 
+	kfree(ge->dev_put_work);
+
 	/*
 	 * RCU free due sched being exported via DRM scheduler fences
 	 * (timeline name).
@@ -1684,20 +1692,55 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
 	kfree_rcu(ge, rcu);
 }
 
-static void __guc_exec_queue_destroy_async(struct work_struct *w)
+static void xe_drm_dev_put_work_func(struct work_struct *work)
 {
-	struct xe_guc_exec_queue *ge =
-		container_of(w, struct xe_guc_exec_queue, destroy_async);
-	struct xe_exec_queue *q = ge->q;
+	struct xe_drm_dev_put_work *put =
+		container_of(work, struct xe_drm_dev_put_work, work);
+
+	drm_dev_put(put->drm);
+	kfree(put);
+}
+
+static void guc_exec_queue_do_destroy(struct xe_exec_queue *q, bool defer_dev_put)
+{
+	struct xe_guc_exec_queue *ge = q->guc;
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_device *xe = guc_to_xe(guc);
+	struct drm_device *drm = &xe->drm;
+	struct xe_drm_dev_put_work *put_work = NULL;
 
-	guard(xe_pm_runtime)(guc_to_xe(guc));
+	if (defer_dev_put) {
+		put_work = ge->dev_put_work;
+		ge->dev_put_work = NULL;
+
+		put_work->drm = drm;
+		INIT_WORK(&put_work->work, xe_drm_dev_put_work_func);
+
+		/*
+		 * Avoid running the final drm_dev_put() from xe->destroy_wq,
+		 * since guc_submit_sw_fini() drains that queue.
+		 */
+		drm_dev_get(drm);
+	}
+
+	guard(xe_pm_runtime)(xe);
 	trace_xe_exec_queue_destroy(q);
 
 	/* Confirm no work left behind accessing device structures */
 	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
 
 	xe_exec_queue_fini(q);
+
+	if (put_work)
+		queue_work(system_dfl_wq, &put_work->work);
+}
+
+static void __guc_exec_queue_destroy_async(struct work_struct *w)
+{
+	struct xe_guc_exec_queue *ge =
+		container_of(w, struct xe_guc_exec_queue, destroy_async);
+
+	guc_exec_queue_do_destroy(ge->q, true);
 }
 
 static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
@@ -1709,7 +1752,7 @@ static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
 
 	/* We must block on kernel engines so slabs are empty on driver unload */
 	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
-		__guc_exec_queue_destroy_async(&q->guc->destroy_async);
+		guc_exec_queue_do_destroy(q, false);
 	else
 		queue_work(xe->destroy_wq, &q->guc->destroy_async);
 }
@@ -1950,6 +1993,12 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	if (!ge)
 		return -ENOMEM;
 
+	ge->dev_put_work = kmalloc_obj(*ge->dev_put_work, GFP_KERNEL);
+	if (!ge->dev_put_work) {
+		kfree(ge);
+		return -ENOMEM;
+	}
+
 	q->guc = ge;
 	ge->q = q;
 	init_rcu_head(&ge->rcu);
@@ -2027,6 +2076,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 err_sched:
 	xe_sched_fini(&ge->sched);
 err_free:
+	kfree(ge->dev_put_work);
 	kfree(ge);
 
 	return err;
-- 
2.43.0

