Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D734C04A6A
	for <intel-xe@archiver.kernel.org>; Wed,  2 Aug 2023 13:46:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3882C10E1A2;
	Wed,  2 Aug 2023 13:46:30 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161D410E191
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Aug 2023 13:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690983988; x=1722519988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VekgyP4us0v9VpP8KbfAYc08bNAOGwB1YTNrCqOk420=;
 b=lzdVIiPixwxfjIwtGpp13yuZzDfKT4jWP13PQUnttOZVv0dv4ru9w3gM
 maH1jVNiI3J+sm689nQSyIct1wvgHCpx8/5t9O9eVawab4u0mXgbxvTwM
 UQBLQ0GCWmA93Xq/HCOrsnVMJT/YYdXIKzo1VO0vt4ODbSsJiqjeqybIb
 +UXKmBq0K6cRz1G4RQHEVrN6miDWaMqga7hHoEr3uPeEfDXIqa12SopUm
 rtAqwLDS3r4V+WqYrfiAH/V9Px7vAPzFTAMPA2HD2FRL/hgZonD54u3YK
 pZ5GDWQFvs/PUP6FRaQvhuAWGmH9jTR+DeEuM3ILihZGeXC/gCE1x4xk9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="400534927"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="400534927"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 06:46:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="852873906"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="852873906"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 06:46:24 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	linux-hwmon@vger.kernel.org
Date: Wed,  2 Aug 2023 19:22:36 +0530
Message-Id: <20230802135241.458855-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230802135241.458855-1-badal.nilawar@intel.com>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/6] drm/xe/hwmon: Add HWMON infrastructure
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
Cc: linux@roeck-us.net
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The xe HWMON module will be used to expose voltage, power and energy
values for dGfx. Here we set up xe hwmon infrastructure including xe
hwmon registration, basic data structures and functions.

v2:
  - Fix review comments (Riana)
v3:
  - %s/hwm_/hwmon/ (Matt Brost)
  - Use drmm_mutex_init (Matt Brost)
  - Print error value (Matt Brost)
  - %s/hwmon_drvdata/xe_hwmon_data/
  - Move rpm (xe_device_mem_access_get/put) calls
    to this patch (Matt Brost)

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |   3 +
 drivers/gpu/drm/xe/xe_device.c       |   5 +
 drivers/gpu/drm/xe/xe_device_types.h |   2 +
 drivers/gpu/drm/xe/xe_hwmon.c        | 150 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.h        |  22 ++++
 5 files changed, 182 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.c
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 4ea9e3150c20..831be23e000b 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -116,6 +116,9 @@ xe-y += xe_bb.o \
 	xe_wa.o \
 	xe_wopcm.o
 
+# graphics hardware monitoring (HWMON) support
+xe-$(CONFIG_HWMON) += xe_hwmon.o
+
 # i915 Display compat #defines and #includes
 subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
 	-I$(srctree)/$(src)/display/ext \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5409cf7895d3..01bd08812514 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -34,6 +34,7 @@
 #include "xe_vm.h"
 #include "xe_vm_madvise.h"
 #include "xe_wait_user_fence.h"
