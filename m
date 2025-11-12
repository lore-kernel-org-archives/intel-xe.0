Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7B5CD13D2
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 10:05:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F3610E1B3;
	Wed, 12 Nov 2025 10:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nX/ZGTHA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4073E10E1C6
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 10:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762941905; x=1794477905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RVe1sDOy5I+euGSwt/yDGOWzijsWaWSBWMB6Wa9qMR0=;
 b=nX/ZGTHAYHuz/DwLoobo7PfTH4dhhr55z8czaGlNpvjfDtwJ4WEqavv/
 MHZK/Mb8r19gCyCgFHxfTrrElLmPYu7kQdBj4f8MdCY1S3yNqoVTS2Sta
 CM/duKPXF8rMQz9OfkCIgh5OKjVSRdKwmIvo6XNVNddGovCyjsTfKy+Ax
 zT8iYvpEntri7blXwbYF/6MpAIkxTx0IsNfFUQwl7Q4zr/HM8j2Ar+4YI
 O6xdUSwoUCTmOgBwcqbw1Ov8roWqxHUrCszGocEMAbQGHqchfjoCUOKty
 omDP8zfcfTc6Q8rEAeXBZRc6An+LK9cJa5eNp8IR1p9kYRpXQFBZbBE4R g==;
X-CSE-ConnectionGUID: m1XulUgWTJ6AlfHpZPOzbw==
X-CSE-MsgGUID: PGaaND2gSTCn141HdMwV2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75307805"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="75307805"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 02:05:04 -0800
X-CSE-ConnectionGUID: 7EqAmNEKRHenME47dmp1Pg==
X-CSE-MsgGUID: l0ASPYpHTJSHtc8BFHXiEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="219908722"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 02:05:02 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, badal.nilawar@intel.com
Subject: [PATCH 1/2] drm/xe/xe_survivability: Redesign survivability mode
 sysfs entries
Date: Wed, 12 Nov 2025 16:03:38 +0530
Message-ID: <20251112103336.1468261-5-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20251112103336.1468261-4-riana.tauro@intel.com>
References: <20251112103336.1468261-4-riana.tauro@intel.com>
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

Redesign survivability mode to have only one value per file.

1) Retain the survivability_mode sysfs to indicate the type

	cat /sys/bus/pci/devices/0000\:03\:00.0/survivability_mode
	(Boot / Runtime)

2) Add survivability_info directory to expose boot breadcrumbs.
Entries in survivability mode sysfs are only visible when
boot breadcrumb registers are populated.

	/sys/bus/pci/devices/0000:03:00.0/survivability_info
	├── aux_info0
	├── aux_info1
	├── aux_info2
	├── aux_info3
	├── aux_info4
	├── capability_info
	├── postcode_trace
	└── postcode_trace_overflow

Capability_info:

	Provides data about boot status and has bits that
	indicate the support for the other breadcrumbs

Postcode Trace / Postcode Trace Overflow :

	Each postcode is represented as an 8-bit value and represents
	a boot failure event. When a new failure event is logged by Pcode
	the existing postcodes are shifted left. These entries provide a
	history of 8 postcodes.

Auxiliary Info:

	Some failures have additional debug information.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c    | 159 +++++++++++++-----
 .../gpu/drm/xe/xe_survivability_mode_types.h  |   1 -
 2 files changed, 115 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index 1662bfddd4bc..3d9417911c33 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -19,8 +19,6 @@
 #include "xe_pcode_api.h"
 #include "xe_vsec.h"
 
-#define MAX_SCRATCH_MMIO 8
-
 /**
  * DOC: Survivability Mode
  *
@@ -48,19 +46,25 @@
  *
  * Refer :ref:`xe_configfs` for more details on how to use configfs
  *
- * Survivability mode is indicated by the below admin-only readable sysfs which provides additional
- * debug information::
+ * Survivability mode is indicated by the below admin-only readable sysfs entry::
  *
  *	/sys/bus/pci/devices/<device>/survivability_mode
  *
- * Capability Information:
- *	Provides boot status
- * Postcode Information:
- *	Provides information about the failure
- * Overflow Information
- *	Provides history of previous failures
- * Auxiliary Information
- *	Certain failures may have information in addition to postcode information
+ * Survivability mode sysfs provides information about the type of survivability mode.
+ * Any additional debug information if present will be visible under the directory
+ * ``survivability_info``::
+ *
+ *     /sys/bus/pci/devices/<device>/survivability_info/
+ *
+ * This directory has the following attributes
+ *
+ * - ``capability_info`` : Indicates Boot status and support for additional information
+ *
+ * - ``postcode_trace``, ``postcode_trace_overflow`` : Each postcode is a 8bit value and
+ *   represents a boot failure event. When a new failure event is logged by PCODE the
+ *   existing postcodes are shifted left. These entries provide a history of 8 postcodes.
+ *
+ * - ``aux_info<n>`` : Some failures have additional debug information
  *
  * Runtime Survivability
  * =====================
@@ -79,6 +83,29 @@
  * to restore device to normal operation.
  */
 
