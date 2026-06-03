Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4D9CD6E71
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 19:22:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C77F1122CD;
	Wed,  3 Jun 2026 19:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="CR6AvaHB";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25C81122CD
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 19:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1780514562;
 bh=61gvGKyXqBY+W/QJQl0tvPLFxFL3uhxI8Ve4KfGhdC0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CR6AvaHBFx/sOTKd9Zmx0+86jNPz4gF4+AIw4jkPuElqs61lpYW8aKgqp0Wdeb2Z+
 2Q8D5q34+l9zsurzPR43mU/ImjELedNg1xOA/HYrsqbVE/AA5LuRih71uHl5Pjevt5
 1h2FXCFFHf9WbQvi+1SwZ3L6hK8bkYLu7Cff7N6sQ/A20a2XnMfgodrU2IzO9o9tTG
 Wu7/kbt7PTqaB9t/v1DRekbaDxNqEczdWh0D7xIpP93X63WJdfLBJEl/Kk7/RMoZDp
 4PzfyjopihdoC9Kqdlp21uMy0aZt0HEwxkGHPmUcN2HVw9HSYbcd95OiGfZ09flrTk
 kH7B0IpUKARPQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [RFC v2 2/2] drm/xe: Set job credits based on LRC size
Date: Wed,  3 Jun 2026 21:22:39 +0200
Message-ID: <20260603192239.257733-3-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603192239.257733-1-dev@lankhorst.se>
References: <20260603192239.257733-1-dev@lankhorst.se>
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
 drivers/gpu/drm/xe/xe_execlist.c   | 2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 drivers/gpu/drm/xe/xe_sched_job.c  | 8 +++++---
 3 files changed, 7 insertions(+), 5 deletions(-)

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
index e0ef317adef74..01be5ecd336ca 100644
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
 
@@ -286,8 +286,10 @@ void xe_sched_job_arm(struct xe_sched_job *job)
 		fence = &chain->base;
 	}
 
-	if (!job->restore_replay)
+	if (!job->restore_replay) {
 		q->ring_ops->prepare_job(job);
+		job->drm.credits = job->ptrs[0].job_size;
+	}
 
 	job->fence = dma_fence_get(fence);	/* Pairs with put in scheduler */
 	drm_sched_job_arm(&job->drm);
-- 
2.53.0

