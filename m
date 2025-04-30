Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07696C369D9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 20:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87E210E140;
	Wed, 30 Apr 2025 20:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bgIAkr34";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B59010E140
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 20:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746045401; x=1777581401;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R090l2+I/R9tvyfmfYzs0f5C60/HU9BNDxhA33oEkvg=;
 b=bgIAkr34wQpeTBkmPgQQ8X8wVG/ow9V1Br/I0mdlnWi3HHD8gytViax5
 Xbxnx/nAU66ox6c6/nJZ0kwTdAOk9x3OBwDeVWX5QAddWvh8Y3NAJXV2j
 D8qUzAs6ix0NzVjneO45Icwrt4l+DKoPgArEjbHe0EPgc47T6QvScX2vG
 UySa7x2ow7Rj7P809v158njaC0a4H556nuYEIPyjQOl18VICCYH2ACbXt
 MYPvKw2PqTIiMClAlIgruZshXg+2tg+ba0GcC+hQ6QrhaG3JQSX7Xie4I
 pA2H2CUH9A+u0KELydeYyQsqLanKKuZ6qL/ND3EtYGdEJ0UqnNg+VY5Gi w==;
X-CSE-ConnectionGUID: 6QRPBpsgTtWoxRRrDHUvZA==
X-CSE-MsgGUID: XWXnLHa6SViKJYA4IC0OKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="58712380"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="58712380"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 13:36:41 -0700
X-CSE-ConnectionGUID: HGoxx0U8QoKoZdmIy8qPLQ==
X-CSE-MsgGUID: j8/fhCL7QbaL5qxF8V2W9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="134112618"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 13:36:38 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 ashutosh.dixit@intel.com, rodrigo.vivi@intel.com, michael.j.ruhl@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 3/5] drm/xe/hwmon: Add support to manage PL2 though mailbox
Date: Thu,  1 May 2025 02:06:05 +0530
Message-Id: <20250430203607.926585-4-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250430203607.926585-1-karthik.poosa@intel.com>
References: <20250430203607.926585-1-karthik.poosa@intel.com>
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

Add support to manage power limit PL2 (burst limit) through
pcode mailbox commands.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 28 ++++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 67 ++++++++++++++-----
 2 files changed, 77 insertions(+), 18 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 8c9131c05041..9dc2ee348aa6 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -148,3 +148,31 @@ Contact:	intel-xe@lists.freedesktop.org
 Description:	RO. Fan 3 speed in RPM.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap
+Date:		May 2025
+KernelVersion:	6.15
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RW. Card burst (PL2) power limit in microwatts.
+
+		The power controller will throttle the operating frequency
+		if the power averaged over a window (typically milli seconds)
+		exceeds this limit. A read value of 0 means that the PL2
+		power limit is disabled, writing 0 disables the
+		limit. Writing values > 0 and <= TDP will enable the power limit.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power2_cap
+Date:		May 2025
+KernelVersion:	6.15
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RW. Package burst (PL2) power limit in microwatts.
+
+		The power controller will throttle the operating frequency
+		if the power averaged over a window (typically milli seconds)
+		exceeds this limit. A read value of 0 means that the PL2
+		power limit is disabled, writing 0 disables the
+		limit. Writing values > 0 and <= TDP will enable the power limit.
+
+		Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 15e47e31ad26..115758c88175 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -51,6 +51,14 @@ enum xe_fan_channel {
 	FAN_MAX,
 };
 
+/* Attribute index for powerX_xxx_interval sysfs entries */
+enum sensor_attr_power {
+	SENSOR_INDEX_PSYS_PL1,
+	SENSOR_INDEX_PKG_PL1,
+	SENSOR_INDEX_PSYS_PL2,
+	SENSOR_INDEX_PKG_PL2,
+};
+
 /*
  * For platforms that support mailbox commands for power limits, REG_PKG_POWER_SKU_UNIT is
  * not supported and below are SKU units to be used.
@@ -72,8 +80,9 @@ enum xe_fan_channel {
  * PL*_HWMON_ATTR - mapping of hardware power limits to corresponding hwmon power attribute.
  */
 #define PL1_HWMON_ATTR	hwmon_power_max
