Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3DFC3ABC3
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 09:52:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF6B10E009;
	Fri,  9 May 2025 09:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z5ISdDY3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16F710E9F1
 for <intel-xe@lists.freedesktop.org>; Fri,  9 May 2025 09:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746784347; x=1778320347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VuGUQ2jDwz1ScY7pmaoeQIOyXyMijvt7hxw5SWS4AUI=;
 b=Z5ISdDY3Plw7M0Gt3PBh3W1rNNvfY0ceCulGN2VOZZ5aBjOIo1+1byIJ
 NCCUQK0FupKUoABu26HQw4xXB+Ywp75WOGI40omcI5EGCDcv5OFnsbneE
 /wfI3MUY0GxrIXsXxAv3+6FM82n/BdrkJRJiABgb+A4xke6n9IbbaoaRk
 jCeheeUaGvxVXBXEFXDexDsMJn/TFrhCu4A3cZEzy80JFeSyXZwcJhQrG
 2WHhTEf+7H3kNawnWReW66d+FfDK/1hNVQV1hq44RNg5Mx31FNsxG52/Z
 a5hopE3q/tsyh1aUy07ZdHAO0un16QGjaSDupW3eFnQU2WGe7bSJEXUS3 w==;
X-CSE-ConnectionGUID: jeayhaLPQkiK73UELa19kg==
X-CSE-MsgGUID: k67BPntERISvBmTxW17vqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52414559"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="52414559"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 02:52:27 -0700
X-CSE-ConnectionGUID: kvSufiQHTaCoayc+s4pQeA==
X-CSE-MsgGUID: XY4AxPgxTGuxgFZijtvNfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="136454850"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 02:52:24 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 3/5] drm/xe/hwmon: Add support to manage PL2 though mailbox
Date: Fri,  9 May 2025 15:21:55 +0530
Message-Id: <20250509095157.340680-4-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250509095157.340680-1-karthik.poosa@intel.com>
References: <20250509095157.340680-1-karthik.poosa@intel.com>
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

v2:
 - Update power1_cap definition in hwmon documentation. (Badal)
 - Clamp PL2 power limit to BIOS default value.

v3:
 - Activate the power label when either the PL1 or PL2 power
   limit is enabled.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 30 ++++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 74 ++++++++++++++-----
 2 files changed, 84 insertions(+), 20 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 5a91dcccd3ac..dffd6443664a 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -148,3 +148,33 @@ Contact:	intel-xe@lists.freedesktop.org
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
+		power limit is disabled, writing 0 disables the	limit.
+		PL2 is greater than PL1 and its time window is lesser
+		compared to PL1.
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
+		power limit is disabled, writing 0 disables the	limit.
+		PL2 is greater than PL1 and its time window is lesser
+		compared to PL1.
+
+		Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 5ba800b35969..4de79b0d5c49 100644
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
@@ -151,8 +163,10 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
 	/* return the value only if limit is enabled */
 	if (attr == PL1_HWMON_ATTR)
 		*uval = (val0 & PWR_LIM_EN) ? val0 : 0;
+	else if (attr == PL2_HWMON_ATTR)
+		*uval = (val1 & PWR_LIM_EN) ? val1 : 0;
 	else if (attr == hwmon_power_label)
-		*uval = (val0 & PWR_LIM_EN) ? 1 : 0;
+		*uval = (val0 & PWR_LIM_EN) ? 1 : (val1 & PWR_LIM_EN) ? 1 : 0;
 	else
 		*uval = 0;
 
