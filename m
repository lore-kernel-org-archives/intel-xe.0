Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848CDC98321
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 17:42:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FEEF10E0CD;
	Fri, 25 Sep 2026 17:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="N/Ef3Ev7";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C4710E0CD
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 17:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1790358123;
 bh=vaL5BOGSj7gB9N7R1lZNUEU/6urjULbFubi5fjMUIRc=;
 h=From:To:Cc:Subject:Date:From;
 b=N/Ef3Ev7CmTe8TQvu1OJGXaQt0uIz1t/RG25cCJSmWq5kYZgQWNo0AsM4SU7s3wzC
 lluyD2MqJX3v+YjKQzv6mswV6aHGk2pApsQ6wqb286o7u6nlFuY5vp0z7KDRUOuBcm
 d7yus7QTVAXgK1iqsR8XQWuog+12ZgIYlvfkql9zdlozxynnIBqw/SCZaShBrnf2tj
 5J6be1AQHNDFXbMMXlsSj3mu3ZQ6dVgG72b51WpAoAb7kk5ejpQIIw3GeYct861g7+
 R5Z9OWZL4Bd0iAvcCNshcA+S1zXVDGod1wmR4/mcUiw8cRYo/1yBujL3qdhFQDxW+O
 PDKvK76lOt2Mw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [CI ONLY] drm/xe: Convert job preparation in 2 stages
Date: Fri, 25 Sep 2026 19:42:11 +0200
Message-ID: <20260925174210.323471-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.55.0
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

Instead of writing the entire job at the time of emission, prepare it in
advance.

This allows us to calculate the size before we submit, in preparation of
allowing more jobs to run simultaneously.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
DO NOT REVIEW, this is sent as a patch in a 2-part series, but I'm testing
in advance if test failures still occur, whether they originate from this
patch the second patch.

drivers/gpu/drm/xe/xe_ring_ops.c        | 150 ++++++++++++++----------
 drivers/gpu/drm/xe/xe_ring_ops_types.h  |   3 +
 drivers/gpu/drm/xe/xe_sched_job.c       |   4 +
 drivers/gpu/drm/xe/xe_sched_job_types.h |   5 +
 4 files changed, 97 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 3dd8cf4e21316..0b9f7018fabd2 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -330,15 +330,12 @@ static int emit_fake_watchdog(struct xe_lrc *lrc, u32 *dw, int i)
 }
 
 /* for engines that don't require any special HW handling (no EUs, no aux inval, etc) */
-static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc,
-				    u64 batch_addr, u32 *head, u32 seqno)
+static u32 __prepare_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc,
+				      u32 *dw, u64 batch_addr, u32 seqno)
 {
-	u32 dw[MAX_JOB_SIZE_DW], i = 0;
-	u32 ppgtt_flag = get_ppgtt_flag(job);
+	u32 i = 0, ppgtt_flag = get_ppgtt_flag(job);
 	struct xe_gt *gt = job->q->gt;
 
-	*head = lrc->ring.tail;
-
 	if (job->ring_ops_force_reset)
 		i = emit_fake_watchdog(lrc, dw, i);
 
@@ -372,7 +369,7 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
 
 	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
 
-	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
+	return i * sizeof(*dw);
 }
 
 static bool has_aux_ccs(struct xe_device *xe)
@@ -389,16 +386,13 @@ static bool has_aux_ccs(struct xe_device *xe)
 	return !xe->info.has_flat_ccs;
 }
 
-static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
-				   u64 batch_addr, u32 *head, u32 seqno)
+static u32 __prepare_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
+				   u32 *dw, u64 batch_addr, u32 seqno)
 {
-	u32 dw[MAX_JOB_SIZE_DW], i = 0;
-	u32 ppgtt_flag = get_ppgtt_flag(job);
+	u32 i = 0, ppgtt_flag = get_ppgtt_flag(job);
 	struct xe_gt *gt = job->q->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 
-	*head = lrc->ring.tail;
-
 	if (job->ring_ops_force_reset)
 		i = emit_fake_watchdog(lrc, dw, i);
 
@@ -437,23 +431,20 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 
 	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
 
-	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
+	return i * sizeof(*dw);
 }
 
-static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
-					    struct xe_lrc *lrc,
-					    u64 batch_addr, u32 *head,
-					    u32 seqno)
+static u32 __prepare_job_gen12_render_compute(struct xe_sched_job *job,
+					      struct xe_lrc *lrc,
+					      u32 *dw, u64 batch_addr,
+					      u32 seqno)
 {
-	u32 dw[MAX_JOB_SIZE_DW], i = 0;
-	u32 ppgtt_flag = get_ppgtt_flag(job);
+	u32 i = 0, ppgtt_flag = get_ppgtt_flag(job);
 	struct xe_gt *gt = job->q->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
 	u32 mask_flags = 0;
 
-	*head = lrc->ring.tail;
-
 	if (job->ring_ops_force_reset)
 		i = emit_fake_watchdog(lrc, dw, i);
 
@@ -501,19 +492,17 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 
 	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
 
-	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
+	return i * sizeof(*dw);
 }
 
