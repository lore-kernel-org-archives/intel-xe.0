Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64563C369C2
	for <intel-xe@archiver.kernel.org>; Mon,  5 May 2025 05:38:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B2D10E268;
	Mon,  5 May 2025 05:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SA4wMbit";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6677C10E268
 for <intel-xe@lists.freedesktop.org>; Mon,  5 May 2025 05:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746423523; x=1777959523;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7+lloY5PECHFQsNN5nlKs9OuFamus8H4dSixFXcQopg=;
 b=SA4wMbitSkHa9/BvXPVQ5rdDWYDHGUCCVcffbhliVbY8AzKB88ze16Xa
 x8Gd0xYs4lhvTxI3zgQ6doyPQdcfjPgytkFzknlif4DnwCMOeNTkmYRdN
 W+fU1n7pySAFP6MOCfzjN3yuDo8pamQ5ujo9fIdS1/6wkxbyXS7s/xnP+
 Zni3xR/73iy/CFsA7Dxdan4Nrysq68wSDzd7U+ONMEFWTV6SqZsYbmZRi
 zRI97Ae0yDpP6yHcrr2ore4LoO24p0BTYjXBx6R4ZPRxRCXZxaMJ7p2yH
 US02BfRbTu3162yYlXBMd0EL9uJ/2HISkLQjgigUH7KvdMZ/0Bk6Wzlj0 g==;
X-CSE-ConnectionGUID: vn/NMBKuRSyOjSNXy7im9g==
X-CSE-MsgGUID: r5tmdFAOQImWMp5HhxN0NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="58676160"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="58676160"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2025 22:38:43 -0700
X-CSE-ConnectionGUID: 2PXmMSGWRTKrM1a4y53K2g==
X-CSE-MsgGUID: A3uR8KFfQhS+d7aZlVapRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="135483801"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa008.fm.intel.com with ESMTP; 04 May 2025 22:38:40 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe: Introduce xe_pm_sysfs.c
Date: Mon,  5 May 2025 11:07:16 +0530
Message-Id: <20250505053716.3360242-1-raag.jadav@intel.com>
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

Introduce xe_pm_sysfs.c for Power Management knobs and move existing
attributes to it.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---

This depends on BMG PCIe link downgrade series[1].
[1] https://lore.kernel.org/r/20250502183739.3308069-1-raag.jadav@intel.com

 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device_sysfs.c | 64 +---------------------
 drivers/gpu/drm/xe/xe_device_sysfs.h |  1 -
 drivers/gpu/drm/xe/xe_pm.c           |  2 +-
 drivers/gpu/drm/xe/xe_pm_sysfs.c     | 81 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pm_sysfs.h     | 13 +++++
 6 files changed, 97 insertions(+), 65 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pm_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_pm_sysfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index c5d6681645ed..683b5a7073ba 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -86,6 +86,7 @@ xe-y += xe_bb.o \
 	xe_pci.o \
 	xe_pcode.o \
 	xe_pm.o \
+	xe_pm_sysfs.o \
 	xe_preempt_fence.o \
 	xe_pt.o \
 	xe_pt_walk.o \
diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index 7172972b5b60..cdea5e5ebf3d 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -3,12 +3,11 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/device.h>
 #include <linux/kobject.h>
 #include <linux/pci.h>
 #include <linux/sysfs.h>
 
-#include <drm/drm_managed.h>
-
 #include "xe_device.h"
 #include "xe_device_sysfs.h"
 #include "xe_mmio.h"
@@ -22,69 +21,8 @@
  * each graphics device. Considering this, we need to add sysfs attributes at device
  * level granularity.
  * These sysfs attributes will be available under pci device kobj directory.
- *
- * vram_d3cold_threshold - Report/change vram used threshold(in MB) below
- * which vram save/restore is permissible during runtime D3cold entry/exit.
  */
 
