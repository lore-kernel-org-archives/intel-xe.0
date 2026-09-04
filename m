Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F4FC624DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:51:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BDC10E580;
	Fri,  4 Sep 2026 21:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ef/Y8RsC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A78F10E580
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788558704; x=1820094704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=52LlQO2CQ8u6M9XRjUXcKEYRmSvtOJAfc0Kmpb++tNU=;
 b=ef/Y8RsCeEGqfHvraNP+tSp+4nzCcrzZrvARaipMYw3oRUue/2WyjRV2
 oAgaD31XdqvwMRxGxgOyGr9oNhP63uJ/PaRMAsnC6T4K9R/MJNCOqOO3a
 BLWG+J2tCj5rbqbDVVXeT0b7F1Wt8G/1dd2FQofbdbSCVSBIaI1FlHr/i
 DT4R4EsAmBaeiCxlAtf39c2nhmLHQ612tfQZuTbO7ubaExnE3t3Ll0Il6
 w5UTuzpvGJpGlUjdfoONtmZJpc0tFh4Leusurnbgyn5SeHvGN93tjaEsW
 2pO9EUJ1Gej6I6wPiAVCoE5x9rOF+1IL+giPFpNd45WdPnmJOvxfly9ja g==;
X-CSE-ConnectionGUID: KtGL6wZuSNORnuDfOzkZAA==
X-CSE-MsgGUID: ntfM9e2FQ2i/nzXWUdfaTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="106433889"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="106433889"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:51:44 -0700
X-CSE-ConnectionGUID: uq7QX9fUS1ueb4vD26ythg==
X-CSE-MsgGUID: S7iOIi7fQzyWT+Ur87JQbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="266893052"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa007.fm.intel.com with ESMTP; 04 Sep 2026 14:51:42 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v6 2/2] drm/xe/shrinker: Take a runtime PM ref before
 shrinking non-system memory
Date: Fri,  4 Sep 2026 21:50:49 +0000
Message-Id: <20260904215049.543535-3-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904215049.543535-1-shuicheng.lin@intel.com>
References: <20260904215049.543535-1-shuicheng.lin@intel.com>
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

__xe_shrinker_walk() walks the SYSTEM and TT LRUs without a runtime PM
reference.  Shrinking a bo outside system memory invalidates its GPU
mappings, which needs the device resumed, so while it is runtime
suspended the page table zap trips an assert and the TLB invalidation
returns -ENODEV:

  WARNING: drivers/gpu/drm/xe/xe_bo.c:770 at xe_bo_move_notify+0x1fc/0x450 [xe]
   xe_bo_shrink+0x20f/0x2b0 [xe]
   __xe_shrinker_walk+0x174/0x410 [xe]
   xe_shrinker_scan+0x10c/0x1e0 [xe]
   do_shrink_slab+0x176/0x7e0
   drop_caches_sysctl_handler+0x9c/0xf0

Take a reference before walking a memory type other than XE_PL_SYSTEM
and stop there if it cannot be acquired.  Reuse the shrinker's existing
acquire path, which resumes the device directly where reclaim allows
that and otherwise queues the PM worker for a later scan.  Stop the walk
once the scan target is met, so a satisfied scan does not wake the
device.  System memory is still reclaimed while the device is suspended.

Gate this on xe_device_is_l2_flush_optimized(), the same condition under
which xe_bo_trigger_rebind() issues the invalidation for a non-fault-mode
vm, so reclaim is unaffected elsewhere.  The System CCS copy already has
its own reference in xe_bo_shrink().

Only a non-fault-mode vm can reach this, since a fault-mode vm requires
LR mode and that holds a runtime PM reference for the vm's lifetime.

Reproduced with igt@xe_madvise@dontneed-before-exec while the GPU is
runtime suspended.

v2: simplify needs_rpm check. (Matt)
    retarget Fixes tag since the issue occurs with the non-fault-mode
    path added by 4e7ebff69aed.
v3: handle this in xe_shrinker.c instead of xe_bo.c (Thomas)
v4: stop the walk once the scan target is met. (Sashiko)
v5: rebase on the freed page accounting fix. (Sashiko)
v6: reuse the shrinker acquire path so runtime pm can be resumed
    directly instead of always queueing a worker. (Thomas)

Fixes: 4e7ebff69aed ("drm/xe/xe3p_lpg: flush shrinker bo cachelines manually")
Assisted-by: Claude:claude-opus-5
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_shrinker.c | 67 ++++++++++++++++++++++----------
 1 file changed, 46 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index 89445cd20238..13f49ac873b4 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -54,13 +54,33 @@ xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgea
 	write_unlock(&shrinker->lock);
 }
 
