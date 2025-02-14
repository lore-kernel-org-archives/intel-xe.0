Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89519C02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 21:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E0F10ED44;
	Fri, 14 Feb 2025 21:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gwvy2yFp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61E910E08A
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 21:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739568224; x=1771104224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oWkwON+NofNkyvnphI+ZywUBMCEc/cOHBxgOKChRcLk=;
 b=Gwvy2yFpN5nUNVQ9fyh/N+Jt6ySVQgGQi3FafABzc1zRiC/cbNdTAOO6
 VGHxJz9fDHCnwVKGVIizP6amvShjalwDxQd9xXjzblFP/n8t0SEyOs1wE
 AS7EOgxQeGtZjAGyOehjnmV7lnsRIFzsdb2HwZhmm1ZEkhXp8iKg/SXJj
 w/XWuGW9XYLXyLgYvj24/6w6Ll+7rWxQT4/2JYsUIRfxzqCt3nRhhm4Fk
 sQu0PImNHAH/NqEdQAfnrUy+Xv3sdob3XsZW6kPZfBhmhx+EpiqmskhOd
 FPclgEstU4TfN/bcnR3+3iiRmjBP30m4pdy/radKRBuKBNhZVQixg5aQz A==;
X-CSE-ConnectionGUID: o6D1UZcGQD+L7EUnKV4Icg==
X-CSE-MsgGUID: djhDNiQhRmGr5qy4dt/77w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40447022"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40447022"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 13:23:44 -0800
X-CSE-ConnectionGUID: hCmFyitWQLCAjlX+gi/3XA==
X-CSE-MsgGUID: wk1A837WT8+bzR1Tm0SR0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="113757040"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 13:23:44 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH 6/9] drm/xe: Move survivability entirely to xe_pci
Date: Fri, 14 Feb 2025 13:23:10 -0800
Message-ID: <20250214212313.1767562-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214212313.1767562-1-lucas.demarchi@intel.com>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
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

There's an odd split between xe_pci.c and xe_device.c wrt
xe_survivability: it's initialized by xe_device, but then finalized by
xe_pci. Move it entirely to the outer layer, xe_pci, so it controls
the flow entirely.

This also allows to stop ignoring some of the errors. E.g.: if there's
an -ENOMEM, it shouldn't continue as if it survivability had been
enabled.

One change worth mentioning is that if "wait for lmem" fails, it will
also check the pcode status to decide if it should enter or not in
survivability mode, which it was not doing before. The bit from pcode
for that decision should remain the same after lmem failed
initialization, so it should be fine.

Cc: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c             |  7 +--
 drivers/gpu/drm/xe/xe_heci_gsc.c           |  2 +-
 drivers/gpu/drm/xe/xe_pci.c                | 16 ++---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 73 +++++++++++-----------
 drivers/gpu/drm/xe/xe_survivability_mode.h |  5 +-
 5 files changed, 48 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d88c0fddf0680..782ad564d0ba4 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -53,7 +53,6 @@
 #include "xe_pxp.h"
 #include "xe_query.h"
 #include "xe_sriov.h"
-#include "xe_survivability_mode.h"
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
@@ -695,12 +694,8 @@ int xe_device_probe_early(struct xe_device *xe)
 	update_device_info(xe);
 
 	err = xe_pcode_probe_early(xe);
-	if (err) {
-		if (xe_survivability_mode_required(xe))
-			xe_survivability_mode_init(xe);
-
+	if (err)
 		return err;
-	}
 
 	err = wait_for_lmem_ready(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index 06dc78d3a8123..992ee47abcdb7 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -201,7 +201,7 @@ void xe_heci_gsc_init(struct xe_device *xe)
 		return;
 	}
 
