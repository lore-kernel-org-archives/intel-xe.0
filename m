Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E68EB64DC
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 12:03:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC6010E4FC;
	Thu,  6 Jul 2023 12:03:43 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646DB10E4FC
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 12:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688645022; x=1720181022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SOx4GNFdYTRw+Wv9K6oQNLC0+Ve40rlPYgp2/SaA3Ak=;
 b=nZyg2Zi+vF6jzaF/V+pZ1RaoeSt4U/bYh3zYDMjyObUF5QtO0cAmK7zS
 SISd6cE/8ewXhQXc5r8/wODMBsbRp9ng8VmBpFJjpV1sGM4druVxNow8V
 FxWiKPZUKAnC3Dyjj/DpnpRpoQXFTnPKL+3iZfaDMJruok5lei1zrrJ4Y
 ub6218ZEfo/8zdZnHmr9QYY//VQzFJSbiDv8YyxHeaUbVqTTe4D29sB5M
 S+mk1+JCOcnxdDwWhoq+unHYTxOm9Q7zRpYH+15xVr6QAkS4tcOkSEZQ0
 UsBAunRYzwPy5HSBxzn9bsg6G4qIiQaFvGkPS0XuCR5CkXLkufHSk5Uhd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="449942901"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="449942901"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 05:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="843663431"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="843663431"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 05:03:38 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Jul 2023 17:32:06 +0530
Message-Id: <20230706120208.2828158-4-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230706120208.2828158-1-anshuman.gupta@intel.com>
References: <20230706120208.2828158-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 3/5] drm/xe/pm: Add vram_d3cold_threshold Sysfs
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
- Fixed CI Hook failures.
- Used drmm_mutex_init().

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device_sysfs.c | 86 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_sysfs.h | 13 +++++
 drivers/gpu/drm/xe/xe_device_types.h | 21 +++++--
 drivers/gpu/drm/xe/xe_pci.c          | 10 ++--
 drivers/gpu/drm/xe/xe_pm.c           | 38 ++++++++++--
 drivers/gpu/drm/xe/xe_pm.h           |  3 +
 7 files changed, 159 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 336f0eb8f91e..c37587ae20c2 100644
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
index 000000000000..3a5dbb8a67bc
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -0,0 +1,86 @@
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
+#include "xe_device_sysfs.h"
+#include "xe_pm.h"
+
+/**
+ * DOC: Xe device sysfs
+ * vram_d3cold_threshold - Report/change vram used threshold(in MB) below
+ * which vram save/restore is permissible during runtime D3cold entry/exit.
+ * vram_d3cold_threshold sysfs attribute will be available under pci device
+ * kobject directory.
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
index 000000000000..38b240684bee
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
+void xe_device_sysfs_init(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 66bde0578229..8e69a6d4627a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -347,11 +347,24 @@ struct xe_device {
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
index 4919fe85c704..ce4bdfcbc46d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -766,7 +766,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
 
 	pci_save_state(pdev);
 
-	if (xe->d3cold_allowed) {
+	if (xe->d3cold.allowed) {
 		pci_disable_device(pdev);
 		pci_ignore_hotplug(pdev);
 		pci_set_power_state(pdev, PCI_D3cold);
@@ -789,7 +789,7 @@ static int xe_pci_runtime_resume(struct device *dev)
 
 	pci_restore_state(pdev);
 
-	if (xe->d3cold_allowed) {
+	if (xe->d3cold.allowed) {
 		err = pci_enable_device(pdev);
 		if (err)
 			return err;
@@ -805,8 +805,8 @@ static int xe_pci_runtime_idle(struct device *dev)
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 
-	if (!xe->d3cold_capable) {
-		xe->d3cold_allowed = false;
+	if (!xe->d3cold.capable) {
+		xe->d3cold.allowed = false;
 	} else {
 		/*
 		 * TODO: d3cold should be allowed (true) if
@@ -819,7 +819,7 @@ static int xe_pci_runtime_idle(struct device *dev)
 		 * 3. at resume, detect if we really lost power and avoid memory
 		 *    restoration if we were only up to d3cold
 		 */
-		xe->d3cold_allowed = false;
+		xe->d3cold.allowed = false;
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 4371a6a04f4a..07e204990aa9 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -7,11 +7,13 @@
 
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_managed.h>
 #include <drm/ttm/ttm_placement.h>
 
 #include "xe_bo.h"
 #include "xe_bo_evict.h"
 #include "xe_device.h"
+#include "xe_device_sysfs.h"
 #include "xe_display.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
@@ -148,8 +150,11 @@ void xe_pm_init(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
+	drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
 	xe_pm_runtime_init(xe);
-	xe->d3cold_capable = xe_pm_pci_d3cold_capable(pdev);
+	xe->d3cold.capable = xe_pm_pci_d3cold_capable(pdev);
+	xe_device_sysfs_init(xe);
+	xe_pm_set_vram_threshold(xe, DEFAULT_VRAM_THRESHOLD);
 }
 
 void xe_pm_runtime_fini(struct xe_device *xe)
@@ -166,7 +171,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	u8 id;
 	int err;
 
-	if (xe->d3cold_allowed) {
+	if (xe->d3cold.allowed) {
 		if (xe_device_mem_access_ongoing(xe))
 			return -EBUSY;
 
@@ -192,7 +197,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	u8 id;
 	int err;
 
-	if (xe->d3cold_allowed) {
+	if (xe->d3cold.allowed) {
 		for_each_gt(gt, xe, id) {
 			err = xe_pcode_init(gt);
 			if (err)
@@ -213,7 +218,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_resume(gt);
 
-	if (xe->d3cold_allowed) {
+	if (xe->d3cold.allowed) {
 		err = xe_bo_restore_user(xe);
 		if (err)
 			return err;
@@ -262,3 +267,28 @@ void xe_pm_assert_unbounded_bridge(struct xe_device *xe)
 		device_set_pm_not_required(&pdev->dev);
 	}
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
index 193e5d687353..bbd91a5855cd 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -8,6 +8,8 @@
 
 #include <linux/pm_runtime.h>
 
+#define DEFAULT_VRAM_THRESHOLD 300 /* in MB */
+
 struct xe_device;
 
 int xe_pm_suspend(struct xe_device *xe);
@@ -22,5 +24,6 @@ int xe_pm_runtime_put(struct xe_device *xe);
 bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
 void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
+int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
 
 #endif
-- 
2.38.0

