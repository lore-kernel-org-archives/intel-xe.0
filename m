Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F2EC61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 22:52:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9055A10E1A0;
	Mon, 31 Aug 2026 22:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XM1VyH+R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4450210E1A0
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 22:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788216774; x=1819752774;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7hH2M5MLQCJFz8rGx2oCvVHYZfDgCjvi70MzBEv+fOk=;
 b=XM1VyH+RDBuruxOcS51W5V4aAUYXBa02PqTUqd3pzyte8EXZQ2e8MU02
 +9kHvRgegQuBwoATjASyzyf96WDC5j6/SkwNSCwzm4vfIZmdWNJIQFGRd
 I2yqSV3XiQ/Px7dH6CI6wIqJHBXNl7Wen/F/Ul0ItrOkW+phQUU8nLDF/
 YqtHJ7AoHbeeiHj7U+2S8PThZ1/uCq1ENC2yabvxOVx25P0rbbr/pTxgz
 EQfKAANie9LABQ1aZ3tSH9wbjbidIBA9OGE7DQTw81r5WC+A4Tm8izwTq
 tPemrrvEai6YtD2DCXJaAJUmk/sbGK1eSwAU/ppzvAG3KYvsUm9sOuaos A==;
X-CSE-ConnectionGUID: 724t5Uy2RNyooRbJxHGA8Q==
X-CSE-MsgGUID: cLU+x90PQfac0sX/N2XV4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="100147755"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="100147755"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 15:52:53 -0700
X-CSE-ConnectionGUID: Y9qnI/nHQRWGwClFyQ3BSA==
X-CSE-MsgGUID: J4MFzdl6RZ6yi5x8V+ubIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="272426562"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa003.jf.intel.com with ESMTP; 31 Aug 2026 15:52:52 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v3] drm/xe/shrinker: Take a runtime PM ref before shrinking
 non-system memory
Date: Mon, 31 Aug 2026 22:52:32 +0000
Message-Id: <20260831225232.118607-1-shuicheng.lin@intel.com>
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
worker so a later scan can pick those bos up.  System memory is still
reclaimed while the device is suspended.

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

Fixes: 4e7ebff69aed ("drm/xe/xe3p_lpg: flush shrinker bo cachelines manually")
Assisted-by: Claude:claude-opus-5
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_shrinker.c | 36 ++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index 83374cd57660..175218b5edd9 100644
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
@@ -74,13 +76,25 @@ static s64 __xe_shrinker_walk(struct xe_device *xe,
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
 
 			lret = xe_bo_shrink(ctx, ttm_bo, flags, scanned);
-			if (lret < 0)
-				return lret;
+			if (lret < 0) {
+				freed = lret;
+				goto out;
+			}
 
 			freed += lret;
 			if (*scanned >= to_scan)
@@ -90,6 +104,10 @@ static s64 __xe_shrinker_walk(struct xe_device *xe,
 		xe_assert(xe, !IS_ERR(ttm_bo));
 	}
 
+out:
+	if (rpm)
+		xe_pm_runtime_put(xe);
+
 	return freed;
 }
 
@@ -99,7 +117,7 @@ static s64 __xe_shrinker_walk(struct xe_device *xe,
  * add writeback. This avoids stalls and explicit writebacks with light or
  * moderate memory pressure.
  */
-static s64 xe_shrinker_walk(struct xe_device *xe,
+static s64 xe_shrinker_walk(struct xe_shrinker *shrinker,
 			    struct ttm_operation_ctx *ctx,
 			    const struct xe_bo_shrink_flags flags,
 			    unsigned long to_scan, unsigned long *scanned)
@@ -110,14 +128,14 @@ static s64 xe_shrinker_walk(struct xe_device *xe,
 
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
@@ -126,7 +144,7 @@ static s64 xe_shrinker_walk(struct xe_device *xe,
 	}
 
 	if (flags.writeback) {
-		lret = __xe_shrinker_walk(xe, ctx, flags, to_scan, scanned);
+		lret = __xe_shrinker_walk(shrinker, ctx, flags, to_scan, scanned);
 		if (lret < 0)
 			return lret;
 		freed += lret;
@@ -226,7 +244,7 @@ static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_con
 	runtime_pm = xe_shrinker_runtime_pm_get(shrinker, false, nr_to_scan, can_backup);
 
 	if (purgeable && nr_scanned < nr_to_scan) {
-		lret = xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
+		lret = xe_shrinker_walk(shrinker, &ctx, shrink_flags,
 					nr_to_scan, &nr_scanned);
 		if (lret >= 0)
 			freed += lret;
@@ -242,7 +260,7 @@ static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_con
 
 	shrink_flags.purge = false;
 
-	lret = xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
+	lret = xe_shrinker_walk(shrinker, &ctx, shrink_flags,
 				nr_to_scan, &nr_scanned);
 	if (lret >= 0)
 		freed += lret;
-- 
2.43.0

