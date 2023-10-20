Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05ABCDB474
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 18:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD9010E5D9;
	Fri, 20 Oct 2023 18:25:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815B410E5D9
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 18:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697826339; x=1729362339;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f+FhVi0hWGZCkWzUC4UhdI/VcPGoovVEb9+7O5z/rfw=;
 b=R8ZFd34u4l32U6S/I6IzkdAxgLNG0u9Okv1Wdfk9+WR56ERZhzpcBrdj
 u5KBaG8miZ7Fw1/xqPdFZ/O39NVFKBxpeo38QcROzkRtqZzaxNuMGV1LC
 18MH37z62xS9+oVcAN37hjESek624HfgPwZHurqc5d8Mn8qP77tKYgpbO
 CQCOngjpCmbxJ19yTnHjQqvAm3ctOfKz7CWvMDWkd3B/8fEUUbJZzdVKn
 BTpob9S3iHKjHunHEIZDi21qZo17qbWHZHhVO0JJQPy6rDgAM4ONQOjQ/
 4/4cC5cA7Gh/urwK/aI6u8x2ifRMWRN15T1IPKvndd8ieFKO899LlzgoP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="376929410"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="376929410"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 11:24:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="751008868"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="751008868"
Received: from lmckeon-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.19.55])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 11:24:48 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 20 Oct 2023 19:24:38 +0100
Message-ID: <20231020182437.681645-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/migrate: fix MI_ARB_ON_OFF usage
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

Spec says: "This is a privileged command; it will not be effective (will
be converted to a no-op) if executed from within a non-privileged batch
buffer." However here it looks like we are just emitting it inside some
bb which was jumped to via the ppGTT, which should be considered
a non-privileged address space.

It looks like we just need some way of preventing things like the
emit_pte() and later copy/clear being preempted in-between so rather
just emit directly in the ring for migration jobs.

Bspec: 45716
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c  | 16 ----------------
 drivers/gpu/drm/xe/xe_ring_ops.c |  2 ++
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index b4baecde60e6..009d728af762 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -406,12 +406,6 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 	return m;
 }
 
-static void emit_arb_clear(struct xe_bb *bb)
-{
-	/* 1 dword */
-	bb->cs[bb->len++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
-}
-
 static u64 xe_migrate_res_sizes(struct xe_res_cursor *cur)
 {
 	/*
@@ -745,10 +739,6 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 			goto err_sync;
 		}
 
-		/* Preemption is enabled again by the ring ops. */
-		if (!src_is_vram || !dst_is_vram)
-			emit_arb_clear(bb);
-
 		if (!src_is_vram)
 			emit_pte(m, bb, src_L0_pt, src_is_vram, &src_it, src_L0,
 				 src_bo);
@@ -994,7 +984,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 		/* Preemption is enabled again by the ring ops. */
 		if (!clear_vram) {
-			emit_arb_clear(bb);
 			emit_pte(m, bb, clear_L0_pt, clear_vram, &src_it, clear_L0,
 				 bo);
 		} else {
@@ -1285,9 +1274,6 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 				VM_SA_UPDATE_UNIT_SIZE;
 		}
 
-		/* Preemption is enabled again by the ring ops. */
-		emit_arb_clear(bb);
-
 		/* Map our PT's to gtt */
 		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(num_updates);
 		bb->cs[bb->len++] = ppgtt_ofs * XE_PAGE_SIZE + page_ofs;
@@ -1316,8 +1302,6 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 		update_idx = bb->len;
 
-		/* Preemption is enabled again by the ring ops. */
-		emit_arb_clear(bb);
 		for (i = 0; i < num_updates; i++)
 			write_pgtable(tile, bb, 0, &updates[i], pt_update);
 	}
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 58676f4b989f..59e0aa2d6a4c 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -355,6 +355,8 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 	i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
 				seqno, dw, i);
 
+	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE; /* Enabled again below */
+
 	i = emit_bb_start(job->batch_addr[0], BIT(8), dw, i);
 
 	/* XXX: Do we need this? Leaving for now. */
-- 
2.41.0

