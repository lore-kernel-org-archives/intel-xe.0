Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CDEC7EE29
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 12:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885E110E348;
	Tue,  6 Jun 2023 12:45:55 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDD710E341
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 12:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686055554; x=1717591554;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9CTX8TSPQHVx1p+1436avSgeMIiqAPmYSGf3t9p+Ts4=;
 b=k3wxq5/Eosqht9XVU44VP2W+tIpKNO0ijpE6HMDHIDcRZFp8/FCqK6bx
 GuPL0S7Qrroon/3XiJosZuOKKjOIoG+F9L7+nhzfHWwIpghmNd0klmC+p
 s0WMUB10zxtCIGAPwDy7hB43eI8IFKZCrNQVKeIgyHUylNnVG5jxkE1YA
 D7GzswxmP3e10hjzL4YSury3vdbCcY10c3bnYWHDZmUTRevKJWjHSXcMx
 hrAu60dTnSRSkz6TsmFmfu2i/QXMWmx7V9C7hpHtR+n8vPvOLSnV62GpZ
 L8M0BW9HjpVxc2Fmq33DydaIRHechl5Vc/iFap+bRS7pDwGkR6O5JigGj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="341297901"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="341297901"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 05:45:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="709063460"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="709063460"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 05:45:51 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  6 Jun 2023 18:20:54 +0530
Message-Id: <20230606125057.838618-4-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230606125057.838618-1-badal.nilawar@intel.com>
References: <20230606125057.838618-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 3/6] drm/xe/hwmon: Expose card reactive
 critical power
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

Expose the card reactive critical (I1) power. I1 is exposed as
power1_crit in microwatts (typically for client products) or as
curr1_crit in milliamperes (typically for server).

Co-developed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  26 +++++
 drivers/gpu/drm/xe/xe_hwmon.c                 | 106 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode_api.h             |   7 ++
 3 files changed, 139 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 54a7b668009e..fcc2aedb2aac 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -20,3 +20,29 @@ Description:	RO. Card default power limit (default TDP setting).
 
 		Only supported for particular Intel xe graphics platforms.
 
+What:		/sys/devices/.../hwmon/hwmon<i>/power1_crit
+Date:		June 2023
+KernelVersion:	6.3
+Contact:	intel-gfx@lists.freedesktop.org
+Description:	RW. Card reactive critical (I1) power limit in microwatts.
+
+		Card reactive critical (I1) power limit in microwatts is exposed
+		for client products. The power controller will throttle the
+		operating frequency if the power averaged over a window exceeds
+		this limit.
+
+		Only supported for particular Intel xe graphics platforms.
+
+What:		/sys/devices/.../hwmon/hwmon<i>/curr1_crit
+Date:		June 2023
+KernelVersion:	6.3
+Contact:	intel-gfx@lists.freedesktop.org
+Description:	RW. Card reactive critical (I1) power limit in milliamperes.
+
+		Card reactive critical (I1) power limit in milliamperes is
+		exposed for server products. The power controller will throttle
+		the operating frequency if the power averaged over a window
+		exceeds this limit.
+
+		Only supported for particular Intel xe graphics platforms.
+
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 8e248e806559..b07ea53fdbc6 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -14,6 +14,13 @@
 #include "xe_mmio.h"
 #include "xe_gt.h"
 #include "i915_drv.h"
