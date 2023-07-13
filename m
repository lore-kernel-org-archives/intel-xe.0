Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD47EB64DD
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 13:23:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A648310E6DE;
	Thu, 13 Jul 2023 13:23:20 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E94810E6DA
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 13:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689254595; x=1720790595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DsEvUmE/D0GsRexctBnwj/OeDCFveJgQtOl1UlQ8hhE=;
 b=dAqVSvxJe5HF7JUs503Je34DGOGhA81NGaErHcmor+vYP2VwkkE58od/
 NZU9AfyJXkVf+ObzWQxJkJdht8aNGelklbCTwvjLdvIi1YJizD35pSydl
 YPkhK5KnAIGiubVdCQ9bwbBp1jGIzF+svEDsFJkEpE399F0uCMQ5cQlTE
 RAJkwpBYp3e9Z4mQj6T3ljmD1rg8xoKF4DbKT2RQpOGd8bI2KtdYLyuom
 ItWg4isNQIDUiZexQonpLK1t8GWlWRsViy1KPDiYC4byXXjZCUoBEEdDo
 XmRGqtT2Xcys1WXWvw/Yt9dkusCkVSqsGHWbp4JpGOQo7I00MugFyv5yk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="345497896"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="345497896"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 06:23:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="787455295"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="787455295"
Received: from rossdevx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.133])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 06:23:10 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jul 2023 14:22:46 +0100
Message-ID: <20230713132244.459605-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713132244.459605-12-matthew.auld@intel.com>
References: <20230713132244.459605-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v13 01/10] drm/xe: fix xe_device_mem_access_get()
 races
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

It looks like there is at least one race here, given that the
pm_runtime_suspended() check looks to return false if we are in the
process of suspending the device (RPM_SUSPENDING vs RPM_SUSPENDED).  We
later also do xe_pm_runtime_get_if_active(), but since the device is
suspending or has now suspended, this doesn't do anything either.
Following from this we can potentially return from
xe_device_mem_access_get() with the device suspended or about to be,
leading to broken behaviour.

Attempt to fix this by always grabbing the runtime ref when our internal
ref transitions from 0 -> 1. The hard part is then dealing with the
runtime_pm callbacks also calling xe_device_mem_access_get() and
deadlocking, which the pm_runtime_suspended() check prevented.

v2:
 - ct->lock looks to be primed with fs_reclaim, so holding that and then
   allocating memory will cause lockdep to complain. Now that we
   unconditionally grab the mem_access.lock around mem_access_{get,put}, we
   need to change the ordering wrt to grabbing the ct->lock, since some of
   the runtime_pm routines can allocate memory (or at least that's what
   lockdep seems to suggest). Hopefully not a big deal.  It might be that
   there were already issues with this, just that the atomics where
   "hiding" the potential issues.
v3:
 - Use Thomas Hellström' idea with tracking the active task that is
   executing in the resume or suspend callback, in order to avoid
   recursive resume/suspend calls deadlocking on itself.
 - Split the ct->lock change.
v4:
 - Add smb_mb() around accessing the pm_callback_task for extra safety.
   (Thomas Hellström)
v5:
 - Clarify the kernel-doc for the mem_access.lock, given that it is quite
   strange in what it protects (data vs code). The real motivation is to
   aid lockdep. (Rodrigo Vivi)
v6:
 - Split out the lock change. We still want this as a lockdep aid but
   only for the xe_device_mem_access_get() path. Sticking a lock on the
   put() looks be a no-go, also the runtime_put() there is always async.
 - Now that the lock is gone move to atomics and rely on the pm code
   serialising multiple callers on the 0 -> 1 transition.
 - g2h_worker_func() looks to be the next issue, given that
   suspend-resume callbacks are using CT, so try to handle that.
v7:
 - Add xe_device_mem_access_get_if_ongoing(), and use it in
   g2h_worker_func().
v8 (Anshuman):
 - Just always grab the rpm, instead of just on the 0 -> 1 transition,
   which is a lot clearer and simplifies the code quite a bit.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/258
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 61 +++++++++++++++++++------
 drivers/gpu/drm/xe/xe_device.h       | 11 +----
 drivers/gpu/drm/xe/xe_device_types.h |  8 +++-
 drivers/gpu/drm/xe/xe_guc_ct.c       | 34 +++++++++++++-
 drivers/gpu/drm/xe/xe_pm.c           | 68 ++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_pm.h           |  2 +-
 6 files changed, 131 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 42fedb267454..70f89869b8a6 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -412,33 +412,66 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
 		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
 }
 
