Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EE6C98321
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 17:27:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3093710E5E7;
	Fri, 25 Sep 2026 17:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="YNK9sMY5";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0A110FBAF
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 17:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1790357231;
 bh=PkRWqf1tdOxn1KWUdOwV2CrkIOjYHUxp/phjGKrNxSg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YNK9sMY5yTN6swvpUKvyNQZZgJlGQrAnm0gq/mQcoqBN+EAVfpnLog4IgSHqr1OvM
 bXKyFrki/bpRH0HR9TfCfdE2Udp7V4Eg8SSQZzPPLOpinwZVYQRBgnNlXVRFWu+qEl
 oSjzevBH/z/wDP4JCXHheevZvaP7dW6acHrErdS1TGxFCdJ030S3iVRKNFepOcCHIF
 8kLFgNT+7wTbrXK5S0dOCXR/g1domzCSh6sf7IBt/qEHjcfVkX85/LWNJzzswzMYTX
 ZFTwrAuUX/odo/hxsVp1VsWLI2ZP+i33R8qld9fi1sSWo0as99/Vr42Efe5kXx1PxX
 4fOHQuG4j2Z6Q==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 2/2] drm/xe: Set job credits based on LRC size
Date: Fri, 25 Sep 2026 19:26:06 +0200
Message-ID: <20260925172603.302050-6-dev@lankhorst.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925172603.302050-4-dev@lankhorst.se>
References: <20260925172603.302050-4-dev@lankhorst.se>
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

Set maximum fill level to lrc_size - 4, to avoid wraparound
and ensure the job is 8 byte aligned, since we insert a MI_NOOP
in xe_lrc_write_ring() that needs to be accounted for.

Changes since previous version:
- Prevent filling LRC to max.
- Reserve space for MI_NOOP.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_execlist.c   |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c |  2 +-
 drivers/gpu/drm/xe/xe_sched_job.c  | 10 +++++++---
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index a36db39dcda8a..24469990ece97 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -329,7 +329,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 	const struct drm_sched_init_args args = {
 		.ops = &drm_sched_ops,
 		.num_rqs = 1,
-		.credit_limit = xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES,
+		.credit_limit = xe_lrc_ring_size() - 4,
 		.hang_limit = XE_SCHED_HANG_LIMIT,
 		.timeout = XE_SCHED_JOB_TIMEOUT,
 		.name = q->hwe->name,
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f3ba8abfc228e..264e961fd7d71 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2089,7 +2089,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	}
 
 	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
-			    submit_wq, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
+			    submit_wq, xe_lrc_ring_size() - 4, 64,
 			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
 			    ge->name, gt_to_xe(q->gt)->drm.dev);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 57ed6734d31d5..6e6345ee0977f 100644
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
 
@@ -295,9 +295,13 @@ void xe_sched_job_push(struct xe_sched_job *job)
 	xe_sched_job_get(job);
 	trace_xe_sched_job_exec(job);
 
-	if (!job->restore_replay)
+	if (!job->restore_replay) {
 		job->q->ring_ops->prepare_job(job);
 
+		/* A MI_NOOP is inserted if job size is not aligned to 8 */
+		job->drm.credits = ALIGN(job->ptrs[0].job_size, 8);
+	}
+
 	drm_sched_entity_push_job(&job->drm);
 	xe_sched_job_put(job);
 }
-- 
2.55.0

