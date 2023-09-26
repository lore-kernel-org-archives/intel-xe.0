Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE25E7E63F
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 14:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5376C10E3F5;
	Tue, 26 Sep 2023 14:29:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A72F10E3F2
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 14:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695738571; x=1727274571;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dlZUH8YyMW4cfun+Da/Fu6ID5wx5WsnKTxro2dxHIo0=;
 b=W0pfpm55yY0qrbCXe5ArE0Lm55S2POJz3oL6LqyvARMKgBNdNsm05lyv
 PHVrF14/XPCva1+tah3hDTbArrE7YeQtJJoa9CZlWxX1FeS3TJ0FSsodB
 T2l92C083OlDG/XAW2NcQcaSJtMfW/R+wMnZN6At0KQyFREixNScyqa4Z
 vXRlTCz+ATOAzECy8w853WBGbY8iinRNO1X/3xc/aZqodZm5rX3K43/Gj
 z9OpbYIsCWUdHhALbQ7SyNx5/y1Fqok0yalguv7b7m7lmwSoXRquGZFAO
 /B4IhcQLT9bBrI6IO0YcfTy3heXhy7ZiqFHJaStD+s3X6iJDmalBwwk0G w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="385425158"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="385425158"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 07:29:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="1079726701"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="1079726701"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by fmsmga005.fm.intel.com with ESMTP; 26 Sep 2023 07:29:28 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 20:11:20 +0530
Message-Id: <20230926144120.334009-3-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230926144120.334009-1-sujaritha.sundaresan@intel.com>
References: <20230926144120.334009-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] drm/xe: Add base performance and vram
 frequency sysfs attributes
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
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This patch adds base performace attributes as well as vram frequency
attributes.

v2: Create a separate performance directory for attributes.

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/xe_gt_freq_sysfs.c | 218 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_freq_sysfs.h |  16 ++
 drivers/gpu/drm/xe/xe_gt_sysfs.c      |   3 +
 drivers/gpu/drm/xe/xe_pcode_api.h     |  19 +++
 5 files changed, 257 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_freq_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_freq_sysfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b1681d1416eb..bdd9922d3db5 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -60,6 +60,7 @@ xe-y += xe_bb.o \
 	xe_gt.o \
 	xe_gt_clock.o \
 	xe_gt_debugfs.o \
+	xe_gt_freq_sysfs.o \
 	xe_gt_idle_sysfs.o \
 	xe_gt_mcr.o \
 	xe_gt_pagefault.o \
