Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3729FEB64DD
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 11:58:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB91110E2E1;
	Tue, 27 Jun 2023 11:58:26 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F5110E2E1
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 11:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687867106; x=1719403106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MGYeGZuIedjB6uGvCw7hLP3kVF50kaiIdY1LcI7Kbj0=;
 b=eYyUjqEGW9JAdNArBG+MqVM+WNHa5iD8Ty5TZO0NAmyYzwR2A+v7j7cp
 EAuCn6CU8tf4GfpYjsC/MziwnwXJ/XOQ7urWMgK/zDQCFbB/h5x4G8x94
 K6/RB+wl9bRuQgunnesisPgFWWp1zcPFwgQ724zp0Hgins+jC+PP9pMmD
 moq4iqCi2Yya2KdxunYU+y3FPbm++PpJCTCoLLwngpCMW7VF2PbwZaTCo
 oPCEJTSW7DJarPvdG29ABgaDXFSpFHRKM26VCdVuEKvK5dJ4HhLuOlwGR
 ERJh/3nwf15mLH03PbE2cvoLabKp53Q2QTVaAvaLLdEWk+51gtS3oIFN2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="351334016"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="351334016"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 04:58:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="890668137"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="890668137"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 04:58:23 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 27 Jun 2023 17:26:40 +0530
Message-Id: <20230627115642.2087251-4-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230627115642.2087251-1-anshuman.gupta@intel.com>
References: <20230627115642.2087251-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 3/5] drm/xe/pm: Add vram_d3cold_threshold Sysfs
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
Cc: sujaritha.sundaresan@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add per pci device vram_d3cold_threshold Sysfs to
control the d3cold allowed knob.
Adding a d3cold structure embedded in xe_device to encapsulate
d3cold related stuff.

v2:
- Check total vram before initializing default threshold. [Riana]
- Add static scope to vram_d3cold_threshold DEVICE_ATTR. [Riana]
v3:
- Fixed cosmetics review comment. [Riana]

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device_sysfs.c | 85 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_sysfs.h | 13 +++++
 drivers/gpu/drm/xe/xe_device_types.h | 21 +++++--
 drivers/gpu/drm/xe/xe_pci.c          | 10 ++--
 drivers/gpu/drm/xe/xe_pm.c           | 37 ++++++++++--
 drivers/gpu/drm/xe/xe_pm.h           |  3 +
 7 files changed, 157 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 4b82cb2773ad..f84b7b4d4324 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -49,6 +49,7 @@ xe-y += xe_bb.o \
 	xe_debugfs.o \
 	xe_devcoredump.o \
 	xe_device.o \
+	xe_device_sysfs.o \
 	xe_dma_buf.o \
 	xe_engine.o \
 	xe_exec.o \
diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
new file mode 100644
index 000000000000..15ace0041798
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/kobject.h>
+#include <linux/pci.h>
+#include <linux/sysfs.h>
+
+#include <drm/drm_managed.h>
+
+#include "xe_device.h"
+#include "xe_pm.h"
+
+/**
+ * DOC: Xe device sysfs
+ * vram_d3cold_threshold - Report/change vram used threshold below which
+ * vram save/restore permissible (in MB), Xe save/restore during runtime
+ * D3cold entry/exit. vram_d3cold_threshold sysfs attribute will available
+ * under device kobject directory.
+ */
+
+static ssize_t
+vram_d3cold_threshold_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	int ret;
+
+	if (!xe)
+		return -EINVAL;
+
+	ret = sysfs_emit(buf, "%d\n", xe->d3cold.vram_threshold);
+
+	return ret;
+}
+
+static ssize_t
+vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
+			    const char *buff, size_t count)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	u32 vram_d3cold_threshold;
+	int ret;
+
+	if (!xe)
+		return -EINVAL;
+
+	ret = kstrtou32(buff, 0, &vram_d3cold_threshold);
+	if (ret)
+		return ret;
+
+	drm_dbg(&xe->drm, "vram_d3cold_threshold: %u\n", vram_d3cold_threshold);
+
+	ret = xe_pm_set_vram_threshold(xe, vram_d3cold_threshold);
+
+	return ret ?: count;
+}
+
+static DEVICE_ATTR_RW(vram_d3cold_threshold);
+
+static void xe_device_sysfs_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_device *xe = arg;
+
+	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
+}
+
+void xe_device_sysfs_init(struct xe_device *xe)
+{
+	struct device *dev = xe->drm.dev;
+	int ret;
+
+	ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
+	if (ret) {
+		drm_warn(&xe->drm, "Failed to create sysfs file\n");
+		return;
+	}
+
+	ret = drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini, xe);
+	if (ret)
+		drm_warn(&xe->drm, "Failed to add sysfs fini drm action\n");
+}
diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.h b/drivers/gpu/drm/xe/xe_device_sysfs.h
new file mode 100644
index 000000000000..f9e83d8bd2c7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_DEVICE_SYSFS_H_
+#define _XE_DEVICE_SYSFS_H_
+
+struct xe_device;
+
+int xe_device_sysfs_init(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 7a12d8c657c4..c047571c8ab0 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -329,11 +329,24 @@ struct xe_device {
 		bool hold_rpm;
 	} mem_access;
 
-	/** d3cold_capable: Indicates if root port is d3cold capable */
-	bool d3cold_capable;
+	struct {
+		/** capable: Indicates if root port is d3cold capable */
+		bool capable;
+
+		/** @allowed: Indicates if d3cold is a valid device state */
+		bool allowed;
 
-	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
-	bool d3cold_allowed;
+		/**
+		 * @vram_threshold is the permissible threshold(in megabytes)
+		 * for vram save/restore. d3cold will be disallowed,
+		 * when vram_usages is above threshold value to avoid the
+		 * vram save/restore latency.
+		 * Default threshold value is 300mb.
+		 */
+		u32 vram_threshold;
+		/** Lock to protect vram_threshold */
+		struct mutex lock;
+	} d3cold;
 
 	/* private: */
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1b526d1e4d75..848de5dcdaa5 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -758,7 +758,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
 
 	pci_save_state(pdev);
 
-	if (xe->d3cold_allowed) {
+	if (xe->d3cold.allowed) {
 		pci_disable_device(pdev);
 		pci_ignore_hotplug(pdev);
 		pci_set_power_state(pdev, PCI_D3cold);
@@ -781,7 +781,7 @@ static int xe_pci_runtime_resume(struct device *dev)
 
 	pci_restore_state(pdev);
 
-	if (xe->d3cold_allowed) {
+	if (xe->d3cold.allowed) {
 		err = pci_enable_device(pdev);
 		if (err)
 			return err;
@@ -797,8 +797,8 @@ static int xe_pci_runtime_idle(struct device *dev)
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 
-	if (!xe->d3cold_capable) {
-		xe->d3cold_allowed = false;
+	if (!xe->d3cold.capable) {
+		xe->d3cold.allowed = false;
 	} else {
 		/*
 		 * TODO: d3cold should be allowed (true) if
@@ -811,7 +811,7 @@ static int xe_pci_runtime_idle(struct device *dev)
 		 * 3. at resume, detect if we really lost power and avoid memory
 		 *    restoration if we were only up to d3cold
 		 */
-		xe->d3cold_allowed = false;
+		xe->d3cold.allowed = false;
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index c250a36b99ad..7028c9b6e94c 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -12,6 +12,7 @@
 #include "xe_bo.h"
 #include "xe_bo_evict.h"
 #include "xe_device.h"
+#include "xe_device_sysfs.h"
 #include "xe_display.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
@@ -148,8 +149,11 @@ void xe_pm_init(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
+	mutex_init(&xe->d3cold.lock);
 	xe_pm_runtime_init(xe);
-	xe->d3cold_capable = xe_pm_pci_d3cold_capable(pdev);
+	xe->d3cold.capable = xe_pm_pci_d3cold_capable(pdev);
+	xe_device_sysfs_init(xe);
+	xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
 }
 
 void xe_pm_runtime_fini(struct xe_device *xe)
@@ -166,7 +170,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	u8 id;
 	int err;
 
-	if (xe->d3cold_allowed) {
+	if (xe->d3cold.allowed) {
 		if (xe_device_mem_access_ongoing(xe))
 			return -EBUSY;
 
@@ -192,7 +196,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	u8 id;
 	int err;
 
-	if (xe->d3cold_allowed) {
+	if (xe->d3cold.allowed) {
 		for_each_gt(gt, xe, id) {
 			err = xe_pcode_init(gt);
 			if (err)
@@ -213,7 +217,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_resume(gt);
 
-	if (xe->d3cold_allowed) {
+	if (xe->d3cold.allowed) {
 		err = xe_bo_restore_user(xe);
 		if (err)
 			return err;
@@ -248,3 +252,28 @@ int xe_pm_runtime_get_if_active(struct xe_device *xe)
 	WARN_ON(pm_runtime_suspended(xe->drm.dev));
 	return pm_runtime_get_if_active(xe->drm.dev, true);
 }
+
+int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
+{
+	struct ttm_resource_manager *man;
+	u32 vram_total_mb = 0;
+	int i;
+
+	/* TODO: Extend the logic to beyond XE_PL_VRAM1 */
+	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
+		man = ttm_manager_type(&xe->ttm, i);
+		if (man)
+			vram_total_mb += DIV_ROUND_UP_ULL(man->size, 1024 * 1024);
+	}
+
+	drm_dbg(&xe->drm, "Total vram %u mb\n", vram_total_mb);
+
+	if (threshold > vram_total_mb)
+		return -EINVAL;
+
+	mutex_lock(&xe->d3cold.lock);
+	xe->d3cold.vram_threshold = threshold;
+	mutex_unlock(&xe->d3cold.lock);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index e0c4f92e27c5..b50ec8bdce6f 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -8,6 +8,8 @@
 
 #include <linux/pm_runtime.h>
 
+#define DEFAULT_VRAM_THRESHOLD 300
+
 struct xe_device;
 
 int xe_pm_suspend(struct xe_device *xe);
@@ -21,5 +23,6 @@ int xe_pm_runtime_get(struct xe_device *xe);
 int xe_pm_runtime_put(struct xe_device *xe);
 bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
+int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
 
 #endif
-- 
2.38.0

