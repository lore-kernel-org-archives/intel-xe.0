Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A67CD6E4A
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 16:07:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D8B11A15F;
	Thu,  4 Jun 2026 16:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="ESF0PjAg";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F44011A15F
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 16:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1780589228;
 bh=YepF2Q0vOz76U4rm4DKxbMzIE4DVgJ0JHzHdggmC9Z0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ESF0PjAgyszmXCK+M8WF/PD3YuTTkacdBlriq7TDxg+0vK1kfzQ9+DuRCeQs9FBIX
 lxvNwNYq4kxkO/ZeweJ/XEz+KBWoCaja069Kl2eapQH33vETKN31NTi7jicTyWj379
 E5wuVoQtpnyTSYcfTvT3yjF0k11Rzdqu0vPJ6kx2GVi1LFp1XvEV2TMiYqMKzxoUA2
 +QH8qwmhS7X9d2CjyxkNKqmaVVQL8ooJghua7Y7id624Zdf+gy/6vRGConxBzQADp1
 rIUiwT5yC6tqJkqzq9FCC+TfWsSYWGa/CGtepEXqcMan3JnhQgyRVBimOBkDuZSknf
 BAbNzDh2/zKrQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [CI 22/24] drm/xe: Add ULLS migration job support to GuC submission
Date: Thu,  4 Jun 2026 18:06:51 +0200
Message-ID: <20260604160655.50036-23-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604160655.50036-1-dev@lankhorst.se>
References: <20260604160655.50036-1-dev@lankhorst.se>
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

From: Matthew Brost <matthew.brost@intel.com>

Add ULLS migration job support to GuC submission backend.

Changes required:
- On migration queue, reduce max jobs to the number of ULLS semaphores
  minus one
- Directly set the hardware engine tail via a MMIO write for ULLS jobs
  except for first ULLS job
- Set ULLS sempahore for current job releasing last job except for first
  ULLS job
- Suppress submit H2G for ULLS except for first ULLS job

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-24-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index cfb92866fc43e..4bd8fece40b0e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1173,6 +1173,11 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
 	 */
 	q = xe_exec_queue_multi_queue_primary(q);
 
+	if (job->is_ulls && !job->is_ulls_first) {
+		xe_hw_engine_write_ring_tail(q->hwe, lrc->ring.tail);
+		xe_lrc_set_ulls_semaphore(lrc, xe_sched_job_lrc_seqno(job));
+	}
+
 	if (!exec_queue_enabled(q) && !exec_queue_suspended(q)) {
 		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
 		action[len++] = q->guc->id;
@@ -1186,13 +1191,14 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
 		set_exec_queue_pending_enable(q);
 		set_exec_queue_enabled(q);
 		trace_xe_exec_queue_scheduling_enable(q);
-	} else {
+	} else if (!job->is_ulls || job->is_ulls_first) {
 		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT;
 		action[len++] = q->guc->id;
 		trace_xe_exec_queue_submit(q);
 	}
 
-	xe_guc_ct_send(&guc->ct, action, len, g2h_len, num_g2h);
+	if (!job->is_ulls || job->is_ulls_first || num_g2h)
+		xe_guc_ct_send(&guc->ct, action, len, g2h_len, num_g2h);
 
 	if (extra_submit) {
 		len = 0;
@@ -2003,6 +2009,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	struct xe_guc_exec_queue *ge;
 	long timeout;
 	int err, i;
+	int max_jobs = (xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES);
 
 	xe_gt_assert(guc_to_gt(guc), xe_device_uc_enabled(guc_to_xe(guc)));
 
@@ -2038,8 +2045,11 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 		submit_wq = primary->guc->sched.base.submit_wq;
 	}
 
+	if (q->vm && q->vm->flags & XE_VM_FLAG_MIGRATION)
+		max_jobs = min(max_jobs, LRC_MIGRATION_ULLS_SEMAPORE_COUNT - 1);
+
 	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
-			    submit_wq, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
+			    submit_wq, max_jobs, 64,
 			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
 			    q->name, gt_to_xe(q->gt)->drm.dev);
 	if (err)
-- 
2.53.0

