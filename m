Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2160CA1016
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 02:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD0E10E3D1;
	Thu,  4 Sep 2025 02:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="etAgR9DA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534F310E29D
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 02:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756951814; x=1788487814;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hOs0CGhwgdS1m3z50ATAd+se2zL74a1F4cH1ItjZc/8=;
 b=etAgR9DAGeFNzKJTEfQ6oUGIsNlHLabvITCs4ZkyiSBYKAwJKuStMtG3
 NuVK7QhImMBxqTtq5A6qanHgslrFLgZbFpK0DnJ+kzXZJzVfXuo7goTbw
 GpXPTToxJuWU9vPOj72JmFI3AT1pA0MrmKhdfs9oMqcpL8NkyIYcP0T4V
 SZ+yr2Tvgk51VFjGC/ELE75hLenEOVEQjQI0OLSEe9V0htPV30FwTHRue
 BpjBllZP9I0OYqrto4flIYiKlIU0bNRGcEGdpihpG4L0I9lhwu7kfI9Ib
 PBSDSogrSywFv8AZjIdOH9LcMNCoF7IXUSQPhSkicJpSURVLgze4TagxT w==;
X-CSE-ConnectionGUID: R2t3bByzT2aUvT4wV/8fWQ==
X-CSE-MsgGUID: kkaQDWY2QGaIwNDuoMuOxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76728293"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="76728293"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 19:10:13 -0700
X-CSE-ConnectionGUID: Xcp7MI63ReqjBW3+3hkhJg==
X-CSE-MsgGUID: R3a2l8Q6TiWPTUm+y5dAjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="176112243"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 19:10:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 1/4] drm/xe: Save off position in ring in which a job was
 programmed
Date: Wed,  3 Sep 2025 19:10:05 -0700
Message-Id: <20250904021008.1827802-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904021008.1827802-1-matthew.brost@intel.com>
References: <20250904021008.1827802-1-matthew.brost@intel.com>
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

VF post-migration recovery needs to modify the ring with updated GGTT
addresses for pending jobs. Save off position in ring in which a job was
programmed to facilitate.

v4:
 - s/VF resume/VF post-migration recovery (Tomasz)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c        | 23 +++++++++++++++++++----
 drivers/gpu/drm/xe/xe_sched_job_types.h |  5 +++++
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index d71837773d6c..ac0c6dcffe15 100644
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
index dbf260dded8d..7ce58765a34a 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -24,6 +24,11 @@ struct xe_job_ptrs {
 	struct dma_fence_chain *chain_fence;
 	/** @batch_addr: Batch buffer address. */
 	u64 batch_addr;
+	/**
+	 * @head: The tail pointer of the LRC (so head pointer of job) when the
+	 * job was submitted
+	 */
+	u32 head;
 };
 
 /**
-- 
2.34.1