+#define PL2_HWMON_ATTR	hwmon_power_cap
 
-#define PWR_ATTR_TO_STR(attr)	(((attr) == hwmon_power_max) ? "PL1" : "Invalid")
+#define PWR_ATTR_TO_STR(attr)	(((attr) == hwmon_power_max) ? "PL1" : "PL2")
 
 /*
  * Timeout for power limit write mailbox command.
@@ -124,6 +133,9 @@ struct xe_hwmon {
 	bool boot_power_limit_read;
 	/** pl1_on_boot: power limit PL1 on boot */
 	u32 pl1_on_boot[CHANNEL_MAX];
+	/** pl2_on_boot: power limit PL2 on boot */
+	u32 pl2_on_boot[CHANNEL_MAX];
+
 };
 
 static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
@@ -151,6 +163,8 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
 	/* return the value only if limit is enabled */
 	if (attr == PL1_HWMON_ATTR)
 		*uval = (val0 & PWR_LIM_EN) ? val0 : 0;
+	else if (attr == PL2_HWMON_ATTR)
+		*uval = (val1 & PWR_LIM_EN) ? val1 : 0;
 	else if (attr == hwmon_power_label)
 		*uval = (val0 & PWR_LIM_EN) ? 1 : (val1 & PWR_LIM_EN) ? 1 : 0;
 	else
