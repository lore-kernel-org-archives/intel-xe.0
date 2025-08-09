Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B56C87FCB
	for <intel-xe@archiver.kernel.org>; Sat,  9 Aug 2025 04:34:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F1E10E0EE;
	Sat,  9 Aug 2025 04:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KOVnk9l+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32F810E0EE
 for <intel-xe@lists.freedesktop.org>; Sat,  9 Aug 2025 04:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754714066; x=1786250066;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UHkDPXbcM0/o6Kcdl/vVzW7lAaqAvzEHuwfMXCM27pI=;
 b=KOVnk9l+dzJhgQTWUZzSatnkBnzsdRQUfaeCKScDqG8RA7svnNyJwcCm
 XiSEa0CXBPnTBZsgZ6+7u1wpsZZwj7DDIg0ZOB96bveFN++nAtUAS5Dvj
 OkQq9xvkgpcMxzG/L3ZY9ztDjeSygBvTMwTt9SGWlOLRXC60wvvLD+JQO
 FZjLrzLnqasP5NEUGEWilLA/iKrUw1dcm4WWeNjqaVsm8+l9Fm/Cpa2tq
 xygEMErOuN0NHKdWUrA16Ufj9fgpR2Sxz01HjWltYH6pmNaz+fiX1Xe1u
 0LPQYSzCZCwB/GGUKiSMoQe+0XgENUf9fIjaKiEm7S03BEoSeFLHC36L0 A==;
X-CSE-ConnectionGUID: IFD4Wi52Si2RiC1bIQUXzg==
X-CSE-MsgGUID: 1j0m4a34QQqLNEhbf3P2CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="56931299"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="56931299"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 21:34:26 -0700
X-CSE-ConnectionGUID: VyHzmcjrQtuz6YcWJXPIHA==
X-CSE-MsgGUID: MqmGc3VCRVufBJNu6Uw2nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="202658729"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 21:34:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	tomasz.lis@intel.com
Subject: [PATCH] drm/xe: Take preemption into account when resubmitting jobs
Date: Fri,  8 Aug 2025 21:34:21 -0700
Message-Id: <20250809043421.1982541-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Take preemption into account when resubmitting jobs, and adjust the new
LRC head pointer accordingly to skip over previously executed parts of
the job. To support this, save the head pointer of each job when it is
emitted.

This code can either be leveraged or reused for VF recovery.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c      | 23 +++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_ring_ops.c        | 23 +++++++++++++++++++----
 drivers/gpu/drm/xe/xe_sched_job_types.h |  2 ++
 3 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 1185b23b1384..3ba707bbb74d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1954,16 +1954,35 @@ void xe_guc_submit_pause(struct xe_guc *guc)
 		xe_sched_submission_stop_async(&q->guc->sched);
 }
 
