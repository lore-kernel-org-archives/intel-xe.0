Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E74CD6E7B
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 09:35:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBDF11A666;
	Fri,  5 Jun 2026 09:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QUxbLlgs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4A711A666
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 09:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780652119; x=1812188119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZKkX004nl2Ss4012i8Cucs3WQkIyLchVDyf+XC0R9XQ=;
 b=QUxbLlgsc7PEIQP8F1ilOmDw7Vb88lsIOVxWkz3BBudnTk2ABJVY5n3w
 g2fqfsmwzZsxYQ36AKDNc7rmZDh0J/JSIC0BIWQc0ZwSOqpJpAJx4rF9Q
 UY31rXRYN70j4rg20iFrzqtC0JtxW71BbnVb+9Xb0M7/KKlkHNckVF1u/
 IyYWL+kfnFbCXpQLX02KujXsTWyXKwmohdZGKsRXb9xtgAQl+eySZAlMs
 2FG7uOgG6uCt1Md8OEwq4duq101CjuFH62inBk2infYPJ9HeoOGA9szYw
 AFxCQzP4B/LqVPITDvJINj3URnX4ASz3Q5xLJeQCQcLcj73iHE3RDxW5J g==;
X-CSE-ConnectionGUID: empMfU3YTWuSOmiYvhzySQ==
X-CSE-MsgGUID: Mg+fPcHkTwiMj9qlaY86xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="98903922"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="98903922"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 02:35:19 -0700
X-CSE-ConnectionGUID: qB4sV55YRLennaWI2jySPw==
X-CSE-MsgGUID: Y5C/tKFPSt+ev4QED6RgFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="249133587"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 02:35:16 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v7 04/15] drm/xe/xe_pci_error: Implement PCI error recovery
 callbacks
Date: Fri,  5 Jun 2026 15:04:50 +0530
Message-ID: <20260605093446.4189929-21-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260605093446.4189929-17-riana.tauro@intel.com>
References: <20260605093446.4189929-17-riana.tauro@intel.com>
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

Add error_detected, mmio_enabled, slot_reset and resume recovery callbacks
to handle PCIe Advanced Error Reporting (AER) errors.

For fatal errors, the device is wedged and becomes inaccessible. Return
PCI_ERS_RESULT_NEED_RESET from error_detected to request a Secondary
Bus Reset (SBR).

For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
error_detected to trigger the mmio_enabled callback. In this callback, the
device is queried to determine the error cause and attempt recovery based
on the error type.

Once the secondary bus reset(SBR) is completed the slot_reset callback
cleanly removes and reprobe the device to restore functionality.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
Note: The re-probe in this patch will be replaced by
minimal re-initalization once below patch is merged
https://lore.kernel.org/intel-xe/f642453c-f657-41c7-a01b-5a0baf886cd3@intel.com/

v2: re-order linux headers
    reword error messages
    do not clear in_recovery after remove
    return PCI_ERS_RESULT_DISCONNECT if probe fails (Michal)
    only wedge device do not send uevent (Raag)
    set recovery flag in error_detected and clear on resume
    add default switch case (Mallesh)

v3: do not set in_recovery for disconnect (Mallesh)
    return if already wedged or in survivability mode

v4: Add comment (Matthew)
    Fix tab (Mallesh)

v5: remove in_reset
    disconnect if already in survivability mode or wedged
    block I/O operations in slot reset (Raag)

v6: acquire runtime pm wakeref while setting the
    wedged flag(Matthew Brost)
    rename function from xe_pci_error_handling() to
    pci_prepare_reset()
    call pci_prepare_reset() before requesting SBR
    add blank line after copyright

v7: use wedged helpers
    add header file
    rename pci_prepare_reset function (Michal)
---
 drivers/gpu/drm/xe/Makefile       |   1 +
 drivers/gpu/drm/xe/xe_pci.c       |   2 +
 drivers/gpu/drm/xe/xe_pci_error.c | 113 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_error.h |  13 ++++
 4 files changed, 129 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
 create mode 100644 drivers/gpu/drm/xe/xe_pci_error.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 09661f079d03..091872771e98 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -101,6 +101,7 @@ xe-y += xe_bb.o \
 	xe_page_reclaim.o \
 	xe_pat.o \
 	xe_pci.o \
