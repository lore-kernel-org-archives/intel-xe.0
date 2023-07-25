Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45485C04A6A
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 11:43:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F63610E109;
	Tue, 25 Jul 2023 11:43:28 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6120B10E0DE
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 11:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690285404; x=1721821404;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E6vJWI1yrpReuHqiuxUNCB7PqwcjdAb0CuY8oDhEOXk=;
 b=D/kp2yJmquu+xEshM51njchmwWfy3dhEASBpEQ3DPRMIUwEVVWUQCWlk
 nj+DTOkYBX3kXvKvUvfoSPiEFdlvubNoJw/Yw8njfbgtkCn39GtSmSCrU
 RsUBtSwKUGiARuZrf5KvgH1z7VaZi4TI+mUE0gZwoPDhu285IU3xQixkN
 xn5HgQ0MvyJIdWsWghZjX+WjivTBkmEvis+16PwbSdyiTWwucmug5G7v7
 CL3pp15SDkGuYnG9He/4+aNZoaQXwu9hpH+79oyltIFHyHb0yiz3OLmWC
 3G+j8jEIj9vveh0LznNSCY1FyaanYHoM2MPzGUFOSs2M6GFnkA/CXpz1i Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="431498438"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="431498438"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 04:43:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="972636496"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="972636496"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2023 04:43:22 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jul 2023 17:19:58 +0530
Message-Id: <20230725115003.785982-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230725115003.785982-1-tejas.upadhyay@intel.com>
References: <20230725115003.785982-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V7 1/6] drm/xe: Add sysfs entries for engines
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
 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 111 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_engine_class_sysfs.h |  13 +++
 drivers/gpu/drm/xe/xe_gt.c                 |   7 ++
 4 files changed, 132 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_engine_class_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_engine_class_sysfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 4ea9e3150c20..7ced39ee52f8 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -52,6 +52,7 @@ xe-y += xe_bb.o \
 	xe_device_sysfs.o \
 	xe_dma_buf.o \
 	xe_engine.o \
+	xe_engine_class_sysfs.o \
 	xe_exec.o \
 	xe_execlist.o \
 	xe_force_wake.o \
diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
new file mode 100644
index 000000000000..9959b0362d71
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
+
+#include "xe_engine_class_sysfs.h"
+
+static void kobj_xe_engine_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
+static const struct kobj_type kobj_xe_engine_type = {
+	.release = kobj_xe_engine_release,
+	.sysfs_ops = &kobj_sysfs_ops
+};
+
+static struct kobject *
+kobj_xe_engine(struct kobject *parent, char *name)
+{
+	struct kobject *kobj;
+
+	kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
+	if (!kobj)
+		return NULL;
+
+	kobject_init(kobj, &kobj_xe_engine_type);
+	if (kobject_add(kobj, parent, "%s", name)) {
+		kobject_put(kobj);
+		return NULL;
+	}
+
+	return kobj;
+}
+
+static void xe_engine_sysfs_kobj_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
+static const struct kobj_type xe_engine_sysfs_kobj_type = {
+	.release = xe_engine_sysfs_kobj_release,
+	.sysfs_ops = &kobj_sysfs_ops,
+};
+
+int xe_engine_class_sysfs_init(struct xe_gt *gt)
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
+	kobject_init(kobj, &xe_engine_sysfs_kobj_type);
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
+		khwe = kobj_xe_engine(kobj, name);
+		if (!khwe) {
+			kobject_put(kobj);
+			return -EINVAL;
+		}
+	}
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
new file mode 100644
index 000000000000..f195dacc1ec6
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
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
+#define MAX_ENGINE_CLASS_NAME_LEN    16
+int xe_engine_class_sysfs_init(struct xe_gt *gt);
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3e32d38aeeea..a8176de9f536 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -14,6 +14,7 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_engine.h"
+#include "xe_engine_class_sysfs.h"
 #include "xe_execlist.h"
 #include "xe_force_wake.h"
 #include "xe_ggtt.h"
@@ -322,6 +323,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
+	err = xe_engine_class_sysfs_init(gt);
+	if (err)
+		drm_warn(&gt_to_xe(gt)->drm,
+			 "failed to register engines sysfs directory, err: %d\n",
+			 err);
+
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	XE_WARN_ON(err);
 	xe_device_mem_access_put(gt_to_xe(gt));
-- 
2.25.1

