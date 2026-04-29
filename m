Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3851CFF8873
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 20:33:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9CB010F170;
	Wed, 29 Apr 2026 20:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kL0JD40J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C1E10F170
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 20:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777494801; x=1809030801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gsd4bUIFPR+REzw6rf7vtW5tfpZa7vs2KHR7YWtMi3o=;
 b=kL0JD40JKnuLocNYYeCyHpSLZWwfpF9h/858dcZ/SSiU7Y2LwDqc3wGt
 WhYIQ7944fc2EHHllpjOTFZZJ7XpcQjfqKGRgeM3xXHuQb5rsgYPLZEd3
 zDi5OtxoJAjFtNAzIF1tJ0b3xT+6r+ISQJtC0NaEta4+sIuNOy68+c8kT
 HH+kxBifE2icAkuT/oWMZTiRMmY6mYXEdS1lqEepeYezjmRi2yH/srL79
 CO2nNa2kgK6FgsW3kuEQk7brvX+jbR52C/nZ6nTuGDF1AbcRClt/LM2nq
 GsPb4lfQEmNLA42KB4KxUCIvzxIowxDjMnJqH1xFYY0yRMfLMwR2yaiwp Q==;
X-CSE-ConnectionGUID: DXG/FtxrR9+tlWBO9mklNw==
X-CSE-MsgGUID: OMIWJ+fuTy+LFuiihIAR6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78489243"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="78489243"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 13:33:21 -0700
X-CSE-ConnectionGUID: 6Hm/UCOCR2KZ9j7HrLEeiw==
X-CSE-MsgGUID: 2KGGTiIrSbuYiVatrOD15A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="272497697"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa001.jf.intel.com with ESMTP; 29 Apr 2026 13:33:20 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>
Subject: [PATCH v1 2/2] drm/xe: After VF migration,
 repeat BO mapping in progress
Date: Wed, 29 Apr 2026 22:39:37 +0200
Message-Id: <20260429203937.2070047-3-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260429203937.2070047-1-tomasz.lis@intel.com>
References: <20260429203937.2070047-1-tomasz.lis@intel.com>
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

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Tested-by: Adam Miszczak <adam.miszczak@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 27 ++++++++-------------------
 drivers/gpu/drm/xe/xe_ggtt.c       | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_memirq.c     |  8 +++++++-
 3 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 04a48c2cf963..fba85e0f8bc4 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -371,28 +371,17 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 	 * from the moment vCPU resumes execution.
 	 */
 	for (i = 0; i < q->width; ++i) {
-		struct xe_lrc *__lrc = NULL;
-		int marker;
 
-		do {
-			struct xe_lrc *lrc;
-
-			marker = xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
-
-			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
-					    xe_lrc_ring_size(), q->msix_vec, flags);
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
+		lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
+				    xe_lrc_ring_size(), q->msix_vec, flags);
+		if (IS_ERR(lrc)) {
+			err = PTR_ERR(lrc);
+			goto err_lrc;
+		}
 
-		} while (marker != xe_vf_migration_fixups_complete_count(q->gt));
+		xe_exec_queue_set_lrc(q, lrc, i);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index a351c578b170..8f4002c1afa6 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -21,6 +21,7 @@
 #include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_gt_printk.h"
+#include "xe_gt_sriov_vf.h"
 #include "xe_gt_types.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
@@ -789,6 +790,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 {
 	u64 alignment = bo->min_align > 0 ? bo->min_align : XE_PAGE_SIZE;
 	u8 tile_id = ggtt->tile->id;
+	int marker;
 	int err;
 
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
@@ -813,6 +815,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 		goto out;
 	}
 
+retry:
+	marker = xe_gt_sriov_vf_wait_valid_ggtt(ggtt->tile->primary_gt);
+
 	mutex_lock(&ggtt->lock);
 	/*
 	 * When inheriting the initial framebuffer, the framebuffer is
@@ -845,6 +850,18 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 		u64 pte = ggtt->pt_ops->pte_encode_flags(bo, pat_index);
 
 		xe_ggtt_map_bo(ggtt, bo->ggtt_node[tile_id], bo, pte);
+
+		/*
+		 * If VF migration happens during BO mapping, some PTE value writes may
+		 * be ignored by HW. This can happen in case GGTT range changes; already
+		 * set PTEs are moved by the VF restore, but xe_ggtt_map_bo() within VM
+		 * may still loop at old position. To be sure, redo all PTE writes.
+		 */
+		if (marker != xe_vf_migration_fixups_complete_count(ggtt->tile->primary_gt)) {
+			drm_mm_remove_node(&bo->ggtt_node[tile_id]->base);
+			mutex_unlock(&ggtt->lock);
+			goto retry;
+		}
 	}
 	mutex_unlock(&ggtt->lock);
 
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 811e07136efb..389a41a07ff9 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -491,7 +491,13 @@ bool xe_memirq_guc_sw_int_0_irq_pending(struct xe_memirq *memirq, struct xe_guc
 {
 	struct xe_gt *gt = guc_to_gt(guc);
 	u32 offset = xe_gt_is_media_type(gt) ? ilog2(INTR_MGUC) : ilog2(INTR_GUC);
-	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&memirq->status, offset * SZ_16);
+	struct iosys_map map;
+
+	/* protect for a call during driver probe */
+	if (!iosys_map_is_set(&memirq->status))
+		return false;
+
+	map = IOSYS_MAP_INIT_OFFSET(&memirq->status, offset * SZ_16);
 
 	return memirq_received_noclear(memirq, &map, ilog2(GUC_INTR_SW_INT_0),
 				       guc_name(guc));
-- 
2.25.1

