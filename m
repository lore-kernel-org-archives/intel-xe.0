Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A882CE77182
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 05:30:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F07C10E172;
	Thu, 12 Dec 2024 05:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kgncm/p3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118E310E172
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 05:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733981442; x=1765517442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ly8Re0RF5d62P8whKyQ8mTrGuTkIkHkqWDBDLeaDEB4=;
 b=Kgncm/p3ClFZd9OT4Hy5H1RTL1WB8dJE/Jx2jo0bNEiQjBsu7gpZfJt2
 UXB7ywkBEVQLFw2cyNFeo+RDSSq/iKlbf6Yldulf7r4Mzh7h+uoHDLcA0
 kYMns+x7t5RYeFVcWqo+He9bKCwJAE0BhRis3Gi/AiARU0zc61AEjKYIq
 92PzldYRjXI73be1GFfJu78SnjJfufOIz2eUx675nDtEUA1o+hcutM5ra
 fzGgODfNMs1KPIK6bE1UPtAjqZzfgBWkBx0tUFgfkJS89PlozlwbWxWYo
 XuLJfQ+B1pIR/H0nSvv0REDTNrg569Lu7SfPC9xRkcuAVU7DNvEExyGPU w==;
X-CSE-ConnectionGUID: B2rsStOgT1S6zh4rMTTjNw==
X-CSE-MsgGUID: oUcin8VDQqStdv/EbjeN6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34519701"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="34519701"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 21:30:42 -0800
X-CSE-ConnectionGUID: CAcZsEMATYWYSX18FoB/3g==
X-CSE-MsgGUID: qwnAhSA+QyaxX5lKAZTk6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="96333001"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 21:30:40 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, aravind.iddamsetty@intel.com
Subject: [PATCH 1/2] RFC drm/xe: Add functions and sysfs for boot survivability
Date: Thu, 12 Dec 2024 11:19:44 +0530
Message-ID: <20241212054945.1091894-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212054945.1091894-1-riana.tauro@intel.com>
References: <20241212054945.1091894-1-riana.tauro@intel.com>
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
to allow the firmware to be flashed through mei/gsc and collect telemetry.
The driver's probe flow is modified such that it enters survivability mode
when pcode initialization is incomplete and boot status denotes a failure.
In this mode, drm card is not exposed and PCI sysfs is used to indicate
survivability mode and provide additional information required for debug

This patch adds initialization functions and exposes admin
readable sysfs entries

The new sysfs will have the below layout

	/sys/bus/.../bdf
		     ├── survivability_info
             	     ├── survivability_mode

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |  14 ++
 drivers/gpu/drm/xe/xe_survivability_mode.c    | 225 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_survivability_mode.h    |  17 ++
 .../gpu/drm/xe/xe_survivability_mode_types.h  |  35 +++
 6 files changed, 296 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.c
 create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.h
 create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 7730e0596299..dc60512a5c47 100644
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
index 1373a222f5a5..79bd0bd94e9c 100644
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
index 000000000000..7e36989efd68
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -0,0 +1,225 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+
+#include "xe_survivability_mode_types.h"
+#include "xe_survivability_mode.h"
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
+ * denotes a failure. In this mode, drm card is not exposed and PCI sysfs is used to indicate the
+ * survivability mode and provide additional information required for debug
+ *
+ * Xe KMD exposes below admin-only readable sysfs in survivability mode
+ *
+ * device/survivability_mode: Indicates driver is in survivability mode
+ * device/survivability_info: Provides additional information on why the driver entered
+ *			      survivability mode.
+ *
+ *			      Capability Information - Provides boot status
+ *			      Postcode Information   - Provides information about the failure
+ *			      Overflow Information   - Provides history of previous failures
+ *			      Auxillary Information  - Certain failures may have information in
+ *						       addition to postcode information
+ *
+ * TODO: Notify mei about survivability mode
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
+
+	drm_info(&xe->drm, "%s: 0x%x - 0x%x\n", info[id].name,
+		 info[id].reg, info[id].value);
+}
+
+static int fill_survivability_info(struct xe_device *xe)
+{
+	struct xe_survivability *survivability = &xe->survivability;
+	struct xe_survivability_info *info = survivability->info;
+	u32 capability_info;
+	int id = 0;
+
+	drm_info(&xe->drm, "Survivability Mode Information\n");
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
+static ssize_t survivability_info_show(struct device *dev,
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
+static DEVICE_ATTR_ADMIN_RO(survivability_info);
+
+static ssize_t survivability_mode_show(struct device *dev,
+				       struct device_attribute *attr, char *buff)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	struct xe_survivability *survivability = &xe->survivability;
+
+	return sysfs_emit(buff, "%d\n", survivability->mode);
+}
+
+static DEVICE_ATTR_ADMIN_RO(survivability_mode);
+
+static const struct attribute *survivability_attrs[] = {
+	&dev_attr_survivability_mode.attr,
+	&dev_attr_survivability_info.attr,
+	NULL,
+};
+
+/**
+ * xe_survivability_mode_required- checks if survivability mode is required
+ * @xe: xe device instance
+ *
+ * This function reads the boot status of the capability register and
+ * checks if it is required to enter boot survivability mode.
+ *
+ * Return: true if survivability mode required, false otherwise
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
+	sysfs_remove_files(&xe->drm.dev->kobj, survivability_attrs);
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
+	struct device *dev = xe->drm.dev;
+	int ret = 0;
+
+	survivability->size = MAX_SCRATCH_MMIO;
+
+	info = drmm_kcalloc(&xe->drm, survivability->size, sizeof(*info), GFP_KERNEL);
+	if (!info) {
+		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
+		return;
+	}
+
+	survivability->info = info;
+
+	ret = fill_survivability_info(xe);
+	if (ret)
+		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, ret);
+
+	/* Only log debug information and exit if it is a critical failure */
+	if (survivability->boot_status == CRITICAL_FAILURE)
+		return;
+
+	/* set survivability mode */
+	survivability->mode = true;
+
+	drm_info(&xe->drm, "In Survivability Mode\n");
+
+	ret = sysfs_create_files(&dev->kobj, survivability_attrs);
+	if (ret) {
+		drm_warn(&xe->drm, "Failed to create survivability sysfs files\n");
+		return;
+	}
+
+	/* TODO: Pass Survivability Mode notification to required child drivers */
+}
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
new file mode 100644
index 000000000000..0d5c325322a2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
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
index 000000000000..f9dbb6d80692
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
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
+	/** mode: boolean to indicate survivability mode */
+	bool mode;
+};
+
+#endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
-- 
2.47.1