-static ssize_t
-vram_d3cold_threshold_show(struct device *dev,
-			   struct device_attribute *attr, char *buf)
-{
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct xe_device *xe = pdev_to_xe_device(pdev);
-	int ret;
-
-	xe_pm_runtime_get(xe);
-	ret = sysfs_emit(buf, "%d\n", xe->d3cold.vram_threshold);
-	xe_pm_runtime_put(xe);
-
-	return ret;
-}
-
-static ssize_t
-vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
-			    const char *buff, size_t count)
-{
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct xe_device *xe = pdev_to_xe_device(pdev);
-	u32 vram_d3cold_threshold;
-	int ret;
-
-	ret = kstrtou32(buff, 0, &vram_d3cold_threshold);
-	if (ret)
-		return ret;
-
-	drm_dbg(&xe->drm, "vram_d3cold_threshold: %u\n", vram_d3cold_threshold);
-
-	xe_pm_runtime_get(xe);
-	ret = xe_pm_set_vram_threshold(xe, vram_d3cold_threshold);
-	xe_pm_runtime_put(xe);
-
-	return ret ?: count;
-}
-
-static DEVICE_ATTR_RW(vram_d3cold_threshold);
-
-static void xe_pm_sysfs_fini(void *arg)
-{
-	struct xe_device *xe = arg;
-
-	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
-}
-
-int xe_pm_sysfs_init(struct xe_device *xe)
-{
-	struct device *dev = xe->drm.dev;
-	int ret;
-
-	ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
-	if (ret)
-		return ret;
-
-	return devm_add_action_or_reset(dev, xe_pm_sysfs_fini, xe);
-}
-
 /**
  * DOC: PCIe Gen5 Limitations
  *
diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.h b/drivers/gpu/drm/xe/xe_device_sysfs.h
index b557db0a6023..f9e83d8bd2c7 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.h
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.h
@@ -8,7 +8,6 @@
 
 struct xe_device;
 
-int xe_pm_sysfs_init(struct xe_device *xe);
 int xe_device_sysfs_init(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 183813e43b29..365ce76b14ec 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -16,12 +16,12 @@
 #include "xe_bo.h"
 #include "xe_bo_evict.h"
 #include "xe_device.h"
-#include "xe_device_sysfs.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_irq.h"
 #include "xe_pcode.h"
+#include "xe_pm_sysfs.h"
 #include "xe_pxp.h"
 #include "xe_trace.h"
 #include "xe_wa.h"
diff --git a/drivers/gpu/drm/xe/xe_pm_sysfs.c b/drivers/gpu/drm/xe/xe_pm_sysfs.c
new file mode 100644
index 000000000000..64ddfbf79424
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pm_sysfs.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/device.h>
+#include <linux/kobject.h>
+#include <linux/pci.h>
+#include <linux/sysfs.h>
+
+#include "xe_device.h"
+#include "xe_mmio.h"
+#include "xe_pm.h"
+#include "xe_pm_sysfs.h"
+
+/**
+ * DOC: Xe PM sysfs
+ * Xe driver requires exposing certain tunable knobs controlled by user space
+ * for Power Management. Considering this, we need to add sysfs attributes for
+ * it. These sysfs attributes will be available under pci device kobj directory.
+ *
+ * vram_d3cold_threshold - Report/change vram used threshold(in MB) below
+ * which vram save/restore is permissible during runtime D3cold entry/exit.
+ */
+
+static ssize_t
+vram_d3cold_threshold_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	int ret;
+
+	xe_pm_runtime_get(xe);
+	ret = sysfs_emit(buf, "%d\n", xe->d3cold.vram_threshold);
+	xe_pm_runtime_put(xe);
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
+	ret = kstrtou32(buff, 0, &vram_d3cold_threshold);
+	if (ret)
+		return ret;
+
+	drm_dbg(&xe->drm, "vram_d3cold_threshold: %u\n", vram_d3cold_threshold);
+
+	xe_pm_runtime_get(xe);
+	ret = xe_pm_set_vram_threshold(xe, vram_d3cold_threshold);
+	xe_pm_runtime_put(xe);
+
+	return ret ?: count;
+}
+
+static DEVICE_ATTR_RW(vram_d3cold_threshold);
+
+static void xe_pm_sysfs_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+
+	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
+}
+
+int xe_pm_sysfs_init(struct xe_device *xe)
+{
+	struct device *dev = xe->drm.dev;
+	int ret;
+
+	ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, xe_pm_sysfs_fini, xe);
+}
diff --git a/drivers/gpu/drm/xe/xe_pm_sysfs.h b/drivers/gpu/drm/xe/xe_pm_sysfs.h
new file mode 100644
index 000000000000..9213c178c515
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pm_sysfs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_PM_SYSFS_H_
+#define _XE_PM_SYSFS_H_
+
+struct xe_device;
+
+int xe_pm_sysfs_init(struct xe_device *xe);
+
+#endif
-- 
2.34.1