@@ -180,6 +194,8 @@ static int xe_hwmon_pcode_write_power_limit(const struct xe_hwmon *hwmon, u32 at
 
 	if (attr == PL1_HWMON_ATTR)
 		val0 = uval;
+	else if (attr == PL2_HWMON_ATTR)
+		val1 = uval;
 	else
 		return -EIO;
 
@@ -321,9 +337,10 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channe
 	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
 
 	if (hwmon->xe->info.has_mbx_power_limits) {
-		/* No MIN_PWR defined, using boot PL1 as max */
-		min = 0;
-		max = hwmon->pl1_on_boot[channel] & PWR_LIM_VAL;
+		/* No MIN_PWR defined, using boot PL1 */
+		min = hwmon->pl1_on_boot[channel] & PWR_LIM_VAL;
+		/* MAX_PWR is PL2 on boot */
+		max = hwmon->pl2_on_boot[channel] & PWR_LIM_VAL;
 	} else {
 		reg_val = xe_mmio_read64_2x32(mmio, pkg_power_sku);
 		min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
@@ -455,8 +472,9 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 	u32 x, y, x_w = 2; /* 2 bits */
 	u64 r, tau4, out;
-	int channel = to_sensor_dev_attr(attr)->index;
+	int channel = (to_sensor_dev_attr(attr)->index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
 	u32 power_attr = PL1_HWMON_ATTR;
+
 	int ret = 0;
 
 	xe_pm_runtime_get(hwmon->xe);
@@ -509,9 +527,9 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 	u32 x, y, rxy, x_w = 2; /* 2 bits */
 	u64 tau4, r, max_win;
 	unsigned long val;
-	int ret;
-	int channel = to_sensor_dev_attr(attr)->index;
+	int channel = (to_sensor_dev_attr(attr)->index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
 	u32 power_attr = PL1_HWMON_ATTR;
+	int ret;
 
 	ret = kstrtoul(buf, 0, &val);
 	if (ret)
@@ -589,11 +607,11 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 /* PSYS PL1 */
 static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
 			  xe_hwmon_power_max_interval_show,
-			  xe_hwmon_power_max_interval_store, CHANNEL_CARD);
-
+			  xe_hwmon_power_max_interval_store, SENSOR_INDEX_PSYS_PL1);
+/* PKG PL1 */
 static SENSOR_DEVICE_ATTR(power2_max_interval, 0664,
 			  xe_hwmon_power_max_interval_show,
-			  xe_hwmon_power_max_interval_store, CHANNEL_PKG);
+			  xe_hwmon_power_max_interval_store, SENSOR_INDEX_PKG_PL1);
 
 static struct attribute *hwmon_attributes[] = {
 	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
@@ -607,7 +625,7 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
 	int ret = 0;
-	int channel = index ? CHANNEL_PKG : CHANNEL_CARD;
+	int channel = (index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
 	u32 power_attr = PL1_HWMON_ATTR;
 	u32 uval;
 
@@ -639,8 +657,9 @@ static const struct attribute_group *hwmon_groups[] = {
 static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
 			   HWMON_T_INPUT | HWMON_T_LABEL),
-	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT,
-			   HWMON_P_MAX | HWMON_P_RATED_MAX |  HWMON_P_LABEL),
+	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
+					   HWMON_P_CAP,
+			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),
 	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
 	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
@@ -765,9 +784,10 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 
 	switch (attr) {
 	case hwmon_power_max:
+	case hwmon_power_cap:
 		if (hwmon->xe->info.has_mbx_power_limits) {
 			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
-			return (uval) ? (attr == hwmon_power_label) ? 0444 : 0664 : 0;
+			return (uval) ? 0664 : 0;
 		} else {
 			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
 				       channel)) ? 0664 : 0;
@@ -797,6 +817,7 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 {
 	switch (attr) {
 	case hwmon_power_max:
+	case hwmon_power_cap:
 		xe_hwmon_power_max_read(hwmon, attr, channel, val);
 		return 0;
 	case hwmon_power_rated_max:
@@ -813,6 +834,7 @@ static int
 xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
 {
 	switch (attr) {
+	case hwmon_power_cap:
 	case hwmon_power_max:
 		return xe_hwmon_power_max_write(hwmon, attr, channel, val);
 	case hwmon_power_crit:
@@ -1139,16 +1161,25 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 		if (!xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_CARD,
 						     &hwmon->pl1_on_boot[CHANNEL_CARD])) {
 			/* Read all default power limits */
-			if (xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
-							    &hwmon->pl1_on_boot[CHANNEL_PKG])) {
-				drm_warn(&hwmon->xe->drm, "Failed to read pkg power limit\n");
+			if (xe_hwmon_pcode_read_power_limit(hwmon, PL2_HWMON_ATTR, CHANNEL_CARD,
+							    &hwmon->pl2_on_boot[CHANNEL_CARD]) ||
+				xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
+								&hwmon->pl1_on_boot[CHANNEL_PKG]) ||
+				xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
+								&hwmon->pl2_on_boot[CHANNEL_PKG])) {
+				drm_warn(&hwmon->xe->drm, "Failed to read all power limits\n");
 			} else {
 				/* Write default limits to read from pcode from now on */
 				xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR,
 								 CHANNEL_CARD,
 								 hwmon->pl1_on_boot[CHANNEL_CARD]);
+				xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
+								 CHANNEL_CARD,
+								 hwmon->pl2_on_boot[CHANNEL_CARD]);
 				xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
 								 hwmon->pl1_on_boot[CHANNEL_PKG]);
+				xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR, CHANNEL_PKG,
+								 hwmon->pl2_on_boot[CHANNEL_PKG]);
 
 				hwmon->scl_shift_power = PWR_UNIT;
 				hwmon->scl_shift_energy = ENERGY_UNIT;
@@ -1157,7 +1188,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 				hwmon->boot_power_limit_read = true;
 			}
 		} else {
-			drm_warn(&hwmon->xe->drm, "Failed to read power limits, check firmware !\n");
+			drm_warn(&hwmon->xe->drm, "Failed to read card power limit, check firmware !\n");
 		}
 	} else {
 		drm_info(&hwmon->xe->drm, "Using register for power limits\n");
-- 
2.25.1