@@ -180,6 +194,8 @@ static int xe_hwmon_pcode_write_power_limit(const struct xe_hwmon *hwmon, u32 at
 
 	if (attr == PL1_HWMON_ATTR)
 		val0 = uval;
+	else if (attr == PL2_HWMON_ATTR)
+		val1 = uval;
 	else
 		return -EIO;
 
@@ -328,7 +344,7 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 	int ret = 0;
-	u32 reg_val;
+	u32 reg_val, max;
 	struct xe_reg rapl_limit;
 
 	mutex_lock(&hwmon->hwmon_lock);
@@ -356,20 +372,24 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
 
 	/* Computation in 64-bits to avoid overflow. Round to nearest. */
 	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
-	reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
 
 	/*
 	 * Clamp power limit to card-firmware default as maximum, as an additional protection to
 	 * pcode clamp.
 	 */
 	if (hwmon->xe->info.has_mbx_power_limits) {
-		if (reg_val > REG_FIELD_GET(PWR_LIM_VAL, hwmon->pl1_on_boot[channel])) {
-			reg_val = REG_FIELD_GET(PWR_LIM_VAL, hwmon->pl1_on_boot[channel]);
+		max = (attr == PL1_HWMON_ATTR) ?
+		       hwmon->pl1_on_boot[channel] : hwmon->pl2_on_boot[channel];
+		max = REG_FIELD_PREP(PWR_LIM_VAL, max);
+		if (reg_val > max) {
+			reg_val = max;
 			drm_dbg(&hwmon->xe->drm, "Clamping power limit to firmware default 0x%x\n",
 				reg_val);
 		}
 	}
 
+	reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
+
 	if (hwmon->xe->info.has_mbx_power_limits)
 		ret = xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, reg_val);
 	else
@@ -453,8 +473,9 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 	u32 x, y, x_w = 2; /* 2 bits */
 	u64 r, tau4, out;
-	int channel = to_sensor_dev_attr(attr)->index;
+	int channel = (to_sensor_dev_attr(attr)->index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
 	u32 power_attr = PL1_HWMON_ATTR;
+
 	int ret = 0;
 
 	xe_pm_runtime_get(hwmon->xe);
@@ -507,9 +528,9 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
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
@@ -587,11 +608,11 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
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
@@ -605,7 +626,7 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
 	int ret = 0;
-	int channel = index ? CHANNEL_PKG : CHANNEL_CARD;
+	int channel = (index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
 	u32 power_attr = PL1_HWMON_ATTR;
 	u32 uval;
 
@@ -637,8 +658,9 @@ static const struct attribute_group *hwmon_groups[] = {
 static const struct hwmon_channel_info * const hwmon_info[] = {
 	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
 			   HWMON_T_INPUT | HWMON_T_LABEL),
-	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT,
-			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL),
+	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
+			   HWMON_P_CAP,
+			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),
 	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
 	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
 	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
@@ -763,9 +785,11 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 
 	switch (attr) {
 	case hwmon_power_max:
+	case hwmon_power_cap:
+	case hwmon_power_label:
 		if (hwmon->xe->info.has_mbx_power_limits) {
 			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
-			return (uval) ? 0664 : 0;
+			return (uval) ? (attr == hwmon_power_label) ? 0444 : 0664 : 0;
 		} else {
 			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
 				       channel)) ? 0664 : 0;
@@ -777,11 +801,9 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU,
 					       channel)) ? 0444 : 0;
 	case hwmon_power_crit:
-	case hwmon_power_label:
 		if (channel == CHANNEL_CARD) {
 			xe_hwmon_pcode_read_i1(hwmon, &uval);
-			return (uval & POWER_SETUP_I1_WATTS) ? (attr == hwmon_power_label) ?
-				0444 : 0644 : 0;
+			return (uval & POWER_SETUP_I1_WATTS) ? 0644 : 0;
 		}
 		break;
 	default:
@@ -795,6 +817,7 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 {
 	switch (attr) {
 	case hwmon_power_max:
+	case hwmon_power_cap:
 		xe_hwmon_power_max_read(hwmon, attr, channel, val);
 		return 0;
 	case hwmon_power_rated_max:
@@ -811,6 +834,7 @@ static int
 xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
 {
 	switch (attr) {
+	case hwmon_power_cap:
 	case hwmon_power_max:
 		return xe_hwmon_power_max_write(hwmon, attr, channel, val);
 	case hwmon_power_crit:
@@ -1137,7 +1161,11 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 		if (xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_CARD,
 						    &hwmon->pl1_on_boot[CHANNEL_CARD]) |
 		    xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
-						    &hwmon->pl1_on_boot[CHANNEL_PKG])) {
+						    &hwmon->pl1_on_boot[CHANNEL_PKG]) |
+		    xe_hwmon_pcode_read_power_limit(hwmon, PL2_HWMON_ATTR, CHANNEL_CARD,
+						    &hwmon->pl2_on_boot[CHANNEL_CARD]) |
+		    xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
+						    &hwmon->pl2_on_boot[CHANNEL_PKG])) {
 			drm_warn(&hwmon->xe->drm,
 				 "Failed to read power limits, check card firmware !\n");
 		} else {
@@ -1149,6 +1177,12 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 			xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR,
 							 CHANNEL_PKG,
 							 hwmon->pl1_on_boot[CHANNEL_PKG]);
+			xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
+							 CHANNEL_CARD,
+							 hwmon->pl2_on_boot[CHANNEL_CARD]);
+			xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
+							 CHANNEL_PKG,
+							 hwmon->pl2_on_boot[CHANNEL_PKG]);
 			hwmon->scl_shift_power = PWR_UNIT;
 			hwmon->scl_shift_energy = ENERGY_UNIT;
 			hwmon->scl_shift_time = TIME_UNIT;
-- 
2.25.1

