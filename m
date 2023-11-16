Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C024C197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 14:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E2710E5F4;
	Thu, 16 Nov 2023 14:17:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CED10E5F3
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 14:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700144236; x=1731680236;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OUXKHTtQabgMfrOlGK9YG9flrKqQqKMveK7atZD7WCU=;
 b=JZZCiM0fAD/UAfamqwqLMoqrxCLwNEfPKeOt4PWzaMJTDcrMQGAHnq6D
 2OQVRhgeTPIdcOQ7hvqHiRWABeWL5b7WTEpv2WbkpXfjNbjJSG4qDOkD5
 5Q5lCrBQiu4+NqCn696U7KBVwgjIHw3NUD4CJv/h/O/a4MJV9X4pXnuD8
 NXRdOqpKuv/DOilSxtOrnG5z4BXJHZ73d4xK6an5zeIGVq09uHwWW29DB
 Wcp8/xUR50ZRBqfVpHvVBwmOvxoQZzg3cpRDALkZl1THzfq+CoCzF/rGn
 JeKiu8/Nd2hext1LTWulCkmTXsOluk6K47Lf205IATsFKTcG74c3/sv1p g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="12643385"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="12643385"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 06:17:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="715230486"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="715230486"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga003.jf.intel.com with ESMTP; 16 Nov 2023 06:17:14 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Nov 2023 20:00:42 +0530
Message-Id: <20231116143043.908412-4-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116143043.908412-1-sujaritha.sundaresan@intel.com>
References: <20231116143043.908412-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 3/4] drm/xe: Add throttle reasons sysfs attributes
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 vivi.rodrigo@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add throttle reasons sysfs interface under device/../gt#/freq
Currently there is one overall status and eight reasons
attributes.

The new sysfs structure will have the below layout

device/tile<n>/gt<n>
               ├── freq
               │   └── throttle
               │       ├── <throttle_reasons>

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/Makefile               |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  12 +
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 266 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h |  17 ++
 4 files changed, 296 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a1a8847e2ba3..c02b8e9bd72e 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -64,6 +64,7 @@ xe-y += xe_bb.o \
 	xe_gt_mcr.o \
 	xe_gt_pagefault.o \
 	xe_gt_sysfs.o \
