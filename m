Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E7AC5DF88
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 20:07:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C098A10E5A9;
	Thu, 20 Aug 2026 20:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iad9c/5z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEA810E3B5
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 20:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787256450; x=1818792450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BfLl8d2u5Sz02z08A1kdqDWzHswes/X5nJOjS/LAFo4=;
 b=Iad9c/5z8Ai0tEIrVkrIEO0w02q154a0JwRegFeP4VjiEOg3HnmRRacm
 foxvVUdF+QiBETl2PkK+meux1YKeIr5PwIXtqJUsG6slRE9dwGyBz1Nmi
 4NzUa9WPF6VgFKmMVOqFYtPOk+7iQ33CpoNZNN5d5K0rHcDFOiP8Zlrqr
 GkrnvKZDtgPjcuxLm5609qbEAXeZYrQjbYmq6iX+t67rVvQibntygGoQp
 Y+MvgNnNNrAgILo4zlV6v2cOMKfFhRau0ggJ1kjMZwAd2JPY4N+7YX7To
 MpgyghWUuxk3pTPHcK7pyFknusIxY4XMwZE3Xm/2hxkZbCf1AoJeR26wT w==;
X-CSE-ConnectionGUID: V6zVX5vISxiEhsGTaUOCbw==
X-CSE-MsgGUID: UdnZDgXUQ+ye6XblAMpTBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="98139249"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="98139249"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 13:07:29 -0700
X-CSE-ConnectionGUID: /DaPGdl3QN2AzN+YEg2toA==
X-CSE-MsgGUID: 50LDjk27RXazOnr//6zf/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="262410748"
Received: from dut4475arls.fm.intel.com ([10.105.8.198])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 13:07:27 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 Michal.Wajdeczko@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 04/10] drm/xe: Add a new debug focused configfs group
Date: Thu, 20 Aug 2026 20:07:21 +0000
Message-ID: <20260820200719.84681-16-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820200719.84681-12-stuart.summers@intel.com>
References: <20260820200719.84681-12-stuart.summers@intel.com>
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
 drivers/gpu/drm/xe/Makefile            |  2 ++
 drivers/gpu/drm/xe/xe_configfs.c       |  5 +++++
 drivers/gpu/drm/xe/xe_configfs_debug.c | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_configfs_debug.h | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_configfs_types.h |  3 +++
 5 files changed, 37 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 92134709d998..0b71f311c9c4 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -163,6 +163,8 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
 
 xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
 xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
+xe_debug_configfs_obj-$(CONFIG_DRM_XE_DEBUG) := xe_configfs_debug.o
+xe-$(CONFIG_CONFIGFS_FS) += $(xe_debug_configfs_obj-y)
 
 # graphics virtualization (SR-IOV) support
 xe-y += \
diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 029c9f682c8e..33aea1150c86 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -14,6 +14,7 @@
 
 #include "instructions/xe_mi_commands.h"
 #include "xe_configfs.h"
+#include "xe_configfs_debug.h"
 #include "xe_defaults.h"
 #include "xe_gt_types.h"
 #include "xe_module.h"
@@ -1242,6 +1243,10 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
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
index 3be7d6160b4c..e22b9424f719 100644
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

