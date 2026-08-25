Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC369C61DB9
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 22:48:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8C710EB5E;
	Tue, 25 Aug 2026 22:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dfDn1Axf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1177A10E60F
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 22:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787698105; x=1819234105;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/lAQIHSYpfRxvDx5jVNLWXG8bhRCQjRImxCD0Csia9I=;
 b=dfDn1AxfQl2Aixj+nuWRDclUoqyoH+lbnr38sQ1jEh2foohLiyyrZvE3
 d9U9GnXDUz8a4aa+5R7byKIZGf79s54+a/uKxGPlSisn0dydFD1ZvfZGl
 dVrcAl9GwrXnlcLKy8u97IMyamgvteqqadTCaeOq56Arg8q27BImHqQ0V
 3DJdD7ZUwwVpZUIvmi0fYVgnejKqr4b7QlXM1BkYJ34lQWaTfZryphfZM
 twt+/SH4AL0w9bswUnW0279qXE2wAfZniVD2SZRwo28BBtrUaZdjoOh0G
 SCp/fhdG4GfG4KH9BqySWX+AnwQv2meQJBh8nbIPR9pk9dS5QJORZ0P6a Q==;
X-CSE-ConnectionGUID: pjixuwAeTLieuTu4t0QI6A==
X-CSE-MsgGUID: 95t4AthBR0SA4rXnMn/r0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88380491"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="88380491"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 15:48:24 -0700
X-CSE-ConnectionGUID: JKq8aLH4S0y5gYsFYW4jNw==
X-CSE-MsgGUID: 85T304xbTl6Zl/sgbPJd5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="261269377"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa009.fm.intel.com with ESMTP; 25 Aug 2026 15:48:22 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/xe/bo: Take a runtime PM ref when shrinking a bo needing
 invalidation
Date: Tue, 25 Aug 2026 22:48:19 +0000
Message-Id: <20260825224819.2182540-1-shuicheng.lin@intel.com>
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
xe_bo_trigger_rebind() -> xe_vm_invalidate_vma() and submits a TLB
invalidation over GuC CT.  The non-purgeable branch reaches the same
code through ttm_bo_shrink(.allow_move = true) -> xe_bo_move().

When the device is runtime suspended the CT is disabled and the send
returns -ENODEV, tripping the XE_WARN_ON() in xe_bo_trigger_rebind():

  WARNING: drivers/gpu/drm/xe/xe_bo.c:770 at xe_bo_move_notify+0x1fc/0x450 [xe], CPU#2: xe_madvise/21389
   xe_bo_shrink+0x20f/0x2b0 [xe]
   __xe_shrinker_walk+0x174/0x410 [xe]
   xe_shrinker_walk+0x56/0xf0 [xe]
   xe_shrinker_scan+0x10c/0x1e0 [xe]
   do_shrink_slab+0x176/0x7e0
   shrink_slab+0x137/0x990
   drop_slab+0x7f/0x130
   drop_caches_sysctl_handler+0x9c/0xf0

The invalidation is always issued for a fault-mode vm; since commit
4e7ebff69aed ("drm/xe/xe3p_lpg: flush shrinker bo cachelines manually")
it is also issued for a non-fault-mode vm on hardware with an optimized
L2 flush, which is how this surfaced.

Add bo_needs_invalidate(), mirroring that condition, and use it in
xe_bo_shrink() to compute needs_rpm ahead of both branches.  The
reference is then held across xe_bo_move_notify() in either path, and is
not taken for a bo whose mappings would not have been invalidated.

Shrinking can run in reclaim contexts where the device may not be
resumed, so a bo is skipped when the reference cannot be acquired.  Have
that skip queue the shrinker PM worker: xe_shrinker_runtime_pm_get() is
gated on the needs of its own backup pass rather than on this one, and
on DGFX it returns before queueing anything, so without this a scan
where every candidate is skipped makes no progress, reports nothing
scanned and returns SHRINK_STOP with nothing arranging a wake.

Also gate the System CCS term on !xe_tt->purgeable, since
xe_bo_shrink_purge() frees the pages without a GPU copy.

Reproduced with igt@xe_madvise@dontneed-before-exec while the GPU is
runtime suspended.

Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
Assisted-by: Claude:claude-opus-5
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       | 62 +++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_shrinker.c | 18 +++++++++-
 drivers/gpu/drm/xe/xe_shrinker.h |  2 ++
 3 files changed, 72 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 2eb5d6aac523..274ff97d8542 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -734,6 +734,32 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 	}
 }
 
+/*
+ * Whether xe_bo_move_notify() will invalidate the GPU mappings of @bo, and
+ * therefore needs the device resumed to reach the GuC.
+ *
+ * This mirrors the condition under which xe_bo_trigger_rebind() below calls
+ * xe_vm_invalidate_vma(): always for a fault-mode vm, and for any bound vm on
+ * hardware where the L2 flush is optimized. Keep the two in sync.
+ *
+ * Context: Caller must hold the BO's dma-resv lock.
+ */
+static bool bo_needs_invalidate(struct xe_bo *bo)
+{
+	struct drm_gpuvm_bo *vm_bo;
+
+	if (xe_device_is_l2_flush_optimized(xe_bo_device(bo)))
+		return xe_bo_is_vm_bound(bo);
+
+	xe_bo_assert_held(bo);
+
+	drm_gem_for_each_gpuvm_bo(vm_bo, &bo->ttm.base)
+		if (xe_vm_in_fault_mode(gpuvm_to_vm(vm_bo->vm)))
+			return true;
+
+	return false;
+}
+
 static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 				const struct ttm_operation_ctx *ctx)
 {
@@ -1361,6 +1387,28 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo))
 		return xe_bo_shrink_purge(ctx, bo, scanned);
 
+	/*
+	 * Moving this bo out of a non-system placement makes
+	 * xe_bo_move_notify() invalidate its GPU mappings over GuC CT, and
+	 * System CCS needs a gpu copy when moving PL_TT -> PL_SYSTEM. Both
+	 * need the device resumed.
+	 */
+	needs_rpm = bo->resource->mem_type != XE_PL_SYSTEM &&
+		(bo_needs_invalidate(xe_bo) ||
+		 (!xe_tt->purgeable && !IS_DGFX(xe) &&
+		  xe_bo_needs_ccs_pages(xe_bo)));
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
@@ -1369,28 +1417,24 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
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

