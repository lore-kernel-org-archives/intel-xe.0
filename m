Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDDECAC5A7
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 12:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4A410E8FD;
	Thu, 25 Sep 2025 12:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nKIfSOmE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E096F10E8F6
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 12:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758802906; x=1790338906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3dOCiafvkYP8rQTB1FAaE6WIa94NYaLOQZXjqO3rRbg=;
 b=nKIfSOmEH/3EPKrUAeWuudly0wvOsVluEPYWwNVwgs+7b2c+TFFz8xBW
 fmKj1QGbZXx4zNFbn3ZKeb8g3/Sah3DKkjR3JOXX0DslDhGEzZ5avU3Xk
 fot10Xu10eCaZpeK9wPU2wBiagLw0vRdGeji7KVYcDYzIqeE/QQQgGhuG
 l9fddtCrFRNOs5HrZF5X0yyKjaD/DreU1+G42ZiymSHlEwwgM2HfIyDfo
 qcC6u8q/gAODoZoPK/C6Yvm4Tz96XKgM2eSR1wCmWFj616VHGJ8JMPxdN
 QoT4CLuRjLL5UJeOs/a1BgJ3/GEGZ48KwvawteD3GkD4kxJ0jvcAidc9g g==;
X-CSE-ConnectionGUID: NvEu70OUSI+dJ8QK9aq5hw==
X-CSE-MsgGUID: Q1ZRGhrqQWicCbdfJSkpMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60818062"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="60818062"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 05:21:46 -0700
X-CSE-ConnectionGUID: nnITMe+QS2uETgqr0COsbw==
X-CSE-MsgGUID: I1RzkpCISgSRE++GHz4k7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="181328320"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by orviesa003.jf.intel.com with ESMTP; 25 Sep 2025 05:21:43 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v4 6/8] drm/xe: Implement xe_work_period_worker
Date: Thu, 25 Sep 2025 11:46:56 +0000
Message-ID: <20250925114700.68090-7-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250925114700.68090-1-aakash.deep.sarkar@intel.com>
References: <20250925114700.68090-1-aakash.deep.sarkar@intel.com>
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

The work of collecting the GPU run time for a given
xe_user and emitting its event, is done by the
xe_work_period_worker kworker. At the time of creation
of a new xe_user, we simultaneously start a delayed
kworker thread. The delay of execution is set to be
500 ms. After the completion of the work, the kworker
schedules itself for the next execution. This is done
as long as the reference to the xe_user pointer is
valid.

During each execution cycle the xe_work_period_worker
iterates over all the xe files in the xe_user::filelist
and accumulate their corresponding GPU runtime into the
xe_user::active_duration_ns; while also updating each of
the xe_file::active_duration_ns. The total runtime for
this uid in the current sampling period is the delta
between the previous xe_user::active_duration_ns and
the current xe_user::active_duration_ns.

We also record the current timestamp at the end of each
invocation to xe_work_period_worker function in the
xe_user::last_timestamp_ns. The sampling period for this
uid is the delta between the previous timestamp and the
current timestamp.

Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  13 ++--
 drivers/gpu/drm/xe/xe_pm.c     |   5 ++
 drivers/gpu/drm/xe/xe_user.c   | 127 +++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_user.h   |  21 ++++--
 4 files changed, 149 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 258b87403596..8e368346b6d4 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -80,11 +80,9 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_drm_client *client;
-	struct xe_user *user;
 	struct xe_file *xef;
 	int ret = -ENOMEM;
 	int uid = -EINVAL;
-	u32 idx;
 	struct task_struct *task = NULL;
 	const struct cred *cred = NULL;
 
@@ -141,11 +139,12 @@ static void xe_file_destroy(struct kref *ref)
 	xe_drm_client_put(xef->client);
 	kfree(xef->process_name);
 
-	mutex_lock(&xef->user->filelist_lock);
-	list_del(&xef->user_link);
-	mutex_unlock(&xef->user->filelist_lock);
-
-	xe_user_put(xef->user);
+	if (xef->user) {
+		mutex_lock(&xef->user->lock);
+		list_del(&xef->user_link);
+		xe_user_put(xef->user);
+		mutex_unlock(&xef->user->lock);
+	}
 	kfree(xef);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 2b61a3b8257c..35d5433a9e0e 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -26,6 +26,7 @@
 #include "xe_pxp.h"
 #include "xe_sriov_vf_ccs.h"
 #include "xe_trace.h"
