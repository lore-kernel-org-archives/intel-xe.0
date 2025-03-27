Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4D7C3600B
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 06:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801C810E088;
	Thu, 27 Mar 2025 06:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UbkmhPX1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C7710E088
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Mar 2025 06:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743056437; x=1774592437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TUUVdQIbGQQnIy3DV98WvSiAPEtTcxyyFoRYUmQdvXg=;
 b=UbkmhPX1ft4rFLFXNe6YWtWn0zvxuNnTbHMw2wS8BRYhrJ/gJPkB4IlB
 ICAa2v1K9PDweOoi1k/Pc90bM0B9Ltuz6ea1BhEtPWDBTIgxcDDV8Fwto
 Pjh/MjHoiLwUlQii6oT3oUMPYJ704H5SHC7HHHxbdrJCnbeC+nLZK0OBg
 rSUYk1806wSMhanSQjbfi+mdk50qX22B9f2MKJSdo/aUTM9zfoZW6dV0M
 +5hozM9ehcF2puZag3uAsnCgaZ4KTH+JU+/Vhh7jQeL8tmDfFIdCvSi9y
 GbYzjLO3gkl2bOv8vu36d9dwrcaoR3W1tPuA6MEpZaFkVe4Z/EjuNAg0v w==;
X-CSE-ConnectionGUID: QXjUkOmwQy+GHyn4CmXebg==
X-CSE-MsgGUID: 7eb+B4QPRaSQE7VzElcjPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44289752"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="44289752"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 23:20:37 -0700
X-CSE-ConnectionGUID: 400zkMjcSWK60RPt7zwIdQ==
X-CSE-MsgGUID: nwZ02FbMTQWBJYjtG300nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="130232516"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 23:20:34 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, matthew.d.roper@intel.com,
 aravind.iddamsetty@linux.intel.com
Subject: [PATCH 2/2] drm/xe: Enable configfs support for survivability mode
Date: Thu, 27 Mar 2025 12:12:02 +0530
Message-ID: <20250327064204.459968-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250327064204.459968-1-riana.tauro@intel.com>
References: <20250327064204.459968-1-riana.tauro@intel.com>
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

Enable survivability mode if supported and configfs attribute is set.
Enabing survivability mode manually is useful in cases where pcode does
not detect failure, validation and for IFR (in-field-repair).

To set configfs survivability mode attribute for a device

mkdir /config/xe/0000:03:00.0
echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind
echo 1 > /config/xe/0000:03:00.0/survivability_mode
echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind

The card enters survivability mode if supported

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c           | 62 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h           |  7 ++-
 drivers/gpu/drm/xe/xe_device.c             |  2 +-
 drivers/gpu/drm/xe/xe_pci.c                | 19 ++++---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 39 ++++++++++----
 drivers/gpu/drm/xe/xe_survivability_mode.h |  2 +-
 6 files changed, 109 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 59e1bc4c5f76..57234904c061 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -151,6 +151,68 @@ static struct configfs_subsystem xe_configfs = {
 	},
 };
 
