Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3695CA5FFE
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 14:41:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EA910ED5E;
	Mon,  5 Oct 2026 14:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f7ZLg/PC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACBD710ED5E
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 14:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791211270; x=1822747270;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JolZZeO5LYuniAwUqTO4Rk/hgnGAt6g6Z4/Z4jj9Fgc=;
 b=f7ZLg/PC+dG0h7UKtwKpu/ioTO9BtElFxsWawd0H/dlFwtVdt+1Tya/s
 4G4bp/9xpSiwUcC7eqCy2XQ4eZ9u8MxPsDidDWNtS6GGyiLZ0s9S48yFc
 msoBfQebzL29nPerROfmzg5sY6t2ly/GBeE8cDIge8Fp34F5q/b8y3BP/
 mkN96gv7tBNZ4ghT2jfJZ6S0K6eXND116mkcw1gVfndmOhUsReEfp8LF+
 3J/NiILOtF+7yf166nCoGfiEI6cPUYC7DuOt4Mwi29gaxZccmedGjYBQ3
 EYziqce9ke30xTc0Qi9QTBFyXgA/xbz50tmXD3U682Tm1Z8tqkUC4t3x+ A==;
X-CSE-ConnectionGUID: ETkc6OAzQMGJkAmqPJMX8A==
X-CSE-MsgGUID: Tao2jX9dS6KASzArmimx+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="90918297"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="90918297"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 07:41:10 -0700
X-CSE-ConnectionGUID: 3O9Mw5KBRueKKrWnjj068g==
X-CSE-MsgGUID: sN7AyS3BTsy3GR2jSis2+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="276961746"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 07:41:09 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/3] drm/xe/shrinker: use async RPM get
Date: Mon,  5 Oct 2026 15:41:02 +0100
Message-ID: <20261005144059.1569162-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005144059.1569162-5-matthew.auld@intel.com>
References: <20261005144059.1569162-5-matthew.auld@intel.com>
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

v2 (Sashiko):
  - Add a trace so the put() trace always matches up with something.

Assisted-by: LLM
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c       | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_pm.h       |  1 +
 drivers/gpu/drm/xe/xe_shrinker.c | 19 +++----------------
 drivers/gpu/drm/xe/xe_trace.h    |  5 +++++
 4 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 385b5984935d..9c4eabdef80f 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -824,6 +824,19 @@ void xe_pm_runtime_get(struct xe_device *xe)
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
+	trace_xe_pm_runtime_get_async(xe, __builtin_return_address(0));
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
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index d4e9d91f6f7f..bd1133aedfb7 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -457,6 +457,11 @@ DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_get_ioctl,
 	     TP_ARGS(xe, caller)
 );
 
+DEFINE_EVENT(xe_pm_runtime, xe_pm_runtime_get_async,
+	     TP_PROTO(struct xe_device *xe, void *caller),
+	     TP_ARGS(xe, caller)
+);
+
 TRACE_EVENT(xe_eu_stall_data_read,
 	    TP_PROTO(u8 slice, u8 subslice,
 		     u32 read_ptr, u32 write_ptr,
-- 
2.55.0

