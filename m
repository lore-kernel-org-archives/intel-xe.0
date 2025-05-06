Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A768C3ABAC
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 15:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC4C10E355;
	Tue,  6 May 2025 15:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G5Qg847o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B76F10E355
 for <intel-xe@lists.freedesktop.org>; Tue,  6 May 2025 15:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746545499; x=1778081499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cruUIBnmT/GtQO3gP3vQMa8Q3cS+vL7/lUT1W0ouHtg=;
 b=G5Qg847oIEEZb7W26i+vhN08lwiZzKrQyJZ+RdRUVaa93Ugbbos5CGJG
 AE9BXzpHGpJRcyPBnrfwoXEJK5gPxID3/ddIhOMIpgyoHcUOFH3Lw3UTI
 7IVkFQ6zjNbRR+oMNdBgROEBUr3Qp6JE7A3fO6k/m0EdZa5dKJml4UX9y
 P4sLgeHhTB8gSuouTpRG2lVJcslf2VeOc11DNKFkAZ/doUIpe7eM82aN0
 5Cj35D0TtO/RRzZhsGAm13a/Vr3eGcp+PHBBr/3sYmMOJmvctKC6S9VyD
 hZSsT2q1GwTbARckdj2Rj3VLlYQvyj5v9kwwylRr+B2hnTFrtpq002Qtd Q==;
X-CSE-ConnectionGUID: 6PEnsPqARKiiwh5n0WVzwQ==
X-CSE-MsgGUID: MEVPqN0iS32+3O9TaNSUng==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58884984"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="58884984"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 08:31:21 -0700
X-CSE-ConnectionGUID: 4kjVPHkJSzCpO+ACKHtWBg==
X-CSE-MsgGUID: itT5tgbxSc6rDPPja1xPOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="136656456"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 08:31:19 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 ashutosh.dixit@intel.com, rodrigo.vivi@intel.com, michael.j.ruhl@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v4 3/5] drm/xe/hwmon: Add support to manage PL2 though mailbox
Date: Tue,  6 May 2025 21:00:56 +0530
Message-Id: <20250506153058.1389470-4-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506153058.1389470-1-karthik.poosa@intel.com>
References: <20250506153058.1389470-1-karthik.poosa@intel.com>
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

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 30 +++++++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 64 ++++++++++++++-----
 2 files changed, 78 insertions(+), 16 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 8c9131c05041..badb2fb11a09 100644
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
index 76f6d4de806e..868066c0d278 100644
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
 
@@ -329,7 +345,7 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 	int ret = 0;
-	u32 reg_val;
+	u32 reg_val, max;
 	struct xe_reg rapl_limit;
 
 	mutex_lock(&hwmon->hwmon_lock);
@@ -357,12 +373,13 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
 
 	/* Computation in 64-bits to avoid overflow. Round to nearest. */
 	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
-	reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
-
-	if (reg_val > REG_FIELD_GET(PWR_LIM_VAL, hwmon->pl1_on_boot[channel])) {
-		reg_val = REG_FIELD_GET(PWR_LIM_VAL, hwmon->pl1_on_boot[channel]);
+	max = (attr == PL1_HWMON_ATTR) ? hwmon->pl1_on_boot[channel] : hwmon->pl2_on_boot[channel];
+	max = REG_FIELD_PREP(PWR_LIM_VAL, max);
+	if (reg_val > max) {
+		reg_val = max;
 		drm_dbg(&hwmon->xe->drm, "Clamping power limit to BIOS default 0x%x\n", reg_val);
 	}
+	reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
 
 	if (hwmon->xe->info.has_mbx_power_limits)
 		ret = xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, reg_val);
@@ -447,8 +464,9 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 	u32 x, y, x_w = 2; /* 2 bits */
 	u64 r, tau4, out;
-	int channel = to_sensor_dev_attr(attr)->index;
+	int channel = (to_sensor_dev_attr(attr)->index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
 	u32 power_attr = PL1_HWMON_ATTR;
+
 	int ret = 0;
 
 	xe_pm_runtime_get(hwmon->xe);
@@ -501,9 +519,9 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
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
@@ -581,11 +599,11 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
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
@@ -599,7 +617,7 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
 	int ret = 0;
-	int channel = index ? CHANNEL_PKG : CHANNEL_CARD;
+	int channel = (index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
 	u32 power_attr = PL1_HWMON_ATTR;
 	u32 uval;
 
@@ -631,8 +649,9 @@ static const struct attribute_group *hwmon_groups[] = {
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
@@ -757,6 +776,7 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 
 	switch (attr) {
 	case hwmon_power_max:
+	case hwmon_power_cap:
 		if (hwmon->xe->info.has_mbx_power_limits) {
 			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
 			return (uval) ? 0664 : 0;
@@ -789,6 +809,7 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 {
 	switch (attr) {
 	case hwmon_power_max:
+	case hwmon_power_cap:
 		xe_hwmon_power_max_read(hwmon, attr, channel, val);
 		return 0;
 	case hwmon_power_rated_max:
@@ -805,6 +826,7 @@ static int
 xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
 {
 	switch (attr) {
+	case hwmon_power_cap:
 	case hwmon_power_max:
 		return xe_hwmon_power_max_write(hwmon, attr, channel, val);
 	case hwmon_power_crit:
@@ -1131,7 +1153,11 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
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
 				 "Failed to read power limits, check card firmware\n");
 		} else {
@@ -1143,6 +1169,12 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
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

