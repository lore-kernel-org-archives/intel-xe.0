Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA681048935
	for <intel-xe@archiver.kernel.org>; Sat, 28 Feb 2026 01:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E78B10EC5F;
	Sat, 28 Feb 2026 01:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kSXm+b3D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CCC10EC53
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Feb 2026 01:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772242514; x=1803778514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0nRj2BXhertWl2rCxKc2QYq4XTb/T5DbJb8aIUSp1p4=;
 b=kSXm+b3Dx582uLVr7ozz5XQKoR4sGq4nqdf1J1w0rxg3o/cEnfaJzrTv
 PNZe46MilOh59tdyl0bXan6hK0BBVkkV7qpbdrjap/+3TFnPb8XwDo2xG
 30FQ09Foi1hHwuibNAkrvEnTEQ70Vh/zCa1cwZvD5gm3n5Hz1pyOVImP3
 gzfPsi3TpCLhzvjiWYGYeLZSFXR8gj5WIHrUC9koQGGJP+KcYwVVvMQtv
 P8UhltJAgtia7b9c5LrW/9GsY5U6pNw0t9OjTb6Lc9EnfOR0ygAAk8+W2
 9lNTBSMUu57RPg3ZQ2U83oHlCEhSzlxDuXSIHz2yzdNCl3Vnn+INi3uOO Q==;
X-CSE-ConnectionGUID: IRufqsN5SKqzJ1c6jOtNxQ==
X-CSE-MsgGUID: S1mVmWl9QBGJRo4Yg/NW3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="83966361"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="83966361"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:09 -0800
X-CSE-ConnectionGUID: bhNNE/YUT+e41g338ypmDA==
X-CSE-MsgGUID: nJXkxkaoRw+EzlFCbTx4cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="213854902"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:09 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v3 22/25] drm/xe: Add ULLS migration job support to ring ops
Date: Fri, 27 Feb 2026 17:34:58 -0800
Message-Id: <20260228013501.106680-23-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260228013501.106680-1-matthew.brost@intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 53d420d72164..4e233651beb9 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -422,6 +422,27 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
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
 				     struct xe_lrc *lrc, u32 *head,
 				     u32 seqno)
@@ -433,10 +454,16 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 
 	*head = lrc->ring.tail;
 
+	if (job->is_ulls)
+		i = emit_ulls_preamble(lrc, dw, i, seqno);
+
 	i = emit_copy_timestamp(xe, lrc, dw, i);
 
 	i = emit_store_imm_ggtt(saddr, seqno, dw, i);
 
+	if (job->is_ulls_last || job->is_ulls_first)
+		goto seqno_write;
+
 	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE; /* Enabled again below */
 
 	i = emit_bb_start(job->ptrs[0].batch_addr, BIT(8), dw, i);
@@ -447,12 +474,16 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 
 	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
 
+seqno_write:
 	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno,
 				job->migrate_flush_flags,
 				dw, i);
 
 	i = emit_user_interrupt(dw, i);
 
+	if (job->is_ulls && !job->is_ulls_last)
+		i = emit_ulls_postamble(lrc, dw, i, seqno);
+
 	xe_gt_assert(job->q->gt, i <= MAX_JOB_SIZE_DW);
 
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
-- 
2.34.1

