Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40080CAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 23:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2EC710E0CF;
	Thu,  2 Oct 2025 23:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PlWYIHtT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A7910E0CF
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 23:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759447621; x=1790983621;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x5D3YXqZnEjHLmu9n4xxYV1uyqYGGqoJlWvMSekL124=;
 b=PlWYIHtTNpfxoPoVrWbdX739Ur4SaPlQswxTlBjOJ+e471Z0jxU4qcRE
 hD5GM4M6qZVAQ8SPxpOWLANKweZTaBnqUGSVWVGf23+p7/pX8xbKahIZh
 3COwM2BD5I/8OnBqO8JcjW6o8aQwXUCGc3DLFmv6nDwpZpSlgR2k9CPS/
 qrbEJXkQCr2BG4FZJGVN8RAMXuD3xv4w4GvniculFxeI2AXMz5ks/lyHF
 aYWvG5XGpg86YC5O3+xgVxN0uzUohyKjjEtnyJGAGxNHLTwkgfXyeMgaV
 a/V9VBe9EHNtf9aCuUMS3iwgC4NRujGNie5TMNHhMCKVimeytU9EJUvYd g==;
X-CSE-ConnectionGUID: zNLB2Rv3TDCqweCVszOIJg==
X-CSE-MsgGUID: O8YKVga1RtyDYPEVL74uhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61841234"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="61841234"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:27:01 -0700
X-CSE-ConnectionGUID: SPJ2bDc6SweNKwT6w8hHzw==
X-CSE-MsgGUID: 0ZLFNIoRTJSfB4PoM81+aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="179177595"
Received: from sachowdh-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:27:00 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/pf: Add max_vfs configfs attribute to control PF mode
Date: Fri,  3 Oct 2025 01:26:48 +0200
Message-ID: <20251002232648.203370-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

In addition to existing max_vfs modparam, add max_vfs configfs
attribute to allow PF configuration on the per-device level.
Default config value is still based on the modparam value.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 139 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h |   4 +
 drivers/gpu/drm/xe/xe_sriov_pf.c |   3 +
 3 files changed, 146 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 139663423185..464a79c2a903 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -18,6 +18,7 @@
 #include "xe_hw_engine_types.h"
 #include "xe_module.h"
 #include "xe_pci_types.h"
+#include "xe_sriov_types.h"
 
 /**
  * DOC: Xe Configfs
@@ -169,6 +170,32 @@
  * Currently this is implemented only for post and mid context restore and
  * these attributes can only be set before binding to the device.
  *
+ * Max SR-IOV Virtual Functions
+ * ----------------------------
+ *
+ * This config allows to limit number of the Virtual Functions (VFs) that can
+ * be managed by the Physical Function (PF) driver, where value 0 disables the
+ * PF mode (no VFs).
+ *
+ * The default max_vfs config value is taken from the max_vfs modparam.
+ *
+ * How to enable PF with support with unlimited (up to HW limit) number of VFs::
+ *
+ *	# echo unlimited > /sys/kernel/config/xe/0000:00:02.0/sriov/max_vfs
+ *	# echo 0000:00:02.0 > /sys/bus/pci/drivers/xe/bind
+ *
+ * How to enable PF with support up to 3 VFs::
+ *
+ *	# echo 3 > /sys/kernel/config/xe/0000:00:02.0/sriov/max_vfs
+ *	# echo 0000:00:02.0 > /sys/bus/pci/drivers/xe/bind
+ *
+ * How to disable PF mode and always run as native::
+ *
+ *	# echo 0 > /sys/kernel/config/xe/0000:00:02.0/sriov/max_vfs
+ *	# echo 0000:00:02.0 > /sys/bus/pci/drivers/xe/bind
+ *
+ * This setting only takes effect when probing the device.
+ *
  * Remove devices
  * ==============
  *
@@ -185,6 +212,7 @@ struct wa_bb {
 
 struct xe_config_group_device {
 	struct config_group group;
+	struct config_group sriov;
 
 	struct xe_config_device {
 		u64 engines_allowed;
@@ -192,23 +220,34 @@ struct xe_config_group_device {
 		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
 		bool survivability_mode;
 		bool enable_psmi;
+		struct {
+			unsigned int max_vfs;
+		} sriov;
 	} config;
 
 	/* protects attributes */
 	struct mutex lock;
 	/* matching descriptor */
 	const struct xe_device_desc *desc;
