Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2941DCC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 13:36:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D359510E10E;
	Fri, 16 Oct 2026 13:36:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE36E10E10E
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 13:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792157763; x=1823693763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NpvzJyByenz5SYAGrHhTRbUpjLyZXjUgx7ZvHlkLULk=;
 b=FrbNNddODmcPixR6um0Kq54urm2oWInqsGbB/nyXiNsEgpnVXH42TJ3r
 sLCaSq2yPNTznJCzYff9ds/3ey0qE7SlbeZb93L99KZ0CFLHuTYZbL3CS
 sueSanwulN1nJLuy5d/6p5CZV8jH/RjiteZLYUaY+Gxj9mkc7wXbX1T8c
 oOc3KPR9Bnm77Ebnctbz7UJS3sNnIadnA7hcnRjimT1gKM2E4vN1YrfWm
 iy+xSfXvvZsPoz/GSjNYRU4AC0G/CtqdM0yzKD/B6rLLWB3IBTefv/e3D
 oCoGRGKSq4kZiiTYHpE6E5XkdD2A/Nn+sIOv4NKVMucWKwqVBWVMRvTzq w==;
X-CSE-ConnectionGUID: NINAdEcpT6iOr+f/68d/iA==
X-CSE-MsgGUID: JSzdbzSzT5SxEkIaU83T/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="831456"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="831456"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 06:36:02 -0700
X-CSE-ConnectionGUID: v7oGE3pMQWe6EgZhQ2Uplw==
X-CSE-MsgGUID: gukJZfqiT6KJ2uVImGKcVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2273487"
Received: from abityuts-desk1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 06:36:00 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v4 3/4] drm/xe: Split the bo shrinker into purgeable and
 non-purgeable shrinkers
Date: Fri, 16 Oct 2026 15:35:22 +0200
Message-ID: <20261016133523.3622-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016133523.3622-1-thomas.hellstrom@linux.intel.com>
References: <20261016133523.3622-1-thomas.hellstrom@linux.intel.com>
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

Purgeable objects are reclaimed by simply discarding their pages, with
no writeback required. They are therefore much cheaper to shrink than
regular shrinkable (non-purgeable) objects, whose reclaim may need to
wait for the GPU or write dirty compressed contents back to a backup
store, and whose contents need to be read back on next use.

Split the single xe_shrinker into two independent struct shrinker
instances registered against the shrinker core, sharing the same
underlying accounting (shrinkable_pages, purgeable_pages,
populated_tts) and locking:

 - A purgeable shrinker, whose count_objects() reports only
   purgeable_pages, and whose scan_objects() only purges objects.

 - A non-purgeable (shrinkable) shrinker, whose count_objects()
   reports the shrinkable page count (capped by backup availability)
   and whose scan_objects() shrinks non-purgeable objects, and also
   purges any purgeable objects it encounters, waking the device via
   runtime PM as needed.

Express the cost difference to the shrinker core through the seeks
value: the purgeable shrinker keeps DEFAULT_SEEKS, while the
non-purgeable shrinker uses a higher value,
XE_SHRINKER_NON_PURGEABLE_SEEKS (8). The core scales each shrinker's
scan target inversely with seeks, so purgeable objects receive
proportionally more reclaim pressure than non-purgeable ones, without
one shrinker's behaviour depending on the other's state.

The standalone purge walk relies on the LRU walk skipping
non-purgeable objects, for which xe_bo_shrink() returns -EBUSY,
rather than aborting.

v3:
- Patch introduced. (Matt Brost)

v4:
- The purge walk aborting at the first non-purgeable object is now
  fixed by a separate, preceding patch. (Sashiko)

Assisted-by: LLM
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_shrinker.c | 109 +++++++++++++++++++------------
 1 file changed, 68 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index 378022c37a57..8e3fe675e0f3 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -14,6 +14,15 @@
 #include "xe_pm.h"
 #include "xe_shrinker.h"
 
