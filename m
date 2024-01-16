Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D481CC47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 09:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C2C10E447;
	Tue, 16 Jan 2024 09:30:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A3910E447
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 09:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705397439; x=1736933439;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rDntAlPwkVomfU1h2DV1EO6RzMosdEn83vW5VHZoY0M=;
 b=W7xKk544IeSYi7LHjarctTJAP49hrwQg89MCxRRfwsyqpU66cuNSwlmU
 VLS6oQRpCGtVMZIEQbVPMmsbLGRKIggDhYkcER8T4Y7tM1kDwTjG3GD/E
 SHLCpswSYjqc6Jc+eOIOfGrcQIBvum6iN7u//JE6JTt0QH2lcZ6NmccgE
 ZenbFIEWLR2dUEGADjyAMIxBqVX7SDBlEW1XK0P3oyW9sthRXhyU8B6xu
 5Yjp1YS5yd2bBNMWEvsqtKa4o2dLDk6k5hojLIZUageezlNz14nsNILoI
 dw/QA6b/Ctwdf/w6k791/q6Qy2T/28foeobUSNk5uEJK1l2QbL3d1JHdK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="398666576"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; d="scan'208";a="398666576"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 01:30:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; d="scan'208";a="25724602"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orviesa002.jf.intel.com with ESMTP; 16 Jan 2024 01:30:36 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Add base frequency balance sysfs attributes
Date: Tue, 16 Jan 2024 15:16:00 +0530
Message-Id: <20240116094600.2503995-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add sysfs attributes for base frequency balance.

device/tile#/gt#/freq0/balance
			|- base_freq_factor
			|- base_freq_factor.scale
			|- base_rp0_freq
			|- base_rpn_freq

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/Makefile        |   1 +
 drivers/gpu/drm/xe/xe_gt_balance.c | 180 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_balance.h |  13 +++
 drivers/gpu/drm/xe/xe_gt_freq.c    |   3 +
 drivers/gpu/drm/xe/xe_pcode_api.h  |   4 +
 5 files changed, 201 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_balance.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_balance.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e16b84f79ddf..876b2bf879d5 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -78,6 +78,7 @@ xe-y += xe_bb.o \
 	xe_gsc.o \
 	xe_gsc_submit.o \
 	xe_gt.o \
+	xe_gt_balance.o \
 	xe_gt_ccs_mode.o \
 	xe_gt_clock.o \
 	xe_gt_debugfs.o \