+bool xe_device_mem_access_ongoing(struct xe_device *xe)
+{
+	if (xe_pm_read_callback_task(xe) != NULL)
+		return true;
+
+	return atomic_read(&xe->mem_access.ref);
+}
+
+void xe_device_assert_mem_access(struct xe_device *xe)
+{
+	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
+}
+
 bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
 {
-	return atomic_inc_not_zero(&xe->mem_access.ref);
+	bool active;
+
+	if (xe_pm_read_callback_task(xe) == current)
+		return true;
+
+	active = xe_pm_runtime_get_if_active(xe);
+	if (active) {
+		int ref = atomic_inc_return(&xe->mem_access.ref);
+
+		XE_WARN_ON(ref == S32_MAX);
+	}
+
+	return active;
 }
 
 void xe_device_mem_access_get(struct xe_device *xe)
 {
-	bool resumed = xe_pm_runtime_resume_if_suspended(xe);
-	int ref = atomic_inc_return(&xe->mem_access.ref);
+	int ref;
 
-	if (ref == 1)
-		xe->mem_access.hold_rpm = xe_pm_runtime_get_if_active(xe);
+	/*
+	 * This looks racy, but should be fine since the pm_callback_task only
+	 * transitions from NULL -> current (and back to NULL again), during the
+	 * runtime_resume() or runtime_suspend() callbacks, for which there can
+	 * only be a single one running for our device. We only need to prevent
+	 * recursively calling the runtime_get or runtime_put from those
+	 * callbacks, as well as preventing triggering any access_ongoing
+	 * asserts.
+	 */
+	if (xe_pm_read_callback_task(xe) == current)
+		return;
 
-	/* The usage counter increased if device was immediately resumed */
-	if (resumed)
-		xe_pm_runtime_put(xe);
-
-	XE_WARN_ON(ref == S32_MAX);
+	xe_pm_runtime_get(xe);
+	ref = atomic_inc_return(&xe->mem_access.ref);
+	XE_WARN_ON(atomic_read(&xe->mem_access.ref) == S32_MAX);
 }
 
 void xe_device_mem_access_put(struct xe_device *xe)
 {
-	bool hold = xe->mem_access.hold_rpm;
-	int ref = atomic_dec_return(&xe->mem_access.ref);
+	int ref;
 
-	if (!ref && hold)
-		xe_pm_runtime_put(xe);
+	if (xe_pm_read_callback_task(xe) == current)
+		return;
+
+	ref = atomic_dec_return(&xe->mem_access.ref);
+	xe_pm_runtime_put(xe);
 
 	XE_WARN_ON(ref < 0);
 }
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 8e01bbadb149..0ce0351d7d23 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -141,15 +141,8 @@ void xe_device_mem_access_get(struct xe_device *xe);
 bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe);
 void xe_device_mem_access_put(struct xe_device *xe);
 
-static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
-{
-	return atomic_read(&xe->mem_access.ref);
-}
-
-static inline void xe_device_assert_mem_access(struct xe_device *xe)
-{
-	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
-}
+void xe_device_assert_mem_access(struct xe_device *xe);
+bool xe_device_mem_access_ongoing(struct xe_device *xe);
 
 static inline bool xe_device_in_fault_mode(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 26a8de77138a..dcba8bb8f989 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -343,10 +343,14 @@ struct xe_device {
 	struct {
 		/** @ref: ref count of memory accesses */
 		atomic_t ref;
-		/** @hold_rpm: need to put rpm ref back at the end */
-		bool hold_rpm;
 	} mem_access;
 
+	/**
+	 * @pm_callback_task: Track the active task that is running in either
+	 * the runtime_suspend or runtime_resume callbacks.
+	 */
+	struct task_struct *pm_callback_task;
+
 	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
 	bool d3cold_allowed;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 9fb5fd4391d2..e7f7f9b1ce1c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -19,6 +19,7 @@
 #include "xe_guc.h"
 #include "xe_guc_submit.h"
 #include "xe_map.h"
+#include "xe_pm.h"
 #include "xe_trace.h"
 
 /* Used when a CT send wants to block and / or receive data */
@@ -1091,9 +1092,36 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
 static void g2h_worker_func(struct work_struct *w)
 {
 	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, g2h_worker);
+	bool ongoing;
 	int ret;
 
-	xe_device_mem_access_get(ct_to_xe(ct));
+	/*
+	 * Normal users must always hold mem_access.ref around CT calls. However
+	 * during the runtime pm callbacks we rely on CT to talk to the GuC, but
+	 * at this stage we can't rely on mem_access.ref and even the
+	 * callback_task will be different than current.  For such cases we just
+	 * need to ensure we always process the responses from any blocking
+	 * ct_send requests or where we otherwise expect some response when
+	 * initiated from those callbacks (which will need to wait for the below
+	 * dequeue_one_g2h()).  The dequeue_one_g2h() will gracefully fail if
+	 * the device has suspended to the point that the CT communication has
+	 * been disabled.
+	 *
+	 * If we are inside the runtime pm callback, we can be the only task
+	 * still issuing CT requests (since that requires having the
+	 * mem_access.ref).  It seems like it might in theory be possible to
+	 * receive unsolicited events from the GuC just as we are
+	 * suspending-resuming, but those will currently anyway be lost when
+	 * eventually exiting from suspend, hence no need to wake up the device
+	 * here. If we ever need something stronger than get_if_ongoing() then
+	 * we need to be careful with blocking the pm callbacks from getting CT
+	 * responses, if the worker here is blocked on those callbacks
+	 * completing, creating a deadlock.
+	 */
+	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
+	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
+		return;
+
 	do {
 		mutex_lock(&ct->lock);
 		ret = dequeue_one_g2h(ct);
@@ -1107,7 +1135,9 @@ static void g2h_worker_func(struct work_struct *w)
 			kick_reset(ct);
 		}
 	} while (ret == 1);
-	xe_device_mem_access_put(ct_to_xe(ct));
+
+	if (ongoing)
+		xe_device_mem_access_put(ct_to_xe(ct));
 }
 
 static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index c7901f379aee..fe99820db2df 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -137,43 +137,71 @@ void xe_pm_runtime_fini(struct xe_device *xe)
 	pm_runtime_forbid(dev);
 }
 
