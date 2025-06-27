Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B341C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 14:46:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E375610EA47;
	Fri, 27 Jun 2025 14:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y5pv49GO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05AB10EA47
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 14:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751035587; x=1782571587;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wa0AwEnImd7XjpQW0bgbYI9WgHfQzRgvj7HAuC3pWhM=;
 b=Y5pv49GOvEFDoJ+E1YOHx5T50/Eg16BBSy97OjdfFu+WH3JaLzKRTs4l
 IqrmZ683oIwsJI1/z2COU8g2r2mIz6l+4ySp09cneD6q6+m0/m3/3PVqx
 ekUmDScCxXmYxynGoRgqlxYAmfvyk57y5p3LuKD0KfIn2+6uAo0fme80K
 C+RKYMZRw3Zu01pou+cQR6mZ5pMeb1dcpjomBvrB8018FbbLJ/p19VTid
 sY5PzzCAgzlWK93RVDVRt7cWxC3Ryj3gxotam5hB1waskDwv+PD0mVygP
 qcqJMfYG/BeFCfVPweMGI4OoGVRJrxzsjYoRfdhaUcb3cNCyD3yCtYjfh A==;
X-CSE-ConnectionGUID: 84QlvZDwSt23Mb2GUB4k3Q==
X-CSE-MsgGUID: uiAt9JC9Rb+yO0lFzJ7+CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57027388"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="57027388"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 07:46:26 -0700
X-CSE-ConnectionGUID: DLJMiBREQbaa7WfqyxpGqA==
X-CSE-MsgGUID: dyPoa0ywRcKQt1PNLiFQgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="153355590"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 07:46:24 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: xe_late_bind squash for CI
Date: Fri, 27 Jun 2025 20:20:04 +0530
Message-Id: <20250627145004.653045-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Alexander Usyskin <alexander.usyskin@intel.com>

Do not review

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/Kconfig                  |   1 +
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c             |  41 ++
 drivers/gpu/drm/xe/xe_device.c              |   5 +
 drivers/gpu/drm/xe/xe_device_types.h        |   6 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c        | 462 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_late_bind_fw.h        |  17 +
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h  |  79 ++++
 drivers/gpu/drm/xe/xe_pci.c                 |   3 +
 drivers/gpu/drm/xe/xe_pm.c                  |  10 +
 drivers/gpu/drm/xe/xe_uc_fw_abi.h           |  66 +++
 drivers/misc/mei/Kconfig                    |   1 +
 drivers/misc/mei/Makefile                   |   1 +
 drivers/misc/mei/bus.c                      |  13 +
 drivers/misc/mei/late_bind/Kconfig          |  13 +
 drivers/misc/mei/late_bind/Makefile         |   9 +
 drivers/misc/mei/late_bind/mei_late_bind.c  | 281 ++++++++++++
 include/drm/intel/i915_component.h          |   1 +
 include/drm/intel/late_bind_mei_interface.h |  64 +++
 include/linux/mei_cl_bus.h                  |   1 +
 20 files changed, 1075 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
 create mode 100644 drivers/misc/mei/late_bind/Kconfig
 create mode 100644 drivers/misc/mei/late_bind/Makefile
 create mode 100644 drivers/misc/mei/late_bind/mei_late_bind.c
 create mode 100644 include/drm/intel/late_bind_mei_interface.h

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 553c29e1030b..5a2d7c5a000e 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -44,6 +44,7 @@ config DRM_XE
 	select WANT_DEV_COREDUMP
 	select AUXILIARY_BUS
 	select HMM_MIRROR
+	select INTEL_MEI_LATE_BIND
 	help
 	  Driver for Intel Xe2 series GPUs and later. Experimental support
 	  for Xe series is also available.
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 7c039caefd00..521547d78fd2 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -76,6 +76,7 @@ xe-y += xe_bb.o \
 	xe_hw_fence.o \
 	xe_irq.o \
 	xe_lrc.o \
+	xe_late_bind_fw.o \
 	xe_migrate.o \
 	xe_mmio.o \
 	xe_mocs.o \
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d83cd6ed3fa8..d1f6f556efa2 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -226,6 +226,44 @@ static const struct file_operations atomic_svm_timeslice_ms_fops = {
 	.write = atomic_svm_timeslice_ms_set,
 };
 
+static ssize_t disable_late_binding_show(struct file *f, char __user *ubuf,
+					 size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	struct xe_late_bind *late_bind = &xe->late_bind;
+	char buf[32];
+	int len;
+
+	len = scnprintf(buf, sizeof(buf), "%d\n", late_bind->disable);
+
+	return simple_read_from_buffer(ubuf, size, pos, buf, len);
+}
+
+static ssize_t disable_late_binding_set(struct file *f, const char __user *ubuf,
+					size_t size, loff_t *pos)
+{
+	struct xe_device *xe = file_inode(f)->i_private;
+	struct xe_late_bind *late_bind = &xe->late_bind;
+	u32 uval;
+	ssize_t ret;
+
+	ret = kstrtouint_from_user(ubuf, size, sizeof(uval), &uval);
+	if (ret)
+		return ret;
+
+	if (uval > 1)
+		return -EINVAL;
+
+	late_bind->disable = !!uval;
+	return size;
+}
+
+static const struct file_operations disable_late_binding_fops = {
+	.owner = THIS_MODULE,
+	.read = disable_late_binding_show,
+	.write = disable_late_binding_set,
+};
+
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -249,6 +287,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("atomic_svm_timeslice_ms", 0600, root, xe,
 			    &atomic_svm_timeslice_ms_fops);
 
+	debugfs_create_file("disable_late_binding", 0600, root, xe,
+			    &disable_late_binding_fops);
+
 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0b73cb72bad1..cb595bae5f55 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -44,6 +44,7 @@
 #include "xe_hw_engine_group.h"
 #include "xe_hwmon.h"
 #include "xe_irq.h"
