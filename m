Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912BBF99344
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 10:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589BF10F035;
	Thu, 23 Apr 2026 10:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hXx9bk5b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9B710F031
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 10:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776938634; x=1808474634;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C7rUau1hYVMbC/LEwMicfRz2y76sV8YEZ4xXOd8w3PM=;
 b=hXx9bk5bKqAuDBO2qiTR6ld+QCWP3MGMl4bbSi7x4FEOq5lOxb5/K5Bt
 hCo8elbcOmXvs5OyOyuAf9tj9NnrKrFB5uAiec4ZZUl6of/w8wDvuGJX1
 Ta67Yk9CdOc/kTuXWIo5mKpgZxfT6fDoC94D7VaDAXlMMWlg1boC5DSGH
 ltux9z1EBnLpkUUIgLSEYxiwLm1yGifLPSvagCeCw9qF046NxlP5MgqN7
 4NUkQ5HuHyWl8N8iP9oFlcXQRvBDgUPrmkXjXV5WxXy86b4TRWEyUdNRi
 Ny/IgI0OeV0tzbu/zB3cp/L1YvjyDBFKoFdWYERhPzM0Q2nIzp/phedQt A==;
X-CSE-ConnectionGUID: dfM5fJYMTFGZkM6bEg4JmA==
X-CSE-MsgGUID: vEk+P3PHRjakWJqCqmtDDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88600346"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="88600346"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:03:54 -0700
X-CSE-ConnectionGUID: Iulip4oZT5yvMHBenzoZsA==
X-CSE-MsgGUID: IEz3IHzbQ5KQhIk3SrbWlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="232522944"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 23 Apr 2026 03:03:50 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 jani.nikula@intel.com, lukasz.laguna@intel.com, zhanjun.dong@intel.com,
 lukas@wunner.de, daniele.ceraolospurio@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v6 8/8] drm/xe/pci: Introduce PCIe FLR
Date: Thu, 23 Apr 2026 15:30:17 +0530
Message-ID: <20260423100017.1051587-9-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423100017.1051587-1-raag.jadav@intel.com>
References: <20260423100017.1051587-1-raag.jadav@intel.com>
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

