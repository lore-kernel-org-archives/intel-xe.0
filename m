Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F80C5B552
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 18:51:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21EB910E5CA;
	Tue, 10 Jun 2025 18:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FPaxGekv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443C810E5CA
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 18:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749581482; x=1781117482;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=701I6QHBlA54USh+x+kl5Rc3n3+9CHlL3CXGGmTi/nI=;
 b=FPaxGekvNFvXDqo6Mur0VVeIw3VvRVlbhp6FzRviRF7uZepAo2vG25df
 0YL48nkURF70w/W+40/pdmqxXuGu0NwS72CTEahfT1BtkecCIubGt62nc
 MpYB84vCobPcmKpzltwPngE3jXL+MLSKYwPmcfql8t3Fl2os0abI2JGE1
 JAhE7PA8hWjPCx/rZ9eum2HO6iOcMoXS7uv94AmN+2uEIVXIxqLDqILbD
 Ext87XbgI07fMAco9Yb9k37Eb3n90DE19pCdQncKz8B4P7MzKnuSSl31c
 PFSVn8VE2nv6JVFKiYfBOLQreTsPjnYcWbLTI4nIh14gy/VpLbDIX/r0C g==;
X-CSE-ConnectionGUID: rN/hETkLT3yhKmiOJPpQEA==
X-CSE-MsgGUID: T1si1oKmQCy1rWkRGXwARg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="50932836"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="50932836"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 11:51:21 -0700
X-CSE-ConnectionGUID: aj8WsWRKTOWEx5ij9nrz5w==
X-CSE-MsgGUID: bP8cC1QiRh+YDVOVXbkxJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="146906051"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 11:51:20 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: xe_late_bind squash for CI
Date: Wed, 11 Jun 2025 00:24:55 +0530
Message-Id: <20250610185455.1612731-1-badal.nilawar@intel.com>
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

Do not review

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 Documentation/userspace-api/fwctl/index.rst   |   1 +
 .../userspace-api/fwctl/xe_pcode_fwctl.rst    |  17 +
 drivers/gpu/drm/xe/Kconfig                    |   2 +
 drivers/gpu/drm/xe/Makefile                   |   2 +
 drivers/gpu/drm/xe/xe_debugfs.c               |  42 +++
 drivers/gpu/drm/xe/xe_device.c                |   5 +
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_late_bind_fw.c          | 300 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_late_bind_fw.h          |  18 ++
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h    |  84 +++++
 drivers/gpu/drm/xe/xe_pci.c                   |   5 +
 drivers/gpu/drm/xe/xe_pcode_fwctl.c           | 212 +++++++++++++
 drivers/gpu/drm/xe/xe_pcode_fwctl.h           |  13 +
 drivers/gpu/drm/xe/xe_pm.c                    |   9 +
 drivers/misc/mei/Kconfig                      |   1 +
 drivers/misc/mei/Makefile                     |   1 +
 drivers/misc/mei/bus.c                        |  13 +
 drivers/misc/mei/late_bind/Kconfig            |  12 +
 drivers/misc/mei/late_bind/Makefile           |   9 +
 drivers/misc/mei/late_bind/mei_late_bind.c    | 261 +++++++++++++++
 include/drm/intel/i915_component.h            |   1 +
 include/drm/intel/late_bind_mei_interface.h   |  37 +++
 include/linux/mei_cl_bus.h                    |   1 +
 include/uapi/fwctl/fwctl.h                    |   1 +
 include/uapi/fwctl/xe_pcode.h                 |  82 +++++
 25 files changed, 1133 insertions(+)
 create mode 100644 Documentation/userspace-api/fwctl/xe_pcode_fwctl.rst
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
 create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_pcode_fwctl.c
 create mode 100644 drivers/gpu/drm/xe/xe_pcode_fwctl.h
 create mode 100644 drivers/misc/mei/late_bind/Kconfig
 create mode 100644 drivers/misc/mei/late_bind/Makefile
 create mode 100644 drivers/misc/mei/late_bind/mei_late_bind.c
 create mode 100644 include/drm/intel/late_bind_mei_interface.h
 create mode 100644 include/uapi/fwctl/xe_pcode.h

