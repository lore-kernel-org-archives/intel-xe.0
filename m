Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3201DC4167D
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 18:39:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99E710E3AF;
	Mon,  6 Nov 2023 18:39:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201C910E3AF
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 18:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699295972; x=1730831972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iM36sh63goiwSbO/0js8BXglyYgAzjlBiHR4ECOuZ3M=;
 b=JkDoooOv+IEC3a1/ee50onMUWh+Bvm7pATr8c0PvU2fZcOiY4TcZT3/c
 Im1+lBb57dXl6M3wYcWUrYdfTpEBsq8GcFDF2RCm5jQ36HAJPJwUc3gfw
 saexJwlCskQS+mN3wlV9JUwxI7Khd80KT9DjTgHQpir1gd+HuX2n3KIwb
 aHhW4Y49BuxS5EtrupkRPEpfDY2Z6kXiWo6xzkrtY3mkQWkk83pc/BEpA
 LlAC8UP94qFx+182em8jG3hBBG/AYh5GpuMVhEFT1eM6IFZHpJnrts1Mn
 civVp30O30WuVUYeW9rOprs/n/gB4nKPd5fiQ22OCpzQBrGkwwAQHymmW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="392215427"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="392215427"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 10:39:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="766047772"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="766047772"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 10:39:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  6 Nov 2023 10:39:38 -0800
Message-Id: <20231106183938.71640-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106183938.71640-1-matthew.brost@intel.com>
References: <20231106183938.71640-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Use pool of ordered wq for GuC
 submission
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

To appease lockdep, use a pool of ordered wq for GuC submission rather
tha leaving the ordered wq allocation to the drm sched. Without this change
eventually lockdep runs out of hash entries (MAX_LOCKDEP_CHAINS is
exceeded) as each user allocated exec queue adds more hash table entries
to lockdep. A pool old of 256 ordered wq should be enough to have
similar behavior with and without lockdep enabled.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 66 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_types.h  |  7 ++++
 2 files changed, 70 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d1cb312dc3bb..fbd0fd11da6a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -188,6 +188,58 @@ static bool exec_queue_killed_or_banned(struct xe_exec_queue *q)
 	return exec_queue_killed(q) || exec_queue_banned(q);
 }
 
+#ifdef CONFIG_PROVE_LOCKING
+static int alloc_submit_wq(struct xe_guc *guc)
+{
+	int i;
+
+	for (i = 0; i < NUM_SUBMIT_WQ; ++i) {
+		guc->submission_state.submit_wq_pool[i] =
+			alloc_ordered_workqueue("submit_wq", 0);
+		if (!guc->submission_state.submit_wq_pool[i])
+			goto err_free;
+	}
+
+	return 0;
+
+err_free:
+	while (i)
+		destroy_workqueue(guc->submission_state.submit_wq_pool[--i]);
+
+	return -ENOMEM;
+}
+
+static void free_submit_wq(struct xe_guc *guc)
+{
+	int i;
+
+	for (i = 0; i < NUM_SUBMIT_WQ; ++i)
+		destroy_workqueue(guc->submission_state.submit_wq_pool[i]);
+}
+
+static struct workqueue_struct *get_submit_wq(struct xe_guc *guc)
+{
+	int idx = guc->submission_state.submit_wq_idx++ % NUM_SUBMIT_WQ;
+
+	return guc->submission_state.submit_wq_pool[idx];
+}
+#else
+static int alloc_submit_wq(struct xe_guc *guc)
+{
+	return 0;
+}
+
+static void free_submit_wq(struct xe_guc *guc)
+{
+
+}
+
+static struct workqueue_struct *get_submit_wq(struct xe_guc *guc)
+{
+	return NULL;
+}
+#endif
+
 static void guc_submit_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_guc *guc = arg;
@@ -195,6 +247,7 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
 	xa_destroy(&guc->submission_state.exec_queue_lookup);
 	ida_destroy(&guc->submission_state.guc_ids);
 	bitmap_free(guc->submission_state.guc_ids_bitmap);
+	free_submit_wq(guc);
 	mutex_destroy(&guc->submission_state.lock);
 }
 
@@ -230,6 +283,12 @@ int xe_guc_submit_init(struct xe_guc *guc)
 	if (!guc->submission_state.guc_ids_bitmap)
 		return -ENOMEM;
 
+	err = alloc_submit_wq(guc);
+	if (err) {
+		bitmap_free(guc->submission_state.guc_ids_bitmap);
+		return err;
+	}
+
 	gt->exec_queue_ops = &guc_exec_queue_ops;
 
 	mutex_init(&guc->submission_state.lock);
@@ -1166,9 +1225,10 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 	timeout = (q->vm && xe_vm_no_dma_fences(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
 		  q->hwe->eclass->sched_props.job_timeout_ms;
-	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops, NULL,
-			    q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
-			    64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
+	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
+			    get_submit_wq(guc),
+			    q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES, 64,
+			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
 			    q->name, gt_to_xe(q->gt)->drm.dev);
 	if (err)
 		goto err_free;
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index a5e58917a499..0fdcc05dc16a 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -61,6 +61,13 @@ struct xe_guc {
 			/** @patch: patch version of GuC submission */
 			u32 patch;
 		} version;
+#ifdef CONFIG_PROVE_LOCKING
+#define NUM_SUBMIT_WQ	256
+		/** @submit_wq_pool: submission ordered workqueues pool */
+		struct workqueue_struct *submit_wq_pool[NUM_SUBMIT_WQ];
+		/** @submit_wq_idx: submission ordered workqueue index */
+		int submit_wq_idx;
+#endif
 		/** @enabled: submission is enabled */
 		bool enabled;
 	} submission_state;
-- 
2.34.1

