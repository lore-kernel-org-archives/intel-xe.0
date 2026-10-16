Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54654CC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:19:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F10112623;
	Fri, 16 Oct 2026 07:19:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD0811260C
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792135139; x=1823671139;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=UOBiEk2qHSQz6sFbV/tQQc729tP8DABMJK8VZSwcvjE=;
 b=W/lo3UV5l8Zee1HNW8hSmpej8aboaGQMk6tUsZfyFbRWEr3yZVxv6QTn
 CQNodRKVtdAeXJXnGEOI4EkudL5Owbm9spN+RXhF+SBOnBMr82jiJC79G
 6k/1ff3h/olfUzWOs8U0P03gQiow2bQgTnLLefNekz/hdUYnA3oRl9e2N
 pk30JDYzaT4vo3J8K7xvBlRM3MAIJOkPya7saX8dFxbjJ5NvMGqBH1uYa
 S7sX6Ynhyxzvy8p0j7z3tHBorndf5bm9zrirH512/TxDWfMO6v9b0mMNg
 G+NTavOMZVgcK4dlYkmrUPUtJhtsimbj63rpO2ScriA1L8jigiLsit1o7 Q==;
X-CSE-ConnectionGUID: GAOw070PRe63+v1cjiW4BA==
X-CSE-MsgGUID: oIEcczp0SKSZGm5KKBqWYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="813653"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="813653"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:51 -0700
X-CSE-ConnectionGUID: XFI8t3PwQlyLfzslpo9ZLA==
X-CSE-MsgGUID: KteuNWvvRrqY4Zj/LCiHMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1787274"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:50 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI-only v3 10/18] drm/xe: Send wedged notification from a worker
Date: Fri, 16 Oct 2026 12:48:20 +0530
Message-ID: <20261016071832.222574-11-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016071832.222574-1-arvind.yadav@intel.com>
References: <20261016071832.222574-1-arvind.yadav@intel.com>
MIME-Version: 1.0
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

DO NOT REVIEW

Move the wedged event to a device worker. This provides a sleepable
context for later isolation work and allows it to complete before
userspace is notified.

Prepare the GTs only on the first wedge declaration. Reject queue
publication after the wedge under the submission lock, so a queue
cannot appear after the scan.

Later declarations can update the recovery method and requeue
notification without repeating GT preparation.

Track the last reported method and resample it after each event so an
update is not lost when the worker is already running.

Stop the worker before probe cleanup, remove, shutdown and GT devres
cleanup so it cannot race device teardown.

v2:
 - Update reported_method only when drm_dev_wedged_event() succeeds.
   (Andi)
 - Requeue only if the recovery method changed, avoiding repeated
   retries when notification fails.
 - Make wedge worker shutdown one-shot.

v3:
 - Use cmpxchg() when setting the default recovery method to avoid
   overwriting a concurrent method update. (Sashiko)
 - Stop the wedge worker before GT devres cleanup.
 - Stop wedge handling explicitly if GT initialization fails.
 - Run GT preparation only on the first wedge declaration.
 - Reject queue publication after a permanent wedge.

Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 87 +++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++
 drivers/gpu/drm/xe/xe_guc_submit.c   |  9 +++
 3 files changed, 87 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0f319415055c..7010d1320f8d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -85,6 +85,8 @@
 #include <generated/xe_device_wa_oob.h>
 #include <generated/xe_wa_oob.h>
 
+static void xe_device_wedged_work(struct work_struct *work);
+
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -498,6 +500,9 @@ int xe_device_init_early(struct xe_device *xe)
 {
 	int err;
 
+	INIT_WORK(&xe->wedged.work, xe_device_wedged_work);
+	xe->wedged.reported_method = ~0UL;
+
 	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
 			      xe->drm.anon_inode->i_mapping,
 			      xe->drm.vma_offset_manager,
@@ -924,6 +929,40 @@ static void xe_uid_probe(struct xe_device *xe)
 		xe->device_uid = xe_mmio_read64_2x32(xe_root_tile_mmio(xe), CRI_DEVICE_UID);
 }
 
+static void xe_device_wedged_work(struct work_struct *work)
+{
+	struct xe_device *xe =
+			container_of(work, struct xe_device, wedged.work);
+	unsigned long method;
+	int err;
+
+	/* Report at most one recovery method per worker invocation. */
+	method = READ_ONCE(xe->wedged.method);
+	if (method != READ_ONCE(xe->wedged.reported_method)) {
+		err = drm_dev_wedged_event(&xe->drm, method, NULL);
+		if (!err)
+			WRITE_ONCE(xe->wedged.reported_method, method);
+	}
+
+	/*
+	 * Queue another pass if the method changed while the event was sent.
+	 * This preserves the update without keeping this worker in a loop.
+	 */
+	if (!atomic_read(&xe->wedged.stopping) &&
+	    READ_ONCE(xe->wedged.method) != method)
+		queue_work(xe->unordered_wq, &xe->wedged.work);
+}
+
+static void xe_device_wedged_disable(void *arg)
+{
+	struct xe_device *xe = arg;
+
+	if (atomic_xchg(&xe->wedged.stopping, 1))
+		return;
+
+	disable_work_sync(&xe->wedged.work);
+}
+
 int xe_device_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -1040,10 +1079,18 @@ int xe_device_probe(struct xe_device *xe)
 
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_init(gt);
-		if (err)
+		if (err) {
+			xe_device_wedged_disable(xe);
 			return err;
+		}
 	}
 