+/*
+ * Reclaiming non-purgeable objects requires GPU idling and writeback to a
+ * backup store, and restoring them requires reading the contents back.
+ * Tell the shrinker core they're costlier to recreate than purgeable
+ * objects, which use DEFAULT_SEEKS, so that purgeable objects are
+ * preferentially reclaimed.
+ */
+#define XE_SHRINKER_NON_PURGEABLE_SEEKS 8
+
 /**
  * struct xe_shrinker - per-device shrinker
  * @xe: Back pointer to the device.
@@ -21,7 +30,8 @@
  * @shrinkable_pages: Number of pages that are currently shrinkable.
  * @purgeable_pages: Number of pages that are currently purgeable.
  * @populated_tts: Number of populated ttm_tts currently shrinkable or purgeable.
- * @shrink: Pointer to the mm shrinker.
+ * @shrink: Pointer to the mm shrinker handling non-purgeable (shrinkable) objects.
+ * @purge_shrink: Pointer to the mm shrinker handling purgeable objects.
  * @pm_worker: Worker to wake up the device if required.
  */
 struct xe_shrinker {
@@ -31,6 +41,7 @@ struct xe_shrinker {
 	long purgeable_pages;
 	long populated_tts;
 	struct shrinker *shrink;
+	struct shrinker *purge_shrink;
 	struct work_struct pm_worker;
 };
 
@@ -179,6 +190,19 @@ static int xe_shrinker_walk(struct xe_shrinker *shrinker,
 	return ret;
 }
 
+static unsigned long
+xe_shrinker_count_purgeable(struct shrinker *shrink, struct shrink_control *sc)
+{
+	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
+	unsigned long num_pages;
+
+	read_lock(&shrinker->lock);
+	num_pages = shrinker->purgeable_pages;
+	read_unlock(&shrinker->lock);
+
+	return num_pages ? num_pages : SHRINK_EMPTY;
+}
+
 static unsigned long
 xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
 {
@@ -194,7 +218,6 @@ xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
 	else
 		num_pages = 0;
 
-	num_pages += shrinker->purgeable_pages;
 	read_unlock(&shrinker->lock);
 
 	return num_pages ? num_pages : SHRINK_EMPTY;
@@ -207,8 +230,7 @@ xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
  * If bo shrinking needs an rpm reference and we don't have it (yet),
  * that bo will be skipped anyway.
  */
-static bool xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker, bool force,
-				       unsigned long nr_to_scan, bool can_backup)
+static bool xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker)
 {
 	struct xe_device *xe = shrinker->xe;
 
@@ -216,63 +238,52 @@ static bool xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker, bool force,
 	    !ttm_backup_bytes_avail())
 		return false;
 
-	if (!force) {
-		read_lock(&shrinker->lock);
-		force = (nr_to_scan > shrinker->purgeable_pages && can_backup);
-		read_unlock(&shrinker->lock);
-		if (!force)
-			return false;
-	}
-
 	return __xe_shrinker_runtime_pm_get(shrinker);
 }
 
-static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
+static unsigned long xe_shrinker_scan_purgeable(struct shrinker *shrink,
+						struct shrink_control *sc)
 {
 	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
 	struct ttm_operation_ctx ctx = {
 		.interruptible = false,
 		.no_wait_gpu = ttm_bo_shrink_avoid_wait(),
 	};
-	unsigned long nr_to_scan, nr_scanned = 0, freed = 0;
+	unsigned long nr_to_scan = sc->nr_to_scan, nr_scanned = 0, freed = 0;
 	struct xe_bo_shrink_flags shrink_flags = {
 		.purge = true,
-		/* Don't request writeback without __GFP_IO. */
-		.writeback = !ctx.no_wait_gpu && (sc->gfp_mask & __GFP_IO),
 	};
-	bool runtime_pm;
-	bool purgeable;
-	bool can_backup = !!(sc->gfp_mask & __GFP_FS);
-
-	nr_to_scan = sc->nr_to_scan;
-
-	read_lock(&shrinker->lock);
-	purgeable = !!shrinker->purgeable_pages;
-	read_unlock(&shrinker->lock);
 
-	/* Might need runtime PM. Try to wake early if it looks like it. */
-	runtime_pm = xe_shrinker_runtime_pm_get(shrinker, false, nr_to_scan, can_backup);
-
-	if (purgeable && nr_scanned < nr_to_scan)
-		xe_shrinker_walk(shrinker, &ctx, shrink_flags,
-				 nr_to_scan, &nr_scanned, &freed);
+	xe_shrinker_walk(shrinker, &ctx, shrink_flags, nr_to_scan, &nr_scanned, &freed);
 
 	sc->nr_scanned = nr_scanned;
-	if (nr_scanned >= nr_to_scan || !can_backup)
-		goto out;
 
-	/* If we didn't wake before, try to do it now if needed. */
-	if (!runtime_pm)
-		runtime_pm = xe_shrinker_runtime_pm_get(shrinker, true, 0, can_backup);
+	return nr_scanned ? freed : SHRINK_STOP;
+}
 
