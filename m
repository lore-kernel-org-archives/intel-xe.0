Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F62CDB482
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 18:56:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A8A10E452;
	Wed, 18 Oct 2023 18:56:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A957B10E452
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 18:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697655362; x=1729191362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0mEZK86T4HAtJD3wQhHvY9prhITwwUizUHN3OEOsUV4=;
 b=UKm40YQkz9E+Ahs4fmf2uA7Q6vUl+axjCUL4E7TIHIa2RWeH4VJ7RDvV
 F4jyM5gwDLOCuvrd6glcXerS333as8nLDJP4hPvOXxnxjfnuw4tCtTDs5
 iOi/ugA8x5NOV38OpNBLH54NJq3zORLqQ/MTecWZkSmqT5ql70SGONIRk
 yQZ0gKkCwZSWKo32RPOP93HMT0r+nWBZwRcbQzI5l3SHTNKLyiYV3MWka
 fH6oFThOO85VZvj9bZhp7TBTzO8OQ/p6+77epQqRBXNwTRDNiZ010X/cd
 d8KK3OsAAQ0qqXANFsvCzQhlljWFLcwjZto+CVlhllqHfro4g86tZSom3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="388946353"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="388946353"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 11:56:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="900447253"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="900447253"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 11:53:55 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 19 Oct 2023 00:33:41 +0530
Message-Id: <20231018190341.726098-4-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018190341.726098-1-badal.nilawar@intel.com>
References: <20231018190341.726098-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/3] drm/xe/hwmon: Expose power1_max_interval
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Expose power1_max_interval, that is the tau corresponding to PL1, as a
custom hwmon attribute. Some bit manipulation is needed because of the
format of PKG_PWR_LIM_1_TIME in
PACKAGE_RAPL_LIMIT register (1.x * power(2,y))

v2: Get rpm wake ref while accessing power1_max_interval
v3: %s/hwmon/xe_hwmon/
v4:
 - As power1_max_interval is rw attr take lock in read function as well
 - Refine comment about val to fix point conversion (Andi)
 - Update kernel version and date in doc
v5:
 - Fix review comments (Anshuman)

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   9 ++
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |   8 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 149 +++++++++++++++++-
 3 files changed, 165 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 1a7a6c23e141..8c321bc9dc04 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -59,3 +59,12 @@ Contact:	intel-xe@lists.freedesktop.org
 Description:	RO. Energy input of device in microjoules.
 
 		Only supported for particular Intel xe graphics platforms.
+
+What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_interval
+Date:		October 2023
+KernelVersion:	6.6
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RW. Sustained power limit interval (Tau in PL1/Tau) in
+		milliseconds over which sustained power is averaged.
+
+		Only supported for particular Intel xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
index d8ecbe1858d1..519dd1067a19 100644
--- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
@@ -22,15 +22,23 @@
 #define   PKG_TDP				GENMASK_ULL(14, 0)
 #define   PKG_MIN_PWR				GENMASK_ULL(30, 16)
 #define   PKG_MAX_PWR				GENMASK_ULL(46, 32)
+#define   PKG_MAX_WIN				GENMASK_ULL(54, 48)
+#define     PKG_MAX_WIN_X			GENMASK_ULL(54, 53)
+#define     PKG_MAX_WIN_Y			GENMASK_ULL(52, 48)
+
 
 #define PCU_CR_PACKAGE_POWER_SKU_UNIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5938)
 #define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
 #define   PKG_ENERGY_UNIT			REG_GENMASK(12, 8)
+#define   PKG_TIME_UNIT				REG_GENMASK(19, 16)
 
 #define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
 
 #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
 #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
 #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
+#define   PKG_PWR_LIM_1_TIME			REG_GENMASK(23, 17)
+#define   PKG_PWR_LIM_1_TIME_X			REG_GENMASK(23, 22)
+#define   PKG_PWR_LIM_1_TIME_Y			REG_GENMASK(21, 17)
 
 #endif /* _XE_MCHBAR_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index c87d028f1955..661d5269fb5b 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -38,6 +38,7 @@ enum xe_hwmon_reg_operation {
 #define SF_CURR		1000		/* milliamperes */
 #define SF_VOLTAGE	1000		/* millivolts */
 #define SF_ENERGY	1000000		/* microjoules */
