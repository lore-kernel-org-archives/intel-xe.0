Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73B6C0218C
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jan 2025 07:46:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F9C10E4A3;
	Mon, 27 Jan 2025 07:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HoSKg5bR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0908310E1D9
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jan 2025 07:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737964013; x=1769500013;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2TorlqLevQyT9KGcmOTHefZNGAA0jLHU4FW+SGXMAE4=;
 b=HoSKg5bRyA/89tMeXaUPCyf6hYRfWFg9Z7xS6BezsATWPzNllK5bFAU6
 U2mo7NSUx1390qhThm+ANQWGnJcO4SszJXi9L/OkRaEOZpg10gARhac6a
 EKcrq4ltaZ8/WSNpd6UP2aiUJ0F5FTH/vd00xRwbrMZouXjBnbkwKL1XT
 NkU4pNTJUY4rhhQ3LhGCB+GDCv+GWvPAjrPJM8E/5C0UidAa2AxRqdHun
 cmiFDEzHd4fFKcQt4zK/gwxc+oBxqriJg2kwabC/mM7xYkLlK2jqxF+lf
 THkJnoZuonFNOxNi7I+FPnTIIvRNa3r3oKA5Z8UnruP4bmyYOVh3fiXKP g==;
X-CSE-ConnectionGUID: onnAJm9MRGOcgk4Yp9C5+w==
X-CSE-MsgGUID: fZjmaALTST2DCFws/0BCpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="37669023"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="37669023"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2025 23:46:52 -0800
X-CSE-ConnectionGUID: c7TLD0BFQYW7Gf6rR9FQng==
X-CSE-MsgGUID: QYSLffeOSxu3bBXD8yJcpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113504308"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2025 23:46:50 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@intel.com
Subject: [PATCH v5 1/3] drm/xe: Add functions and sysfs for boot survivability
Date: Mon, 27 Jan 2025 13:37:14 +0530
Message-ID: <20250127080716.643697-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250127080716.643697-1-riana.tauro@intel.com>
References: <20250127080716.643697-1-riana.tauro@intel.com>
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

Boot Survivability is a software based workflow for recovering a system
in a failed boot state. Here system recoverability is concerned with
recovering the firmware responsible for boot.

This is implemented by loading the driver with bare minimum (no drm card)
to allow the firmware to be flashed through mei-gsc and collect telemetry.
The driver's probe flow is modified such that it enters survivability mode
when pcode initialization is incomplete and boot status denotes a failure.
In this mode, drm card is not exposed and presence of survivability_mode
entry in PCI sysfs  is used to indicate survivability mode and
provide additional information required for debug

This patch adds initialization functions and exposes admin
readable sysfs entries

The new sysfs will have the below layout

	/sys/bus/.../bdf
             	     ├── survivability_mode

v2: reorder headers
    fix doc
    remove survivability info and use mode to display information
    use separate function for logging survivability information
    for critical error (Rodrigo)

v3: use for loop
    use dev logs instead of drm
    use helper function for aux history(Rodrigo)
    remove unnecessary error check of greater than max_scratch
    as we are reading only 3 bit

v4: fix checkpatch warnings
    fix space (Rodrigo)
    rename register

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Acked-by: Ashwin Kumar Kulkarni <ashwin.kumar.kulkarni@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |  14 ++
 drivers/gpu/drm/xe/xe_survivability_mode.c    | 215 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_survivability_mode.h    |  17 ++
 .../gpu/drm/xe/xe_survivability_mode_types.h  |  35 +++
 6 files changed, 286 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.c
 create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.h
 create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 80ab87cfeecb..57aa80071bad 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -96,6 +96,7 @@ xe-y += xe_bb.o \
 	xe_sa.o \
 	xe_sched_job.o \
 	xe_step.o \
+	xe_survivability_mode.o \
 	xe_sync.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 16ebb2859877..58693a00ca7d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -21,6 +21,7 @@
 #include "xe_pt_types.h"
 #include "xe_sriov_types.h"
 #include "xe_step_types.h"
+#include "xe_survivability_mode_types.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define TEST_VM_OPS_ERROR
@@ -330,6 +331,9 @@ struct xe_device {
 		u8 skip_pcode:1;
 	} info;
 
