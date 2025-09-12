Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A84CAC582
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 09:36:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C0410EBE9;
	Fri, 12 Sep 2025 09:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m6W6ZmKt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5017210EBE9
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 09:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757669806; x=1789205806;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9pLk+gJcTm8O/HEMlOEYhAlUQNO3mkTMKpMuQ5svp5k=;
 b=m6W6ZmKtDAHYi/D3ae/f7CcMi5z6mrAQ9QH8p8Ez7eukZVbGozxR1T7F
 Dsjzoz3y6Si/O8l1LuUb2/P3559fL34nkFM2R5HcbHu0WhVbAkOHVaL+p
 9Fj5Dk8U1oqm09OL2AoeL1yAoqDdEhtDJzcGygE67NGZbT4rEHtlyRz35
 7cg+Idyc/Qh0QC4PmHoGxkwF+qexqHEY2xChFTfyeMyMPbCXoDaiBcDRy
 dByGoLrgJcsN92tzzbCPYCLaUNyl6CJ0YaWENYY25BrgrvoyJkIbWqndA
 DreS5NrLAjAi9dlDMd7y3z3Gzjw47bIajscAKqPcFL6zNMg2sgsVkZtNo w==;
X-CSE-ConnectionGUID: dst/FyGITga+siFOYRb8qg==
X-CSE-MsgGUID: V0bAOalGS3Oc1mQkXjd06A==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="60159848"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="60159848"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 02:36:46 -0700
X-CSE-ConnectionGUID: pCN//ugZTfSW4nj6k8j67g==
X-CSE-MsgGUID: UKPqiFzSScKFJGxt2yy6kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="174311725"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by fmviesa008.fm.intel.com with ESMTP; 12 Sep 2025 02:36:43 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v2 7/9] Add a Kconfig option for GPU work period
Date: Fri, 12 Sep 2025 09:03:50 +0000
Message-ID: <20250912090354.2619418-8-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250912090354.2619418-1-aakash.deep.sarkar@intel.com>
References: <20250912090354.2619418-1-aakash.deep.sarkar@intel.com>
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

Since this requirement is intended only for Android, there's
no reason to have it enabled by default in other distributions.
So, better to have it guarded by a Kconfig option.

Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
---
 drivers/gpu/drm/xe/Makefile        |   2 +-
 drivers/gpu/drm/xe/xe_device.c     | 116 +++++++++++++++--------------
 drivers/gpu/drm/xe/xe_exec_queue.c |   9 ++-
 drivers/gpu/drm/xe/xe_user.h       |  13 ++++
 drivers/gpu/trace/Kconfig          |  12 +++
 5 files changed, 94 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 89212fc7ef44..9cc8743b8d7f 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -325,7 +325,7 @@ ifeq ($(CONFIG_DEBUG_FS),y)
 
 	xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
 
-	xe-y += xe_user.o
+	xe-$(CONFIG_TRACE_GPU_WORK_PERIOD) += xe_user.o
 
 	xe-$(CONFIG_DRM_XE_DISPLAY) += \
 		i915-display/intel_display_debugfs.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b4692d45c7e9..569f3890bde2 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -110,64 +110,69 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 
 	task = get_pid_task(rcu_access_pointer(file->pid), PIDTYPE_PID);
 	if (task) {
-		cred = get_task_cred(task);
-		if (cred) {
-			uid = (unsigned int) cred->euid.val;
-			put_cred(cred);
+		if (IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD)) {
+			cred = get_task_cred(task);
+			if (cred) {
+				uid = (unsigned int) cred->euid.val;
+				put_cred(cred);
+			}
 		}
 		xef->process_name = kstrdup(task->comm, GFP_KERNEL);
 		xef->pid = task->pid;
 		put_task_struct(task);
 	}
 
