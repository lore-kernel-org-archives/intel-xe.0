Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA8EC83F2D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 18:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E1D10E627;
	Tue, 15 Jul 2025 18:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C5jhTPCj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8D710E627
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 18:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752603292; x=1784139292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hnh31XkmxLQ0mt0JbR+/E9PFAwwDQmtRkcBjMdMb+PM=;
 b=C5jhTPCj1+FTYm6ufhC5TXzm8GZnUmvpi25G2ZOEAWMSbyDGSVGtna6H
 HkcAdyKleWfoyfm8V1wIEznbmvatw2r/i3XUEmmsTWdu3yFjShvo+YrKw
 zRFKRQJ7dY64btd16yN/60JosEUc0dso3FwAGSCha7+q3YjY/ks/q9xs9
 ZvSth0Gxi7pRC/zWv0t2gMerIXlFazPXFCCmRPva7cEfRk13V0/FGg0bU
 S5V0xLDt1EMpMLk/Wno+SfVuTa9funSuk92SN49rA2nz8jAx6nfrO19qR
 yN5dJ2SbOc7wkux9jQHuQ1GlZG2hbQwqyiR91yJJ6oiaBpTlEm+xWBV5p g==;
X-CSE-ConnectionGUID: TIfOhIKcRDOFmEM4kjihFQ==
X-CSE-MsgGUID: pZMJ35DuTA2dDyAvqOkiXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65406512"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="65406512"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 11:14:52 -0700
X-CSE-ConnectionGUID: YfHdR1KSQfCFFcv4xS16CQ==
X-CSE-MsgGUID: gad9BmUFTRGuAH+DZ0gSRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="162845988"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.253.198])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 11:14:50 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 3/4] drm/xe/pf: Add max_vfs configfs attribute to control PF
 mode
Date: Tue, 15 Jul 2025 20:14:17 +0200
Message-Id: <20250715181419.807-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250715181419.807-1-michal.wajdeczko@intel.com>
References: <20250715181419.807-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
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

In addition to max_vfs modparam, add max_vfs configfs attribute
to allow SR-IOV PF mode configuration on the per-device level.
Default config value is still based on the modparam value.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 89 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_configfs.h | 11 ++++
 drivers/gpu/drm/xe/xe_sriov_pf.c |  4 +-
 3 files changed, 101 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 8ec1ff1e4e80..6c40efd1aa2a 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -77,6 +77,24 @@
  * available for migrations, but it's disabled. This is intended for debugging
  * purposes only.
  *
+ * Max Virtual Functions:
+ * ----------------------
+ *
+ * Configure SR-IOV PF mode on supported cards. This setting only takes effect
+ * when probing the device. Allows to limit number of Virtual Functions that
+ * can be managed by the PF driver, value 0 (no VFs) disables the PF mode.
+ * Default max_vfs config value is taken from the max_vfs modparam.
+ *
+ * Example to enable PF mode (will support up to 7 VFs)::
+ *
+ *	# echo 7 > /sys/kernel/config/xe/0000:00:02.0/max_vfs
+ *	# echo 0000:00:02.0 > /sys/bus/pci/drivers/xe/bind
+ *
+ * Example to disable PF mode (will always run as native)::
+ *
+ *	# echo 0 > /sys/kernel/config/xe/0000:00:02.0/max_vfs
+ *	# echo 0000:00:02.0 > /sys/bus/pci/drivers/xe/bind
+ *
  * Remove devices
  * ==============
  *
@@ -90,7 +108,9 @@ struct xe_config_device {
 
 	bool survivability_mode;
 	u64 engines_allowed;
-
+#ifdef CONFIG_PCI_IOV
+	unsigned int max_vfs;
+#endif
 	/* protects attributes */
 	struct mutex lock;
 };
@@ -226,12 +246,50 @@ static ssize_t engines_allowed_store(struct config_item *item, const char *page,
 	return len;
 }
 
