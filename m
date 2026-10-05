Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FB6CA5FFC
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 22:06:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31A810EED7;
	Mon,  5 Oct 2026 22:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JAttcaZr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1D710E2A9
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 22:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791238001; x=1822774001;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WbhQMQ+xDId5I7N7wt4GMbqMlb4ySYq8YZuhSahfv7A=;
 b=JAttcaZrdCr8x90j1s6c6drkRF9EL5USuY7RyEWha6QCGTaJpz3SNg67
 Nf3CWRBFFJy0PnzdLEVtmn92CDPXleRqupMUCxuT2yJb9hyvEuAXg6mSL
 WSc/moz7di0XQ+ERHhcdsUyfmvaMKwKdEetKnidm/TUnDqV9TkOXvzL2G
 FVLkykn1K9LIL3SJyLiAKH5kuOs84JIznb0gAfkDDu5ZKtzF9KH/p7e7W
 HB9IxbunxWs3MRpXiIdOs1JcVpKBkYkWi7tAcftO2c+rGMTe075mhAHml
 VV8KC53Fi1t1vbB8pM2B1NHDJWOF1PceehAec6us0iE1wMzJefqD6o7FD w==;
X-CSE-ConnectionGUID: RPr+55hbTfu0KXrXPK51Cg==
X-CSE-MsgGUID: ug8bCi/7Rw2exLX4wJw+hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="109410176"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="109410176"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 15:06:41 -0700
X-CSE-ConnectionGUID: fPtl6U9xSPyNHTxHy2bSzw==
X-CSE-MsgGUID: htNzCuVqQa++FQYN0iaZAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="274732175"
Received: from dut4435arlh.fm.intel.com ([10.105.8.126])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 15:06:42 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 gustavo.sousa@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 08/15] drm/xe: Add a new debug focused configfs group
Date: Mon,  5 Oct 2026 22:06:44 +0000
Message-ID: <20261005220636.602826-25-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005220636.602826-17-stuart.summers@intel.com>
References: <20261005220636.602826-17-stuart.summers@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Add the skeleton code for a new debug specific configfs group.
Just add the structure for now. Actual debug content will be
added in a subsequent patch.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: LLM
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Makefile            |  3 +++
 drivers/gpu/drm/xe/xe_configfs.c       |  5 +++++
 drivers/gpu/drm/xe/xe_configfs_debug.c | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_configfs_debug.h | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_configfs_types.h |  3 +++
 5 files changed, 38 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 10930c924070..23accd9e6503 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -167,6 +167,9 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
 
 xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
 xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
+ifeq ($(CONFIG_CONFIGFS_FS),y)
+xe-$(CONFIG_DRM_XE_DEBUG) += xe_configfs_debug.o
+endif
 
 # graphics virtualization (SR-IOV) support
 xe-y += \
diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 16884fa035a8..8c2c912594fa 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -14,6 +14,7 @@
 
 #include "instructions/xe_mi_commands.h"
 #include "xe_configfs.h"
+#include "xe_configfs_debug.h"
 #include "xe_defaults.h"
 #include "xe_gt_types.h"
 #include "xe_module.h"
@@ -1407,6 +1408,10 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 		config_group_init_type_name(&dev->sriov, "sriov", &xe_config_sriov_type);
 		configfs_add_default_group(&dev->sriov, &dev->group);
 	}
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+	config_group_init_type_name(&dev->debug, "debug", &xe_configfs_debug_type);
+	configfs_add_default_group(&dev->debug, &dev->group);
+#endif
 
 	mutex_init(&dev->lock);
 
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c b/drivers/gpu/drm/xe/xe_configfs_debug.c
new file mode 100644
index 000000000000..45617282cec5
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <linux/configfs.h>
+#include <linux/module.h>
+
+#include "xe_configfs_debug.h"
+#include "xe_configfs_types.h"
+
+const struct config_item_type xe_configfs_debug_type = {
+	.ct_owner	= THIS_MODULE,
+};
diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.h b/drivers/gpu/drm/xe/xe_configfs_debug.h
new file mode 100644
index 000000000000..5f938450aed2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_configfs_debug.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+#ifndef _XE_CONFIGFS_DEBUG_H_
+#define _XE_CONFIGFS_DEBUG_H_
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG) && IS_ENABLED(CONFIG_CONFIGFS_FS)
+struct config_item_type;
+extern const struct config_item_type xe_configfs_debug_type;
+#endif
+
+#endif /* _XE_CONFIGFS_DEBUG_H_ */
diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h b/drivers/gpu/drm/xe/xe_configfs_types.h
index b1e351761d69..3a9ab40d519b 100644
--- a/drivers/gpu/drm/xe/xe_configfs_types.h
+++ b/drivers/gpu/drm/xe/xe_configfs_types.h
@@ -22,6 +22,9 @@ struct wa_bb {
 struct xe_config_group_device {
 	struct config_group group;
 	struct config_group sriov;
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+	struct config_group debug;
+#endif
 
 	/*
 	 * Fields sorted by type (largest first) then name: struct arrays,
-- 
2.43.0

