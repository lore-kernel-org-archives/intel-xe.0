Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CB8C7EE29
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jun 2023 08:44:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B2E10E356;
	Tue, 13 Jun 2023 08:44:28 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE0810E35A
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jun 2023 08:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686645865; x=1718181865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M/oXX1mqLegcwrH6lQQ4L5MAzmFqsqkpdcsuvVWn38o=;
 b=fr9LEiatpf8/s6dbvZ+cIc8IHRNorUvZZ28hiBUAW3EaaqMSuRxJN/EQ
 hBJyCP+SlyQ/87jm7tlLQFBUtsCU5d5J2UbhrlSs7napcP893Ha+eRV5G
 gIUd7H8qASbLtYxKPUFGR/Jd43Z4RLPLdU6oghoHp+WEcexPpK+BazmOG
 j1ZXHz5jlitbedoundu/Yj5JJLM4Ccrrgy0goHzzHfbdL8PqacjwF8t4y
 GuOKUL7hfN0qhmiIg092/TWLwSrR6ucs9BZmyFmNBGoh8nEc4Pe1mBild
 M8FCHUDGnWeoLjzlccmQK29nuUe+T9ok9JrRtWJ+HcPScRNigF+3XTui5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="386663337"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="386663337"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 01:44:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="958330279"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; d="scan'208";a="958330279"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 01:44:22 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 13 Jun 2023 14:17:20 +0530
Message-Id: <20230613084721.3698818-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230613084721.3698818-1-riana.tauro@intel.com>
References: <20230613084721.3698818-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: add a new sysfs directory for gtidle
 properties
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
Cc: joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add a new sysfs directory under devices/gt#/ called gtidle
to contain idle properties of GT such as name, idle_status,
idle_residency_ms

v2:
    - abstract using function pointers (Anshuman)
    - remove forcewake calls for residency counter
    - use device_attr (Badal)
    - move rc functions to guc_pc
    - change name to gt_idle (Rodrigo)

v3:
    - return error for drmm_add_action_or_reset
    - replace file and functions with gt_idle prefix
      to gt_idle_sysfs (Himal)
    - use enum for gt idle state
    - move multiplier to gt idle and initialize (Anshuman)
    - correct doc annotation (Rodrigo)
    - remove return variable
    - use kobj_gt instead of new gtidle kobj
    - move residency_ms to gtidle file
    - retain xe_guc_pc prefix for functions in guc_rc file (Michal)

v4:
    - fix doc errors in xe_guc_pc file
    - change u64 to u32 for reading residency counter
    - keep gtidle states generic GT_IDLE_C[0/6] (Anshuman)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/xe_gt.c                  |   5 +
 drivers/gpu/drm/xe/xe_gt_idle_sysfs.c       | 160 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_idle_sysfs.h       |  13 ++
 drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h |  38 +++++
 drivers/gpu/drm/xe/xe_gt_types.h            |   4 +
 drivers/gpu/drm/xe/xe_guc_pc.c              |  44 ++----
 drivers/gpu/drm/xe/xe_guc_pc.h              |   2 +
 8 files changed, 239 insertions(+), 28 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 0fbbbc6e247c..4a7a8d50a5d4 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -58,6 +58,7 @@ xe-y += xe_bb.o \
 	xe_gt.o \
 	xe_gt_clock.o \
 	xe_gt_debugfs.o \
+	xe_gt_idle_sysfs.o \
 	xe_gt_mcr.o \
 	xe_gt_pagefault.o \
 	xe_gt_sysfs.o \
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3799e663bad3..1c094f5bc40a 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -18,6 +18,7 @@
 #include "xe_force_wake.h"
 #include "xe_ggtt.h"
 #include "xe_gt_clock.h"
+#include "xe_gt_idle_sysfs.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_pagefault.h"
 #include "xe_gt_printk.h"
@@ -306,6 +307,10 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
+	err = xe_gt_idle_sysfs_init(&gt->gtidle);
+	if (err)
+		goto err_force_wake;
+
 	/* XXX: Fake that we pull the engine mask from hwconfig blob */
 	gt->info.engine_mask = gt->info.__engine_mask;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