-static int __xe_shrinker_walk(struct xe_device *xe,
+static bool __xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker)
+{
+	struct xe_device *xe = shrinker->xe;
+
+	if (xe_pm_runtime_get_if_active(xe))
+		return true;
+
+	if (xe_rpm_reclaim_safe(xe) && !ttm_bo_shrink_avoid_wait()) {
+		xe_pm_runtime_get(xe);
+		return true;
+	}
+
+	queue_work(xe->unordered_wq, &shrinker->pm_worker);
+
+	return false;
+}
+
+static int __xe_shrinker_walk(struct xe_shrinker *shrinker,
 			      struct ttm_operation_ctx *ctx,
 			      const struct xe_bo_shrink_flags flags,
 			      unsigned long to_scan, unsigned long *scanned,
 			      unsigned long *freed)
 {
+	struct xe_device *xe = shrinker->xe;
 	unsigned int mem_type;
+	bool rpm = false;
+	int ret = 0;
 	s64 lret;
 
 	for (mem_type = XE_PL_SYSTEM; mem_type <= XE_PL_TT; ++mem_type) {
@@ -75,23 +95,36 @@ static int __xe_shrinker_walk(struct xe_device *xe,
 		if (!man || !man->use_tt)
 			continue;
 
+		if (mem_type != XE_PL_SYSTEM && !rpm &&
+		    xe_device_is_l2_flush_optimized(xe)) {
+			if (!__xe_shrinker_runtime_pm_get(shrinker))
+				break;
+			rpm = true;
+		}
+
 		ttm_bo_lru_for_each_reserved_guarded(&curs, man, &arg, ttm_bo) {
 			if (!ttm_bo_shrink_suitable(ttm_bo, ctx))
 				continue;
 
 			lret = xe_bo_shrink(ctx, ttm_bo, flags, scanned);
-			if (lret < 0)
-				return lret;
+			if (lret < 0) {
+				ret = lret;
+				goto out;
+			}
 
 			*freed += lret;
 			if (*scanned >= to_scan)
-				break;
+				goto out;
 		}
 		/* Trylocks should never error, just fail. */
 		xe_assert(xe, !IS_ERR(ttm_bo));
 	}
 
-	return 0;
+out:
+	if (rpm)
+		xe_pm_runtime_put(xe);
+
+	return ret;
 }
 
 /*
@@ -100,7 +133,7 @@ static int __xe_shrinker_walk(struct xe_device *xe,
  * add writeback. This avoids stalls and explicit writebacks with light or
  * moderate memory pressure.
  */
-static int xe_shrinker_walk(struct xe_device *xe,
+static int xe_shrinker_walk(struct xe_shrinker *shrinker,
 			    struct ttm_operation_ctx *ctx,
 			    const struct xe_bo_shrink_flags flags,
 			    unsigned long to_scan, unsigned long *scanned,
@@ -112,20 +145,21 @@ static int xe_shrinker_walk(struct xe_device *xe,
 
 	swap(no_wait_gpu, ctx->no_wait_gpu);
 	save_flags.writeback = false;
-	ret = __xe_shrinker_walk(xe, ctx, save_flags, to_scan, scanned, freed);
+	ret = __xe_shrinker_walk(shrinker, ctx, save_flags, to_scan, scanned,
+				 freed);
 	swap(no_wait_gpu, ctx->no_wait_gpu);
 	if (ret || *scanned >= to_scan)
 		return ret;
 
 	if (!ctx->no_wait_gpu) {
-		ret = __xe_shrinker_walk(xe, ctx, save_flags, to_scan, scanned,
+		ret = __xe_shrinker_walk(shrinker, ctx, save_flags, to_scan, scanned,
 					 freed);
 		if (ret || *scanned >= to_scan)
 			return ret;
 	}
 
 	if (flags.writeback)
-		ret = __xe_shrinker_walk(xe, ctx, flags, to_scan, scanned,
+		ret = __xe_shrinker_walk(shrinker, ctx, flags, to_scan, scanned,
 					 freed);
 
 	return ret;
@@ -176,16 +210,7 @@ static bool xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker, bool force,
 			return false;
 	}
 
-	if (!xe_pm_runtime_get_if_active(xe)) {
-		if (xe_rpm_reclaim_safe(xe) && !ttm_bo_shrink_avoid_wait()) {
-			xe_pm_runtime_get(xe);
-			return true;
-		}
-		queue_work(xe->unordered_wq, &shrinker->pm_worker);
-		return false;
-	}
-
-	return true;
+	return __xe_shrinker_runtime_pm_get(shrinker);
 }
 
 static void xe_shrinker_runtime_pm_put(struct xe_shrinker *shrinker, bool runtime_pm)
@@ -221,7 +246,7 @@ static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_con
 	runtime_pm = xe_shrinker_runtime_pm_get(shrinker, false, nr_to_scan, can_backup);
 
 	if (purgeable && nr_scanned < nr_to_scan)
-		xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
+		xe_shrinker_walk(shrinker, &ctx, shrink_flags,
 				 nr_to_scan, &nr_scanned, &freed);
 
 	sc->nr_scanned = nr_scanned;
@@ -234,7 +259,7 @@ static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_con
 
 	shrink_flags.purge = false;
 
-	xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
+	xe_shrinker_walk(shrinker, &ctx, shrink_flags,
 			 nr_to_scan, &nr_scanned, &freed);
 
 	sc->nr_scanned = nr_scanned;
-- 
2.43.0

