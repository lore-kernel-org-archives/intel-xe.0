Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364ADCC6B00
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 06:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA12B10EFFA;
	Thu,  2 Apr 2026 06:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dGTjy02M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F6010EFFA
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 06:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775111382; x=1806647382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NKnOXsW24hGD6AQlSdoTxtOP3BeYDEYC97mG4EG9Cv8=;
 b=dGTjy02Mzw9Kl3WfPrq/4w6evm8whPY/svm3Sl3Qe5w8l1YG3dIez8hI
 Pquf1DSDtd67B2hr+oxWDw7P1FuAvRF0/87ltRlhRxC+xkYBm+SOkipdf
 7o5uE2lZfG59XkCRVSVCHdDtoSni+aopqdVfyQMgThlNUGPI2s2OI4j7K
 YOVpr7I6vbmnI9M6tvgReqTajmLE9cRgkhoGbNr+WMlUnxJoc7gQk5TEX
 R7lIo4Re0laccSEPBfYSj/owjAJMl3nSjyOLoltnPiScBDhAoINrH/C3o
 R4onqkcFqXlJnJidZ4m+aE2H4EryExEc78WAdWBlkb8HkFFTnxQt9B5sI w==;
X-CSE-ConnectionGUID: +TXEbwb3Q+Wqj/NtyoK3vQ==
X-CSE-MsgGUID: J9CmPNt+QCq26TBZ6dfvgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76051480"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76051480"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 23:29:42 -0700
X-CSE-ConnectionGUID: mQZgx5GAR7K5TBUyPnLhHw==
X-CSE-MsgGUID: IyXquyq+Q8CeVitRssUIFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="222532246"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 23:29:38 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v3 02/10] drm/xe/xe_pci_error: Implement PCI error recovery
 callbacks
Date: Thu,  2 Apr 2026 12:31:33 +0530
Message-ID: <20260402070131.1603828-14-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260402070131.1603828-12-riana.tauro@intel.com>
References: <20260402070131.1603828-12-riana.tauro@intel.com>
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

Add error_detected, mmio_enabled, slot_reset and resume
recovery callbacks to handle PCIe Advanced Error Reporting
(AER) errors.

For fatal errors, the device is wedged and becomes
inaccessible. Return PCI_ERS_RESULT_SLOT_RESET from
error_detected to request a Secondary Bus Reset (SBR).

For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
error_detected to trigger the mmio_enabled callback. In this callback,
the device is queried to determine the error cause and attempt
recovery based on the error type.

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
---
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_device.h       |  15 ++++
 drivers/gpu/drm/xe/xe_device_types.h |   3 +
 drivers/gpu/drm/xe/xe_pci.c          |   3 +
 drivers/gpu/drm/xe/xe_pci_error.c    | 104 +++++++++++++++++++++++++++
 5 files changed, 126 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 9dacb0579a7d..7f03f06df186 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -100,6 +100,7 @@ xe-y += xe_bb.o \
 	xe_page_reclaim.o \
 	xe_pat.o \
 	xe_pci.o \
+	xe_pci_error.o \
 	xe_pci_rebar.o \
 	xe_pcode.o \
 	xe_pm.o \
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index e4b9de8d8e95..60db2492cb92 100644
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
+	 atomic_set(&xe->in_recovery, 0);
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
index 1df3f08e2e1c..30d71795dd2e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1323,6 +1323,8 @@ static const struct dev_pm_ops xe_pm_ops = {
 };
 #endif
 
+extern const struct pci_error_handlers xe_pci_error_handlers;
+
 static struct pci_driver xe_pci_driver = {
 	.name = DRIVER_NAME,
 	.id_table = pciidlist,
@@ -1330,6 +1332,7 @@ static struct pci_driver xe_pci_driver = {
 	.remove = xe_pci_remove,
 	.shutdown = xe_pci_shutdown,
 	.sriov_configure = xe_pci_sriov_configure,
+	.err_handler = &xe_pci_error_handlers,
 #ifdef CONFIG_PM_SLEEP
 	.driver.pm = &xe_pm_ops,
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
new file mode 100644
index 000000000000..cd9f39010278
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -0,0 +1,104 @@
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
+	/* Wedge the device to prevent userspace access but don't send the event yet */
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