+	xe_pci_error.o \
 	xe_pci_rebar.o \
 	xe_pcode.o \
 	xe_pm.o \
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 78fc2e4dcfc6..1d3d2ea82aed 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -26,6 +26,7 @@
 #include "xe_guc.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
+#include "xe_pci_error.h"
 #include "xe_pci_rebar.h"
 #include "xe_pci_sriov.h"
 #include "xe_pci_types.h"
@@ -1349,6 +1350,7 @@ static struct pci_driver xe_pci_driver = {
 	.remove = xe_pci_remove,
 	.shutdown = xe_pci_shutdown,
 	.sriov_configure = xe_pci_sriov_configure,
+	.err_handler = &xe_pci_error_handlers,
 #ifdef CONFIG_PM_SLEEP
 	.driver.pm = &xe_pm_ops,
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
new file mode 100644
index 000000000000..7a846151e5a3
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/pci.h>
+
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_pci.h"
+#include "xe_printk.h"
+#include "xe_survivability_mode.h"
+
+static void prepare_device_for_reset(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	struct xe_gt *gt;
+	u8 id;
+
+	/* Wedge the device to prevent userspace access during reset */
+	xe_device_wedged_get(xe);
+
+	for_each_gt(gt, xe, id)
+		xe_gt_declare_wedged(gt);
+
+	pci_disable_device(pdev);
+}
+
+static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+
+	xe_err(xe, "PCI error: detected state = %u\n", state);
+
+	if (state == pci_channel_io_perm_failure)
+		return PCI_ERS_RESULT_DISCONNECT;
+
+	/* If the device is already wedged or in survivability mode, do not attempt recovery */
+	if (xe_survivability_mode_is_boot_enabled(xe) || xe_device_wedged(xe))
+		return PCI_ERS_RESULT_DISCONNECT;
+
+	switch (state) {
+	case pci_channel_io_normal:
+		return PCI_ERS_RESULT_CAN_RECOVER;
+	case pci_channel_io_frozen:
+		prepare_device_for_reset(pdev);
+		return PCI_ERS_RESULT_NEED_RESET;
+	default:
+		xe_err(xe, "PCI error: unknown state %d\n", state);
+		return PCI_ERS_RESULT_NEED_RESET;
+	}
+}
+
+static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+
+	xe_err(xe, "PCI error: MMIO enabled\n");
+
+	/* TODO: Query system controller for the type of error and take appropriate action */
+	return PCI_ERS_RESULT_RECOVERED;
+}
+
+static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
+{
+	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+
+	xe_err(xe, "PCI error: slot reset\n");
+
+	pci_restore_state(pdev);
+
+	if (pci_enable_device(pdev)) {
+		xe_err(xe, "Cannot re-enable PCI device after reset\n");
+		return PCI_ERS_RESULT_DISCONNECT;
+	}
+
+	/*
+	 * Secondary Bus Reset causes all VRAM state to be lost along with
+	 * hardware state. As an initial step, re-probe the device to
+	 * re-initialize the driver and hardware.
+	 * TODO: optimize by re-initializing only the hardware state and re-creating
+	 * kernel BOs.
+	 */
+	pdev->driver->remove(pdev);
+
+	if (pdev->driver->probe(pdev, ent))
+		return PCI_ERS_RESULT_DISCONNECT;
+
+	xe = pdev_to_xe_device(pdev);
+
+	/* Wedge the device to prevent I/O operations till the resume callback */
+	xe_device_wedged_get(xe);
+
+	return PCI_ERS_RESULT_RECOVERED;
+}
+
+static void xe_pci_error_resume(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+
+	xe_err(xe, "PCI error: resume\n");
+
+	/* Resume I/O operations */
+	xe_device_wedged_put(xe);
+}
+
+const struct pci_error_handlers xe_pci_error_handlers = {
+	.error_detected	= xe_pci_error_detected,
+	.mmio_enabled	= xe_pci_error_mmio_enabled,
+	.slot_reset	= xe_pci_error_slot_reset,
+	.resume		= xe_pci_error_resume,
+};
diff --git a/drivers/gpu/drm/xe/xe_pci_error.h b/drivers/gpu/drm/xe/xe_pci_error.h
new file mode 100644
index 000000000000..725ad0214e62
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_error.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_PCI_ERROR_H_
+#define _XE_PCI_ERROR_H_
+
+struct pci_error_handlers;
+
+extern const struct pci_error_handlers xe_pci_error_handlers;
+
+#endif
-- 
2.47.1