-static void emit_migration_job_gen12(struct xe_sched_job *job,
-				     struct xe_lrc *lrc, u32 *head,
-				     u32 seqno)
+static u32 prepare_migration_job_gen12(struct xe_sched_job *job,
+				       struct xe_lrc *lrc, u32 *dw,
+				       u32 seqno)
 {
 	struct xe_gt *gt = job->q->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	u32 saddr = xe_lrc_start_seqno_ggtt_addr(lrc);
-	u32 dw[MAX_JOB_SIZE_DW], i = 0;
-
-	*head = lrc->ring.tail;
+	u32 i = 0;
 
 	xe_gt_assert(gt, !job->ring_ops_force_reset);
 
@@ -539,94 +528,125 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 
 	xe_gt_assert(job->q->gt, i <= MAX_JOB_SIZE_DW);
 
-	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
+	return i * sizeof(*dw);
 }
 
-static void emit_job_gen12_gsc(struct xe_sched_job *job)
+static void prepare_job_gen12_gsc(struct xe_sched_job *job)
 {
 	struct xe_gt *gt = job->q->gt;
 
-	xe_gt_assert(gt, job->q->width <= 1); /* no parallel submission for GSCCS */
+	xe_gt_assert(gt, job->q->width == 1); /* no parallel submission for GSCCS */
 
-	__emit_job_gen12_simple(job, job->q->lrc[0],
-				job->ptrs[0].batch_addr,
-				&job->ptrs[0].head,
-				xe_sched_job_lrc_seqno(job));
+	job->ptrs[0].job_size =
+		__prepare_job_gen12_simple(job, job->q->lrc[0],
+					   job->ptrs[0].dw,
+					   job->ptrs[0].batch_addr,
+					   xe_sched_job_lrc_seqno(job));
 }
 
-static void emit_job_gen12_copy(struct xe_sched_job *job)
+static void prepare_job_gen12_copy(struct xe_sched_job *job)
 {
 	int i;
 
 	if (xe_sched_job_is_migration(job->q)) {
-		emit_migration_job_gen12(job, job->q->lrc[0],
-					 &job->ptrs[0].head,
-					 xe_sched_job_lrc_seqno(job));
+		xe_gt_assert(job->q->gt, job->q->width == 1);
+
+		job->ptrs[0].job_size =
+			prepare_migration_job_gen12(job, job->q->lrc[0],
+						    job->ptrs[0].dw,
+						    xe_sched_job_lrc_seqno(job));
 		return;
 	}
 
-	for (i = 0; i < job->q->width; ++i)
-		__emit_job_gen12_simple(job, job->q->lrc[i],
-					job->ptrs[i].batch_addr,
-					&job->ptrs[i].head,
-					xe_sched_job_lrc_seqno(job));
+	for (i = 0; i < job->q->width; ++i) {
+		job->ptrs[i].job_size =
+			__prepare_job_gen12_simple(job, job->q->lrc[i],
+						   job->ptrs[i].dw,
+						   job->ptrs[i].batch_addr,
+						   xe_sched_job_lrc_seqno(job));
+		xe_gt_assert(job->q->gt, job->ptrs[i].job_size == job->ptrs[0].job_size);
+	}
 }
 
-static void emit_job_gen12_video(struct xe_sched_job *job)
+static void prepare_job_gen12_video(struct xe_sched_job *job)
 {
 	int i;
 
 	/* FIXME: Not doing parallel handshake for now */
-	for (i = 0; i < job->q->width; ++i)
-		__emit_job_gen12_video(job, job->q->lrc[i],
-				       job->ptrs[i].batch_addr,
-				       &job->ptrs[i].head,
-				       xe_sched_job_lrc_seqno(job));
+	for (i = 0; i < job->q->width; ++i) {
+		job->ptrs[i].job_size =
+			__prepare_job_gen12_video(job, job->q->lrc[i],
+						  job->ptrs[i].dw,
+						  job->ptrs[i].batch_addr,
+						  xe_sched_job_lrc_seqno(job));
+		xe_gt_assert(job->q->gt, job->ptrs[i].job_size == job->ptrs[0].job_size);
+	}
 }
 