With bare minimum pieces in place, we can finally introduce PCIe Function
Level Reset (FLR) support which re-initializes hardware state without the
need for reloading the driver from userspace. All VRAM contents are lost
along with hardware state and driver takes care of recreating the required
kernel bos as part of re-initialization, but user still needs to recreate
user bos and reload context after PCIe FLR.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
v2: Spell out Function Level Reset (Jani)
v5: Prevent PM ref leak for wedged device (Matthew Brost)
v6: Add PCIe FLR documentation (Daniele)
---
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_device_types.h |   3 +
 drivers/gpu/drm/xe/xe_pci.c          |   1 +
 drivers/gpu/drm/xe/xe_pci.h          |   2 +
 drivers/gpu/drm/xe/xe_pci_error.c    | 113 +++++++++++++++++++++++++++
 5 files changed, 120 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 8e31b14239ec..3fceda259834 100644
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
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 89437de3001a..cbd5682ab833 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -477,6 +477,9 @@ struct xe_device {
 	/** @pxp: Encapsulate Protected Xe Path support */
 	struct xe_pxp *pxp;
 
+	/** @flr_prepared: Prepared for function-reset */
+	bool flr_prepared;
+
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 41435f84aeb2..278c2860a4f6 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1329,6 +1329,7 @@ static struct pci_driver xe_pci_driver = {
 #ifdef CONFIG_PM_SLEEP
 	.driver.pm = &xe_pm_ops,
 #endif
+	.err_handler = &xe_pci_err_handlers,
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
index 11bcc5fe2c5b..85e85e8508c3 100644
--- a/drivers/gpu/drm/xe/xe_pci.h
+++ b/drivers/gpu/drm/xe/xe_pci.h
@@ -8,6 +8,8 @@
 
 struct pci_dev;
 
+extern const struct pci_error_handlers xe_pci_err_handlers;
+
 int xe_register_pci_driver(void);
 void xe_unregister_pci_driver(void);
 struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev);
diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
new file mode 100644
index 000000000000..a53d5873ae83
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_error.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include "xe_device.h"
+#include "xe_printk.h"
+
+/**
+ * DOC: PCI Error Handling
+ *
+ * Xe driver registers PCI callbacks which are called by PCI core in case of
+ * bus errors or resets.
+ *
+ * Currently only PCI Function Level Reset (FLR) callbacks are supported. Since
+ * most of the Endpoint Function state is lost on PCIe FLR, the flow is pretty
+ * much similar to system suspend/resume flow with a few notable exceptions.
+ *
+ * Prepare phase:
+ * - Temporarily wedge the device to prevent userspace access
+ * - Stop accepting new submissions
+ * - Kill exec queues which signals all fences and frees in-flight jobs
+ * - Skip memory eviction due to untrustworthy VRAM contents
+ * - Remove all memory mappings since VRAM contents will be lost
+ *
+ * Re-initialization phase:
+ * - Recreate kernel bos due to skipped eviction in prepare phase
+ * - Restore kernel queues which were killed in prepare phase
+ * - Reload all uC firmwares
+ * - Bring up GT and unwedge to allow userspace access
+ *
+ * Since VRAM contents are lost, the user is expected to recreate user memory
+ * and reload context.
+ *
+ * TODO: Add PCIe error handling callbacks using similar flow.
+ *
+ * Current implementation is only limited to re-initializing GT.
+ * This needs to be extended for a lot of components listed below.
+ *
+ * - Proper re-initialization of GSC and PXP for integrated platforms
+ * - SRIOV cases which need synchronization between PF and VF
+ * - Re-initialization of all child devices of Xe
+ * - User memory handling and MM corner cases
+ * - Display
+ */
+
+#define XE_FLR_SKIP(xe_, pdev_)		(!IS_DGFX(xe_) || IS_SRIOV_VF(xe_) || pci_num_vf(pdev_) || \
+					 xe_->info.probe_display)
+
+static void xe_pci_reset_prepare(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+
+	if (XE_FLR_SKIP(xe, pdev)) {
+		xe_err(xe, "PCIe FLR not supported\n");
+		return;
+	}
+
+	if (xe_device_wedged(xe)) {
+		xe_err(xe, "PCIe FLR aborted, device in unexpected state\n");
+		return;
+	}
+
+	/* Wedge the device to prevent userspace access but don't send the event yet */
+	atomic_set(&xe->wedged.flag, 1);
+
+	/*
+	 * The hardware could be in corrupted state and access unreliable, but we try to
+	 * update data structures and cleanup any pending work to avoid side effects during
+	 * PCIe FLR. This will be similar to system suspend flow but without eviction.
+	 */
+	if (xe_device_suspend(xe, true)) {
+		xe_err(xe, "Failed to prepare for PCIe FLR\n");
+		return;
+	}
+
+	xe->flr_prepared = true;
+	xe_info(xe, "Prepared for PCIe FLR\n");
+}
+
+static void xe_pci_reset_done(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+
+	if (XE_FLR_SKIP(xe, pdev))
+		return;
+
+	if (!xe_device_wedged(xe) || !xe->flr_prepared)
+		return;
+
+	/* Unprepare early in case we fail */
+	xe->flr_prepared = false;
+
+	/*
+	 * We already have the data structures intact, so try to re-initialize the device.
+	 * This will be similar to system resume flow, except we'll also need to recreate
+	 * kernel bos and restore kernel queues.
+	 */
+	if (xe_device_resume(xe, true)) {
+		xe_err(xe, "Re-initialization failed\n");
+		return;
+	}
+
+	/* Unwedge to allow userspace access */
+	atomic_set(&xe->wedged.flag, 0);
+
+	xe_info(xe, "Re-initialization success\n");
+}
+
+const struct pci_error_handlers xe_pci_err_handlers = {
+	.reset_prepare = xe_pci_reset_prepare,
+	.reset_done = xe_pci_reset_done,
+};
-- 
2.43.0

