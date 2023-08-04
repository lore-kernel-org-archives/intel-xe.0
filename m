Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24527C001DB
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 12:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB2010E0B1;
	Fri,  4 Aug 2023 12:58:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24AE510E0B1
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 12:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691153880; x=1722689880;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tk6ZY30aNpLtzuWeTcb6YGX9F0EmBRfOCUfMCOjuZD4=;
 b=DdF0Z2/eUU7h3am5re4r8OGH3FJDQ1wXQVOmGZLk1ffu4U7osRtlGF8J
 OzcZS3CunL68wQDkE56qrCIujuVmP/1lIKW3v10bzcZjDsyG2TYjl03hD
 q8RdVPZ4a8tf9oShtr5b+YhbTyt7TtMwxUrAfJS5UZjcnVOpLPcZWSjpW
 gk10zcAMvOjVy13Y21v0KA5Lqgdjz8LEcOEv4m95yT38IzhGo1IYfFRna
 e2CPWeZV8U+uWBZwDK2zD4NZ8EHMICgcQaOwo2E9vyrdpzwaxz8hinwS5
 W8sahFxIxRbipSzvfQjh8ihxl/76IAzTdDrs8VI6lvf9J2pvzDYb3fj/e w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="456524202"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; d="scan'208";a="456524202"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 05:57:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="765098916"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; d="scan'208";a="765098916"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga001.jf.intel.com with ESMTP; 04 Aug 2023 05:57:58 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  4 Aug 2023 18:34:47 +0530
Message-Id: <20230804130452.1402344-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230804130452.1402344-1-tejas.upadhyay@intel.com>
References: <20230804130452.1402344-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V13 1/6] drm/xe: Add sysfs entries for engines
 under its GT
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

Add engines sysfs directory under its GT and
create sub directory for all engine class
(note its not per instance) present on GT.

For example,
DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/
bcs/ ccs/

V9 :
   - Add missing drmm_add_action_or_reset
V8 :
   - Rebase
V7 :
   - Remove xe_gt.h from .h and include in .c - Matt
V6 :
   - Add kernel doc and arrange file in make file by alphabet - Matt
V5 :
   - replace xe_engine with xe_hw_engine - Matt
V4 :
   - Rebase to resolve conflicts - CI
V3 :
   - Move code in its own file
   - Rename API name
V2 :
   - Correct class mask logic - Himal
   - Remove extra parenthesis

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_gt.c                    |   7 +
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 153 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |  13 ++
 4 files changed, 174 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e79624ab2cb3..1b59702cd9f9 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -74,6 +74,7 @@ xe-y += xe_bb.o \
 	xe_guc_pc.o \
 	xe_guc_submit.o \
 	xe_hw_engine.o \
+	xe_hw_engine_class_sysfs.o \
 	xe_hw_fence.o \
 	xe_huc.o \
 	xe_huc_debugfs.o \
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3077faa1e792..13320af4ddd3 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -28,6 +28,7 @@
 #include "xe_gt_topology.h"
 #include "xe_guc_exec_queue_types.h"
 #include "xe_hw_fence.h"
+#include "xe_hw_engine_class_sysfs.h"
 #include "xe_irq.h"
 #include "xe_lrc.h"
 #include "xe_map.h"
