Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D6BCAC5A5
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 12:21:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A5710E8F8;
	Thu, 25 Sep 2025 12:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OWtKpPsL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E0410E8FC
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 12:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758802909; x=1790338909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ehlyVNSxFnD7tutZjkoYxagceif6UX6Sr2OebdeCCVo=;
 b=OWtKpPsLNbpCS0XewuMTC9e1YuBIIlGdMefjeOedP5mo8MFfV9PtG/8y
 wA1ookhHSNHn7tBEW3OHLrxWfmPSvdeo1JxdhIb7JmSVRq2LwBOrSZD1c
 4wcrH0pyEONrZ+lalsHXpeK0MF/+IDQr2s6cv5pt+R6IzHCHIsxNEQphL
 e9ZPQcSpQe7V7+4KkN8tvuOB4IBjIP+r9X1N7SOM9jZM4eTGKOLW0gZ7q
 i1szUYUm74f4L7DqikRs4KiTou6B6aONqUsRPXQ8rz2mnrog4meQ06zEj
 sIR51FOq7cKaUm2o5P3y1jo1r9+BgBvOfbwAQqFLf7cyXRepmeQe6CclZ A==;
X-CSE-ConnectionGUID: Ymtnw4/TRiugNJyRP9RIWQ==
X-CSE-MsgGUID: L1MM3ee0T1KGri+4A24stg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60818064"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="60818064"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 05:21:49 -0700
X-CSE-ConnectionGUID: Rd2tl9hcTUejZUA5AR3BMA==
X-CSE-MsgGUID: EKCSvw8IQk2E6hIIpLUYCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="181328327"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by orviesa003.jf.intel.com with ESMTP; 25 Sep 2025 05:21:46 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v4 7/8] drm/xe: Add a Kconfig option for GPU work period
Date: Thu, 25 Sep 2025 11:46:57 +0000
Message-ID: <20250925114700.68090-8-aakash.deep.sarkar@intel.com>
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
index 8e368346b6d4..30d9f2747eab 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -485,7 +485,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
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
index fc976beed2ad..cf665995ddb8 100644
--- a/drivers/gpu/drm/xe/xe_user.h
+++ b/drivers/gpu/drm/xe/xe_user.h
@@ -72,12 +72,38 @@ struct xe_user {
 	u64 last_timestamp_ns;
 };
 
+#if IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD)
+
 int xe_user_init(struct xe_device* xe, struct xe_file* xef, unsigned int uid);
 
 void xe_user_cancel_workers(struct xe_device* xe);
 
 void xe_user_resume_workers(struct xe_device* xe);
 
+void __xe_user_free(struct kref *kref);
+
+#else
+
+static inline
+int xe_user_init(struct xe_device* xe, struct xe_file* xef, unsigned int uid)
+{
+	return 0;
+}
+
+static inline void __xe_user_free(struct kref *kref)
+{
+}
+
+void xe_user_cancel_workers(struct xe_device* xe)
+{
+}
+
+void xe_user_resume_workers(struct xe_device* xe)
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

