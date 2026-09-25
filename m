Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D2EC9830D
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 11:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A1310E7CE;
	Fri, 25 Sep 2026 11:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QUOXYz+p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B8010E7CE
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 11:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790337337; x=1821873337;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UUSeNSuIYk/Cvcr0MRp7R20fPbuwWnMtvp5JZ0pD1b4=;
 b=QUOXYz+pxHzkaVhS6/y6ubB9Y9MpLMvcoI+eMxGvaLyLm7aoSrpqyrgb
 Xeoegmm1l+aJx1jFAqhN8sbzSrSemPwzXi9+CfGJuhKpiGKeWSMN7ZNf6
 2ipwKR+O6lH52iDulkJQLrksbbpD8kPxEaQSHUWIRhcaHQc95IcKTL3cO
 0IJ62vksZnzYK68h7jS8y9YnAowPS46CekS5Bl8xuP0iMTq8QbG4DYya/
 1JQF5vTcqm4NEhIig+gtF29sKzly0vUK3sg9zsXNPzk7DnRGht0EjxBuJ
 uhoMjnlnGsGxMn0uL+sWsmByRrsrJxpj9xHFwIowsi7U4TydiH000q3Rz w==;
X-CSE-ConnectionGUID: 4eTSv9SSRka9PKe9FwT7Ng==
X-CSE-MsgGUID: 7zx+SuINR7e9EfnxfUEKlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="94939356"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="94939356"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 04:55:37 -0700
X-CSE-ConnectionGUID: 1fcpjZ/MRg2Zz1m+V10C5Q==
X-CSE-MsgGUID: 1itZeUysT2i9puzEQVJBGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="278089206"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.107])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 04:55:35 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/2] drm/xe/shrinker: use async RPM get
Date: Fri, 25 Sep 2026 12:55:22 +0100
Message-ID: <20260925115521.1018940-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
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

Use pm_runtime_get() with RPM_ASYNC to queue a resume request. This
eliminates the custom worker, letting the runtime PM core do this for
us. This also allows holding an RPM ref for the queued request, which
will be useful later. Note that the put() does NOT cancel the request,
the queued resume request still takes priority.

Shouldn't be any functional change.

Assisted-by: LLM
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c       | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_pm.h       |  1 +
 drivers/gpu/drm/xe/xe_shrinker.c | 19 +++----------------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index daa7ba2df317..223821dfdc02 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -824,6 +824,18 @@ void xe_pm_runtime_get(struct xe_device *xe)
 	pm_runtime_resume(xe->drm.dev);
 }
 
+/**
+ * xe_pm_runtime_get_async - Get a runtime_pm reference and queue up a resume
+ * @xe: xe device instance
+ *
+ * Grabs a runtime PM reference and requests an asynchronous resume without
+ * blocking. Safe to call from contexts such as reclaim.
+ */
+void xe_pm_runtime_get_async(struct xe_device *xe)
+{
+	pm_runtime_get(xe->drm.dev);
+}
+
 /**
  * xe_pm_runtime_put - Put the runtime_pm reference back and mark as idle
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 16d4e6c629f1..1aca527580fc 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -24,6 +24,7 @@ bool xe_pm_runtime_suspended(struct xe_device *xe);
 int xe_pm_runtime_suspend(struct xe_device *xe);
 int xe_pm_runtime_resume(struct xe_device *xe);
 void xe_pm_runtime_get(struct xe_device *xe);
+void xe_pm_runtime_get_async(struct xe_device *xe);
 int xe_pm_runtime_get_ioctl(struct xe_device *xe);
 void xe_pm_runtime_put(struct xe_device *xe);
 bool xe_pm_runtime_get_if_active(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_shrinker.c b/drivers/gpu/drm/xe/xe_shrinker.c
index deb4378c1ec1..518f77acf1dd 100644
--- a/drivers/gpu/drm/xe/xe_shrinker.c
+++ b/drivers/gpu/drm/xe/xe_shrinker.c
@@ -21,7 +21,6 @@
  * @shrinkable_pages: Number of pages that are currently shrinkable.
  * @purgeable_pages: Number of pages that are currently purgeable.
  * @shrink: Pointer to the mm shrinker.
- * @pm_worker: Worker to wake up the device if required.
  */
 struct xe_shrinker {
 	struct xe_device *xe;
@@ -29,7 +28,6 @@ struct xe_shrinker {
 	long shrinkable_pages;
 	long purgeable_pages;
 	struct shrinker *shrink;
-	struct work_struct pm_worker;
 };
 
 static struct xe_shrinker *to_xe_shrinker(struct shrinker *shrink)
@@ -66,7 +64,8 @@ static bool __xe_shrinker_runtime_pm_get(struct xe_shrinker *shrinker)
 		return true;
 	}
 
-	queue_work(xe->unordered_wq, &shrinker->pm_worker);
+	xe_pm_runtime_get_async(xe);
+	xe_pm_runtime_put(xe);
 
 	return false;
 }
@@ -193,7 +192,7 @@ xe_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
 
 /*
  * Check if we need runtime pm, and if so try to grab a reference if
- * already active. If grabbing a reference fails, queue a worker that
+ * already active. If sync RPM get fails, queue an async RPM get that
  * does it for us outside of reclaim, but don't wait for it to complete.
  * If bo shrinking needs an rpm reference and we don't have it (yet),
  * that bo will be skipped anyway.
@@ -267,16 +266,6 @@ static unsigned long xe_shrinker_scan(struct shrinker *shrink, struct shrink_con
 	return nr_scanned ? freed : SHRINK_STOP;
 }
 
-/* Wake up the device for shrinking. */
-static void xe_shrinker_pm(struct work_struct *work)
-{
-	struct xe_shrinker *shrinker =
-		container_of(work, typeof(*shrinker), pm_worker);
-
-	xe_pm_runtime_get(shrinker->xe);
-	xe_pm_runtime_put(shrinker->xe);
-}
-
 static void xe_shrinker_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_shrinker *shrinker = arg;
@@ -284,7 +273,6 @@ static void xe_shrinker_fini(struct drm_device *drm, void *arg)
 	xe_assert(shrinker->xe, !shrinker->shrinkable_pages);
 	xe_assert(shrinker->xe, !shrinker->purgeable_pages);
 	shrinker_free(shrinker->shrink);
-	flush_work(&shrinker->pm_worker);
 	kfree(shrinker);
 }
 
@@ -307,7 +295,6 @@ int xe_shrinker_create(struct xe_device *xe)
 		return -ENOMEM;
 	}
 
-	INIT_WORK(&shrinker->pm_worker, xe_shrinker_pm);
 	shrinker->xe = xe;
 	rwlock_init(&shrinker->lock);
 	shrinker->shrink->count_objects = xe_shrinker_count;
-- 
2.55.0

