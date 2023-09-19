Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114EDCD54B4
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 10:55:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5E710E38D;
	Tue, 19 Sep 2023 10:55:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B78210E390
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 10:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695120909; x=1726656909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1xuo2BM0v0ZMyiQARQSyK/yksbbuz7Tnthn+n2gBRjQ=;
 b=lZcguzS6iBiGvjZLVFR1h++IwGph5dxrl5zc12RFtuUEE4lUaYVVtv6N
 kUAifnbeaFN+Sh1BWxX1jszupXzQDgTJewwPuSSZNAjWvykNIRZbFlAco
 EdydGKAppp00BKPqq8APIQ7461pKiK7teFKpANDFHt0CJmsXI1EzhwPm6
 3RQfVhLSkxbqfGzEGIsAh4AVj8C1IL/85i87lmv72iHJEHlHWXuRm/AgH
 Y6YAiZVArbLJ1E6URAGdFskH/1ebnm3QiEUjgU0kMamYaEt+miToiRt3z
 V8g6FnxoaI5grxcxiE9yxH6ctvfmxKTp6NusQPMLdILoUMdmDMA9qaFbM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="379813354"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="379813354"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:55:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="993124335"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="993124335"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by fmsmga006.fm.intel.com with ESMTP; 19 Sep 2023 03:55:05 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 19 Sep 2023 16:35:41 +0530
Message-Id: <20230919110541.1243785-2-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230919110541.1243785-1-sujaritha.sundaresan@intel.com>
References: <20230919110541.1243785-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/1] drm/xe: Add throttle reason sysfs
 attributes
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add throttle reasons sysfs interface under device/../gt#/
Currently there is one overall status and eight reasons
attributes.

The new sysfs structure will have the below layout

device/tile<n>/gt<n>
               ├── gt0
               │   └── throttle
               │       ├── <throttle_reasons>
               │
               │
               ├── gtN
               │   └── throttle
               │       ├── <throttle_reasons>

v2: Fix review comments (Riana)
    Move init call (Matt)

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  13 +
 drivers/gpu/drm/xe/xe_gt_sysfs.c              |   3 +
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     | 281 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     |  17 ++
 .../gpu/drm/xe/xe_gt_throttle_sysfs_types.h   |  15 +
 drivers/gpu/drm/xe/xe_gt_types.h              |   4 +
 7 files changed, 334 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index cc95a46b5e4d..7e1c4be0ab7f 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -63,6 +63,7 @@ xe-y += xe_bb.o \
 	xe_gt_mcr.o \
 	xe_gt_pagefault.o \
 	xe_gt_sysfs.o \
+	xe_gt_throttle_sysfs.o \
 	xe_gt_tlb_invalidation.o \
 	xe_gt_topology.o \
 	xe_guc.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index e13fbbdf6929..f9ba57c3bc4b 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -410,4 +410,17 @@
 #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
 #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
 
+#define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
+#define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
+#define   PROCHOT_MASK				REG_BIT(0)
+#define   THERMAL_LIMIT_MASK			REG_BIT(1)
+#define   RATL_MASK				REG_BIT(5)
+#define   VR_THERMALERT_MASK			REG_BIT(6)
+#define   VR_TDC_MASK				REG_BIT(7)
+#define   POWER_LIMIT_4_MASK			REG_BIT(8)
+#define   POWER_LIMIT_1_MASK			REG_BIT(10)
+#define   POWER_LIMIT_2_MASK			REG_BIT(11)
+#define   GT0_PERF_LIMIT_REASONS_LOG_MASK	REG_GENMASK(31, 16)
+#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index c69d2e8a0fe1..d4839ade7240 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -11,6 +11,7 @@
 #include <drm/drm_managed.h>
 
 #include "xe_gt.h"
