Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC24C77B73
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 12:46:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAADA10E33E;
	Tue,  6 Jun 2023 12:46:02 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC5910E346
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 12:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686055561; x=1717591561;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9FLktESOuJKEfST8Cm8kBHtKorkscyArSbBW3xM7TnU=;
 b=lNlZTkAfj6a28iSo3tI3nzzprQ0US2DWNihaKmEFEL+H5vnoDb4EK2U2
 We86XrTkj7RxindgIQ5YNFED8I4yOQ1xXEtXSlp5kcqAy7eP0CzmYF/qW
 utYMBL8sG2rASIjm8DKNs0oMzlsLRuZttBxJbmQINGmwVvzlg9iZfMwYM
 Ah4P2oBOWM5eHjS/WT7PUxWouwueYsQUsyUbvUsE/D5Y6Vgq1lYaij+PP
 PBmBkjVC8S9BaU5XcX27Irnr1jxCHq1CUICiN6OJNcRmInsmqLFBl2no4
 ZvGEcMcmUyVV7Y/DIF6LYYS+9O8S7UB+O5ViHKOb8Wv4ZRvKiNFYVnct1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="341297951"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="341297951"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 05:46:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="709063542"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="709063542"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 05:45:57 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  6 Jun 2023 18:20:57 +0530
Message-Id: <20230606125057.838618-7-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230606125057.838618-1-badal.nilawar@intel.com>
References: <20230606125057.838618-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 6/6] drm/xe/hwmon: Expose power1_max_interval
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Expose power1_max_interval, that is the tau corresponding to PL1, as a
custom hwmon attribute. Some bit manipulation is needed because of the
format of PKG_PWR_LIM_1_TIME in
PACKAGE_RAPL_LIMIT register (1.x * power(2,y))

Co-developed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  11 ++
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |   8 ++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 127 +++++++++++++++++-
 3 files changed, 145 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 64c09aa0689d..5e9542d4ece4 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -64,3 +64,14 @@ Description:	RO. Energy input of device or gt in microjoules.
 		for the gt.
 
 		Only supported for particular Intel xe graphics platforms.
+
+What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_interval
+Date:		June 2023
+KernelVersion:	6.3
+Contact:	intel-gfx@lists.freedesktop.org
+Description:	RW. Sustained power limit interval (Tau in PL1/Tau) in
+		milliseconds over which sustained power is averaged.
+
+		Only supported for particular Intel i915 graphics platforms.
+
+
diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
index 093be7401a95..8e8e2a3eda49 100644
--- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
@@ -20,11 +20,16 @@
 
 #define PCU_CR_PACKAGE_POWER_SKU		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5930)
 #define   PKG_PKG_TDP				GENMASK_ULL(14, 0)
+#define   PKG_MAX_WIN				GENMASK_ULL(54, 48)
+#define     PKG_MAX_WIN_X			GENMASK_ULL(54, 53)
+#define     PKG_MAX_WIN_Y			GENMASK_ULL(52, 48)
+
 
 #define PCU_CR_PACKAGE_POWER_SKU_UNIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5938)
 #define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
 #define   PKG_MIN_PWR				GENMASK_ULL(30, 16)
 #define   PKG_MAX_PWR				GENMASK_ULL(46, 32)
+#define   PKG_TIME_UNIT				REG_GENMASK(19, 16)
 #define   PKG_ENERGY_UNIT			REG_GENMASK(12, 8)
 
 #define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
@@ -32,6 +37,9 @@
 #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
 #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
 #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
