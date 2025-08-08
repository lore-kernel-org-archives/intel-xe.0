Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F86C87FD2
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 09:37:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AC210E8F7;
	Fri,  8 Aug 2025 09:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZQCnZPrv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F249D10E8F7
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 09:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754645824; x=1786181824;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a2+wiyCLY9FN2eT4vCGv1E44ZdokUiVE0sjDismVnzo=;
 b=ZQCnZPrvNYgnl1sMnKhU0mxLo4K0kuYEMRHicohnFvx0DKlysniOh6H6
 iBC8Tf2uF2V3P20rS75OUrseN4CQf+QQveEhopy6RLsvu6BeCjrkaOjH9
 i+ZkF1f6M0ciNvs2nFFKeOhR6ybn5gESTUxwSGPsI3UmLuDh894S/2x7Z
 ncex45uMap+GDLA+JP7B8Y53wezWqzod2A2FscdhbOWKj9ILD7nA1cPfu
 zqFdep32G+wN4Yf+rrsBXQ1dX5dPV5TtZnVtHhzmxUf/5pKKM43ZbxLpQ
 kb9N4WpIlxbncN7o7zCN5ClW7Gn25QiHa0KAZBN79v4jATXyLVmDzarAA Q==;
X-CSE-ConnectionGUID: QFjz3dS2R+62bVGpgv+4nQ==
X-CSE-MsgGUID: q49Ul+CXRJumDZXxvzjIOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56869831"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="56869831"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 02:37:04 -0700
X-CSE-ConnectionGUID: V+UajVLpTjGVUIDldbGbPQ==
X-CSE-MsgGUID: OIbCLcz7RgWmQVq7NxLhmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="169750336"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by orviesa004.jf.intel.com with ESMTP; 08 Aug 2025 02:37:02 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH] ANDROID: Add GPU work period support for Xe driver
Date: Fri,  8 Aug 2025 09:09:19 +0000
Message-ID: <20250808090922.3716954-1-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
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

This patch implements the Android requirement GPU work
period event for Intel Xe driver.

|GpuWorkPeriodEvent| defines a non-overlapping, non-zero period
of time from |start_time_ns| (inclusive) until |end_time_ns|
(exclusive) for a given |uid|, and includes details of how much
work the GPU was performing for |uid| during the period. When
GPU work for a given |uid| runs on the GPU, the driver must track
one or more periods that cover the time where the work was running,
and emit events soon after.

Full requirement is defined in the following file:
https://cs.android.com/android/platform/superproject/main/+\
/main:frameworks/native/services/gpuservice/gpuwork/bpfprogs/gpuWork.c;l=35

The requirement is implemented using a timer to give periodic
interrupts and a worker thread per user id instance to accumulate
its run time on gpu and emit the event. Each user id instance is
tracked using a xe_user structure and the runtime is updated at
each timer interrupt. The timer period is hardcoded to 500 msecs.

The runtime on the gpu is collected for each xe file individually
inside the function xe_exec_queue_update_run_ticks() and accumulated
into the corresponding xe_user active_duration_ns field. The HW
Context timestamp field in the GTT is used to derive the runtime
in clock ticks and then converted into nanosecs before updating the
active duration.

Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c                |  98 +++++++++++++++-
 drivers/gpu/drm/xe/xe_device_types.h          |  27 +++++
 drivers/gpu/drm/xe/xe_drm_client.c            | 108 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_drm_client.h            |  75 +++++++++++-
 drivers/gpu/drm/xe/xe_exec_queue.c            |   5 +
 drivers/gpu/drm/xe/xe_gt_clock.c              |   5 +
 drivers/gpu/drm/xe/xe_gt_clock.h              |   1 +
 .../drm/xe/xe_power_gpu_work_period_trace.h   |  61 ++++++++++
 8 files changed, 378 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 57edbc63da6f..116247007a4d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -8,6 +8,7 @@
 #include <linux/aperture.h>
 #include <linux/delay.h>
 #include <linux/fault-inject.h>
+#include <linux/jiffies.h>
 #include <linux/units.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -76,9 +77,13 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_drm_client *client;
+	struct xe_user *user;
 	struct xe_file *xef;
 	int ret = -ENOMEM;
+	unsigned long flags;
+	int uid = -EINVAL;
 	struct task_struct *task = NULL;
