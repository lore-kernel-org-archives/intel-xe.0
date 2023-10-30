Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F64C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Oct 2023 16:11:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F4410E337;
	Mon, 30 Oct 2023 16:11:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2CA610E32F
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Oct 2023 16:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698682261; x=1730218261;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=haWXSgVYWp4yIwnjPFwlHmGNwfURG2kGzQT9Fawod/o=;
 b=St345p4ARh+09KDg7Rz1pZVc3JbplcD6Q9uFx5giPdW2VifwhxlYWmbD
 IBaHXUGDBpDIWGypVwrdKvGw05fcSOqb22QaBf65i3HQmfscucpnYM8He
 y7CGz/FJZOTbX99QE+2jca9XvRb+zpFNOLC/Z5zpHQpu/sNaOpclYvxU/
 QWumeifh0J4/xkARb01Dtc4h29XylqdFHmgT7L06JzCiB88i1Khiumv1l
 mXzSUDGRdiqCYlHrZS75YjywfbeMNxRMp3JZj3E2/GgaYA20Bvzv03dqF
 a53gnKEbcMX0RkA2KRot3dDVQHLc0jwehQaGO0209RiwR1Pjvi+ocupD7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="474347267"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="474347267"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 09:10:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="1543609"
Received: from vishvend-mobl2.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.19.8])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 09:10:26 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 30 Oct 2023 16:10:18 +0000
Message-ID: <20231030161016.54300-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231030161016.54300-5-matthew.auld@intel.com>
References: <20231030161016.54300-5-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/3] drm/xe/migrate: fix MI_ARB_ON_OFF usage
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
Cc: Matt Roper <matthew.d.roper@intel.com>
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
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
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