-	if (uid < 0)
-		return -ENOENT;
+	if (IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD)) {
+		if (uid < 0)
+			return -ENOENT;
 
-	INIT_LIST_HEAD(&xef->user_link);
-	/*
-	 * Check if the calling process/uid has already been registered
-	 * with the xe device during a previous open call. If so then
-	 * take a reference to this xe user and add this xe file to the
-	 * filelist belonging to this xe user
-	 */
-	user = xe_user_lookup(xe, uid);
-	if (!user) {
+		INIT_LIST_HEAD(&xef->user_link);
 		/*
-		 * We couldn't find an existing xe user for the calling process.
-		 * Allocate a new struct xe_user and register it with this xe
-		 * device
+		 * Check if the calling process/uid has already been registered
+		 * with the xe device during a previous open call. If so then
+		 * take a reference to this xe user and add this xe file to the
+		 * filelist belonging to this xe user
 		 */
-		user = xe_user_alloc();
-		if (!user)
-			return -ENOMEM;
-
-		user->uid = uid;
-		user->last_timestamp_ns = ktime_get_raw_ns();
-		user->xe = xe;
-
-		ret = xa_alloc(&xe->work_period.users, &idx, user, xa_limit_32b, GFP_KERNEL);
-		if (ret < 0)
-			return ret;
-
-		user->id = idx;
-		drm_dev_get(&xe->drm);
-
-		xe_user_get(user);
-		if (!schedule_delayed_work(&user->delay_work,
+		user = xe_user_lookup(xe, uid);
+		if (!user) {
+			/*
+			 * We couldn't find an existing xe user for the calling process.
+			 * Allocate a new struct xe_user and register it with this xe
+			 * device
+			 */
+			user = xe_user_alloc();
+			if (!user)
+				return -ENOMEM;
+
+			user->uid = uid;
+			user->last_timestamp_ns = ktime_get_raw_ns();
+			user->xe = xe;
+
+			ret = xa_alloc(&xe->work_period.users, &idx, user,
+					xa_limit_32b, GFP_KERNEL);
+			if (ret < 0)
+				return ret;
+
+			user->id = idx;
+			drm_dev_get(&xe->drm);
+
+			xe_user_get(user);
+			if (!schedule_delayed_work(&user->delay_work,
 					msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL)))
-			xe_user_put(user);
-	}
+				xe_user_put(user);
+		}
 
-	mutex_lock(&user->lock);
-	list_add(&xef->user_link, &user->filelist);
-	mutex_unlock(&user->lock);
+		mutex_lock(&user->lock);
+		list_add(&xef->user_link, &user->filelist);
+		mutex_unlock(&user->lock);
 
-	/*
-	 * We have already taken a reference to the xe_user in
-	 * xe_user_lookup in case this xe file doesn't own the
-	 * pointer to the xe_user.
-	 */
-	xef->user = user;
+		/*
+		 * We have already taken a reference to the xe_user in
+		 * xe_user_lookup, in case this xe file doesn't own the
+		 * pointer to the xe_user.
+		 */
+		xef->user = user;
+	} // CONFIG_TRACE_GPU_WORK_PERIOD
 	return 0;
 }
 
@@ -183,11 +188,13 @@ static void xe_file_destroy(struct kref *ref)
 	xe_drm_client_put(xef->client);
 	kfree(xef->process_name);
 
-	if (xef->user) {
-		mutex_lock(&xef->user->lock);
-		list_del(&xef->user_link);
-		xe_user_put(xef->user);
-		mutex_unlock(&xef->user->lock);
+	if (IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD)) {
+		if (xef->user) {
+			mutex_lock(&xef->user->lock);
+			list_del(&xef->user_link);
+			xe_user_put(xef->user);
+			mutex_unlock(&xef->user->lock);
+		}
 	}
 	kfree(xef);
 }
@@ -523,9 +530,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
 
-	xa_init_flags(&xe->work_period.users, XA_FLAGS_ALLOC1);
-
-	mutex_init(&xe->work_period.lock);
+	if (IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD)) {
+		xa_init_flags(&xe->work_period.users, XA_FLAGS_ALLOC1);
+		mutex_init(&xe->work_period.lock);
+	}
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
 		/* Trigger a large asid and an early asid wrap. */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 2ee8a475f5ed..6a24463e13a4 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -907,9 +907,12 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
 	q->xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
 
-	// Accumulate the runtime in nanosec for this queue into the xe file.
-	q->xef->active_duration_ns +=
-		xe_gt_clock_interval_to_ns(gt, (new_ts - old_ts));
+	if (IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD)) {
+
+		// Accumulate the runtime in ns for this queue
+		q->xef->active_duration_ns +=
+			xe_gt_clock_interval_to_ns(gt, (new_ts - old_ts));
+	}
 
 	drm_dev_exit(idx);
 }
diff --git a/drivers/gpu/drm/xe/xe_user.h b/drivers/gpu/drm/xe/xe_user.h
index 80948199e743..7c30bf470aa7 100644
--- a/drivers/gpu/drm/xe/xe_user.h
+++ b/drivers/gpu/drm/xe/xe_user.h
@@ -72,8 +72,21 @@ struct xe_user {
 	u64 last_timestamp_ns;
 };
 
+#if IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD)
+
 struct xe_user *xe_user_alloc(void);
 struct xe_user *xe_user_lookup(struct xe_device *xe, u32 uid);
+#else
+static inline struct xe_user *xe_user_alloc(void)
+{
+	return NULL;
+}
+
+static inline struct xe_user *xe_user_lookup(struct xe_device *xe, u32 uid)
+{
+	return NULL;
+}
+#endif // CONFIG_TRACE_GPU_WORK_PERIOD
 
 static inline struct xe_user *
 xe_user_get_unless_zero(struct xe_user *user)
diff --git a/drivers/gpu/trace/Kconfig b/drivers/gpu/trace/Kconfig
index cd3d19c4a201..34f2e08cf1be 100644
--- a/drivers/gpu/trace/Kconfig
+++ b/drivers/gpu/trace/Kconfig
@@ -11,3 +11,15 @@ config TRACE_GPU_MEM
 	  Tracepoint availability varies by GPU driver.
 
 	  If in doubt, say "N".
+
+config TRACE_GPU_WORK_PERIOD
+	bool "Enable GPU work period tracepoint"
+	default n
+	help
+	  Choose this option to enable tracepoint for tracking
+	  GPU usage based on the UID. Intended for performance
+	  profiling and required for Android.
+
+	  Tracepoint availability varies by GPU driver.
+
+	  If in doubt, say "N".
-- 
2.49.0