+#define   PKG_PWR_LIM_1_TIME			REG_GENMASK(23, 17)
+#define   PKG_PWR_LIM_1_TIME_X			REG_GENMASK(23, 22)
+#define   PKG_PWR_LIM_1_TIME_Y			REG_GENMASK(21, 17)
 
 #endif
 
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 63721a27081c..0c8d58eeef56 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -48,6 +48,7 @@ enum hwm_reg_operation {
 #define SF_CURR		1000
 #define SF_VOLTAGE	1000
 #define SF_ENERGY	1000000
+#define SF_TIME		1000
 
 struct hwm_energy_info {
 	u32 reg_val_prev;
@@ -71,6 +72,7 @@ struct xe_hwmon {
 	struct mutex hwmon_lock;	/* counter overflow logic and rmw */
 	int scl_shift_power;
 	int scl_shift_energy;
+	int scl_shift_time;
 };
 
 struct xe_reg hwm_get_reg(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name)
@@ -337,6 +339,128 @@ hwm_energy(struct hwm_drvdata *ddat, long *energy)
 	xe_device_mem_access_put(gt_to_xe(ddat->gt));
 }
 
+static ssize_t
+hwm_power1_max_interval_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
+	struct xe_hwmon *hwmon = ddat->hwmon;
+	u32 r, x, y, x_w = 2; /* 2 bits */
+	u64 tau4, out;
+
+	process_hwmon_reg(ddat, pkg_rapl_limit,
+			  reg_read, &r, 0, 0);
+
+	x = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_X, r);
+	y = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_Y, r);
+	/*
+	 * tau = 1.x * power(2,y), x = bits(23:22), y = bits(21:17)
+	 *     = (4 | x) << (y - 2)
+	 * where (y - 2) ensures a 1.x fixed point representation of 1.x
+	 * However because y can be < 2, we compute
+	 *     tau4 = (4 | x) << y
+	 * but add 2 when doing the final right shift to account for units
+	 */
+	tau4 = ((1 << x_w) | x) << y;
+	/* val in hwmon interface units (millisec) */
+	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
+
+	return sysfs_emit(buf, "%llu\n", out);
+}
+
+static ssize_t
+hwm_power1_max_interval_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
+	struct xe_hwmon *hwmon = ddat->hwmon;
+	u32 x, y, rxy, x_w = 2; /* 2 bits */
+	u64 tau4, r, max_win;
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	/*
+	 * Max HW supported tau in '1.x * power(2,y)' format, x = 0, y = 0x12
+	 * The hwmon->scl_shift_time default of 0xa results in a max tau of 256 seconds
+	 */
+#define PKG_MAX_WIN_DEFAULT 0x12ull
+
+	/*
+	 * val must be < max in hwmon interface units. The steps below are
+	 * explained in hwm_power1_max_interval_show()
+	 */
+	r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
+	x = REG_FIELD_GET(PKG_MAX_WIN_X, r);
+	y = REG_FIELD_GET(PKG_MAX_WIN_Y, r);
+	tau4 = ((1 << x_w) | x) << y;
+	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
+
+	if (val > max_win)
+		return -EINVAL;
+
+	/* val in hw units */
+	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME);
+	/* Convert to 1.x * power(2,y) */
+	if (!val) {
+		/* Avoid ilog2(0) */
+		y = 0;
+		x = 0;
+	} else {
+		y = ilog2(val);
+		/* x = (val - (1 << y)) >> (y - 2); */
+		x = (val - (1ul << y)) << x_w >> y;
+	}
+
+	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, (u32 *)&r,
+			  PKG_PWR_LIM_1_TIME, rxy);
+
+	mutex_unlock(&hwmon->hwmon_lock);
+
+	return count;
+}
+
+static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
+			  hwm_power1_max_interval_show,
+			  hwm_power1_max_interval_store, 0);
+
+static struct attribute *hwm_attributes[] = {
+	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
+	NULL
+};
+
+static umode_t hwm_attributes_visible(struct kobject *kobj,
+				      struct attribute *attr, int index)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
+	u32 reg_val;
+
+	if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr)
+		return process_hwmon_reg(ddat, pkg_rapl_limit,
+					 reg_read, &reg_val, 0, 0) ? 0 : attr->mode;
+
+	return 0;
+}
+
+static const struct attribute_group hwm_attrgroup = {
+	.attrs = hwm_attributes,
+	.is_visible = hwm_attributes_visible,
+};
+
+static const struct attribute_group *hwm_groups[] = {
+	&hwm_attrgroup,
+	NULL
+};
+
 static const struct hwmon_channel_info *hwm_info[] = {
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
 	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
@@ -729,6 +853,7 @@ hwm_get_preregistration_info(struct hwm_drvdata *ddat)
 	if (!ret) {
 		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
 		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
+		hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
 	}
 
 	/*
@@ -792,7 +917,7 @@ void xe_hwmon_register(struct xe_device *xe)
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
 							 ddat,
 							 &hwm_chip_info,
-							 NULL);
+							 hwm_groups);
 
 	if (IS_ERR(hwmon_dev)) {
 		xe->hwmon = NULL;
-- 
2.25.1