-static void emit_job_gen12_render_compute(struct xe_sched_job *job)
+static void prepare_job_gen12_render_compute(struct xe_sched_job *job)
 {
 	int i;
 
-	for (i = 0; i < job->q->width; ++i)
-		__emit_job_gen12_render_compute(job, job->q->lrc[i],
-						job->ptrs[i].batch_addr,
-						&job->ptrs[i].head,
-						xe_sched_job_lrc_seqno(job));
+	for (i = 0; i < job->q->width; ++i) {
+		job->ptrs[i].job_size =
+			__prepare_job_gen12_render_compute(job, job->q->lrc[i],
+							   job->ptrs[i].dw,
+							   job->ptrs[i].batch_addr,
+							   xe_sched_job_lrc_seqno(job));
+		xe_gt_assert(job->q->gt, job->ptrs[i].job_size == job->ptrs[0].job_size);
+	}
+}
+
+static void emit_prepared_job(struct xe_sched_job *job)
+{
+	for (u32 i = 0; i < job->q->width; ++i) {
+		struct xe_lrc *lrc = job->q->lrc[i];
+
+		job->ptrs[i].head = lrc->ring.tail;
+		xe_lrc_write_ring(lrc, job->ptrs[i].dw, job->ptrs[i].job_size);
+	}
 }
 
 static const struct xe_ring_ops ring_ops_gen12_gsc = {
-	.emit_job = emit_job_gen12_gsc,
+	.prepare_job = prepare_job_gen12_gsc,
+	.emit_job = emit_prepared_job,
 };
 
 static const struct xe_ring_ops ring_ops_gen12_copy = {
-	.emit_job = emit_job_gen12_copy,
+	.prepare_job = prepare_job_gen12_copy,
+	.emit_job = emit_prepared_job,
 };
 
 static const struct xe_ring_ops ring_ops_gen12_video_decode = {
-	.emit_job = emit_job_gen12_video,
+	.prepare_job = prepare_job_gen12_video,
+	.emit_job = emit_prepared_job,
 };
 
 static const struct xe_ring_ops ring_ops_gen12_video_enhance = {
-	.emit_job = emit_job_gen12_video,
+	.prepare_job = prepare_job_gen12_video,
+	.emit_job = emit_prepared_job,
 };
 
 static const struct xe_ring_ops ring_ops_gen12_render_compute = {
-	.emit_job = emit_job_gen12_render_compute,
+	.prepare_job = prepare_job_gen12_render_compute,
+	.emit_job = emit_prepared_job,
 };
 
 static const struct xe_ring_ops auxccs_ring_ops_gen12_video_decode = {
-	.emit_job = emit_job_gen12_video,
+	.prepare_job = prepare_job_gen12_video,
+	.emit_job = emit_prepared_job,
 	.emit_aux_table_inv = emit_aux_table_inv_video_decode,
 };
 
 static const struct xe_ring_ops auxccs_ring_ops_gen12_video_enhance = {
-	.emit_job = emit_job_gen12_video,
+	.prepare_job = prepare_job_gen12_video,
+	.emit_job = emit_prepared_job,
 	.emit_aux_table_inv = emit_aux_table_inv_video_enhance,
 };
 
 static const struct xe_ring_ops auxccs_ring_ops_gen12_render_compute = {
-	.emit_job = emit_job_gen12_render_compute,
+	.prepare_job = prepare_job_gen12_render_compute,
+	.emit_job = emit_prepared_job,
 	.emit_aux_table_inv = emit_aux_table_inv_render_compute,
 };
 
diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
index 52ff96bc41004..5774ef6f3a265 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
+++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
@@ -18,6 +18,9 @@ struct xe_sched_job;
  * struct xe_ring_ops - Ring operations
  */
 struct xe_ring_ops {
+	/** @prepare_job: Write job to @job struct */
+	void (*prepare_job)(struct xe_sched_job *job);
+
 	/** @emit_job: Write job to ring */
 	void (*emit_job)(struct xe_sched_job *job);
 
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index a4fa00632a303..57ed6734d31d5 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -294,6 +294,10 @@ void xe_sched_job_push(struct xe_sched_job *job)
 {
 	xe_sched_job_get(job);
 	trace_xe_sched_job_exec(job);
+
+	if (!job->restore_replay)
+		job->q->ring_ops->prepare_job(job);
+
 	drm_sched_entity_push_job(&job->drm);
 	xe_sched_job_put(job);
 }
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index 0490b1247a6e9..5d4ea9dd09912 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -9,6 +9,7 @@
 #include <linux/kref.h>
 
 #include <drm/gpu_scheduler.h>
+#include "xe_ring_ops_types.h"
 
 struct xe_exec_queue;
 struct dma_fence;
@@ -29,6 +30,10 @@ struct xe_job_ptrs {
 	 * job was submitted
 	 */
 	u32 head;
+	/** @job_size: size of job in bytes */
+	u32 job_size;
+	/** @dw: the raw bytes to be added to lrc */
+	u32 dw[MAX_JOB_SIZE_DW];
 };
 
 /**
-- 
2.55.0

