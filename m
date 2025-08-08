Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE351C87FD3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 11:05:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E6910E1E1;
	Fri,  8 Aug 2025 11:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HkIy1V6Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CEB10E1E1
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 11:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754651107; x=1786187107;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=le+dpeYGofh41r90VXGBu8a+5ncF2BBFplrrlYFltc4=;
 b=HkIy1V6YKfnJei5HGvSzgNXuWZ+jV49BrCHZ9sVFIp6O14VLgxNLe7CH
 COJJ9gE9DANUiHImigV2VoqHP4D4VtVxjLWiFaOMWizVvh3py9wmkNAoy
 d2GAcpLEiq5NfMfjnz9t3Lu6m+5nFgwfuN+1D2LUdbasJvGtAZG64GJb7
 Wol1SUkM8ML1d1M8dxs9VKMV4jYhDJVddoj6Qdi4qWxuv92cy1PWTVIs5
 VrO85pE08jkU5k2Ftz+oEphhAepEh6SFXc5bGB9HxsVBzKW+nfNHvR4eh
 QojUdHCNr9KSJDahHfshwCuTCjuVoeE2IhdxATAjXiHnF85CTzH/0FSAg Q==;
X-CSE-ConnectionGUID: p+R/fuM6SbGsBTmuax+n0Q==
X-CSE-MsgGUID: KrCUnx6hRv+0UkdqbC+22Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67267158"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="67267158"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 04:05:06 -0700
X-CSE-ConnectionGUID: ynGFJBevS66W0JP4ta2VLg==
X-CSE-MsgGUID: rKXx/aHHRAORU3SpWRyJ5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="170682160"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.211])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 04:05:05 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe/migrate: make MI_TLB_INVALIDATE conditional
Date: Fri,  8 Aug 2025 12:04:53 +0100
Message-ID: <20250808110452.467513-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.50.1
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

For normal moves/copies, we usually always end up with the src or dst
being system memory, meaning we can't only rely on the identity map and
will also need to emit PTEs and so will always require a TLB flush.

v2:
  - Update commit to explain the situation for normal copies (Matt B)
  - Rebase on latest changes

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c  | 18 +++++++++++-------
 drivers/gpu/drm/xe/xe_ring_ops.c | 10 +++++-----
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 4effe10d815b..356097fd6d2a 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -906,7 +906,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 			goto err;
 		}
 
-		xe_sched_job_add_migrate_flush(job, flush_flags);
+		xe_sched_job_add_migrate_flush(job, flush_flags | MI_INVALIDATE_TLB);
 		if (!fence) {
 			err = xe_sched_job_add_deps(job, src_bo->ttm.base.resv,
 						    DMA_RESV_USAGE_BOOKKEEP);
@@ -1287,11 +1287,13 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
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
@@ -1302,7 +1304,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		if (xe_migrate_needs_ccs_emit(xe)) {
 			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
 				      m->cleared_mem_ofs, false, clear_L0);
-			flush_flags = MI_FLUSH_DW_CCS;
+			flush_flags |= MI_FLUSH_DW_CCS;
 		}
 
 		job = xe_bb_create_migration_job(m->q, bb,
@@ -1637,6 +1639,8 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 		goto err_sa;
 	}
 
+	xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
+
 	if (ops->pre_commit) {
 		pt_update->job = job;
 		err = ops->pre_commit(pt_update);
@@ -1862,7 +1866,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 		goto err;
 	}
 
-	xe_sched_job_add_migrate_flush(job, 0);
+	xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
 
 	mutex_lock(&m->job_mutex);
 	xe_sched_job_arm(job);
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index e8f22ec5f9af..80dffc3ba036 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -110,10 +110,10 @@ static int emit_bb_start(u64 batch_addr, u32 ppgtt_flag, u32 *dw, int i)
 	return i;
 }
 
-static int emit_flush_invalidate(u32 addr, u32 val, u32 *dw, int i)
+static int emit_flush_invalidate(u32 addr, u32 val, u32 flush_flags, u32 *dw, int i)
 {
-	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
-		  MI_FLUSH_IMM_DW;
+	dw[i++] = MI_FLUSH_DW | MI_FLUSH_DW_OP_STOREDW |
+		  MI_FLUSH_IMM_DW | (flush_flags & MI_INVALIDATE_TLB) ?: 0;
 
 	dw[i++] = addr | MI_FLUSH_DW_USE_GTT;
 	dw[i++] = 0;
@@ -410,13 +410,13 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 	i = emit_bb_start(job->ptrs[0].batch_addr, BIT(8), dw, i);
 
 	dw[i++] = preparser_disable(true);
-	i = emit_flush_invalidate(saddr, seqno, dw, i);
+	i = emit_flush_invalidate(saddr, seqno, job->migrate_flush_flags, dw, i);
 	dw[i++] = preparser_disable(false);
 
 	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
 
 	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno,
-				MI_INVALIDATE_TLB | job->migrate_flush_flags,
+				job->migrate_flush_flags,
 				dw, i);
 
 	i = emit_user_interrupt(dw, i);
-- 
2.50.1

