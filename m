Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8947AF8DFD0
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 08:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470BA10E94F;
	Fri, 17 Apr 2026 08:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OE6kGb3z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93F110E997
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 08:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776414337; x=1807950337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hv5Go0vr+6CEoZbksiS2oFvcoZtELvnU8qz42lJJlKc=;
 b=OE6kGb3zo/HLBHArhGcD6ryD85BiV+IrnxTOriQ+4UoGNXeSbq+zFnGM
 EZeVp4X9xtPWRIJr2cKlC2/6Nzg8fBOwTW5pjD95tC/SUL2du/33Cehtk
 WbobZO0GJEWiuBnhnc6xhS5imMw+PHhRcx/9t3Ypt62W7H00sY6bwxQGj
 g13zezzaBuwIwadqxBo8mpeng8XS1EEkC2Vcw7P/UGluZL0PS0nOa67Kc
 nbWQFDAl/V77HJ5MRXc+5oYl7Wt0i0APlx3rAKGOTkfwHaGelvvC4d4tX
 /kSe+In5ZKU20z1CMkerXBzdqZjQ45p+/glYe+dhJ0mnTWjZtVCljuhDO g==;
X-CSE-ConnectionGUID: 6DjwlH9kTaC4EKb8VJsUDg==
X-CSE-MsgGUID: o4rbRa0pSp+5bdlaebnhjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88045814"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="88045814"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:25:36 -0700
X-CSE-ConnectionGUID: TXDIPeTGTCmMt6UPT+6hCA==
X-CSE-MsgGUID: mgugymmsQUC0K1LLfGkEvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="235962239"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:25:32 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v4 02/13] drm/xe/xe_pci_error: Implement PCI error recovery
 callbacks
Date: Fri, 17 Apr 2026 14:28:14 +0530
Message-ID: <20260417085812.4013309-17-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260417085812.4013309-15-riana.tauro@intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
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
---
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_device.h       |  15 ++++
 drivers/gpu/drm/xe/xe_device_types.h |   3 +
 drivers/gpu/drm/xe/xe_pci.c          |   3 +
 drivers/gpu/drm/xe/xe_pci_error.c    | 107 +++++++++++++++++++++++++++
 5 files changed, 129 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e42e582aca5c..69c233d9a488 100644
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
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 555c191f7510..6e18a51e0ade 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -43,6 +43,21 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
 	return container_of(ttm, struct xe_device, ttm);
 }
 
+static inline bool xe_device_is_in_recovery(struct xe_device *xe)
+{
+	return atomic_read(&xe->in_recovery);
+}
+
+static inline void xe_device_set_in_recovery(struct xe_device *xe)
+{
+	atomic_set(&xe->in_recovery, 1);
+}
+
+static inline void xe_device_clear_in_recovery(struct xe_device *xe)
+{
+	atomic_set(&xe->in_recovery, 0);
+}
+
 struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent);
 int xe_device_probe_early(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 150c76b2acaf..c9fe86b670bd 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -494,6 +494,9 @@ struct xe_device {
 		bool inconsistent_reset;
 	} wedged;
 
+	/** @in_recovery: Indicates if device is in recovery */
+	atomic_t in_recovery;
+
 	/** @bo_device: Struct to control async free of BOs */
 	struct xe_bo_dev {
 		/** @bo_device.async_free: Free worker */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 6e560ef84a97..7ac433742f82 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1324,6 +1324,8 @@ static const struct dev_pm_ops xe_pm_ops = {
 };
 #endif
 
+extern const struct pci_error_handlers xe_pci_error_handlers;
+
 static struct pci_driver xe_pci_driver = {
 	.name = DRIVER_NAME,
 	.id_table = pciidlist,
@@ -1331,6 +1333,7 @@ static struct pci_driver xe_pci_driver = {
 	.remove = xe_pci_remove,
 	.shutdown = xe_pci_shutdown,
 	.sriov_configure = xe_pci_sriov_configure,
+	.err_handler = &xe_pci_error_handlers,
 #ifdef CONFIG_PM_SLEEP
 	.driver.pm = &xe_pm_ops,
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
new file mode 100644
index 000000000000..427a8e09408c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -0,0 +1,107 @@
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
+	/* Return if device is wedged or in survivability mode */
+	if (xe_survivability_mode_is_boot_enabled(xe) || xe_device_wedged(xe))
+		return;
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
+	xe_device_set_in_recovery(xe);
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
+	 * Secondary Bus Reset wipes out all device memory
+	 * requiring XE KMD to perform a device removal and reprobe.
+	 */
+	pdev->driver->remove(pdev);
+
+	if (!pdev->driver->probe(pdev, ent))
+		return PCI_ERS_RESULT_RECOVERED;
+
+	return PCI_ERS_RESULT_DISCONNECT;
+}
+
+static void xe_pci_error_resume(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+
+	dev_info(&pdev->dev, "Xe Pci error recovery: Recovered\n");
+
+	xe_device_clear_in_recovery(xe);
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