+enum scratch_reg {
+	CAPABILITY_INFO,
+	POSTCODE_TRACE,
+	POSTCODE_TRACE_OVERFLOW,
+	AUX_INFO0,
+	AUX_INFO1,
+	AUX_INFO2,
+	AUX_INFO3,
+	AUX_INFO4,
+	MAX_SCRATCH_REG,
+};
+
+struct xe_survivability_attribute {
+	struct device_attribute attr;
+	u8 index;
+};
+
+static struct
+xe_survivability_attribute *dev_attr_to_survivability_attr(struct device_attribute *attr)
+{
+	return container_of(attr, struct xe_survivability_attribute, attr);
+}
+
 static u32 aux_history_offset(u32 reg_value)
 {
 	return REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, reg_value);
@@ -88,7 +115,6 @@ static void set_survivability_info(struct xe_mmio *mmio, struct xe_survivability
 				   int id, char *name)
 {
 	strscpy(info[id].name, name, sizeof(info[id].name));
-	info[id].reg = PCODE_SCRATCH(id).raw;
 	info[id].value = xe_mmio_read32(mmio, PCODE_SCRATCH(id));
 }
 
@@ -102,26 +128,23 @@ static void populate_survivability_info(struct xe_device *xe)
 	int index;
 
 	mmio = xe_root_tile_mmio(xe);
-	set_survivability_info(mmio, info, id, "Capability Info");
-	reg_value = info[id].value;
+	set_survivability_info(mmio, info, CAPABILITY_INFO, "Capability Info");
+	reg_value = info[CAPABILITY_INFO].value;
 
 	if (reg_value & HISTORY_TRACKING) {
-		id++;
-		set_survivability_info(mmio, info, id, "Postcode Info");
+		set_survivability_info(mmio, info, POSTCODE_TRACE, "Postcode Trace");
 
-		if (reg_value & OVERFLOW_SUPPORT) {
-			id = REG_FIELD_GET(OVERFLOW_REG_OFFSET, reg_value);
-			set_survivability_info(mmio, info, id, "Overflow Info");
-		}
+		if (reg_value & OVERFLOW_SUPPORT)
+			set_survivability_info(mmio, info, POSTCODE_TRACE_OVERFLOW, "Postcode Trace Overflow");
 	}
 
 	if (reg_value & AUXINFO_SUPPORT) {
 		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
 
-		for (index = 0; id && reg_value; index++, reg_value = info[id].value,
-		     id = aux_history_offset(reg_value)) {
+		for (index = 0; id >= AUX_INFO0 && id < MAX_SCRATCH_REG; index++) {
 			snprintf(name, NAME_MAX, "Auxiliary Info %d", index);
 			set_survivability_info(mmio, info, id, name);
+			id = aux_history_offset(info[id].value);
 		}
 	}
 }
@@ -135,10 +158,9 @@ static void log_survivability_info(struct pci_dev *pdev)
 
 	dev_info(&pdev->dev, "Survivability Boot Status : Critical Failure (%d)\n",
 		 survivability->boot_status);
-	for (id = 0; id < MAX_SCRATCH_MMIO; id++) {
-		if (info[id].reg)
-			dev_info(&pdev->dev, "%s: 0x%x - 0x%x\n", info[id].name,
-				 info[id].reg, info[id].value);
+	for (id = 0; id < MAX_SCRATCH_REG; id++) {
+		if (info[id].value)
+			dev_info(&pdev->dev, "%s: 0x%x\n", info[id].name, info[id].value);
 	}
 }
 
@@ -156,25 +178,38 @@ static ssize_t survivability_mode_show(struct device *dev,
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	struct xe_survivability *survivability = &xe->survivability;
-	struct xe_survivability_info *info = survivability->info;
-	int index = 0, count = 0;
 
-	count += sysfs_emit_at(buff, count, "Survivability mode type: %s\n",
-			       survivability->type ? "Runtime" : "Boot");
+	return sysfs_emit(buff, "%s\n", survivability->type ? "Runtime" : "Boot");
+}
 
-	if (!check_boot_failure(xe))
-		return count;
+static DEVICE_ATTR_ADMIN_RO(survivability_mode);
 
