Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE174C7EE29
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 12:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B6D10E33E;
	Tue,  6 Jun 2023 12:45:50 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA64710E33E
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 12:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686055549; x=1717591549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QXd9wRd8j+WHn2WlnRG/ish7c0MMrdhAihBLMHP+pXQ=;
 b=TZa4w+ns+zt7BeCn9+s6Z43PF2dZnpYVZ2uoq5zSh4Gfkip3yCxWGjOD
 VwZtEo55hQrpBdlttk2rZnwo6Pmf5DaIUrs5XQeVlMpeRTyhQer0flZeL
 fGNZ+G4clHzfmlb43dJOuz/78M2I3lco3cy47MbGCKlYhqmh3T+oxaDPH
 lppS1Ce2CvNnWlaZnYhi3m1IsnlYjDjqavZDV/D3nVmRjjOZxHUMqJWyM
 D5NrNsQtkW97LpNd7J5TSEk+Sk4m5frDg2AQj2YWRM0Vv7UTuDljtNepg
 rOYXPXS6HC+Klbwqx5AfINzy3OjVHBUcN/7OwRCGXvxPkTvpxYZVkzKJk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="341297872"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="341297872"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 05:45:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="709063425"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="709063425"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 05:45:46 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  6 Jun 2023 18:20:52 +0530
Message-Id: <20230606125057.838618-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230606125057.838618-1-badal.nilawar@intel.com>
References: <20230606125057.838618-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 1/6] drm/xe/hwmon: Add HWMON infrastructure
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The xe HWMON module will be used to expose voltage, power and energy
values for dGfx. Here we set up xe hwmon infrastructure including xe
hwmon registration, basic data structures and functions.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |   3 +
 drivers/gpu/drm/xe/xe_device.c       |   5 ++
 drivers/gpu/drm/xe/xe_device_types.h |   2 +
 drivers/gpu/drm/xe/xe_hwmon.c        | 119 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.h        |  22 +++++
 5 files changed, 151 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.c
 create mode 100644 drivers/gpu/drm/xe/xe_hwmon.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index f34d4bdd510b..7ac4469b325b 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -112,6 +112,9 @@ xe-y += xe_bb.o \
 	xe_wa.o \
 	xe_wopcm.o
 
+# graphics hardware monitoring (HWMON) support
+xe-$(CONFIG_HWMON) += xe_hwmon.o
+
 # i915 Display compat #defines and #includes
 subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
 	-I$(srctree)/$(src)/display/ext \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c7985af85a53..0fcd60037d66 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -34,6 +34,7 @@
 #include "xe_vm.h"
 #include "xe_vm_madvise.h"
 #include "xe_wait_user_fence.h"
+#include "xe_hwmon.h"
 
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
 {
@@ -328,6 +329,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_debugfs_register(xe);
 
+	xe_hwmon_register(xe);
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
 	if (err)
 		return err;
@@ -354,6 +357,8 @@ static void xe_device_remove_display(struct xe_device *xe)
 
 void xe_device_remove(struct xe_device *xe)
 {
+	xe_hwmon_unregister(xe);
+
 	xe_device_remove_display(xe);
 
 	xe_display_unlink(xe);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 17b6b1cc5adb..6f511d359de8 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -378,6 +378,8 @@ struct xe_device {
 	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
 	bool d3cold_allowed;
 
+	struct xe_hwmon *hwmon;
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
new file mode 100644
index 000000000000..65e5488dec82
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/types.h>
+
+#include "regs/xe_gt_regs.h"
+#include "xe_device.h"
+#include "xe_hwmon.h"
+#include "xe_mmio.h"
+#include "xe_gt.h"
+
+struct hwm_drvdata {
+	struct xe_hwmon *hwmon;
+	struct device *hwmon_dev;
+	char name[12];
+};
+
+struct xe_hwmon {
+	struct hwm_drvdata ddat;
+	struct mutex hwmon_lock;	/* counter overflow logic and rmw */
+};
+
+static const struct hwmon_channel_info *hwm_info[] = {
+	NULL
+};
+
+static umode_t
+hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+	       u32 attr, int channel)
+{
+	switch (type) {
+	default:
+		return 0;
+	}
+}
+
+static int
+hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+	 int channel, long *val)
+{
+	switch (type) {
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int
+hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
+	  int channel, long val)
+{
+	switch (type) {
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_ops hwm_ops = {
+	.is_visible = hwm_is_visible,
+	.read = hwm_read,
+	.write = hwm_write,
+};
+
+static const struct hwmon_chip_info hwm_chip_info = {
+	.ops = &hwm_ops,
+	.info = hwm_info,
+};
+
+static void
+hwm_get_preregistration_info(struct xe_device *xe)
+{
+}
+
+void xe_hwmon_register(struct xe_device *xe)
+{
+	struct device *dev = xe->drm.dev;
+	struct xe_hwmon *hwmon;
+	struct device *hwmon_dev;
+	struct hwm_drvdata *ddat;
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
+	mutex_init(&hwmon->hwmon_lock);
+	ddat = &hwmon->ddat;
+
+	ddat->hwmon = hwmon;
+	snprintf(ddat->name, sizeof(ddat->name), "xe");
+
+	hwm_get_preregistration_info(xe);
+
+	drm_dbg(&xe->drm, "Register HWMON interface\n");
+
+	/*  hwmon_dev points to device hwmon<i> */
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
+							 ddat,
+							 &hwm_chip_info,
+							 NULL);
+	if (IS_ERR(hwmon_dev)) {
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

