Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F6ECAC5BC
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 11:20:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C5610EA2B;
	Fri, 26 Sep 2025 11:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GVexP1Tr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57A810EA1F
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 11:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758885614; x=1790421614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2MC5kTUTinDO3EHFQmx9py3SLY+WwYX1socv4s3A0wk=;
 b=GVexP1Tr0bHIbgA4cxtQ6sHfuxzfwpFe7xAJkZ8Lyp/0+cQFt7EhkkDs
 9/IYOnE2YkBaQpQEGMwDgHAlLbcqyvF94czQbVor+oEfGd55igu8rOTt/
 PaBp7hvlQdiu6dJenlwMyFS/Ak32Tlf2cApTDoCZnNaqfkTUopnHTfOVq
 MM+SzgQULpV+uEudaLUd8pZOFJ7t57CsMLlDnrJ9oDI/lr2M0hSTkvj4j
 mH+xQDG+Nlx9W/3S2H0G8hTsqDbAmxjMda8avQguvvn1+2c/ekm12hrJ0
 UP3rLXz9mUNN3rJx8uxDaTbwVdppPRUsoUAxXbCgAAQ0gsusIFANLXwi9 w==;
X-CSE-ConnectionGUID: FTeOJ/mBTeOZuP+A5QFUfg==
X-CSE-MsgGUID: fU55N2BuTmKQL0iiyQ9VUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72314424"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="72314424"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 04:20:14 -0700
X-CSE-ConnectionGUID: RV1HCTQBRyy1wC0zvOpvpg==
X-CSE-MsgGUID: 4gjocA47Rb+Advntfush3Q==
X-ExtLoop1: 1
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by fmviesa003.fm.intel.com with ESMTP; 26 Sep 2025 04:20:11 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v4 7/9] drm/xe: Add a Kconfig option for GPU work period
Date: Fri, 26 Sep 2025 10:45:18 +0000
Message-ID: <20250926104521.1815428-8-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250926104521.1815428-1-aakash.deep.sarkar@intel.com>
References: <20250926104521.1815428-1-aakash.deep.sarkar@intel.com>
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
 drivers/gpu/drm/xe/Makefile        |  2 +-
 drivers/gpu/drm/xe/xe_device.c     |  1 -
 drivers/gpu/drm/xe/xe_exec_queue.c |  5 +++--
 drivers/gpu/drm/xe/xe_user.h       | 27 ++++++++++++++++++++++++++-
 drivers/gpu/trace/Kconfig          | 12 ++++++++++++
 5 files changed, 42 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index ff6b584f3293..6fc23367bdfe 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -333,7 +333,7 @@ ifeq ($(CONFIG_DEBUG_FS),y)
 
 	xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
 
-	xe-y += xe_user.o
+	xe-$(CONFIG_TRACE_GPU_WORK_PERIOD) += xe_user.o
 
 	xe-$(CONFIG_DRM_XE_DISPLAY) += \
 		i915-display/intel_display_debugfs.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5569a27abb09..c34da72e5c9a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -486,7 +486,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
 
 	xa_init_flags(&xe->work_period.users, XA_FLAGS_ALLOC1);
-
 	mutex_init(&xe->work_period.lock);
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6eb34c62c779..d5013d546348 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -915,9 +915,10 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
 	q->xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
 
-	// Accumulate the runtime in nanosec for this queue into the xe file.
+
+	// Accumulate the runtime in ns for this queue
 	q->xef->active_duration_ns +=
-		xe_gt_clock_interval_to_ns(gt, (new_ts - old_ts));
+			xe_gt_clock_interval_to_ns(gt, (new_ts - old_ts));
 
 	drm_dev_exit(idx);
 }
diff --git a/drivers/gpu/drm/xe/xe_user.h b/drivers/gpu/drm/xe/xe_user.h
index ded816be7334..e4b726f989a4 100644
--- a/drivers/gpu/drm/xe/xe_user.h
+++ b/drivers/gpu/drm/xe/xe_user.h
@@ -72,12 +72,38 @@ struct xe_user {
 	u64 last_timestamp_ns;
 };
 
+#if IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD)
+
 int xe_user_init(struct xe_device *xe, struct xe_file *xef, unsigned int uid);
 
 void xe_user_cancel_workers(struct xe_device *xe);
 
 void xe_user_resume_workers(struct xe_device *xe);
 
+void __xe_user_free(struct kref *kref);
+
+#else
+
+static inline
+int xe_user_init(struct xe_device *xe, struct xe_file *xef, unsigned int uid)
+{
+	return 0;
+}
+
+static inline void __xe_user_free(struct kref *kref)
+{
+}
+
+static inline void xe_user_cancel_workers(struct xe_device *xe)
+{
+}
+
+static inline void xe_user_resume_workers(struct xe_device *xe)
+{
+}
+
+#endif // CONFIG_TRACE_GPU_WORK_PERIOD
+
 static inline struct xe_user *
 xe_user_get_unless_zero(struct xe_user *user)
 {
@@ -93,7 +119,6 @@ xe_user_get(struct xe_user *user)
 	return user;
 }
 
-void __xe_user_free(struct kref *kref);
 
 static inline void xe_user_put(struct xe_user *user)
 {
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