+static void xe_pm_write_callback_task(struct xe_device *xe,
+				      struct task_struct *task)
+{
+	WRITE_ONCE(xe->pm_callback_task, task);
+
+	/*
+	 * Just in case it's somehow possible for our writes to be reordered to
+	 * the extent that something else re-uses the task written in
+	 * pm_callback_task. For example after returning from the callback, but
+	 * before the reordered write that resets pm_callback_task back to NULL.
+	 */
+	smp_mb(); /* pairs with xe_pm_read_callback_task */
+}
+
+struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
+{
+	smp_mb(); /* pairs with xe_pm_write_callback_task */
+
+	return READ_ONCE(xe->pm_callback_task);
+}
+
 int xe_pm_runtime_suspend(struct xe_device *xe)
 {
 	struct xe_gt *gt;
 	u8 id;
-	int err;
+	int err = 0;
+
+	if (xe->d3cold_allowed && xe_device_mem_access_ongoing(xe))
+		return -EBUSY;
+
+	/* Disable access_ongoing asserts and prevent recursive pm calls */
+	xe_pm_write_callback_task(xe, current);
 
 	if (xe->d3cold_allowed) {
-		if (xe_device_mem_access_ongoing(xe))
-			return -EBUSY;
-
 		err = xe_bo_evict_all(xe);
 		if (err)
-			return err;
+			goto out;
 	}
 
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_suspend(gt);
 		if (err)
-			return err;
+			goto out;
 	}
 
 	xe_irq_suspend(xe);
-
-	return 0;
+out:
+	xe_pm_write_callback_task(xe, NULL);
+	return err;
 }
 
 int xe_pm_runtime_resume(struct xe_device *xe)
 {
 	struct xe_gt *gt;
 	u8 id;
-	int err;
+	int err = 0;
+
+	/* Disable access_ongoing asserts and prevent recursive pm calls */
+	xe_pm_write_callback_task(xe, current);
 
 	if (xe->d3cold_allowed) {
 		for_each_gt(gt, xe, id) {
 			err = xe_pcode_init(gt);
 			if (err)
-				return err;
+				goto out;
 		}
 
 		/*
@@ -182,7 +210,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		 */
 		err = xe_bo_restore_kernel(xe);
 		if (err)
-			return err;
+			goto out;
 	}
 
 	xe_irq_resume(xe);
@@ -193,10 +221,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	if (xe->d3cold_allowed) {
 		err = xe_bo_restore_user(xe);
 		if (err)
-			return err;
+			goto out;
 	}
-
-	return 0;
+out:
+	xe_pm_write_callback_task(xe, NULL);
+	return err;
 }
 
 int xe_pm_runtime_get(struct xe_device *xe)
@@ -210,19 +239,8 @@ int xe_pm_runtime_put(struct xe_device *xe)
 	return pm_runtime_put_autosuspend(xe->drm.dev);
 }
 
-/* Return true if resume operation happened and usage count was increased */
-bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe)
-{
-	/* In case we are suspended we need to immediately wake up */
-	if (pm_runtime_suspended(xe->drm.dev))
-		return !pm_runtime_resume_and_get(xe->drm.dev);
-
-	return false;
-}
-
 int xe_pm_runtime_get_if_active(struct xe_device *xe)
 {
-	WARN_ON(pm_runtime_suspended(xe->drm.dev));
 	return pm_runtime_get_if_active(xe->drm.dev, true);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 8418ee6faac5..da05556d9a6e 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -19,8 +19,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe);
 int xe_pm_runtime_resume(struct xe_device *xe);
 int xe_pm_runtime_get(struct xe_device *xe);
 int xe_pm_runtime_put(struct xe_device *xe);
-bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
+struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
 
 #endif
-- 
2.41.0