+#ifdef CONFIG_PCI_IOV
+static ssize_t max_vfs_show(struct config_item *item, char *page)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+
+	if (dev->max_vfs == UINT_MAX)
+		return sprintf(page, "%s\n", "unlimited");
+	else
+		return sprintf(page, "%u\n", dev->max_vfs);
+}
+
+static ssize_t max_vfs_store(struct config_item *item, const char *page, size_t len)
+{
+	struct xe_config_device *dev = to_xe_config_device(item);
+	unsigned int max_vfs;
+	int ret;
+
+	ret = kstrtouint(page, 0, &max_vfs);
+	if (ret) {
+		if (!sysfs_streq(page, "unlimited"))
+			return ret;
+		max_vfs = ~0;
+	}
+
+	mutex_lock(&dev->lock);
+	dev->max_vfs = max_vfs;
+	mutex_unlock(&dev->lock);
+
+	return len;
+}
+#endif
+
 CONFIGFS_ATTR(, survivability_mode);
 CONFIGFS_ATTR(, engines_allowed);
+#ifdef CONFIG_PCI_IOV
+CONFIGFS_ATTR(, max_vfs);
+#endif
 
 static struct configfs_attribute *xe_config_device_attrs[] = {
 	&attr_survivability_mode,
 	&attr_engines_allowed,
+#ifdef CONFIG_PCI_IOV
+	&attr_max_vfs,
+#endif
 	NULL,
 };
 
@@ -275,6 +333,9 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 
 	/* Default values */
 	dev->engines_allowed = U64_MAX;
+#ifdef CONFIG_PCI_IOV
+	dev->max_vfs = xe_modparam.max_vfs;
+#endif
 
 	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
 
@@ -386,6 +447,32 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
 	return engines_allowed;
 }
 
+#ifdef CONFIG_PCI_IOV
+/**
+ * xe_configfs_get_max_vfs() - Get number of VFs that could be managed
+ * @pdev: the &pci_dev device
+ *
+ * Find the configfs group that belongs to the PCI device and return maximum
+ * number of Virtual Functions (VFs) that could be managed by this device.
+ * If configfs group is not present, use value of max_vfs module parameter.
+ *
+ * Return: maximum number of VFs that could be managed.
+ */
+unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
+{
+	struct xe_config_device *dev = configfs_find_group(pdev);
+	unsigned int max_vfs;
+
+	if (!dev)
+		return xe_modparam.max_vfs;
+
+	max_vfs = dev->max_vfs;
+	config_item_put(&dev->group.cg_item);
+
+	return max_vfs;
+}
+#endif
+
 int __init xe_configfs_init(void)
 {
 	struct config_group *root = &xe_configfs.su_group;
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index fb8764008089..6d7accdc3732 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -8,6 +8,8 @@
 #include <linux/limits.h>
 #include <linux/types.h>
 
+#include "xe_module.h"
+
 struct pci_dev;
 
 #if IS_ENABLED(CONFIG_CONFIGFS_FS)
@@ -16,12 +18,21 @@ void xe_configfs_exit(void);
 bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
 void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
 u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
+#ifdef CONFIG_PCI_IOV
+unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
+#endif
 #else
 static inline int xe_configfs_init(void) { return 0; }
 static inline void xe_configfs_exit(void) { }
 static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
 static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
 static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
+#ifdef CONFIG_PCI_IOV
+static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
+{
+	return xe_modparam.max_vfs;
+}
+#endif
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index afbdd894bd6e..3e8344bf772b 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -8,8 +8,8 @@
 #include <drm/drm_managed.h>
 
 #include "xe_assert.h"
+#include "xe_configfs.h"
 #include "xe_device.h"
-#include "xe_module.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
 #include "xe_sriov_pf_helpers.h"
@@ -18,7 +18,7 @@
 
 static unsigned int wanted_max_vfs(struct xe_device *xe)
 {
-	return xe_modparam.max_vfs;
+	return xe_configfs_get_max_vfs(to_pci_dev(xe->drm.dev));
 }
 
 static int pf_reduce_totalvfs(struct xe_device *xe, int limit)
-- 
2.47.1