diff --git a/Documentation/userspace-api/fwctl/index.rst b/Documentation/userspace-api/fwctl/index.rst
index 316ac456ad3b..186f8cf17583 100644
--- a/Documentation/userspace-api/fwctl/index.rst
+++ b/Documentation/userspace-api/fwctl/index.rst
@@ -12,3 +12,4 @@ to securely construct and execute RPCs inside device firmware.
    fwctl
    fwctl-cxl
    pds_fwctl
+   xe_pcode_fwctl
diff --git a/Documentation/userspace-api/fwctl/xe_pcode_fwctl.rst b/Documentation/userspace-api/fwctl/xe_pcode_fwctl.rst
new file mode 100644
index 000000000000..c16d0675a485
--- /dev/null
+++ b/Documentation/userspace-api/fwctl/xe_pcode_fwctl.rst
@@ -0,0 +1,17 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+==================
+fwctl drm/xe pcode
+==================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_pcode_fwctl.c
+   :doc: XE PCODE FWCTL
+
+uAPI
+====
+
+.. kernel-doc:: include/uapi/fwctl/xe_pcode.h
+   :internal:
+
+.. kernel-doc:: include/uapi/fwctl/xe_pcode.h
+   :doc: Late Binding Commands
diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index c57f1da0791d..e42edea10717 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -44,6 +44,8 @@ config DRM_XE
 	select WANT_DEV_COREDUMP
 	select AUXILIARY_BUS
 	select HMM_MIRROR
+	select INTEL_MEI_LATE_BIND
+	select FWCTL
 	help
 	  Experimental driver for Intel Xe series GPUs
 
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index f5f5775acdc0..93e4fdc5eebd 100644
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
@@ -85,6 +86,7 @@ xe-y += xe_bb.o \
 	xe_pat.o \
 	xe_pci.o \
 	xe_pcode.o \
