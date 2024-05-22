Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB38C25B78
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 20:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8471F10EF91;
	Wed, 22 May 2024 20:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BGt27tR3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A4110F23A
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 20:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716411160; x=1747947160;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u9X8wip/L3+0Os+/Z7dhS8fsDL1VPtUDSF6sePCETDI=;
 b=BGt27tR33TxSSUzYvJnLz/p6QB2NkTf0Bry0HKOK8zzrnbRhx2LQ1j6M
 QLu8W1JFr5kdNkpfp3Mx6KpC5n3olCK1LOG5gcC32Tm/SVd3M44mcHFl4
 uazfYQerNoyTvy1MFdVtezaxTu3wiHkJikWPJreJdtDPZWFoE1pnWnVPP
 qIzz3bXTJxqFwVo8MumZAaUt83FRagd/NgFqa5lel9kGNrAaVHwFSMfxC
 OUEAYGKsrjALTEV4mpSA8CjXBPqMqBpUyeM0vJqCrZPVwi4jdVt1DNW9w
 2/XRXoXnkmBwN+7IAuEtHw75K1PWlrVQ5ie+tV2s1B8iHRUDMOLLrObUN Q==;
X-CSE-ConnectionGUID: LGm4iD7HSOu9VRX49vXmnQ==
X-CSE-MsgGUID: cd+HTVB2Q0OTLD0cTweM8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="38073517"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="38073517"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 13:52:39 -0700
X-CSE-ConnectionGUID: lC0ZWo8gSUeHqix1OmL8lw==
X-CSE-MsgGUID: lTF6x0ONT2CxV2d8KtZR3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="37804778"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 13:52:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <mathhew.brost@intel.com>
Subject: [RFC PATCH] drm/xe: Docouple job seqno and lrc seqno
Date: Wed, 22 May 2024 13:52:50 -0700
Message-Id: <20240522205250.1578514-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Tightly coupling these seqno presents problems if alternative fences for
jobs are used. Best to decouple these for correctness.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <mathhew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c      |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c      |  5 +++--
 drivers/gpu/drm/xe/xe_ring_ops.c        | 10 +++++-----
 drivers/gpu/drm/xe/xe_sched_job.c       | 12 ++++++------
 drivers/gpu/drm/xe/xe_sched_job.h       |  5 +++++
 drivers/gpu/drm/xe/xe_sched_job_types.h |  2 ++
 drivers/gpu/drm/xe/xe_trace.h           |  7 +++++--
 7 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 395de93579fa..e4607f0e3456 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -98,7 +98,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 
 	if (xe_exec_queue_is_parallel(q)) {
 		q->parallel.composite_fence_ctx = dma_fence_context_alloc(1);
-		q->parallel.composite_fence_seqno = XE_FENCE_INITIAL_SEQNO;
+		q->parallel.composite_fence_seqno = 0;
 	}
 
 	return q;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4efb88e3e056..0a6a9471f1ce 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -973,8 +973,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		return DRM_GPU_SCHED_STAT_NOMINAL;
 	}
 
-	drm_notice(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
-		   xe_sched_job_seqno(job), q->guc->id, q->flags);
+	drm_notice(&xe->drm, "Timedout job: seqno=%u, lrc_seqno=%d, guc_id=%d, flags=0x%lx",
+		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
+		   q->guc->id, q->flags);
 	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
 		   "Kernel-submitted job timed out\n");
 	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index a3ca718456f6..78bec455b714 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -398,7 +398,7 @@ static void emit_job_gen12_gsc(struct xe_sched_job *job)
 
 	__emit_job_gen12_simple(job, job->q->lrc,
 				job->batch_addr[0],
-				xe_sched_job_seqno(job));
+				xe_sched_job_lrc_seqno(job));
 }
 
 static void emit_job_gen12_copy(struct xe_sched_job *job)
@@ -407,14 +407,14 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
 
 	if (xe_sched_job_is_migration(job->q)) {
 		emit_migration_job_gen12(job, job->q->lrc,
-					 xe_sched_job_seqno(job));
+					 xe_sched_job_lrc_seqno(job));
 		return;
 	}
 
 	for (i = 0; i < job->q->width; ++i)
 		__emit_job_gen12_simple(job, job->q->lrc + i,
 				        job->batch_addr[i],
-				        xe_sched_job_seqno(job));
+				        xe_sched_job_lrc_seqno(job));
 }
 
 static void emit_job_gen12_video(struct xe_sched_job *job)
