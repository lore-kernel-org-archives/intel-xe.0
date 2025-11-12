Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F18CCF9F8
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 10:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F2210E6D9;
	Wed, 12 Nov 2025 10:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QsKzF//F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC0110E1C6
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 10:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762941907; x=1794477907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ho3oB9hUMun2ULOP7uvAZ3EhmLxMI+WAkArMDBrI26A=;
 b=QsKzF//FRbbvZkLqSPtzvwJBDxeqmUvoJGNDUwJG6mLzOPlUN+AqEgvt
 YsgaG+veG+QHxJcIyppZM/VRVeFqNJkUqEhV5wwj+V8NvATazE14SQOL1
 biBlGf5W7nse6cRMKPPxfRoTodqGzWUHEfKL3YK4ihQ4oRGqgSGPu7SyD
 oiAWjPWlZZmat3w2tEhPc+6lPDLeIqRTI0fSxpZye9UztqZnyoTP10HrQ
 d/cYW3swPqx5HKbpx3HNJcp8IsuMklAsVjVDs20awRxmJ2C1ZoA6rqMst
 nAJXYVjrx4hSv7mHSEEJMHsIxRAwaMVNCzIfQQDx4ifJmV2VWNEG341c8 Q==;
X-CSE-ConnectionGUID: QnmBDuALTn298vDH3+Zd+Q==
X-CSE-MsgGUID: 3au2++YMQseGHedrVwQZUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75307808"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="75307808"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 02:05:06 -0800
X-CSE-ConnectionGUID: rLgjlgR2RkqkyDJ4DHfGpg==
X-CSE-MsgGUID: /YrS/mjfRDeOapxp+PFBLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="219908742"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 02:05:04 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, badal.nilawar@intel.com
Subject: [PATCH 2/2] drm/xe/xe_survivability: Add support for survivability
 mode v2
Date: Wed, 12 Nov 2025 16:03:39 +0530
Message-ID: <20251112103336.1468261-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20251112103336.1468261-4-riana.tauro@intel.com>
References: <20251112103336.1468261-4-riana.tauro@intel.com>
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

Userspace should check FDO mode entry in survivability info sysfs before
using the SPI driver to update firmware.

	/sys/bus/pci/devices/<device>/survivability_info/fdo_mode

v2 also supports survivability mode for critical boot errors.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode_api.h             |  2 +
 drivers/gpu/drm/xe/xe_survivability_mode.c    | 41 +++++++++++++++++--
 .../gpu/drm/xe/xe_survivability_mode_types.h  |  6 +++
 3 files changed, 46 insertions(+), 3 deletions(-)

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
index 3d9417911c33..d22fdd08d227 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -16,6 +16,7 @@
 #include "xe_heci_gsc.h"
 #include "xe_i2c.h"
 #include "xe_mmio.h"
+#include "xe_nvm.h"
 #include "xe_pcode_api.h"
 #include "xe_vsec.h"
 
@@ -66,6 +67,11 @@
  *
  * - ``aux_info<n>`` : Some failures have additional debug information
  *
+ * - ``fdo_mode`` : To allow recovery in scenarios where MEI itself fails, a new SPI Flash
+ *   Descriptor Override (FDO) mode is added in v2 survivability breadcrumbs. This mode is enabled
+ *   by PCODE and provides the ability to directly update the firmware via SPI Driver without
+ *   any dependency on MEI. Xe KMD initializes the nvm aux driver if FDO mode is enabled.
+ *
  * Runtime Survivability
  * =====================
  *
@@ -95,6 +101,8 @@ enum scratch_reg {
 	MAX_SCRATCH_REG,
 };
 
+#define FDO_INFO	(MAX_SCRATCH_REG + 1)
+
 struct xe_survivability_attribute {
 	struct device_attribute attr;
 	u8 index;
@@ -131,6 +139,11 @@ static void populate_survivability_info(struct xe_device *xe)
 	set_survivability_info(mmio, info, CAPABILITY_INFO, "Capability Info");
 	reg_value = info[CAPABILITY_INFO].value;
 
+	survivability->version = REG_FIELD_GET(BREADCRUMB_VERSION, reg_value);
+	/* FDO mode is exposed only from version 2 */
+	if (survivability->version >= 2)
+		survivability->fdo_mode = REG_FIELD_GET(FDO_MODE, reg_value);
+
 	if (reg_value & HISTORY_TRACKING) {
 		set_survivability_info(mmio, info, POSTCODE_TRACE, "Postcode Trace");
 
@@ -193,6 +206,9 @@ static ssize_t survivability_info_show(struct device *dev,
 	struct xe_survivability_info *info = survivability->info;
 	struct xe_survivability_attribute *sa = dev_attr_to_survivability_attr(attr);
 
+	if (sa->index == FDO_INFO)
+		return sysfs_emit(buff, "%s\n", str_enabled_disabled(survivability->fdo_mode));
+
 	return sysfs_emit(buff, "0x%x\n", info[sa->index].value);
 }
 
@@ -210,13 +226,18 @@ SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
 SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
 SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
 SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
+SURVIVABILITY_ATTR_RO(fdo_mode, FDO_INFO);
 
 static void xe_survivability_mode_fini(void *arg)
 {
 	struct xe_device *xe = arg;
+	struct xe_survivability *survivability = &xe->survivability;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct device *dev = &pdev->dev;
 
+	if (survivability->fdo_mode)
+		xe_nvm_fini(xe);
+
 	device_remove_file(dev, &dev_attr_survivability_mode);
 }
 
@@ -227,12 +248,16 @@ static umode_t survivability_info_attrs_visible(struct kobject *kobj, struct att
 	struct xe_survivability *survivability = &xe->survivability;
 	struct xe_survivability_info *info = survivability->info;
 
-	if (info[idx].value)
+	/* FDO mode is visible only when supported */
+	if (idx >= MAX_SCRATCH_REG && survivability->version >= 2)
+		return 0400;
+	else if (info[idx].value)
 		return 0400;
 
 	return 0;
 }
 
+/* Attributes are ordered according to enum scratch_reg */
 static struct attribute *survivability_info_attrs[] = {
 	&attr_capability_info.attr.attr,
 	&attr_postcode_trace.attr.attr,
@@ -242,6 +267,7 @@ static struct attribute *survivability_info_attrs[] = {
 	&attr_aux_info2.attr.attr,
 	&attr_aux_info3.attr.attr,
 	&attr_aux_info4.attr.attr,
+	&attr_fdo_mode.attr.attr,
 	NULL,
 };
 
@@ -301,11 +327,18 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
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
@@ -436,8 +469,10 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
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
index 1ed122cf62f2..d887b443b397 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
+++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
@@ -37,6 +37,12 @@ struct xe_survivability {
 
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