+	/** @survivability: survivability information for device */
+	struct xe_survivability survivability;
+
 	/** @irq: device interrupt state */
 	struct {
 		/** @irq.lock: lock for processing irq's on this device */
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index f153ce96f69a..2bae9afdbd35 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -49,6 +49,20 @@
 /* Domain IDs (param2) */
 #define     PCODE_MBOX_DOMAIN_HBM		0x2
 
+#define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
+/* PCODE_SCRATCH0 */
+#define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
+#define   OVERFLOW_REG_OFFSET		REG_GENMASK(14, 12)
+#define   HISTORY_TRACKING		REG_BIT(11)
+#define   OVERFLOW_SUPPORT		REG_BIT(10)
+#define   AUXINFO_SUPPORT		REG_BIT(9)
+#define   BOOT_STATUS			REG_GENMASK(3, 1)
+#define      CRITICAL_FAILURE		4
+#define      NON_CRITICAL_FAILURE	7
+
+/* Auxiliary info bits */
+#define   AUXINFO_HISTORY_OFFSET	REG_GENMASK(31, 29)
+
 struct pcode_err_decode {
 	int errno;
 	const char *str;
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
new file mode 100644
index 000000000000..9911e9f6b99b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_survivability_mode.h"
+#include "xe_survivability_mode_types.h"
+
+#include <linux/kobject.h>
+#include <linux/pci.h>
+#include <linux/sysfs.h>
+
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_mmio.h"
+#include "xe_pcode_api.h"
+
+#define MAX_SCRATCH_MMIO 8
+
+/**
+ * DOC: Xe Boot Survivability
+ *
+ * Boot Survivability is a software based workflow for recovering a system in a failed boot state
+ * Here system recoverability is concerned with recovering the firmware responsible for boot.
+ *
+ * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
+ * to be flashed through mei and collect telemetry. The driver's probe flow is modified
+ * such that it enters survivability mode when pcode initialization is incomplete and boot status
+ * denotes a failure. The driver then  populates the survivability_mode PCI sysfs indicating
+ * survivability mode and provides additional information required for debug
+ *
+ * KMD exposes below admin-only readable sysfs in survivability mode
+ *
+ * device/survivability_mode: The presence of this file indicates that the card is in survivability
+ *			      mode. Also, provides additional information on why the driver entered
+ *			      survivability mode.
+ *
+ *			      Capability Information - Provides boot status
+ *			      Postcode Information   - Provides information about the failure
+ *			      Overflow Information   - Provides history of previous failures
+ *			      Auxiliary Information  - Certain failures may have information in
+ *						       addition to postcode information
+ */
+
+static u32 aux_history_offset(u32 reg_value)
+{
+	return REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, reg_value);
+}
+
+static void set_survivability_info(struct xe_mmio *mmio, struct xe_survivability_info *info,
+				   int id, char *name)
+{
+	strscpy(info[id].name, name, sizeof(info[id].name));
+	info[id].reg = PCODE_SCRATCH(id).raw;
+	info[id].value = xe_mmio_read32(mmio, PCODE_SCRATCH(id));
+}
+
+static void populate_survivability_info(struct xe_device *xe)
+{
+	struct xe_survivability *survivability = &xe->survivability;
+	struct xe_survivability_info *info = survivability->info;
+	struct xe_mmio *mmio;
+	u32 id = 0, reg_value;
+	char name[NAME_MAX];
+	int index;
+
+	mmio = xe_root_tile_mmio(xe);
+	set_survivability_info(mmio, info, id, "Capability Info");
+	reg_value = info[id].value;
+
+	if (reg_value & HISTORY_TRACKING) {
+		id++;
+		set_survivability_info(mmio, info, id, "Postcode Info");
+
+		if (reg_value & OVERFLOW_SUPPORT) {
+			id = REG_FIELD_GET(OVERFLOW_REG_OFFSET, reg_value);
+			set_survivability_info(mmio, info, id, "Overflow Info");
+		}
+	}
+
+	if (reg_value & AUXINFO_SUPPORT) {
+		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
+
+		for (index = 0; id && reg_value; index++, reg_value = info[id].value,
+		     id = aux_history_offset(reg_value)) {
+			snprintf(name, NAME_MAX, "Auxiliary Info %d", index);
+			set_survivability_info(mmio, info, id, name);
+		}
+	}
+}
+
+static void log_survivability_info(struct pci_dev *pdev)
+{
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	struct xe_survivability *survivability = &xe->survivability;
+	struct xe_survivability_info *info = survivability->info;
+	int id;
+
+	dev_info(&pdev->dev, "Survivability Boot Status : Critical Failure (%d)\n",
+		 survivability->boot_status);
+	for (id = 0; id < MAX_SCRATCH_MMIO; id++) {
+		if (info[id].reg)
+			dev_info(&pdev->dev, "%s: 0x%x - 0x%x\n", info[id].name,
+				 info[id].reg, info[id].value);
+	}
+}
+
+static ssize_t survivability_mode_show(struct device *dev,
+				       struct device_attribute *attr, char *buff)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	struct xe_survivability *survivability = &xe->survivability;
+	struct xe_survivability_info *info = survivability->info;
+	int index = 0, count = 0;
+
+	for (index = 0; index < MAX_SCRATCH_MMIO; index++) {
+		if (info[index].reg)
+			count += sysfs_emit_at(buff, count, "%s: 0x%x - 0x%x\n", info[index].name,
+					       info[index].reg, info[index].value);
+	}
+
+	return count;
+}
+
+static DEVICE_ATTR_ADMIN_RO(survivability_mode);
+
+static void enable_survivability_mode(struct pci_dev *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	struct xe_survivability *survivability = &xe->survivability;
+	int ret = 0;
+
+	/* set survivability mode */
+	survivability->mode = true;
+	dev_info(dev, "In Survivability Mode\n");
+
+	/* create survivability mode sysfs */
+	ret = sysfs_create_file(&dev->kobj, &dev_attr_survivability_mode.attr);
+	if (ret) {
+		dev_warn(dev, "Failed to create survivability sysfs files\n");
+		return;
+	}
+}
+
+/**
+ * xe_survivability_mode_required - checks if survivability mode is required
+ * @xe: xe device instance
+ *
+ * This function reads the boot status from Pcode
+ *
+ * Return: true if boot status indicates failure, false otherwise
+ */
+bool xe_survivability_mode_required(struct xe_device *xe)
+{
+	struct xe_survivability *survivability = &xe->survivability;
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	u32 data;
+
+	data = xe_mmio_read32(mmio, PCODE_SCRATCH(0));
+	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
+
+	return (survivability->boot_status == NON_CRITICAL_FAILURE ||
+		survivability->boot_status == CRITICAL_FAILURE);
+}
+
+/**
+ * xe_survivability_mode_remove - remove survivability mode
+ * @xe: xe device instance
+ *
+ * clean up sysfs entries of survivability mode
+ */
+void xe_survivability_mode_remove(struct xe_device *xe)
+{
+	struct xe_survivability *survivability = &xe->survivability;
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct device *dev = &pdev->dev;
+
+	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
+	kfree(survivability->info);
+	pci_set_drvdata(pdev, NULL);
+}
+
+/**
+ * xe_survivability_mode_init - Initialize the survivability mode
+ * @xe: xe device instance
+ *
+ * Initializes survivability information and enables survivability mode
+ */
+void xe_survivability_mode_init(struct xe_device *xe)
+{
+	struct xe_survivability *survivability = &xe->survivability;
+	struct xe_survivability_info *info;
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+
+	survivability->size = MAX_SCRATCH_MMIO;
+
+	info = kcalloc(survivability->size, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return;
+
+	survivability->info = info;
+
+	populate_survivability_info(xe);
+
+	/* Only log debug information and exit if it is a critical failure */
+	if (survivability->boot_status == CRITICAL_FAILURE) {
+		log_survivability_info(pdev);
+		kfree(survivability->info);
+		return;
+	}
+
+	enable_survivability_mode(pdev);
+}
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
new file mode 100644
index 000000000000..410e3ee5f5d1
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SURVIVABILITY_MODE_H_
+#define _XE_SURVIVABILITY_MODE_H_
+
+#include <linux/types.h>
+
+struct xe_device;
+
+void xe_survivability_mode_init(struct xe_device *xe);
+void xe_survivability_mode_remove(struct xe_device *xe);
+bool xe_survivability_mode_required(struct xe_device *xe);
+
+#endif /* _XE_SURVIVABILITY_MODE_H_ */
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
new file mode 100644
index 000000000000..19d433e253df
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SURVIVABILITY_MODE_TYPES_H_
+#define _XE_SURVIVABILITY_MODE_TYPES_H_
+
+#include <linux/limits.h>
+#include <linux/types.h>
+
+struct xe_survivability_info {
+	char name[NAME_MAX];
+	u32 reg;
+	u32 value;
+};
+
+/**
+ * struct xe_survivability: Contains survivability mode information
+ */
+struct xe_survivability {
+	/** @info: struct that holds survivability info from scratch registers */
+	struct xe_survivability_info *info;
+
+	/** @size: number of scratch registers */
+	u32 size;
+
+	/** @boot_status: indicates critical/non critical boot failure */
+	u8 boot_status;
+
+	/** @mode: boolean to indicate survivability mode */
+	bool mode;
+};
+
+#endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
-- 
2.47.1

