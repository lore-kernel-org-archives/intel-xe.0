Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F30CC001E0
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 19:10:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC4010E045;
	Mon, 31 Jul 2023 19:10:58 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F6210E045
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Jul 2023 19:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690830656; x=1722366656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qf1IPNg3Dp3x5aN03ts/iDXzQRLL5boV/30LnDSBw2o=;
 b=M8RLLx9hVPzxogwLPN7JmdmrD1K/AoZq5z2X6R+y3oFSPZuQO3FwZ9Vq
 Z0zYEaCBtsyyxlrlimv330kYGwY8jmh8id9ud8ONpEKTzISsEOrgMQcJq
 9UoMdg61HgUWGxIhqbVdqxNkUt548IhdZ+iZPaIQq/+gWtC3HyA4C5aSw
 HqcqECAFMUoY/sqaTYJuA2yuKYoMhyURLFDwOkpE8ZM/nAsQPgfNOwNxz
 oUEIz5pwsP1OIFfSb6TfgLWchEhfCqjamy4F9eMYrUvO2IIOUsdp6tedp
 cdg+NMXV9IYvWz/EDiTQdwL/sCTH5ydZaRygqd/xntL1efEVUSrRSULi3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="371815473"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; d="scan'208";a="371815473"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 12:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="728403018"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; d="scan'208";a="728403018"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga002.jf.intel.com with ESMTP; 31 Jul 2023 12:10:53 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  1 Aug 2023 00:47:37 +0530
Message-Id: <20230731191742.1130309-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230731191742.1130309-1-tejas.upadhyay@intel.com>
References: <20230731191742.1130309-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V11 1/6] drm/xe: Add sysfs entries for engines
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

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_gt.c                    |   7 +
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 122 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |  13 ++
 4 files changed, 143 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 4ea9e3150c20..2ddae8e312b2 100644
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
index 28bf577c7bf2..5436ce651076 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -28,6 +28,7 @@
 #include "xe_gt_topology.h"
 #include "xe_guc_engine_types.h"
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
index 000000000000..7dc97fb13095
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -0,0 +1,122 @@
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
+static struct kobject *
+kobj_xe_hw_engine(struct kobject *parent, char *name)
+{
+	struct kobject *kobj;
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
+		khwe = kobj_xe_hw_engine(kobj, name);
+		if (!khwe) {
+			kobject_put(kobj);
+			return -EINVAL;
+		}
+	}
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

