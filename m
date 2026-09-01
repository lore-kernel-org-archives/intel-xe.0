Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EBEC61DD6
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 03:32:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FBD10E37B;
	Tue,  1 Sep 2026 03:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bx72vse3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B648A10E37B
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 03:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788233534; x=1819769534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zuGD8s9koMemF6Qn7Fi8d1y4er2s2blB/et13pV8/4M=;
 b=Bx72vse3pq+OiBvj5aNz6R2txPyG0w2ABwdA5o5na703L9wVUXnJrxWV
 K/CUkEvtjwJEbqE1+Gly5vaGbDBZtqrRNOHgsFpqT18uirsLpiAlFFt/1
 xZmGewNunavyYUxxXo+ZSQdA6Npokm8CH98mwzfm2vTnMShaOqWmNfcdw
 3Y2ehfkdrWTC9jxWFpzW6AG7Pn4DKo7s5sW79JVi5rHfbglfdu7GdjCxr
 3IuU81XUEjtbsmwCZjXWqyatke4cfLyPKN4ynvPTRs5SlIV8hNIjXKl7L
 dh+QuAJdEYJpPIxZrFKDv2dQNKreRkfwtyE0/kmSBEIl5zaCs/GBNE9yv Q==;
X-CSE-ConnectionGUID: FfGwfumSSe6dqsy7dGZoNA==
X-CSE-MsgGUID: RoCGe/IUSX6v4myd8i/zPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="99249711"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="99249711"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 20:32:14 -0700
X-CSE-ConnectionGUID: pl6qN7EiSIeQe/GJ4/r+Qg==
X-CSE-MsgGUID: m/+d/8MnSseZoG6oLzA1og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="264685151"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa006.fm.intel.com with ESMTP; 31 Aug 2026 20:32:13 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v4 2/2] drm/xe/shrinker: Take a runtime PM ref before
 shrinking non-system memory
Date: Tue,  1 Sep 2026 03:31:53 +0000
Message-Id: <20260901033153.219481-3-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260901033153.219481-1-shuicheng.lin@intel.com>
References: <20260901033153.219481-1-shuicheng.lin@intel.com>
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
and stop there if the device is not active, queueing the shrinker PM
worker so a later scan can pick those bos up.  Stop the walk once the
scan target is met, so a satisfied scan does not wake the device.
System memory is still reclaimed while the device is suspended.

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

Fixes: 4e7ebff69aed ("drm/xe/xe3p_lpg: flush shrinker bo cachelines manually")
Assisted-by: Claude:claude-opus-5
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_shrinker.c | 40 +++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index 953a911b51b3..d7f4e0b11bbb 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -54,12 +54,14 @@ xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgea
 	write_unlock(&shrinker->lock);
 }
 
-static s64 __xe_shrinker_walk(struct xe_device *xe,
+static s64 __xe_shrinker_walk(struct xe_shrinker *shrinker,
 			      struct ttm_operation_ctx *ctx,
 			      const struct xe_bo_shrink_flags flags,
 			      unsigned long to_scan, unsigned long *scanned)
 {
+	struct xe_device *xe = shrinker->xe;
 	unsigned int mem_type;
+	bool rpm = false;
 	s64 freed = 0, lret;
 
 	for (mem_type = XE_PL_SYSTEM; mem_type <= XE_PL_TT; ++mem_type) {
@@ -71,9 +73,22 @@ static s64 __xe_shrinker_walk(struct xe_device *xe,
 			.trylock_only = true,
 		};
 
+		if (*scanned >= to_scan)
+			break;
+
 		if (!man || !man->use_tt)
 			continue;
 
+		if (mem_type != XE_PL_SYSTEM && !rpm &&
+		    xe_device_is_l2_flush_optimized(xe)) {
+			if (!xe_pm_runtime_get_if_active(xe)) {
+				queue_work(xe->unordered_wq,
+					   &shrinker->pm_worker);
+				break;
+			}
+			rpm = true;
+		}
+
 		ttm_bo_lru_for_each_reserved_guarded(&curs, man, &arg, ttm_bo) {
 			if (!ttm_bo_shrink_suitable(ttm_bo, ctx))
 				continue;
@@ -81,8 +96,11 @@ static s64 __xe_shrinker_walk(struct xe_device *xe,
 			lret = xe_bo_shrink(ctx, ttm_bo, flags, scanned);
 			if (lret == -EBUSY)
 				continue;
-			if (lret < 0)
-				return freed ? freed : lret;
+			if (lret < 0) {
+				if (!freed)
+					freed = lret;
+				goto out;
+			}
 
 			freed += lret;
 			if (*scanned >= to_scan)
@@ -92,6 +110,10 @@ static s64 __xe_shrinker_walk(struct xe_device *xe,
 		xe_assert(xe, !IS_ERR(ttm_bo));
 	}
 
+out:
+	if (rpm)
+		xe_pm_runtime_put(xe);
+
 	return freed;
 }
 
@@ -101,7 +123,7 @@ static s64 __xe_shrinker_walk(struct xe_device *xe,
  * add writeback. This avoids stalls and explicit writebacks with light or
  * moderate memory pressure.
  */
-static s64 xe_shrinker_walk(struct xe_device *xe,
+static s64 xe_shrinker_walk(struct xe_shrinker *shrinker,
 			    struct ttm_operation_ctx *ctx,
 			    const struct xe_bo_shrink_flags flags,
 			    unsigned long to_scan, unsigned long *scanned)
@@ -112,14 +134,14 @@ static s64 xe_shrinker_walk(struct xe_device *xe,
 
 	swap(no_wait_gpu, ctx->no_wait_gpu);
 	save_flags.writeback = false;
-	lret = __xe_shrinker_walk(xe, ctx, save_flags, to_scan, scanned);
+	lret = __xe_shrinker_walk(shrinker, ctx, save_flags, to_scan, scanned);
 	swap(no_wait_gpu, ctx->no_wait_gpu);
 	if (lret < 0 || *scanned >= to_scan)
 		return lret;
 
 	freed = lret;
 	if (!ctx->no_wait_gpu) {
-		lret = __xe_shrinker_walk(xe, ctx, save_flags, to_scan, scanned);
+		lret = __xe_shrinker_walk(shrinker, ctx, save_flags, to_scan, scanned);
 		if (lret < 0)
 			return lret;
 		freed += lret;
@@ -128,7 +150,7 @@ static s64 xe_shrinker_walk(struct xe_device *xe,
 	}
 
 	if (flags.writeback) {
-		lret = __xe_shrinker_walk(xe, ctx, flags, to_scan, scanned);
+		lret = __xe_shrinker_walk(shrinker, ctx, flags, to_scan, scanned);
 		if (lret < 0)
 			return lret;
 		freed += lret;
@@ -228,7 +250,7 @@ static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_con
 	runtime_pm = xe_shrinker_runtime_pm_get(shrinker, false, nr_to_scan, can_backup);
 
 	if (purgeable && nr_scanned < nr_to_scan) {
-		lret = xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
+		lret = xe_shrinker_walk(shrinker, &ctx, shrink_flags,
 					nr_to_scan, &nr_scanned);
 		if (lret >= 0)
 			freed += lret;
@@ -244,7 +266,7 @@ static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_con
 
 	shrink_flags.purge = false;
 
-	lret = xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
+	lret = xe_shrinker_walk(shrinker, &ctx, shrink_flags,
 				nr_to_scan, &nr_scanned);
 	if (lret >= 0)
 		freed += lret;
-- 
2.43.0

