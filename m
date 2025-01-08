Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AF6E77188
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 10:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A622F10E82C;
	Wed,  8 Jan 2025 10:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dclA0rHt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F11410E850
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jan 2025 10:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736331615; x=1767867615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8g98soHAIbGDQHZ6Uju+58PFpAD2u1GjE+nX40dpPYw=;
 b=dclA0rHtIibGxTw2hFKcLnwawMsQY5TnC9Qt5C7Srf164O/Wqj+hml8G
 nHufGh7M0cxpLftS6f0aqZO+PkkAhQ5fj+wlEYgknNObfGE361fkuHirj
 4kXF/sNwoK1A5kxk2zeRj71QRpjXOciqXKTDwKAd0MX0d4QwCN1pzpmHW
 gDB8dJ+ohcIzCzKnU3N9DQlnVm/T81E4srpTrw/a//ez7s7C0o8KeOWYp
 o8p4RTyzUH9GijISzJJ2DQeABEjcapV8UVK7rMHS4IN5x7cs8s26NDgpb
 VFDa97ErKR8tfaNRgDlxwISVG58OYehVNq+hrPGgQCe1+V7P9R03AhVLX A==;
X-CSE-ConnectionGUID: GLlraCxITde85XZfbfvmYw==
X-CSE-MsgGUID: U8rXcmUYTh2QQZg0wPJtQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="59014977"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; d="scan'208";a="59014977"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 02:20:15 -0800
X-CSE-ConnectionGUID: 6kb7ATcxTo6Nn0L2IpQZ9g==
X-CSE-MsgGUID: cHeFSojKTUiQTp0MzgwJQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133950053"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 02:20:11 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@intel.com, jani.nikula@linux.intel.com,
 matthew.d.roper@intel.com, alexander.usyskin@intel.com
Subject: [PATCH v2 1/3] drm/xe: Add functions and sysfs for boot survivability
Date: Wed,  8 Jan 2025 16:09:57 +0530
Message-ID: <20250108103959.1219312-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108103959.1219312-1-riana.tauro@intel.com>
References: <20250108103959.1219312-1-riana.tauro@intel.com>
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

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |  14 ++
 drivers/gpu/drm/xe/xe_survivability_mode.c    | 231 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_survivability_mode.h    |  17 ++
 .../gpu/drm/xe/xe_survivability_mode_types.h  |  35 +++
 6 files changed, 302 insertions(+)
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
index 000000000000..077422ae009d
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_survivability_mode.h"
+#include "xe_survivability_mode_types.h"
+
+#include <drm/drm_managed.h>
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
+static int populate_survivability_info(struct xe_device *xe)
+{
+	struct xe_survivability *survivability = &xe->survivability;
+	struct xe_survivability_info *info = survivability->info;
+	u32 capability_info;
+	int id = 0;
+
+	set_survivability_info(xe, info, id, "Capability Info");
+	capability_info = info[id].value;
+
+	if (capability_info & HISTORY_TRACKING) {
+		id++;
+		set_survivability_info(xe, info, id, "Postcode Info");
+
+		if (capability_info & OVERFLOW_SUPPORT) {
+			id = REG_FIELD_GET(OVERFLOW_REG_OFFSET, capability_info);
+			/* ID should be within MAX_SCRATCH_MMIO */
+			if (id >= MAX_SCRATCH_MMIO)
+				return -EINVAL;
+			set_survivability_info(xe, info, id, "Overflow Info");
+		}
+	}
+
+	if (capability_info & AUXINFO_SUPPORT) {
+		u32 aux_info;
+		int index = 0;
+		char name[NAME_MAX];
+
+		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, capability_info);
+		if (id >= MAX_SCRATCH_MMIO)
+			return -EINVAL;
+
+		snprintf(name, NAME_MAX, "Auxiliary Info %d", index);
+		set_survivability_info(xe, info, id, name);
+		aux_info = info[id].value;
+
+		while ((id = REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, aux_info)) &&
+		       (id < MAX_SCRATCH_MMIO)) {
+			index++;
+			snprintf(name, NAME_MAX, "Prev Auxiliary Info %d", index);
+			set_survivability_info(xe, info, id, name);
+			aux_info = info[id].value;
+		}
+	}
+
+	return 0;
+}
+
+static void log_survivability_info(struct xe_device *xe)
+{
+	struct xe_survivability *survivability = &xe->survivability;
+	struct xe_survivability_info *info = survivability->info;
+	int id;
+
+	drm_info(&xe->drm, "Survivability Boot Status : Critical Failure (%d)\n",
+		 survivability->boot_status);
+	for (id = 0; id < MAX_SCRATCH_MMIO; id++) {
+		if (info[id].reg)
+			drm_info(&xe->drm, "%s: 0x%x - 0x%x\n", info[id].name,
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
+static void enable_survivability_mode(struct xe_device *xe)
+{
+	struct xe_survivability *survivability = &xe->survivability;
+	struct device *dev = xe->drm.dev;
+	int ret = 0;
+
+	/* set survivability mode */
+	survivability->mode = true;
+	drm_info(&xe->drm, "In Survivability Mode\n");
+
+	/* create survivability mode sysfs */
+	ret = sysfs_create_file(&dev->kobj, &dev_attr_survivability_mode.attr);
+	if (ret) {
+		drm_warn(&xe->drm, "Failed to create survivability sysfs files\n");
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
+
+	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_survivability_mode.attr);
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
+	int ret = 0;
+
+	survivability->size = MAX_SCRATCH_MMIO;
+
+	info = kcalloc(survivability->size, sizeof(*info), GFP_KERNEL);
+	if (!info) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	survivability->info = info;
+
+	ret = populate_survivability_info(xe);
+	if (ret)
+		goto err;
+
+	/* Only log debug information and exit if it is a critical failure */
+	if (survivability->boot_status == CRITICAL_FAILURE) {
+		log_survivability_info(xe);
+		kfree(survivability->info);
+		return;
+	}
+
+	enable_survivability_mode(xe);
+err:
+	if (ret)
+		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, ret);
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

