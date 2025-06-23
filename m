Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CA9C77B7F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 09:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50DD10E33E;
	Mon, 23 Jun 2025 09:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hh7eRLn4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF16A10E2C2
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 09:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750671470; x=1782207470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CG/BElZZps2tihqQWZJmsdZV5myl3wDaAQ0r/Sbt84Y=;
 b=Hh7eRLn4EdON1kkv0heGMBDm6qGu2tdfqMiecpGQ7jhHV3u3QknHABlK
 O+9Viq6xM6v/aY3jJ5RJuiuo2yR50uCCKo62ln8nQq7uQF0SGQyi1RbZd
 PfUSaCXEoV49aCbXWClGb71J0xjzHkQwJRsm4CFWfOS2bafhSfQcRWJnx
 qaCqHfeqvbm+quk5jf8ZSs7OqOrPf5//V19fHSrwNKujU9Q57F5i9lFPA
 PfgtTYccjZWxpsus4d0P99wQ1bfP1OT8ATc/Nf1oGM4Fm+tQMxrM/nLs7
 nDECabz4tlWUE53Lvcr7t3aTmlYJfntwZlXNtjFazM+G3H2h0NUus2xlS Q==;
X-CSE-ConnectionGUID: cw+zmv9FT2WCr7BEYxdpqg==
X-CSE-MsgGUID: toscYaIHTFmWPFtNM6qTHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52740328"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52740328"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 02:37:50 -0700
X-CSE-ConnectionGUID: CaaU7j+TSpihC9t40PU1Tw==
X-CSE-MsgGUID: q4irM5H0R/aiduJQNd6+ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="152057642"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 02:37:00 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com
Subject: [PATCH v2 2/5] drm/xe: Add a helper function to set recovery method
Date: Mon, 23 Jun 2025 15:31:05 +0530
Message-ID: <20250623100109.1086459-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250623100109.1086459-1-riana.tauro@intel.com>
References: <20250623100109.1086459-1-riana.tauro@intel.com>
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

Add a helper function to set recovery method. The recovery
method has to be set before declaring the device wedged and sending the
drm wedged uevent. If no method is set, default unbind/re-bind method
will be set

v2: wrap to 80 characters
    move gt wedged before uevent
    fix kernel-doc (Raag)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       | 48 ++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_device.h       |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 3 files changed, 35 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8cfcfff250ca..eaff79257d85 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1121,20 +1121,33 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
 	xe_pm_runtime_put(xe);
 }
 
+/**
+ * xe_device_set_wedged_method - Set wedged recovery method
+ * @xe: xe device instance
+ * @method: recovery method to set
+ *
+ * Set wedged recovery method to be sent using drm wedged uevent.
+ */
+void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
+{
+	xe->wedged.method = method;
+}
+
 /**
  * xe_device_declare_wedged - Declare device wedged
  * @xe: xe device instance
  *
- * This is a final state that can only be cleared with a module
- * re-probe (unbind + bind).
- * In this state every IOCTL will be blocked so the GT cannot be used.
- * In general it will be called upon any critical error such as gt reset
- * failure or guc loading failure. Userspace will be notified of this state
- * through device wedged uevent.
- * If xe.wedged module parameter is set to 2, this function will be called
- * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
- * snapshot capture. In this mode, GT reset won't be attempted so the state of
- * the issue is preserved for further debugging.
+ * This is a final state that can only be cleared with the method specified
+ * in the drm wedged uevent. The method needs to be set using
+ * xe_device_set_wedged_method before declaring the device as wedged or the
+ * default method of reprobe (unbind/re-bind) will be sent. In this state every
+ * IOCTL will be blocked so the GT cannot be used. In general it will be called
+ * upon any critical error such as gt reset failure or guc loading failure or
+ * firmware failure. Userspace will be notified of this state through device
+ * wedged uevent. If xe.wedged module parameter is set to 2, this function will
+ * be called on every single execution timeout (a.k.a. GPU hang) right after
+ * devcoredump snapshot capture. In this mode, GT reset won't be attempted so
+ * the state of the issue is preserved for further debugging.
  */
 void xe_device_declare_wedged(struct xe_device *xe)
 {
@@ -1153,6 +1166,14 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		return;
 	}
 
+	/* If no wedge recovery method is set, use default */
+	if (!xe->wedged.method)
+		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
+					    DRM_WEDGE_RECOVERY_BUS_RESET);
+
+	for_each_gt(gt, xe, id)
+		xe_gt_declare_wedged(gt);
+
 	if (!atomic_xchg(&xe->wedged.flag, 1)) {
 		xe->needs_flr_on_fini = true;
 		drm_err(&xe->drm,
@@ -1162,11 +1183,6 @@ void xe_device_declare_wedged(struct xe_device *xe)
 			dev_name(xe->drm.dev));
 
 		/* Notify userspace of wedged device */
-		drm_dev_wedged_event(&xe->drm,
-				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET,
-				     NULL);
+		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
 	}
-
-	for_each_gt(gt, xe, id)
-		xe_gt_declare_wedged(gt);
 }
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index e4da797a984b..40518af2333b 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -191,6 +191,7 @@ static inline bool xe_device_wedged(struct xe_device *xe)
 }
 
 void xe_device_declare_wedged(struct xe_device *xe);
+void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
 
 struct xe_file *xe_file_get(struct xe_file *xef);
 void xe_file_put(struct xe_file *xef);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 003afb279a5e..d898238e8994 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -564,6 +564,8 @@ struct xe_device {
 		atomic_t flag;
 		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
 		int mode;
+		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
+		unsigned long method;
 	} wedged;
 
 	/** @bo_device: Struct to control async free of BOs */
-- 
2.47.1

