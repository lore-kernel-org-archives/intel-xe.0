Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72658C001DF
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 13:06:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6F510E2A5;
	Mon, 31 Jul 2023 13:06:52 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAEB10E2A2
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Jul 2023 13:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690808810; x=1722344810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FwEYjdymX0WEFHJCiTv6KNZWgXwcH2x4VcUY1e08aow=;
 b=huDloqM1wfvt0QuZyKvWGWaPNQ/SxTqoCzGisWojJZa0L1SzqVHzXnu3
 96pwziA30YP1zppWpv9XyY/nn6eFQYet2exuF9FglpIXiMr+8DPsvIq26
 123/n5w4043ZaCz8xWpaKTuvWuLvrQ82C0sblKGM+c4E8n+Ue6Ub0EHtQ
 1b+D3S2kTGV3iVG0JA1CDECxw4ZD0RG+LFjNIwpR9VHF1ksFFfbCKGgEe
 dmO0BLlpTTNvUR/Z3gpUKnj+rwaNAJdbv95jGGUTQWxW+AFL50NvmhQD0
 aEgq1c11cd5C4ukDootUdQ8dW3LeH2MgQz0g4YL9E8seyzc+MuYaA+nsB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="399960921"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="399960921"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 06:06:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763379415"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; d="scan'208";a="763379415"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga001.jf.intel.com with ESMTP; 31 Jul 2023 06:06:48 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 31 Jul 2023 18:43:32 +0530
Message-Id: <20230731131337.1100068-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230731131337.1100068-1-tejas.upadhyay@intel.com>
References: <20230731131337.1100068-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V10 1/6] drm/xe: Add sysfs entries for engines
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
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 121 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.h |  13 ++
 4 files changed, 142 insertions(+)
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
index 000000000000..ad57faf69f9a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
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
index 000000000000..b96125443db9
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
+#include "xe_gt.h"
+
+int xe_hw_engine_class_sysfs_init(struct xe_gt *gt);
+
+#endif
-- 
2.25.1