+#include "xe_user.h"
 #include "xe_vm.h"
 #include "xe_wa.h"
 
@@ -532,6 +533,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 
 	xe_i2c_pm_suspend(xe);
 
+	xe_user_cancel_workers(xe);
+
 	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
 	return 0;
@@ -584,6 +587,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
 
+	xe_user_resume_workers(xe);
+
 	xe_irq_resume(xe);
 
 	for_each_gt(gt, xe, id)
diff --git a/drivers/gpu/drm/xe/xe_user.c b/drivers/gpu/drm/xe/xe_user.c
index fcdddefc7b4f..8e23a6c74717 100644
--- a/drivers/gpu/drm/xe/xe_user.c
+++ b/drivers/gpu/drm/xe/xe_user.c
@@ -6,17 +6,95 @@
 #include <linux/slab.h>
 #include <drm/drm_drv.h>
 
+#include "xe_assert.h"
+#include "xe_device_types.h"
+#include "xe_exec_queue.h"
+#include "xe_pm.h"
 #include "xe_user.h"
 
+#define CREATE_TRACE_POINTS
+#include <trace/gpu_work_period.h>
+
+static inline void schedule_next_work(struct xe_device *xe, unsigned int id)
+{
+	struct xe_user *user;
+
+	mutex_lock(&xe->work_period.lock);
+	user = xa_load(&xe->work_period.users, id);
+	if (user && xe_user_get_unless_zero(user))
+		schedule_delayed_work(&user->delay_work,
+				msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL));
+	mutex_unlock(&xe->work_period.lock);
+}
 /**
  * worker thread to emit gpu work period event for this xe user
  * @work: work instance for this xe user
  *
  * Return: void
  */
