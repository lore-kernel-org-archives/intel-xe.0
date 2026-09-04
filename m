Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F83C624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50CCB10FB61;
	Fri,  4 Sep 2026 21:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kI40cXvZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8624010FB36
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788556582; x=1820092582;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9EDz76cqZfEvRuDa/jJF9RRDOFlgBEKG70mWtD2Zv9w=;
 b=kI40cXvZYkOnqHKMA72P2dt2Kf6t4MWp4YYjwM9qU3Nxw6jGeaZ2NMpG
 TQookE2DqpkkAr2H0FB+bBaAsMD8iCb8CXCavHJqDxOBKx/dwWXmo0f91
 1F95zJVxZ6Ijzy7LtSIe62/k4Qyhn98utz6eQoGzNfVE8+vc0e6vsXQbG
 CA4b5sNmMqXcLOhDSb4p9ae6M4YLJ34yT0dlcXgcUl2AOmOTbeJO5JxAi
 Lk6dKk9apU2ksJGnxU7ZmGohby0NDPXgcTIjcWRyRa5r25PiWHD+91Hhr
 31xWZt+tIUJGtTyHgEI/zTFO8o09xOYgDdsAARB0EKZxQH67UeVSe2lFZ A==;
X-CSE-ConnectionGUID: wAft1x+vSeKXDDIVv7LUvg==
X-CSE-MsgGUID: mhVQUvIPQW+0RrFbQ2sG6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89096817"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="89096817"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:22 -0700
X-CSE-ConnectionGUID: HHQS0MOFQA60Mu9ZSGPQ2w==
X-CSE-MsgGUID: fB4WElhITt2LWq959LX8lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="267563440"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 20/24] drm/xe: Add ULLS migration job support to ring ops
Date: Fri,  4 Sep 2026 14:16:09 -0700
Message-Id: <20260904211613.3934307-21-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904211613.3934307-1-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
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

Add preamble and postamble for ULLS migrations jobs. Preamble clears
current semaphore for reuse. Postamble waits on next semaphore which is
set upon next job submission, then advances the ring tail over that job
with an LRI to RING_TAIL, so submitting it costs the CPU nothing beyond
signalling the semaphore.

A job updates the tail on behalf of a successor which has not been
emitted yet, so it cannot know how much ring that successor will occupy.
Pad every ULLS job out to a fixed ULLS_JOB_SIZE_BYTES, which makes the
next tail derivable from where the current job starts. The pad also
supplies the NOPs which must follow an in-ring tail update.

The last ULLS migration job skips BB submission, the postamble and the
tail update (clear current semaphore, write seqno, exit ULLS), padding
the difference so that it still fills a job slot.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-23-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ring_ops.c       | 86 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ring_ops_types.h | 24 +++++++
 2 files changed, 110 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 39a670e91ba7..f05b4276c8d1 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -494,6 +494,79 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
 }
 
+static int emit_ulls_preamble(struct xe_lrc *lrc, u32 *dw, int i, u32 seqno)
+{
+	u32 addr = xe_lrc_ulls_semaphore_ggtt_addr(lrc, seqno);
+
+	return emit_store_imm_ggtt(addr, LRC_MIGRATION_ULLS_SEMAPHORE_CLEAR,
+				   dw, i);
+}
+
+/*
+ * Advance the ring tail from within the ring, so submitting the next ULLS job
+ * needs nothing from the CPU beyond signalling the semaphore. All ULLS jobs
+ * occupy exactly ULLS_JOB_SIZE_BYTES, so the tail the next job ends at is two
+ * job slots on from where this job started, even though that job has not been
+ * emitted yet.
+ *
+ * The saved tail is written before the tail register so that a context save
+ * racing the pair can only restore a tail behind the register, never ahead of
+ * it. The register write is deliberately not MI_LRI_FORCE_POSTED: posted, the
+ * new tail can land after the command streamer has already drained this job,
+ * at which point it sees an empty ring, parks, and can be taken off the
+ * hardware with no H2G left to bring it back.
+ *
+ * The tail is published before the semaphore wait rather than after it, so
+ * that the non-posted write drains while the engine is parked anyway instead
+ * of adding a register round trip after the semaphore is signalled.
+ */
+static int emit_ulls_ring_tail(struct xe_gt *gt, struct xe_lrc *lrc, u32 *dw,
+			       int i, u32 head)
+{
+	u32 next_tail = (head + 2 * ULLS_JOB_SIZE_BYTES) & (lrc->ring.size - 1);
+
+	xe_gt_assert(gt, IS_ALIGNED(next_tail, 8));
+
+	i = emit_store_imm_ggtt(xe_lrc_ring_tail_ggtt_addr(lrc), next_tail,
+				dw, i);
+
+	dw[i++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) |
+		MI_LRI_LRM_CS_MMIO;
+	dw[i++] = RING_TAIL(0).addr;
+	dw[i++] = next_tail;
+
+	return i;
+}
+
+/* Publish the next job's tail, then park the engine on its semaphore */
+static int emit_ulls_postamble(struct xe_gt *gt, struct xe_lrc *lrc, u32 *dw,
+			       int i, u32 seqno, u32 head)
+{
+	i = emit_ulls_ring_tail(gt, lrc, dw, i, head);
+
+	dw[i++] = MI_SEMAPHORE_WAIT |
+		MI_SEMW_GGTT |
+		MI_SEMW_POLL |
+		MI_SEMW_COMPARE(SAD_EQ_SDD);
+	dw[i++] = LRC_MIGRATION_ULLS_SEMAPHORE_SIGNAL;
+	dw[i++] = xe_lrc_ulls_semaphore_ggtt_addr(lrc, seqno + 1);
+	dw[i++] = 0;
+	dw[i++] = 0;
+
+	return i;
+}
+
+/* Pad out to the fixed ULLS job size */
+static int emit_ulls_pad(struct xe_gt *gt, u32 *dw, int i)
+{
+	xe_gt_assert(gt, i <= ULLS_JOB_SIZE_DW);
+
+	while (i < ULLS_JOB_SIZE_DW)
+		dw[i++] = MI_NOOP;
+
+	return i;
+}
+
 static void emit_migration_job_gen12(struct xe_sched_job *job,
 				     struct xe_lrc *lrc, u32 *head,
 				     u32 seqno)
