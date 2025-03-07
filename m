Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8582AC28B23
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 14:03:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECB210EBBF;
	Fri,  7 Mar 2025 14:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+XISsb9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0526410EBBF
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 14:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741356219; x=1772892219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7o/8P8xkDasQZjN04+SVqEl0jjj1V97zuR485DYvLcI=;
 b=j+XISsb9llXHA+cjSXN/sb94Ek6a9i9fQjXYJyi7urApmOekDUGKbMfr
 D5m/JQFpAqsABfWyXTZUjILztW/vTat4eHmAX5FsqWHYJZNjK0fwxnDaZ
 /SPZYr4ZzvFsQIrMRywemAeEv4YEx47G9soz8CxJzEsHBz2mYJeoGHZLC
 YcmwFAC+jaSMOiZgIkjCrIJ2KifwmyPlrn631OWj+5HcKLnIPJ4C82En4
 +SNkug6BRyA/qCX3Rl1vGnkNkX2n1HeAW6Y5YR8HojvA7Y6a1N+j7KqdO
 dFvpgSRkK80TTKOqH7LrNIRb1Naia+6JNTYQfZ9hzEhTJN+DWqnvZh6Ps w==;
X-CSE-ConnectionGUID: /NPle3sKRrOWXW8QvmsSLg==
X-CSE-MsgGUID: bYrengZQSdyGHMNiu7IEuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59961423"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="59961423"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 06:03:39 -0800
X-CSE-ConnectionGUID: JSK92MEyQ5K+vSX0a0v0Wg==
X-CSE-MsgGUID: w9tFCwzATPmFCPuFz4rcbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124552997"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 06:03:37 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, lucas.demarchi@intel.com
Subject: [PATCH 1/2] RFC drm/xe: Add configfs to enable survivability mode
Date: Fri,  7 Mar 2025 19:54:44 +0530
Message-ID: <20250307142446.1790715-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250307142446.1790715-1-riana.tauro@intel.com>
References: <20250307142446.1790715-1-riana.tauro@intel.com>
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

Registers a configfs subsystem called 'xe' to userspace. The user can
use this to modify exposed attributes.

Add survivability mode attribute (config/xe/survivability_mode) to the
subsystem to allow the user to specify the card that should enter
survivability mode.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/Makefile      |  1 +
 drivers/gpu/drm/xe/xe_configfs.c | 95 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h | 12 ++++
 drivers/gpu/drm/xe/xe_module.c   |  5 ++
 drivers/gpu/drm/xe/xe_module.h   |  1 +
 5 files changed, 114 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 9699b08585f7..3f8c87292cee 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -28,6 +28,7 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
 xe-y += xe_bb.o \
 	xe_bo.o \
 	xe_bo_evict.o \
+	xe_configfs.o \
 	xe_devcoredump.o \
 	xe_device.o \
 	xe_device_sysfs.o \
diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
new file mode 100644
index 000000000000..8c5f248e466d
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/configfs.h>
+#include <linux/init.h>
+#include <linux/module.h>
+
+#include "xe_configfs.h"
+#include "xe_module.h"
+
+/**
+ * DOC: Xe Configfs
+ *
+ * XE KMD registers a configfs subsystem called 'xe'to userspace that allows users to modify
+ * the exposed attributes.
+ *
+ * Attributes:
+ *
+ * config/xe/survivability_mode : Write only attribute that allows user to specify the PCI address
+ *				  of the card that has to enter survivability mode
+ */
+
+void xe_configfs_clear_survivability_mode(void)
+{
+	kfree(xe_modparam.survivability_mode);
+	xe_modparam.survivability_mode = NULL;
+}
+
+static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
+{
+	char *survivability_mode;
+	int ret;
+	unsigned int domain, bus, slot, function;
+
+	ret = sscanf(page, "%04x:%02x:%02x.%x", &domain, &bus, &slot, &function);
+	if (ret != 4)
+		return -EINVAL;
+
+	survivability_mode = kstrdup(page, GFP_KERNEL);
+	if (!survivability_mode)
+		return -ENOMEM;
+
+	xe_configfs_clear_survivability_mode();
+	xe_modparam.survivability_mode = survivability_mode;
+
+	return len;
+}
+
+CONFIGFS_ATTR_WO(, survivability_mode);
+
+static struct configfs_attribute *xe_configfs_attrs[] = {
+	&attr_survivability_mode,
+	NULL,
+};
+
+static const struct config_item_type xe_config_type = {
+	.ct_attrs	= xe_configfs_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct configfs_subsystem xe_config_subsys = {
+	.su_group = {
+		.cg_item = {
+			.ci_namebuf = "xe",
+			.ci_type = &xe_config_type,
+		},
+	},
+};
+
+int __init xe_configfs_init(void)
+{
+	int ret;
+
+	config_group_init(&xe_config_subsys.su_group);
+	mutex_init(&xe_config_subsys.su_mutex);
+	ret = configfs_register_subsystem(&xe_config_subsys);
+	if (ret) {
+		pr_err("Error %d while registering subsystem %s\n",
+		       ret, xe_config_subsys.su_group.cg_item.ci_namebuf);
+		mutex_destroy(&xe_config_subsys.su_mutex);
+		return ret;
+	}
+
+	return 0;
+}
+
+void __exit xe_configfs_exit(void)
+{
+	xe_configfs_clear_survivability_mode();
+	configfs_unregister_subsystem(&xe_config_subsys);
+	mutex_destroy(&xe_config_subsys.su_mutex);
+}
+
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
new file mode 100644
index 000000000000..491629a2ca53
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#ifndef _XE_CONFIGFS_H_
+#define _XE_CONFIGFS_H_
+
+int xe_configfs_init(void);
+void xe_configfs_exit(void);
+void xe_configfs_clear_survivability_mode(void);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 475acdba2b55..15b3cf22193c 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -11,6 +11,7 @@
 #include <drm/drm_module.h>
 
 #include "xe_drv.h"
+#include "xe_configfs.h"
 #include "xe_hw_fence.h"
 #include "xe_pci.h"
 #include "xe_pm.h"
@@ -91,6 +92,10 @@ static const struct init_funcs init_funcs[] = {
 	{
 		.init = xe_check_nomodeset,
 	},
+	{
+		.init = xe_configfs_init,
+		.exit = xe_configfs_exit,
+	},
 	{
 		.init = xe_hw_fence_module_init,
 		.exit = xe_hw_fence_module_exit,
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 84339e509c80..c238dbee6bc7 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -24,6 +24,7 @@ struct xe_modparam {
 #endif
 	int wedged_mode;
 	u32 svm_notifier_size;
+	char *survivability_mode;
 };
 
 extern struct xe_modparam xe_modparam;
-- 
2.47.1