+#define SF_TIME		1000		/* milliseconds */
 
 struct xe_hwmon_energy_info {
 	u32 reg_val_prev;
@@ -50,6 +51,7 @@ struct xe_hwmon {
 	struct mutex hwmon_lock; /* For rw attributes */
 	int scl_shift_power;
 	int scl_shift_energy;
+	int scl_shift_time;
 	struct xe_hwmon_energy_info ei;	/*  Energy info for energy1_input */
 };
 
@@ -239,6 +241,149 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)
 				  hwmon->scl_shift_energy);
 }
 
+static ssize_t
+xe_hwmon_power1_max_interval_show(struct device *dev, struct device_attribute *attr,
+				  char *buf)
+{
+	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
+	u32 x, y, x_w = 2; /* 2 bits */
+	u64 r, tau4, out;
+
+	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT,
+			     REG_READ32, &r, 0, 0);
+
+	mutex_unlock(&hwmon->hwmon_lock);
+
+	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+
+	x = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_X, r);
+	y = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_Y, r);
+
+	/*
+	 * tau = 1.x * power(2,y), x = bits(23:22), y = bits(21:17)
+	 *     = (4 | x) << (y - 2)
+	 *
+	 * Here (y - 2) ensures a 1.x fixed point representation of 1.x
+	 * As x is 2 bits so 1.x can be 1.0, 1.25, 1.50, 1.75
+	 *
+	 * As y can be < 2, we compute tau4 = (4 | x) << y
+	 * and then add 2 when doing the final right shift to account for units
+	 */
+	tau4 = ((1 << x_w) | x) << y;
+
+	/* val in hwmon interface units (millisec) */
+	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
+
+	return sysfs_emit(buf, "%llu\n", out);
+}
+
+static ssize_t
+xe_hwmon_power1_max_interval_store(struct device *dev, struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
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
+	 * For DG2, PVC PKG_PWR_SKU does not show valid PKG_MAX_WIN so going with default
+	 * For future platforms this limitation may get addressed.
+	 */
+#define PKG_MAX_WIN_DEFAULT 0x12ull
+
+	/*
+	 * val must be < max in hwmon interface units. The steps below are
+	 * explained in xe_hwmon_power1_max_interval_show()
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
+
+	/*
+	 * Convert val to 1.x * power(2,y)
+	 * y = ilog2(val)
+	 * x = (val - (1 << y)) >> (y - 2)
+	 */
+	if (!val) {
+		y = 0;
+		x = 0;
+	} else {
+		y = ilog2(val);
+		x = (val - (1ul << y)) << x_w >> y;
+	}
+
+	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
+
+	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, (u64 *)&r,
+			     PKG_PWR_LIM_1_TIME, rxy);
+
+	mutex_unlock(&hwmon->hwmon_lock);
+
+	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+
+	return count;
+}
+
+static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
+			  xe_hwmon_power1_max_interval_show,
+			  xe_hwmon_power1_max_interval_store, 0);
+
+static struct attribute *hwmon_attributes[] = {
+	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
+	NULL
+};
+
+static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
+					   struct attribute *attr, int index)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
+	int ret = 0;
+
+	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+
+	if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr)
+		ret = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT) ? attr->mode : 0;
+
+	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+
+	return ret;
+}
+
+static const struct attribute_group hwmon_attrgroup = {
+	.attrs = hwmon_attributes,
+	.is_visible = xe_hwmon_attributes_visible,
+};
+
+static const struct attribute_group *hwmon_groups[] = {
+	&hwmon_attrgroup,
+	NULL
+};
+
 static const struct hwmon_channel_info *hwmon_info[] = {
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
 	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
@@ -555,6 +700,7 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
 				     REG_READ32, &val_sku_unit, 0, 0);
 		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
 		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
+		hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
 	}
 
 	/*
@@ -601,7 +747,8 @@ void xe_hwmon_register(struct xe_device *xe)
 	/*  hwmon_dev points to device hwmon<i> */
 	hwmon->hwmon_dev = devm_hwmon_device_register_with_info(dev, "xe", hwmon,
 								&hwmon_chip_info,
-								NULL);
+								hwmon_groups);
+
 	if (IS_ERR(hwmon->hwmon_dev)) {
 		drm_warn(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
 		xe->hwmon = NULL;
-- 
2.25.1

