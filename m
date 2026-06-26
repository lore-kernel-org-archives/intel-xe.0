Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47135CDE008
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 08:23:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046BE10F4E8;
	Fri, 26 Jun 2026 08:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+iIrXbb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4214110F4E8
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 08:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782462211; x=1813998211;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JkQryDitrywEPyupUmRVA/xcE95LpP8RhK0eE7KnCh0=;
 b=T+iIrXbbPygi7BMITRe75z5pdLkFJJaZiEYwkiYLg5DVxvbo1neMkfMY
 f6EwqIdFwyhc9UptKmfibzJqTmW5tOi85fE28ks6+MEN4WqPDKYCdK3G8
 0C6pE0jK/s6XBtKCNjNHXVayxJe516ZnjKyARR/P/aocTrDPPEQ8iKHT/
 Adfutxn7H0OqI1QvPNPB6RKZFLW7ieJc5XoIE7iuL1ffh2QkduWinPxIA
 0PW+EV8NVF1vJMDW3MmrXGSwwpzWf8jY/yKB7C6fWAApknVdCBlG6lSEt
 KlBkQ/IhQvSL2MG00tPz2tXrINrzPirpYJChtEp4yl0g6VkKr/5kT4sAB g==;
X-CSE-ConnectionGUID: SpGOJAEZTR+SQieFrNVntQ==
X-CSE-MsgGUID: E0ntQK7tSg2P8+K3uVRuxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="87157065"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="87157065"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 01:23:31 -0700
X-CSE-ConnectionGUID: p5vCTNWFTV2lV5M5xg/uoA==
X-CSE-MsgGUID: AoHtUiAERrOrID2dykglJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="250881039"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 26 Jun 2026 01:23:29 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 mallesh.koujalagi@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2] drm/xe: Improve wedged state management
Date: Fri, 26 Jun 2026 13:49:55 +0530
Message-ID: <20260626081955.278414-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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
v2: Redesign to prevent races
---
 drivers/gpu/drm/xe/xe_device.c       | 99 ++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_device.h       |  8 +--
 drivers/gpu/drm/xe/xe_device_types.h |  8 ++-
 3 files changed, 81 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c5e3e2d1f7c3..aaf4f706888c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -598,6 +598,10 @@ int xe_device_init_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = drmm_mutex_init(&xe->drm, &xe->wedged.lock);
+	if (err)
+		return err;
+
 	err = xe_pm_init_early(xe);
 	if (err)
 		return err;
@@ -920,8 +924,8 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_device *xe = arg;
 
-	if (atomic_read(&xe->wedged.flag))
-		xe_pm_runtime_put(xe);
+	if (atomic_read(&xe->wedged.perm))
+		xe_device_wedged_put(xe);
 }
 
 int xe_device_probe(struct xe_device *xe)
@@ -1387,6 +1391,44 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
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
+bool xe_device_wedged(struct xe_device *xe)
+{
+	return atomic_read(&xe->wedged.ref);
+}
+
 /**
  * xe_device_set_wedged_method - Set wedged recovery method
  * @xe: xe device instance
@@ -1427,36 +1469,39 @@ void xe_device_declare_wedged(struct xe_device *xe)
 		return;
 	}
 
-	if (!atomic_xchg(&xe->wedged.flag, 1)) {
-		xe->needs_flr_on_fini = true;
-		xe_pm_runtime_get_noresume(xe);
-		drm_err(&xe->drm,
-			"CRITICAL: Xe has declared device %s as wedged.\n"
-			"IOCTLs and executions are blocked.\n"
-			"For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
-			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
-			dev_name(xe->drm.dev));
-	}
+	mutex_lock(&xe->wedged.lock);
+
+	if (atomic_xchg(&xe->wedged.perm, 1))
+		goto out;
+
+	xe_device_wedged_get(xe);
+	xe->needs_flr_on_fini = true;
+	drm_err(&xe->drm,
+		"CRITICAL: Xe has declared device %s as wedged.\n"
+		"IOCTLs and executions are blocked.\n"
+		"For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
+		"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
+		dev_name(xe->drm.dev));
 
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
index d61fdb362f91..cad72b17437c 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -194,11 +194,9 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
 void xe_device_td_flush(struct xe_device *xe);
 void xe_device_l2_flush(struct xe_device *xe);
 
-static inline bool xe_device_wedged(struct xe_device *xe)
-{
-	return atomic_read(&xe->wedged.flag);
-}
-
+void xe_device_wedged_get(struct xe_device *xe);
+void xe_device_wedged_put(struct xe_device *xe);
+bool xe_device_wedged(struct xe_device *xe);
 void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
 void xe_device_declare_wedged(struct xe_device *xe);
 int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4e2f115f14e2..45af05b6323e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -487,14 +487,18 @@ struct xe_device {
 
 	/** @wedged: Struct to control Wedged States and mode */
 	struct {
-		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
-		atomic_t flag;
+		/** @wedged.perm: Permanently wedged, needs cleanup on fini */
+		atomic_t perm;
+		/** @wedged.ref: Refcount for wedged device, blocks critical path execution */
+		atomic_t ref;
 		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
 		enum xe_wedged_mode mode;
 		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
 		unsigned long method;
 		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
 		bool inconsistent_reset;
+		/** @wedged.lock: Lock protecting wedged state */
+		struct mutex lock;
 	} wedged;
 
 	/** @bo_device: Struct to control async free of BOs */
-- 
2.43.0

