Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD31CF9C72
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 14:57:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D6B10E41F;
	Mon, 23 Sep 2024 14:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IK1BWC8Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79DF410E411
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 14:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727103445; x=1758639445;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0BZrRJYAMrVVX5mI2NSflnJkeZs+VZc6/lYnjas1Sfo=;
 b=IK1BWC8ZmZ7QoIkWkE/DgjyfyHqS15+HlU27fn1lODE+W1D97EEImkRD
 M0CKakLRBjW8GtUGJeDlwemiRLrxdpgVi/LEErAiH4vS9pChAf+Z7JkMg
 GjPAa4DchR7sdRBUQXEb9OcfN6s1rlrRIeHOuStE0Wt4uI4aeFJnhWj6u
 zcEBqfExcupKP2fmPzHfvOCleTaNrao/T2HFjikEz5StQFrp+cXVdlj7z
 p7pq+BVbPP9ydjbytPDCsJr/CooHW6A1CIcEflc9TDyHFBxBo/WGNf8uZ
 VSOnARXjFqFtbWsVqrYni5ALAYho8AjGhB7u/AdHPTCT9hN/+9E2JsJfI A==;
X-CSE-ConnectionGUID: rvSTKZV+Td2lL2RaVqXZow==
X-CSE-MsgGUID: aUqhfFEQSpOprJ9RzfL0pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29942988"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="29942988"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 07:57:24 -0700
X-CSE-ConnectionGUID: LR1xpozEQxydPDj9c2sbCg==
X-CSE-MsgGUID: Rck8CCr5Tpeprh3XM8kxjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="70680889"
Received: from johunt-mobl9.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.234])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 07:57:23 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] drm/xe: fix UAF around queue destruction
Date: Mon, 23 Sep 2024 15:56:48 +0100
Message-ID: <20240923145647.77707-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.46.1
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

v2 (Matt B)
 - Looks much safer to use a waitqueue and then just wait for the
   xa_array to become empty before triggering the drain.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2317
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/xe_device.c       |  6 +++++-
 drivers/gpu/drm/xe/xe_device_types.h |  3 +++
 drivers/gpu/drm/xe/xe_guc_submit.c   | 26 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_types.h    |  2 ++
 4 files changed, 35 insertions(+), 2 deletions(-)

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
index fbbe6a487bbb..ae2f85cc2d08 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -276,10 +276,26 @@ static struct workqueue_struct *get_submit_wq(struct xe_guc *guc)
 }
 #endif
 
+static void xe_guc_submit_fini(struct xe_guc *guc)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_gt *gt = guc_to_gt(guc);
+	int ret;
+
+	ret = wait_event_timeout(
+		guc->submission_state.fini_wq,
+		xa_empty(&guc->submission_state.exec_queue_lookup), HZ * 5);
+
+	drain_workqueue(xe->destroy_wq);
+
+	xe_gt_assert(gt, ret);
+}
+
 static void guc_submit_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_guc *guc = arg;
 
+	xe_guc_submit_fini(guc);
 	xa_destroy(&guc->submission_state.exec_queue_lookup);
 	free_submit_wq(guc);
 }
@@ -345,6 +361,8 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
 
 	xa_init(&guc->submission_state.exec_queue_lookup);
 
+	init_waitqueue_head(&guc->submission_state.fini_wq);
+
 	primelockdep(guc);
 
 	return drmm_add_action_or_reset(&xe->drm, guc_submit_fini, guc);
@@ -361,6 +379,9 @@ static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q, u32 xa
 
 	xe_guc_id_mgr_release_locked(&guc->submission_state.idm,
 				     q->guc->id, q->width);
+
+	if (xa_empty(&guc->submission_state.exec_queue_lookup))
+		wake_up(&guc->submission_state.fini_wq);
 }
 
 static int alloc_guc_id(struct xe_guc *guc, struct xe_exec_queue *q)
@@ -1268,13 +1289,16 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 
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
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 546ac6350a31..69046f698271 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -81,6 +81,8 @@ struct xe_guc {
 #endif
 		/** @submission_state.enabled: submission is enabled */
 		bool enabled;
+		/** @submission_state.fini_wq: submit fini wait queue */
+		wait_queue_head_t fini_wq;
 	} submission_state;
 	/** @hwconfig: Hardware config state */
 	struct {
-- 
2.46.1