-	for (index = 0; index < MAX_SCRATCH_MMIO; index++) {
-		if (info[index].reg)
-			count += sysfs_emit_at(buff, count, "%s: 0x%x - 0x%x\n", info[index].name,
-					       info[index].reg, info[index].value);
-	}
+static ssize_t survivability_info_show(struct device *dev,
+				       struct device_attribute *attr, char *buff)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct xe_device *xe = pdev_to_xe_device(pdev);
+	struct xe_survivability *survivability = &xe->survivability;
+	struct xe_survivability_info *info = survivability->info;
+	struct xe_survivability_attribute *sa = dev_attr_to_survivability_attr(attr);
 
-	return count;
+	return sysfs_emit(buff, "0x%x\n", info[sa->index].value);
 }
 
-static DEVICE_ATTR_ADMIN_RO(survivability_mode);
+#define SURVIVABILITY_ATTR_RO(name, _index)					\
+	struct xe_survivability_attribute attr_##name =	{			\
+		.attr =  __ATTR(name, 0400, survivability_info_show, NULL),	\
+		.index = _index,						\
+	}
+
+SURVIVABILITY_ATTR_RO(capability_info, CAPABILITY_INFO);
+SURVIVABILITY_ATTR_RO(postcode_trace, POSTCODE_TRACE);
+SURVIVABILITY_ATTR_RO(postcode_trace_overflow, POSTCODE_TRACE_OVERFLOW);
+SURVIVABILITY_ATTR_RO(aux_info0, AUX_INFO0);
+SURVIVABILITY_ATTR_RO(aux_info1, AUX_INFO1);
+SURVIVABILITY_ATTR_RO(aux_info2, AUX_INFO2);
+SURVIVABILITY_ATTR_RO(aux_info3, AUX_INFO3);
+SURVIVABILITY_ATTR_RO(aux_info4, AUX_INFO4);
 
 static void xe_survivability_mode_fini(void *arg)
 {
@@ -182,17 +217,47 @@ static void xe_survivability_mode_fini(void *arg)
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct device *dev = &pdev->dev;
 
-	sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
+	device_remove_file(dev, &dev_attr_survivability_mode);
 }
 
+static umode_t survivability_info_attrs_visible(struct kobject *kobj, struct attribute *attr,
+						int idx)
+{
+	struct xe_device *xe = kdev_to_xe_device(kobj_to_dev(kobj));
+	struct xe_survivability *survivability = &xe->survivability;
+	struct xe_survivability_info *info = survivability->info;
+
+	if (info[idx].value)
+		return 0400;
+
+	return 0;
+}
+
+static struct attribute *survivability_info_attrs[] = {
+	&attr_capability_info.attr.attr,
+	&attr_postcode_trace.attr.attr,
+	&attr_postcode_trace_overflow.attr.attr,
+	&attr_aux_info0.attr.attr,
+	&attr_aux_info1.attr.attr,
+	&attr_aux_info2.attr.attr,
+	&attr_aux_info3.attr.attr,
+	&attr_aux_info4.attr.attr,
+	NULL,
+};
+
+static const struct attribute_group survivability_info_group = {
+	.name = "survivability_info",
+	.attrs = survivability_info_attrs,
+	.is_visible = survivability_info_attrs_visible,
+};
+
 static int create_survivability_sysfs(struct pci_dev *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	int ret;
 
-	/* create survivability mode sysfs */
-	ret = sysfs_create_file(&dev->kobj, &dev_attr_survivability_mode.attr);
+	ret = device_create_file(dev, &dev_attr_survivability_mode);
 	if (ret) {
 		dev_warn(dev, "Failed to create survivability sysfs files\n");
 		return ret;
@@ -203,6 +268,12 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
 	if (ret)
 		return ret;
 
+	if (check_boot_failure(xe)) {
+		ret = devm_device_add_group(dev, &survivability_info_group);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -244,7 +315,7 @@ static int init_survivability_mode(struct xe_device *xe)
 	struct xe_survivability *survivability = &xe->survivability;
 	struct xe_survivability_info *info;
 
-	survivability->size = MAX_SCRATCH_MMIO;
+	survivability->size = MAX_SCRATCH_REG;
 
 	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
 			    GFP_KERNEL);
diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
index cd65a5d167c9..1ed122cf62f2 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode_types.h
+++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
@@ -16,7 +16,6 @@ enum xe_survivability_type {
 
 struct xe_survivability_info {
 	char name[NAME_MAX];
-	u32 reg;
 	u32 value;
 };
 
-- 
2.47.1