-	shrink_flags.purge = false;
+static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
+{
+	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
+	struct ttm_operation_ctx ctx = {
+		.interruptible = false,
+		.no_wait_gpu = ttm_bo_shrink_avoid_wait(),
+	};
+	unsigned long nr_to_scan = sc->nr_to_scan, nr_scanned = 0, freed = 0;
+	struct xe_bo_shrink_flags shrink_flags = {
+		.purge = false,
+		/* Don't request writeback without __GFP_IO. */
+		.writeback = !ctx.no_wait_gpu && (sc->gfp_mask & __GFP_IO),
+	};
+	bool runtime_pm;
+
+	/* Might need runtime PM to access backed-up or CCS-compressed data. */
+	runtime_pm = xe_shrinker_runtime_pm_get(shrinker);
 
-	xe_shrinker_walk(shrinker, &ctx, shrink_flags,
-			 nr_to_scan, &nr_scanned, &freed);
+	xe_shrinker_walk(shrinker, &ctx, shrink_flags, nr_to_scan, &nr_scanned, &freed);
 
 	sc->nr_scanned = nr_scanned;
-out:
 	xe_shrinker_runtime_pm_put(shrinker, runtime_pm);
+
 	return nr_scanned ? freed : SHRINK_STOP;
 }
 
@@ -294,6 +305,7 @@ static void xe_shrinker_fini(struct drm_device *drm, void *arg)
 	xe_assert(shrinker->xe, !shrinker->purgeable_pages);
 	xe_assert(shrinker->xe, !shrinker->populated_tts);
 	shrinker_free(shrinker->shrink);
+	shrinker_free(shrinker->purge_shrink);
 	flush_work(&shrinker->pm_worker);
 	kfree(shrinker);
 }
@@ -311,8 +323,15 @@ int xe_shrinker_create(struct xe_device *xe)
 	if (!shrinker)
 		return -ENOMEM;
 
-	shrinker->shrink = shrinker_alloc(0, "drm-xe_gem:%s", xe->drm.unique);
+	shrinker->purge_shrink = shrinker_alloc(0, "drm-xe_gem-purgeable:%s", xe->drm.unique);
+	if (!shrinker->purge_shrink) {
+		kfree(shrinker);
+		return -ENOMEM;
+	}
+
+	shrinker->shrink = shrinker_alloc(0, "drm-xe_gem-shrinkable:%s", xe->drm.unique);
 	if (!shrinker->shrink) {
+		shrinker_free(shrinker->purge_shrink);
 		kfree(shrinker);
 		return -ENOMEM;
 	}
@@ -320,10 +339,18 @@ int xe_shrinker_create(struct xe_device *xe)
 	INIT_WORK(&shrinker->pm_worker, xe_shrinker_pm);
 	shrinker->xe = xe;
 	rwlock_init(&shrinker->lock);
+
+	shrinker->purge_shrink->count_objects = xe_shrinker_count_purgeable;
+	shrinker->purge_shrink->scan_objects = xe_shrinker_scan_purgeable;
+	shrinker->purge_shrink->private_data = shrinker;
+	shrinker_register(shrinker->purge_shrink);
+
 	shrinker->shrink->count_objects = xe_shrinker_count;
 	shrinker->shrink->scan_objects = xe_shrinker_scan;
 	shrinker->shrink->private_data = shrinker;
+	shrinker->shrink->seeks = XE_SHRINKER_NON_PURGEABLE_SEEKS;
 	shrinker_register(shrinker->shrink);
+
 	xe->mem.shrinker = shrinker;
 
 	return drmm_add_action_or_reset(&xe->drm, xe_shrinker_fini, shrinker);
-- 
2.56.0