@@ -425,7 +425,7 @@ static void emit_job_gen12_video(struct xe_sched_job *job)
 	for (i = 0; i < job->q->width; ++i)
 		__emit_job_gen12_video(job, job->q->lrc + i,
 				       job->batch_addr[i],
-				       xe_sched_job_seqno(job));
+				       xe_sched_job_lrc_seqno(job));
 }
 
 static void emit_job_gen12_render_compute(struct xe_sched_job *job)
@@ -435,7 +435,7 @@ static void emit_job_gen12_render_compute(struct xe_sched_job *job)
 	for (i = 0; i < job->q->width; ++i)
 		__emit_job_gen12_render_compute(job, job->q->lrc + i,
 						job->batch_addr[i],
-						xe_sched_job_seqno(job));
+						xe_sched_job_lrc_seqno(job));
 }
 
 static const struct xe_ring_ops ring_ops_gen12_gsc = {
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index cd8a2fba5438..b7b1669d0bea 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -117,6 +117,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 			err = PTR_ERR(job->fence);
 			goto err_sched_job;
 		}
+		job->lrc_seqno = job->fence->seqno;
 	} else {
 		struct dma_fence_array *cf;
 
@@ -132,6 +133,8 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 				err = PTR_ERR(fences[j]);
 				goto err_fences;
 			}
+			if (!j)
+				job->lrc_seqno = fences[0]->seqno;
 		}
 
 		cf = dma_fence_array_create(q->width, fences,
@@ -144,10 +147,6 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 			goto err_fences;
 		}
 
-		/* Sanity check */
-		for (j = 0; j < q->width; ++j)
-			xe_assert(job_to_xe(job), cf->base.seqno == fences[j]->seqno);
-
 		job->fence = &cf->base;
 	}
 
@@ -233,7 +232,7 @@ bool xe_sched_job_started(struct xe_sched_job *job)
 {
 	struct xe_lrc *lrc = job->q->lrc;
 
-	return !__dma_fence_is_later(xe_sched_job_seqno(job),
+	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
 				     xe_lrc_start_seqno(lrc),
 				     job->fence->ops);
 }
@@ -247,7 +246,8 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
 	 * parallel handshake is done.
 	 */
 
-	return !__dma_fence_is_later(xe_sched_job_seqno(job), xe_lrc_seqno(lrc),
+	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
+				     xe_lrc_seqno(lrc),
 				     job->fence->ops);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
index c75018f4660d..002c3b5c0a5c 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.h
+++ b/drivers/gpu/drm/xe/xe_sched_job.h
@@ -73,6 +73,11 @@ static inline u32 xe_sched_job_seqno(struct xe_sched_job *job)
 	return job->fence->seqno;
 }
 
+static inline u32 xe_sched_job_lrc_seqno(struct xe_sched_job *job)
+{
+	return job->lrc_seqno;
+}
+
 static inline void
 xe_sched_job_add_migrate_flush(struct xe_sched_job *job, u32 flags)
 {
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index 5e12724219fd..990ddac55ed6 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -37,6 +37,8 @@ struct xe_sched_job {
 		/** @user_fence.value: write back value */
 		u64 value;
 	} user_fence;
+	/** @lrc_seqno: LRC seqno */
+	u32 lrc_seqno;
 	/** @migrate_flush_flags: Additional flush flags for migration jobs */
 	u32 migrate_flush_flags;
 	/** @ring_ops_flush_tlb: The ring ops need to flush TLB before payload. */
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index f18ae1c63031..657e2f1f4c31 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -254,6 +254,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
 
 		    TP_STRUCT__entry(
 			     __field(u32, seqno)
+			     __field(u32, lrc_seqno)
 			     __field(u16, guc_id)
 			     __field(u32, guc_state)
 			     __field(u32, flags)
@@ -264,6 +265,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
 
 		    TP_fast_assign(
 			   __entry->seqno = xe_sched_job_seqno(job);
+			   __entry->lrc_seqno = xe_sched_job_lrc_seqno(job);
 			   __entry->guc_id = job->q->guc->id;
 			   __entry->guc_state =
 			   atomic_read(&job->q->guc->state);
@@ -273,8 +275,9 @@ DECLARE_EVENT_CLASS(xe_sched_job,
 			   __entry->batch_addr = (u64)job->batch_addr[0];
 			   ),
 
-		    TP_printk("fence=%p, seqno=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
-			      __entry->fence, __entry->seqno, __entry->guc_id,
+		    TP_printk("fence=%p, seqno=%u, lrc_seqno=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
+			      __entry->fence, __entry->seqno,
+			      __entry->lrc_seqno, __entry->guc_id,
 			      __entry->batch_addr, __entry->guc_state,
 			      __entry->flags, __entry->error)
 );
-- 
2.34.1

