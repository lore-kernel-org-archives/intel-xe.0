Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447EECD3423
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 04:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73DD10E366;
	Mon,  4 May 2026 04:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AsqHlnVF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC6D10E183
 for <intel-xe@lists.freedesktop.org>; Mon,  4 May 2026 04:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777869832; x=1809405832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tGlkdYdYOzX0IQ4subMjpvayey6giPYynSRhzXWw9N8=;
 b=AsqHlnVF1ZgndwHCgUjsze2mRP2QkCkyy9D7OoAAWHo6TiRm0CpTWA6y
 v6oKXOYkuXyB+r4JHFmWjZjDdyDJ+YZS5OxKzKYFN6dgiKdGJUg7yltfN
 fJcR/zWSYny+Ump133Okw3SqwZqvVjFbmMS9x9X7cLN+GYuogxicUb81b
 kmefttMAqRDIJIZ38/ldPvRLYQoebJDaBZL/nAM7ABZ7pQoS1M740lR6b
 +GOskfHfY0G+ui9VlwlJrACPB8CoGfXDrPl7nI5hbsPU1ZOMj3eg3NYo0
 iFR5vl9BrE7F7c2v3mmDhtzIFKAU0/6AwVkBPwcR4ULFxGCN6tKgzM4xR g==;
X-CSE-ConnectionGUID: +OHJYitJStS4tY5xJTRX/w==
X-CSE-MsgGUID: /0u7i9XJQB+p45x9qxKBHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="96293559"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="96293559"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:43:52 -0700
X-CSE-ConnectionGUID: ngo4gZiPRim8Dpv4vI5KRw==
X-CSE-MsgGUID: ebZ9kOsxRuGNnThDN/pIlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="232773671"
Received: from dut4435arlh.fm.intel.com ([10.105.8.106])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 21:43:50 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 Michal.Wajdeczko@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 4/9] drm/xe: Add a new debug focused configfs group
Date: Mon,  4 May 2026 04:43:41 +0000
Message-ID: <20260504044348.209625-5-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260504044348.209625-1-stuart.summers@intel.com>
References: <20260504044348.209625-1-stuart.summers@intel.com>
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

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-opus-4.7
---
 drivers/gpu/drm/xe/Makefile            |  2 ++
 drivers/gpu/drm/xe/xe_configfs.c       |  4 ++++
 drivers/gpu/drm/xe/xe_configfs_debug.c | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_configfs_debug.h |  8 ++++++++
 drivers/gpu/drm/xe/xe_configfs_types.h |  7 +++++++
 5 files changed, 35 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 09661f079d03..b58667b0b18e 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -161,6 +161,8 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
 
 xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
 xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
+xe_debug_configfs_obj-$(CONFIG_DRM_XE_DEBUG) := xe_configfs_debug.o
+xe-$(CONFIG_CONFIGFS_FS) += $(xe_debug_configfs_obj-y)
 
 # graphics virtualization (SR-IOV) support
 xe-y += \
diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 12b7fe65446d..85df8ce5cf2a 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -1006,6 +1006,10 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
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
index 000000000000..01170dc2f97e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_configfs_debug.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+#ifndef _XE_CONFIGFS_DEBUG_H_
+#define _XE_CONFIGFS_DEBUG_H_
+
+#endif /* _XE_CONFIGFS_DEBUG_H_ */
diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h b/drivers/gpu/drm/xe/xe_configfs_types.h
index 935097aafa96..c9d94a3c26a7 100644
--- a/drivers/gpu/drm/xe/xe_configfs_types.h
+++ b/drivers/gpu/drm/xe/xe_configfs_types.h
@@ -24,6 +24,9 @@ struct wa_bb {
 struct xe_config_group_device {
 	struct config_group group;
 	struct config_group sriov;
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+	struct config_group debug;
+#endif
 
 	struct xe_config_device {
 		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
@@ -56,4 +59,8 @@ static inline struct xe_config_device *xe_configfs_to_device(struct config_item
 	return &xe_configfs_to_group_device(item)->config;
 }
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+extern const struct config_item_type xe_configfs_debug_type;
+#endif
+
 #endif /* _XE_CONFIGFS_TYPES_H_ */
-- 
2.43.0

