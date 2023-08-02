Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2182C04E69
	for <intel-xe@archiver.kernel.org>; Wed,  2 Aug 2023 13:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D3710E1EF;
	Wed,  2 Aug 2023 13:46:39 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5543310E1EF
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Aug 2023 13:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690983997; x=1722519997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DUqf6MegFnAPJZwt0euXTGiy+mpwCvNmFNQIl9yL1f4=;
 b=n1paOmC7ysi4EdvHWFMzUOxmBqWxgEwIUX5zQNhYRf1eBpNoLz8Qe6BH
 nWDGY502T1q3vLTzQtDGWCube4zRwlrxjxWGvvsPV4XV40xDuQ8k8rO5q
 N2y2Q2x/qVXUT4l1S+zKrFku+YmXbbCxzjHsr1kSIwqjwxMzr35RrDlOD
 BgSnNh5u3J9eiPJ4CkY7vUgqz/aypnMnTbPUXB7KsixW36B3SsP+YpTWC
 bWyFZOBiNQZx4s07j/Va3puigcN6muwiNGwO+ifrHzo2Vih2H7aJj7rnT
 69ShqAJkgR7SFNyKXhakZfHV7HTCsmJgbg22i44goBXn9jtGdWcvjW+mm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="400534964"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="400534964"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 06:46:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="852873945"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="852873945"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 06:46:33 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	linux-hwmon@vger.kernel.org
Date: Wed,  2 Aug 2023 19:22:39 +0530
Message-Id: <20230802135241.458855-5-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230802135241.458855-1-badal.nilawar@intel.com>
References: <20230802135241.458855-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 4/6] drm/xe/hwmon: Expose input voltage
 attribute
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
Cc: linux@roeck-us.net
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use Xe HWMON subsystem to display the input voltage.

v2:
  - Rename hwm_get_vltg to hwm_get_voltage (Riana)
  - Use scale factor SF_VOLTAGE (Riana)
v3:
  - %s/hwm_/hwmon/
  - %s/gt_perf_status/REG_GT_PERF_STATUS/
  - Remove platform check from hwmon_get_voltage()

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  6 ++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  3 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 59 +++++++++++++++++++
 3 files changed, 68 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index ea60add73743..167bd9480602 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -44,5 +44,11 @@ Description:	RW. Card reactive critical (I1) power limit in milliamperes.
 		the operating frequency if the power averaged over a window
 		exceeds this limit.
 
+What:		/sys/devices/.../hwmon/hwmon<i>/in0_input
+Date:		August 2023
+KernelVersion:	6.4
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RO. Current Voltage in millivolt.
+
 		Only supported for particular Intel xe graphics platforms.
 
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index eb7210afbd2c..cc452ec999fc 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -364,6 +364,9 @@
 #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
 #define GT_GFX_RC6				XE_REG(0x138108)
 
+#define GT_PERF_STATUS				XE_REG(0x1381b4)
+#define   VOLTAGE_MASK				REG_GENMASK(10, 0)
+
 #define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4))
 
 #define GUC_SG_INTR_ENABLE			XE_REG(0x190038)
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index ceab142f6d42..3e69cd79c1e2 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -3,7 +3,9 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/hwmon-sysfs.h>
 #include <linux/hwmon.h>
+#include <linux/types.h>
 
 #include <drm/drm_managed.h>
 #include "regs/xe_mchbar_regs.h"
@@ -19,6 +21,7 @@ enum hwmon_reg_name {
 	REG_PKG_RAPL_LIMIT,
 	REG_PKG_POWER_SKU,
 	REG_PKG_POWER_SKU_UNIT,
+	REG_GT_PERF_STATUS,
 };
 
 enum hwmon_reg_operation {
@@ -31,9 +34,11 @@ enum hwmon_reg_operation {
  * SF_* - scale factors for particular quantities according to hwmon spec.
  * - power  - microwatts
  * - curr   - milliamperes
+ * - voltage  - millivolts
  */
 #define SF_POWER	1000000
 #define SF_CURR		1000
+#define SF_VOLTAGE	1000
 
 struct xe_hwmon_data {
 	struct device *hwmon_dev;
@@ -75,6 +80,10 @@ static u32 hwmon_get_reg(struct xe_hwmon_data *ddat, enum hwmon_reg_name reg_nam
 		else if (xe->info.platform == XE_PVC)
 			reg = PVC_GT0_PACKAGE_POWER_SKU_UNIT;
 		break;
+	case REG_GT_PERF_STATUS:
+		if (xe->info.platform == XE_DG2)
+			reg = GT_PERF_STATUS;
+		break;
 	default:
 		XE_MISSING_CASE(reg_name);
 		break;
@@ -222,6 +231,7 @@ static int hwmon_power_rated_max_read(struct xe_hwmon_data *ddat, long *value)
 static const struct hwmon_channel_info *hwmon_info[] = {
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
 	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
+	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
 	NULL
 };
 
@@ -244,6 +254,18 @@ static int hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
 			      uval);
 }
 
+static int hwmon_get_voltage(struct xe_hwmon_data *ddat, long *value)
+{
+	u32 reg_val;
+
+	process_hwmon_reg(ddat, REG_GT_PERF_STATUS,
+			  REG_READ, &reg_val, 0, 0);
+	/* HW register value in units of 2.5 millivolt */
+	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
+
+	return 0;
+}
+
 static umode_t
 hwmon_power_is_visible(struct xe_hwmon_data *ddat, u32 attr, int chan)
 {
@@ -396,6 +418,37 @@ hwmon_curr_write(struct xe_hwmon_data *ddat, u32 attr, long val)
 	}
 }
 
+static umode_t
+hwmon_in_is_visible(struct xe_hwmon_data *ddat, u32 attr)
+{
+	switch (attr) {
+	case hwmon_in_input:
+		return hwmon_get_reg(ddat, REG_GT_PERF_STATUS) ? 0444 : 0;
+	default:
+		return 0;
+	}
+}
+
+static int
+hwmon_in_read(struct xe_hwmon_data *ddat, u32 attr, long *val)
+{
+	int ret;
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
+	switch (attr) {
+	case hwmon_in_input:
+		ret = hwmon_get_voltage(ddat, val);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+	}
+
+	xe_device_mem_access_put(gt_to_xe(ddat->gt));
+
+	return ret;
+}
+
 static umode_t
 hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		 u32 attr, int channel)
@@ -412,6 +465,9 @@ hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	case hwmon_curr:
 		ret = hwmon_curr_is_visible(ddat, attr);
 		break;
+	case hwmon_in:
+		ret = hwmon_in_is_visible(ddat, attr);
+		break;
 	default:
 		ret = 0;
 		break;
@@ -438,6 +494,9 @@ hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	case hwmon_curr:
 		ret = hwmon_curr_read(ddat, attr, val);
 		break;
+	case hwmon_in:
+		ret = hwmon_in_read(ddat, attr, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
-- 
2.25.1

