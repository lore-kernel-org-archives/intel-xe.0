Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24817D3B7DD
	for <intel-xe@archiver.kernel.org>; Mon,  8 Dec 2025 08:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1AEA10E0C3;
	Mon,  8 Dec 2025 08:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dxw+WeYm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C0C10E3BB
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Dec 2025 08:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765181812; x=1796717812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uo/VI+OAGc/BV8vjTxy92TFNOmfcbpQ3HvgzRGouN5c=;
 b=Dxw+WeYmF8fYJ/CgzaY8LMYTO6HZbFCN3WEe+SLMqu0vD7aPfiUsGEAh
 Ia9poUuF4lS5xObM9CVQPHvNZy/eAZoZ+ebOd6barN/QnV1jwTMXdOpGU
 XPj1niPUcECOWFiq5etZ5z2fEma3JnxvIzB6GrrWzC2f/x9nPqU1ZgjYA
 mVqsdD7MjMXxs6t/Pc7wmgzzykg97TU+PVsq4AhWsm5eszdEFuCAGoqUu
 iG7OxGrgJeTO2+RLCzW6q3K4uzbB8hd726afUs03hAyM5uZ7yZrOJx0Ce
 rLQ8X/P1waiCtHug+LwSQJpkR42Rz7l5SMijyjkqvi0ryQXXzplokLjR+ A==;
X-CSE-ConnectionGUID: 4heEveARREarvn2x9gfJEA==
X-CSE-MsgGUID: gyyN1JJWR3OLk9PthUyiaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67081072"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="67081072"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 00:16:52 -0800
X-CSE-ConnectionGUID: MfL8OflOSiuAvwYq0ehs/g==
X-CSE-MsgGUID: URN2x7W5RTmrlaBrOVcH3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="195153017"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 00:16:49 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com
Subject: [PATCH v3 2/2] drm/xe/xe_survivability: Add support for survivability
 mode v2
Date: Mon,  8 Dec 2025 14:15:42 +0530
Message-ID: <20251208084539.3652902-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20251208084539.3652902-4-riana.tauro@intel.com>
References: <20251208084539.3652902-4-riana.tauro@intel.com>
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
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pcode_api.h             |  2 +
 drivers/gpu/drm/xe/xe_survivability_mode.c    | 44 ++++++++++++++++---
 .../gpu/drm/xe/xe_survivability_mode_types.h  |  6 +++
 3 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 70dcd6625680..975892d6b230 100644
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
index b6ff5da86a4d..7520d7b7f9b8 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -16,6 +16,7 @@
 #include "xe_heci_gsc.h"
 #include "xe_i2c.h"
 #include "xe_mmio.h"
+#include "xe_nvm.h"
 #include "xe_pcode_api.h"
 #include "xe_vsec.h"
 
@@ -79,6 +80,11 @@
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
@@ -109,6 +115,8 @@ static const char * const reg_map[] = {
 	[AUX_INFO4]               = "Auxiliary Info 4",
 };
 
+#define FDO_INFO	(MAX_SCRATCH_REG + 1)
+
 struct xe_survivability_attribute {
 	struct device_attribute attr;
 	u8 index;
@@ -142,6 +150,11 @@ static void populate_survivability_info(struct xe_device *xe)
 	set_survivability_info(mmio, info, CAPABILITY_INFO);
 	reg_value = info[CAPABILITY_INFO];
 
+	survivability->version = REG_FIELD_GET(BREADCRUMB_VERSION, reg_value);
+	/* FDO mode is exposed only from version 2 */
+	if (survivability->version >= 2)
+		survivability->fdo_mode = REG_FIELD_GET(FDO_MODE, reg_value);
+
 	if (reg_value & HISTORY_TRACKING) {
 		set_survivability_info(mmio, info, POSTCODE_TRACE);
 
@@ -203,6 +216,9 @@ static ssize_t survivability_info_show(struct device *dev,
 	struct xe_survivability *survivability = &xe->survivability;
 	u32 *info = survivability->info;
 
+	if (sa->index == FDO_INFO)
+		return sysfs_emit(buff, "%s\n", str_enabled_disabled(survivability->fdo_mode));
+
 	return sysfs_emit(buff, "0x%x\n", info[sa->index]);
 }
 
@@ -220,13 +236,18 @@ SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
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
 
@@ -237,7 +258,10 @@ static umode_t survivability_info_attrs_visible(struct kobject *kobj, struct att
 	struct xe_survivability *survivability = &xe->survivability;
 	u32 *info = survivability->info;
 
-	if (info[idx])
+	/* FDO mode is visible only when supported */
+	if (idx >= MAX_SCRATCH_REG && survivability->version >= 2)
+		return 0400;
+	else if (info[idx])
 		return 0400;
 
 	return 0;
@@ -253,6 +277,7 @@ static struct attribute *survivability_info_attrs[] = {
 	&attr_aux_info2.attr.attr,
 	&attr_aux_info3.attr.attr,
 	&attr_aux_info4.attr.attr,
+	&attr_fdo_mode.attr.attr,
 	NULL,
 };
 
@@ -302,12 +327,16 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
 	/* Make sure xe_heci_gsc_init() knows about survivability mode */
 	survivability->mode = true;
 
-	ret = xe_heci_gsc_init(xe);
-	if (ret)
-		goto err;
+	xe_heci_gsc_init(xe);
 
 	xe_vsec_init(xe);
 
+	if (survivability->fdo_mode) {
+		ret = xe_nvm_init(xe);
+		if (ret)
+			goto err;
+	}
+
 	ret = xe_i2c_probe(xe);
 	if (ret)
 		goto err;
@@ -317,6 +346,7 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
 	return 0;
 
 err:
+	dev_err(dev, "Failed to enable Survivability Mode\n");
 	survivability->mode = false;
 	return ret;
 }
@@ -423,8 +453,10 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
 
 	populate_survivability_info(xe);
 
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
index f31b3907d933..bd5dc1c955ff 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
+++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
@@ -44,6 +44,12 @@ struct xe_survivability {
 
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

