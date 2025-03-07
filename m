Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F79BC282DE
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 14:03:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3779910EBC1;
	Fri,  7 Mar 2025 14:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RiqkLmqX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FB710EBC1
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 14:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741356222; x=1772892222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0g5v0puExHUF8MluEDMUbD3lwagLP167GNQhHgYIrHQ=;
 b=RiqkLmqXh8WsWg66ISkde2DsCLHOCP26MFbs1oEXsnyevGfyz1kwzKm0
 2qfvbH+mvc/wBdDtlcMn7/hRAWAUM30UYfQscL8b/5yI0eyoJ2Zg5oX8T
 Ml0miTtmrKQ5DjJAm9EGJOE6dhGn+sj/PKcy9wVdL2uasJqGNB2JdzrDB
 QGKYwuGHMPqqTHdApQsCrfpkflfwerXkPMiG6vbxZPvV00bqt1/lCvVKe
 hiATVkRETJKTYwXZy1hGjYl2NxVdaE6+DpAcW+jq+gAhP5i0gEvk0Fkmq
 URJEHOakW5eaVgkhVzqBh0BevyhTAEktWje9Jncrc+pPfG8XAOhp+0HeV w==;
X-CSE-ConnectionGUID: tyUHNSlVRTKCj+khTU3m+A==
X-CSE-MsgGUID: 65kwF6H0T3OcKNXfPOQqiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59961430"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="59961430"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 06:03:41 -0800
X-CSE-ConnectionGUID: S0O5Gk3ySUK2xPTS+rD3Yw==
X-CSE-MsgGUID: Vc4PcSL8Q/68sXSkaITz7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124553009"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 06:03:39 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, lucas.demarchi@intel.com
Subject: [PATCH 2/2] RFC drm/xe: Enable configfs support for survivability mode
Date: Fri,  7 Mar 2025 19:54:45 +0530
Message-ID: <20250307142446.1790715-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250307142446.1790715-1-riana.tauro@intel.com>
References: <20250307142446.1790715-1-riana.tauro@intel.com>
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

Register a configfs subsystem called 'xe' to userspace that allows
users to modify the exposed attributes. Expose survivability mode as
an attribute that can be modified manually. This is useful if
pcode fails to detect survivability mode and for validation

To enable survivability mode for a card,

echo "domain:bus:dev.fn" > /sys/bus/pci/drivers/xe/unbind
echo "domain:bus:dev.fn" > sys/kernel/config/xe/survivability_mode
echo "domain:bus:dev.fn" > /sys/bus/pci/drivers/xe/bind

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c           | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h           |  6 +++++-
 drivers/gpu/drm/xe/xe_pci.c                |  8 ++++----
 drivers/gpu/drm/xe/xe_survivability_mode.c | 21 +++++++++++++++++++--
 4 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 8c5f248e466d..ce9f3757100f 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -6,6 +6,7 @@
 #include <linux/configfs.h>
 #include <linux/init.h>
 #include <linux/module.h>
+#include <linux/pci.h>
 
 #include "xe_configfs.h"
 #include "xe_module.h"
@@ -28,6 +29,27 @@ void xe_configfs_clear_survivability_mode(void)
 	xe_modparam.survivability_mode = NULL;
 }
 
+bool xe_configfs_survivability_mode_enabled(struct pci_dev *pdev)
+{
+	unsigned int domain, bus, slot, function;
+	int ret = 0;
+
+	if (!xe_modparam.survivability_mode)
+		goto err;
+
+	ret = sscanf(xe_modparam.survivability_mode, "%04x:%02x:%02x.%x", &domain, &bus,
+		     &slot, &function);
+	if (ret != 4)
+		goto err;
+
+	if ((pci_domain_nr(pdev->bus) == domain) && (pdev->bus->number == bus) &&
+	    (PCI_SLOT(pdev->devfn) == slot) && (PCI_FUNC(pdev->devfn) == function))
+		return true;
+
+err:
+	return false;
+}
+
 static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
 {
 	char *survivability_mode;
diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 491629a2ca53..b03f4c7d0f54 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -5,8 +5,12 @@
 #ifndef _XE_CONFIGFS_H_
 #define _XE_CONFIGFS_H_
 
+#include <linux/types.h>
+
+struct pci_dev;
+
 int xe_configfs_init(void);
 void xe_configfs_exit(void);
 void xe_configfs_clear_survivability_mode(void);
-
+bool xe_configfs_survivability_mode_enabled(struct pci_dev *pdev);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 4d982a5a4ffd..d0f66cc08aa5 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -17,6 +17,7 @@
 
 #include "display/xe_display.h"
 #include "regs/xe_gt_regs.h"
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_drv.h"
 #include "xe_gt.h"
@@ -815,10 +816,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	 * mei. If early probe fails, check if survivability mode is flagged by
 	 * HW to be enabled. In that case enable it and return success.
 	 */
-	if (err) {
-		if (xe_survivability_mode_required(xe) &&
-		    xe_survivability_mode_enable(xe))
-			return 0;
+	if (xe_configfs_survivability_mode_enabled(pdev) || err) {
+		if (xe_survivability_mode_required(xe))
+			return xe_survivability_mode_enable(xe);
 
 		return err;
 	}
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index d939ce70e6fa..5b60cbf8f7cb 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -10,6 +10,7 @@
 #include <linux/pci.h>
 #include <linux/sysfs.h>
 
+#include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_heci_gsc.h"
@@ -28,8 +29,10 @@
  * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
  * to be flashed through mei and collect telemetry. The driver's probe flow is modified
  * such that it enters survivability mode when pcode initialization is incomplete and boot status
- * denotes a failure. The driver then  populates the survivability_mode PCI sysfs indicating
- * survivability mode and provides additional information required for debug
+ * denotes a failure. Survivability mode can also be enabled manually by writing the pci address of
+ * the card to the xe configfs attribute. This is useful in cases where pcode does not detect
+ * failure and for validation. The driver then  populates the survivability_mode PCI sysfs
+ * indicating survivability mode and provides additional information required for debug
  *
  * KMD exposes below admin-only readable sysfs in survivability mode
  *
@@ -42,6 +45,15 @@
  *			      Overflow Information   - Provides history of previous failures
  *			      Auxiliary Information  - Certain failures may have information in
  *						       addition to postcode information
+ * Enable survivability mode through configfs
+ *
+ * survivability mode is exposed as an attribute under the xe configfs subsystem. User can specify
+ * the card that needs to enter survivability mode.
+ *
+ * echo "domain:bus:dev.fn" > /sys/bus/pci/drivers/xe/unbind
+ * echo "domain:bus:dev.fn" > sys/kernel/config/xe/survivability_mode
+ * echo "domain:bus:dev.fn" > /sys/bus/pci/drivers/xe/bind
+ *
  */
 
 static u32 aux_history_offset(u32 reg_value)
@@ -133,6 +145,7 @@ static void xe_survivability_mode_fini(void *arg)
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct device *dev = &pdev->dev;
 
+	xe_configfs_clear_survivability_mode();
 	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
 }
 
@@ -190,11 +203,15 @@ bool xe_survivability_mode_required(struct xe_device *xe)
 {
 	struct xe_survivability *survivability = &xe->survivability;
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	u32 data;
 
 	if (!IS_DGFX(xe) || xe->info.platform < XE_BATTLEMAGE || IS_SRIOV_VF(xe))
 		return false;
 
+	if (xe_configfs_survivability_mode_enabled(pdev))
+		return true;
+
 	data = xe_mmio_read32(mmio, PCODE_SCRATCH(0));
 	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
 
-- 
2.47.1