+static struct xe_config_device *configfs_find_group(struct pci_dev *pdev)
+{
+	struct config_item *item;
+	char name[64];
+
+	snprintf(name, sizeof(name), "%04x:%02x:%02x.%x", pci_domain_nr(pdev->bus),
+		 pdev->bus->number, PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
+
+	mutex_lock(&xe_configfs.su_mutex);
+	item = config_group_find_item(&xe_configfs.su_group, name);
+	mutex_unlock(&xe_configfs.su_mutex);
+
+	if (!item)
+		return NULL;
+
+	return to_xe_config_device(item);
+}
+
+/**
+ * xe_configfs_get_survivability_mode - get configfs survivability mode attribute
+ * @pdev: pci device
+ *
+ * find the configfs group that belongs to the pci device and return
+ * the survivability mode attribute
+ *
+ * Return: survivability mode if config group is found, false otherwise
+ */
+bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
+{
+	struct xe_config_device *dev = configfs_find_group(pdev);
+	bool mode;
+
+	if (!dev)
+		return false;
+
+	mode = dev->survivability_mode;
+	config_item_put(&dev->group.cg_item);
+
+	return mode;
+}
+
+/**
+ * xe_configfs_clear_survivability_mode - clear configfs survivability mode attribute
+ * @pdev: pci device
+ *
+ * find the configfs group that belongs to the pci device and clear survivability
+ * mode attribute
+ */
+void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
+{
+	struct xe_config_device *dev = configfs_find_group(pdev);
+
+	if (!dev)
+		return;
+
+	mutex_lock(&dev->lock);
+	dev->survivability_mode = 0;
+	mutex_unlock(&dev->lock);
+
+	config_item_put(&dev->group.cg_item);
+}
+
 int __init xe_configfs_init(void)
 {
 	struct config_group *root = &xe_configfs.su_group;
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 2c30be9a2c7e..6e8c5ccaf202 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -5,7 +5,12 @@
 #ifndef _XE_CONFIGFS_H_
 #define _XE_CONFIGFS_H_
 
+#include <linux/types.h>
+
+struct pci_dev;
+
 int xe_configfs_init(void);
 void xe_configfs_exit(void);
-
+bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
+void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1ffb7d1f6be6..f4e59577ddc0 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -712,7 +712,7 @@ int xe_device_probe_early(struct xe_device *xe)
 	sriov_update_device_info(xe);
 
 	err = xe_pcode_probe_early(xe);
-	if (err) {
+	if (err || xe_survivability_mode_requested(xe)) {
 		int save_err = err;
 
 		/*
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index da384acf731f..bcacfa78afd1 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -812,18 +812,17 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return err;
 
 	err = xe_device_probe_early(xe);
-	if (err) {
-		/*
-		 * In Boot Survivability mode, no drm card is exposed and driver
-		 * is loaded with bare minimum to allow for firmware to be
-		 * flashed through mei. If early probe failed, but it managed to
-		 * enable survivability mode, return success.
-		 */
-		if (xe_survivability_mode_is_enabled(xe))
-			return 0;
+	/*
+	 * In Boot Survivability mode, no drm card is exposed and driver
+	 * is loaded with bare minimum to allow for firmware to be
+	 * flashed through mei. Return success, if survivability mode
+	 * is enabled due to pcode failure or configfs being set
+	 */
+	if (xe_survivability_mode_is_enabled(xe))
+		return 0;
 
+	if (err)
 		return err;
-	}
 
 	err = xe_info_init(xe, desc);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index cb813b337fd3..ed6599c5b85d 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -10,6 +10,7 @@
 #include <linux/pci.h>
 #include <linux/sysfs.h>
 
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_heci_gsc.h"
@@ -28,8 +29,12 @@
  * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
  * to be flashed through mei and collect telemetry. The driver's probe flow is modified
  * such that it enters survivability mode when pcode initialization is incomplete and boot status
- * denotes a failure. The driver then  populates the survivability_mode PCI sysfs indicating
- * survivability mode and provides additional information required for debug
+ * denotes a failure. Survivability mode can also be enabled manually by setting the
+ * survivability_mode attribute of the device in xe configfs. This is useful in cases where pcode
+ * does not detect failure, IFR (in-field-repair) use cases where the repair can be performed for
+ * a single GPU card without impacting the usage of other cards in the same node and for validation.
+ * The driver then populates the survivability_mode PCI sysfs indicating survivability mode and
+ * provides additional information required for debug
  *
  * KMD exposes below admin-only readable sysfs in survivability mode
  *
@@ -42,6 +47,15 @@
  *			      Overflow Information   - Provides history of previous failures
  *			      Auxiliary Information  - Certain failures may have information in
  *						       addition to postcode information
+ *
+ * Enable survivability mode through configfs
+ *
+ * Create device directory	: mkdir /config/xe/0000:03:00.0
+ * Unbind			: echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind
+ * Enable survivability mode	: echo 1 > /config/xe/0000:03:00.0/survivability_mode
+ * Bind				: echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind
+ *
+ * The card enters survivability mode if supported
  */
 
 static u32 aux_history_offset(u32 reg_value)
@@ -133,6 +147,7 @@ static void xe_survivability_mode_fini(void *arg)
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct device *dev = &pdev->dev;
 
+	xe_configfs_clear_survivability_mode(pdev);
 	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
 }
 
@@ -186,24 +201,30 @@ bool xe_survivability_mode_is_enabled(struct xe_device *xe)
 	return xe->survivability.mode;
 }
 
-/*
- * survivability_mode_requested - check if it's possible to enable
- * survivability mode and that was requested by firmware
+/**
+ * xe_survivability_mode_requested - check if it's possible to enable survivability
+ *				     mode that was requested by firmware or userspace
+ * @xe: xe device instance
  *
- * This function reads the boot status from Pcode.
+ * This function reads configfs and  boot status from Pcode.
  *
  * Return: true if platform support is available and boot status indicates
- * failure, false otherwise.
+ * failure or if survivability mode is requested, false otherwise.
  */
-static bool survivability_mode_requested(struct xe_device *xe)
+bool xe_survivability_mode_requested(struct xe_device *xe)
 {
 	struct xe_survivability *survivability = &xe->survivability;
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	u32 data;
 
 	if (!IS_DGFX(xe) || xe->info.platform < XE_BATTLEMAGE || IS_SRIOV_VF(xe))
 		return false;
 
+	/* Enable survivability mode if set via configfs */
+	if (xe_configfs_get_survivability_mode(pdev))
+		return true;
+
 	data = xe_mmio_read32(mmio, PCODE_SCRATCH(0));
 	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
 
@@ -226,7 +247,7 @@ int xe_survivability_mode_enable(struct xe_device *xe)
 	struct xe_survivability_info *info;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
-	if (!survivability_mode_requested(xe))
+	if (!xe_survivability_mode_requested(xe))
 		return 0;
 
 	survivability->size = MAX_SCRATCH_MMIO;
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
index d7e64885570d..70eaf56fb3bb 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.h
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
@@ -12,5 +12,5 @@ struct xe_device;
 
 int xe_survivability_mode_enable(struct xe_device *xe);
 bool xe_survivability_mode_is_enabled(struct xe_device *xe);
-
+bool xe_survivability_mode_requested(struct xe_device *xe);
 #endif /* _XE_SURVIVABILITY_MODE_H_ */
-- 
2.47.1

