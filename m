Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A88C61DF0
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 04:27:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B2D10E5CD;
	Mon, 31 Aug 2026 04:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9Ywaeiv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D53C10E5CD
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 04:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788150420; x=1819686420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VYiH2LMqvaJyiZHd9OYcCD+4bJhDI4YkfkbVjhfdB/I=;
 b=m9Ywaeiv4qZPLE9w8QuAH/avamtQf+pmMS/SyokGY6Pc+H5fwSTegpzJ
 exMjOkM/XBq1pgaJSgI4W+aStnLOcWl4xEZ2qh4XAwuQ5EAWzBnwjkrWd
 sPmMmiGqVFGdWYGA8WsBY61X+SJKyipFsgw2w9MNVU7jegd/W6oQrxkHl
 GM341Am4Ud9mdFF/io4wLgHTUDWRt1/jf68ifWhjWHuCiU1coAVMuezOq
 d987TqM9LpnEEQFtaJJxlYTICDlFo+203vFzSZuFq7Gbhs6aU8+n/cslP
 xfqiG67qySFa0MVi8CzynIZDEfT7o+W8RCDlC9ipM6LUzRRrZjZLOze1c w==;
X-CSE-ConnectionGUID: /q5/fzVwTsuH3S4K393TmQ==
X-CSE-MsgGUID: tKHWfZkfQnKJr3vwCBD/yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106072231"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="106072231"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 21:27:00 -0700
X-CSE-ConnectionGUID: 1qJ7WRIMR+mJATvJ2xTofA==
X-CSE-MsgGUID: aLaWeKJpSIOuQmTnN7cvhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="272878110"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa005.jf.intel.com with ESMTP; 30 Aug 2026 21:26:57 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com, lukasz.laguna@intel.com,
 matthew.d.roper@intel.com, matthew.brost@intel.com, rodrigo.vivi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 3/5] drm/xe: Introduce xe_wedge
Date: Mon, 31 Aug 2026 09:55:51 +0530
Message-ID: <20260831042633.1760474-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831042633.1760474-1-raag.jadav@intel.com>
References: <20260831042633.1760474-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Consolidate wedging implementation into a dedicated xe_wedge component
for better maintainability.

No functional impact.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 Documentation/gpu/xe/xe_device.rst |   2 +-
 drivers/gpu/drm/xe/Makefile        |   1 +
 drivers/gpu/drm/xe/xe_device.c     | 186 +-----------------------
 drivers/gpu/drm/xe/xe_device.h     |  11 +-
 drivers/gpu/drm/xe/xe_wedge.c      | 219 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wedge.h      |  20 +++
 6 files changed, 243 insertions(+), 196 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_wedge.c
 create mode 100644 drivers/gpu/drm/xe/xe_wedge.h

diff --git a/Documentation/gpu/xe/xe_device.rst b/Documentation/gpu/xe/xe_device.rst
index d3a022362ade..8baed81580c9 100644
--- a/Documentation/gpu/xe/xe_device.rst
+++ b/Documentation/gpu/xe/xe_device.rst
@@ -6,7 +6,7 @@
 Xe Device Wedging
 ==================
 
-.. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
+.. kernel-doc:: drivers/gpu/drm/xe/xe_wedge.c
    :doc: Xe Device Wedging
 
 ====================
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index adc2de37e768..c739a50b6896 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -152,6 +152,7 @@ xe-y += xe_bb.o \
 	xe_vsec.o \
 	xe_wa.o \
 	xe_wait_user_fence.o \
+	xe_wedge.o \
 	xe_wopcm.o
 
 xe-$(CONFIG_I2C)	+= xe_i2c.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 49e3f6f66588..d3a7034fac01 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -829,10 +829,7 @@ int xe_device_probe_early(struct xe_device *xe)
 	 */
 	assert_lmem_ready(xe);
 
-	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
-			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
-	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
-		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
+	xe_device_wedged_init_early(xe);
 
 	err = xe_device_vram_alloc(xe);
 	if (err)
@@ -924,25 +921,6 @@ static void detect_preproduction_hw(struct xe_device *xe)
 	}
 }
 
