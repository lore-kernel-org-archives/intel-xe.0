Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3ACDC7EE23
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 04:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE6E10E246;
	Thu,  4 May 2023 04:54:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045DF10E1E7
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 04:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683176085; x=1714712085;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PUJ+v0r/DEcHEvOtQAaPDegiWcab2FwbTwsC7eDZfkA=;
 b=iw2mR5fJxU54RBFuNfH0HdwPDIjEyWyMLtDBOHlY1aCz1a301uHBQoNR
 nKyl7CUeBbHhu2FHXEWbSVC74M7wGrx5Lb+KWhmPeXrOm9WzcmFBXdSiW
 Dze37WneNG+rjxfz0E6BMVXewf96D9adb6aaGY14oflQkllTd11+lTgdb
 8pIJTEzk0+0YEcZJDoeVLp9ZOg5/waChn89apohi1ZdE/oXVlzyydFTnd
 WKCmYh/2xL3NviKlP461W3U3eKll/u/gJb53xj6kdrFJWvN29Rt/vfwlJ
 Hmmeysx/OpP29fL2ySL/SPCanwxuRlSTDd6yeAsq2J0xerkGd24lanjP0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="346304848"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="346304848"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 21:54:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="943178200"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="943178200"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 21:54:43 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  4 May 2023 10:26:57 +0530
Message-Id: <20230504045659.964449-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230504045659.964449-1-riana.tauro@intel.com>
References: <20230504045659.964449-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH v2 1/3] drm/xe: add a new sysfs directory for
 gpu idle properties
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

Add a new sysfs directory under devices/gt#/ called gpu_idle
to contain idle properties of GT such as rc_status, rc6_residency.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/Makefile        |   1 +
 drivers/gpu/drm/xe/xe_gt.c         |   5 +
 drivers/gpu/drm/xe/xe_gt_types.h   |   4 +
 drivers/gpu/drm/xe/xe_idle.c       | 151 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_idle.h       |  13 +++
 drivers/gpu/drm/xe/xe_idle_types.h |  32 ++++++
 6 files changed, 206 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_idle.c
 create mode 100644 drivers/gpu/drm/xe/xe_idle.h
 create mode 100644 drivers/gpu/drm/xe/xe_idle_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 84ad0e949044..abb94bb75330 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -61,6 +61,7 @@ xe-y += xe_bb.o \
 	xe_hw_fence.o \
 	xe_huc.o \
 	xe_huc_debugfs.o \
+	xe_idle.o \
 	xe_irq.o \
 	xe_lrc.o \
 	xe_migrate.o \
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 0d4664e344da..b47aafd74715 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -25,6 +25,7 @@
 #include "xe_gt_topology.h"
 #include "xe_guc_engine_types.h"
 #include "xe_hw_fence.h"
+#include "xe_idle.h"
 #include "xe_irq.h"
 #include "xe_lrc.h"
 #include "xe_map.h"
@@ -381,6 +382,10 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
+	err = xe_idle_init(&gt->idle);
+	if (err)
+		goto err_force_wake;
+
 	/* XXX: Fake that we pull the engine mask from hwconfig blob */
 	gt->info.engine_mask = gt->info.__engine_mask;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 7c47d67aa8be..1f2a55026c0c 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -9,6 +9,7 @@
 #include "xe_force_wake_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_hw_fence_types.h"
+#include "xe_idle_types.h"
 #include "xe_reg_sr_types.h"
 #include "xe_sa_types.h"
 #include "xe_uc_types.h"