+static int guc_lrc_offset(struct xe_lrc *lrc, u32 job_head)
+{
+	if (xe_lrc_ring_head(lrc) == job_head)
+		return 0;
+
+	if (job_head < xe_lrc_ring_head(lrc))
+		return xe_lrc_ring_head(lrc) - job_head;
+
+	return lrc->ring.size - job_head + xe_lrc_ring_head(lrc);
+}
+
 static void guc_exec_queue_start(struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 
 	if (!exec_queue_killed_or_banned_or_wedged(q)) {
+		struct xe_sched_job *job;
 		int i;
 
+		job = xe_sched_first_pending_job(&q->guc->sched);
+
 		trace_xe_exec_queue_resubmit(q);
-		for (i = 0; i < q->width; ++i)
-			xe_lrc_set_ring_head(q->lrc[i], q->lrc[i]->ring.tail);
+		for (i = 0; i < q->width; ++i) {
+			int offset = !job ? 0 :
+				guc_lrc_offset(q->lrc[i], job->ptrs[i].head);
+
+			xe_lrc_set_ring_head(q->lrc[i], (q->lrc[i]->ring.tail +
+					     offset) % q->lrc[i]->ring.size);
+		}
 		xe_sched_resubmit_jobs(sched);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 5f15360d14bf..4dad28f0614d 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -245,12 +245,14 @@ static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
 
 /* for engines that don't require any special HW handling (no EUs, no aux inval, etc) */
 static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc,
-				    u64 batch_addr, u32 seqno)
+				    u64 batch_addr, u32 *head, u32 seqno)
 {
 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
 	u32 ppgtt_flag = get_ppgtt_flag(job);
 	struct xe_gt *gt = job->q->gt;
 
+	*head = lrc->ring.tail;
+
 	i = emit_copy_timestamp(lrc, dw, i);
 
 	if (job->ring_ops_flush_tlb) {
@@ -296,7 +298,7 @@ static bool has_aux_ccs(struct xe_device *xe)
 }
 
 static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
-				   u64 batch_addr, u32 seqno)
+				   u64 batch_addr, u32 *head, u32 seqno)
 {
 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
 	u32 ppgtt_flag = get_ppgtt_flag(job);
@@ -304,6 +306,8 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 	struct xe_device *xe = gt_to_xe(gt);
 	bool decode = job->q->class == XE_ENGINE_CLASS_VIDEO_DECODE;
 
+	*head = lrc->ring.tail;
+
 	i = emit_copy_timestamp(lrc, dw, i);
 
 	dw[i++] = preparser_disable(true);
@@ -346,7 +350,8 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 
 static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 					    struct xe_lrc *lrc,
-					    u64 batch_addr, u32 seqno)
+					    u64 batch_addr, u32 *head,
+					    u32 seqno)
 {
 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
 	u32 ppgtt_flag = get_ppgtt_flag(job);
@@ -355,6 +360,8 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
 	u32 mask_flags = 0;
 
+	*head = lrc->ring.tail;
+
 	i = emit_copy_timestamp(lrc, dw, i);
 
 	dw[i++] = preparser_disable(true);
@@ -396,11 +403,14 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 }
 
 static void emit_migration_job_gen12(struct xe_sched_job *job,
-				     struct xe_lrc *lrc, u32 seqno)
+				     struct xe_lrc *lrc, u32 *head,
+				     u32 seqno)
 {
 	u32 saddr = xe_lrc_start_seqno_ggtt_addr(lrc);
 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
 
+	*head = lrc->ring.tail;
+
 	i = emit_copy_timestamp(lrc, dw, i);
 
 	i = emit_store_imm_ggtt(saddr, seqno, dw, i);
@@ -434,6 +444,7 @@ static void emit_job_gen12_gsc(struct xe_sched_job *job)
 
 	__emit_job_gen12_simple(job, job->q->lrc[0],
 				job->ptrs[0].batch_addr,
+				&job->ptrs[0].head,
 				xe_sched_job_lrc_seqno(job));
 }
 
@@ -443,6 +454,7 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
 
 	if (xe_sched_job_is_migration(job->q)) {
 		emit_migration_job_gen12(job, job->q->lrc[0],
+					 &job->ptrs[0].head,
 					 xe_sched_job_lrc_seqno(job));
 		return;
 	}
@@ -450,6 +462,7 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
 	for (i = 0; i < job->q->width; ++i)
 		__emit_job_gen12_simple(job, job->q->lrc[i],
 					job->ptrs[i].batch_addr,
+					&job->ptrs[i].head,
 					xe_sched_job_lrc_seqno(job));
 }
 
@@ -461,6 +474,7 @@ static void emit_job_gen12_video(struct xe_sched_job *job)
 	for (i = 0; i < job->q->width; ++i)
 		__emit_job_gen12_video(job, job->q->lrc[i],
 				       job->ptrs[i].batch_addr,
+				       &job->ptrs[i].head,
 				       xe_sched_job_lrc_seqno(job));
 }
 
@@ -471,6 +485,7 @@ static void emit_job_gen12_render_compute(struct xe_sched_job *job)
 	for (i = 0; i < job->q->width; ++i)
 		__emit_job_gen12_render_compute(job, job->q->lrc[i],
 						job->ptrs[i].batch_addr,
+						&job->ptrs[i].head,
 						xe_sched_job_lrc_seqno(job));
 }
 
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index dbf260dded8d..359f93b0cdca 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -24,6 +24,8 @@ struct xe_job_ptrs {
 	struct dma_fence_chain *chain_fence;
 	/** @batch_addr: Batch buffer address. */
 	u64 batch_addr;
+	/** @head: The head pointer of the LRC when the job was submitted */
+	u32 head;
 };
 
 /**
-- 
2.34.1

