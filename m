Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A43EC9832E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 23:01:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B73E10F807;
	Thu, 24 Sep 2026 23:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kDwFKLSS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8BD10F7BD
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 23:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790290884; x=1821826884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1bLpJDlJd/WhisfPU7D8oUKtUVkaoeguh5ULWJgRUwE=;
 b=kDwFKLSS8r0yNpHIIs8rpwI5GmKlCrpKJxGy8dTduH5dHmaQy2vIfHJL
 5nr7rMBqeQaivQaH/pjl4M8JKkIN3OdMlrgz3NjOxzy+wV8fiwXzwif4Q
 rXCq5JS5zC0rs2NTi2g/p6pwZQjIaTuoz3FndKpUdrehQeeyR+N3g5r60
 EUW1pU/ME1b4heOqDQrfuVBHYZU5VbQaiqod4BMhY2052zs6HIOo2JVsA
 xy8gtRxg3WXzn9+KKJmbWmGEjWV2Yi5UrHO0JN6uFmw1fkBTMbazCfARz
 XnDZyMQlgEPiMo5CzG2D2sGfFWG0htkGlHJRjTIc/owZZferpWr6fGkd+ w==;
X-CSE-ConnectionGUID: xY3A8HFUS6m4qI1elWeljw==
X-CSE-MsgGUID: N4G+IRg5Q4+qtnp9BSxDEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90120176"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="90120176"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 16:01:23 -0700
X-CSE-ConnectionGUID: mH5/fb1rTJCJuzLaVwJcMw==
X-CSE-MsgGUID: uR1De2Q2Rfe8xYlq7J+IUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="270651615"
Received: from dut4435arlh.fm.intel.com ([10.105.8.61])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 16:01:22 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 gustavo.sousa@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 09/16] drm/xe: Add a new debug focused configfs group
Date: Thu, 24 Sep 2026 23:01:28 +0000
Message-ID: <20260924230120.389685-27-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924230120.389685-18-stuart.summers@intel.com>
References: <20260924230120.389685-18-stuart.summers@intel.com>
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
Assisted-by: Copilot:claude-sonnet-4.6,claude-opus-4.7
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Makefile            |  1 +
 drivers/gpu/drm/xe/xe_configfs.c       |  5 +++++
 drivers/gpu/drm/xe/xe_configfs_debug.c | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_configfs_debug.h | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_configfs_types.h |  3 +++
 5 files changed, 36 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index aa5d6184713b..df28440c5752 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -165,6 +165,7 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
 
 xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
 xe-y += xe_configfs.o
+xe-$(CONFIG_DRM_XE_DEBUG) += xe_configfs_debug.o
 
 # graphics virtualization (SR-IOV) support
 xe-y += \
diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 172298713a1b..8f4ec5003a66 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -14,6 +14,7 @@
 
 #include "instructions/xe_mi_commands.h"
 #include "xe_configfs.h"
+#include "xe_configfs_debug.h"
 #include "xe_defaults.h"
 #include "xe_gt_types.h"
 #include "xe_module.h"
@@ -1341,6 +1342,10 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
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
index 36c48cb4c8b8..41e4326ad033 100644
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

