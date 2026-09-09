Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD2DC79FB7
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:21:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4508610F22B;
	Wed,  9 Sep 2026 16:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cVhuIVJN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2744E10F22B
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 16:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788970894; x=1820506894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7QGFXk273EmcHKKuNhScwuTJTe2KTZdkR4C4p4E189A=;
 b=cVhuIVJNZ+5AoajZkYO2JFlOvmFaWxMKqLjqnHh5UKQkyytU6Hih8WVd
 QR4o+LeH7gxQnCBMxVC0PaxiNGN3vdkNJndZvFGETkXl41ALe7snwGow7
 cU0+q5PTFRms78zJYbw6bSGWVpNGlCpxy6ugdk/wScWvitEh0PFaEHWun
 YBVnamHq8MLLAfItAFF0cnVZ7Ev/hrvfPorG2lC0+nfDXKrH/utjQHD1l
 hoqdR4ViQEcNQPXeq1Qoae370OM1DsIizSaa5Yfo8Hvr6VQcDbFoFG4Bc
 7Qws449X305kpV5vBFFwe2qOGVRRmsfp8qgNDBexNPr8+IfGgSoaQxCME A==;
X-CSE-ConnectionGUID: V6dsVTfsRPWwEdcYKYIxlA==
X-CSE-MsgGUID: QtY7qmKpSIG/cynbP5yGHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100000086"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="100000086"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:21:34 -0700
X-CSE-ConnectionGUID: I3B9u16zTUuHl/43UIY+8Q==
X-CSE-MsgGUID: 6OAzqhy6QCSVpdlfreOV3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="268782991"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa008.fm.intel.com with ESMTP; 09 Sep 2026 09:21:32 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v7 2/2] drm/xe/shrinker: Take a runtime PM ref before
 shrinking non-system memory
Date: Wed,  9 Sep 2026 16:21:02 +0000
Message-Id: <20260909162102.1097006-3-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909162102.1097006-1-shuicheng.lin@intel.com>
References: <20260909162102.1097006-1-shuicheng.lin@intel.com>
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
v7: replace xe_pm_runtime_put() with xe_shrinker_runtime_pm_put(). (Thomas)

Fixes: 4e7ebff69aed ("drm/xe/xe3p_lpg: flush shrinker bo cachelines manually")
Assisted-by: Claude:claude-opus-5
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_shrinker.c | 78 +++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index 89445cd20238..deb4378c1ec1 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -54,13 +54,39 @@ xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgea
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
+static void xe_shrinker_runtime_pm_put(struct xe_shrinker *shrinker, bool runtime_pm)
+{
+	if (runtime_pm)
+		xe_pm_runtime_put(shrinker->xe);
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
@@ -75,23 +101,35 @@ static int __xe_shrinker_walk(struct xe_device *xe,
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
+	xe_shrinker_runtime_pm_put(shrinker, rpm);
+
+	return ret;
 }
 
 /*
@@ -100,7 +138,7 @@ static int __xe_shrinker_walk(struct xe_device *xe,
  * add writeback. This avoids stalls and explicit writebacks with light or
  * moderate memory pressure.
  */
-static int xe_shrinker_walk(struct xe_device *xe,
+static int xe_shrinker_walk(struct xe_shrinker *shrinker,
 			    struct ttm_operation_ctx *ctx,
 			    const struct xe_bo_shrink_flags flags,
 			    unsigned long to_scan, unsigned long *scanned,
@@ -112,20 +150,21 @@ static int xe_shrinker_walk(struct xe_device *xe,
 
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
@@ -176,22 +215,7 @@ static bool xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker, bool force,
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
-}
-
-static void xe_shrinker_runtime_pm_put(struct xe_shrinker *shrinker, bool runtime_pm)
-{
-	if (runtime_pm)
-		xe_pm_runtime_put(shrinker->xe);
+	return __xe_shrinker_runtime_pm_get(shrinker);
 }
 
 static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
@@ -221,7 +245,7 @@ static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_con
 	runtime_pm = xe_shrinker_runtime_pm_get(shrinker, false, nr_to_scan, can_backup);
 
 	if (purgeable && nr_scanned < nr_to_scan)
-		xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
+		xe_shrinker_walk(shrinker, &ctx, shrink_flags,
 				 nr_to_scan, &nr_scanned, &freed);
 
 	sc->nr_scanned = nr_scanned;
@@ -234,7 +258,7 @@ static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_con
 
 	shrink_flags.purge = false;
 
-	xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
+	xe_shrinker_walk(shrinker, &ctx, shrink_flags,
 			 nr_to_scan, &nr_scanned, &freed);
 
 	sc->nr_scanned = nr_scanned;
-- 
2.43.0