+	xe_pcode_fwctl.o \
 	xe_pm.o \
 	xe_preempt_fence.o \
 	xe_pt.o \
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d83cd6ed3fa8..1c145089d177 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -226,6 +226,45 @@ static const struct file_operations atomic_svm_timeslice_ms_fops = {
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
+	late_bind->disable = (uval == 1) ? true : false;
+
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
@@ -249,6 +288,9 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("atomic_svm_timeslice_ms", 0600, root, xe,
 			    &atomic_svm_timeslice_ms_fops);
 
+	debugfs_create_file("disable_late_binding", 0600, root, xe,
+			    &disable_late_binding_fops);
+
 	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
 		man = ttm_manager_type(bdev, mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 7d9a31868ea9..c15e8fccfa4a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -43,6 +43,7 @@
 #include "xe_hw_engine_group.h"
 #include "xe_hwmon.h"
 #include "xe_irq.h"
+#include "xe_late_bind_fw.h"
 #include "xe_memirq.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
@@ -889,6 +890,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe_late_bind_init(&xe->late_bind);
+
+	xe_late_bind_fw_init(&xe->late_bind);
+
 	err = xe_oa_init(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index e5d02a47a528..7b7c06c0c754 100644
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
@@ -548,6 +549,9 @@ struct xe_device {
 	/** @heci_gsc: graphics security controller */
 	struct xe_heci_gsc heci_gsc;
 
+	/** @late_bind: xe mei late bind interface */
+	struct xe_late_bind late_bind;
+
 	/** @oa: oa observation subsystem */
 	struct xe_oa oa;
 
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
new file mode 100644
index 000000000000..f9d3d0f341f2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -0,0 +1,300 @@
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
+#define LB_FW_LOAD_RETRY_MAXCOUNT 40
+#define LB_FW_LOAD_RETRY_PAUSE_MS 50
+
+static const char * const fw_type_to_name[] = {
+		[CSC_LATE_BINDING_TYPE_FAN_CONTROL] = "fan_control",
+	};
+
+static struct xe_device *late_bind_to_xe(struct xe_late_bind *late_bind)
+{
+	return container_of(late_bind, struct xe_device, late_bind);
+}
+
+static int late_bind_fw_num_fans(struct xe_late_bind *late_bind)
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
+
+	lbfw = &late_bind->late_bind_fw;
+	if (lbfw->valid && late_bind->wq) {
+		drm_dbg(&xe->drm, "Flush work: load %s firmware\n",
+			fw_type_to_name[lbfw->type]);
+			flush_work(&lbfw->work);
+	}
+}
+
+static void late_bind_work(struct work_struct *work)
+{
+	struct xe_late_bind_fw *lbfw = container_of(work, struct xe_late_bind_fw, work);
+	struct xe_late_bind *late_bind = container_of(lbfw, struct xe_late_bind,
+						      late_bind_fw);
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	int retry = LB_FW_LOAD_RETRY_MAXCOUNT;
+	int ret;
+	int slept;
+
+	if (!late_bind->component_added)
+		return;
+
+	if (!lbfw->valid)
+		return;
+
+	/* we can queue this before the component is bound */
+	for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
+		if (late_bind->component.ops)
+			break;
+		msleep(100);
+	}
+
+	xe_pm_runtime_get(xe);
+	mutex_lock(&late_bind->mutex);
+
+	if (!late_bind->component.ops) {
+		drm_err(&xe->drm, "Late bind component not bound\n");
+		goto out;
+	}
+
+	drm_dbg(&xe->drm, "Load %s firmware\n", fw_type_to_name[lbfw->type]);
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
+	if (ret)
+		drm_err(&xe->drm, "Load %s firmware failed with err %d\n",
+			fw_type_to_name[lbfw->type], ret);
+	else
+		drm_dbg(&xe->drm, "Load %s firmware successful\n",
+			fw_type_to_name[lbfw->type]);
+out:
+	mutex_unlock(&late_bind->mutex);
+	xe_pm_runtime_put(xe);
+}
+
+int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
+{
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	struct xe_late_bind_fw *lbfw;
+
+	if (!late_bind->component_added)
+		return -EINVAL;
+
+	if (late_bind->disable)
+		return 0;
+
+	lbfw = &late_bind->late_bind_fw;
+	if (lbfw->valid) {
+		drm_dbg(&xe->drm, "Queue work: to load %s firmware\n",
+			fw_type_to_name[lbfw->type]);
+		queue_work(late_bind->wq, &lbfw->work);
+	}
+
+	return 0;
+}
+
+/**
+ * late_bind_fw_init() - initialize late bind firmware
+ *
+ * Return: 0 if the initialization was successful, a negative errno otherwise.
+ */
+static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 type)
+{
+	struct xe_device *xe = late_bind_to_xe(late_bind);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct xe_late_bind_fw *lb_fw;
+	const struct firmware *fw;
+	u32 num_fans;
+	int ret;
+
+	if (!late_bind->component_added)
+		return 0;
+
+	lb_fw = &late_bind->late_bind_fw;
+
+	lb_fw->type = type;
+	lb_fw->valid = false;
+
+	if (lb_fw->type == CSC_LATE_BINDING_TYPE_FAN_CONTROL) {
+		num_fans = late_bind_fw_num_fans(late_bind);
+		drm_dbg(&xe->drm, "Number of Fans: %d\n", num_fans);
+		if (!num_fans)
+			return 0;
+	}
+
+	lb_fw->flags = CSC_LATE_BINDING_FLAGS_IS_PERSISTENT;
+
+	snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), "xe/%s_8086_%04x_%04x_%04x.bin",
+		 fw_type_to_name[type], pdev->device,
+		 pdev->subsystem_vendor, pdev->subsystem_device);
+
+	drm_dbg(&xe->drm, "Request late binding firmware %s\n", lb_fw->blob_path);
+	ret = firmware_request_nowarn(&fw, lb_fw->blob_path, xe->drm.dev);
+	if (ret) {
+		drm_dbg(&xe->drm, "Failed to request %s\n", lb_fw->blob_path);
+		return 0;
+	}
+
+	if (fw->size > MAX_PAYLOAD_SIZE) {
+		lb_fw->payload_size = MAX_PAYLOAD_SIZE;
+		drm_err(&xe->drm, "Firmware %s size %zu is larger than max pay load size %u\n",
+			lb_fw->blob_path, fw->size, MAX_PAYLOAD_SIZE);
+		return 0;
+	}
+
+	lb_fw->payload_size = fw->size;
+
+	memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
+	release_firmware(fw);
+	INIT_WORK(&lb_fw->work, late_bind_work);
+	lb_fw->valid = true;
+
+	return 0;
+}
+
+/**
+ * xe_mei_late_bind_fw_init() - Initialize late bind firmware
+ *
+ * Return: 0 if the initialization was successful, a negative errno otherwise.
+ */
+int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
+{
+	int ret;
+
+	late_bind->wq = alloc_ordered_workqueue("late-bind-ordered-wq", 0);
+	if (!late_bind->wq)
+		return -ENOMEM;
+
+	ret = late_bind_fw_init(late_bind, CSC_LATE_BINDING_TYPE_FAN_CONTROL);
+	if (ret)
+		return ret;
+
+	return xe_late_bind_fw_load(late_bind);
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
+	if (!late_bind->component_added)
+		return;
+
+	xe_late_bind_wait_for_worker_completion(late_bind);
+
+	component_del(xe->drm.dev, &xe_late_bind_component_ops);
+	late_bind->component_added = false;
+	if (late_bind->wq) {
+		destroy_workqueue(late_bind->wq);
+		late_bind->wq = NULL;
+	}
+	mutex_destroy(&late_bind->mutex);
+
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
+	if (xe->info.platform != XE_BATTLEMAGE)
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
+				  I915_COMPONENT_LATE_BIND);
+	if (err < 0) {
+		drm_info(&xe->drm, "Failed to add mei late bind component (%pe)\n", ERR_PTR(err));
+		return err;
+	}
+
+	late_bind->component_added = true;
+
+	return devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
+}
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
new file mode 100644
index 000000000000..5fb724c5c863
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
@@ -0,0 +1,18 @@
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
+int xe_late_bind_fw_init(struct xe_late_bind *late_bind);
+int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
+void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
new file mode 100644
index 000000000000..6f4a945ca236
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_MEI_LATE_BIND_TYPES_H_
+#define _XE_MEI_LATE_BIND_TYPES_H_
+
+#include <linux/iosys-map.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#define MAX_PAYLOAD_SIZE (1024 * 4)
+
+/**
+ * xe_late_bind_fw_type - enum to determine late binding fw type
+ */
+enum xe_late_bind_type {
+	CSC_LATE_BINDING_TYPE_FAN_CONTROL = 1,
+};
+
+/**
+ * Late Binding flags
+ */
+enum csc_late_binding_flags {
+	/** Persistent across warm reset */
+	CSC_LATE_BINDING_FLAGS_IS_PERSISTENT = 0x1
+};
+
+/**
+ * struct xe_late_bind_fw
+ */
+struct xe_late_bind_fw {
+	/** @late_bind_fw.valid */
+	bool valid;
+	/** @late_bind_fw.blob_path: late binding fw blob path */
+	char blob_path[PATH_MAX];
+	/** @late_bind_fw.type */
+	u32  type;
+	/** @late_bind_fw.flags */
+	u32  flags;
+	/** @late_bind_fw.payload: to store the late binding blob */
+	u8  payload[MAX_PAYLOAD_SIZE];
+	/** @late_bind_fw.payload_size: late binding blob payload_size */
+	size_t payload_size;
+	/** @late_bind_fw.work: worker to upload latebind blob */
+	struct work_struct work;
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
+	/** @late_bind.component_added: whether the component has been added */
+	bool component_added;
+	/** @late_bind.mutex: protects the component binding and usage */
+	struct mutex mutex;
+	/** @late_bind.late_bind_fw: late binding firmware */
+	struct xe_late_bind_fw late_bind_fw;
+	/** @late_bind.wq: workqueue to submit request to download late bind blob */
+	struct workqueue_struct *wq;
+
+	/** @late_bind.disable to block late binding reload during pm resume flow*/
+	bool disable;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ac4beaed58ff..d0c428adb4c2 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -27,6 +27,7 @@
 #include "xe_module.h"
 #include "xe_pci_sriov.h"
 #include "xe_pci_types.h"
+#include "xe_pcode_fwctl.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_step.h"
@@ -875,6 +876,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		goto err_driver_cleanup;
 
+	err = xe_pcode_fwctl_init(xe);
+	if (err)
+		goto err_driver_cleanup;
+
 	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
 		str_yes_no(xe->d3cold.capable));
 
