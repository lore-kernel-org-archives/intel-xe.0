Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891FBC77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 15:23:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F3510E442;
	Wed, 17 May 2023 15:23:48 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF02210E442
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 15:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684337025; x=1715873025;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ptfXmbXArsfCcnj1bt1RHBZ7kAA6Y3eMhFAcajGyNcA=;
 b=H3k4VYOmicm682n1sfujUZT0enPeejgjGNyIcyW+xMSSC8XjMJQ6ccKL
 a7uxQLddYzq1F2/SSEQmFwAvY3/eOoGCYthAphmulaOtKJp6yM4W0LFIH
 i0YldVgUJsUrfSbCOqUJbL68Ro4myp2OHvhPk80Z1GPV3MfNHVfA3/nDn
 4MPgkHrlS9xYz4lSXE74wvZVACaAtCgcem7+oGWarr8EdeJKDnNf7cU7v
 yZkP1KW2cS/ETD/cb+cMsi5QEznWlnmiuN4l26vpuR/oGBDp+hJ1G12FU
 O+7XrTI7+fjbHe2eGWAYRXL+ZloMjHbO5/uDPcnhPRH5w2T76FYqJnH5Y A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="438132158"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="438132158"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 08:23:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="846129314"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="846129314"
Received: from fskirtun-mobl-g8.ger.corp.intel.com (HELO
 mwauld-desk1.intel.com) ([10.252.15.194])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 08:23:44 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 17 May 2023 16:22:43 +0100
Message-Id: <20230517152244.348171-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230517152244.348171-1-matthew.auld@intel.com>
References: <20230517152244.348171-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 6/7] drm/xe: fix xe_device_mem_access_get()
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

Attempt to fix this by always grabbing the runtime ref when our
internal ref transitions from 0 -> 1, and then wrap the whole thing with
a lock to ensure callers are serialized.

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
 - Add smb_mb() around accessing the pm_callback_task for extra safety
   (Thomas Hellström)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/258
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 52 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_device.h       | 17 +------
 drivers/gpu/drm/xe/xe_device_types.h | 11 ++++-
 drivers/gpu/drm/xe/xe_pm.c           | 66 +++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_pm.h           |  3 +-
 5 files changed, 104 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d0297ee432b2..55f974b1ee78 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -403,24 +403,62 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
 		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
 }
 
+void xe_device_assert_mem_access(struct xe_device *xe)
+{
+	if (xe_pm_read_callback_task(xe) == current)
+		return;
+
+	XE_WARN_ON(!xe->mem_access.ref);
+}
+
+bool xe_device_mem_access_ongoing(struct xe_device *xe)
+{
+	bool ret;
+
+	if (xe_pm_read_callback_task(xe) == current)
+		return true;
+
+	mutex_lock(&xe->mem_access.lock);
+	ret = xe->mem_access.ref;
+	mutex_unlock(&xe->mem_access.lock);
+
+	return ret;
+}
+
 void xe_device_mem_access_get(struct xe_device *xe)
 {
-	bool resumed = xe_pm_runtime_resume_if_suspended(xe);
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
 
+	/*
+	 * It's possible to get rid of the mem_access.lock here, however lockdep
+	 * has an easier time digesting the mem_access.lock -> runtime_pm chain
+	 * (and any locks the caller is holding), on all transitions, and not
+	 * for example just on the 0 -> 1.
+	 */
 	mutex_lock(&xe->mem_access.lock);
-	if (xe->mem_access.ref++ == 0)
-		xe->mem_access.hold_rpm = xe_pm_runtime_get_if_active(xe);
+	if (xe->mem_access.ref == 0)
+		xe->mem_access.hold_rpm = xe_pm_runtime_resume_and_get(xe);
+	xe->mem_access.ref++;
 	mutex_unlock(&xe->mem_access.lock);
 
-	/* The usage counter increased if device was immediately resumed */
-	if (resumed)
-		xe_pm_runtime_put(xe);
-
 	XE_WARN_ON(xe->mem_access.ref == S32_MAX);
 }
 
 void xe_device_mem_access_put(struct xe_device *xe)
 {
+	if (xe_pm_read_callback_task(xe) == current)
+		return;
+
 	mutex_lock(&xe->mem_access.lock);
 	if (--xe->mem_access.ref == 0 && xe->mem_access.hold_rpm)
 		xe_pm_runtime_put(xe);
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 9ab7e6134f89..64576ed9323e 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -90,21 +90,8 @@ static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
 void xe_device_mem_access_get(struct xe_device *xe);
 void xe_device_mem_access_put(struct xe_device *xe);
 
-static inline void xe_device_assert_mem_access(struct xe_device *xe)
-{
-	XE_WARN_ON(!xe->mem_access.ref);
-}
-
-static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
-{
-	bool ret;
-
-	mutex_lock(&xe->mem_access.lock);
-	ret = xe->mem_access.ref;
-	mutex_unlock(&xe->mem_access.lock);
-
-	return ret;
-}
+void xe_device_assert_mem_access(struct xe_device *xe);
+bool xe_device_mem_access_ongoing(struct xe_device *xe);
 
 static inline bool xe_device_in_fault_mode(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0b6860156574..b0c69fcb4065 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -256,7 +256,10 @@ struct xe_device {
 	 * triggering additional actions when they occur.
 	 */
 	struct {
-		/** @lock: protect the ref count */
+		/**
+		 * @lock: Serialize xe_device_mem_access users,
+		 * and protect the below internal state, like @ref.
+		 */
 		struct mutex lock;
 		/** @ref: ref count of memory accesses */
 		s32 ref;
@@ -264,6 +267,12 @@ struct xe_device {
 		bool hold_rpm;
 	} mem_access;
 
+	/**
+	 * @pm_callback_task: Track the active task that is running in either
+	 * the runtime_suspend or runtime_resume callbacks.
+	 */
+	struct task_struct *pm_callback_task;
+
 	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
 	bool d3cold_allowed;
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index b7b57f10ba25..29c8861e58a5 100644
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
@@ -210,14 +239,9 @@ int xe_pm_runtime_put(struct xe_device *xe)
 	return pm_runtime_put_autosuspend(xe->drm.dev);
 }
 
-/* Return true if resume operation happened and usage count was increased */
-bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe)
+bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
 {
-	/* In case we are suspended we need to immediately wake up */
-	if (pm_runtime_suspended(xe->drm.dev))
-		return !pm_runtime_resume_and_get(xe->drm.dev);
-
-	return false;
+	return !pm_runtime_resume_and_get(xe->drm.dev);
 }
 
 int xe_pm_runtime_get_if_active(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 6a885585f653..e92c508d44b9 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -19,7 +19,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe);
 int xe_pm_runtime_resume(struct xe_device *xe);
 int xe_pm_runtime_get(struct xe_device *xe);
 int xe_pm_runtime_put(struct xe_device *xe);
-bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
+bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
+struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
 
 #endif
-- 
2.40.1

