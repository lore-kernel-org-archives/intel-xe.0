Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE89CD98D6
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 10:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75DA10EE2E;
	Thu, 11 Jun 2026 10:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="GSVISZAm";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C10210EE1D
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 10:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1781174166;
 bh=LALg1F8RTij0v4r1GBxDN4M/gf/+ngkuk5L++MASy7s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GSVISZAm9Oupthx24J2WP9pzct8UVfOMtzp8m57NAeuM3UZGppLBAwBdjjMyimMRH
 mW/e609Ih/Dc1dCdLlf5EQ9RN0M/Qo1ToIubDOJ5Ogg6tnMC9ROM0b5guJYvrqvG38
 LeCr0w6UDdoHh0sEswXKNj9zUyrhv0eyhAYf3/PRhINSOaZLHuASxxRCxV1tUoddtt
 uVdNgsCg5bSKsVPER4sBrrDOe/jrVVeyk59qS14SBNiL3R3aCS8jTi5QzXB3GCEIJa
 JLrQp5n2yUx+cYtZUfOLONIoNzV2BrX5C7aGa9lnaNoz3xBNV/gIeNNYuAXewGxvMq
 udrxuwloUlRCw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [CI v3 2/2] drm/xe: Set job credits based on LRC size
Date: Thu, 11 Jun 2026 12:36:13 +0200
Message-ID: <20260611103613.191719-3-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260611103613.191719-1-dev@lankhorst.se>
References: <20260611103613.191719-1-dev@lankhorst.se>
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
index 6b86b4f9cc1c5..359381922b372 100644
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
index b29cc08e6291b..c33ae9a2f4dab 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1943,7 +1943,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	}
 
 	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
-			    submit_wq, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
+			    submit_wq, xe_lrc_ring_size(), 64,
 			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
 			    q->name, gt_to_xe(q->gt)->drm.dev);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 9943e1ffe5798..232f4b6aebced 100644
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
 
@@ -295,8 +295,10 @@ void xe_sched_job_push(struct xe_sched_job *job)
 	xe_sched_job_get(job);
 	trace_xe_sched_job_exec(job);
 
-	if (!job->restore_replay)
+	if (!job->restore_replay) {
 		job->q->ring_ops->prepare_job(job);
+		job->drm.credits = job->ptrs[0].job_size;
+	}
 
 	drm_sched_entity_push_job(&job->drm);
 	xe_sched_job_put(job);
-- 
2.53.0

