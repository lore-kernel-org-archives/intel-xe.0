Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFD0C61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 18:28:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5EF10E511;
	Fri, 28 Aug 2026 18:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YlJOCbv3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB0710E511
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 18:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787941710; x=1819477710;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KxoplBeZoMwDE2I9dOB7EHjsaJBbdEv/5TNf/nbnGYs=;
 b=YlJOCbv3iS+mxqjFLIXn3CYHW0sk60eGPSI+AQ9zXQZc9ZF1co9svSyF
 5xnjGTMTdYICe48CoYnf2/z/2sCtOED+jmQmYDxJVIjPILSEjzFkquIVD
 S7tqyvMvga4p0e6osTgREuAI7iCtVH/fuhVvDpbo0CBEdb/oLzUXBGupg
 8UvU3epFvUD5LIOdx+rhlmwM4BMty63JVKLUgwkaLUIgiWmi2bO4bWDhy
 /HLWfAK2cyHF5re2gQCssYOWTSbpYSa7WZZNTfIkcgp7qgvlyO8lY1zRD
 d9grhV+GPtEdgsDw21Rle//Le+TTJDZIeZRn2Nxq7DrWbvwLkk4apK/Lk A==;
X-CSE-ConnectionGUID: h9zpzDB/Tl+7QaSD1ypdgQ==
X-CSE-MsgGUID: iwmDdCWMRY2idFkOJBnCpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="92268703"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="92268703"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 11:28:30 -0700
X-CSE-ConnectionGUID: rUCgzTuzQGaN3bSdhclCcw==
X-CSE-MsgGUID: pMYD+f3iT1OIKU0XUiTRxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="270171431"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa004.fm.intel.com with ESMTP; 28 Aug 2026 11:28:28 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2] drm/xe/bo: Take a runtime PM ref when shrinking a
 non-system bo
Date: Fri, 28 Aug 2026 18:28:19 +0000
Message-Id: <20260828182819.86841-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
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

xe_bo_shrink() only took a runtime PM reference for the System CCS
backup case, and only after the purgeable branch had already returned.
That branch calls xe_bo_move_notify(), which reaches
xe_vm_invalidate_vma(): it zaps the page table entries and submits a TLB
invalidation over GuC CT.  The non-purgeable branch reaches the same code
through ttm_bo_shrink() -> xe_bo_move().

With the device runtime suspended the zap trips the assert in
xe_map_memset(), and the CT is disabled so the invalidation returns
-ENODEV:

  Assertion `!xe_pm_runtime_suspended(xe)` failed!
   xe_pt_zap_ptes_entry+0xb8/0x120 [xe]
   xe_vm_invalidate_vma_submit+0xb1/0x770 [xe]

  WARNING: drivers/gpu/drm/xe/xe_bo.c:770 at xe_bo_move_notify+0x1fc/0x450 [xe]
   xe_bo_shrink+0x20f/0x2b0 [xe]
   __xe_shrinker_walk+0x174/0x410 [xe]
   xe_shrinker_scan+0x10c/0x1e0 [xe]
   do_shrink_slab+0x176/0x7e0
   drop_caches_sysctl_handler+0x9c/0xf0

Compute needs_rpm ahead of both branches so the reference is held across
xe_bo_move_notify() in either path.  A bo already in XE_PL_SYSTEM needs
neither the invalidation nor the CCS copy, so it stays reclaimable while
the device is suspended.

A bo is skipped when the reference cannot be acquired, since resuming is
not allowed from every reclaim context.  Queue the shrinker PM worker
from there: xe_shrinker_runtime_pm_get() is gated on the needs of its own
backup pass and returns early on DGFX, so otherwise a scan that skips
every candidate returns SHRINK_STOP with nothing arranging a wake.

Only a non-fault-mode vm can reach this.  A fault-mode vm requires LR
mode, which holds a runtime PM reference for the vm's lifetime, so the
device cannot be suspended while one exists.

Reproduced with igt@xe_madvise@dontneed-after-exec while the GPU is
runtime suspended.

v2: simplify needs_rpm check. (Matt)
    retarget Fixes tag since issue occurs with non-fault-mode path added
    by 4e7ebff69aed.