+#include "xe_hwmon.h"
 
 #ifdef CONFIG_LOCKDEP
 struct lockdep_map xe_device_mem_access_lockdep_map = {
@@ -335,6 +336,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_debugfs_register(xe);
 
+	xe_hwmon_register(xe);
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
 	if (err)
 		return err;
@@ -361,6 +364,8 @@ static void xe_device_remove_display(struct xe_device *xe)
 
 void xe_device_remove(struct xe_device *xe)
 {
+	xe_hwmon_unregister(xe);
+
 	xe_device_remove_display(xe);
 
 	xe_display_unlink(xe);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index b156f69d7320..dd06eba815ec 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -376,6 +376,8 @@ struct xe_device {
 	 */
 	struct task_struct *pm_callback_task;
 
+	struct xe_hwmon *hwmon;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
new file mode 100644
index 000000000000..5e35128a61a8
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/hwmon.h>
+
+#include <drm/drm_managed.h>
+#include "regs/xe_gt_regs.h"
+#include "xe_device.h"
+#include "xe_hwmon.h"
+
+struct xe_hwmon_data {
+	struct device *hwmon_dev;
+	struct xe_gt *gt;
+	char name[12];
+};
+
+struct xe_hwmon {
+	struct xe_hwmon_data ddat;
+	struct mutex hwmon_lock;
+};
+
+static const struct hwmon_channel_info *hwmon_info[] = {
+	NULL
+};
+
+static umode_t
+hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+		 u32 attr, int channel)
+{
+	struct xe_hwmon_data *ddat = (struct xe_hwmon_data *)drvdata;
+	int ret;
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
+	switch (type) {
+	default:
+		ret = 0;
+		break;
+	}
+
+	xe_device_mem_access_put(gt_to_xe(ddat->gt));
+
+	return ret;
+}
+
+static int
+hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+	   int channel, long *val)
+{
+	struct xe_hwmon_data *ddat = dev_get_drvdata(dev);
+	int ret;
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
+	switch (type) {
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	xe_device_mem_access_put(gt_to_xe(ddat->gt));
+
+	return ret;
+}
+
+static int
+hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+	    int channel, long val)
+{
+	struct xe_hwmon_data *ddat = dev_get_drvdata(dev);
+	int ret;
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
+	switch (type) {
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	xe_device_mem_access_put(gt_to_xe(ddat->gt));
+
+	return ret;
+}
+
+static const struct hwmon_ops hwmon_ops = {
+	.is_visible = hwmon_is_visible,
+	.read = hwmon_read,
+	.write = hwmon_write,
+};
+
+static const struct hwmon_chip_info hwmon_chip_info = {
+	.ops = &hwmon_ops,
+	.info = hwmon_info,
+};
+
+static void
+hwmon_get_preregistration_info(struct xe_device *xe)
+{
+}
+
+void xe_hwmon_register(struct xe_device *xe)
+{
+	struct device *dev = xe->drm.dev;
+	struct xe_hwmon *hwmon;
+	struct device *hwmon_dev;
+	struct xe_hwmon_data *ddat;
+
+	/* hwmon is available only for dGfx */
+	if (!IS_DGFX(xe))
+		return;
+
+	hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
+	if (!hwmon)
+		return;
+
+	xe->hwmon = hwmon;
+	drmm_mutex_init(&xe->drm, &hwmon->hwmon_lock);
+
+	ddat = &hwmon->ddat;
+
+	/* primary GT to access device level properties */
+	ddat->gt = xe->tiles[0].primary_gt;
+
+	snprintf(ddat->name, sizeof(ddat->name), "xe");
+
+	hwmon_get_preregistration_info(xe);
+
+	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
+
+	/*  hwmon_dev points to device hwmon<i> */
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
+							 ddat,
+							 &hwmon_chip_info,
+							 NULL);
+	if (IS_ERR(hwmon_dev)) {
+		drm_warn(&xe->drm, "Fail to register xe hwmon, Err:%ld\n", PTR_ERR(hwmon_dev));
+		xe->hwmon = NULL;
+		return;
+	}
+
+	ddat->hwmon_dev = hwmon_dev;
+}
+
+void xe_hwmon_unregister(struct xe_device *xe)
+{
+	xe->hwmon = NULL;
+}
diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
new file mode 100644
index 000000000000..a078eeb0a68b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hwmon.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __XE_HWMON_H__
+#define __XE_HWMON_H__
+
+#include <linux/types.h>
+
+struct xe_device;
+
+#if IS_REACHABLE(CONFIG_HWMON)
+void xe_hwmon_register(struct xe_device *xe);
+void xe_hwmon_unregister(struct xe_device *xe);
+#else
+static inline void xe_hwmon_register(struct xe_device *xe) { };
+static inline void xe_hwmon_unregister(struct xe_device *xe) { };
+#endif
+
+#endif /* __XE_HWMON_H__ */
-- 
2.25.1