diff --git a/drivers/gpu/drm/xe/xe_gt_balance.c b/drivers/gpu/drm/xe/xe_gt_balance.c
new file mode 100644
index 000000000000..42831482e9f5
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_balance.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+
+#include <regs/xe_reg_defs.h>
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_gt_balance.h"
+#include "xe_gt_sysfs.h"
+#include "xe_pcode.h"
+#include "xe_pcode_api.h"
+#include "xe_mmio.h"
+
+/**
+ * DOC: Xe GT Balance
+ *
+ * Provides sysfs entries for balance frequency in GT
+ *
+ * device/tile#/gt#/freq0/balance/base_freq_factor - Base frequency factor
+ * device/tile#/gt#/freq0/balance/base_freq_factor.scale - Base frequency factor scale
+ * device/tile#/gt#/freq0/balance/base_rp0_freq - Base Render Performance 0 level frequency
+ * device/tile#/gt#/freq0/balance/base_rpn_freq - Base Render Performance N level frequency
+ */
+
+#define GT_FREQUENCY_MULTIPLIER	50
+
+#define U8_8_VAL_MASK           0xffff
+#define U8_8_SCALE_TO_VALUE     "0.00390625"
+
+static struct xe_gt *
+dev_to_gt(struct device *dev)
+{
+	return kobj_to_gt(dev->kobj.parent);
+}
+
+static ssize_t freq_factor_scale_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buff)
+{
+	return sysfs_emit(buff, "%s\n", U8_8_SCALE_TO_VALUE);
+}
+
+static ssize_t base_freq_factor_show(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buff)
+{
+	struct xe_gt *gt = dev_to_gt(dev);
+	u32 val, mbox;
+	int err;
+
+	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_QOS_MULTIPLIER_GET)
+		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_DOMAIN_CHIPLET)
+		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_BASE);
+
+	err = xe_pcode_read(gt, mbox, &val, NULL);
+	if (err)
+		return err;
+
+	val &= U8_8_VAL_MASK;
+
+	return sysfs_emit(buff, "%u\n", val);
+}
+
+static ssize_t base_freq_factor_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buff, size_t count)
+{
+	struct xe_gt *gt = dev_to_gt(dev);
+	u32 val, mbox;
+	int err;
+
+	err = kstrtou32(buff, 0, &val);
+	if (err)
+		return err;
+
+	if (val > U8_8_VAL_MASK)
+		return -EINVAL;
+
+	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_QOS_MULTIPLIER_SET)
+		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_DOMAIN_CHIPLET)
+		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_BASE);
+
+	err = xe_pcode_write(gt, mbox, val);
+	if (err)
+		return err;
+
+	return count;
+}
+static DEVICE_ATTR_RW(base_freq_factor);
+static struct device_attribute dev_attr_base_freq_factor_scale =
+	__ATTR(base_freq_factor.scale, 0444, freq_factor_scale_show, NULL);
+
+static ssize_t base_rp0_freq_show(struct device *dev, struct device_attribute *attr,
+				  char *buff)
+{
+	struct xe_gt *gt = dev_to_gt(dev);
+	u32 val, mbox;
+	int err;
+
+	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
+		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_P0)
+		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_BASE);
+
+	err = xe_pcode_read(gt, mbox, &val, NULL);
+	if (err)
+		return err;
+
+	/* data_out - Fused P0 for domain ID in units of 50 MHz */
+	val *= GT_FREQUENCY_MULTIPLIER;
+
+	return sysfs_emit(buff, "%u\n", val);
+}
+static DEVICE_ATTR_RO(base_rp0_freq);
+
+static ssize_t base_rpn_freq_show(struct device *dev, struct device_attribute *attr,
+				  char *buff)
+{
+	struct xe_gt *gt = dev_to_gt(dev);
+	u32 val, mbox;
+	int err;
+
+	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
+		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_PN)
+		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_BASE);
+
+	err = xe_pcode_read(gt, mbox, &val, NULL);
+	if (err)
+		return err;
+
+	/* data_out - Fused Pn for domain ID in units of 50 MHz */
+	val *= GT_FREQUENCY_MULTIPLIER;
+
+	return sysfs_emit(buff, "%u\n", val);
+}
+static DEVICE_ATTR_RO(base_rpn_freq);
+
+static struct attribute *balance_attrs[] = {
+	&dev_attr_base_freq_factor.attr,
+	&dev_attr_base_freq_factor_scale.attr,
+	&dev_attr_base_rp0_freq.attr,
+	&dev_attr_base_rpn_freq.attr,
+	NULL
+};
+
+static const struct attribute_group balance_group_attrs = {
+	.name = "balance",
+	.attrs = balance_attrs,
+};
+
+static void gt_balance_sysfs_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_gt *gt = arg;
+
+	sysfs_remove_group(gt->freq, &balance_group_attrs);
+}
+
+void xe_gt_balance_sysfs_init(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	int err;
+
+	if (xe->info.platform != XE_PVC)
+		return;
+
+	err = sysfs_create_group(gt->freq, &balance_group_attrs);
+	if (err) {
+		drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
+		return;
+	}
+
+	err = drmm_add_action_or_reset(&xe->drm, gt_balance_sysfs_fini, gt);
+	if (err) {
+		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
+			 __func__, err);
+		sysfs_remove_group(gt->freq, &balance_group_attrs);
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_balance.h b/drivers/gpu/drm/xe/xe_gt_balance.h
new file mode 100644
index 000000000000..59c3852c7c6c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_balance.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_GT_BALANCE_SYSFS_H_
+#define _XE_GT_BALANCE_SYSFS_H_
+
+struct xe_gt;
+
+void xe_gt_balance_sysfs_init(struct xe_gt *gt);
+
+#endif /* _XE_GT_BALANCE_SYSFS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index e5b0f4ecdbe8..447c242fd397 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -12,6 +12,7 @@
 #include <drm/drm_print.h>
 
 #include "xe_device_types.h"
+#include "xe_gt_balance.h"
 #include "xe_gt_sysfs.h"
 #include "xe_gt_throttle_sysfs.h"
 #include "xe_guc_pc.h"
@@ -218,5 +219,7 @@ void xe_gt_freq_init(struct xe_gt *gt)
 		drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
 			 kobject_name(gt->freq), err);
 
+	xe_gt_balance_sysfs_init(gt);
+
 	xe_gt_throttle_sysfs_init(gt);
 }
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index f153ce96f69a..e5318412501b 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -48,6 +48,10 @@
 #define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
 /* Domain IDs (param2) */
 #define     PCODE_MBOX_DOMAIN_HBM		0x2
+#define     PCODE_MBOX_DOMAIN_CHIPLET		0x6
+#define     PCODE_MBOX_DOMAIN_BASE		0x8
+#define   PCODE_QOS_MULTIPLIER_GET		0x66
+#define   PCODE_QOS_MULTIPLIER_SET		0x67
 
 struct pcode_err_decode {
 	int errno;
-- 
2.25.1