+#include "xe_pcode.h"
+#include "xe_pcode_api.h"
+
+#define PCODE_MBOX(mbcmd, param1, param2)\
+	FIELD_PREP(PCODE_MB_COMMAND, mbcmd)\
+	| FIELD_PREP(PCODE_MB_PARAM1, param1)\
+	| FIELD_PREP(PCODE_MB_PARAM2, param2)
 
 enum hwm_reg_name {
 	pkg_rapl_limit,
@@ -31,9 +38,11 @@ enum hwm_reg_operation {
  * SF_* - scale factors for particular quantities according to hwmon spec.
  * - voltage  - millivolts
  * - power  - microwatts
+ * - curr   - milliamperes
  */
 #define SF_VOLTAGE	1000
 #define SF_POWER	1000000
+#define SF_CURR		1000
 
 struct hwm_drvdata {
 	struct xe_hwmon *hwmon;
@@ -246,13 +255,35 @@ static int hwm_power_rated_max_read(struct hwm_drvdata *ddat, long *value)
 
 static const struct hwmon_channel_info *hwm_info[] = {
 	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
+	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
+	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
 	NULL
 };
 
+/* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
+static int hwm_pcode_read_i1(struct xe_gt *gt, u32 *uval)
+{
+	/* Avoid ILLEGAL_SUBCOMMAND "mailbox access failed" warning in snb_pcode_read */
+	if (IS_DG2(gt_to_xe(gt)))
+		return -ENXIO;
+
+	return xe_pcode_read(gt, PCODE_MBOX(PCODE_POWER_SETUP,
+			     POWER_SETUP_SUBCOMMAND_READ_I1, 0),
+			     uval, 0);
+}
+
+static int hwm_pcode_write_i1(struct xe_gt *gt, u32 uval)
+{
+	return xe_pcode_write(gt, PCODE_MBOX(PCODE_POWER_SETUP,
+			      POWER_SETUP_SUBCOMMAND_WRITE_I1, 0),
+			      uval);
+}
+
 static umode_t
 hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
 {
 	u32 reg_val;
+	u32 uval;
 
 	switch (attr) {
 	case hwmon_power_max:
@@ -261,6 +292,9 @@ hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
 	case hwmon_power_rated_max:
 		return process_hwmon_reg(ddat, pkg_power_sku,
 					 reg_read, &reg_val, 0, 0) ? 0 : 0444;
+	case hwmon_power_crit:
+		return (hwm_pcode_read_i1(ddat->gt, &uval) ||
+			!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
 	default:
 		return 0;
 	}
@@ -269,11 +303,23 @@ hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
 static int
 hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
 {
+	int ret;
+	u32 uval;
+
 	switch (attr) {
 	case hwmon_power_max:
 		return hwm_power_max_read(ddat, val);
 	case hwmon_power_rated_max:
 		return hwm_power_rated_max_read(ddat, val);
+	case hwmon_power_crit:
+		ret = hwm_pcode_read_i1(ddat->gt, &uval);
+		if (ret)
+			return ret;
+		if (!(uval & POWER_SETUP_I1_WATTS))
+			return -ENODEV;
+		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
+				       SF_POWER, POWER_SETUP_I1_SHIFT);
+		return 0;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -282,9 +328,14 @@ hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
 static int
 hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
 {
+	u32 uval;
+
 	switch (attr) {
 	case hwmon_power_max:
 		return hwm_power_max_write(ddat, val);
+	case hwmon_power_crit:
+		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_POWER);
+		return hwm_pcode_write_i1(ddat->gt, uval);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -332,6 +383,55 @@ void xe_hwmon_power_max_restore(struct xe_device *xe, bool old)
 	mutex_unlock(&hwmon->hwmon_lock);
 }
 
+static umode_t
+hwm_curr_is_visible(const struct hwm_drvdata *ddat, u32 attr)
+{
+	u32 uval;
+
+	switch (attr) {
+	case hwmon_curr_crit:
+		return (hwm_pcode_read_i1(ddat->gt, &uval) ||
+			(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
+	default:
+		return 0;
+	}
+}
+
+static int
+hwm_curr_read(struct hwm_drvdata *ddat, u32 attr, long *val)
+{
+	int ret;
+	u32 uval;
+
+	switch (attr) {
+	case hwmon_curr_crit:
+		ret = hwm_pcode_read_i1(ddat->gt, &uval);
+		if (ret)
+			return ret;
+		if (uval & POWER_SETUP_I1_WATTS)
+			return -ENODEV;
+		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
+				       SF_CURR, POWER_SETUP_I1_SHIFT);
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int
+hwm_curr_write(struct hwm_drvdata *ddat, u32 attr, long val)
+{
+	u32 uval;
+
+	switch (attr) {
+	case hwmon_curr_crit:
+		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_CURR);
+		return hwm_pcode_write_i1(ddat->gt, uval);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static umode_t
 hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	       u32 attr, int channel)
@@ -343,6 +443,8 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	case hwmon_power:
 		ret = hwm_power_is_visible(ddat, attr, channel);
 		break;
+	case hwmon_curr:
+		return hwm_curr_is_visible(ddat, attr);
 	default:
 		ret = 0;
 	}
@@ -359,6 +461,8 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	switch (type) {
 	case hwmon_power:
 		return hwm_power_read(ddat, attr, channel, val);
+	case hwmon_curr:
+		return hwm_curr_read(ddat, attr, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -373,6 +477,8 @@ hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	switch (type) {
 	case hwmon_power:
 		return hwm_power_write(ddat, attr, channel, val);
+	case hwmon_curr:
+		return hwm_curr_write(ddat, attr, val);
 	default:
 		return -EOPNOTSUPP;
 	}
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 837ff7c71280..5935cfe30204 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -35,6 +35,13 @@
 #define     DGFX_GET_INIT_STATUS	0x0
 #define     DGFX_INIT_STATUS_COMPLETE	0x1
 
+#define   PCODE_POWER_SETUP			0x7C
+#define     POWER_SETUP_SUBCOMMAND_READ_I1	0x4
+#define     POWER_SETUP_SUBCOMMAND_WRITE_I1	0x5
+#define	    POWER_SETUP_I1_WATTS		REG_BIT(31)
+#define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
+#define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
+
 struct pcode_err_decode {
 	int errno;
 	const char *str;
-- 
2.25.1

