Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC31C79F83
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 02:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C642C10F840;
	Fri,  4 Sep 2026 02:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xn21KGBn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5ED10E1BB
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 02:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788488536; x=1820024536;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=C5ZyCBXpjYB4RVBMqN/QRtH3D0nuu2r/uRT3gXw4rvI=;
 b=Xn21KGBn0CW+wva5/YW4R+OWaxdGWuy7300ByOfb8OrUwH6yC/A3fq6W
 O0W2GFILnWSZYS4i9uUWQT+rdEddK9qTSkfoNEJbmxGDy7WzfIYaIaqcX
 m+1qUAsq778LOj/nCCCsoGuPcCtqBdkoxKSRUTguoiEKsE8mOwB7Ks5/6
 GWWlmCuvj0b/OtEF/HLsAejZNEhYa1qqC7alsWABzk3EZZyBe1JN+ceWg
 RvVE26GepnSfzJgZJMXYtR7HdIxHyLU+nwbkV3s7W5jhBwe5DotUiG1Z2
 PvNr3zeDCwPViuHuW0psF2bulJengUoNdKgHKJrTZjcfwYiKuf2gT3DPU g==;
X-CSE-ConnectionGUID: IS6NijabQ6yrtZNjEyAcjQ==
X-CSE-MsgGUID: TWpshDuOQpCvStoy3B4ELA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="106506293"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="106506293"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 19:22:16 -0700
X-CSE-ConnectionGUID: 5AjvCXKRTJSK4eW0DKiHvA==
X-CSE-MsgGUID: wxA3RQ6WTI6XiknUUJSY6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="275185138"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 19:22:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 21/25] drm/xe: Add ULLS migration job support to ring ops
Date: Thu,  3 Sep 2026 19:22:03 -0700
Message-Id: <20260904022207.3490018-22-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904022207.3490018-1-matthew.brost@intel.com>
References: <20260904022207.3490018-1-matthew.brost@intel.com>
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
Link: https://patch.msgid.link/20260228013501.106680-23-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 39a670e91ba7..f613c694d096 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -494,6 +494,28 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
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
+static int emit_ulls_postamble(struct xe_lrc *lrc, u32 *dw, int i, u32 seqno)
+{
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
 static void emit_migration_job_gen12(struct xe_sched_job *job,
 				     struct xe_lrc *lrc, u32 *head,
 				     u32 seqno)
@@ -507,10 +529,16 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 
 	xe_gt_assert(gt, !job->ring_ops_force_reset);
 
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
@@ -521,12 +549,16 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 
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

