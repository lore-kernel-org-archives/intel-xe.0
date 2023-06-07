Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33D0C7EE23
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 11:05:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76DEA10E4B6;
	Wed,  7 Jun 2023 11:05:40 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD3510E4B6
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 11:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686135939; x=1717671939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rt4KeT490krRrbVDp6cjoVPfaj6+infFBUTwAkwn5xM=;
 b=btzYszw8GDPXfpi3ZteIyyzwjF5MIC+U4epyTd53qaqaNhGqxQBp73+s
 K+aGeBXMhWOp3R0Fkd4HbKPcLXKuz702RLfmdcvUSNAdCBI53d4LielGz
 AapxTounegHTqZ72zH+ED01d67YI/9SaKkzqfkQTNgMYUnJOgJCeP+jwL
 sKZIqNrb7Y4XwXw8c5mMsrFToXIFtKY02p3vSEcptFBL9Kuf0LuMb1Wtg
 2BzCya2Mai9Qhq907dRLAKyhQ76QVBWwi3rjIxrMySNVmbFnOa1s3+N8W
 kGAT6LYKHtzgf9bBYMGaBkbbTznZbu6MgZDcUepfowiWG8RPMFE08QQ6+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="420512507"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="420512507"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 04:05:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="703593462"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="703593462"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 04:05:37 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  7 Jun 2023 16:33:26 +0530
Message-Id: <20230607110328.3739706-4-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230607110328.3739706-1-anshuman.gupta@intel.com>
References: <20230607110328.3739706-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/5] drm/xe/pm: Add vram_d3cold_threshold Sysfs
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add per pci device vram_d3cold_threshold Sysfs to
control the d3cold allowed knob.
Adding a d3cold structure embedded in xe_device to encapsulate
d3cold related stuff.

v2:
- Check total vram before initializing default threshold. [Riana]
v3:
- Add static scope to vram_d3cold_threshold DEVICE_ATTR. [Riana]

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device_sysfs.c | 76 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_device_sysfs.h | 13 +++++
 drivers/gpu/drm/xe/xe_device_types.h | 21 ++++++--
 drivers/gpu/drm/xe/xe_pci.c          | 10 ++--
 drivers/gpu/drm/xe/xe_pm.c           | 37 ++++++++++++--
 drivers/gpu/drm/xe/xe_pm.h           |  3 ++
 7 files changed, 148 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_device_sysfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index f34d4bdd510b..b939fecb59ef 100644
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
index 000000000000..3e01c97e4aba
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
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
+	dev_dbg(dev, "vram_d3cold_threshold: %u\n", vram_d3cold_threshold);
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
+int xe_device_sysfs_init(struct xe_device *xe)
+{
+	struct device *dev = xe->drm.dev;
+	int ret;
+
+	ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
+	if (ret)
+		return ret;
+
+	ret = drmm_add_action_or_reset(&xe->drm, xe_device_sysfs_fini, xe);
+
+	return ret;
+}
+
diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.h b/drivers/gpu/drm/xe/xe_device_sysfs.h
new file mode 100644
index 000000000000..d6dc2ac7a37a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
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
index 5541986b7df9..bdd093d30788 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -375,11 +375,24 @@ struct xe_device {
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
index 33779a092ae2..2ff2e4a0bf72 100644
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
index c250a36b99ad..ad282eaf8a6a 100644
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
+	drm_info(&xe->drm, "Total vram mb %u\n", vram_total_mb);
+
+	if (threshold > vram_total_mb)
+		return -EINVAL;
+
+	mutex_lock(&xe->d3cold.lock);
+	xe->d3cold.vram_threshold = min(threshold, vram_total_mb);
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

