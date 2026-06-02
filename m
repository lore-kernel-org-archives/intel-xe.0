Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EB1CD5BD1
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 18:14:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A8A10F2CF;
	Tue,  2 Jun 2026 18:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="XYzE8r9N";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CFE10F2CF
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jun 2026 18:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1780424094;
 bh=dGvAMYmd35uBC0t9Tr0Djk8fJbklbt9sMWD6VKBsZfs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XYzE8r9NmFzeEu/kpyVDzVgx1IPWzPHkJaV8nceqhxkmvSJubEKkIDLchdeL95dwK
 BVQ93ncsM8KyMtIUlhxmuZwO5LzlQcm3uPAePzhUUdB7aikCzhR8dWH2jeaLqXpdzk
 1rzOYrQ9x0gkekob4Rial6bWw6tMWdhSQatSYS2lOlHlrnNbpcAHyn/yDOJTA36GYE
 OnCReqHRrMXVg7VparuRCQ3w/6NvIdxocbmLWfH5Bd3gmSsfijUFNYr3sBhhFnRmj1
 0GDiQeK3D/B0wtT11XGcw3oV4DvFA8AdXlknCNUOyjVWNzm37MZ7dwfHcRJAGy0jM4
 /GzByDBmxRDJg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [RFC 2/2] drm/xe: Set job credits based on LRC size
Date: Tue,  2 Jun 2026 20:14:47 +0200
Message-ID: <20260602181447.131216-3-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602181447.131216-1-dev@lankhorst.se>
References: <20260602181447.131216-1-dev@lankhorst.se>
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

This allows to fill the entire LRC and increase
to a higher limit of outstanding jobs without throttling.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_execlist.c      | 2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c    | 2 +-
 drivers/gpu/drm/xe/xe_sched_job.c     | 8 +++++---
 drivers/gpu/drm/xe/xe_tlb_inval_job.c | 5 +++--
 4 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 9fb99c038ea88..6a289c6c23a49 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -328,7 +328,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 	struct drm_gpu_scheduler *sched;
 	const struct drm_sched_init_args args = {
 		.ops = &drm_sched_ops,
-		.credit_limit = xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES,
+		.credit_limit = xe_lrc_ring_size(),
 		.hang_limit = XE_SCHED_HANG_LIMIT,
 		.timeout = XE_SCHED_JOB_TIMEOUT,
 		.name = q->hwe->name,
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ab501513d806c..dfe0140201104 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1989,7 +1989,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	}
 
 	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
-			    submit_wq, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
+			    submit_wq, xe_lrc_ring_size(), 64,
 			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
 			    q->name, gt_to_xe(q->gt)->drm.dev);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 23bfdc1e4ef9f..845e66e9cfcec 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -114,8 +114,8 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	kref_init(&job->refcount);
 	xe_exec_queue_get(job->q);
 
-	err = drm_sched_job_init(&job->drm, q->entity, 1, NULL,
-				 q->xef ? q->xef->drm->client_id : 0);
+	err = drm_sched_job_init(&job->drm, q->entity, MAX_JOB_SIZE_BYTES,
+				 NULL, q->xef ? q->xef->drm->client_id : 0);
 	if (err)
 		goto err_free;
 
@@ -266,8 +266,10 @@ void xe_sched_job_arm(struct xe_sched_job *job)
 		job->ring_ops_flush_tlb = true;
 	}
 
-	if (!job->restore_replay)
+	if (!job->restore_replay) {
 		q->ring_ops->prepare_job(job);
+		job->drm.credits = job->ptrs[0].job_size;
+	}
 
 	/* Arm the pre-allocated fences */
 	for (i = 0; i < q->width; prev = fence, ++i) {
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
index 04d21015cd5dc..fb196a6dd2bc0 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
@@ -10,6 +10,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_types.h"
 #include "xe_page_reclaim.h"
+#include "xe_ring_ops_types.h"
 #include "xe_tlb_inval.h"
 #include "xe_tlb_inval_job.h"
 #include "xe_migrate.h"
@@ -132,8 +133,8 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
 	}
 	job->fence = &ifence->base;
 
-	err = drm_sched_job_init(&job->dep.drm, entity, 1, NULL,
-				 q->xef ? q->xef->drm->client_id : 0);
+	err = drm_sched_job_init(&job->dep.drm, entity, MAX_JOB_SIZE_BYTES,
+				 NULL, q->xef ? q->xef->drm->client_id : 0);
 	if (err)
 		goto err_fence;
 
-- 
2.53.0

