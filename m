Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A25ECAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 14:56:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C410B10E41E;
	Mon,  6 Oct 2025 14:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iPwpBmh+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0483A10E436
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 14:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759762617; x=1791298617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1jvifPg2e3XLQh6Kq5sEsE6ecBv9VSIwlUsckY0D7xk=;
 b=iPwpBmh+VBPcRxz/vI/rnqYO3ukzKs/i/QQ1vGG9/h+9ogKTl34zI82p
 XO+ieHW7rzXMYkgsxNBU32W0u6mQFBcljWTslUdUvDeJ4WQPMx5IxYY2h
 iWIeMzBA3Fn0h8I9v/RDpIZ+TihEBI3m1UmRZ5Y2CEUbkZmwBVpeDqzYT
 Hq9uMMudi1KCQy+LkTFrGQELa2lm2XRe3vAVecIYkAvABx9XymWjcnU+f
 MzzMFGFP98j+D0PmS66f5ttCBOsHOw7WPMHTVu1b5WlkM0qCDT9frcW/8
 lZuXzklTuhPj3SYIY85SGFxTifg6yn8pOJQ3tyC75Q1MSTP4motNhTcEE Q==;
X-CSE-ConnectionGUID: V7WsjALbR1W7yIeeXN+NnA==
X-CSE-MsgGUID: EAvPz4mhR0mRS2frCtAlUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61143178"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="61143178"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 07:56:57 -0700
X-CSE-ConnectionGUID: CITIvadQQMe5S9a9RuSmnw==
X-CSE-MsgGUID: jL6uh57bRDam7fDFV3hdeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="179507662"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by orviesa009.jf.intel.com with ESMTP; 06 Oct 2025 07:56:54 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 jani.nikula@intel.com, ashutosh.dixit@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v5 6/8] drm/xe: Add a Kconfig option for GPU work period
Date: Mon,  6 Oct 2025 14:20:27 +0000
Message-ID: <20251006142034.674435-7-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251006142034.674435-1-aakash.deep.sarkar@intel.com>
References: <20251006142034.674435-1-aakash.deep.sarkar@intel.com>
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
 4 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b078834ec762..738e47afbe89 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -336,7 +336,7 @@ ifeq ($(CONFIG_DEBUG_FS),y)
 
 	xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
 
-	xe-y += xe_user.o
+	xe-$(CONFIG_TRACE_GPU_WORK_PERIOD) += xe_user.o
 
 	xe-$(CONFIG_DRM_XE_DISPLAY) += \
 		i915-display/intel_display_debugfs.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 54ac71d1265d..61ba76144721 100644
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
index 55016ba189f1..0d184464687c 100644
--- a/drivers/gpu/drm/xe/xe_user.h
+++ b/drivers/gpu/drm/xe/xe_user.h
@@ -68,12 +68,38 @@ struct xe_user {
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
@@ -89,7 +115,6 @@ xe_user_get(struct xe_user *user)
 	return user;
 }
 
-void __xe_user_free(struct kref *kref);
 
 static inline void xe_user_put(struct xe_user *user)
 {
-- 
2.49.0