+	const struct cred *cred = NULL;
 
 	xef = kzalloc(sizeof(*xef), GFP_KERNEL);
 	if (!xef)
@@ -103,13 +108,66 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 	file->driver_priv = xef;
 	kref_init(&xef->refcount);
 
+	INIT_LIST_HEAD(&xef->user_link);
+
 	task = get_pid_task(rcu_access_pointer(file->pid), PIDTYPE_PID);
 	if (task) {
+		cred = get_task_cred(task);
+		if (cred) {
+			uid = (int) cred->euid.val;
+			put_cred(cred);
+		}
 		xef->process_name = kstrdup(task->comm, GFP_KERNEL);
 		xef->pid = task->pid;
 		put_task_struct(task);
 	}
 
+	if (uid < 0)
+		goto out;
+
+	/*
+	 * Check if the calling process/uid has already been registered
+	 * with the xe device during a previous open call. If so then
+	 * take a reference to this xe file and add it to the list of xe
+	 * files belonging to the this user
+	 */
+	spin_lock_irqsave(&xe->work_period.lock, flags);
+	list_for_each_entry(user, &xe->work_period.user_list, entry) {
+		if (user->uid == uid) {
+			xef->user = xe_user_get(user);
+			spin_unlock_irqrestore(&xe->work_period.lock, flags);
+			goto filelist_add;
+		}
+	}
+	spin_unlock_irqrestore(&xe->work_period.lock, flags);
+
+
+	/*
+	 * We couldn't find a xe user for this process. Allocate a new
+	 * struct xe_user and register it with this xe device
+	 */
+	user = xe_user_alloc();
+	if (!user)
+		goto out;
+
+	user->uid = (unsigned int) uid;
+	user->last_timestamp_ns = ktime_get_raw_ns();
+	user->xe = xe;
+
+	/* Add this xe_user to xe_device->work_period.user_list */
+	spin_lock_irqsave(&xe->work_period.lock, flags);
+	list_add(&user->entry, &xe->work_period.user_list);
+	spin_unlock_irqrestore(&xe->work_period.lock, flags);
+
+	drm_dev_get(&xe->drm);
+	xef->user = user;
+
+filelist_add:
+	/* Add this xe_file to xe_user->filelist */
+	mutex_lock(&user->filelist_lock);
+	list_add(&xef->user_link, &user->filelist);
+	mutex_unlock(&user->filelist_lock);
+out:
 	return 0;
 }
 
@@ -124,6 +182,12 @@ static void xe_file_destroy(struct kref *ref)
 
 	xe_drm_client_put(xef->client);
 	kfree(xef->process_name);
+
+	mutex_lock(&xef->user->filelist_lock);
+	list_del(&xef->user_link);
+	mutex_unlock(&xef->user->filelist_lock);
+	xe_user_put(xef->user);
+
 	kfree(xef);
 }
 
@@ -347,6 +411,23 @@ static int xe_mmap(struct file *filp, struct vm_area_struct *vma)
 	return drm_gem_mmap(filp, vma);
 }
 
+static void work_period_timer_fn(struct timer_list *timer)
+{
+	struct xe_device *xe = container_of(timer, typeof(*xe), work_period.timer);
+	struct xe_user *user;
+	unsigned long timeout = 0;
+
+	spin_lock(&xe->work_period.lock);
+	list_for_each_entry(user, &xe->work_period.user_list, entry) {
+		xe_user_get(user);
+		queue_work(xe->work_period.wq, &user->work);
+	}
+	spin_unlock(&xe->work_period.lock);
+	timeout = jiffies + msecs_to_jiffies(500);
+
+	mod_timer(timer, timeout);
+}
+
 static const struct file_operations xe_driver_fops = {
 	.owner = THIS_MODULE,
 	.open = drm_open,
@@ -409,6 +490,11 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	if (xe->destroy_wq)
 		destroy_workqueue(xe->destroy_wq);
 
+	if (xe->work_period.wq)
+		destroy_workqueue(xe->work_period.wq);
+
+	timer_delete_sync(&xe->work_period.timer);
+
 	ttm_device_fini(&xe->ttm);
 }
 
@@ -477,11 +563,21 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
 						       WQ_MEM_RECLAIM);