+#include "xe_late_bind_fw.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_nvm.h"
@@ -866,6 +867,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_late_bind_init(&xe->late_bind);
+	if (err && err != -ENODEV)
+		return err;
+
 	err = xe_oa_init(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 7e4f6d846af6..4e36dc37026f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -16,6 +16,7 @@
 #include "xe_devcoredump_types.h"
 #include "xe_heci_gsc.h"
 #include "xe_lmtt_types.h"
+#include "xe_late_bind_fw_types.h"
 #include "xe_memirq_types.h"
 #include "xe_oa_types.h"
 #include "xe_platform_types.h"
@@ -323,6 +324,8 @@ struct xe_device {
 		u8 has_heci_cscfi:1;
 		/** @info.has_heci_gscfi: device has heci gscfi */
 		u8 has_heci_gscfi:1;
+		/** @info.has_late_bind: Device has firmware late binding support */
+		u8 has_late_bind:1;
 		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
 		u8 has_llc:1;
 		/** @info.has_mbx_power_limits: Device has support to manage power limits using
@@ -555,6 +558,9 @@ struct xe_device {
 	/** @nvm: discrete graphics non-volatile memory */
 	struct intel_dg_nvm_dev *nvm;
 
+	/** @late_bind: xe mei late bind interface */
+	struct xe_late_bind late_bind;
+
 	/** @oa: oa observation subsystem */
 	struct xe_oa oa;
 
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
new file mode 100644
index 000000000000..baf7d9b0361e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -0,0 +1,462 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/component.h>
+#include <linux/delay.h>
+#include <linux/firmware.h>
+
+#include <drm/drm_managed.h>
+#include <drm/intel/i915_component.h>
+#include <drm/intel/late_bind_mei_interface.h>
+#include <drm/drm_print.h>
+
+#include "xe_device.h"
+#include "xe_late_bind_fw.h"
+#include "xe_pcode.h"
+#include "xe_pcode_api.h"
+#include "xe_pm.h"
+
+/*
+ * The component should load quite quickly in most cases, but it could take
+ * a bit. Using a very big timeout just to cover the worst case scenario
+ */
+#define LB_INIT_TIMEOUT_MS 20000
+
+/*
+ * Retry interval set to 6 seconds, in steps of 200 ms, to allow time for
+ * other OS components to release the MEI CL handle
+ */
+#define LB_FW_LOAD_RETRY_MAXCOUNT 30
+#define LB_FW_LOAD_RETRY_PAUSE_MS 200
+
+static const u32 fw_id_to_type[] = {
+		[XE_LB_FW_FAN_CONTROL] = CSC_LATE_BINDING_TYPE_FAN_CONTROL,
+	};
+
+static const char * const fw_id_to_name[] = {
+		[XE_LB_FW_FAN_CONTROL] = "fan_control",
+	};
+
+static struct xe_device *
+late_bind_to_xe(struct xe_late_bind *late_bind)
+{
+	return container_of(late_bind, struct xe_device, late_bind);
+}
+
+static struct xe_device *
+late_bind_fw_to_xe(struct xe_late_bind_fw *lb_fw)
+{
+	return container_of(lb_fw, struct xe_device, late_bind.late_bind_fw[lb_fw->id]);
+}
+
+/* Refer to the "Late Bind based Firmware Layout" documentation entry for details */
+static int parse_cpd_header(struct xe_late_bind_fw *lb_fw,
+			    const void *data, size_t size, const char *manifest_entry)
+{
+	struct xe_device *xe = late_bind_fw_to_xe(lb_fw);
+	const struct gsc_cpd_header_v2 *header = data;
+	const struct gsc_manifest_header *manifest;
+	const struct gsc_cpd_entry *entry;
+	size_t min_size = sizeof(*header);
+	u32 offset;
+	int i;
+
+	/* manifest_entry is mandatory */
+	xe_assert(xe, manifest_entry);
+
+	if (size < min_size || header->header_marker != GSC_CPD_HEADER_MARKER)
+		return -ENOENT;
+
+	if (header->header_length < sizeof(struct gsc_cpd_header_v2)) {
+		drm_err(&xe->drm, "%s late binding fw: Invalid CPD header length %u!\n",
+			fw_id_to_name[lb_fw->id], header->header_length);
+		return -EINVAL;
+	}
+
+	min_size = header->header_length + sizeof(struct gsc_cpd_entry) * header->num_of_entries;
+	if (size < min_size) {
+		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
+			fw_id_to_name[lb_fw->id], size, min_size);
+		return -ENODATA;
+	}
+
+	/* Look for the manifest first */
+	entry = (void *)header + header->header_length;
+	for (i = 0; i < header->num_of_entries; i++, entry++)
+		if (strcmp(entry->name, manifest_entry) == 0)
+			offset = entry->offset & GSC_CPD_ENTRY_OFFSET_MASK;
+
+	if (!offset) {
+		drm_err(&xe->drm, "%s late binding fw: Failed to find manifest_entry\n",
+			fw_id_to_name[lb_fw->id]);
+		return -ENODATA;
+	}
+
+	min_size = offset + sizeof(struct gsc_manifest_header);
+	if (size < min_size) {
+		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
+			fw_id_to_name[lb_fw->id], size, min_size);
+		return -ENODATA;
+	}
+
+	manifest = data + offset;
+
+	lb_fw->version = manifest->fw_version;
+
+	return 0;
+}
+
+/* Refer to the "Late Bind based Firmware Layout" documentation entry for details */
+static int parse_lb_layout(struct xe_late_bind_fw *lb_fw,
+			   const void *data, size_t size, const char *fpt_entry)
+{
+	struct xe_device *xe = late_bind_fw_to_xe(lb_fw);
+	const struct csc_fpt_header *header = data;
+	const struct csc_fpt_entry *entry;
+	size_t min_size = sizeof(*header);
+	u32 offset;
+	int i;
+
+	/* fpt_entry is mandatory */
+	xe_assert(xe, fpt_entry);
+
+	if (size < min_size || header->header_marker != CSC_FPT_HEADER_MARKER)
+		return -ENOENT;
+
+	if (header->header_length < sizeof(struct csc_fpt_header)) {
+		drm_err(&xe->drm, "%s late binding fw: Invalid FPT header length %u!\n",
+			fw_id_to_name[lb_fw->id], header->header_length);
+		return -EINVAL;
+	}
+
+	min_size = header->header_length + sizeof(struct csc_fpt_entry) * header->num_of_entries;
+	if (size < min_size) {
+		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
+			fw_id_to_name[lb_fw->id], size, min_size);
+		return -ENODATA;
+	}
+
+	/* Look for the cpd header first */
+	entry = (void *)header + header->header_length;
+	for (i = 0; i < header->num_of_entries; i++, entry++)
+		if (strcmp(entry->name, fpt_entry) == 0)
+			offset = entry->offset;
+
+	if (!offset) {
+		drm_err(&xe->drm, "%s late binding fw: Failed to find fpt_entry\n",
+			fw_id_to_name[lb_fw->id]);
+		return -ENODATA;
+	}
+
+	min_size = offset + sizeof(struct gsc_cpd_header_v2);
+	if (size < min_size) {
+		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
+			fw_id_to_name[lb_fw->id], size, min_size);
+		return -ENODATA;
+	}
+
+	return parse_cpd_header(lb_fw, data + offset, size - offset, "LTES.man");
+}
+
+static const char *xe_late_bind_parse_status(uint32_t status)
+{
+	switch (status) {
+	case CSC_LATE_BINDING_STATUS_SUCCESS:
+		return "success";
+	case CSC_LATE_BINDING_STATUS_4ID_MISMATCH:
+		return "4Id Mismatch";
+	case CSC_LATE_BINDING_STATUS_ARB_FAILURE:
+		return "ARB Failure";
+	case CSC_LATE_BINDING_STATUS_GENERAL_ERROR:
+		return "General Error";
+	case CSC_LATE_BINDING_STATUS_INVALID_PARAMS:
+		return "Invalid Params";
+	case CSC_LATE_BINDING_STATUS_INVALID_SIGNATURE:
+		return "Invalid Signature";
+	case CSC_LATE_BINDING_STATUS_INVALID_PAYLOAD:
+		return "Invalid Payload";
+	case CSC_LATE_BINDING_STATUS_TIMEOUT:
+		return "Timeout";
+	default:
+		return "Unknown error";
+	}
+}
+
+static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
+{
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	u32 uval;
+
+	if (!xe_pcode_read(root_tile,
+			   PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), &uval, NULL))
+		return uval;
+	else
+		return 0;
+}
+
+void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
+{
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	struct xe_late_bind_fw *lbfw;
+	int fw_id;
+
+	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
+		lbfw = &late_bind->late_bind_fw[fw_id];
+		if (lbfw->payload && late_bind->wq) {
+			drm_dbg(&xe->drm, "Flush work: load %s firmware\n",
+				fw_id_to_name[lbfw->id]);
+			flush_work(&lbfw->work);
+		}
+	}
+}
+
+static void xe_late_bind_work(struct work_struct *work)
+{
+	struct xe_late_bind_fw *lbfw = container_of(work, struct xe_late_bind_fw, work);
+	struct xe_late_bind *late_bind = container_of(lbfw, struct xe_late_bind,
+						      late_bind_fw[lbfw->id]);
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	int retry = LB_FW_LOAD_RETRY_MAXCOUNT;
+	int ret;
+	int slept;
+
+	/* we can queue this before the component is bound */
+	for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
+		if (late_bind->component.ops)
+			break;
+		msleep(100);
+	}
+
+	if (!xe_pm_runtime_get_if_active(xe))
+		return;
+
+	mutex_lock(&late_bind->mutex);
+
+	if (!late_bind->component.ops) {
+		drm_err(&xe->drm, "Late bind component not bound\n");
+		goto out;
+	}
+
+	drm_dbg(&xe->drm, "Load %s firmware\n", fw_id_to_name[lbfw->id]);
+
+	do {
+		ret = late_bind->component.ops->push_config(late_bind->component.mei_dev,
+							    lbfw->type, lbfw->flags,
+							    lbfw->payload, lbfw->payload_size);
+		if (!ret)
+			break;
+		msleep(LB_FW_LOAD_RETRY_PAUSE_MS);
+	} while (--retry && ret == -EBUSY);
+
+	if (!ret) {
+		drm_dbg(&xe->drm, "Load %s firmware successful\n",
+			fw_id_to_name[lbfw->id]);
+		goto out;
+	}
+
+	if (ret > 0)
+		drm_err(&xe->drm, "Load %s firmware failed with err %d, %s\n",
+			fw_id_to_name[lbfw->id], ret, xe_late_bind_parse_status(ret));
+	else
+		drm_err(&xe->drm, "Load %s firmware failed with err %d",
+			fw_id_to_name[lbfw->id], ret);
+out:
+	mutex_unlock(&late_bind->mutex);
+	xe_pm_runtime_put(xe);
+}
+
+int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
+{
+	struct xe_late_bind_fw *lbfw;
+	int fw_id;
+
+	if (!late_bind->component_added)
+		return -ENODEV;
+
+	if (late_bind->disable)
+		return 0;
+
+	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
+		lbfw = &late_bind->late_bind_fw[fw_id];
+		if (lbfw->payload)
+			queue_work(late_bind->wq, &lbfw->work);
+	}
+	return 0;
+}
+
+static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
+{
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct xe_late_bind_fw *lb_fw;
+	const struct firmware *fw;
+	u32 num_fans;
+	int ret;
+
+	if (fw_id >= XE_LB_FW_MAX_ID)
+		return -EINVAL;
+
+	lb_fw = &late_bind->late_bind_fw[fw_id];
+
+	lb_fw->id = fw_id;
+	lb_fw->type = fw_id_to_type[lb_fw->id];
+	lb_fw->flags &= ~CSC_LATE_BINDING_FLAGS_IS_PERSISTENT;
+
+	if (lb_fw->type == CSC_LATE_BINDING_TYPE_FAN_CONTROL) {
+		num_fans = xe_late_bind_fw_num_fans(late_bind);
+		drm_dbg(&xe->drm, "Number of Fans: %d\n", num_fans);
+		if (!num_fans)
+			return 0;
+	}
+
+	snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x_%04x_%04x.bin",
+		 fw_id_to_name[lb_fw->id], pdev->device,
+		 pdev->subsystem_vendor, pdev->subsystem_device);
+
+	drm_dbg(&xe->drm, "Request late binding firmware %s\n", lb_fw->blob_path);
+	ret = firmware_request_nowarn(&fw, lb_fw->blob_path, xe->drm.dev);
+	if (ret) {
+		drm_dbg(&xe->drm, "%s late binding fw not available for current device",
+			fw_id_to_name[lb_fw->id]);
+		return 0;
+	}
+
+	if (fw->size > MAX_PAYLOAD_SIZE) {
+		drm_err(&xe->drm, "Firmware %s size %zu is larger than max pay load size %u\n",
+			lb_fw->blob_path, fw->size, MAX_PAYLOAD_SIZE);
+		release_firmware(fw);
+		return -ENODATA;
+	}
+
+	ret = parse_lb_layout(lb_fw, fw->data, fw->size, "LTES");
+	if (ret)
+		return ret;
+
+	lb_fw->payload_size = fw->size;
+	lb_fw->payload = drmm_kzalloc(&xe->drm, lb_fw->payload_size, GFP_KERNEL);
+	if (!lb_fw->payload) {
+		release_firmware(fw);
+		return -ENOMEM;
+	}
+
+	drm_info(&xe->drm, "Using %s firmware from %s version %u.%u.%u.%u\n",
+		 fw_id_to_name[lb_fw->id], lb_fw->blob_path,
+		 lb_fw->version.major, lb_fw->version.minor,
+		 lb_fw->version.hotfix, lb_fw->version.build);
+
+	memcpy((void *)lb_fw->payload, fw->data, lb_fw->payload_size);
+	release_firmware(fw);
+	INIT_WORK(&lb_fw->work, xe_late_bind_work);
+
+	return 0;
+}
+
+static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
+{
+	int ret;
+	int fw_id;
+
+	late_bind->wq = alloc_ordered_workqueue("late-bind-ordered-wq", 0);
+	if (!late_bind->wq)
+		return -ENOMEM;
+
+	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
+		ret = __xe_late_bind_fw_init(late_bind, fw_id);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int xe_late_bind_component_bind(struct device *xe_kdev,
+				       struct device *mei_kdev, void *data)
+{
+	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
+	struct xe_late_bind *late_bind = &xe->late_bind;
+
+	mutex_lock(&late_bind->mutex);
+	late_bind->component.ops = data;
+	late_bind->component.mei_dev = mei_kdev;
+	mutex_unlock(&late_bind->mutex);
+
+	return 0;
+}
+
+static void xe_late_bind_component_unbind(struct device *xe_kdev,
+					  struct device *mei_kdev, void *data)
+{
+	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
+	struct xe_late_bind *late_bind = &xe->late_bind;
+
+	xe_late_bind_wait_for_worker_completion(late_bind);
+
+	mutex_lock(&late_bind->mutex);
+	late_bind->component.ops = NULL;
+	mutex_unlock(&late_bind->mutex);
+}
+
+static const struct component_ops xe_late_bind_component_ops = {
+	.bind   = xe_late_bind_component_bind,
+	.unbind = xe_late_bind_component_unbind,
+};
+
+static void xe_late_bind_remove(void *arg)
+{
+	struct xe_late_bind *late_bind = arg;
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+
+	xe_late_bind_wait_for_worker_completion(late_bind);
+
+	late_bind->component_added = false;
+
+	component_del(xe->drm.dev, &xe_late_bind_component_ops);
+	if (late_bind->wq) {
+		destroy_workqueue(late_bind->wq);
+		late_bind->wq = NULL;
+	}
+	mutex_destroy(&late_bind->mutex);
+}
+
+/**
+ * xe_late_bind_init() - add xe mei late binding component
+ *
+ * Return: 0 if the initialization was successful, a negative errno otherwise.
+ */
+int xe_late_bind_init(struct xe_late_bind *late_bind)
+{
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	int err;
+
+	if (!xe->info.has_late_bind)
+		return 0;
+
+	mutex_init(&late_bind->mutex);
+
+	if (!IS_ENABLED(CONFIG_INTEL_MEI_LATE_BIND) || !IS_ENABLED(CONFIG_INTEL_MEI_GSC)) {
+		drm_info(&xe->drm, "Can't init xe mei late bind missing mei component\n");
+		return -ENODEV;
+	}
+
+	err = component_add_typed(xe->drm.dev, &xe_late_bind_component_ops,
+				  INTEL_COMPONENT_LATE_BIND);
+	if (err < 0) {
+		drm_info(&xe->drm, "Failed to add mei late bind component (%pe)\n", ERR_PTR(err));
+		return err;
+	}
+
+	late_bind->component_added = true;
+
+	err = devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
+	if (err)
+		return err;
+
+	err = xe_late_bind_fw_init(late_bind);
+	if (err)
+		return err;
+
+	return xe_late_bind_fw_load(late_bind);
+}
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
new file mode 100644
index 000000000000..07e437390539
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_LATE_BIND_FW_H_
+#define _XE_LATE_BIND_FW_H_
+
+#include <linux/types.h>
+
+struct xe_late_bind;
+
+int xe_late_bind_init(struct xe_late_bind *late_bind);
+int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
+void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
new file mode 100644
index 000000000000..37cb20a47e61
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_LATE_BIND_TYPES_H_
+#define _XE_LATE_BIND_TYPES_H_
+
+#include <linux/iosys-map.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+#include "xe_uc_fw_abi.h"
+
+#define MAX_PAYLOAD_SIZE SZ_4K
+
+/**
+ * xe_late_bind_fw_id - enum to determine late binding fw index
+ */
+enum xe_late_bind_fw_id {
+	XE_LB_FW_FAN_CONTROL = 0,
+	XE_LB_FW_MAX_ID
+};
+
+/**
+ * struct xe_late_bind_fw
+ */
+struct xe_late_bind_fw {
+	/** @late_bind_fw.id: firmware index */
+	u32 id;
+	/** @late_bind_fw.blob_path: firmware binary path */
+	char blob_path[PATH_MAX];
+	/** @late_bind_fw.type: firmware type */
+	u32  type;
+	/** @late_bind_fw.flags: firmware flags */
+	u32  flags;
+	/** @late_bind_fw.payload: to store the late binding blob */
+	const u8  *payload;
+	/** @late_bind_fw.payload_size: late binding blob payload_size */
+	size_t payload_size;
+	/** @late_bind_fw.work: worker to upload latebind blob */
+	struct work_struct work;
+	/** @late_bind_fw.version: late binding blob manifest version */
+	struct gsc_version version;
+};
+
+/**
+ * struct xe_late_bind_component - Late Binding services component
+ * @mei_dev: device that provide Late Binding service.
+ * @ops: Ops implemented by Late Binding driver, used by Xe driver.
+ *
+ * Communication between Xe and MEI drivers for Late Binding services
+ */
+struct xe_late_bind_component {
+	/** @late_bind_component.mei_dev: mei device */
+	struct device *mei_dev;
+	/** @late_bind_component.ops: late binding ops */
+	const struct late_bind_component_ops *ops;
+};
+
+/**
+ * struct xe_late_bind
+ */
+struct xe_late_bind {
+	/** @late_bind.component: struct for communication with mei component */
+	struct xe_late_bind_component component;
+	/** @late_bind.mutex: protects the component binding and usage */
+	struct mutex mutex;
+	/** @late_bind.late_bind_fw: late binding firmware array */
+	struct xe_late_bind_fw late_bind_fw[XE_LB_FW_MAX_ID];
+	/** @late_bind.wq: workqueue to submit request to download late bind blob */
+	struct workqueue_struct *wq;
+	/** @late_bind.component_added: whether the component has been added */
+	bool component_added;
+	/** @late_bind.disable to block late binding reload during pm resume flow*/
+	bool disable;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 08e21d4099e0..e5018d3ae74f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -66,6 +66,7 @@ struct xe_device_desc {
 	u8 has_gsc_nvm:1;
 	u8 has_heci_gscfi:1;
 	u8 has_heci_cscfi:1;
+	u8 has_late_bind:1;
 	u8 has_llc:1;
 	u8 has_mbx_power_limits:1;
 	u8 has_pxp:1;
@@ -355,6 +356,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_mbx_power_limits = true,
 	.has_gsc_nvm = 1,
 	.has_heci_cscfi = 1,
+	.has_late_bind = true,
 	.needs_scratch = true,
 };
 
@@ -600,6 +602,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
+	xe->info.has_late_bind = desc->has_late_bind;
 	xe->info.has_llc = desc->has_llc;
 	xe->info.has_pxp = desc->has_pxp;
 	xe->info.has_sriov = desc->has_sriov;
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index ff749edc005b..f49b7b6eab97 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -20,6 +20,7 @@
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_irq.h"
+#include "xe_late_bind_fw.h"
 #include "xe_pcode.h"
 #include "xe_pxp.h"
 #include "xe_trace.h"
@@ -126,6 +127,8 @@ int xe_pm_suspend(struct xe_device *xe)
 	if (err)
 		goto err;
 
+	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
+
 	for_each_gt(gt, xe, id)
 		xe_gt_suspend_prepare(gt);
 
@@ -204,6 +207,8 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	xe_late_bind_fw_load(&xe->late_bind);
+
 	drm_dbg(&xe->drm, "Device resumed\n");
 	return 0;
 err:
@@ -460,6 +465,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	if (err)
 		goto out;
 
+	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
+
 	/*
 	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
 	 * also checks and deletes bo entry from user fault list.
@@ -550,6 +557,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	if (xe->d3cold.allowed)
+		xe_late_bind_fw_load(&xe->late_bind);
+
 out:
 	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
index 87ade41209d0..78782d105fa9 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
@@ -318,4 +318,70 @@ struct gsc_manifest_header {
 	u32 exponent_size; /* in dwords */
 } __packed;
 
+/**
+ * DOC: Late binding Firmware Layout
+ *
+ * The Late binding binary starts with FPT header, which contains locations
+ * of various partitions of the binary. Here we're interested in finding out
+ * manifest version. To the manifest version, we need to locate CPD header
+ * one of the entry in CPD header points to manifest header. Manifest header
+ * contains the version.
+ *
+ *      +================================================+
+ *      |  FPT Header                                    |
+ *      +================================================+
+ *      |  FPT entries[]                                 |
+ *      |      entry1                                    |
+ *      |      ...                                       |
+ *      |      entryX                                    |
+ *      |          "LTES"                                |
+ *      |          ...                                   |
+ *      |          offset  >-----------------------------|------o
+ *      +================================================+      |
+ *                                                              |
+ *      +================================================+      |
+ *      |  CPD Header                                    |<-----o
+ *      +================================================+
+ *      |  CPD entries[]                                 |
+ *      |      entry1                                    |
+ *      |      ...                                       |
+ *      |      entryX                                    |
+ *      |          "LTES.man"                            |
+ *      |           ...                                  |
+ *      |           offset  >----------------------------|------o
+ *      +================================================+      |
+ *                                                              |
+ *      +================================================+      |
+ *      |  Manifest Header                               |<-----o
+ *      |      ...                                       |
+ *      |      FW version                                |
+ *      |      ...                                       |
+ *      +================================================+
+ */
+
+/* FPT Headers */
+struct csc_fpt_header {
+	u32 header_marker;
+#define CSC_FPT_HEADER_MARKER 0x54504624
+	u32 num_of_entries;
+	u8 header_version;
+	u8 entry_version;
+	u8 header_length; /* in bytes */
+	u8 flags;
+	u16 ticks_to_add;
+	u16 tokens_to_add;
+	u32 uma_size;
+	u32 crc32;
+	struct gsc_version fitc_version;
+} __packed;
+
+struct csc_fpt_entry {
+	u8 name[4]; /* partition name */
+	u32 reserved1;
+	u32 offset; /* offset from beginning of CSE region */
+	u32 length; /* partition length in bytes */
+	u32 reserved2[3];
+	u32 partition_flags;
+} __packed;
+
 #endif
diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig
index 7575fee96cc6..771becc68095 100644
--- a/drivers/misc/mei/Kconfig
+++ b/drivers/misc/mei/Kconfig
@@ -84,5 +84,6 @@ config INTEL_MEI_VSC
 source "drivers/misc/mei/hdcp/Kconfig"
 source "drivers/misc/mei/pxp/Kconfig"
 source "drivers/misc/mei/gsc_proxy/Kconfig"
+source "drivers/misc/mei/late_bind/Kconfig"
 
 endif
diff --git a/drivers/misc/mei/Makefile b/drivers/misc/mei/Makefile
index 6f9fdbf1a495..84bfde888d81 100644
--- a/drivers/misc/mei/Makefile
+++ b/drivers/misc/mei/Makefile
@@ -31,6 +31,7 @@ CFLAGS_mei-trace.o = -I$(src)
 obj-$(CONFIG_INTEL_MEI_HDCP) += hdcp/
 obj-$(CONFIG_INTEL_MEI_PXP) += pxp/
 obj-$(CONFIG_INTEL_MEI_GSC_PROXY) += gsc_proxy/
+obj-$(CONFIG_INTEL_MEI_LATE_BIND) += late_bind/
 
 obj-$(CONFIG_INTEL_MEI_VSC_HW) += mei-vsc-hw.o
 mei-vsc-hw-y := vsc-tp.o
diff --git a/drivers/misc/mei/bus.c b/drivers/misc/mei/bus.c
index 67176caf5416..f860b1b6eda0 100644
--- a/drivers/misc/mei/bus.c
+++ b/drivers/misc/mei/bus.c
@@ -614,6 +614,19 @@ u8 mei_cldev_ver(const struct mei_cl_device *cldev)
 }
 EXPORT_SYMBOL_GPL(mei_cldev_ver);
 
