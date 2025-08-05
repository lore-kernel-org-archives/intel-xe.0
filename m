Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B588FCA0EC6
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 23:42:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F99A10E6F9;
	Tue,  5 Aug 2025 23:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O51y4m7k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDE710E656
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 23:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754437326; x=1785973326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+pzOqXm5rzQoCowotSJpsNbm0+epW+whIayYY3ScIH4=;
 b=O51y4m7ktiBgnn2D2yBQLRYTz8Oq3yid8UeKPzE/0FNoXseoePC0WDKe
 P4vqvl0aWNTAeesN9ekcYM8dXrnOa0LmJ4dFi8ZITXe5kxqYzYj6GMoSC
 IO3P8azzXw2ypDc8/KyGMb59hTxd5ksLBt46diQldlWmxBFfm3wPEoADh
 2MuT4HhMA9keQsJoLc5+RfOwLSpDFD1qsSbfWMhIEkas9Eoy9v499bt7F
 OHyczLvtGkuDmuyXHRNQZkHIHboqhMIt3JHRvNOsbi4KnVZpSyNbD82Tu
 oFe1FLnRwPY23/VhPXqk2Xo0ofF6KT/aKMc6lHgxJfqZBb+dACZdA7BHX w==;
X-CSE-ConnectionGUID: nlkfXNzXQ1O7bSSNr9LZsg==
X-CSE-MsgGUID: HZPUXyy0RSqZtlBDI0y0Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="68119067"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="68119067"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:05 -0700
X-CSE-ConnectionGUID: 16PJPKaMSw2F6h6d7SN2Rg==
X-CSE-MsgGUID: c+L2xB3FQPmOliz9p+QLbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164641630"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 11/15] drm/xe: Add ULLS migration job support to ring ops
Date: Tue,  5 Aug 2025 16:41:56 -0700
Message-Id: <20250805234200.1035609-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805234200.1035609-1-matthew.brost@intel.com>
References: <20250805234200.1035609-1-matthew.brost@intel.com>
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
set upon next job submission. The last ULLS migration job skips BB
submission and postamble (clear current semaphore, write seqno, exit
ULLS).

v2:
 - Use LRC defines clear / signal semaphores
 - Skip batch ULLS first for pipelined mode enter
 - Write start seqno for first / last

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index e8f22ec5f9af..24a094dcfa80 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -395,16 +395,43 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
 }
 
+static int emit_ulls_preamble(struct xe_lrc *lrc, u32 *dw, int i, u32 seqno)
+{
+	u32 addr = xe_lrc_ulls_semaphore_ggtt_addr(lrc, seqno);
+
+	return emit_store_imm_ggtt(addr, LRC_MIGRATION_ULLS_SEMAPORE_CLEAR,
+				   dw, i);
+}
+
+static int emit_ulls_postamble(struct xe_lrc *lrc, u32 *dw, int i, u32 seqno)
+{
+	dw[i++] = MI_SEMAPHORE_WAIT |
+		MI_SEMAPHORE_GLOBAL_GTT |
+		MI_SEMAPHORE_POLL |
+		MI_SEMAPHORE_SAD_EQ_SDD;
+	dw[i++] = LRC_MIGRATION_ULLS_SEMAPORE_SINGAL;
+	dw[i++] = xe_lrc_ulls_semaphore_ggtt_addr(lrc, seqno + 1);
+	dw[i++] = 0;
+
+	return i;
+}
+
 static void emit_migration_job_gen12(struct xe_sched_job *job,
 				     struct xe_lrc *lrc, u32 seqno)
 {
 	u32 saddr = xe_lrc_start_seqno_ggtt_addr(lrc);
 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
 
+	if (job->is_ulls)
+		i = emit_ulls_preamble(lrc, dw, i, seqno);
+
 	i = emit_copy_timestamp(lrc, dw, i);
 
 	i = emit_store_imm_ggtt(saddr, seqno, dw, i);
 
+	if (job->is_ulls_last || job->is_ulls_first)
+		goto seqno_write;
+
 	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE; /* Enabled again below */
 
 	i = emit_bb_start(job->ptrs[0].batch_addr, BIT(8), dw, i);
@@ -415,12 +442,16 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 
 	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
 
+seqno_write:
 	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno,
 				MI_INVALIDATE_TLB | job->migrate_flush_flags,
 				dw, i);
 
 	i = emit_user_interrupt(dw, i);
 
+	if (job->is_ulls && !job->is_ulls_last)
+		i = emit_ulls_postamble(lrc, dw, i, seqno);
+
 	xe_gt_assert(job->q->gt, i <= MAX_JOB_SIZE_DW);
 
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
-- 
2.34.1