diff --git a/drivers/gpu/drm/xe/xe_gt_freq_sysfs.c b/drivers/gpu/drm/xe/xe_gt_freq_sysfs.c
new file mode 100644
index 000000000000..6017d09eeca2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_freq_sysfs.c
@@ -0,0 +1,218 @@
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
+#include "xe_gt_freq_sysfs.h"
+#include "xe_gt_sysfs.h"
+#include "xe_pcode.h"
+#include "xe_pcode_api.h"
+
+#define GT_FREQUENCY_MULTIPLIER	50
+
+#define U8_8_VAL_MASK           0xffff
+#define U8_8_SCALE_TO_VALUE     "0.00390625"
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
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	u32 val;
+	int err;
+
+	err = xe_gt_pcode_read(gt, PVC_PCODE_QOS_MULTIPLIER_GET,
+				PCODE_MBOX_DOMAIN_CHIPLET,
+				PCODE_MBOX_DOMAIN_BASE, &val);
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
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	u32 val;
+	int err;
+
+	err = kstrtou32(buff, 0, &val);
+	if (err)
+		return err;
+
+	if (val > U8_8_VAL_MASK)
+		return -EINVAL;
+
+	err = xe_gt_pcode_write(gt, PVC_PCODE_QOS_MULTIPLIER_SET,
+				PCODE_MBOX_DOMAIN_CHIPLET,
+				PCODE_MBOX_DOMAIN_BASE, val);
+	if (err)
+		return err;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(base_freq_factor);
+static struct device_attribute dev_attr_base_freq_factor_scale =
+	__ATTR(base_freq_factor.scale, 0444, freq_factor_scale_show, NULL);
+
+
+static ssize_t base_freq_rp0_show(struct device *dev, struct device_attribute *attr,
+				  char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	u32 val;
+	int err;
+
+	err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
+				PCODE_MBOX_FC_SC_READ_FUSED_P0,
+				PCODE_MBOX_DOMAIN_BASE, &val);
+	if (err)
+		return err;
+
+	/* data_out - Fused P0 for domain ID in units of 50 MHz */
+	val *= GT_FREQUENCY_MULTIPLIER;
+
+	return sysfs_emit(buff, "%u\n", val);
+}
+static DEVICE_ATTR_RO(base_freq_rp0);
+
+static ssize_t base_freq_rpn_show(struct device *dev, struct device_attribute *attr,
+				  char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	u32 val;
+	int err;
+
+	err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
+				PCODE_MBOX_FC_SC_READ_FUSED_PN,
+				PCODE_MBOX_DOMAIN_BASE, &val);
+	if (err)
+		return err;
+
+	/* data_out - Fused Pn for domain ID in units of 50 MHz */
+	val *= GT_FREQUENCY_MULTIPLIER;
+
+	return sysfs_emit(buff, "%u\n", val);
+}
+static DEVICE_ATTR_RO(base_freq_rpn);
+
+static const struct attribute *perf_power_attrs[] = {
+	&dev_attr_base_freq_factor.attr,
+	&dev_attr_base_freq_factor_scale.attr,
+	&dev_attr_base_freq_rp0.attr,
+	&dev_attr_base_freq_rpn.attr,
+	NULL
+};
+
+static ssize_t freq_vram_rp0_show(struct device *dev, struct device_attribute *attr,
+				  char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	u32 val;
+	int err;
+
+	err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
+				PCODE_MBOX_FC_SC_READ_FUSED_P0,
+				PCODE_MBOX_DOMAIN_HBM, &val);
+	if (err)
+		return err;
+
+	/* data_out - Fused P0 for domain ID in units of 50 MHz */
+	val *= GT_FREQUENCY_MULTIPLIER;
+
+	return sysfs_emit(buff, "%u\n", val);
+}
+static DEVICE_ATTR_RO(freq_vram_rp0);
+
+static ssize_t freq_vram_rpn_show(struct device *dev, struct device_attribute *attr,
+				  char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	u32 val;
+	int err;
+
+	err = xe_gt_pcode_read(gt, XEHP_PCODE_FREQUENCY_CONFIG,
+				PCODE_MBOX_FC_SC_READ_FUSED_PN,
+				PCODE_MBOX_DOMAIN_HBM, &val);
+	if (err)
+		return err;
+
+	/* data_out - Fused P0 for domain ID in units of 50 MHz */
+	val *= GT_FREQUENCY_MULTIPLIER;
+
+	return sysfs_emit(buff, "%u\n", val);
+}
+static DEVICE_ATTR_RO(freq_vram_rpn);
+
+static const struct attribute *vram_freq_attrs[] = {
+	&dev_attr_freq_vram_rp0.attr,
+	&dev_attr_freq_vram_rpn.attr,
+	NULL
+};
+
+static void gt_freq_sysfs_fini(struct drm_device *drm, void *arg)
+{
+	struct kobject *kobj = arg;
+
+	sysfs_remove_files(kobj, perf_power_attrs);
+	kobject_put(kobj);
+}
+
+void xe_gt_freq_sysfs_init(struct xe_gt *gt)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_device *xe = gt_to_xe(gt);
+	struct kobject *kobj;
+	int err;
+
+	kobj = kobject_create_and_add("performance", gt->sysfs);
+	if (!kobj) {
+		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
+		return;
+	}
+
+	err = sysfs_create_files(kobj, perf_power_attrs);
+	if (err) {
+		kobject_put(kobj);
+		drm_warn(&xe->drm, "failed to register performance power sysfs, err: %d\n", err);
+		return;
+	}
+
+	if (xe->info.platform == XE_PVC) {
+		err = sysfs_create_files(tile->sysfs, vram_freq_attrs);
+		if (err) {
+			kobject_put(kobj);
+			drm_warn(&xe->drm, "failed to register vram freq sysfs, err: %d\n", err);
+			return;
+		}
+
+	}
+
+	err = drmm_add_action_or_reset(&xe->drm, gt_freq_sysfs_fini, kobj);
+	if (err)
+		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
+			 __func__, err);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_freq_sysfs.h b/drivers/gpu/drm/xe/xe_gt_freq_sysfs.h
new file mode 100644
index 000000000000..7b76c4670632
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_freq_sysfs.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GT_FREQ_SYSFS_H_
+#define _XE_GT_FREQ_SYSFS_H_
+
+#include <drm/drm_managed.h>
+
+#include "xe_device.h"
+#include "xe_gt.h"
+
+void xe_gt_freq_sysfs_init(struct xe_gt *gt);
+
+#endif /* _XE_GT_FREQ_SYSFS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index c69d2e8a0fe1..3b6316ce10ed 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -11,6 +11,7 @@
 #include <drm/drm_managed.h>
 
 #include "xe_gt.h"
+#include "xe_gt_freq_sysfs.h"
 
 static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
 {
@@ -52,6 +53,8 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
 
 	gt->sysfs = &kg->base;
 
+	xe_gt_freq_sysfs_init(gt);
+
 	err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
 	if (err) {
 		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 837ff7c71280..da4114bfaa7a 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -30,6 +30,25 @@
 #define   PCODE_READ_MIN_FREQ_TABLE	0x9
 #define   PCODE_FREQ_RING_RATIO_SHIFT	16
 
+#define   XEHP_PCODE_FREQUENCY_CONFIG			0x6e	/* xehp, pvc */
+/* XEHP_PCODE_FREQUENCY_CONFIG sub-commands (param1) */
+#define     PCODE_MBOX_FC_SC_READ_FUSED_P0		0x0
+#define     PCODE_MBOX_FC_SC_READ_FUSED_PN		0x1
+/* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
+/* XEHP_PCODE_FREQUENCY_CONFIG param2 */
+#define     PCODE_MBOX_DOMAIN_NONE			0x0
+#define     PCODE_MBOX_DOMAIN_GT			0x1
+#define     PCODE_MBOX_DOMAIN_HBM			0x2
+#define     PCODE_MBOX_DOMAIN_MEDIAFF			0x3
+#define     PCODE_MBOX_DOMAIN_MEDIA_SAMPLER		0x4
+#define     PCODE_MBOX_DOMAIN_SYSTOLIC_ARRAY		0x5
+#define     PCODE_MBOX_DOMAIN_CHIPLET			0x6
+#define     PCODE_MBOX_DOMAIN_BASE_CHIPLET_LINK		0x7
+#define     PCODE_MBOX_DOMAIN_BASE			0x8
+#define   PVC_PCODE_QOS_MULTIPLIER_SET			0x67
+/* See PCODE_MBOX_DOMAIN_* - mailbox domain IDs - param1 and 2 */
+#define   PVC_PCODE_QOS_MULTIPLIER_GET			0x66
+
 /* PCODE Init */
 #define   DGFX_PCODE_STATUS		0x7E
 #define     DGFX_GET_INIT_STATUS	0x0
-- 
2.25.1