+/**
+ * mei_cldev_mtu - max message that client can send and receive
+ *
+ * @cldev: mei client device
+ *
+ * Return: mtu or 0 if client is not connected
+ */
+size_t mei_cldev_mtu(const struct mei_cl_device *cldev)
+{
+	return mei_cl_mtu(cldev->cl);
+}
+EXPORT_SYMBOL_GPL(mei_cldev_mtu);
+
 /**
  * mei_cldev_enabled - check whether the device is enabled
  *
diff --git a/drivers/misc/mei/late_bind/Kconfig b/drivers/misc/mei/late_bind/Kconfig
new file mode 100644
index 000000000000..65c7180c5678
--- /dev/null
+++ b/drivers/misc/mei/late_bind/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025, Intel Corporation. All rights reserved.
+#
+config INTEL_MEI_LATE_BIND
+	tristate "Intel late binding support on ME Interface"
+	select INTEL_MEI_ME
+	depends on DRM_XE
+	help
+	  MEI Support for Late Binding for Intel graphics card.
+
+	  Enables the ME FW interfaces for Late Binding feature,
+	  allowing loading of firmware for the devices like Fan
+	  Controller during by Intel Xe driver.
diff --git a/drivers/misc/mei/late_bind/Makefile b/drivers/misc/mei/late_bind/Makefile
new file mode 100644
index 000000000000..a0aeda5853f0
--- /dev/null
+++ b/drivers/misc/mei/late_bind/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2025, Intel Corporation. All rights reserved.
+#
+# Makefile - Late Binding client driver for Intel MEI Bus Driver.
+
+subdir-ccflags-y += -I$(srctree)/drivers/misc/mei/
+
+obj-$(CONFIG_INTEL_MEI_LATE_BIND) += mei_late_bind.o
diff --git a/drivers/misc/mei/late_bind/mei_late_bind.c b/drivers/misc/mei/late_bind/mei_late_bind.c
new file mode 100644
index 000000000000..e55beefa0e0b
--- /dev/null
+++ b/drivers/misc/mei/late_bind/mei_late_bind.c
@@ -0,0 +1,281 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Intel Corporation
+ */
+#include <drm/intel/i915_component.h>
+#include <drm/intel/late_bind_mei_interface.h>
+#include <linux/component.h>
+#include <linux/pci.h>
+#include <linux/mei_cl_bus.h>
+#include <linux/module.h>
+#include <linux/overflow.h>
+#include <linux/slab.h>
+#include <linux/uuid.h>
+
+#include "mkhi.h"
+
+#define GFX_SRV_MKHI_LATE_BINDING_CMD 0x12
+#define GFX_SRV_MKHI_LATE_BINDING_RSP (GFX_SRV_MKHI_LATE_BINDING_CMD | 0x80)
+
+#define LATE_BIND_SEND_TIMEOUT_MSEC 3000
+#define LATE_BIND_RECV_TIMEOUT_MSEC 3000
+
+/**
+ * struct csc_heci_late_bind_req - late binding request
+ * @header: @ref mkhi_msg_hdr
+ * @type: type of the late binding payload
+ * @flags: flags to be passed to the firmware
+ * @reserved: reserved field
+ * @payload_size: size of the payload data in bytes
+ * @payload: data to be sent to the firmware
+ */
+struct csc_heci_late_bind_req {
+	struct mkhi_msg_hdr header;
+	u32 type;
+	u32 flags;
+	u32 reserved[2];
+	u32 payload_size;
+	u8  payload[] __counted_by(payload_size);
+} __packed;
+
+/**
+ * struct csc_heci_late_bind_rsp - late binding response
+ * @header: @ref mkhi_msg_hdr
+ * @type: type of the late binding payload
+ * @reserved: reserved field
+ * @status: status of the late binding command execution by firmware
+ */
+struct csc_heci_late_bind_rsp {
+	struct mkhi_msg_hdr header;
+	u32 type;
+	u32 reserved[2];
+	u32 status;
+} __packed;
+
+static int mei_late_bind_check_response(const struct device *dev, const struct mkhi_msg_hdr *hdr)
+{
+	if (hdr->group_id != MKHI_GROUP_ID_GFX) {
+		dev_err(dev, "Mismatch group id: 0x%x instead of 0x%x\n",
+			hdr->group_id, MKHI_GROUP_ID_GFX);
+		return -EINVAL;
+	}
+
+	if (hdr->command != GFX_SRV_MKHI_LATE_BINDING_RSP) {
+		dev_err(dev, "Mismatch command: 0x%x instead of 0x%x\n",
+			hdr->command, GFX_SRV_MKHI_LATE_BINDING_RSP);
+		return -EINVAL;
+	}
+
+	if (hdr->result) {
+		dev_err(dev, "Error in result: 0x%x\n", hdr->result);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * mei_late_bind_push_config - Sends a config to the firmware.
+ * @dev: device struct corresponding to the mei device
+ * @type: payload type
+ * @flags: payload flags
+ * @payload: payload buffer
+ * @payload_size: payload buffer size
+ *
+ * Return: 0 success, negative errno value on transport failure,
+ *         positive status returned by FW
+ */
+static int mei_late_bind_push_config(struct device *dev, u32 type, u32 flags,
+				     const void *payload, size_t payload_size)
+{
+	struct mei_cl_device *cldev;
+	struct csc_heci_late_bind_req *req = NULL;
+	struct csc_heci_late_bind_rsp rsp;
+	size_t req_size;
+	ssize_t ret;
+
+	if (!dev || !payload || !payload_size)
+		return -EINVAL;
+
+	cldev = to_mei_cl_device(dev);
+
+	ret = mei_cldev_enable(cldev);
+	if (ret < 0) {
+		dev_dbg(dev, "mei_cldev_enable failed. %zd\n", ret);
+		return ret;
+	}
+
+	req_size = struct_size(req, payload, payload_size);
+	if (req_size > mei_cldev_mtu(cldev)) {
+		dev_err(dev, "Payload is too big %zu\n", payload_size);
+		ret = -EMSGSIZE;
+		goto end;
+	}
+
+	req = kmalloc(req_size, GFP_KERNEL);
+	if (!req) {
+		ret = -ENOMEM;
+		goto end;
+	}
+
+	req->header.group_id = MKHI_GROUP_ID_GFX;
+	req->header.command = GFX_SRV_MKHI_LATE_BINDING_CMD;
+	req->type = type;
+	req->flags = flags;
+	req->reserved[0] = 0;
+	req->reserved[1] = 0;
+	req->payload_size = payload_size;
+	memcpy(req->payload, payload, payload_size);
+
+	ret = mei_cldev_send_timeout(cldev, (void *)req, req_size, LATE_BIND_SEND_TIMEOUT_MSEC);
+	if (ret < 0) {
+		dev_err(dev, "mei_cldev_send failed. %zd\n", ret);
+		goto end;
+	}
+
+	ret = mei_cldev_recv_timeout(cldev, (void *)&rsp, sizeof(rsp), LATE_BIND_RECV_TIMEOUT_MSEC);
+	if (ret < 0) {
+		dev_err(dev, "mei_cldev_recv failed. %zd\n", ret);
+		goto end;
+	}
+	if (ret < sizeof(rsp.header)) {
+		dev_err(dev, "bad response header from the firmware: size %zd < %zu\n",
+			ret, sizeof(rsp.header));
+		goto end;
+	}
+	if (ret < sizeof(rsp)) {
+		dev_err(dev, "bad response from the firmware: size %zd < %zu\n",
+			ret, sizeof(rsp));
+		goto end;
+	}
+
+	ret = mei_late_bind_check_response(dev, &rsp.header);
+	if (ret) {
+		dev_err(dev, "bad result response from the firmware: 0x%x\n",
+			*(uint32_t *)&rsp.header);
+		goto end;
+	}
+
+	ret = (int)rsp.status;
+	dev_dbg(dev, "%s status = %zd\n", __func__, ret);
+
+end:
+	mei_cldev_disable(cldev);
+	kfree(req);
+	return ret;
+}
+
+static const struct late_bind_component_ops mei_late_bind_ops = {
+	.owner = THIS_MODULE,
+	.push_config = mei_late_bind_push_config,
+};
+
+static int mei_component_master_bind(struct device *dev)
+{
+	return component_bind_all(dev, (void *)&mei_late_bind_ops);
+}
+
+static void mei_component_master_unbind(struct device *dev)
+{
+	component_unbind_all(dev, (void *)&mei_late_bind_ops);
+}
+
+static const struct component_master_ops mei_component_master_ops = {
+	.bind = mei_component_master_bind,
+	.unbind = mei_component_master_unbind,
+};
+
+/**
+ * mei_late_bind_component_match - compare function for matching mei late bind.
+ *
+ *    The function checks if requester is Intel PCI_CLASS_DISPLAY_VGA or
+ *    PCI_CLASS_DISPLAY_OTHER device, and checks if the requester is the
+ *    grand parent of mei_if i.e. late_bind mei device
+ *
+ * @dev: master device
+ * @subcomponent: subcomponent to match (INTEL_COMPONENT_LATE_BIND)
+ * @data: compare data (late_bind mei device on mei bus)
+ *
+ * Return:
+ * * 1 - if components match
+ * * 0 - otherwise
+ */
+static int mei_late_bind_component_match(struct device *dev, int subcomponent,
+					 void *data)
+{
+	struct device *base = data;
+	struct pci_dev *pdev;
+
+	if (!dev)
+		return 0;
+
+	if (!dev_is_pci(dev))
+		return 0;
+
+	pdev = to_pci_dev(dev);
+
+	if (pdev->vendor != PCI_VENDOR_ID_INTEL)
+		return 0;
+
+	if (pdev->class != (PCI_CLASS_DISPLAY_VGA << 8) &&
+	    pdev->class != (PCI_CLASS_DISPLAY_OTHER << 8))
+		return 0;
+
+	if (subcomponent != INTEL_COMPONENT_LATE_BIND)
+		return 0;
+
+	base = base->parent;
+	if (!base) /* mei device */
+		return 0;
+
+	base = base->parent; /* pci device */
+
+	return !!base && dev == base;
+}
+
+static int mei_late_bind_probe(struct mei_cl_device *cldev,
+			       const struct mei_cl_device_id *id)
+{
+	struct component_match *master_match = NULL;
+	int ret;
+
+	component_match_add_typed(&cldev->dev, &master_match,
+				  mei_late_bind_component_match, &cldev->dev);
+	if (IS_ERR_OR_NULL(master_match))
+		return -ENOMEM;
+
+	ret = component_master_add_with_match(&cldev->dev,
+					      &mei_component_master_ops,
+					      master_match);
+	if (ret < 0)
+		dev_err(&cldev->dev, "Master comp add failed %d\n", ret);
+
+	return ret;
+}
+
+static void mei_late_bind_remove(struct mei_cl_device *cldev)
+{
+	component_master_del(&cldev->dev, &mei_component_master_ops);
+}
+
+#define MEI_GUID_MKHI UUID_LE(0xe2c2afa2, 0x3817, 0x4d19, \
+			      0x9d, 0x95, 0x6, 0xb1, 0x6b, 0x58, 0x8a, 0x5d)
+
+static struct mei_cl_device_id mei_late_bind_tbl[] = {
+	{ .uuid = MEI_GUID_MKHI, .version = MEI_CL_VERSION_ANY },
+	{ }
+};
+MODULE_DEVICE_TABLE(mei, mei_late_bind_tbl);
+
+static struct mei_cl_driver mei_late_bind_driver = {
+	.id_table = mei_late_bind_tbl,
+	.name = KBUILD_MODNAME,
+	.probe = mei_late_bind_probe,
+	.remove	= mei_late_bind_remove,
+};
+
+module_mei_cl_driver(mei_late_bind_driver);
+
+MODULE_AUTHOR("Intel Corporation");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MEI Late Binding");
diff --git a/include/drm/intel/i915_component.h b/include/drm/intel/i915_component.h
index 4ea3b17aa143..456849a97d75 100644
--- a/include/drm/intel/i915_component.h
+++ b/include/drm/intel/i915_component.h
@@ -31,6 +31,7 @@ enum i915_component_type {
 	I915_COMPONENT_HDCP,
 	I915_COMPONENT_PXP,
 	I915_COMPONENT_GSC_PROXY,
+	INTEL_COMPONENT_LATE_BIND,
 };
 
 /* MAX_PORT is the number of port
diff --git a/include/drm/intel/late_bind_mei_interface.h b/include/drm/intel/late_bind_mei_interface.h
new file mode 100644
index 000000000000..ec58ef1ab4e8
--- /dev/null
+++ b/include/drm/intel/late_bind_mei_interface.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (c) 2025 Intel Corporation
+ */
+
+#ifndef _LATE_BIND_MEI_INTERFACE_H_
+#define _LATE_BIND_MEI_INTERFACE_H_
+
+#include <linux/types.h>
+
+struct device;
+struct module;
+
+/**
+ * Late Binding flags
+ * Persistent across warm reset
+ */
+#define CSC_LATE_BINDING_FLAGS_IS_PERSISTENT	BIT(0)
+
+/**
+ * xe_late_bind_fw_type - enum to determine late binding fw type
+ */
+enum late_bind_type {
+	CSC_LATE_BINDING_TYPE_FAN_CONTROL = 1,
+};
+
+/**
+ * Late Binding payload status
+ */
+enum csc_late_binding_status {
+	CSC_LATE_BINDING_STATUS_SUCCESS           = 0,
+	CSC_LATE_BINDING_STATUS_4ID_MISMATCH      = 1,
+	CSC_LATE_BINDING_STATUS_ARB_FAILURE       = 2,
+	CSC_LATE_BINDING_STATUS_GENERAL_ERROR     = 3,
+	CSC_LATE_BINDING_STATUS_INVALID_PARAMS    = 4,
+	CSC_LATE_BINDING_STATUS_INVALID_SIGNATURE = 5,
+	CSC_LATE_BINDING_STATUS_INVALID_PAYLOAD   = 6,
+	CSC_LATE_BINDING_STATUS_TIMEOUT           = 7,
+};
+
+/**
+ * struct late_bind_component_ops - ops for Late Binding services.
+ * @owner: Module providing the ops
+ * @push_config: Sends a config to FW.
+ */
+struct late_bind_component_ops {
+	struct module *owner;
+
+	/**
+	 * @push_config: Sends a config to FW.
+	 * @dev: device struct corresponding to the mei device
+	 * @type: payload type
+	 * @flags: payload flags
+	 * @payload: payload buffer
+	 * @payload_size: payload buffer size
+	 *
+	 * Return: 0 success, negative errno value on transport failure,
+	 *         positive status returned by FW
+	 */
+	int (*push_config)(struct device *dev, u32 type, u32 flags,
+			   const void *payload, size_t payload_size);
+};
+
+#endif /* _LATE_BIND_MEI_INTERFACE_H_ */
diff --git a/include/linux/mei_cl_bus.h b/include/linux/mei_cl_bus.h
index 725fd7727422..a82755e1fc40 100644
--- a/include/linux/mei_cl_bus.h
+++ b/include/linux/mei_cl_bus.h
@@ -113,6 +113,7 @@ int mei_cldev_register_notif_cb(struct mei_cl_device *cldev,
 				mei_cldev_cb_t notif_cb);
 
 u8 mei_cldev_ver(const struct mei_cl_device *cldev);
+size_t mei_cldev_mtu(const struct mei_cl_device *cldev);
 
 void *mei_cldev_get_drvdata(const struct mei_cl_device *cldev);
 void mei_cldev_set_drvdata(struct mei_cl_device *cldev, void *data);
-- 
2.34.1

