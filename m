Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FA8CF9C5D
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 17:26:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240C010E069;
	Fri, 20 Sep 2024 17:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kEP15gem";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E6C10E069
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 17:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726853191; x=1758389191;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=99J/E8a3Dd5i7gMfkBZzBX9Boeg1oCZlNmlkkdALR1c=;
 b=kEP15gemlpJj4WvF/7A/2k/ox40FstgA+SCJeAaZfTVeTSG4i023teSc
 GgGXJYU6eQU2YJI2o3hLpADBtzMhTAZY4naHS9CQgg8AyrL3tG9fJ+omm
 sftwQGUY4H8PYsNqDdg0u/v1BjwsFxU38kNLbnb2bbDTmxGqcrP0OpeOt
 r3dKATu/uUg6qxqvD9sbfnempYuNZnbTAmjUAPH7nODyQuVABiYZW7R0Z
 EPmjAehoEmdo/zEcgAezd756sV7S88t0uyEFfq9BRToaZcUk6OKwUR306
 s2f18J/OexiRLAjtuqVLmqRV4EnL2b4ZfeR1W89XBa09whSq6dNK2N4kj g==;
X-CSE-ConnectionGUID: EJIpl7k0TBOlXFLIjvkapg==
X-CSE-MsgGUID: bUE4jg6MSKmD1eLNMCS4bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="51289081"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="51289081"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 10:26:31 -0700
X-CSE-ConnectionGUID: VnXQZk9zRfG1xKemdVNpvA==
X-CSE-MsgGUID: Q4cVWDIbS9SE7WgdIqvXhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="74919705"
Received: from opintica-mobl1 (HELO mwauld-desk.intel.com) ([10.245.245.19])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 10:26:30 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/xe: fix UAF around queue destruction
Date: Fri, 20 Sep 2024 18:26:00 +0100
Message-ID: <20240920172559.208358-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.0
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

We currently do stuff like queuing the final destruction step on a
random system wq, which will outlive the driver instance. With bad
timing we can teardown the driver with one or more work workqueue still
being alive leading to various UAF splats. Add a fini step to ensure
user queues are properly torn down. At this point GuC should already be
nuked so queue itself should no longer be referenced from hw pov.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2317
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/xe_device.c       |  6 +++++-
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_guc_submit.c   | 32 +++++++++++++++++++++++++++-
 3 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cb5a9fd820cf..90b3478ed7cd 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -297,6 +297,9 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	if (xe->unordered_wq)
 		destroy_workqueue(xe->unordered_wq);
 
+	if (xe->destroy_wq)
+		destroy_workqueue(xe->destroy_wq);
+
 	ttm_device_fini(&xe->ttm);
 }
 
@@ -360,8 +363,9 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq", 0);
 	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
 	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", 0, 0);
+	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", 0, 0);
 	if (!xe->ordered_wq || !xe->unordered_wq ||
-	    !xe->preempt_fence_wq) {
+	    !xe->preempt_fence_wq || !xe->destroy_wq) {
 		/*
 		 * Cleanup done in xe_device_destroy via
 		 * drmm_add_action_or_reset register above
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 5ad96d283a71..515385b916cc 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -422,6 +422,9 @@ struct xe_device {
 	/** @unordered_wq: used to serialize unordered work, mostly display */
 	struct workqueue_struct *unordered_wq;
 
+	/** @destroy_wq: used to serialize user destroy work, like queue */
+	struct workqueue_struct *destroy_wq;
+
 	/** @tiles: device tiles */
 	struct xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index fbbe6a487bbb..66441efa0bcd 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -276,10 +276,37 @@ static struct workqueue_struct *get_submit_wq(struct xe_guc *guc)
 }
 #endif
 
+static void guc_exec_queue_fini_async(struct xe_exec_queue *q);
+
+static void xe_guc_submit_fini(struct xe_guc *guc)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_exec_queue *q;
+	unsigned long index;
+
+	mutex_lock(&guc->submission_state.lock);
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
+		struct xe_gpu_scheduler *sched = &q->guc->sched;
+
+		xe_assert(xe, !kref_read(&q->refcount));
+
+		xe_sched_submission_stop(sched);
+
+		if (exec_queue_registered(q) && !exec_queue_wedged(q))
+			guc_exec_queue_fini_async(q);
+	}
+	mutex_unlock(&guc->submission_state.lock);
+
+	drain_workqueue(xe->destroy_wq);
+
+	xe_assert(xe, xa_empty(&guc->submission_state.exec_queue_lookup));
+}
+
 static void guc_submit_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_guc *guc = arg;
 
+	xe_guc_submit_fini(guc);
 	xa_destroy(&guc->submission_state.exec_queue_lookup);
 	free_submit_wq(guc);
 }
@@ -1268,13 +1295,16 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 
 static void guc_exec_queue_fini_async(struct xe_exec_queue *q)
 {
+	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_device *xe = guc_to_xe(guc);
+
 	INIT_WORK(&q->guc->fini_async, __guc_exec_queue_fini_async);
 
 	/* We must block on kernel engines so slabs are empty on driver unload */
 	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
 		__guc_exec_queue_fini_async(&q->guc->fini_async);
 	else
-		queue_work(system_wq, &q->guc->fini_async);
+		queue_work(xe->destroy_wq, &q->guc->fini_async);
 }
 
 static void __guc_exec_queue_fini(struct xe_guc *guc, struct xe_exec_queue *q)
-- 
2.46.0

