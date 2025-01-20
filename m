Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA3BC02185
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jan 2025 06:20:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7D110E2F6;
	Mon, 20 Jan 2025 06:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pe0s0ypz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFABC10E2F3
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jan 2025 06:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737354042; x=1768890042;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QOvMHenIGyCjMEs0JHRLJxds+ud2eezSkIvsS/3+XTM=;
 b=Pe0s0ypziSLuOhXIqrlqtt5NTOQzrC43koerUAQhj37QBy2t/TG+QFbd
 0dwb9M+/7I42O66QieegE9eQ7vrhPcE0P8mWxsqJlCNiJ/8HkLyfOHSXK
 RTm7eYF4Oj+ffhcWbnACrgoL3drorhzxYN178DztD9b9NlifKprAm7KyG
 lg807fiOyqiD6Ip4GrayrJZ9IMnIKOlz0dE2dD8M5PelFInZuurtWBMlg
 Wcu4OFbOZP94ZhWHlnh8pdoZeKJSYnlkMm+MWYNQuXcX/tQFiRI46iaTj
 AiZR4LxVaM3eXauJGGYt7FWWpRxarGTyJWHWQmMcM8N8GrflJTu+5qS3t w==;
X-CSE-ConnectionGUID: B/yoHyu2SoG5WaLXhrMEIw==
X-CSE-MsgGUID: O7YAWVmiRIKAHfFF0RW+fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37953789"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; d="scan'208";a="37953789"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 22:20:42 -0800
X-CSE-ConnectionGUID: s1MNEzsPTwC4C1/7hQjDWg==
X-CSE-MsgGUID: EVKT/RhkTA2Ldgueckn8cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; d="scan'208";a="111370329"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 22:20:41 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@intel.com, jani.nikula@linux.intel.com,
 alexander.usyskin@intel.com
Subject: [PATCH v3 1/3] drm/xe: Add functions and sysfs for boot survivability
Date: Mon, 20 Jan 2025 12:10:40 +0530
Message-ID: <20250120064042.2596178-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120064042.2596178-1-riana.tauro@intel.com>
References: <20250120064042.2596178-1-riana.tauro@intel.com>
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

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Acked-by: Ashwin Kumar Kulkarni <ashwin.kumar.kulkarni@intel.com>
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
index 5c97ad6ed738..fb1cb98ce891 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -95,6 +95,7 @@ xe-y += xe_bb.o \
 	xe_sa.o \
 	xe_sched_job.o \
 	xe_step.o \
+	xe_survivability_mode.o \
 	xe_sync.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8a7b15972413..0f5a052150c9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -21,6 +21,7 @@
 #include "xe_pt_types.h"
 #include "xe_sriov_types.h"
 #include "xe_step_types.h"
+#include "xe_survivability_mode_types.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define TEST_VM_OPS_ERROR
@@ -341,6 +342,9 @@ struct xe_device {
 		u8 skip_pcode:1;
 	} info;
 
+	/** @survivability: survivability information for device */
+	struct xe_survivability survivability;
+
 	/** @irq: device interrupt state */
 	struct {
 		/** @irq.lock: lock for processing irq's on this device */
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index f153ce96f69a..4e373b8199ca 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -49,6 +49,20 @@
 /* Domain IDs (param2) */
 #define     PCODE_MBOX_DOMAIN_HBM		0x2
 
+#define PCODE_SCRATCH_ADDR(x)		XE_REG(0x138320 + ((x) * 4))
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
+/* Auxillary info bits */
+#define   AUXINFO_HISTORY_OFFSET	REG_GENMASK(31, 29)
+
 struct pcode_err_decode {
 	int errno;
 	const char *str;
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
new file mode 100644
index 000000000000..b27757b4ef5d
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
+ *			      Auxillary Information  - Certain failures may have information in
+ *						       addition to postcode information
+ */
+
+static u32 aux_history_offset(u32 reg_value)
+{
+	return REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, reg_value);
+}
+
+static void set_survivability_info(struct xe_device *xe, struct xe_survivability_info *info,
+				   int id, char *name)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+
+	strscpy(info[id].name, name, sizeof(info[id].name));
+	info[id].reg = PCODE_SCRATCH_ADDR(id).raw;
+	info[id].value = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(id));
+}
+
+static void populate_survivability_info(struct xe_device *xe)
+{
+	struct xe_survivability *survivability = &xe->survivability;
+	struct xe_survivability_info *info = survivability->info;
+	u32 id = 0, reg_value;
+	int index;
+	char name[NAME_MAX];
+
+	set_survivability_info(xe, info, id, "Capability Info");
+	reg_value = info[id].value;
+
+	if (reg_value & HISTORY_TRACKING) {
+		id++;
+		set_survivability_info(xe, info, id, "Postcode Info");
+
+		if (reg_value & OVERFLOW_SUPPORT) {
+			id = REG_FIELD_GET(OVERFLOW_REG_OFFSET, reg_value);
+			set_survivability_info(xe, info, id, "Overflow Info");
+		}
+	}
+
+	if (reg_value & AUXINFO_SUPPORT) {
+		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
+
+		for (index = 0; id && reg_value; index++, reg_value = info[id].value,
+		     id = aux_history_offset(reg_value)) {
+			snprintf(name, NAME_MAX, "Auxillary Info %d", index);
+			set_survivability_info(xe, info, id, name);
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
+ * xe_survivability_mode_required- checks if survivability mode is required
+ * @xe: xe device instance
+ *
+ * This function reads the boot status of Pcode capability register
+ *
+ * Return: true if boot status indicates failure, false otherwise
+ */
+bool xe_survivability_mode_required(struct xe_device *xe)
+{
+	struct xe_survivability *survivability = &xe->survivability;
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	u32 data;
+
+	data = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(0));
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
+ * Initializes the sysfs and required actions to enter survivability mode
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

