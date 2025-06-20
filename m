Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC82C71155
	for <intel-xe@archiver.kernel.org>; Fri, 20 Jun 2025 15:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688CA10E0F8;
	Fri, 20 Jun 2025 15:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UzAK6vX1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5AA10E0F8
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Jun 2025 15:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750433157; x=1781969157;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B7bRHSUtGFGOFKSin4ucOJ0e3/Mr7Foskr7a4AgBOBc=;
 b=UzAK6vX1AhOv9rtN6uIS/zPgYSDSMbzXIXLh5uDjssJOCh3v5CUlLNYI
 4VqHbOqRCb2nB9GpYeLRszD0Hpys7TGD9g5q7h8EWXmdyDvwkbS4+rEkd
 ZJT7j4H3RARiehZi+4vWmj6pUI2iaLBen8xl/pAhVt2xqpCy8UL2qEloQ
 k0klHJSRCOX5FN+mvg4kMvxQlvXhy0U9dxmbqzZ6ONdAE6Z9uA6x01bwO
 y3LQAqxmLna2RXCmy7QIRujPEFniOyfDBTMdhowO2l6l1PGELs+OLx6od
 bgFdX9XIyArfF+aeiZ/WfQpvbMpzQXezyFeUsLd2JO5KcKGcxR7GSUmDf A==;
X-CSE-ConnectionGUID: obHOZbOcT9Oc13bwLQi5gA==
X-CSE-MsgGUID: EfjxjfHTSsG0AWA/970vDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="56513804"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="56513804"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 08:25:50 -0700
X-CSE-ConnectionGUID: Icqoxih8R8eEIM6IiDSYYw==
X-CSE-MsgGUID: AyWlXuiPTUSUErEbKTmNjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="181965603"
Received: from abityuts-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.64])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 08:25:50 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/migrate: make MI_TLB_INVALIDATE conditional
Date: Fri, 20 Jun 2025 16:24:47 +0100
Message-ID: <20250620152446.239699-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
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

When clearing VRAM we should be able to skip invalidating the TLBs if we
are only using the identity map to access VRAM (which is the common
case), since no modifications are made to PTEs on the fly. Also since we
use huge 1G entries within the identity map, there should be a pretty
decent chance that the next packet(s) (if also clears) can avoid a tree
walk if we don't shoot down the TLBs, like if we have to process a long
stream of clears.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c  | 18 +++++++++++-------
 drivers/gpu/drm/xe/xe_ring_ops.c | 10 +++++-----
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 8f8e9fdfb2a8..a76363740a12 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -896,7 +896,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 			goto err;
 		}
 
-		xe_sched_job_add_migrate_flush(job, flush_flags);
+		xe_sched_job_add_migrate_flush(job, flush_flags | MI_INVALIDATE_TLB);
 		if (!fence) {
 			err = xe_sched_job_add_deps(job, src_bo->ttm.base.resv,
 						    DMA_RESV_USAGE_BOOKKEEP);
@@ -1119,11 +1119,13 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 		size -= clear_L0;
 		/* Preemption is enabled again by the ring ops. */
-		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it))
+		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it)) {
 			xe_res_next(&src_it, clear_L0);
-		else
-			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_only_system_ccs,
-				 &src_it, clear_L0, dst);
+		} else {
+			emit_pte(m, bb, clear_L0_pt, clear_vram,
+				 clear_only_system_ccs, &src_it, clear_L0, dst);
+			flush_flags |= MI_INVALIDATE_TLB;
+		}
 
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 		update_idx = bb->len;
@@ -1134,7 +1136,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		if (xe_migrate_needs_ccs_emit(xe)) {
 			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
 				      m->cleared_mem_ofs, false, clear_L0);
-			flush_flags = MI_FLUSH_DW_CCS;
+			flush_flags |= MI_FLUSH_DW_CCS;
 		}
 
 		job = xe_bb_create_migration_job(m->q, bb,
@@ -1469,6 +1471,8 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 		goto err_sa;
 	}
 
+	xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
+
 	if (ops->pre_commit) {
 		pt_update->job = job;
 		err = ops->pre_commit(pt_update);
@@ -1667,7 +1671,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 		goto err;
 	}
 
-	xe_sched_job_add_migrate_flush(job, 0);
+	xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
 
 	mutex_lock(&m->job_mutex);
 	xe_sched_job_arm(job);
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index bc1689db4cd7..b5548e0769f4 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -110,10 +110,10 @@ static int emit_bb_start(u64 batch_addr, u32 ppgtt_flag, u32 *dw, int i)
 	return i;
 }
 
-static int emit_flush_invalidate(u32 *dw, int i)
+static int emit_flush_invalidate(u32 *dw, int i, u32 flush_flags)
 {
-	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
-		  MI_FLUSH_IMM_DW | MI_FLUSH_DW_STORE_INDEX;
+	dw[i++] = MI_FLUSH_DW |  MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW |
+		MI_FLUSH_DW_STORE_INDEX | (flush_flags & MI_INVALIDATE_TLB) ?: 0;
 	dw[i++] = LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR;
 	dw[i++] = 0;
 	dw[i++] = 0;
@@ -411,13 +411,13 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 	if (!IS_SRIOV_VF(gt_to_xe(job->q->gt))) {
 		/* XXX: Do we need this? Leaving for now. */
 		dw[i++] = preparser_disable(true);
-		i = emit_flush_invalidate(dw, i);
+		i = emit_flush_invalidate(dw, i, job->migrate_flush_flags);
 		dw[i++] = preparser_disable(false);
 	}
 
 	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
 
-	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | job->migrate_flush_flags |
+	dw[i++] = MI_FLUSH_DW | job->migrate_flush_flags |
 		MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW;
 	dw[i++] = xe_lrc_seqno_ggtt_addr(lrc) | MI_FLUSH_DW_USE_GTT;
 	dw[i++] = 0;
-- 
2.49.0