+	/* tentative SR-IOV mode */
+	enum xe_sriov_mode mode;
 };
 
 static const struct xe_config_device device_defaults = {
 	.engines_allowed = U64_MAX,
 	.survivability_mode = false,
 	.enable_psmi = false,
+	.sriov = {
+		.max_vfs = UINT_MAX,
+	},
 };
 
 static void set_device_defaults(struct xe_config_device *config)
 {
 	*config = device_defaults;
+#ifdef CONFIG_PCI_IOV
+	config->sriov.max_vfs = xe_modparam.max_vfs;
+#endif
 }
 
 struct engine_info {
@@ -721,6 +760,68 @@ static const struct config_item_type xe_config_device_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static ssize_t sriov_max_vfs_show(struct config_item *item, char *page)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
+
+	guard(mutex)(&dev->lock);
+
+	if (dev->config.sriov.max_vfs == UINT_MAX)
+		return sprintf(page, "%s\n", "unlimited");
+	else
+		return sprintf(page, "%u\n", dev->config.sriov.max_vfs);
+}
+
+static ssize_t sriov_max_vfs_store(struct config_item *item, const char *page, size_t len)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
+	unsigned int max_vfs;
+	int ret;
+
+	guard(mutex)(&dev->lock);
+
+	if (is_bound(dev))
+		return -EBUSY;
+
+	ret = kstrtouint(page, 0, &max_vfs);
+	if (ret) {
+		if (!sysfs_streq(page, "unlimited"))
+			return ret;
+		max_vfs = UINT_MAX;
+	}
+
+	dev->config.sriov.max_vfs = max_vfs;
+	return len;
+}
+
+CONFIGFS_ATTR(sriov_, max_vfs);
+
+static struct configfs_attribute *xe_config_sriov_attrs[] = {
+	&sriov_attr_max_vfs,
+	NULL,
+};
+
+static bool xe_config_sriov_is_visible(struct config_item *item,
+				       struct configfs_attribute *attr, int n)
+{
+	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
+
+	if (attr == &sriov_attr_max_vfs && dev->mode != XE_SRIOV_MODE_PF)
+		return false;
+
+	return true;
+}
+
+static struct configfs_group_operations xe_config_sriov_group_ops = {
+	.is_visible	= xe_config_sriov_is_visible,
+};
+
+static const struct config_item_type xe_config_sriov_type = {
+	.ct_owner	= THIS_MODULE,
+	.ct_group_ops	= &xe_config_sriov_group_ops,
+	.ct_attrs	= xe_config_sriov_attrs,
+};
+
 static const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev)
 {
 	struct device_driver *driver = driver_find("xe", &pci_bus_type);
@@ -746,6 +847,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 	unsigned int domain, bus, slot, function;
 	struct xe_config_group_device *dev;
 	const struct xe_device_desc *match;
+	enum xe_sriov_mode mode;
 	struct pci_dev *pdev;
 	char canonical[16];
 	int vfnumber = 0;
@@ -762,6 +864,9 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 		return ERR_PTR(-EINVAL);
 
 	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
+	mode = pdev ? dev_is_pf(&pdev->dev) ?
+		XE_SRIOV_MODE_PF : XE_SRIOV_MODE_NONE : XE_SRIOV_MODE_VF;
+
 	if (!pdev && function)
 		pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, 0));
 	if (!pdev && slot)
@@ -796,9 +901,15 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
 		return ERR_PTR(-ENOMEM);
 
 	dev->desc = match;
+	dev->mode = match->has_sriov ? mode : XE_SRIOV_MODE_NONE;
+
 	set_device_defaults(&dev->config);
 
 	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
+	if (dev->mode != XE_SRIOV_MODE_NONE) {
+		config_group_init_type_name(&dev->sriov, "sriov", &xe_config_sriov_type);
+		configfs_add_default_group(&dev->sriov, &dev->group);
+	}
 
 	mutex_init(&dev->lock);
 
@@ -988,6 +1099,34 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
 	return len;
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
+	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
+	unsigned int max_vfs;
+
+	if (!dev)
+		return xe_modparam.max_vfs;
+
+	scoped_guard(mutex, &dev->lock)
+		max_vfs = dev->config.sriov.max_vfs;
+
+	config_group_put(&dev->group);
+
+	return max_vfs;
+}
+#endif
+
 int __init xe_configfs_init(void)
 {
 	int ret;
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index c61e0e47ed94..16a1f578e4fe 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -23,6 +23,9 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_clas
 				       const u32 **cs);
 u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
 					const u32 **cs);
+#ifdef CONFIG_PCI_IOV
+unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
+#endif
 #else
 static inline int xe_configfs_init(void) { return 0; }
 static inline void xe_configfs_exit(void) { }
@@ -34,6 +37,7 @@ static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum
 						     const u32 **cs) { return 0; }
 static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
 						      const u32 **cs) { return 0; }
+static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev) { return UINT_MAX; }
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index 4698348c010a..428b1b62cf48 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -8,6 +8,7 @@
 #include <drm/drm_managed.h>
 
 #include "xe_assert.h"
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_gt_sriov_pf.h"
 #include "xe_module.h"
@@ -19,6 +20,8 @@
 
 static unsigned int wanted_max_vfs(struct xe_device *xe)
 {
+	if (IS_ENABLED(CONFIG_CONFIGFS_FS))
+		return xe_configfs_get_max_vfs(to_pci_dev(xe->drm.dev));
 	return xe_modparam.max_vfs;
 }
 
-- 
2.47.1