+#include "xe_gt_throttle_sysfs.h"
 
 static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
 {
@@ -52,6 +53,8 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
 
 	gt->sysfs = &kg->base;
 
+	xe_gt_throttle_sysfs_init(&gt->throttle);
+
 	err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
 	if (err) {
 		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
new file mode 100644
index 000000000000..0dc9c7cada5a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
@@ -0,0 +1,281 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+
+#include <regs/xe_gt_regs.h>
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_gt_sysfs.h"
+#include "xe_gt_throttle_sysfs.h"
+#include "xe_mmio.h"
+
+/**
+ * DOC: Xe GT Throttle
+ *
+ * Provides sysfs entries for frequency throttle reasons in GT
+ *
+ * device/gt#/throttle/status - Overall status
+ * device/gt#/throttle/throttle_reason_pl1 - Frequency throttle due to PL1
+ * device/gt#/throttle/throttle_reason_pl2 - Frequency throttle due to PL2
+ * device/gt#/throttle/throttle_reason_pl4 - Frequency throttle due to PL4, Iccmax etc.
+ * device/gt#/throttle/throttle_reason_thermal - Frequency throttle due to thermal
+ * device/gt#/throttle/throttle_reason_prochot - Frequency throttle due to prochot
+ * device/gt#/throttle/throttle_reason_ratl - Frequency throttle due to RATL
+ * device/gt#/throttle/throttle_reason_vr_thermalert - Frequency throttle due to VR THERMALERT
+ * device/gt#/throttle/throttle_reason_vr_tdc -  Frequency throttle due to VR TDC
+ */
+
+static struct xe_gt_throttle *dev_to_throttle(struct device *dev)
+{
+	struct kobject *kobj = &dev->kobj;
+
+	return &kobj_to_gt(kobj->parent)->throttle;
+}
+
+static struct xe_gt *throttle_to_gt(struct xe_gt_throttle *throttle)
+{
+	return container_of(throttle, struct xe_gt, throttle);
+}
+
+u32 read_perf_limit_reasons(struct xe_gt *gt)
+{
+	u32 reg;
+	if (xe_gt_is_media_type(gt))
+		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
+	else
+		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
+
+	return reg;
+}
+
+u32 xe_read_status(struct xe_gt_throttle *throttle)
+{
+	struct xe_gt *gt = throttle_to_gt(throttle);
+	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
+
+	return status;
+}
+
+u32 xe_read_reason_pl1(struct xe_gt_throttle *throttle)
+{
+	struct xe_gt *gt = throttle_to_gt(throttle);
+	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
+
+	return pl1;
+}
+
+u32 xe_read_reason_pl2(struct xe_gt_throttle *throttle)
+{
+	struct xe_gt *gt = throttle_to_gt(throttle);
+	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
+
+	return pl2;
+}
+
+u32 xe_read_reason_pl4(struct xe_gt_throttle *throttle)
+{
+	struct xe_gt *gt = throttle_to_gt(throttle);
+	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
+
+	return pl4;
+}
+
+u32 xe_read_reason_thermal(struct xe_gt_throttle *throttle)
+{
+	struct xe_gt *gt = throttle_to_gt(throttle);
+	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
+
+	return thermal;
+}
+
+u32 xe_read_reason_prochot(struct xe_gt_throttle *throttle)
+{
+	struct xe_gt *gt = throttle_to_gt(throttle);
+	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
+
+	return prochot;
+}
+
+u32 xe_read_reason_ratl(struct xe_gt_throttle *throttle)
+{
+	struct xe_gt *gt = throttle_to_gt(throttle);
+	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
+
+	return ratl;
+}
+
+u32 xe_read_reason_vr_thermalert(struct xe_gt_throttle *throttle)
+{
+	struct xe_gt *gt = throttle_to_gt(throttle);
+	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
+
+	return thermalert;
+}
+
+u32 xe_read_reason_vr_tdc(struct xe_gt_throttle *throttle)
+{
+	struct xe_gt *gt = throttle_to_gt(throttle);
+	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
+
+	return tdc;
+}
+
+static ssize_t status_show(struct device *dev,
+			   struct device_attribute *attr,
+			   char *buff)
+{
+	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
+	struct xe_gt *gt = throttle_to_gt(throttle);
+	bool status = !!xe_read_status(&gt->throttle);
+
+	return sysfs_emit(buff, "%u\n", status);
+}
+static DEVICE_ATTR_RO(status);
+
+static ssize_t reason_pl1_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buff)
+{
+	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
+	struct xe_gt *gt = throttle_to_gt(throttle);
+	bool pl1 = !!xe_read_reason_pl1(&gt->throttle);
+
+	return sysfs_emit(buff, "%u\n", pl1);
+}
+static DEVICE_ATTR_RO(reason_pl1);
+
+static ssize_t reason_pl2_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buff)
+{
+	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
+	struct xe_gt *gt = throttle_to_gt(throttle);
+	bool pl2 = !!xe_read_reason_pl2(&gt->throttle);
+
+	return sysfs_emit(buff, "%u\n", pl2);
+}
+static DEVICE_ATTR_RO(reason_pl2);
+
+static ssize_t reason_pl4_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buff)
+{
+	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
+	struct xe_gt *gt = throttle_to_gt(throttle);
+	bool pl4 = !!xe_read_reason_pl4(&gt->throttle);
+
+	return sysfs_emit(buff, "%u\n", pl4);
+}
+static DEVICE_ATTR_RO(reason_pl4);
+
+static ssize_t reason_thermal_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buff)
+{
+	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
+	struct xe_gt *gt = throttle_to_gt(throttle);
+	bool thermal = !!xe_read_reason_thermal(&gt->throttle);
+
+	return sysfs_emit(buff, "%u\n", thermal);
+}
+static DEVICE_ATTR_RO(reason_thermal);
+
+static ssize_t reason_prochot_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buff)
+{
+	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
+	struct xe_gt *gt = throttle_to_gt(throttle);
+	bool prochot = !!xe_read_reason_prochot(&gt->throttle);
+
+	return sysfs_emit(buff, "%u\n", prochot);
+}
+static DEVICE_ATTR_RO(reason_prochot);
+
+static ssize_t reason_ratl_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buff)
+{
+	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
+	struct xe_gt *gt = throttle_to_gt(throttle);
+	bool ratl = !!xe_read_reason_ratl(&gt->throttle);
+
+	return sysfs_emit(buff, "%u\n", ratl);
+}
+static DEVICE_ATTR_RO(reason_ratl);
+
+static ssize_t reason_vr_thermalert_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buff)
+{
+	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
+	struct xe_gt *gt = throttle_to_gt(throttle);
+	bool thermalert = !!xe_read_reason_vr_thermalert(&gt->throttle);
+
+	return sysfs_emit(buff, "%u\n", thermalert);
+}
+static DEVICE_ATTR_RO(reason_vr_thermalert);
+
+static ssize_t reason_vr_tdc_show(struct device *dev,
+				  struct device_attribute *attr,
+				  char *buff)
+{
+	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
+	struct xe_gt *gt = throttle_to_gt(throttle);
+	bool tdc = !!xe_read_reason_vr_tdc(&gt->throttle);
+
+	return sysfs_emit(buff, "%u\n", tdc);
+}
+static DEVICE_ATTR_RO(reason_vr_tdc);
+
+static const struct attribute *throttle_attrs[] = {
+	&dev_attr_status.attr,
+	&dev_attr_reason_pl1.attr,
+	&dev_attr_reason_pl2.attr,
+	&dev_attr_reason_pl4.attr,
+	&dev_attr_reason_thermal.attr,
+	&dev_attr_reason_prochot.attr,
+	&dev_attr_reason_ratl.attr,
+	&dev_attr_reason_vr_thermalert.attr,
+	&dev_attr_reason_vr_tdc.attr,
+	NULL
+};
+
+static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
+{
+	struct kobject *kobj = arg;
+
+	sysfs_remove_files(kobj, throttle_attrs);
+	kobject_put(kobj);
+}
+
+void xe_gt_throttle_sysfs_init(struct xe_gt_throttle *throttle)
+{
+	struct xe_gt *gt = throttle_to_gt(throttle);
+	struct xe_device *xe = gt_to_xe(gt);
+	struct kobject *kobj;
+	int err;
+
+	kobj = kobject_create_and_add("throttle", gt->sysfs);
+	if (!kobj) {
+		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
+		return;
+	}
+
+	err = sysfs_create_files(kobj, throttle_attrs);
+	if (err) {
+		kobject_put(kobj);
+		drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
+		return;
+	}
+
+	err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, kobj);
+	if (err)
+		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
+			 __func__, err);
+}
+
+
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
new file mode 100644
index 000000000000..809213c3bba1
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GT_THROTTLE_SYSFS_H_
+#define _XE_GT_THROTTLE_SYSFS_H_
+
+#include <drm/drm_managed.h>
+
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_gt_throttle_sysfs_types.h"
+
+void xe_gt_throttle_sysfs_init(struct xe_gt_throttle *throttle);
+
+#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
new file mode 100644
index 000000000000..5ee0d45d0a9f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GT_THROTTLE_SYSFS_TYPES_H_
+#define _XE_GT_THROTTLE_SYSFS_TYPES_H_
+
+#include <linux/types.h>
+
+struct xe_gt_throttle {
+};
+
+#endif /* _XE_GT_THROTTLE_SYSFS_TYPES_H_ */
+
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index d4310be3e1e7..7829bbeeb5d8 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -8,6 +8,7 @@
 
 #include "xe_force_wake_types.h"
 #include "xe_gt_idle_sysfs_types.h"
+#include "xe_gt_throttle_sysfs_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_hw_fence_types.h"
 #include "xe_reg_sr_types.h"
@@ -299,6 +300,9 @@ struct xe_gt {
 	/** @sysfs: sysfs' kobj used by xe_gt_sysfs */
 	struct kobject *sysfs;
 
+	/** @throttle: frequency throttling reasons in GT */
+	struct xe_gt_throttle throttle;
+
 	/** @mocs: info */
 	struct {
 		/** @uc_index: UC index */
-- 
2.25.1