Fixes: 4e7ebff69aed ("drm/xe/xe3p_lpg: flush shrinker bo cachelines manually")
Assisted-by: Claude:claude-opus-5
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 28 +++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_shrinker.c | 18 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_shrinker.h |  2 ++
 3 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 2eb5d6aac523..95c168f6eb48 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1361,6 +1361,20 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo))
 		return xe_bo_shrink_purge(ctx, bo, scanned);
 
+	/* Both the invalidation and the System CCS copy need the device. */
+	needs_rpm = bo->resource->mem_type != XE_PL_SYSTEM;
+	if (needs_rpm && !xe_pm_runtime_get_if_active(xe)) {
+		/*
+		 * Resuming is not allowed from all reclaim contexts, so leave
+		 * this bo alone and ask for the device to be woken up outside
+		 * of reclaim. xe_shrinker_runtime_pm_get() is gated on the
+		 * needs of its own backup pass rather than on ours, and on
+		 * DGFX it returns before queueing anything, so ask here.
+		 */
+		xe_shrinker_queue_pm(xe->mem.shrinker);
+		goto out_unref;
+	}
+
 	if (xe_tt->purgeable) {
 		if (bo->resource->mem_type != XE_PL_SYSTEM)
 			lret = xe_bo_move_notify(xe_bo, ctx);
@@ -1369,28 +1383,24 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 		if (lret > 0 && xe_bo_madv_is_dontneed(xe_bo))
 			xe_bo_set_purgeable_state(xe_bo,
 						  XE_MADV_PURGEABLE_PURGED);
-		goto out_unref;
+		goto out_put_rpm;
 	}
 
-	/* System CCS needs gpu copy when moving PL_TT -> PL_SYSTEM */
-	needs_rpm = (!IS_DGFX(xe) && bo->resource->mem_type != XE_PL_SYSTEM &&
-		     xe_bo_needs_ccs_pages(xe_bo));
-	if (needs_rpm && !xe_pm_runtime_get_if_active(xe))
-		goto out_unref;
-
 	*scanned += tt->num_pages;
 	lret = ttm_bo_shrink(ctx, bo, (struct ttm_bo_shrink_flags)
 			     {.purge = false,
 			      .writeback = flags.writeback,
 			      .allow_move = true});
-	if (needs_rpm)
-		xe_pm_runtime_put(xe);
 
 	if (lret > 0) {
 		xe_ttm_tt_account_subtract(xe, tt);
 		update_global_total_pages(bo->bdev, -(long)tt->num_pages);
 	}
 
+out_put_rpm:
+	if (needs_rpm)
+		xe_pm_runtime_put(xe);
+
 out_unref:
 	xe_bo_put(xe_bo);
 
diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index 83374cd57660..fb6ec77972a5 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -54,6 +54,22 @@ xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgea
 	write_unlock(&shrinker->lock);
 }
 
+/**
+ * xe_shrinker_queue_pm() - Ask for the device to be woken up for shrinking
+ * @shrinker: Pointer to the struct xe_shrinker.
+ *
+ * Queue a worker that takes and drops a runtime PM reference. Shrinking can
+ * be called from reclaim context, where resuming the device is not always
+ * allowed, so a caller that needs the device resumed but could not acquire a
+ * reference uses this to have it woken up outside of reclaim. The current
+ * scan makes no progress on the affected buffer objects, but a subsequent one
+ * can.
+ */
+void xe_shrinker_queue_pm(struct xe_shrinker *shrinker)
+{
+	queue_work(shrinker->xe->unordered_wq, &shrinker->pm_worker);
+}
+
 static s64 __xe_shrinker_walk(struct xe_device *xe,
 			      struct ttm_operation_ctx *ctx,
 			      const struct xe_bo_shrink_flags flags,
@@ -185,7 +201,7 @@ static bool xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker, bool force,
 			xe_pm_runtime_get(xe);
 			return true;
 		}
-		queue_work(xe->unordered_wq, &shrinker->pm_worker);
+		xe_shrinker_queue_pm(shrinker);
 		return false;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_shrinker.h b/drivers/gpu/drm/xe/xe_shrinker.h
index 5132ae5192e1..86d2a322cadd 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.h
+++ b/drivers/gpu/drm/xe/xe_shrinker.h
@@ -11,6 +11,8 @@ struct xe_device;
 
 void xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgeable);
 
+void xe_shrinker_queue_pm(struct xe_shrinker *shrinker);
+
 int xe_shrinker_create(struct xe_device *xe);
 
 #endif
-- 
2.43.0