+	/* Stop wedge work before GT and IRQ devres cleanup. */
+	err = devm_add_action_or_reset(xe->drm.dev,
+				       xe_device_wedged_disable, xe);
+	if (err)
+		return err;
+
 	err = xe_vram_memtest(xe);
 	if (err)
 		return err;
@@ -1151,6 +1198,7 @@ int xe_device_probe(struct xe_device *xe)
 	return 0;
 
 err_unregister_display:
+	xe_device_wedged_disable(xe);
 	xe_display_unregister(xe);
 	drm_dev_unregister(&xe->drm);
 
@@ -1159,6 +1207,8 @@ int xe_device_probe(struct xe_device *xe)
 
 void xe_device_remove(struct xe_device *xe)
 {
+	xe_device_wedged_disable(xe);
+
 	xe_display_unregister(xe);
 
 	drm_dev_unplug(&xe->drm);
@@ -1175,6 +1225,8 @@ void xe_device_shutdown(struct xe_device *xe)
 
 	drm_dbg(&xe->drm, "Shutting down device\n");
 
+	xe_device_wedged_disable(xe);
+
 	xe_display_shutdown(xe);
 
 	xe_irq_suspend(xe);
@@ -1427,7 +1479,7 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
  */
 void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
 {
-	xe->wedged.method = method;
+	WRITE_ONCE(xe->wedged.method, method);
 }
 
 #define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
@@ -1454,6 +1506,7 @@ void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
 void xe_device_declare_wedged(struct xe_device *xe)
 {
 	struct xe_gt *gt;
+	bool first;
 	u8 id;
 
 	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
@@ -1461,7 +1514,8 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		return;
 	}
 
-	if (!atomic_xchg(&xe->wedged.flag, 1)) {
+	first = !atomic_xchg(&xe->wedged.flag, 1);
+	if (first) {
 		xe->needs_flr_on_fini = true;
 		xe_pm_runtime_get_noresume(xe);
 		wake_up_all(&xe->ufence_wq);
@@ -1471,12 +1525,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
 			    "For recovery procedure, refer to %s\n"
 			    "Please file a _new_ bug report at %s\n",
 			    WEDGED_URL, XE_BUG_URL);
-	}
-
-	for_each_gt(gt, xe, id)
-		xe_gt_declare_wedged(gt);
 
-	if (xe_device_wedged(xe)) {
 		/*
 		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
 		 * hangs, so wedge the device with 'none' recovery method and have
@@ -1484,14 +1533,22 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		 */
 		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
 			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
-		/* If no wedge recovery method is set, use default */
-		else if (!xe->wedged.method)
-			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
-						    DRM_WEDGE_RECOVERY_BUS_RESET);
-
-		/* Notify userspace of wedged device */
-		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
+
+		/* Prepare GTs only on the first wedge declaration. */
+		for_each_gt(gt, xe, id)
+			xe_gt_declare_wedged(gt);
 	}
+
+	/* Set the default only if no recovery method was selected. */
+	cmpxchg(&xe->wedged.method, 0UL,
+		DRM_WEDGE_RECOVERY_REBIND |
+		DRM_WEDGE_RECOVERY_BUS_RESET);
+
+	if (!atomic_read(&xe->wedged.stopping) &&
+	    (first ||
+	     READ_ONCE(xe->wedged.method) !=
+	     READ_ONCE(xe->wedged.reported_method)))
+		queue_work(xe->unordered_wq, &xe->wedged.work);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 41f703a87916..9f6f015d7559 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -560,6 +560,12 @@ struct xe_device {
 		unsigned long method;
 		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
 		bool inconsistent_reset;
+		/** @wedged.work: Runs sleepable wedge handling */
+		struct work_struct work;
+		/** @wedged.stopping: Blocks worker requeue and repeated disable */
+		atomic_t stopping;
+		/** @wedged.reported_method: Last recovery method reported to userspace */
+		unsigned long reported_method;
 	} wedged;
 
 	/** @devres_group: devres group */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f0bbd32b9acd..84eb4933c930 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2172,6 +2172,12 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	q->entity = &ge->entity;
 
 	mutex_lock(&guc->submission_state.lock);
+	if (xe_device_wedged(guc_to_xe(guc))) {
+		mutex_unlock(&guc->submission_state.lock);
+		err = -ECANCELED;
+		goto err_entity;
+	}
+
 	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
 		xe_sched_stop(sched);
 	publish_guc_id(guc, q);
@@ -2199,6 +2205,9 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 	return 0;
 
+err_entity:
+	q->entity = NULL;
+	xe_sched_entity_fini(&ge->entity);
 err_sched:
 	xe_sched_fini(&ge->sched);
 err_release_id:
-- 
2.43.0

