Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2D0C5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 11:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E164610E284;
	Fri, 21 Aug 2026 11:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jOpwCTPW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD9B10E2A1
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 11:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787311547; x=1818847547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HxFYbjXwy0O0qLPWTOThi2hWs5p+j3dOF23td9BThGM=;
 b=jOpwCTPW9twBgvXq5aw+Clzrme7OI3rAzDZU/iKTkjcyRiACGHvvbCLf
 +J5XBsiO+DTAvCbSzSioz82y2LNMT+svQQJkOyWp4uSRb2zFZB7qW87SP
 pRZ52QfeAIN2JW3x2LTsQMbCxaCNj89v/ZkbBcjndaBxubXbD25j5lKJb
 HwYIjNG5oqLHj+hxQry92WZdf7wiWPkxA58OFk/nNTycAxsE5w61pLOLp
 WCxHOQtLdVHkSJ4B1R2cbK7cPO2Uw3iZMokgobY6fcEJjMtEyruOB6NJy
 n4FrtpZDrtsmyeqKcSrHmWik9n8ZZKcrO676xD/O9DQeMGownKelLtb/0 w==;
X-CSE-ConnectionGUID: LefXeiXpRCy25HI/Rj+7rQ==
X-CSE-MsgGUID: iLPeGe3SSjCWeF9AYJCFyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="90377565"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="90377565"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 04:25:47 -0700
X-CSE-ConnectionGUID: khUmOP3PRtGk8jNDK90yiw==
X-CSE-MsgGUID: zHu3tCiiSVeSIbvLhwnJyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="304523449"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 21 Aug 2026 04:25:42 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, dev@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, lukas@wunner.de,
 daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v10 08/10] drm/xe: Introduce temporary device wedging
Date: Fri, 21 Aug 2026 16:53:30 +0530
Message-ID: <20260821112436.545405-9-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821112436.545405-1-raag.jadav@intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
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

Currently, wedged state is serving a single usecase where the device is
permanently declared wedged, but this doesn't allow any wedged state
management for runtime usecases. In preparation of usecases which require
to facilitate temporary device wedging, convert wedged.flag to wedged.ref
which serves as a driver internal refcount for wedged state and blocks
critical path execution during device lifetime. While at it, introduce
wedged.perm which signifies permanent device wedging and operates
independent of the refcount allowing relevant cleanup action on unwind
path.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 v9: Redesign to prevent races (Sashiko)
v10: Spell out temporary device wedging in subject (Lukasz)
---
 drivers/gpu/drm/xe/xe_device.c       | 106 ++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_device.h       |   8 +-
 drivers/gpu/drm/xe/xe_device_types.h |   8 +-
 drivers/gpu/drm/xe/xe_pci.c          |   1 +
 drivers/gpu/drm/xe/xe_pci_error.c    |  10 ++-
 5 files changed, 96 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0ffed5d1cadb..8317bb9b81b4 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -607,6 +607,10 @@ int xe_device_init_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = drmm_mutex_init(&xe->drm, &xe->wedged.lock);
+	if (err)
+		return err;
+
 	err = xe_pm_init_early(xe);
 	if (err)
 		return err;
@@ -930,8 +934,10 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_device *xe = arg;
 
-	if (atomic_read(&xe->wedged.flag))
-		xe_pm_runtime_put(xe);
+	if (xe->wedged.perm)
+		xe_device_wedged_put(xe);
+
+	xe_assert(xe, !xe_device_wedged(xe));
 }
 
 #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
@@ -1433,6 +1439,50 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
  *   firmware and restore device to normal operation.
  */
 
