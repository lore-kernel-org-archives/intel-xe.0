Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067F3C369A3
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 04:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC27D10E00C;
	Mon,  7 Apr 2025 04:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VpfAPgZj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B6510E1BB
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 04:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744001555; x=1775537555;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o7T/O5DRYOphHeIQMHe3VtOR6YSfvIyo+C5WymbtW88=;
 b=VpfAPgZjUZdixDaN9MlUCICu4257gLpH5L+GoZSQ17e8Sdd3MO9LCXcV
 XJnhUGpSDIMa/w6PngWfJdu4avbYtUS0M6WGTeh0cT+nEp4jhHfs7C7ag
 hgMIBeZ3ge1gJ7JbDGDLtd4lMTIVWem5IHGnuP6dBI2L3u5zCyAyB4oSl
 yZUvO/Ru8EzMXDbiqh7RBGq8G4lyAvF1coR76ZciDqvTQu4iq0sXh6i/g
 jKy+MqVhrEWbGI7uME0yp0tluTkTtBDrZ7XQUDEcFarNAbhOZaViAuDg5
 l9tpnhUmX29tuZrBxHgPrHdewqtNu0+UFs1pZxEx+hayPI/EVr8pM26Hd A==;
X-CSE-ConnectionGUID: SSCfPH9gQa+yBPEeBUbgVQ==
X-CSE-MsgGUID: kyjxo5ojTUiXk7B8obLQag==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56002470"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="56002470"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 21:52:35 -0700
X-CSE-ConnectionGUID: XdlMNMaYT4yLLDvP+Pg2jg==
X-CSE-MsgGUID: IvuwGJ9/Qj67hb3iWb7LbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="128697770"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 21:52:33 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, matthew.d.roper@intel.com,
 aravind.iddamsetty@linux.intel.com
Subject: [PATCH v4 3/3] drm/xe: Enable configfs support for survivability mode
Date: Mon,  7 Apr 2025 10:44:13 +0530
Message-ID: <20250407051414.1651616-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250407051414.1651616-1-riana.tauro@intel.com>
References: <20250407051414.1651616-1-riana.tauro@intel.com>
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
Enabling survivability mode manually is useful in cases where pcode does
not detect failure, validation and for IFR (in-field-repair).

To set configfs survivability mode attribute for a device

echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode

The card enters survivability mode if supported

v2: add a log if survivability mode is enabled for unsupported
    platforms (Rodrigo)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c           | 62 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h           |  8 +++
 drivers/gpu/drm/xe/xe_device.c             |  2 +-
 drivers/gpu/drm/xe/xe_pci.c                | 19 ++++---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 35 +++++++++---
 drivers/gpu/drm/xe/xe_survivability_mode.h |  1 +
 6 files changed, 108 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 48a9f428bda9..cb9f175c89a1 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -164,6 +164,68 @@ static struct configfs_subsystem xe_configfs = {
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
index 5532320818e4..d7d041ec2611 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -5,12 +5,20 @@
 #ifndef _XE_CONFIGFS_H_
 #define _XE_CONFIGFS_H_
 
+#include <linux/types.h>
+
+struct pci_dev;
+
 #if IS_ENABLED(CONFIG_CONFIGFS_FS)
 int xe_configfs_init(void);
 void xe_configfs_exit(void);
+bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
+void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
 #else
 static inline int xe_configfs_init(void) { return 0; };
 static inline void xe_configfs_exit(void) {};
+static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; };
+static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) {};
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d8e227ddf255..75e753e0a682 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -712,7 +712,7 @@ int xe_device_probe_early(struct xe_device *xe)
 	sriov_update_device_info(xe);
 
 	err = xe_pcode_probe_early(xe);
-	if (err) {
+	if (err || xe_survivability_mode_is_requested(xe)) {
 		int save_err = err;
 
 		/*
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 772b6c81672c..1d83d88cde90 100644
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
index 399c06890b0b..1f710b3fc599 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -10,6 +10,7 @@
 #include <linux/pci.h>
 #include <linux/sysfs.h>
 
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_heci_gsc.h"
@@ -145,6 +146,7 @@ static void xe_survivability_mode_fini(void *arg)
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct device *dev = &pdev->dev;
 
+	xe_configfs_clear_survivability_mode(pdev);
 	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
 }
 
@@ -198,23 +200,40 @@ bool xe_survivability_mode_is_enabled(struct xe_device *xe)
 	return xe->survivability.mode;
 }
 
-/*
- * survivability_mode_requested - check if it's possible to enable
- * survivability mode and that was requested by firmware
+/**
+ * xe_survivability_mode_is_requested - check if it's possible to enable survivability
+ *					mode that was requested by firmware or userspace
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
+bool xe_survivability_mode_is_requested(struct xe_device *xe)
 {
 	struct xe_survivability *survivability = &xe->survivability;
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	u32 data;
+	bool survivability_mode;
+
+	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
+		return false;
+
+	survivability_mode = xe_configfs_get_survivability_mode(pdev);
 
-	if (!IS_DGFX(xe) || xe->info.platform < XE_BATTLEMAGE || IS_SRIOV_VF(xe))
+	if (xe->info.platform < XE_BATTLEMAGE) {
+		if (survivability_mode) {
+			dev_err(&pdev->dev, "Survivability Mode is not supported on this card\n");
+			xe_configfs_clear_survivability_mode(pdev);
+		}
 		return false;
+	}
+
+	/* Enable survivability mode if set via configfs */
+	if (survivability_mode)
+		return true;
 
 	data = xe_mmio_read32(mmio, PCODE_SCRATCH(0));
 	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
@@ -238,7 +257,7 @@ int xe_survivability_mode_enable(struct xe_device *xe)
 	struct xe_survivability_info *info;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
-	if (!survivability_mode_requested(xe))
+	if (!xe_survivability_mode_is_requested(xe))
 		return 0;
 
 	survivability->size = MAX_SCRATCH_MMIO;
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
index d7e64885570d..02231c2bf008 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.h
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
@@ -12,5 +12,6 @@ struct xe_device;
 
 int xe_survivability_mode_enable(struct xe_device *xe);
 bool xe_survivability_mode_is_enabled(struct xe_device *xe);
+bool xe_survivability_mode_is_requested(struct xe_device *xe);
 
 #endif /* _XE_SURVIVABILITY_MODE_H_ */
-- 
2.47.1