new file mode 100644
index 000000000000..1b2dcac46479
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_gt_idle_sysfs.h"
+#include "xe_gt_sysfs.h"
+#include "xe_guc_pc.h"
+
+/**
+ * DOC: Xe GT Idle
+ *
+ * Provides sysfs entries for idle properties of GT
+ *
+ * device/gt#/gtidle/name - name of the state
+ * device/gt#/gtidle/idle_residency_ms - Provides residency of the idle state in ms
+ * device/gt#/gtidle/idle_status - Provides current idle state
+ */
+
+static struct xe_gt_idle *dev_to_gtidle(struct device *dev)
+{
+	struct kobject *kobj = &dev->kobj;
+
+	return &kobj_to_gt(kobj->parent)->gtidle;
+}
+
+static struct xe_gt *gtidle_to_gt(struct xe_gt_idle *gtidle)
+{
+	return container_of(gtidle, struct xe_gt, gtidle);
+}
+
+static struct xe_guc_pc *gtidle_to_pc(struct xe_gt_idle *gtidle)
+{
+	return &gtidle_to_gt(gtidle)->uc.guc.pc;
+}
+
+static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
+{
+	switch (state) {
+	case GT_IDLE_C0:
+		return "gt-c0";
+	case GT_IDLE_C6:
+		return "gt-c6";
+	default:
+		return "unknown";
+	}
+}
+
+static u64 get_residency_ms(struct xe_gt_idle *gtidle, u64 cur_residency)
+{
+	u64 delta, overflow_residency, prev_residency;
+
+	overflow_residency = BIT_ULL(32);
+
+	/*
+	 * Counter wrap handling
+	 * Store previous hw counter values for counter wrap-around handling
+	 * Relying on sufficient frequency of queries otherwise counters can still wrap.
+	 */
+	prev_residency = gtidle->prev_residency;
+	gtidle->prev_residency = cur_residency;
+
+	/* delta */
+	if (cur_residency >= prev_residency)
+		delta = cur_residency - prev_residency;
+	else
+		delta = cur_residency + (overflow_residency - prev_residency);
+
+	/* Add delta to extended raw driver copy of idle residency */
+	cur_residency = gtidle->cur_residency + delta;
+	gtidle->cur_residency = cur_residency;
+
+	/* residency multiplier in ns, convert to ms */
+	cur_residency = mul_u64_u32_div(cur_residency, gtidle->residency_multiplier, 1e6);
+
+	return cur_residency;
+}
+
+static ssize_t name_show(struct device *dev,
+			 struct device_attribute *attr, char *buff)
+{
+	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
+
+	return sysfs_emit(buff, gtidle->name);
+}
+static DEVICE_ATTR_RO(name);
+
+static ssize_t idle_status_show(struct device *dev,
+				struct device_attribute *attr, char *buff)
+{
+	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
+	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
+	enum xe_gt_idle_state state;
+
+	state = gtidle->idle_status(pc);
+
+	return sysfs_emit(buff, "%s\n", gt_idle_state_to_string(state));
+}
+static DEVICE_ATTR_RO(idle_status);
+
+static ssize_t idle_residency_ms_show(struct device *dev,
+				      struct device_attribute *attr, char *buff)
+{
+	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
+	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
+	u64 residency;
+
+	residency = gtidle->idle_residency(pc);
+	return sysfs_emit(buff, "%llu\n", get_residency_ms(gtidle, residency));
+}
+static DEVICE_ATTR_RO(idle_residency_ms);
+
+static const struct attribute *gt_idle_attrs[] = {
+	&dev_attr_name.attr,
+	&dev_attr_idle_status.attr,
+	&dev_attr_idle_residency_ms.attr,
+	NULL,
+};
+
+static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg)
+{
+	struct kobject *kobj = arg;
+
+	sysfs_remove_files(kobj, gt_idle_attrs);
+	kobject_put(kobj);
+}
+
+int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
+{
+	struct xe_gt *gt = gtidle_to_gt(gtidle);
+	struct xe_device *xe = gt_to_xe(gt);
+	struct kobject *kobj;
+	int err;
+
+	kobj = kobject_create_and_add("gtidle", gt->sysfs);
+	if (!kobj)
+		return -ENOMEM;
+
+	sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
+	/* Multiplier for  RC6 Residency counter in units of 1.28us */
+	gtidle->residency_multiplier = 1280;
+	gtidle->idle_residency = xe_guc_pc_rc6_residency;
+	gtidle->idle_status = xe_guc_pc_rc_status;
+
+	err = sysfs_create_files(kobj, gt_idle_attrs);
+	if (err) {
+		kobject_put(kobj);
+		return err;
+	}
+
+	err = drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
+	if (err)
+		return err;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
new file mode 100644
index 000000000000..a654561fda19
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GT_IDLE_SYSFS_H_
+#define _XE_GT_IDLE_SYSFS_H_
+
+#include "xe_gt_idle_sysfs_types.h"
+
+int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
+
+#endif /* _XE_GT_IDLE_SYSFS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h b/drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h
new file mode 100644
index 000000000000..f99b447534f3
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GT_IDLE_SYSFS_TYPES_H_
+#define _XE_GT_IDLE_SYSFS_TYPES_H_
+
+#include <linux/types.h>
+
+struct xe_guc_pc;
+
+/* States of GT Idle */
+enum xe_gt_idle_state {
+	GT_IDLE_C0,
+	GT_IDLE_C6,
+	GT_IDLE_UNKNOWN,
+};
+
+/**
+ * struct xe_gt_idle - A struct that contains idle properties based of gt
+ */
+struct xe_gt_idle {
+	/** @name: name */
+	char name[16];
+	/** @residency_multiplier: residency multiplier in ns */
+	u32 residency_multiplier;
+	/** @cur_residency: raw driver copy of idle residency */
+	u64 cur_residency;
+	/** @prev_residency: previous residency counter */
+	u64 prev_residency;
+	/** @idle_status: get the current idle state */
+	enum xe_gt_idle_state (*idle_status)(struct xe_guc_pc *pc);
+	/** @idle_residency: get idle residency counter */
+	u64 (*idle_residency)(struct xe_guc_pc *pc);
+};
+
+#endif /* _XE_GT_IDLE_SYSFS_TYPES_H_ */
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 99ab7ec99ccd..7d4de019f9a5 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -7,6 +7,7 @@
 #define _XE_GT_TYPES_H_
 
 #include "xe_force_wake_types.h"
+#include "xe_gt_idle_sysfs_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_hw_fence_types.h"
 #include "xe_reg_sr_types.h"
@@ -260,6 +261,9 @@ struct xe_gt {
 	/** @uc: micro controllers on the GT */
 	struct xe_uc uc;
 
+	/** @gtidle: idle properties of GT */
+	struct xe_gt_idle gtidle;
+
 	/** @engine_ops: submission backend engine operations */
 	const struct xe_engine_ops *engine_ops;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 67faa9ee0006..72f49808918a 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -76,12 +76,7 @@
  *
  * Render-C states is also a GuC PC feature that is now enabled in Xe for
  * all platforms.
- * Xe's GuC PC provides a sysfs API for Render-C States:
  *
- * device/gt#/rc* *read-only* files:
- * - rc_status: Provide the actual immediate status of Render-C: (rc0 or rc6)
- * - rc6_residency: Provide the rc6_residency counter in units of 1.28 uSec.
- *                  Prone to overflows.
  */
 
 static struct xe_guc *
@@ -580,10 +575,12 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RW(freq_max);
 
-static ssize_t rc_status_show(struct device *dev,
-			      struct device_attribute *attr, char *buff)
+/**
+ * xe_guc_pc_rc_status - get the current Render C state
+ * @pc: XE_GuC_PC instance
+ */
+enum xe_gt_idle_state xe_guc_pc_rc_status(struct xe_guc_pc *pc)
 {
-	struct xe_guc_pc *pc = dev_to_pc(dev);
 	struct xe_gt *gt = pc_to_gt(pc);
 	u32 reg;
 
@@ -593,37 +590,30 @@ static ssize_t rc_status_show(struct device *dev,
 
 	switch (REG_FIELD_GET(RCN_MASK, reg)) {
 	case GT_RC6:
-		return sysfs_emit(buff, "rc6\n");
+		return GT_IDLE_C6;
 	case GT_RC0:
-		return sysfs_emit(buff, "rc0\n");
+		return GT_IDLE_C0;
 	default:
-		return -ENOENT;
+		return GT_IDLE_UNKNOWN;
 	}
 }
-static DEVICE_ATTR_RO(rc_status);
 
-static ssize_t rc6_residency_show(struct device *dev,
-				  struct device_attribute *attr, char *buff)
+/**
+ * xe_guc_pc_rc6_residency - rc6 residency counter
+ * @pc: Xe_GuC_PC instance
+ */
+u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc)
 {
-	struct xe_guc_pc *pc = dev_to_pc(dev);
 	struct xe_gt *gt = pc_to_gt(pc);
 	u32 reg;
-	ssize_t ret;
 
-	xe_device_mem_access_get(pc_to_xe(pc));
-	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	if (ret)
-		goto out;
+	xe_device_mem_access_get(gt_to_xe(gt));
 
 	reg = xe_mmio_read32(gt, GT_GFX_RC6);
-	ret = sysfs_emit(buff, "%u\n", reg);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
-out:
-	xe_device_mem_access_put(pc_to_xe(pc));
-	return ret;
+	xe_device_mem_access_put(gt_to_xe(gt));
+	return reg;
 }
-static DEVICE_ATTR_RO(rc6_residency);
 
 static const struct attribute *pc_attrs[] = {
 	&dev_attr_freq_act.attr,
@@ -633,8 +623,6 @@ static const struct attribute *pc_attrs[] = {
 	&dev_attr_freq_rpn.attr,
 	&dev_attr_freq_min.attr,
 	&dev_attr_freq_max.attr,
-	&dev_attr_rc_status.attr,
-	&dev_attr_rc6_residency.attr,
 	NULL
 };
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index da29e4934868..976179dbc9a8 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -12,4 +12,6 @@ int xe_guc_pc_init(struct xe_guc_pc *pc);
 int xe_guc_pc_start(struct xe_guc_pc *pc);
 int xe_guc_pc_stop(struct xe_guc_pc *pc);
 
+enum xe_gt_idle_state xe_guc_pc_rc_status(struct xe_guc_pc *pc);
+u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
 #endif /* _XE_GUC_PC_H_ */
-- 
2.40.0

