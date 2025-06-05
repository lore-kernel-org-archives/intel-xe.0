Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83D4C61DB8
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 15:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEA210E954;
	Thu,  5 Jun 2025 15:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kXyNbaNG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3087710E92F
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 15:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749137455; x=1780673455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5Ieeg18kHtFnJbhd4VZwZLAbdUTjwz29RwVAXSbZtP0=;
 b=kXyNbaNGczHHd4u/cJI/WRGpTIHXHhPhotndJClXNinp79P9a7QLlVnx
 9rdjSqwf5/ZCPq2ulvnQNuGC6zllNz8tAC7a2ht8PuD+IwxpX4dvsmBoB
 JbhQ56opn179K3fQg6RaI4WXrTHhpCs9+8hfSo9pZVbCyQRBkUf2bBj4e
 qepFZk1z60KIg5U0cuCQX+TSmTvlGJmeO1A2rjKGERsJXGwI9onK4BC4J
 ZDMme1Foj0yduCrk09RE/jROSswILq9uY1Q3xul/G94Sk1bhLSIcelRHm
 fqJZimlKBst/ZbCLZlAhA9/1OJYMFa3Jg0Po/OZzyccBPwZngXwT10jg8 Q==;
X-CSE-ConnectionGUID: I4x46yxOTkqi22bW+LO2bQ==
X-CSE-MsgGUID: +5BAOQWETcKn4BJmSb1FNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61529494"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="61529494"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:52 -0700
X-CSE-ConnectionGUID: v3Bhkg6WTVKadvDucPZ9IA==
X-CSE-MsgGUID: +AdexAe1RNu6XjgKwsoBdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="176502819"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 10/15] drm/xe: Add ULLS migration job support to ring ops
Date: Thu,  5 Jun 2025 08:32:18 -0700
Message-Id: <20250605153223.2789122-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605153223.2789122-1-matthew.brost@intel.com>
References: <20250605153223.2789122-1-matthew.brost@intel.com>
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
 drivers/gpu/drm/xe/xe_ring_ops.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index bc1689db4cd7..8f63c97b749d 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -394,11 +394,37 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
 }
 
+static int emit_ulls_preamble(struct xe_lrc *lrc, u32 *dw, int i, u32 seqno)
+{
+	u32 addr = xe_lrc_ulls_semaphore_ggtt_addr(lrc, seqno);
+
+	return emit_store_imm_ggtt(addr, 0, dw, i);
+}
+
+static int emit_ulls_postamble(struct xe_lrc *lrc, u32 *dw, int i, u32 seqno)
+{
+	dw[i++] = MI_SEMAPHORE_WAIT |
+		MI_SEMAPHORE_GLOBAL_GTT |
+		MI_SEMAPHORE_POLL |
+		MI_SEMAPHORE_SAD_EQ_SDD;
+	dw[i++] = 1;
+	dw[i++] = xe_lrc_ulls_semaphore_ggtt_addr(lrc, seqno + 1);
+	dw[i++] = 0;
+
+	return i;
+}
+
 static void emit_migration_job_gen12(struct xe_sched_job *job,
 				     struct xe_lrc *lrc, u32 seqno)
 {
 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
 
+	if (job->is_ulls) {
+		i = emit_ulls_preamble(lrc, dw, i, seqno);
+		if (job->is_ulls_last)
+			goto seqno_write;
+	}
+
 	i = emit_copy_timestamp(lrc, dw, i);
 
 	i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
@@ -417,6 +443,7 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 
 	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
 
+seqno_write:
 	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | job->migrate_flush_flags |
 		MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW;
 	dw[i++] = xe_lrc_seqno_ggtt_addr(lrc) | MI_FLUSH_DW_USE_GTT;
@@ -425,6 +452,9 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 
 	i = emit_user_interrupt(dw, i);
 
+	if (job->is_ulls && !job->is_ulls_last)
+		i = emit_ulls_postamble(lrc, dw, i, seqno);
+
 	xe_gt_assert(job->q->gt, i <= MAX_JOB_SIZE_DW);
 
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
-- 
2.34.1

