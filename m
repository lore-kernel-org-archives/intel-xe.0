Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE3DC77B7A
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 12:45:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9DB10E338;
	Tue,  6 Jun 2023 12:45:57 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9F210E346
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 12:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686055556; x=1717591556;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0IXe9mTrG1hzXwd8AdXMh4xC6IgWkgGkDPsIXlf3scg=;
 b=l7oYnbCZi3VJm/okWtoFzY5NrK0bHraUcIYwo8g2RmhIEUyUudH4S3Vr
 uQO731lsshiIkZRVeH0ck3WgeF3LmfKMKwHSOkL+qBVSqH8SY2UUYNE3A
 j985EyJLtijSpgtgFd4hkB8CmQrXEfcCaYmEN2bfRf4sw6KuoqmEadR+G
 YGBZDQSNgO0gg4JeZfK84uFhvSFP/FzfaCjPQheSO50xVm5TjT55u32G2
 cck5NYVLMPgBWpmM9D2AEeMo3wOH+N7HX/IfqWs5sWjmhRo+6coS8bTfB
 xYXA2eZKZ+XMaZ94aG8pxb2W6caGaBMDZYuG6cU393ztQ8lZvdKaVmeby Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="341297915"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="341297915"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 05:45:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="709063476"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="709063476"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 05:45:53 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  6 Jun 2023 18:20:55 +0530
Message-Id: <20230606125057.838618-5-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230606125057.838618-1-badal.nilawar@intel.com>
References: <20230606125057.838618-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 4/6] drm/xe/hwmon: Expose input voltage
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use Xe HWMON subsystem to display the input voltage.

Co-developed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  6 ++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  3 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 70 +++++++++++++++++--
 3 files changed, 75 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index fcc2aedb2aac..aa064e0c5751 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -44,5 +44,11 @@ Description:	RW. Card reactive critical (I1) power limit in milliamperes.
 		the operating frequency if the power averaged over a window
 		exceeds this limit.
 
+What:		/sys/devices/.../hwmon/hwmon<i>/in0_input
+Date:		June 2023
+KernelVersion:	6.3
+Contact:	intel-gfx@lists.freedesktop.org
+Description:	RO. Current Voltage in millivolt.
+
 		Only supported for particular Intel xe graphics platforms.
 
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 9d888aae907e..fe00c42ff29d 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -349,6 +349,9 @@
 #define GT_GFX_RC6_LOCKED			XE_REG(0x138104)
 #define GT_GFX_RC6				XE_REG(0x138108)
 
+#define GT_PERF_STATUS				XE_REG(0x1381b4)
+#define   VOLTAGE_MASK				REG_GENMASK(10, 0)
+
 #define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4))
 
 #define GUC_SG_INTR_ENABLE			XE_REG(0x190038)
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index b07ea53fdbc6..a86d2d8218d5 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -3,8 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
+#include <linux/hwmon.h>
 #include <linux/types.h>
 
 #include "regs/xe_mchbar_regs.h"
@@ -26,6 +26,7 @@ enum hwm_reg_name {
 	pkg_rapl_limit,
 	pkg_power_sku,
 	pkg_power_sku_unit,
+	gt_perf_status,
 };
 
 enum hwm_reg_operation {
@@ -36,13 +37,13 @@ enum hwm_reg_operation {
 
 /*
  * SF_* - scale factors for particular quantities according to hwmon spec.
- * - voltage  - millivolts
  * - power  - microwatts
  * - curr   - milliamperes
+ * - voltage  - millivolts
  */
-#define SF_VOLTAGE	1000
 #define SF_POWER	1000000
 #define SF_CURR		1000
+#define SF_VOLTAGE	1000
 
 struct hwm_drvdata {
 	struct xe_hwmon *hwmon;
@@ -86,6 +87,11 @@ struct xe_reg hwm_get_reg(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name)
 		else
 			return XE_REG(0);
 		break;
+	case gt_perf_status:
+		if (IS_DG2(gt_to_xe(ddat->gt)))
+			return GT_PERF_STATUS;
+		else
+			return XE_REG(0);
 	default:
 		break;
 	}
@@ -254,9 +260,9 @@ static int hwm_power_rated_max_read(struct hwm_drvdata *ddat, long *value)
 }
 
 static const struct hwmon_channel_info *hwm_info[] = {
-	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
 	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
+	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
 	NULL
 };
 
@@ -279,6 +285,22 @@ static int hwm_pcode_write_i1(struct xe_gt *gt, u32 uval)
 			      uval);
 }
 
+static int hwm_get_vltg(struct hwm_drvdata *ddat, long *value)
+{
+	u32 reg_val;
+
+	if (IS_DG2(gt_to_xe(ddat->gt))) {
+		process_hwmon_reg(ddat, gt_perf_status,
+				  reg_read, &reg_val, 0, 0);
+		/* HW register value in units of 2.5 millivolt */
+		*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 25, 10);
+
+		return 0;
+	}
+
+	return -EOPNOTSUPP;
+}
+
 static umode_t
 hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
 {
@@ -432,6 +454,39 @@ hwm_curr_write(struct hwm_drvdata *ddat, u32 attr, long val)
 	}
 }
 
+static umode_t
+hwm_in_is_visible(struct hwm_drvdata *ddat, u32 attr)
+{
+	long val;
+
+	switch (attr) {
+	case hwmon_in_input:
+		return hwm_get_vltg(ddat, &val) ? 0 : 0444;
+	default:
+		return 0;
+	}
+}
+
+static int
+hwm_in_read(struct hwm_drvdata *ddat, u32 attr, long *val)
+{
+	int ret;
+
+	xe_device_mem_access_get(gt_to_xe(ddat->gt));
+
+	switch (attr) {
+	case hwmon_in_input:
+		ret = hwm_get_vltg(ddat, val);
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
 hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	       u32 attr, int channel)
@@ -445,6 +500,8 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		break;
 	case hwmon_curr:
 		return hwm_curr_is_visible(ddat, attr);
+	case hwmon_in:
+		return hwm_in_is_visible(ddat, attr);
 	default:
 		ret = 0;
 	}
@@ -463,6 +520,8 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		return hwm_power_read(ddat, attr, channel, val);
 	case hwmon_curr:
 		return hwm_curr_read(ddat, attr, val);
+	case hwmon_in:
+		return hwm_in_read(ddat, attr, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -530,6 +589,9 @@ void xe_hwmon_register(struct xe_device *xe)
 	mutex_init(&hwmon->hwmon_lock);
 	ddat = &hwmon->ddat;
 
+	/* primary GT to access device level properties */
+	ddat->gt = xe->tiles[0].primary_gt;
+
 	ddat->hwmon = hwmon;
 	snprintf(ddat->name, sizeof(ddat->name), "xe");
 
-- 
2.25.1