+
+	spin_lock_init(&xe->work_period.lock);
+	INIT_LIST_HEAD(&xe->work_period.user_list);
+	timer_setup(&xe->work_period.timer, work_period_timer_fn, 0);
+	xe->work_period.timer.expires = jiffies + msecs_to_jiffies(1000);
+	add_timer(&xe->work_period.timer);
+
+	xe->work_period.wq = alloc_workqueue("xe-work-period-wq", 0, 0);
+
 	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
 	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", 0, 0);
 	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", 0, 0);
 	if (!xe->ordered_wq || !xe->unordered_wq ||
-	    !xe->preempt_fence_wq || !xe->destroy_wq) {
+	    !xe->preempt_fence_wq || !xe->destroy_wq ||
+		!xe->work_period.wq) {
 		/*
 		 * Cleanup done in xe_device_destroy via
 		 * drmm_add_action_or_reset register above
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 01e8fa0d2f9f..32b63b5f1c2e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -418,6 +418,20 @@ struct xe_device {
 		} late;
 	} pinned;
 
+	/** @work_period: gpu work period event */
+	struct {
+		/** @lock: lock protecting this structure */
+		spinlock_t lock;
+		/** @timer: timer to give periodic interrupts to emit the
+		 * gpu work period event
+		 */
+		struct timer_list timer;
+		/** @user_list: list of xe users using this xe device */
+		struct list_head user_list;
+		/** @wq: workqueue for gpu work period event emitting work */
+		struct workqueue_struct *wq;
+	} work_period;
+
 	/** @ufence_wq: user fence wait queue */
 	wait_queue_head_t ufence_wq;
 
@@ -656,6 +670,9 @@ struct xe_file {
 	/** @run_ticks: hw engine class run time in ticks for this drm client */
 	u64 run_ticks[XE_ENGINE_CLASS_MAX];
 
+	/** @active_duration_ns: total run time in ns for this xe file */
+	u64 active_duration_ns;
+
 	/** @client: drm client */
 	struct xe_drm_client *client;
 
@@ -671,6 +688,16 @@ struct xe_file {
 	 */
 	pid_t pid;
 
+	/**
+	 * @user_link: entry into xe_user.filelist list
+	 */
+	struct list_head user_link;
+
+	/**
+	 * @user: pointer to the xe user this xe file belongs to
+	 */
+	struct xe_user *user;
+
 	/** @refcount: ref count of this xe file */
 	struct kref refcount;
 };
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index f931ff9b1ec0..7a21d8e83310 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -5,10 +5,12 @@
 #include "xe_drm_client.h"
 
 #include <drm/drm_print.h>
+#include <drm/drm_drv.h>
 #include <uapi/drm/xe_drm.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/spinlock.h>
 
 #include "xe_assert.h"
 #include "xe_bo.h"
@@ -21,6 +23,9 @@
 #include "xe_pm.h"
 #include "xe_trace.h"
 
+#define CREATE_TRACE_POINTS
+#include "xe_power_gpu_work_period_trace.h"
+
 /**
  * DOC: DRM Client usage stats
  *
@@ -404,3 +409,106 @@ void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
 	show_run_ticks(p, file);
 }
 #endif
+
+/**
+ * worker thread to emit gpu work period event for this xe user
+ * @work: work instance for this xe user
+ *
+ * Return: void
+ */
+static inline void work_period_worker(struct work_struct *work)
+{
+	struct xe_user *user = container_of(work, struct xe_user, work);
+	struct xe_device *xe = user->xe;
+	struct xe_file *xef;
+	struct xe_exec_queue *q;
+	u64 last_active_duration, last_timestamp;
+	u32 gpuid = 0, uid = user->uid;
+	u64 start_time, end_time, active_duration;
+	unsigned long i;
+
+	last_active_duration = user->active_duration_ns;
+	last_timestamp = user->last_timestamp_ns;
+
+	xe_pm_runtime_get(xe);
+
+	mutex_lock(&user->filelist_lock);
+	list_for_each_entry(xef, &user->filelist, user_link) {
+
+		wait_var_event(&xef->exec_queue.pending_removal,
+		!atomic_read(&xef->exec_queue.pending_removal));
+
+		/* Accumulate all the exec queues from this user */
+		mutex_lock(&xef->exec_queue.lock);
+		xa_for_each(&xef->exec_queue.xa, i, q) {
+			xe_exec_queue_get(q);
+			mutex_unlock(&xef->exec_queue.lock);
+
+			xe_exec_queue_update_run_ticks(q);
+
+			mutex_lock(&xef->exec_queue.lock);
+			xe_exec_queue_put(q);
+		}
+		mutex_unlock(&xef->exec_queue.lock);
+		user->active_duration_ns += xef->active_duration_ns;
+	}
+	mutex_unlock(&user->filelist_lock);
+
+	xe_pm_runtime_put(xe);
+
+	start_time = last_timestamp + 1;
+	end_time = ktime_get_raw_ns();
+	active_duration = user->active_duration_ns - last_active_duration;
+	trace_gpu_work_period(gpuid, uid, start_time, end_time, active_duration);
+	user->last_timestamp_ns = end_time;
+
+	xe_user_put(user);
+}
+
+/**
+ * xe_user_alloc() - Allocate xe user
+ * @void: No arg
+ *
+ * Allocate xe user struct to track activity on the gpu
+ * by the application. Call this API whenever a new app
+ * has opened xe device.
+ *
+ * Return: pointer to user struct or NULL if can't allocate
+ */
+struct xe_user *xe_user_alloc(void)
+{
+	struct xe_user *user;
+
+	user = kzalloc(sizeof(*user), GFP_KERNEL);
+	if (!user)
+		return NULL;
+
+	kref_init(&user->refcount);
+	mutex_init(&user->filelist_lock);
+	INIT_LIST_HEAD(&user->filelist);
+	INIT_LIST_HEAD(&user->entry);
+	INIT_WORK(&user->work, work_period_worker);
+	return user;
+}
+
+/**
+ * __xe_user_free() - Free user struct
+ * @kref: The reference
+ *
+ * Return: void
+ */
+void __xe_user_free(struct kref *kref)
+{
+	struct xe_user *user =
+		container_of(kref, struct xe_user, refcount);
+	struct xe_device *xe = user->xe;
+	unsigned long flags;
+
+	/* Remove the xe_user from xe_device.user_list */
+	spin_lock_irqsave(&xe->work_period.lock, flags);
+	list_del(&user->entry);
+	spin_unlock_irqrestore(&xe->work_period.lock, flags);
+
+	drm_dev_put(&user->xe->drm);
+	kfree(user);
+}
diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
index a9649aa36011..cf5f27e79251 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.h
+++ b/drivers/gpu/drm/xe/xe_drm_client.h
@@ -12,6 +12,7 @@
 #include <linux/rcupdate.h>
 #include <linux/sched.h>
 #include <linux/spinlock.h>
+#include <linux/workqueue.h>
 
 struct drm_file;
 struct drm_printer;
@@ -34,7 +35,63 @@ struct xe_drm_client {
 #endif
 };
 
-	static inline struct xe_drm_client *
+/**
+ * This is a per process/user id structure for a xe device
+ * client. It is allocated when a new process/app opens the
+ * xe device and destroyed when the last xe file belonging
+ * to this user id is destroyed.
+ */
+struct xe_user {
+	/**
+	 * @refcount: reference count
+	 */
+	struct kref refcount;
+
+	/**
+	 * @xe: pointer to the xe_device
+	 */
+	struct xe_device *xe;
+
+	/**
+	 * @filelist_lock: lock protecting the filelist
+	 */
+	struct mutex filelist_lock;
+
+	/**
+	 * @filelist: list of xe files belonging to this xe user
+	 */
+	struct list_head filelist;
+
+	/**
+	 * @entry: entry into the xe.work_period.user_list list
+	 */
+	struct list_head entry;
+
+	/**
+	 * @work: work to emit the gpu work period event for this
+	 * xe user
+	 */
+	struct work_struct work;
+
+	/**
+	 * @uid: user id for this xe_user
+	 */
+	u32 uid;
+
+	/**
+	 * @active_duration_ns: sum total of xe_file.active_duration_ns
+	 * for all xe files belonging to this xe user
+	 */
+	u64 active_duration_ns;
+
+	/**
+	 * @last_timestamp_ns: timestamp in ns when we last emitted event
+	 * for this xe user
+	 */
+	u64 last_timestamp_ns;
+};
+
+static inline struct xe_drm_client *
 xe_drm_client_get(struct xe_drm_client *client)
 {
 	kref_get(&client->kref);
@@ -67,4 +124,20 @@ static inline void xe_drm_client_remove_bo(struct xe_bo *bo)
 {
 }
 #endif
+
+struct xe_user *xe_user_alloc(void);
+
+static inline struct xe_user *
+xe_user_get(struct xe_user *user)
+{
+	kref_get(&user->refcount);
+	return user;
+}
+
+void __xe_user_free(struct kref *kref);
+
+static inline void xe_user_put(struct xe_user *user)
+{
+	kref_put(&user->refcount, __xe_user_free);
+}
 #endif
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6c176183ed58..59d69863f626 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -15,6 +15,7 @@
 #include "xe_dep_scheduler.h"
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_gt_clock.h"
 #include "xe_hw_engine_class_sysfs.h"
 #include "xe_hw_engine_group.h"
 #include "xe_hw_fence.h"
@@ -865,6 +866,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 	struct xe_device *xe = gt_to_xe(q->gt);
 	struct xe_lrc *lrc;
 	u64 old_ts, new_ts;
+	struct xe_gt *gt = q->gt;
 	int idx;
 
 	/*
@@ -889,6 +891,9 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
 	q->xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
 
+	q->xef->active_duration_ns +=
+		xe_gt_clock_interval_to_ns(gt, (new_ts - old_ts));
+
 	drm_dev_exit(idx);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 4f011d1573c6..6ba807837198 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -110,3 +110,8 @@ u64 xe_gt_clock_interval_to_ms(struct xe_gt *gt, u64 count)
 {
 	return div_u64_roundup(count * MSEC_PER_SEC, gt->info.reference_clock);
 }
+
+u64 xe_gt_clock_interval_to_ns(struct xe_gt *gt, u64 count)
+{
+	return div_u64_roundup(count * NSEC_PER_SEC, gt->info.reference_clock);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.h b/drivers/gpu/drm/xe/xe_gt_clock.h
index 3adeb7baaca4..bd87971bce97 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.h
+++ b/drivers/gpu/drm/xe/xe_gt_clock.h
@@ -12,5 +12,6 @@ struct xe_gt;
 
 int xe_gt_clock_init(struct xe_gt *gt);
 u64 xe_gt_clock_interval_to_ms(struct xe_gt *gt, u64 count);
+u64 xe_gt_clock_interval_to_ns(struct xe_gt *gt, u64 count);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h b/drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h
new file mode 100644
index 000000000000..2de05f1b64f3
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _TRACE_POWER_GPU_WORK_PERIOD_INTEL
+#define _TRACE_POWER_GPU_WORK_PERIOD_INTEL
+#endif
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM power
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE xe_power_gpu_work_period_trace
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+
+#if !defined(_TRACE_POWER_GPU_WORK_PERIOD_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_POWER_GPU_WORK_PERIOD_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(gpu_work_period,
+
+	TP_PROTO(
+		u32 gpu_id,
+		u32 uid,
+		u64 start_time_ns,
+		u64 end_time_ns,
+		u64 total_active_duration_ns
+	),
+
+	TP_ARGS(gpu_id, uid, start_time_ns, end_time_ns, total_active_duration_ns),
+
+	TP_STRUCT__entry(
+		__field(u32, gpu_id)
+		__field(u32, uid)
+		__field(u64, start_time_ns)
+		__field(u64, end_time_ns)
+		__field(u64, total_active_duration_ns)
+	),
+
+	TP_fast_assign(
+		__entry->gpu_id = gpu_id;
+		__entry->uid = uid;
+		__entry->start_time_ns = start_time_ns;
+		__entry->end_time_ns = end_time_ns;
+		__entry->total_active_duration_ns = total_active_duration_ns;
+	),
+
+	TP_printk("gpu_id=%u uid=%u start_time_ns=%llu end_time_ns=%llu total_active_duration_ns=%llu",
+		__entry->gpu_id,
+		__entry->uid,
+		__entry->start_time_ns,
+		__entry->end_time_ns,
+		__entry->total_active_duration_ns)
+);
+
+#endif /* _TRACE_POWER_GPU_WORK_PERIOD_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.49.0