@@ -287,6 +288,9 @@ struct xe_gt {
 	/** @uc: micro controllers on the GT */
 	struct xe_uc uc;
 
+	/** @idle: render c state properties of GT */
+	struct xe_idle idle;
+
 	/** @engine_ops: submission backend engine operations */
 	const struct xe_engine_ops *engine_ops;
 
diff --git a/drivers/gpu/drm/xe/xe_idle.c b/drivers/gpu/drm/xe/xe_idle.c
new file mode 100644
index 000000000000..149744abad45
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_idle.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+#include "regs/xe_gt_regs.h"
+
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_idle.h"
+#include "xe_mmio.h"
+
+/*
+ * Render-C States:
+ * ================
+ *
+ * Render-C states is also a GuC PC feature that is now enabled in Xe for
+ * all platforms.
+ *
+ * RC6 : RC6 is a special power stage which allows the GPU to enter a very
+ * low-voltage mode when idle. This stage is entered automatically when the GPU is idle
+ * when RC6 support is enabled, and as soon as new workload arises
+ * GPU wakes up automatically as well.
+ *
+ * Xe provides a sysfs API for Render-C States:
+ *
+ * device/gt#/gpu_idle/rc* *read-only* files:
+ * - rc_status: Provide the actual immediate status of Render-C: (rc0 or rc6)
+ * - rc6_residency: Provide the rc6_residency in units of 1.28 uSec
+ *		    Prone to overflows.
+ */
+
+static struct xe_gt *idle_to_gt(struct xe_idle *idle)
+{
+	return container_of(idle, struct xe_gt, idle);
+}
+
+static struct xe_idle *kobj_to_idle(struct kobject *kobj)
+{
+	return container_of(kobj, struct kobj_idle, base)->idle;
+}
+
+static void xe_idle_kobj_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
+static struct kobj_type xe_idle_kobj_type = {
+	.release = xe_idle_kobj_release,
+	.sysfs_ops = &kobj_sysfs_ops,
+};
+
+static ssize_t
+rc_status_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	struct xe_idle *idle = kobj_to_idle(kobj);
+	struct xe_gt *gt = idle_to_gt(idle);
+	u32 reg;
+
+	xe_device_mem_access_get(gt_to_xe(gt));
+	reg = xe_mmio_read32(gt, GT_CORE_STATUS.reg);
+	xe_device_mem_access_put(gt_to_xe(gt));
+
+	switch (REG_FIELD_GET(RCN_MASK, reg)) {
+	case GT_RC6:
+		return sysfs_emit(buf, "rc6\n");
+	case GT_RC0:
+		return sysfs_emit(buf, "rc0\n");
+	default:
+		return -ENOENT;
+	}
+}
+
+static const struct kobj_attribute rc_status =
+__ATTR(rc_status, 0444, rc_status_show, NULL);
+
+static ssize_t
+rc6_residency_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	struct xe_idle *idle = kobj_to_idle(kobj);
+	struct xe_gt *gt = idle_to_gt(idle);
+	u32 reg;
+	ssize_t ret;
+
+	xe_device_mem_access_get(gt_to_xe(gt));
+	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (ret)
+		goto out;
+
+	reg = xe_mmio_read32(gt, GT_GFX_RC6.reg);
+	ret = sysfs_emit(buf, "%u\n", reg);
+
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+out:
+	xe_device_mem_access_put(gt_to_xe(gt));
+	return ret;
+}
+
+static const struct kobj_attribute rc6_residency =
+__ATTR(rc6_residency, 0444, rc6_residency_show, NULL);
+
+static const struct attribute *idle_attrs[] = {
+	&rc_status.attr,
+	&rc6_residency.attr,
+	NULL,
+};
+
+static void idle_fini(struct drm_device *drm, void *arg)
+{
+	struct kobj_idle *kobj_idle = arg;
+
+	sysfs_remove_files(&kobj_idle->base, idle_attrs);
+	kobject_put(&kobj_idle->base);
+}
+
+int xe_idle_init(struct xe_idle *idle)
+{
+	struct xe_gt *gt = idle_to_gt(idle);
+	struct xe_device *xe = gt_to_xe(gt);
+	struct kobj_idle *kobj_idle;
+	int err;
+
+	kobj_idle = kzalloc(sizeof(*kobj_idle), GFP_KERNEL);
+
+	if (!kobj_idle)
+		return -ENOMEM;
+
+	err = kobject_init_and_add(&kobj_idle->base, &xe_idle_kobj_type, gt->sysfs, "gpu_idle");
+	if (err)
+		goto exit_kobj;
+
+	kobj_idle->idle = idle;
+
+	err = sysfs_create_files(&kobj_idle->base, idle_attrs);
+	if (err)
+		goto exit_kobj;
+
+	err = drmm_add_action_or_reset(&xe->drm, idle_fini, kobj_idle);
+	if (err)
+		goto exit;
+
+	return 0;
+
+exit:
+	sysfs_remove_files(&kobj_idle->base, idle_attrs);
+
+exit_kobj:
+	kobject_put(&kobj_idle->base);
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_idle.h b/drivers/gpu/drm/xe/xe_idle.h
new file mode 100644
index 000000000000..77928a31cecd
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_idle.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_IDLE_H_
+#define _XE_IDLE_H_
+
+#include "xe_idle_types.h"
+
+int xe_idle_init(struct xe_idle *idle);
+
+#endif /* _XE_IDLE_H_ */
diff --git a/drivers/gpu/drm/xe/xe_idle_types.h b/drivers/gpu/drm/xe/xe_idle_types.h
new file mode 100644
index 000000000000..94377610c56c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_idle_types.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_IDLE_TYPES_H_
+#define _XE_IDLE_TYPES_H_
+
+#include <linux/kobject.h>
+#include <linux/types.h>
+
+/**
+ * struct xe_idle - A struct that contains gpu idle properties
+ */
+struct xe_idle {
+	/** @prev_rc6_residency: previous rc6 residency counter */
+	u64 prev_rc6_residency;
+	/** @cur_rc6_residency: raw driver copy of rc6 residency */
+	u64 cur_rc6_residency;
+};
+
+/**
+ * struct kobj_idle - A kobject struct that connects the kobject and xe_idle
+ */
+struct kobj_idle {
+	/** @base: The actual kobject */
+	struct kobject base;
+	/** @idle: A pointer to the struct xe_idle itself */
+	struct xe_idle *idle;
+};
+#endif /* _XE_IDLE_TYPES_H_ */
+
-- 
2.40.0

