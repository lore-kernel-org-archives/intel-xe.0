Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7A2C3600C
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 06:20:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9233210E089;
	Thu, 27 Mar 2025 06:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iaRkhxKC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD0C10E089
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Mar 2025 06:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743056434; x=1774592434;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o6874VIewRHl9xApPOCrRx13V7FZTi3WzInw5+RzPrs=;
 b=iaRkhxKCV9U/bM9YtAw/swFzrf0ea4QMjZpFcbhbqnTLJOD5TDubGNTu
 ddYdDwIhRdy18FUI2B44uCn/1f+QfcaxutiAL+M8t7ecCp5OWMDisrXVn
 gGF0y1EM9g5zKhKd62QevbUN2rAdopVLG93XWE6oapi206hvciNnlUpWC
 iCzKbHiG3I1t4CK0E3xCWDNdzsQb2XtoJJioMVjh3oRu0hMDUpu2ZRmiS
 dPxqBvL0mbCLvAzayQZtBCDrUFlu7SYVzPtXerB00db1r6ltcdCbM0JdM
 AfUaaJnFPsJyg3iV2Z41wSE0EBmP7TrgfAE4dsMeGi3+jppf58ZVQDUhy g==;
X-CSE-ConnectionGUID: aRqwxsbJSBOZiaOwxxAN+w==
X-CSE-MsgGUID: U3CUH0C4SlKzH5WmsqW/NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44289751"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="44289751"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 23:20:34 -0700
X-CSE-ConnectionGUID: LYAqZ/rWS8O3mt2qY5NLtA==
X-CSE-MsgGUID: ZEmgWWRrQkeVyRKlbfXdRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="130232513"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 23:20:32 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, matthew.d.roper@intel.com,
 aravind.iddamsetty@linux.intel.com
Subject: [PATCH 1/2] drm/xe: Add configfs to enable survivability mode
Date: Thu, 27 Mar 2025 12:12:01 +0530
Message-ID: <20250327064204.459968-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250327064204.459968-1-riana.tauro@intel.com>
References: <20250327064204.459968-1-riana.tauro@intel.com>
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
use this to modify exposed attributes for a device.

Attribute exposed:

/config/xe/<device>/survivability_mode : Enables survivability mode

The attributes can be modified by creating the device directory under the
configfs directory

mount -t configfs none /config
mkdir /config/xe/0000:03:00.0

echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind
echo 1 > /config/xe/0000:03:00.0/survivability_mode
echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/Makefile      |   1 +
 drivers/gpu/drm/xe/xe_configfs.c | 174 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h |  11 ++
 drivers/gpu/drm/xe/xe_module.c   |   5 +
 4 files changed, 191 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index cd464fe26eb8..190176c2e10d 100644
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
index 000000000000..59e1bc4c5f76
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/configfs.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+
+#include "xe_configfs.h"
+#include "xe_module.h"
+
+/**
+ * DOC: XE Configfs Support
+ *
+ * Overview
+ * =========
+ *
+ * Configfs is a filesystem-based manager of kernel objects. XE KMD registers a
+ * configfs subsystem called 'xe' that allows user to configure various attributes
+ * See Documentation/filesystems/configfs.rst for more information about how configfs works.
+ *
+ * Create devices
+ * ===============
+ *
+ * To use configfs exposed by Xe, mount the configfs directory and create the device directory
+ *
+ * $ mount -t configfs none /config
+ * $ mkdir /config/xe/0000:03:00.0
+ *
+ * Configure Attributes
+ * ====================
+ *
+ * /config/xe/<device>/survivability mode : Enables survivability mode if supported by device
+ *
+ * Unbind			: echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind
+ * Enable survivability mode	: echo 1 > /config/xe/0000:03:00.0/survivability_mode
+ * Bind				: echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind
+ *
+ * The device enters survivability mode if supported
+ *
+ */
+
+struct xe_config_device {
+	struct config_group group;
+
+	/** @survivability_mode: enables survivability mode when set */
+	bool survivability_mode;
+
+	/** @lock: protects attributes */
+	struct mutex lock;
+};
+
+static struct xe_config_device *to_xe_config_device(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct xe_config_device, group);
+}
+
+static ssize_t survivability_mode_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+
+	return sprintf(page, "%d\n", dev->survivability_mode);
+}
+
+static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+	bool survivability_mode;
+	int ret;
+
+	ret = kstrtobool(page, &survivability_mode);
+	if (ret)
+		return ret;
+
+	mutex_lock(&dev->lock);
+	dev->survivability_mode = survivability_mode;
+	mutex_unlock(&dev->lock);
+
+	return len;
+}
+
+CONFIGFS_ATTR(, survivability_mode);
+
+static struct configfs_attribute *xe_config_device_attrs[] = {
+	&attr_survivability_mode,
+	NULL,
+};
+
+static void xe_config_device_release(struct config_item *item)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+
+	mutex_destroy(&dev->lock);
+	kfree(dev);
+}
+
+static struct configfs_item_operations xe_config_device_ops = {
+	.release	= xe_config_device_release,
+};
+
+static const struct config_item_type xe_config_device_type = {
+	.ct_item_ops	= &xe_config_device_ops,
+	.ct_attrs	= xe_config_device_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *xe_config_make_device_group(struct config_group *group,
+							const char *name)
+{
+	unsigned int domain, bus, slot, function;
+	struct xe_config_device *dev;
+	struct pci_dev *pdev;
+	int ret;
+
+	ret = sscanf(name, "%04x:%02x:%02x.%x", &domain, &bus, &slot, &function);
+	if (ret != 4)
+		return ERR_PTR(-EINVAL);
+
+	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
+	if (!pdev)
+		return ERR_PTR(-EINVAL);
+
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return ERR_PTR(-ENOMEM);
+
+	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
+
+	mutex_init(&dev->lock);
+
+	return &dev->group;
+}
+
+static struct configfs_group_operations xe_config_device_group_ops = {
+	.make_group	= xe_config_make_device_group,
+};
+
+static const struct config_item_type xe_configfs_type = {
+	.ct_group_ops	= &xe_config_device_group_ops,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct configfs_subsystem xe_configfs = {
+	.su_group = {
+		.cg_item = {
+			.ci_namebuf = "xe",
+			.ci_type = &xe_configfs_type,
+		},
+	},
+};
+
+int __init xe_configfs_init(void)
+{
+	struct config_group *root = &xe_configfs.su_group;
+	int ret = 0;
+
+	config_group_init(root);
+	mutex_init(&xe_configfs.su_mutex);
+	ret = configfs_register_subsystem(&xe_configfs);
+	if (ret) {
+		pr_err("Error %d while registering %s subsystem\n",
+		       ret, root->cg_item.ci_namebuf);
+	}
+
+	return ret;
+}
+
+void __exit xe_configfs_exit(void)
+{
+	configfs_unregister_subsystem(&xe_configfs);
+}
+
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
new file mode 100644
index 000000000000..2c30be9a2c7e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#ifndef _XE_CONFIGFS_H_
+#define _XE_CONFIGFS_H_
+
+int xe_configfs_init(void);
+void xe_configfs_exit(void);
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
-- 
2.47.1