-	if (!def->use_polling && !xe_survivability_mode_enabled(xe)) {
+	if (!def->use_polling && !xe_survivability_mode_is_enabled(xe)) {
 		ret = heci_gsc_irq_setup(xe);
 		if (ret)
 			goto fail;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 447eacb355d7c..c18c58447d9fe 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -775,8 +775,8 @@ static void xe_pci_remove(struct pci_dev *pdev)
 	if (IS_SRIOV_PF(xe))
 		xe_pci_sriov_configure(pdev, 0);
 
-	if (xe_survivability_mode_enabled(xe))
-		return xe_survivability_mode_remove(xe);
+	if (xe_survivability_mode_is_enabled(xe))
+		return;
 
 	xe_device_remove(xe);
 	xe_pm_runtime_fini(xe);
@@ -851,13 +851,13 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	err = xe_device_probe_early(xe);
 
 	/*
-	 * In Boot Survivability mode, no drm card is exposed
-	 * and driver is loaded with bare minimum to allow
-	 * for firmware to be flashed through mei. Return
-	 * success if survivability mode is enabled.
+	 * In Boot Survivability mode, no drm card is exposed and driver is
+	 * loaded with bare minimum to allow for firmware to be flashed through
+	 * mei. Return success if survivability mode is enabled.
 	 */
 	if (err) {
-		if (xe_survivability_mode_enabled(xe))
+		if (xe_survivability_mode_required(xe) &&
+		    xe_survivability_mode_enable(xe))
 			return 0;
 
 		return err;
@@ -951,7 +951,7 @@ static int xe_pci_suspend(struct device *dev)
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	int err;
 
-	if (xe_survivability_mode_enabled(xe))
+	if (xe_survivability_mode_is_enabled(xe))
 		return -EBUSY;
 
 	err = xe_pm_suspend(xe);
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 04a341606a7c5..7ba02e085b5b1 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -127,40 +127,54 @@ static ssize_t survivability_mode_show(struct device *dev,
 
 static DEVICE_ATTR_ADMIN_RO(survivability_mode);
 
-static void enable_survivability_mode(struct pci_dev *pdev)
+static void xe_survivability_mode_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct device *dev = &pdev->dev;
+
+	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
+	xe_heci_gsc_fini(xe);
+}
+
+static int enable_survivability_mode(struct pci_dev *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	struct xe_survivability *survivability = &xe->survivability;
 	int ret = 0;
 
-	/* set survivability mode */
-	survivability->mode = true;
-	dev_info(dev, "In Survivability Mode\n");
-
 	/* create survivability mode sysfs */
 	ret = sysfs_create_file(&dev->kobj, &dev_attr_survivability_mode.attr);
 	if (ret) {
 		dev_warn(dev, "Failed to create survivability sysfs files\n");
-		return;
+		return ret;
 	}
 
+	ret = devm_add_action_or_reset(xe->drm.dev,
+				       xe_survivability_mode_fini, xe);
+	if (ret)
+		return ret;
+
 	xe_heci_gsc_init(xe);
 
 	xe_vsec_init(xe);
+
+	survivability->mode = true;
+	dev_err(dev, "In Survivability Mode\n");
+
+	return 0;
 }
 
 /**
- * xe_survivability_mode_enabled - check if survivability mode is enabled
+ * xe_survivability_mode_is_enabled - check if survivability mode is enabled
  * @xe: xe device instance
  *
  * Returns true if in survivability mode, false otherwise
  */
-bool xe_survivability_mode_enabled(struct xe_device *xe)
+bool xe_survivability_mode_is_enabled(struct xe_device *xe)
 {
-	struct xe_survivability *survivability = &xe->survivability;
-
-	return survivability->mode;
+	return xe->survivability.mode;
 }
 
 /**
@@ -183,34 +197,19 @@ bool xe_survivability_mode_required(struct xe_device *xe)
 	data = xe_mmio_read32(mmio, PCODE_SCRATCH(0));
 	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
 
-	return (survivability->boot_status == NON_CRITICAL_FAILURE ||
-		survivability->boot_status == CRITICAL_FAILURE);
+	return survivability->boot_status == NON_CRITICAL_FAILURE ||
+		survivability->boot_status == CRITICAL_FAILURE;
 }
 
 /**
- * xe_survivability_mode_remove - remove survivability mode
+ * xe_survivability_mode_enable - Initialize and enable the survivability mode
  * @xe: xe device instance
  *
- * clean up sysfs entries of survivability mode
- */
-void xe_survivability_mode_remove(struct xe_device *xe)
-{
-	struct xe_survivability *survivability = &xe->survivability;
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	struct device *dev = &pdev->dev;
-
-	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
-	xe_heci_gsc_fini(xe);
-	kfree(survivability->info);
-}
-
-/**
- * xe_survivability_mode_init - Initialize the survivability mode
- * @xe: xe device instance
+ * Initialize survivability information and enable survivability mode
  *
- * Initializes survivability information and enables survivability mode
+ * Return: 0 for success, negative error code otherwise.
  */
-void xe_survivability_mode_init(struct xe_device *xe)
+int xe_survivability_mode_enable(struct xe_device *xe)
 {
 	struct xe_survivability *survivability = &xe->survivability;
 	struct xe_survivability_info *info;
@@ -218,9 +217,10 @@ void xe_survivability_mode_init(struct xe_device *xe)
 
 	survivability->size = MAX_SCRATCH_MMIO;
 
-	info = kcalloc(survivability->size, sizeof(*info), GFP_KERNEL);
+	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
+			    GFP_KERNEL);
 	if (!info)
-		return;
+		return -ENOMEM;
 
 	survivability->info = info;
 
@@ -229,9 +229,8 @@ void xe_survivability_mode_init(struct xe_device *xe)
 	/* Only log debug information and exit if it is a critical failure */
 	if (survivability->boot_status == CRITICAL_FAILURE) {
 		log_survivability_info(pdev);
-		kfree(survivability->info);
-		return;
+		return -ENXIO;
 	}
 
-	enable_survivability_mode(pdev);
+	return enable_survivability_mode(pdev);
 }
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
index f530507a22c62..f4df5f9025ce8 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.h
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
@@ -10,9 +10,8 @@
 
 struct xe_device;
 
-void xe_survivability_mode_init(struct xe_device *xe);
-void xe_survivability_mode_remove(struct xe_device *xe);
-bool xe_survivability_mode_enabled(struct xe_device *xe);
+int xe_survivability_mode_enable(struct xe_device *xe);
+bool xe_survivability_mode_is_enabled(struct xe_device *xe);
 bool xe_survivability_mode_required(struct xe_device *xe);
 
 #endif /* _XE_SURVIVABILITY_MODE_H_ */
-- 
2.48.1

