Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA9CC79FB6
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB8E10F22A;
	Wed,  9 Sep 2026 16:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L68ZDtbQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D79110F22A
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 16:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788970885; x=1820506885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DDpNK4hwUnitBCXGvQvPejZycqFEAtGmb3O3Fiunokg=;
 b=L68ZDtbQxfSaq0Kd3Hbpi87e9Sjo+2MDNK3bOaRUlVgTvT+JaSx2Dc9w
 dj4wtq7j6BF+ftSHjYNPeP8EAXNlufmoVGo7+iWtS9Pfp8D++Yctca61c
 4pPVKRx4k52sNv0zZXpAz2Vv7whED1UTpzkPsLjcx58flCG3R144Od3Gh
 HidrKSD63GdnfO9Q8lcrecYKPVKkoKplKGoXRCPuiK2GOYpqa4iy8Yquv
 4qQennN4g60ynbpvouoRQNXkaCUvbs7uAFWj9heKhMBRfG+sajYr770tg
 +pl1Gre6tX34unOzC6f994o3YbTAHgEVfjryecEmCl0HJHBjyJu5B1AoO A==;
X-CSE-ConnectionGUID: 2QYIt9iAT/yNS0eFutBC7w==
X-CSE-MsgGUID: W8osWlvnQdy5sPSOgEjHEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100000068"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="100000068"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:21:25 -0700
X-CSE-ConnectionGUID: 2hiD/kdNRS6YCgEeN+h2hw==
X-CSE-MsgGUID: ml20EQwCQSuk34OOzAt02w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="268782958"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by fmviesa008.fm.intel.com with ESMTP; 09 Sep 2026 09:21:24 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v7 1/2] drm/xe/shrinker: Return the freed page count through a
 parameter
Date: Wed,  9 Sep 2026 16:21:01 +0000
Message-Id: <20260909162102.1097006-2-shuicheng.lin@intel.com>
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

__xe_shrinker_walk() and xe_shrinker_walk() return either the number of
pages freed or a negative error, so the two cannot be reported at once.
On error the pages already freed are dropped, and since xe_shrinker_scan()
only accumulates non-negative returns while *scanned is updated by
pointer, the shrinker tells mm that it scanned without freeing.

Accumulate the count into a caller-provided counter and return only the
status, so an error no longer discards what the walk had freed.

Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
Assisted-by: Claude:claude-opus-5
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_shrinker.c | 62 ++++++++++++++------------------
 1 file changed, 26 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index 83374cd57660..89445cd20238 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -54,13 +54,14 @@ xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long shrinkable, long purgea
 	write_unlock(&shrinker->lock);
 }
 
-static s64 __xe_shrinker_walk(struct xe_device *xe,
+static int __xe_shrinker_walk(struct xe_device *xe,
 			      struct ttm_operation_ctx *ctx,
 			      const struct xe_bo_shrink_flags flags,
-			      unsigned long to_scan, unsigned long *scanned)
+			      unsigned long to_scan, unsigned long *scanned,
+			      unsigned long *freed)
 {
 	unsigned int mem_type;
-	s64 freed = 0, lret;
+	s64 lret;
 
 	for (mem_type = XE_PL_SYSTEM; mem_type <= XE_PL_TT; ++mem_type) {
 		struct ttm_resource_manager *man = ttm_manager_type(&xe->ttm, mem_type);
@@ -82,7 +83,7 @@ static s64 __xe_shrinker_walk(struct xe_device *xe,
 			if (lret < 0)
 				return lret;
 
-			freed += lret;
+			*freed += lret;
 			if (*scanned >= to_scan)
 				break;
 		}
@@ -90,7 +91,7 @@ static s64 __xe_shrinker_walk(struct xe_device *xe,
 		xe_assert(xe, !IS_ERR(ttm_bo));
 	}
 
-	return freed;
+	return 0;
 }
 
 /*
@@ -99,40 +100,35 @@ static s64 __xe_shrinker_walk(struct xe_device *xe,
  * add writeback. This avoids stalls and explicit writebacks with light or
  * moderate memory pressure.
  */
-static s64 xe_shrinker_walk(struct xe_device *xe,
+static int xe_shrinker_walk(struct xe_device *xe,
 			    struct ttm_operation_ctx *ctx,
 			    const struct xe_bo_shrink_flags flags,
-			    unsigned long to_scan, unsigned long *scanned)
+			    unsigned long to_scan, unsigned long *scanned,
+			    unsigned long *freed)
 {
 	bool no_wait_gpu = true;
 	struct xe_bo_shrink_flags save_flags = flags;
-	s64 lret, freed;
+	int ret;
 
 	swap(no_wait_gpu, ctx->no_wait_gpu);
 	save_flags.writeback = false;
-	lret = __xe_shrinker_walk(xe, ctx, save_flags, to_scan, scanned);
+	ret = __xe_shrinker_walk(xe, ctx, save_flags, to_scan, scanned, freed);
 	swap(no_wait_gpu, ctx->no_wait_gpu);
-	if (lret < 0 || *scanned >= to_scan)
-		return lret;
+	if (ret || *scanned >= to_scan)
+		return ret;
 
-	freed = lret;
 	if (!ctx->no_wait_gpu) {
-		lret = __xe_shrinker_walk(xe, ctx, save_flags, to_scan, scanned);
-		if (lret < 0)
-			return lret;
-		freed += lret;
-		if (*scanned >= to_scan)
-			return freed;
+		ret = __xe_shrinker_walk(xe, ctx, save_flags, to_scan, scanned,
+					 freed);
+		if (ret || *scanned >= to_scan)
+			return ret;
 	}
 
-	if (flags.writeback) {
-		lret = __xe_shrinker_walk(xe, ctx, flags, to_scan, scanned);
-		if (lret < 0)
-			return lret;
-		freed += lret;
-	}
+	if (flags.writeback)
+		ret = __xe_shrinker_walk(xe, ctx, flags, to_scan, scanned,
+					 freed);
 
-	return freed;
+	return ret;
 }
 
 static unsigned long
@@ -214,7 +210,6 @@ static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_con
 	bool runtime_pm;
 	bool purgeable;
 	bool can_backup = !!(sc->gfp_mask & __GFP_FS);
-	s64 lret;
 
 	nr_to_scan = sc->nr_to_scan;
 
@@ -225,12 +220,9 @@ static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_con
 	/* Might need runtime PM. Try to wake early if it looks like it. */
 	runtime_pm = xe_shrinker_runtime_pm_get(shrinker, false, nr_to_scan, can_backup);
 
-	if (purgeable && nr_scanned < nr_to_scan) {
-		lret = xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
-					nr_to_scan, &nr_scanned);
-		if (lret >= 0)
-			freed += lret;
-	}
+	if (purgeable && nr_scanned < nr_to_scan)
+		xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
+				 nr_to_scan, &nr_scanned, &freed);
 
 	sc->nr_scanned = nr_scanned;
 	if (nr_scanned >= nr_to_scan || !can_backup)
@@ -242,10 +234,8 @@ static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_con
 
 	shrink_flags.purge = false;
 
-	lret = xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
-				nr_to_scan, &nr_scanned);
-	if (lret >= 0)
-		freed += lret;
+	xe_shrinker_walk(shrinker->xe, &ctx, shrink_flags,
+			 nr_to_scan, &nr_scanned, &freed);
 
 	sc->nr_scanned = nr_scanned;
 out:
-- 
2.43.0

