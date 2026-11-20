Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7B6606A686
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 21:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d7zyy6C+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8034510E340;
	Fri, 20 Nov 2026 21:11:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DB210E38E
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 21:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795209081; x=1826745081;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tyf2Rj39Z1yZSNBuKNJCvfcnTbsPZYJpMLe+9Ntk8Ts=;
 b=d7zyy6C+mDuNZcgjQNCj2bSIyR9O91wGx66hXs8hMVowHRcOGv6u5Tfj
 4WaXs9NxOzVjLJm0MApp6pnETlcMGZ0qT2rvRNrIznQ3t+74tocai3Kjq
 H80KWKyMOrPHbBSQTWKjk8vvpEBBUd09fqt4Tn3jtWo8XETm9FFzAhOuj
 KV9gi7LJ2BJiupo7Jr1NaPe2vfyH9SZCn3WUSWqO7FWwaIXiMpXBQuwB0
 MesG8Rykllvj6fxCxW4hbXchxaf0Z5YLbrl3xrBDAEX/DwFlIeZCF+aTH
 urFQ50/hHR5+ZZ0gc2pk6tXOFUKpU7RiB9JjHofAM/bjp0tfkWuk4V3TW g==;
X-CSE-ConnectionGUID: FQSgEtKXRRqipaS+vg3SrA==
X-CSE-MsgGUID: CNdsZaROQSqNfMgfWcGN8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4126981"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4126981"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 13:11:16 -0800
X-CSE-ConnectionGUID: ODCw68E3Qw6pkQFRnapmLA==
X-CSE-MsgGUID: rVbHIOh4T2SIuozuYDCstQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="11140559"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa007.fm.intel.com with ESMTP; 20 Nov 2026 13:11:11 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>
Subject: [PATCH v7 3/3] drm/xe: After VF migration,
 repeat BO mapping in progress
Date: Fri, 20 Nov 2026 22:12:03 +0100
Message-ID: <20261120211203.2119555-4-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120211203.2119555-1-tomasz.lis@intel.com>
References: <20261120211203.2119555-1-tomasz.lis@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If VF migration happens during BO mapping, it is possible
that some PTE values were not written at the correct place.
This can happen because GGTT range, and therefore range of
assigned PTEs, have changed during the migration.
Restoring VF state on PF side will ensure that any PTEs
already set within the previous VM are moved to correct
positions, but if VM was paused and migrated while setting
PTEs, it will continue the loop at the old position. The
GGTT base address is used to select which PTEs to write,
so setting them again needs to wait until the post-migration
recovery procedure updates the GGTT base.

Previously, LRC creation was repeated. This means only BOs
that were part of exec queues were properly protected from
VF migration. With this change, as the redo is moved to BO
creation, all BOs are protected.

v2: Removed memirq safety check - looking at current memirq init,
  no extra check should be necessary.
v3: Re-added memirq check. Fixed multiple subtractions of
  GGTT range bounds. Added clear of GGTT entries before retry.
  Handled issue with signals while inserting GGTT entries.
v4: Do not re-reserve a node after VF migration was detected,
  just set all PTEs again. Comment on why the percieved
  infinite loop is impossible.
v5: Make wait for recovery non-interruptible, again. Cleanup
  on case of a wedge, even if it doesn't matter at that point.
v6: Remove the unnecessary cleanup on wedge, and make even
  longer comment there instead.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Tested-by: Adam Miszczak <adam.miszczak@linux.intel.com> (v1)
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c  | 35 ++++++-----------
 drivers/gpu/drm/xe/xe_ggtt.c        | 60 +++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  5 +--
 drivers/gpu/drm/xe/xe_memirq.c      | 10 ++++-
 4 files changed, 73 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 832a1a1e9c74..d92b3f278b15 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -432,34 +432,21 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 	 * post-migration recovery, as the fixups for the LRC GGTT addresses
 	 * depend on the queue being present in the backend tracking structure.
 	 *
-	 * In addition to above, we must wait on inflight GGTT changes to avoid
-	 * writing out stale values here. Such wait provides a solid solution
-	 * (without a race) only if the function can detect migration instantly
-	 * from the moment vCPU resumes execution.
+	 * In addition to above, we must make sure inflight GGTT changes are
+	 * properly handled (with wait and/or repeat) to avoid writing out stale
+	 * values here; but that is handled deeper, within BO pinning code.
 	 */
 	for (i = 0; i < q->width; ++i) {
-		struct xe_lrc *__lrc = NULL;
-		int marker;
-
-		do {
-			struct xe_lrc *lrc;
-
-			marker = xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
-
-			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state, xe_lrc_ring_size(),
-					    q->msix_vec, xe_lrc_init_flags(q, exec_queue_flags));
-			if (IS_ERR(lrc)) {
-				err = PTR_ERR(lrc);
-				goto err_lrc;
-			}
-
-			xe_exec_queue_set_lrc(q, lrc, i);
+		struct xe_lrc *lrc;
 
-			if (__lrc)
-				xe_lrc_put(__lrc);
-			__lrc = lrc;
+		lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state, xe_lrc_ring_size(),
+				    q->msix_vec, xe_lrc_init_flags(q, exec_queue_flags));
+		if (IS_ERR(lrc)) {
+			err = PTR_ERR(lrc);
+			goto err_lrc;
+		}
 
-		} while (marker != xe_vf_migration_fixups_complete_count(q->gt));
+		xe_exec_queue_set_lrc(q, lrc, i);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 86fc3d186fc8..154b3fe29b53 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -22,6 +22,7 @@
 #include "xe_bo.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_sriov_vf.h"
 #include "xe_gt_types.h"
 #include "xe_log.h"
 #include "xe_map.h"
