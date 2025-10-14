Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1926FCCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 05:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C3310E531;
	Tue, 14 Oct 2025 05:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MxL6oGtY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED00C10E531
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 05:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760418382; x=1791954382;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BiSJfYJub+rWCa+WYby9aF3A2lMdYidt6M/bCs3eqdc=;
 b=MxL6oGtYPnnp5thGpOXmx240JAPlsOzPfPFHw5Ox/OH2iFjdaAEcl7BS
 1sD4SierKlV0LR8txg/qqjRDU4oaGJhcz1U7gBmSn+0DCukIbBjRtINkR
 EGqcLegjYRSQOYXxIyfc7syYemzsMBqNRN8gPeRh7SOOShHslSlLNwiK3
 JxL83OGC7ngMGOk2GaOwlvd4cs/hPJylVRkV0h8AlnxcUy1buMZchGkdo
 jXL9uJOlM5Xqp54aFSLYpoN0QUTXdm7mpTTigAFZpgnmEFC04GJP2yFaU
 zhALJJd4PkGehJTnVNa6N0ZEc5tzMrjduhetAPT4/WsnSNwuyujtWEVrH Q==;
X-CSE-ConnectionGUID: 4xivZAkjQomUplOZj0lAkg==
X-CSE-MsgGUID: tTfsPmz/Q1KlcQSh8KRsUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62459084"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="62459084"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 22:06:22 -0700
X-CSE-ConnectionGUID: k6UjG5MbR0CndsaqxjzVzg==
X-CSE-MsgGUID: zYBZm5+pR6CPdvVFIppU1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="182559956"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 22:06:20 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH] drm/xe/xe_survivability: Add support for survivability mode v2
Date: Tue, 14 Oct 2025 11:02:58 +0530
Message-ID: <20251014053257.3417575-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

v2 survivability breadcrumbs introduces a new mode called
SPI Flash Descriptor Override mode (FDO). This is enabled by
PCODE when MEI itself fails and firmware cannot be updated via
MEI using igsc. This mode provides the ability to update
the firmware directly via SPI driver.

Xe KMD initializes the nvm aux driver if FDO mode is enabled.

Userspace should check FDO mode entry in survivability sysfs before
using the SPI driver to update firmware.

v2 also supports survivability mode for critical boot errors.

	cat /sys/bus/pci/devices/0000\:03\:00.0/survivability_mode

               Capability Info: 0x138320 - 0x2001ae06
               Postcode Info: 0x138324 - 0x0
               Overflow Info: 0x138328 - 0x0
               Auxiliary Info 0: 0x13832c - 0x0
               FDO Mode: enabled

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode_api.h             |  2 ++
 drivers/gpu/drm/xe/xe_survivability_mode.c    | 32 +++++++++++++++++--
 .../gpu/drm/xe/xe_survivability_mode_types.h  |  6 ++++
 3 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 92bfcba51e19..d41f07f9194d 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -77,11 +77,13 @@
 
 #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
 /* PCODE_SCRATCH0 */
+#define   BREADCRUMB_VERSION		REG_GENMASK(31, 29)
 #define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
 #define   OVERFLOW_REG_OFFSET		REG_GENMASK(14, 12)
 #define   HISTORY_TRACKING		REG_BIT(11)
 #define   OVERFLOW_SUPPORT		REG_BIT(10)
 #define   AUXINFO_SUPPORT		REG_BIT(9)
+#define   FDO_MODE			REG_BIT(4)
 #define   BOOT_STATUS			REG_GENMASK(3, 1)
 #define      CRITICAL_FAILURE		4
 #define      NON_CRITICAL_FAILURE	7
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 1662bfddd4bc..1c9421651548 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -16,6 +16,7 @@
 #include "xe_heci_gsc.h"
 #include "xe_i2c.h"
 #include "xe_mmio.h"
+#include "xe_nvm.h"
 #include "xe_pcode_api.h"
 #include "xe_vsec.h"
 
@@ -61,6 +62,12 @@
  *	Provides history of previous failures
  * Auxiliary Information
  *	Certain failures may have information in addition to postcode information
+ * FDO Mode
+ *	To allow recovery in scenarios where MEI itself fails, a new SPI Flash Descriptor
+ *	Override (FDO) mode is added in v2 survivability breadcrumbs. This mode is enabled
+ *	by PCODE and provides the ability to directly update the firmware via SPI Driver without
+ *	any dependency on MEI.
+ *	Xe KMD initializes the nvm aux driver if FDO mode is enabled.
  *
  * Runtime Survivability
  * =====================
@@ -105,6 +112,11 @@ static void populate_survivability_info(struct xe_device *xe)
 	set_survivability_info(mmio, info, id, "Capability Info");
 	reg_value = info[id].value;
 
+	survivability->version = REG_FIELD_GET(BREADCRUMB_VERSION, reg_value);
+	/* FDO mode is exposed only from version 2 */
+	if (survivability->version >= 2)
+		survivability->fdo_mode = REG_FIELD_GET(FDO_MODE, reg_value);
+
 	if (reg_value & HISTORY_TRACKING) {
 		id++;
 		set_survivability_info(mmio, info, id, "Postcode Info");
@@ -171,6 +183,9 @@ static ssize_t survivability_mode_show(struct device *dev,
 					       info[index].reg, info[index].value);
 	}
 
+	if (survivability->version >= 2)
+		count += sysfs_emit_at(buff, count, "FDO Mode: %s\n",
+				       str_enabled_disabled(survivability->fdo_mode));
 	return count;
 }
 
@@ -179,9 +194,13 @@ static DEVICE_ATTR_ADMIN_RO(survivability_mode);
 static void xe_survivability_mode_fini(void *arg)
 {
 	struct xe_device *xe = arg;
+	struct xe_survivability *survivability = &xe->survivability;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct device *dev = &pdev->dev;
 
+	if (survivability->fdo_mode)
+		xe_nvm_fini(xe);
+
 	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
 }
 
@@ -230,11 +249,18 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
 	if (ret)
 		goto err;
 
+	if (survivability->fdo_mode) {
+		ret = xe_nvm_init(xe);
+		if (ret)
+			goto err;
+	}
+
 	dev_err(dev, "In Survivability Mode\n");
 
 	return 0;
 
 err:
+	dev_err(dev, "Failed to enable Survivability Mode\n");
 	survivability->mode = false;
 	return ret;
 }
@@ -365,8 +391,10 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
 	if (ret)
 		return ret;
 
-	/* Log breadcrumbs but do not enter survivability mode for Critical boot errors */
-	if (survivability->boot_status == CRITICAL_FAILURE) {
+	/*
+	 * v2 supports survivability mode for critical errors
+	 */
+	if (survivability->version < 2  && survivability->boot_status == CRITICAL_FAILURE) {
 		log_survivability_info(pdev);
 		return -ENXIO;
 	}
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
index cd65a5d167c9..379d90759c28 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
+++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
@@ -38,6 +38,12 @@ struct xe_survivability {
 
 	/** @type: survivability type */
 	enum xe_survivability_type type;
+
+	/** @fdo_mode: indicates if FDO mode is enabled */
+	bool fdo_mode;
+
+	/** @version: breadcrumb version of survivability mode  */
+	u8 version;
 };
 
 #endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
-- 
2.47.1