@@ -323,6 +324,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
+	err = xe_hw_engine_class_sysfs_init(gt);
+	if (err)
+		drm_warn(&gt_to_xe(gt)->drm,
+			 "failed to register engines sysfs directory, err: %d\n",
+			 err);
+
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	XE_WARN_ON(err);
 	xe_device_mem_access_put(gt_to_xe(gt));
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
new file mode 100644
index 000000000000..470a8c356abd
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include "xe_gt.h"
+#include "xe_hw_engine_class_sysfs.h"
+
+#define MAX_ENGINE_CLASS_NAME_LEN    16
+static void kobj_xe_hw_engine_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
+static const struct kobj_type kobj_xe_hw_engine_type = {
+	.release = kobj_xe_hw_engine_release,
+	.sysfs_ops = &kobj_sysfs_ops
+};
+
+static void kobj_xe_hw_engine_fini(struct drm_device *drm, void *arg)
+{
+	struct kobject *kobj = arg;
+
+	kobject_put(kobj);
+}
+
+	static struct kobject *
+kobj_xe_hw_engine(struct xe_device *xe, struct kobject *parent, char *name)
+{
+	struct kobject *kobj;
+	int err = 0;
+
+	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
+	if (!kobj)
+		return NULL;
+
+	kobject_init(kobj, &kobj_xe_hw_engine_type);
+	if (kobject_add(kobj, parent, "%s", name)) {
+		kobject_put(kobj);
+		return NULL;
+	}
+
+	err = drmm_add_action_or_reset(&xe->drm, kobj_xe_hw_engine_fini,
+				       kobj);
+	if (err)
+		drm_warn(&xe->drm,
+			 "%s: drmm_add_action_or_reset failed, err: %d\n",
+			 __func__, err);
+
+	return kobj;
+}
+
+static void xe_hw_engine_sysfs_kobj_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
+static const struct kobj_type xe_hw_engine_sysfs_kobj_type = {
+	.release = xe_hw_engine_sysfs_kobj_release,
+	.sysfs_ops = &kobj_sysfs_ops,
+};
+
+static void hw_engine_class_sysfs_fini(struct drm_device *drm, void *arg)
+{
+	struct kobject *kobj = arg;
+
+	kobject_put(kobj);
+}
+
+/**
+ * xe_hw_engine_class_sysfs_init - Init HW engine classes on GT.
+ * @gt: Xe GT.
+ *
+ * This routine creates sysfs for HW engine classes and adds methods
+ * to get/set different scheduling properties for HW engines class.
+ *
+ * Returns: Returns error value for failure and 0 for success.
+ */
+int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	struct kobject *kobj;
+	u16 class_mask = 0;
+	int err = 0;
+
+	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
+	if (!kobj)
+		return -ENOMEM;
+
+	kobject_init(kobj, &xe_hw_engine_sysfs_kobj_type);
+
+	err = kobject_add(kobj, gt->sysfs, "engines");
+	if (err) {
+		kobject_put(kobj);
+		return err;
+	}
+
+	for_each_hw_engine(hwe, gt, id) {
+		char name[MAX_ENGINE_CLASS_NAME_LEN];
+		struct kobject *khwe;
+
+		if (hwe->class == XE_ENGINE_CLASS_OTHER ||
+		    hwe->class == XE_ENGINE_CLASS_MAX)
+			continue;
+
+		if ((class_mask >> hwe->class) & 1)
+			continue;
+
+		class_mask |= 1 << hwe->class;
+
+		switch (hwe->class) {
+		case XE_ENGINE_CLASS_RENDER:
+			strcpy(name, "rcs");
+			break;
+		case XE_ENGINE_CLASS_VIDEO_DECODE:
+			strcpy(name, "vcs");
+			break;
+		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
+			strcpy(name, "vecs");
+			break;
+		case XE_ENGINE_CLASS_COPY:
+			strcpy(name, "bcs");
+			break;
+		case XE_ENGINE_CLASS_COMPUTE:
+			strcpy(name, "ccs");
+			break;
+		default:
+			kobject_put(kobj);
+			return -EINVAL;
+		}
+
+		khwe = kobj_xe_hw_engine(xe, kobj, name);
+		if (!khwe) {
+			kobject_put(kobj);
+			return -EINVAL;
+		}
+	}
+
+	err = drmm_add_action_or_reset(&xe->drm, hw_engine_class_sysfs_fini,
+				       kobj);
+	if (err)
+		drm_warn(&xe->drm,
+			 "%s: drmm_add_action_or_reset failed, err: %d\n",
+			 __func__, err);
+
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
new file mode 100644
index 000000000000..b3916c3cf5b3
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_ENGINE_CLASS_SYSFS_H_
+#define _XE_ENGINE_CLASS_SYSFS_H__
+
+struct xe_gt;
+
+int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
+
+#endif
-- 
2.25.1

