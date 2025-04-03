Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CB6C3601E
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 10:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0FB10E987;
	Thu,  3 Apr 2025 10:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G9HahwDH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4885F10E987
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 10:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743674655; x=1775210655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K3icreSaUGgXJJSvUCK3MxqOmdCcLfXkrGwiYWwpzSM=;
 b=G9HahwDHxmTPaMOMsqdvmmAgVr/rlv+oheUaeu+G5ZsaOhwDsWZVMgYm
 Mp98p1H6/niszUSDPm+rkDBWoTnxQkZPRGUVgCyszPQvYIKdRYCNh3omw
 V8oZlMhyf00NPlLyvvPX9Ao2ZgNHSKxa0UyHc+eFfXa6I7CoS6GITEwbX
 XJ/rrHLMKAXzzA5rcYdJvZ0qxPR/7cSuDo/iRM9EVtnhJJNnRMN9HIAHk
 9H/xcpqddxEeYI2dw0LIn8BzJ0ZbzHa/pHDU1tQ9wzb3dmA856EzvO/d1
 h16y1S5yPPsp/0uLpM0pOUWBn6h2S6eyLWzLCgy3JycZIYUB7w08o3u07 Q==;
X-CSE-ConnectionGUID: tAL/XmjoQhC4JYdfsNIi2w==
X-CSE-MsgGUID: c1+Ut0PST3a1wZafnHfJ9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44224418"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="44224418"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:04:15 -0700
X-CSE-ConnectionGUID: ryI19aCvRwKmRKuCbl/5kA==
X-CSE-MsgGUID: WILzWMAQQWKL3fRV6Q+iIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="127470114"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 03:04:13 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, matthew.d.roper@intel.com,
 aravind.iddamsetty@linux.intel.com
Subject: [PATCH v3 1/3] drm/xe: Add configfs to enable survivability mode
Date: Thu,  3 Apr 2025 15:55:51 +0530
Message-ID: <20250403102555.1265786-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250403102555.1265786-1-riana.tauro@intel.com>
References: <20250403102555.1265786-1-riana.tauro@intel.com>
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

Registers a configfs subsystem called 'xe' that creates a
directory in the mounted configfs directory (/sys/kernel/config)
Userspace can then create the device that has to be configured
under the xe directory

	mkdir /sys/kernel/config/xe/0000:03:00.0

The device created will have the following attributes to be
configured

	/sys/kernel/config/xe/
		.. 0000:03:00.0/
			... survivability_mode

v2: fix kernel-doc
    fix return value (Lucas)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 Documentation/gpu/xe/index.rst       |   1 +
 Documentation/gpu/xe/xe_configfs.rst |  10 ++
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_configfs.c     | 190 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h     |  16 +++
 drivers/gpu/drm/xe/xe_module.c       |   5 +
 6 files changed, 223 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_configfs.rst
 create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs.h

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 92cfb25e64d3..b2369561f24e 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -25,3 +25,4 @@ DG2, etc is provided to prototype the driver.
    xe_debugging
    xe_devcoredump
    xe-drm-usage-stats.rst
+   xe_configfs
diff --git a/Documentation/gpu/xe/xe_configfs.rst b/Documentation/gpu/xe/xe_configfs.rst
new file mode 100644
index 000000000000..9b9d941eb20e
--- /dev/null
+++ b/Documentation/gpu/xe/xe_configfs.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+.. _xe_configfs:
+
+============
+Xe Configfs
+============
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_configfs.c
+   :doc: Xe Configfs
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 72eaadc4cbee..c5d6681645ed 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -131,6 +131,7 @@ xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
 xe-$(CONFIG_HWMON) += xe_hwmon.o
 
 xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
+xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
 
 # graphics virtualization (SR-IOV) support
 xe-y += \
diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
new file mode 100644
index 000000000000..548468d2bda0
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -0,0 +1,190 @@
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
+ * DOC: Xe Configfs
+ *
+ * Overview
+ * =========
+ *
+ * Configfs is a filesystem-based manager of kernel objects. XE KMD registers a
+ * configfs subsystem called ``'xe'`` that creates a directory in the mounted configfs directory
+ * The user can create devices under this directory and configure them as necessary
+ * See Documentation/filesystems/configfs.rst for more information about how configfs works.
+ *
+ * Create devices
+ * ===============
+ *
+ * In order to create a device, the user has to create a directory inside ``'xe'``
+ * ::
+ *
+ *	mkdir /sys/kernel/config/xe/0000:03:00.0/
+ *
+ * Every device created will have the following entries that can be used to configure it
+ * ::
+ *
+ *	/sys/kernel/config/xe/
+ *		.. 0000:03:00.0/
+ *			... survivability_mode
+ *
+ * Configure Attributes
+ * ====================
+ *
+ * Survivability mode:
+ * -------------------
+ *
+ * To enable survivability mode using configfs on supported cards, follow the
+ * below steps ::
+ *
+ *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
+ *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind  (Enters survivability mode if supported)
+ *
+ * Remove devices
+ * ==============
+ *
+ * The created device directories can be removed using ``rmdir``
+ * ::
+ *
+ *	rmdir /sys/kernel/config/xe/0000:03:00.0/
+ */
+
+struct xe_config_device {
+	struct config_group group;
+
+	bool survivability_mode;
+
+	/* protects attributes */
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
+	int ret;
+
+	config_group_init(root);
+	mutex_init(&xe_configfs.su_mutex);
+	ret = configfs_register_subsystem(&xe_configfs);
+	if (ret) {
+		pr_err("Error %d while registering %s subsystem\n",
+		       ret, root->cg_item.ci_namebuf);
+		return ret;
+	}
+
+	return 0;
+}
+
+void __exit xe_configfs_exit(void)
+{
+	configfs_unregister_subsystem(&xe_configfs);
+}
+
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
new file mode 100644
index 000000000000..5532320818e4
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#ifndef _XE_CONFIGFS_H_
+#define _XE_CONFIGFS_H_
+
+#if IS_ENABLED(CONFIG_CONFIGFS_FS)
+int xe_configfs_init(void);
+void xe_configfs_exit(void);
+#else
+static inline int xe_configfs_init(void) { return 0; };
+static inline void xe_configfs_exit(void) {};
+#endif
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