+/**
+ * xe_device_wedged_get() - Acquire wedged reference
+ * @xe: xe device instance
+ *
+ * Get runtime PM reference and block critical path execution.
+ */
+void xe_device_wedged_get(struct xe_device *xe)
+{
+	int ref;
+
+	/* We should not be runtime suspending as long as critical paths are blocked */
+	xe_pm_runtime_get_noresume(xe);
+
+	ref = atomic_inc_return(&xe->wedged.ref);
+	xe_assert(xe, ref > 0);
+}
+
+/**
+ * xe_device_wedged_put() - Relinquish wedged reference
+ * @xe: xe device instance
+ *
+ * Restore critical path execution and put runtime PM reference.
+ */
+void xe_device_wedged_put(struct xe_device *xe)
+{
+	int ref;
+
+	ref = atomic_dec_return(&xe->wedged.ref);
+	xe_assert(xe, ref >= 0);
+
+	xe_pm_runtime_put(xe);
+}
+
+/**
+ * xe_device_wedged() - Check for wedged device
+ * @xe: xe device instance
+ *
+ * Returns: %true if device is wedged, %false otherwise.
+ */
+bool xe_device_wedged(struct xe_device *xe)
+{
+	return atomic_read(&xe->wedged.ref);
+}
+
 /**
  * xe_device_set_wedged_method - Set wedged recovery method
  * @xe: xe device instance
@@ -1476,36 +1526,40 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		return;
 	}
 
-	if (!atomic_xchg(&xe->wedged.flag, 1)) {
-		xe->needs_flr_on_fini = true;
-		xe_pm_runtime_get_noresume(xe);
+	mutex_lock(&xe->wedged.lock);
 
-		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
-		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
-			    "For recovery procedure, refer to %s\n"
-			    "Please file a _new_ bug report at %s\n",
-			    WEDGED_URL, XE_BUG_URL);
-	}
+	if (xe->wedged.perm)
+		goto out;
+
+	xe_device_wedged_get(xe);
+	xe->wedged.perm = true;
+	xe->needs_flr_on_fini = true;
+
+	xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
+	xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
+			"For recovery procedure, refer to %s\n"
+			"Please file a _new_ bug report at %s\n",
+			WEDGED_URL, XE_BUG_URL);
 
 	for_each_gt(gt, xe, id)
 		xe_gt_declare_wedged(gt);
 
-	if (xe_device_wedged(xe)) {
-		/*
-		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
-		 * hangs, so wedge the device with 'none' recovery method and have
-		 * it available to the user for debugging.
-		 */
-		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
-			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
-		/* If no wedge recovery method is set, use default */
-		else if (!xe->wedged.method)
-			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
-						    DRM_WEDGE_RECOVERY_BUS_RESET);
+	/*
+	 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
+	 * hangs, so wedge the device with 'none' recovery method and have
+	 * it available to the user for debugging.
+	 */
+	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
+		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
+	/* If no wedge recovery method is set, use default */
+	else if (!xe->wedged.method)
+		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
+					    DRM_WEDGE_RECOVERY_BUS_RESET);
 
-		/* Notify userspace of wedged device */
-		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
-	}
+	/* Notify userspace of wedged device */
+	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
+out:
+	mutex_unlock(&xe->wedged.lock);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 67083915320a..8fff3fd489c7 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -209,11 +209,6 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
 void xe_device_td_flush(struct xe_device *xe);
 void xe_device_l2_flush(struct xe_device *xe);
 
-static inline bool xe_device_wedged(struct xe_device *xe)
-{
-	return atomic_read(&xe->wedged.flag);
-}
-
 #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
 static inline bool xe_debug_page_size_supported(struct xe_device *xe)
 {
@@ -262,6 +257,9 @@ static inline bool xe_debug_page_size_mode_is_mixed(struct xe_device *xe)
 }
 #endif
 
+void xe_device_wedged_get(struct xe_device *xe);
+void xe_device_wedged_put(struct xe_device *xe);
+bool xe_device_wedged(struct xe_device *xe);
 void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
 void xe_device_declare_wedged(struct xe_device *xe);
 int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 180d450a6deb..7be3f15bf7a0 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -526,14 +526,18 @@ struct xe_device {
 
 	/** @wedged: Struct to control Wedged States and mode */
 	struct {
-		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
-		atomic_t flag;
+		/** @wedged.ref: Refcount for wedged device, blocks critical path execution */
+		atomic_t ref;
 		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
 		enum xe_wedged_mode mode;
 		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
 		unsigned long method;
 		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
 		bool inconsistent_reset;
+		/** @wedged.perm: Permanently wedged, needs cleanup on fini */
+		bool perm;
+		/** @wedged.lock: Lock protecting wedged state */
+		struct mutex lock;
 	} wedged;
 
 	/** @devres_group: devres group */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1e04e8ef2611..9a6c8e16a0b5 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1390,6 +1390,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	 */
 	xe_assert(xe, !IS_SRIOV_VF(xe));
 	xe_assert(xe, !pci_num_vf(pdev));
+	xe_assert(xe, !xe_device_wedged(xe));
 
 	err = xe_pm_runtime_suspend(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
index 79ce0c671549..48466d726eae 100644
--- a/drivers/gpu/drm/xe/xe_pci_error.c
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -25,8 +25,10 @@ static void prepare_device_for_reset(struct pci_dev *pdev)
 	 * xe_device_wedged_fini() releases runtime pm if wedged flag is set, so acquire a runtime
 	 * pm reference to avoid underflow.
 	 */
-	if (!atomic_xchg(&xe->wedged.flag, 1))
-		xe_pm_runtime_get_noresume(xe);
+	xe_device_wedged_get(xe);
+
+	/* TODO: We shouldn't be doing such ugly hacks, reuse FLR helpers and drop this. */
+	xe->wedged.perm = true;
 
 	xe_device_set_in_reset(xe);
 
@@ -126,7 +128,7 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
 	xe = pdev_to_xe_device(pdev);
 
 	/* Wedge the device to prevent I/O operations till the resume callback */
-	atomic_set(&xe->wedged.flag, 1);
+	xe_device_wedged_get(xe);
 
 	return PCI_ERS_RESULT_RECOVERED;
 }
@@ -137,7 +139,7 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
 
 	xe_info(xe, "PCI error: resume\n");
 
-	atomic_set(&xe->wedged.flag, 0);
+	xe_device_wedged_put(xe);
 }
 
 const struct pci_error_handlers xe_pci_error_handlers = {
-- 
2.43.0