-static inline void work_period_worker(struct work_struct *work)
+static void xe_work_period_worker(struct work_struct *work)
 {
-	//TODO: Implement this worker
+	struct xe_user *user = container_of(work, struct xe_user, delay_work.work);
+	struct xe_device *xe = user->xe;
+	struct xe_file *xef;
+	struct xe_exec_queue *q;
+
+	/*
+	 * The GPU work period event requires the following parameters
+	 *
+	 * gpuid:           GPU index in case the platform has more than one GPU
+	 * uid:             user id of the app
+	 * start_time:      start time for the sampling period in nanosecs
+	 * end_time:        end time for the sampling period in nanosecs
+	 * active_duration: Total runtime in nanosecs for this uid in
+	 *                  the current sampling period.
+	 */
+	u32 gpuid = 0, uid = user->uid, id = user->id;
+	u64 start_time, end_time, active_duration;
+	u64 last_active_duration, last_timestamp;
+	unsigned long i;
+
+	mutex_lock(&user->lock);
+
+	// Save the last recorded active duration and timestamp
+	last_active_duration = user->active_duration_ns;
+	last_timestamp = user->last_timestamp_ns;
+
+	if (xe_pm_runtime_get_if_active(xe)) {
+
+		list_for_each_entry(xef, &user->filelist, user_link) {
+
+			wait_var_event(&xef->exec_queue.pending_removal,
+			!atomic_read(&xef->exec_queue.pending_removal));
+
+			/* Accumulate all the exec queues from this file */
+			mutex_lock(&xef->exec_queue.lock);
+			xa_for_each(&xef->exec_queue.xa, i, q) {
+				xe_exec_queue_get(q);
+				mutex_unlock(&xef->exec_queue.lock);
+
+				xe_exec_queue_update_run_ticks(q);
+
+				mutex_lock(&xef->exec_queue.lock);
+				xe_exec_queue_put(q);
+			}
+			mutex_unlock(&xef->exec_queue.lock);
+			user->active_duration_ns += xef->active_duration_ns;
+		}
+
+		xe_pm_runtime_put(xe);
+
+		start_time = last_timestamp + 1;
+		end_time = ktime_get_raw_ns();
+		active_duration = user->active_duration_ns - last_active_duration;
+		trace_gpu_work_period(gpuid, uid, start_time, end_time, active_duration);
+		user->last_timestamp_ns = end_time;
+		xe_user_put(user);
+	}
+
+	mutex_unlock(&user->lock);
+
+	schedule_next_work(xe, id);
 }
 
 /**
@@ -38,9 +116,9 @@ static struct xe_user *xe_user_alloc(void)
 		return NULL;
 
 	kref_init(&user->refcount);
-	mutex_init(&user->filelist_lock);
+	mutex_init(&user->lock);
 	INIT_LIST_HEAD(&user->filelist);
-	INIT_WORK(&user->work, work_period_worker);
+	INIT_DELAYED_WORK(&user->delay_work, xe_work_period_worker);
 	return user;
 }
 
@@ -120,12 +198,49 @@ int xe_user_init(struct xe_device* xe, struct xe_file* xef, unsigned int uid)
 
 		user->id = idx;
 		drm_dev_get(&xe->drm);
+
+		xe_user_get(user);
+		if (!schedule_delayed_work(&user->delay_work,
+					msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL)))
+			xe_user_put(user);
 	}
 
-	mutex_lock(&user->filelist_lock);
+	mutex_lock(&user->lock);
 	list_add(&xef->user_link, &user->filelist);
-	mutex_unlock(&user->filelist_lock);
+	mutex_unlock(&user->lock);
 	xef->user = user;
 
 	return 0;
 }
+
+void xe_user_cancel_workers(struct xe_device* xe)
+{
+	struct xe_user *user = NULL;
+	unsigned long i = 0;
+
+	mutex_lock(&xe->work_period.lock);
+	xa_for_each(&xe->work_period.users, i, user) {
+		if (user && xe_user_get_unless_zero(user)) {
+			cancel_delayed_work_sync(&user->delay_work);
+			xe_user_put(user);
+		}
+	}
+	mutex_unlock(&xe->work_period.lock);
+}
+
+void xe_user_resume_workers(struct xe_device* xe)
+{
+	struct xe_user *user = NULL;
+	unsigned long i = 0;
+
+	mutex_lock(&xe->work_period.lock);
+	xa_for_each(&xe->work_period.users, i, user) {
+		if (user && xe_user_get_unless_zero(user)) {
+			if (!schedule_delayed_work(&user->delay_work,
+					msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL)))
+				xe_user_put(user);
+		}
+	}
+	mutex_unlock(&xe->work_period.lock);
+}
+
diff --git a/drivers/gpu/drm/xe/xe_user.h b/drivers/gpu/drm/xe/xe_user.h
index ec4c0f2b862c..fc976beed2ad 100644
--- a/drivers/gpu/drm/xe/xe_user.h
+++ b/drivers/gpu/drm/xe/xe_user.h
@@ -11,9 +11,11 @@
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
 
-#include "xe_device.h"
+#include "xe_device_types.h"
 
 
+#define XE_WORK_PERIOD_INTERVAL 500
+
 /**
  * This is a per process/user id structure for a xe device
  * client. It is allocated when a new process/app opens the
@@ -32,9 +34,9 @@ struct xe_user {
 	struct xe_device *xe;
 
 	/**
-	 * @filelist_lock: lock protecting the filelist
+	 * @filelist_lock: lock protecting this structure
 	 */
-	struct mutex filelist_lock;
+	struct mutex lock;
 
 	/**
 	 * @filelist: list of xe files belonging to this xe user
@@ -45,7 +47,7 @@ struct xe_user {
 	 * @work: work to emit the gpu work period event for this
 	 * xe user
 	 */
-	struct work_struct work;
+	struct delayed_work delay_work;
 
 	/**
 	 * @id: index of this user into the xe device users array
@@ -72,6 +74,17 @@ struct xe_user {
 
 int xe_user_init(struct xe_device* xe, struct xe_file* xef, unsigned int uid);
 
+void xe_user_cancel_workers(struct xe_device* xe);
+
+void xe_user_resume_workers(struct xe_device* xe);
+
+static inline struct xe_user *
+xe_user_get_unless_zero(struct xe_user *user)
+{
+	if (kref_get_unless_zero(&user->refcount))
+		return user;
+	return NULL;
+}
 
 static inline struct xe_user *
 xe_user_get(struct xe_user *user)
-- 
2.49.0

