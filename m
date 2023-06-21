Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AEEEB64D8
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jun 2023 14:42:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B0410E49D;
	Wed, 21 Jun 2023 14:42:27 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B119810E499
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jun 2023 14:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687358542; x=1718894542;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=55piavX6LiaQReCheoCHsMf8R8cMYJ3IpAyQryp5xp4=;
 b=dwpV3NpyPraSS3ijMfI6ZcuNiDlizzvpHG+OtlyD4sCM6yWHMJNAabLt
 kYxP9tphblFkYfAjOggGtZWYr81zmhYMYTQadyBp7VxMpObkWVVRIGcst
 IQbLXgY29HV4TmknCXFpu47jpVGXJfbOHyd8BFhO37t5hCfjlTD1IGKCW
 RfKNmdsRiBOxTX4sA+U0h/Q6gSQhS6ok1cGcxtzxBysCZIBm5W4gWNVIF
 ReAtYxcNApoB6hvegM5TmcOdcm295/zv0S+s5O74mgFVN9QX75+iR7N+b
 XkJFA5BAVc6Z4UdvujADd9bjt16Mai3UI9mqQ95v/VXoKPe7Wb+qxOv8r Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="349924051"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; d="scan'208";a="349924051"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 07:42:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="714511441"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; d="scan'208";a="714511441"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 07:42:21 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 21 Jun 2023 20:15:30 +0530
Message-Id: <20230621144531.4189853-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230621144531.4189853-1-riana.tauro@intel.com>
References: <20230621144531.4189853-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/2] drm/xe: add a new sysfs directory for
 gtidle properties
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

1) Add a new sysfs directory under devices/gt#/ called gtidle
   to contain idle properties of GT such as name, idle_status,
   idle_residency_ms

2) Remove forcewake calls for residency counter

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

v5:
    - update commit message to include removal of
      forcewake calls (Anshuman)
    - return void from sysfs initialization function and add warnings
      (Andi)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile                 |   1 +
 drivers/gpu/drm/xe/xe_gt.c                  |   3 +
 drivers/gpu/drm/xe/xe_gt_idle_sysfs.c       | 162 ++++++++++++++++++++
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
index 081c57fd8632..4b82cb2773ad 100644
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
index 2458397ce8af..bc76678a8276 100644
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
@@ -306,6 +307,8 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
+	xe_gt_idle_sysfs_init(&gt->gtidle);
+
 	/* XXX: Fake that we pull the engine mask from hwconfig blob */
 	gt->info.engine_mask = gt->info.__engine_mask;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
new file mode 100644
index 000000000000..ec77349dea76
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
@@ -0,0 +1,162 @@
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
+void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
+{
+	struct xe_gt *gt = gtidle_to_gt(gtidle);
+	struct xe_device *xe = gt_to_xe(gt);
+	struct kobject *kobj;
+	int err;
+
+	kobj = kobject_create_and_add("gtidle", gt->sysfs);
+	if (!kobj) {
+		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
+		return;
+	}
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
+		drm_warn(&xe->drm, "failed to register gtidle sysfs, err: %d\n", err);
+		return;
+	}
+
+	err = drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
+	if (err)
+		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
+			 __func__, err);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
new file mode 100644
index 000000000000..b0973f96c7ab
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
+void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
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
index 5d5cf4b0d508..f2de2a75cfbf 100644
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
@@ -572,10 +567,12 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
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
 
@@ -585,37 +582,30 @@ static ssize_t rc_status_show(struct device *dev,
 
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
@@ -625,8 +615,6 @@ static const struct attribute *pc_attrs[] = {
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