@@ -35,6 +36,7 @@
 #include "xe_tile_sriov_vf.h"
 #include "xe_tlb_inval.h"
 #include "xe_wa.h"
+#include "xe_wedge.h"
 
 /**
  * DOC: Global Graphics Translation Table (GGTT)
@@ -1009,7 +1011,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 				  u64 start, u64 end, struct drm_exec *exec)
 {
 	u64 alignment = bo->min_align > 0 ? bo->min_align : XE_PAGE_SIZE;
+	u64 rel_start, rel_end;
 	u8 tile_id = ggtt->tile->id;
+	int marker;
 	int err;
 
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
@@ -1034,6 +1038,8 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 		goto out;
 	}
 
+	marker = xe_gt_sriov_vf_wait_valid_ggtt(ggtt->tile->primary_gt);
+
 	mutex_lock(&ggtt->lock);
 	/*
 	 * When inheriting the initial framebuffer, the framebuffer is
@@ -1043,24 +1049,24 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	 * remainder of GGTT, unaware that the start is reserved by WOPCM.
 	 */
 	if (start >= ggtt->start)
-		start -= ggtt->start;
+		rel_start = start - ggtt->start;
 	else
-		start = 0;
+		rel_start = 0;
 
 	/* Should never happen, but since we handle start, fail graciously for end */
 	if (end >= ggtt->start)
-		end -= ggtt->start;
+		rel_end = end - ggtt->start;
 	else
-		end = 0;
+		rel_end = 0;
 
-	end = min(end, ggtt->size);
+	rel_end = min(rel_end, ggtt->size);
 
-	if (end < start + xe_bo_size(bo))
+	if (rel_end < rel_start + xe_bo_size(bo))
 		err = -ENOSPC;
 	else
 		err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
-						  xe_bo_size(bo), alignment, 0, start, end,
-						  ggtt_usable_insert_flags(ggtt));
+						  xe_bo_size(bo), alignment, 0, rel_start,
+						  rel_end, ggtt_usable_insert_flags(ggtt));
 	if (err) {
 		ggtt_node_fini(bo->ggtt_node[tile_id]);
 		bo->ggtt_node[tile_id] = NULL;
@@ -1073,6 +1079,44 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	}
 	mutex_unlock(&ggtt->lock);
 
+	if (!err) {
+		/*
+		 * If VF migration happens during BO mapping, some PTE value writes may
+		 * be ignored by HW. This can happen in case GGTT range changed; already
+		 * set PTEs are moved by the VF restore, but xe_ggtt_map_bo() within VM
+		 * may still loop at old position. To be sure, redo all PTE writes.
+		 * Make this a loop as another VF migration could start immediately.
+		 */
+		while (marker != xe_vf_migration_fixups_complete_count(ggtt->tile->primary_gt)) {
+			u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ?
+					 XE_CACHE_NONE : XE_CACHE_WB;
+			u16 pat_index = xe_cache_pat_idx(tile_to_xe(ggtt->tile), cache_mode);
+			u64 pte = ggtt->pt_ops->pte_encode_flags(bo, pat_index);
+
+			marker = xe_gt_sriov_vf_wait_valid_ggtt(ggtt->tile->primary_gt);
+			/*
+			 * Only abort fixing the PTEs if we're wedged; if the wait timeouts,
+			 * the cause may be that VF migration recovery was just repeated or
+			 * prolonged, so do not treat that as bailout condition.
+			 *
+			 * If the VF migration was detected, we can be sure that recovery
+			 * will start or already has started. The recovery worker assures
+			 * on finish that this loop will exit - either by marker or by wedge.
+			 * These conditions ensure this will not be an infinite loop.
+			 *
+			 * If the driver got wedged around the VF migration recovery, we have
+			 * no reason to care for a slight chance of not fully correct GGTT
+			 * mapping, so return with success.
+			 */
+			if (xe_wedged(tile_to_xe(ggtt->tile)))
+				break;
+
+			mutex_lock(&ggtt->lock);
+			xe_ggtt_map_bo(ggtt, bo->ggtt_node[tile_id], bo, pte);
+			mutex_unlock(&ggtt->lock);
+		}
+	}
+
 	if (!err && bo->flags & XE_BO_FLAG_GGTT_INVALIDATE)
 		xe_ggtt_invalidate(ggtt);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 22e98d3ed3ee..1e0eb474c848 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1620,9 +1620,8 @@ int xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
 	    !xe_sriov_vf_migration_supported(gt_to_xe(gt)))
 		return 0;
 
-	ret = wait_event_interruptible_timeout(gt->sriov.vf.migration.wq,
-					       vf_valid_ggtt(gt),
-					       HZ * 5);
+	ret = wait_event_timeout(gt->sriov.vf.migration.wq,
+				 vf_valid_ggtt(gt), HZ * 5);
 	xe_gt_WARN_ON(gt, !ret);
 
 	return atomic_read(&gt->sriov.vf.migration.fixups_complete_count);
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 3433518cc095..e46f38f13d19 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -524,8 +524,14 @@ bool xe_memirq_guc_sw_int_0_irq_pending(struct xe_memirq *memirq, struct xe_guc
 {
 	struct xe_gt *gt = guc_to_gt(guc);
 	u32 offset = xe_gt_is_media_type(gt) ? ilog2(INTR_MGUC) : ilog2(INTR_GUC);
-	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
-						     XE_MEMIRQ_VECTOR_OFFSET(0, offset));
+	struct iosys_map map;
+
+	/* protect for a call during driver probe */
+	if (!iosys_map_is_set(&memirq->source))
+		return false;
+
+	map = IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
+				    XE_MEMIRQ_VECTOR_OFFSET(0, offset));
 
 	return memirq_received_noclear(memirq, &map, ilog2(GUC_INTR_SW_INT_0),
 				       guc_name(guc));
-- 
2.43.0

