Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5629ACD5BBF
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 09:33:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD2710E0E9;
	Mon, 25 May 2026 09:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SMm58q+p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD70110E0E9
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 09:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779701579; x=1811237579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CCAX4rTHf+tEEalAXbakMBuLGUQQJMqWN6GCBqcVmkQ=;
 b=SMm58q+pw/NorwtLtg7WpxOxo+rCrZbJFhPnDkh0FFCM3rjlEwC8xH8y
 evJgrCILNkFdIAwyqYEYenqVAVxznLNbWscDxRIWfgkQbSjBhAsuZx8eT
 ehdim5EuaNOqcxk2BuS1g83Y7lVSt76IRhMAb7rhSIX722yLT5JG1plPr
 QkmaHTRvVoL+hAU29fjP+RQVVommhwFn8krU7FIJ1JIOaX37HNZffkV7Z
 LGkObWkwxgoTZPQFS8Q/6VKaeGHrqRNHDAxUJ4Fm8/umSnEAxE77ZiU9d
 qw2ZCUTt0I9qLt73AeBt6T2F7el47EabAk02fXQ+mpRgPfedXMJ0PG6bz w==;
X-CSE-ConnectionGUID: 9q7dhC/IRIeGhr7VCYFgiA==
X-CSE-MsgGUID: aMFGetHkTvO6kg384Aftow==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="68046773"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="68046773"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 02:32:58 -0700
X-CSE-ConnectionGUID: VS/7O7aoRKynZLluifndhA==
X-CSE-MsgGUID: YsvaUp/ERCKCgdS1bH0m7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="279669535"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 02:32:56 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v6 03/15] drm/xe/xe_pci_error: Implement PCI error recovery
 callbacks
Date: Mon, 25 May 2026 15:36:22 +0530
Message-ID: <20260525100619.3155663-20-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260525100619.3155663-17-riana.tauro@intel.com>
References: <20260525100619.3155663-17-riana.tauro@intel.com>
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
PCI_ERS_RESULT_SLOT_RESET from error_detected to request a Secondary
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

Note: The re-probe in this patch will be replaced by
minimal re-initalization once below patch is merged
https://lore.kernel.org/intel-xe/f642453c-f657-41c7-a01b-5a0baf886cd3@intel.com/
---
 drivers/gpu/drm/xe/Makefile       |   1 +
 drivers/gpu/drm/xe/xe_pci.c       |   3 +
 drivers/gpu/drm/xe/xe_pci_error.c | 120 ++++++++++++++++++++++++++++++
 3 files changed, 124 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c

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
index e2a1232c4fbf..5462ddb25d29 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1331,6 +1331,8 @@ static const struct dev_pm_ops xe_pm_ops = {
 };
 #endif
 
+extern const struct pci_error_handlers xe_pci_error_handlers;
+
 static struct pci_driver xe_pci_driver = {
 	.name = DRIVER_NAME,
 	.id_table = pciidlist,
@@ -1338,6 +1340,7 @@ static struct pci_driver xe_pci_driver = {
 	.remove = xe_pci_remove,
 	.shutdown = xe_pci_shutdown,
 	.sriov_configure = xe_pci_sriov_configure,
+	.err_handler = &xe_pci_error_handlers,
 #ifdef CONFIG_PM_SLEEP
 	.driver.pm = &xe_pm_ops,
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
new file mode 100644
index 000000000000..218d67074385
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/pci.h>
+
+#include <drm/drm_drv.h>
+
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_pci.h"
+#include "xe_pm.h"
+#include "xe_survivability_mode.h"
+#include "xe_uc.h"
+
+static void pci_prepare_reset(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	struct xe_gt *gt;
+	u8 id;
+
+	/*
+	 * Wedge the device to prevent userspace access but don't send the event yet.
+	 * xe_device_wedged_fini() releases runtime pm if wedged flag is set, so acquire a runtime
+	 * pm reference to avoid underflow.
+	 */
+	if (!atomic_xchg(&xe->wedged.flag, 1))
+		xe_pm_runtime_get_noresume(xe);
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
+	dev_err(&pdev->dev, "Xe Pci error recovery: error detected state %d\n", state);
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
+		pci_prepare_reset(pdev);
+		return PCI_ERS_RESULT_NEED_RESET;
+	default:
+		dev_err(&pdev->dev, "Unknown state %d\n", state);
+		return PCI_ERS_RESULT_NEED_RESET;
+	}
+}
+
+static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
+{
+	dev_err(&pdev->dev, "Xe Pci error recovery: MMIO enabled\n");
+
+	pci_prepare_reset(pdev);
+	return PCI_ERS_RESULT_NEED_RESET;
+}
+
+static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
+{
+	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
+	struct xe_device *xe;
+
+	dev_err(&pdev->dev, "Xe Pci error recovery: Slot reset\n");
+
+	pci_restore_state(pdev);
+
+	if (pci_enable_device(pdev)) {
+		dev_err(&pdev->dev,
+			"Cannot re-enable PCI device after reset\n");
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
+	atomic_set(&xe->wedged.flag, 1);
+
+	return PCI_ERS_RESULT_RECOVERED;
+}
+
+static void xe_pci_error_resume(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+
+	dev_info(&pdev->dev, "Xe Pci error recovery: Recovered\n");
+
+	/* Resume I/O operations */
+	atomic_set(&xe->wedged.flag, 0);
+}
+
+const struct pci_error_handlers xe_pci_error_handlers = {
+	.error_detected	= xe_pci_error_detected,
+	.mmio_enabled	= xe_pci_error_mmio_enabled,
+	.slot_reset	= xe_pci_error_slot_reset,
+	.resume		= xe_pci_error_resume,
+};
-- 
2.47.1