+	xe_gt_throttle_sysfs.o \
 	xe_gt_tlb_invalidation.o \
 	xe_gt_topology.o \
 	xe_guc.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index cc27fe8fc363..296ba9831634 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -457,4 +457,16 @@
 #define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
 #define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
 
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
+#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
new file mode 100644
index 000000000000..1b64058d9561
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
@@ -0,0 +1,266 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+
+#include <regs/xe_reg_defs.h>
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
+ * device/gt#/throttle/reason_pl1 - Frequency throttle due to PL1
+ * device/gt#/throttle/reason_pl2 - Frequency throttle due to PL2
+ * device/gt#/throttle/reason_pl4 - Frequency throttle due to PL4, Iccmax etc.
+ * device/gt#/throttle/reason_thermal - Frequency throttle due to thermal
+ * device/gt#/throttle/reason_prochot - Frequency throttle due to prochot
+ * device/gt#/throttle/reason_ratl - Frequency throttle due to RATL
+ * device/gt#/throttle/reason_vr_thermalert - Frequency throttle due to VR THERMALERT
+ * device/gt#/throttle/reason_vr_tdc -  Frequency throttle due to VR TDC
+ */
+
+static u32 read_perf_limit_reasons(struct xe_gt *gt)
+{
+	u32 reg;
+
+	if (xe_gt_is_media_type(gt))
+		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
+	else
+		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
+
+	return reg;
+}
+
+static u32 read_status(struct xe_gt *gt)
+{
+	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
+
+	return status;
+}
+
+static u32 read_reason_pl1(struct xe_gt *gt)
+{
+	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
+
+	return pl1;
+}
+
+static u32 read_reason_pl2(struct xe_gt *gt)
+{
+	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
+
+	return pl2;
+}
+
+static u32 read_reason_pl4(struct xe_gt *gt)
+{
+	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
+
+	return pl4;
+}
+
+static u32 read_reason_thermal(struct xe_gt *gt)
+{
+	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
+
+	return thermal;
+}
+
+static u32 read_reason_prochot(struct xe_gt *gt)
+{
+	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
+
+	return prochot;
+}
+
+static u32 read_reason_ratl(struct xe_gt *gt)
+{
+	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
+
+	return ratl;
+}
+
+static u32 read_reason_vr_thermalert(struct xe_gt *gt)
+{
+	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
+
+	return thermalert;
+}
+
+static u32 read_reason_vr_tdc(struct xe_gt *gt)
+{
+	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
+
+	return tdc;
+}
+
+static ssize_t status_show(struct device *dev,
+			   struct device_attribute *attr,
+			   char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	bool status = !!read_status(gt);
+
+	return sysfs_emit(buff, "%u\n", status);
+}
+static DEVICE_ATTR_RO(status);
+
+static ssize_t reason_pl1_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	bool pl1 = !!read_reason_pl1(gt);
+
+	return sysfs_emit(buff, "%u\n", pl1);
+}
+static DEVICE_ATTR_RO(reason_pl1);
+
+static ssize_t reason_pl2_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	bool pl2 = !!read_reason_pl2(gt);
+
+	return sysfs_emit(buff, "%u\n", pl2);
+}
+static DEVICE_ATTR_RO(reason_pl2);
+
+static ssize_t reason_pl4_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	bool pl4 = !!read_reason_pl4(gt);
+
+	return sysfs_emit(buff, "%u\n", pl4);
+}
+static DEVICE_ATTR_RO(reason_pl4);
+
+static ssize_t reason_thermal_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	bool thermal = !!read_reason_thermal(gt);
+
+	return sysfs_emit(buff, "%u\n", thermal);
+}
+static DEVICE_ATTR_RO(reason_thermal);
+
+static ssize_t reason_prochot_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	bool prochot = !!read_reason_prochot(gt);
+
+	return sysfs_emit(buff, "%u\n", prochot);
+}
+static DEVICE_ATTR_RO(reason_prochot);
+
+static ssize_t reason_ratl_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	bool ratl = !!read_reason_ratl(gt);
+
+	return sysfs_emit(buff, "%u\n", ratl);
+}
+static DEVICE_ATTR_RO(reason_ratl);
+
+static ssize_t reason_vr_thermalert_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	bool thermalert = !!read_reason_vr_thermalert(gt);
+
+	return sysfs_emit(buff, "%u\n", thermalert);
+}
+static DEVICE_ATTR_RO(reason_vr_thermalert);
+
+static ssize_t reason_vr_tdc_show(struct device *dev,
+				  struct device_attribute *attr,
+				  char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	bool tdc = !!read_reason_vr_tdc(gt);
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
+void xe_gt_throttle_sysfs_init(struct xe_gt *gt) 
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct kobject *kobj1, *kobj2;
+	int err;
+
+
+	kobj1 = kobject_create_and_add("freq", gt->sysfs);
+	if (!kobj1) {
+		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
+		return;
+	}
+
+	kobj2 = kobject_create_and_add("throttle", kobj1);
+	if (!kobj2) {
+		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
+		return;
+	}
+
+	err = sysfs_create_files(kobj2, throttle_attrs);
+	if (err) {
+		kobject_put(kobj2);
+		drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
+		return;
+	}
+
+	err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, kobj2);
+	if (err)
+		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
+			 __func__, err);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
new file mode 100644
index 000000000000..48e22f6b6442
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright Â© 2023 Intel Corporation
+ */
+
+#ifndef _XE_GT_THROTTLE_SYSFS_H_
+#define _XE_GT_THROTTLE_SYSFS_H_
+
+#include <drm/drm_managed.h>
+
+#include "xe_device.h"
+#include "xe_gt.h"
+
+void xe_gt_throttle_sysfs_init(struct xe_gt *gt);
+
+#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
+
-- 
2.25.1