@@ -507,10 +580,16 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 
 	xe_gt_assert(gt, !job->ring_ops_force_reset);
 
+	if (xe_sched_job_is_ulls(job))
+		i = emit_ulls_preamble(lrc, dw, i, seqno);
+
 	i = emit_copy_timestamp(xe, lrc, dw, i);
 
 	i = emit_store_imm_ggtt(saddr, seqno, dw, i);
 
+	if (!xe_sched_job_ulls_has_batch(job))
+		goto seqno_write;
+
 	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE; /* Enabled again below */
 
 	i = emit_bb_start(job->ptrs[0].batch_addr, BIT(8), dw, i);
@@ -521,12 +600,19 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 
 	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
 
+seqno_write:
 	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno,
 				job->migrate_flush_flags,
 				dw, i);
 
 	i = emit_user_interrupt(dw, i);
 
+	if (xe_sched_job_ulls_parks(job))
+		i = emit_ulls_postamble(gt, lrc, dw, i, seqno, *head);
+
+	if (xe_sched_job_is_ulls(job))
+		i = emit_ulls_pad(gt, dw, i);
+
 	xe_gt_assert(job->q->gt, i <= MAX_JOB_SIZE_DW);
 
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
index 52ff96bc4100..ea4af321dd7c 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
+++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
@@ -6,6 +6,7 @@
 #ifndef _XE_RING_OPS_TYPES_H_
 #define _XE_RING_OPS_TYPES_H_
 
+#include <linux/build_bug.h>
 #include <linux/types.h>
 
 struct xe_gt;
@@ -14,6 +15,29 @@ struct xe_sched_job;
 #define MAX_JOB_SIZE_DW 74
 #define MAX_JOB_SIZE_BYTES (MAX_JOB_SIZE_DW * 4)
 
+/*
+ * ULLS migration jobs advance the ring tail from within the ring itself, so a
+ * job has to know where its successor will end before that successor has been
+ * emitted. Every ULLS job is therefore padded to a fixed size, letting the
+ * next tail be derived arithmetically.
+ *
+ * Sized for the largest such job, emitted by emit_migration_job_gen12():
+ * preamble (4), copy timestamp (8, its size on an SRIOV VF), start seqno
+ * store (4), arbitration off (1), batch buffer starts (2 * 3), pre-parser
+ * bracketed flush invalidate (6), seqno flush (4), user interrupt (3) and
+ * postamble (7 + 5).
+ */
+#define ULLS_JOB_SIZE_DW 48
+#define ULLS_JOB_SIZE_BYTES (ULLS_JOB_SIZE_DW * 4)
+
+/*
+ * RING_TAIL only encodes a qword aligned offset, and xe_lrc_write_ring()
+ * appends a NOP to anything shorter, either of which would desynchronise the
+ * ring from the tail a job predicts for its successor.
+ */
+static_assert(ULLS_JOB_SIZE_BYTES % 8 == 0);
+static_assert(ULLS_JOB_SIZE_DW <= MAX_JOB_SIZE_DW);
+
 /**
  * struct xe_ring_ops - Ring operations
  */
-- 
2.34.1