-static void wedged_work(struct work_struct *work);
-
-static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
-{
-	struct xe_device *xe = arg;
-
-	disable_work_sync(&xe->wedged.work);
-
-	if (atomic_read(&xe->wedged.flag))
-		xe_pm_runtime_put(xe);
-}
-
-static int xe_device_wedged_init(struct xe_device *xe)
-{
-	INIT_WORK(&xe->wedged.work, wedged_work);
-
-	return drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
-}
-
 #ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
 static int xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
 {
@@ -1405,168 +1383,6 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
 	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
 }
 
-/**
- * DOC: Xe Device Wedging
- *
- * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
- * When device is in wedged state, every IOCTL will be blocked and GT cannot
- * be used. The conditions under which the driver declares the device wedged
- * depend on the wedged mode configuration (see &enum xe_wedged_mode). The
- * default recovery method for a wedged state is rebind/bus-reset.
- *
- * Another recovery method is vendor-specific. Below are the cases that send
- * ``WEDGED=vendor-specific`` recovery method in drm device wedged uevent.
- *
- * Case: Firmware Flash
- * --------------------
- *
- * Identification Hint
- * +++++++++++++++++++
- *
- * ``WEDGED=vendor-specific`` drm device wedged uevent with
- * :ref:`Runtime Survivability mode <xe-survivability-mode>` is used to notify
- * admin/userspace consumer about the need for a firmware flash.
- *
- * Recovery Procedure
- * ++++++++++++++++++
- *
- * Once ``WEDGED=vendor-specific`` drm device wedged uevent is received, follow
- * the below steps
- *
- * - Check Runtime Survivability mode sysfs.
- *   If enabled, firmware flash is required to recover the device.
- *
- *   /sys/bus/pci/devices/<device>/survivability_mode
- *
- * - Admin/userspace consumer can use firmware flashing tools like fwupd to flash
- *   firmware and restore device to normal operation.
- */
-
-/**
- * xe_device_set_wedged_method - Set wedged recovery method
- * @xe: xe device instance
- * @method: recovery method to set
- *
- * Set wedged recovery method to be sent in drm wedged uevent.
- */
-void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
-{
-	xe->wedged.method = method;
-}
-
-static void wedged_work(struct work_struct *work)
-{
-	struct xe_device *xe = container_of(work, struct xe_device, wedged.work);
-
-	/*
-	 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
-	 * hangs, so wedge the device with 'none' recovery method and have
-	 * it available to the user for debugging.
-	 */
-	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
-		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
-	/* If no wedge recovery method is set, use default */
-	else if (!xe->wedged.method)
-		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
-					    DRM_WEDGE_RECOVERY_BUS_RESET);
-
-	/* Notify userspace of wedged device */
-	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
-}
-
-#define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
-#define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
-
-/**
- * xe_device_declare_wedged - Declare device wedged
- * @xe: xe device instance
- *
- * This is a final state that can only be cleared with the recovery method
- * specified in the drm wedged uevent. The method can be set using
- * xe_device_set_wedged_method before declaring the device as wedged. If no method
- * is set, reprobe (unbind/re-bind) will be sent by default.
- *
- * In this state every IOCTL will be blocked so the GT cannot be used.
- * In general it will be called upon any critical error such as gt reset
- * failure or guc loading failure. Userspace will be notified of this state
- * through device wedged uevent.
- * If xe.wedged module parameter is set to 2, this function will be called
- * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
- * snapshot capture. In this mode, GT reset won't be attempted so the state of
- * the issue is preserved for further debugging.
- */
-void xe_device_declare_wedged(struct xe_device *xe)
-{
-	struct xe_gt *gt;
-	u8 id;
-
-	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
-		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
-		return;
-	}
-
-	if (!atomic_xchg(&xe->wedged.flag, 1)) {
-		xe->needs_flr_on_fini = true;
-		xe_pm_runtime_get_noresume(xe);
-
-		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
-		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
-			    "For recovery procedure, refer to %s\n"
-			    "Please file a _new_ bug report at %s\n",
-			    WEDGED_URL, XE_BUG_URL);
-
-		for_each_gt(gt, xe, id)
-			xe_gt_declare_wedged(gt);
-
-		schedule_work(&xe->wedged.work);
-	}
-}
-
-/**
- * xe_device_validate_wedged_mode - Check if given mode is supported
- * @xe: the &xe_device
- * @mode: requested mode to validate
- *
- * Check whether the provided wedged mode is supported.
- *
- * Return: 0 if mode is supported, error code otherwise.
- */
-int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
-{
-	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
-		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
-		return -EINVAL;
-	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && (IS_SRIOV_VF(xe) ||
-		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
-		drm_dbg(&xe->drm, "wedged_mode: (%u) %s mode is not supported for %s\n",
-			mode, xe_wedged_mode_to_string(mode),
-			xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
-		return -EPERM;
-	}
-
-	return 0;
-}
-
-/**
- * xe_wedged_mode_to_string - Convert enum value to string.
- * @mode: the &xe_wedged_mode to convert
- *
- * Returns: wedged mode as a user friendly string.
- */
-const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode)
-{
-	switch (mode) {
-	case XE_WEDGED_MODE_NEVER:
-		return "never";
-	case XE_WEDGED_MODE_UPON_CRITICAL_ERROR:
-		return "upon-critical-error";
-	case XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET:
-		return "upon-any-hang-no-reset";
-	default:
-		return "<invalid>";
-	}
-}
-
 /**
  * xe_device_asid_to_vm() - Find VM from ASID
  * @xe: the &xe_device
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 6c4cfaebc44a..c984972bd0f8 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -11,6 +11,7 @@
 #include "xe_device_types.h"
 #include "xe_gt_types.h"
 #include "xe_sriov.h"
+#include "xe_wedge.h"
 
 struct xe_vm;
 
@@ -207,11 +208,6 @@ bool xe_device_is_l2_flush_optimized(struct xe_device *xe);
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
@@ -260,11 +256,6 @@ static inline bool xe_debug_page_size_mode_is_mixed(struct xe_device *xe)
 }
 #endif
 
-void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
-void xe_device_declare_wedged(struct xe_device *xe);
-int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
-const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode);
-
 struct xe_file *xe_file_get(struct xe_file *xef);
 void xe_file_put(struct xe_file *xef);
 
diff --git a/drivers/gpu/drm/xe/xe_wedge.c b/drivers/gpu/drm/xe/xe_wedge.c
new file mode 100644
index 000000000000..92973133a6f6
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_wedge.c
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
+
+#include "xe_defaults.h"
+#include "xe_device_types.h"
+#include "xe_gt.h"
+#include "xe_log.h"
+#include "xe_module.h"
+#include "xe_pm.h"
+#include "xe_printk.h"
+
+/**
+ * DOC: Xe Device Wedging
+ *
+ * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
+ * When device is in wedged state, every IOCTL will be blocked and GT cannot
+ * be used. The conditions under which the driver declares the device wedged
+ * depend on the wedge mode configuration (see &enum xe_wedged_mode). The
+ * default recovery method for a wedged state is rebind/bus-reset.
+ *
+ * Another recovery method is vendor-specific. Below are the cases that send
+ * ``WEDGED=vendor-specific`` recovery method in drm device wedged uevent.
+ *
+ * Case: Firmware Flash
+ * --------------------
+ *
+ * Identification Hint
+ * +++++++++++++++++++
+ *
+ * ``WEDGED=vendor-specific`` drm device wedged uevent with
+ * :ref:`Runtime Survivability mode <xe-survivability-mode>` is used to notify
+ * admin/userspace consumer about the need for a firmware flash.
+ *
+ * Recovery Procedure
+ * ++++++++++++++++++
+ *
+ * Once ``WEDGED=vendor-specific`` drm device wedged uevent is received, follow
+ * the below steps
+ *
+ * - Check Runtime Survivability mode sysfs.
+ *   If enabled, firmware flash is required to recover the device.
+ *
+ *   /sys/bus/pci/devices/<device>/survivability_mode
+ *
+ * - Admin/userspace consumer can use firmware flashing tools like fwupd to flash
+ *   firmware and restore device to normal operation.
+ */
+
+/**
+ * xe_device_set_wedged_method() - Set wedge recovery method
+ * @xe: xe device instance
+ * @method: recovery method to set
+ *
+ * Set wedge recovery method to be sent in drm wedged uevent.
+ */
+void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
+{
+	xe->wedged.method = method;
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
+	return atomic_read(&xe->wedged.flag);
+}
+
+static void wedge_work(struct work_struct *work)
+{
+	struct xe_device *xe = container_of(work, struct xe_device, wedged.work);
+
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
+
+	/* Notify userspace of wedged device */
+	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
+}
+
+#define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
+#define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
+
+/**
+ * xe_device_declare_wedged() - Declare device wedged
+ * @xe: xe device instance
+ *
+ * This is a final state that can only be cleared with the recovery method
+ * specified in the drm wedged uevent. The method can be set using
+ * xe_device_set_wedged_method() before declaring the device as wedged.
+ * If no method is set, rebind/bus-reset will be sent by default.
+ *
+ * In this state every IOCTL will be blocked so the GT cannot be used.
+ * In general it will be called upon any critical error such as gt reset
+ * failure or guc loading failure. Userspace will be notified of this state
+ * through device wedged uevent.
+ * If xe.wedged module parameter is set to 2, this function will be called
+ * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
+ * snapshot capture. In this mode, GT reset won't be attempted so the state of
+ * the issue is preserved for further debugging.
+ *
+ * Since the wedge handling is done as part of worker thread, this is safe for
+ * atomic callers.
+ */
+void xe_device_declare_wedged(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	u8 id;
+
+	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
+		xe_dbg(xe, "Wedged mode is forcibly disabled\n");
+		return;
+	}
+
+	if (atomic_xchg(&xe->wedged.flag, 1))
+		return;
+
+	xe->needs_flr_on_fini = true;
+	xe_pm_runtime_get_noresume(xe);
+
+	xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
+	xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
+			"For recovery procedure, refer to %s\n"
+			"Please file a _new_ bug report at %s\n",
+			WEDGED_URL, XE_BUG_URL);
+
+	for_each_gt(gt, xe, id)
+		xe_gt_declare_wedged(gt);
+
+	schedule_work(&xe->wedged.work);
+}
+
+static const char *wedge_mode_to_string(enum xe_wedged_mode mode)
+{
+	switch (mode) {
+	case XE_WEDGED_MODE_NEVER:
+		return "never";
+	case XE_WEDGED_MODE_UPON_CRITICAL_ERROR:
+		return "upon-critical-error";
+	case XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET:
+		return "upon-any-hang-no-reset";
+	default:
+		return "<invalid>";
+	}
+}
+
+/**
+ * xe_device_validate_wedged_mode() - Check if given mode is supported
+ * @xe: the &xe_device
+ * @mode: requested mode to validate
+ *
+ * Check whether the provided wedged mode is supported.
+ *
+ * Return: 0 if mode is supported, error code otherwise.
+ */
+int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
+{
+	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
+		xe_dbg(xe, "wedged_mode: invalid value (%u)\n", mode);
+		return -EINVAL;
+	} else if (mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET && (IS_SRIOV_VF(xe) ||
+		   (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG)))) {
+		xe_dbg(xe, "wedged_mode: (%u) %s mode is not supported for %s\n",
+		       mode, wedge_mode_to_string(mode),
+		       xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
+		return -EPERM;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_device_wedged_init_early() - Set wedge mode passed as module parameter
+ * @xe: xe device instance
+ */
+void xe_device_wedged_init_early(struct xe_device *xe)
+{
+	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
+			  XE_DEFAULT_WEDGED_MODE : xe_modparam.wedged_mode;
+	xe_dbg(xe, "wedged_mode: setting mode (%u) %s\n",
+	       xe->wedged.mode, wedge_mode_to_string(xe->wedged.mode));
+}
+
+static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_device *xe = arg;
+
+	disable_work_sync(&xe->wedged.work);
+
+	if (atomic_read(&xe->wedged.flag))
+		xe_pm_runtime_put(xe);
+}
+
+/**
+ * xe_device_wedged_init() - Initialize wedge
+ * @xe: xe device instance
+ */
+int xe_device_wedged_init(struct xe_device *xe)
+{
+	INIT_WORK(&xe->wedged.work, wedge_work);
+
+	return drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
+}
diff --git a/drivers/gpu/drm/xe/xe_wedge.h b/drivers/gpu/drm/xe/xe_wedge.h
new file mode 100644
index 000000000000..c6f16b10ea69
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_wedge.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_WEDGE_H_
+#define _XE_WEDGE_H_
+
+#include <linux/types.h>
+
+struct xe_device;
+
+void xe_device_declare_wedged(struct xe_device *xe);
+bool xe_device_wedged(struct xe_device *xe);
+void xe_device_wedged_init_early(struct xe_device *xe);
+int xe_device_wedged_init(struct xe_device *xe);
+int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
+void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
+
+#endif
-- 
2.43.0

