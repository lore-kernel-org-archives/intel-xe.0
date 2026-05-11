Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430D9CD4840
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 16:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3AC10E1D7;
	Mon, 11 May 2026 16:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NpS0RgbZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A828510E83D
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 16:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778518566; x=1810054566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jhI6itwcK89F523cinBLrIdYnvsh+QfyDg/yFKvIHJM=;
 b=NpS0RgbZh76wFKzC2WYZ+zzLPupn3HRBQ9wZ+Zv9NJhOGIA33yGJs8eH
 Wg+OHSeAFNLRQSn09duplrtQAVzIptmqWIhw9fImkIMC/wivF2O1Hn6cH
 GFiwqwshkR+P5i7+XhlR6XNKeb1k4JDYoQo4Qkgdr7u4ZUfy5mwv7clWU
 WXQaoM4yOOZKC03lLX8sLzLF6lzMTOCEKrswZ8oF0va1P5t0bsHMsf4Qv
 D8/KsmfSlBq6/5c4fPuAHUgceICtbUXQ1jDlVFVzL7hrMa50jsGcYxMCU
 WnDWZux5R/4+qsEcVAyguK9nfp2DTk0hvEM9/X5Ehy1eMgugNMfymjopU A==;
X-CSE-ConnectionGUID: Ic77JyGjQlq7k24gE+pgPg==
X-CSE-MsgGUID: VCGG4FCSSgmfit1F9EnGwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90513521"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90513521"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:56:06 -0700
X-CSE-ConnectionGUID: sUN7Sw5qQvKHwprMCNVkSQ==
X-CSE-MsgGUID: YO2e7cBLTcC43gmBx9YvLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="260988707"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 09:56:02 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v5 03/14] drm/xe/xe_pci_error: Implement PCI error recovery
 callbacks
Date: Mon, 11 May 2026 22:59:10 +0530
Message-ID: <20260511172908.1122252-19-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260511172908.1122252-16-riana.tauro@intel.com>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
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

Note: The re-probe in this patch will be replaced by
minimal re-initalization once below patch is merged
 https://lore.kernel.org/intel-xe/f642453c-f657-41c7-a01b-5a0baf886cd3@intel.com/

---
 drivers/gpu/drm/xe/Makefile       |   1 +
 drivers/gpu/drm/xe/xe_pci.c       |   3 +
 drivers/gpu/drm/xe/xe_pci_error.c | 115 ++++++++++++++++++++++++++++++
 3 files changed, 119 insertions(+)
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
index d55e5af4f4b7..d970c27f5570 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1320,6 +1320,8 @@ static const struct dev_pm_ops xe_pm_ops = {
 };
 #endif
 
+extern const struct pci_error_handlers xe_pci_error_handlers;
+
 static struct pci_driver xe_pci_driver = {
 	.name = DRIVER_NAME,
 	.id_table = pciidlist,
@@ -1327,6 +1329,7 @@ static struct pci_driver xe_pci_driver = {
 	.remove = xe_pci_remove,
 	.shutdown = xe_pci_shutdown,
 	.sriov_configure = xe_pci_sriov_configure,
+	.err_handler = &xe_pci_error_handlers,
 #ifdef CONFIG_PM_SLEEP
 	.driver.pm = &xe_pm_ops,
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
new file mode 100644
index 000000000000..42a821ca1a04
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+#include <linux/pci.h>
+
+#include <drm/drm_drv.h>
+
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_pci.h"
+#include "xe_survivability_mode.h"
+#include "xe_uc.h"
+
+static void xe_pci_error_handling(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	struct xe_gt *gt;
+	u8 id;
+
+	/*
+	 * Wedge the device to prevent userspace access but don't send the event yet.
+	 * Runtime PM ref is taken by PCI core for the duration of error handling.
+	 */
+	atomic_set(&xe->wedged.flag, 1);
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
+		xe_pci_error_handling(pdev);
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