diff --git a/drivers/gpu/drm/xe/xe_pcode_fwctl.c b/drivers/gpu/drm/xe/xe_pcode_fwctl.c
new file mode 100644
index 000000000000..849bf3fa4d30
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pcode_fwctl.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_pcode_fwctl.h"
+
+#include <linux/fwctl.h>
+#include <uapi/fwctl/xe_pcode.h>
+
+#include "xe_device.h"
+#include "xe_pcode_api.h"
+#include "xe_pcode.h"
+#include "xe_pm.h"
+
+/**
+ * DOC: XE PCODE FWCTL
+ *
+ * Xe PCODE FWCTL implements the generic FWCTL IOCLTs to allow limited access
+ * from user space (as admin) to some very specific PCODE Mailboxes.
+ *
+ * User space first needs to issue the ```FWCTL_INFO``` ioctl and check for the
+ * capability flag, which will indicate which group of Mailboxes commands are
+ * supported on that current running firmware.
+ *
+ * After verifying the availability of the desired Mailbox command,
+ * ```FWCTL_RPC``` needs to be issued with in and out parameter both using
+ * pointers to a ```struct fwctl_rpc_xe_pcode``` allocated by userspace.
+ * In and out length needs to be sizeof(struct fwctl_rpc_xe_pcode).
+ *
+ * Any command that is not listed in the include/uapi/fwctl/xe_pcode.h or not
+ * supported by the running firmware, will return ERR_PTR(-EBADMSG).
+ *
+ * Example:
+ *
+ * .. code-block:: C
+ *
+ *  struct fwctl_info_xe_pcode xe_pcode_info;
+ *
+ *  struct fwctl_info info = {
+ *           .size = sizeof(struct fwctl_info),
+ *           .flags = 0,
+ *           .out_device_type = 0,
+ *           .device_data_len = sizeof(struct fwctl_info_xe_pcode),
+ *           .out_device_data = (__aligned_u64) &xe_pcode_info,
+ *   };
+ *
+ *   fd = open("/dev/fwctl/fwctl0", O_RDWR);
+ *   if (fd < 0) {
+ *       perror("Failed to open /dev/fwctl/fwctl0");
+ *       return -1;
+ *   }
+ *
+ *   if (ioctl(fd, FWCTL_INFO, &info)) {
+ *           perror("ioctl(FWCTL_INFO) failed");
+ *           close(fd);
+ *           return -1;
+ *   }
+ *
+ *   if (xe_pcode_info.uctx_caps & FWCTL_XE_PCODE_LATEBINDING) {
+ *           struct fwctl_rpc_xe_pcode rpc_in = {
+ *                   .command = PCODE_CMD_LATE_BINDING,
+ *                   .param1 = PARAM1_GET_CAPABILITY_STATUS,
+ *           };
+ *
+ *           struct fwctl_rpc_xe_pcode rpc_out = {0};
+ *
+ *           struct fwctl_rpc rpc = {
+ *                   .size = sizeof(struct fwctl_rpc),
+ *                   .scope = FWCTL_RPC_CONFIGURATION,
+ *                   .in_len = sizeof(struct fwctl_rpc_xe_pcode),
+ *                   .out_len = sizeof(struct fwctl_rpc_xe_pcode),
+ *                   .in = (__aligned_u64) &rpc_in,
+ *                   .out = (__aligned_u64) &rpc_out,
+ *           };
+ *
+ *           if (ioctl(fd, FWCTL_RPC, &rpc)) {
+ *                   perror("ioctl(FWCTL_RPC) failed");
+ *                   close(fd);
+ *                   return -1;
+ *           }
+ *
+ */
+
+struct xe_pcode_fwctl_dev {
+	struct fwctl_device fwctl;
+	struct xe_device *xe;
+};
+
+DEFINE_FREE(xe_pcode_fwctl, struct xe_pcode_fwctl_dev *, if (_T) fwctl_put(&_T->fwctl))
+
+static int xe_pcode_fwctl_uctx_open(struct fwctl_uctx *uctx)
+{
+	return 0;
+}
+
+static void xe_pcode_fwctl_uctx_close(struct fwctl_uctx *uctx)
+{
+}
+
+static void *xe_pcode_fwctl_info(struct fwctl_uctx *uctx, size_t *length)
+{
+	struct xe_pcode_fwctl_dev *fwctl_dev =
+		container_of(uctx->fwctl, struct xe_pcode_fwctl_dev, fwctl);
+	struct xe_device *xe = fwctl_dev->xe;
+	struct fwctl_info_xe_pcode *info;
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return ERR_PTR(-ENOMEM);
+
+	if (xe->info.platform == XE_BATTLEMAGE)
+		info->uctx_caps = FWCTL_XE_PCODE_LATEBINDING;
+
+	*length = sizeof(*info);
+
+	return info;
+}
+
+static bool xe_pcode_fwctl_rpc_validate(struct fwctl_rpc_xe_pcode *rpc,
+					enum fwctl_rpc_scope scope)
+{
+	u32 mbox = PCODE_MBOX(rpc->command, rpc->param1, rpc->param2);
+
+	if (mbox == PCODE_MBOX(PCODE_CMD_LATE_BINDING,
+			       PARAM1_GET_CAPABILITY_STATUS, 0))
+		return scope == FWCTL_RPC_CONFIGURATION;
+
+	if (mbox == PCODE_MBOX(PCODE_CMD_LATE_BINDING,
+			       PARAM1_GET_VERSION_LOW, 0))
+		return (rpc->data0 == DATA0_TYPE_FAN_CONTROLLER ||
+			rpc->data0 == DATA0_TYPE_VOLTAGE_REGULATOR) &&
+			scope == FWCTL_RPC_CONFIGURATION;
+
+	return false;
+}
+
+static void *xe_pcode_fwctl_rpc(struct fwctl_uctx *uctx,
+				enum fwctl_rpc_scope scope,
+				void *in, size_t in_len, size_t *out_len)
+{
+	struct xe_pcode_fwctl_dev *fwctl_dev =
+		container_of(uctx->fwctl, struct xe_pcode_fwctl_dev, fwctl);
+	struct xe_tile *root_tile = xe_device_get_root_tile(fwctl_dev->xe);
+	struct fwctl_rpc_xe_pcode *rpc = in;
+	int err;
+
+	if (in_len != sizeof(struct fwctl_rpc_xe_pcode) ||
+	    *out_len != sizeof(struct fwctl_rpc_xe_pcode))
+		return ERR_PTR(-EMSGSIZE);
+
+	if (!xe_pcode_fwctl_rpc_validate(rpc, scope))
+		return ERR_PTR(-EPERM);
+
+	xe_pm_runtime_get(fwctl_dev->xe);
+
+	err = xe_pcode_read(root_tile, PCODE_MBOX(rpc->command,
+						  rpc->param1,
+						  rpc->param2),
+			    &rpc->data0,
+			    &rpc->data1);
+
+	xe_pm_runtime_put(fwctl_dev->xe);
+
+	if (err)
+		return ERR_PTR(err);
+
+	return rpc;
+}
+
+static const struct fwctl_ops xe_pcode_fwctl_ops = {
+	.device_type = FWCTL_DEVICE_TYPE_XE_PCODE,
+	.uctx_size = sizeof(struct fwctl_uctx),
+	.open_uctx = xe_pcode_fwctl_uctx_open,
+	.close_uctx = xe_pcode_fwctl_uctx_close,
+	.info = xe_pcode_fwctl_info,
+	.fw_rpc = xe_pcode_fwctl_rpc,
+};
+
+static void xe_pcode_fwctl_fini(void *dev)
+{
+	struct fwctl_device *fwctl = dev;
+
+	fwctl_unregister(fwctl);
+	fwctl_put(fwctl);
+}
+
+int xe_pcode_fwctl_init(struct xe_device *xe)
+{
+	struct xe_pcode_fwctl_dev *fwctl_dev __free(xe_pcode_fwctl) =
+		fwctl_alloc_device(xe->drm.dev, &xe_pcode_fwctl_ops,
+				   struct xe_pcode_fwctl_dev, fwctl);
+	int err;
+
+	/* For now xe_pcode_fwctl supports only Late-Binding commands on BMG */
+	if (xe->info.platform != XE_BATTLEMAGE)
+		return -ENODEV;
+
+	if (!fwctl_dev)
+		return -ENOMEM;
+
+	fwctl_dev->xe = xe;
+
+	err = fwctl_register(&fwctl_dev->fwctl);
+	if (err)
+		return err;
+
+	return devm_add_action_or_reset(xe->drm.dev, xe_pcode_fwctl_fini,
+					&fwctl_dev->fwctl);
+}
+
+MODULE_IMPORT_NS("FWCTL");
diff --git a/drivers/gpu/drm/xe/xe_pcode_fwctl.h b/drivers/gpu/drm/xe/xe_pcode_fwctl.h
new file mode 100644
index 000000000000..67386d7bf2ea
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pcode_fwctl.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_PCODE_FWCTL_H_
+#define _XE_PCODE_FWCTL_H_
+
+struct xe_device;
+
+int xe_pcode_fwctl_init(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index ff749edc005b..6c44a075a6ab 100644
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
@@ -204,6 +205,9 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	if (xe->d3cold.allowed)
+		xe_late_bind_fw_load(&xe->late_bind);
+
 	drm_dbg(&xe->drm, "Device resumed\n");
 	return 0;
 err:
@@ -460,6 +464,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	if (err)
 		goto out;
 
+	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
+
 	/*
 	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
 	 * also checks and deletes bo entry from user fault list.
@@ -550,6 +556,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	if (xe->d3cold.allowed)
+		xe_late_bind_fw_load(&xe->late_bind);
+
 out:
 	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
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
index 000000000000..c5302303e5af
--- /dev/null
+++ b/drivers/misc/mei/late_bind/Kconfig
@@ -0,0 +1,12 @@
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
+	  Enables the ME FW interfaces for Late Binding for
+          Xe display driver of Intel.
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
index 000000000000..964757a9b33a
--- /dev/null
+++ b/drivers/misc/mei/late_bind/mei_late_bind.c
@@ -0,0 +1,261 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Intel Corporation
+ */
+#include <drm/drm_connector.h>
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
+	int ret;
+
+	if (!dev || !payload || !payload_size)
+		return -EINVAL;
+
+	cldev = to_mei_cl_device(dev);
+
+	ret = mei_cldev_enable(cldev);
+	if (ret < 0) {
+		dev_dbg(dev, "mei_cldev_enable failed. %d\n", ret);
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
+		dev_err(dev, "mei_cldev_send failed. %d\n", ret);
+		goto end;
+	}
+	ret = mei_cldev_recv_timeout(cldev, (void *)&rsp, sizeof(rsp), LATE_BIND_RECV_TIMEOUT_MSEC);
+	if (ret < 0) {
+		dev_err(dev, "mei_cldev_recv failed. %d\n", ret);
+		goto end;
+	}
+	ret = mei_late_bind_check_response(dev, &rsp.header);
+	if (ret) {
+		dev_err(dev, "bad result response from the firmware: 0x%x\n",
+			*(uint32_t *)&rsp.header);
+		goto end;
+	}
+	ret = (int)rsp.status;
+	dev_dbg(dev, "mei_late_bind_push_config status = %d\n", ret);
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
+ *    The function checks if requested is Intel VGA device
+ *    and the parent of requester and the grand parent of mei_if are the same
+ *    device.
+ *
+ * @dev: master device
+ * @subcomponent: subcomponent to match (I915_COMPONENT_LATE_BIND)
+ * @data: compare data (mei late-bind bus device)
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
+	if (pdev->class != (PCI_CLASS_DISPLAY_VGA << 8) ||
+	    pdev->vendor != PCI_VENDOR_ID_INTEL)
+		return 0;
+
+	if (subcomponent != I915_COMPONENT_LATE_BIND)
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
index 4ea3b17aa143..4945044d41e6 100644
--- a/include/drm/intel/i915_component.h
+++ b/include/drm/intel/i915_component.h
@@ -31,6 +31,7 @@ enum i915_component_type {
 	I915_COMPONENT_HDCP,
 	I915_COMPONENT_PXP,
 	I915_COMPONENT_GSC_PROXY,
+	I915_COMPONENT_LATE_BIND,
 };
 
 /* MAX_PORT is the number of port
diff --git a/include/drm/intel/late_bind_mei_interface.h b/include/drm/intel/late_bind_mei_interface.h
new file mode 100644
index 000000000000..6b54b8cec5ae
--- /dev/null
+++ b/include/drm/intel/late_bind_mei_interface.h
@@ -0,0 +1,37 @@
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
diff --git a/include/uapi/fwctl/fwctl.h b/include/uapi/fwctl/fwctl.h
index 716ac0eee42d..9e7e84aef791 100644
--- a/include/uapi/fwctl/fwctl.h
+++ b/include/uapi/fwctl/fwctl.h
@@ -45,6 +45,7 @@ enum fwctl_device_type {
 	FWCTL_DEVICE_TYPE_MLX5 = 1,
 	FWCTL_DEVICE_TYPE_CXL = 2,
 	FWCTL_DEVICE_TYPE_PDS = 4,
+	FWCTL_DEVICE_TYPE_XE_PCODE = 5,
 };
 
 /**
diff --git a/include/uapi/fwctl/xe_pcode.h b/include/uapi/fwctl/xe_pcode.h
new file mode 100644
index 000000000000..87544e99faa1
--- /dev/null
+++ b/include/uapi/fwctl/xe_pcode.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _UAPI_FWCTL_XE_PCODE_H_
+#define _UAPI_FWCTL_XE_PCODE_H_
+
+#include <linux/types.h>
+
+/**
+ * struct fwctl_info_xe_pcode - FWCTL Information struct for Xe PCODE
+ *
+ * @uctx_caps:  bitmap of available capabilities:
+ *  - %FWCTL_XE_PCODE_LATEBINDING - Command to configure Late Bind FW such as
+ * Fan Controller and Voltage Regulator
+ * @rsvd: Reserved for future usage or flags
+ */
+struct fwctl_info_xe_pcode {
+	__u32 uctx_caps;
+	__u32 rsvd[3];
+};
+
+#define FWCTL_XE_PCODE_LATEBINDING	(1 << 0)
+
+/**
+ * struct fwctl_rpc_xe_pcode - FWCTL Remote Procedure Calls for Xe PCODE
+ */
+struct fwctl_rpc_xe_pcode {
+	/** @command: The main Mailbox command */
+	__u8 command;
+	/** @pad: Padding the uAPI struct - Must be 0. Not sent to firmware */
+	__u8 pad[3];
+	/** @param1: A subcommand or a parameter of the main command */
+	__u16 param1;
+	/** @param2: A parameter of a subcommand or a subsubcommand */
+	__u16 param2;
+	/** @data0: The first 32 bits of data. In general data-in as param */
+	__u32 data0;
+	/** @data1: The other 32 bits of data. In general data-out */
+	__u32 data1;
+	/** @rsvd: Reserved for future use */
+	__u32 rsvd[2];
+};
+
+/**
+ * DOC: Late Binding Commands
+ *
+ * FWCTL info.uctx_caps: FWCTL_XE_PCODE_LATEBINDING
+ * FWCTL rpc.scope: FWCTL_RPC_CONFIGURATION
+ *
+ * Command	0x5C - LATE_BINDING
+ * Param1	0x0 - GET_CAPABILITY_STATUS
+ * Param2	0
+ * Data in	None
+ * Data out:
+ *
+ *  - Bit0: Late binding for V1 Fan Tables is supported.
+ *  - Bit3: Late binding for VR parameters.
+ *  - Bit16: Late binding done for V1 Fan tables
+ *  - Bit17: Late binding done for power co-efficients.
+ *  - Bit18: Late binding done for V2 Fan tables
+ *  - Bit19: Late binding done for VR Parameters
+ *
+ * Command	0x5C - LATE_BINDING
+ * Param1	0x1 - GET_VERSION_LOW
+ * Param2	0
+ * Data in - conveys the Type of the Late Binding Configuration:
+ *
+ *  - FAN_CONTROLLER = 1
+ *  - VOLTAGE_REGULATOR = 2
+ *
+ * Data out - Lower 32 bits of Version Number for Late Binding configuration
+ *            that has been applied successfully.
+ */
+#define PCODE_CMD_LATE_BINDING		0x5C
+#define  PARAM1_GET_CAPABILITY_STATUS	0x0
+#define  PARAM1_GET_VERSION_LOW		0x1
+#define   DATA0_TYPE_FAN_CONTROLLER	1
+#define   DATA0_TYPE_VOLTAGE_REGULATOR	2
+
+#endif /* _UAPI_FWCTL_XE_PCODE_H_ */
-- 
2.34.1

