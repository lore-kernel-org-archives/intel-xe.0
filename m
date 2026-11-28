Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2F0606A31E
	for <intel-xe@archiver.kernel.org>; Sat, 28 Nov 2026 05:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UWrwecJa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5006C10E273;
	Sat, 28 Nov 2026 05:58:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB55F10E273
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Nov 2026 05:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795845479; x=1827381479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g2B7LE0420pxiUKLTnAfyIadounatN2Bn8+pqjkb0rc=;
 b=UWrwecJaOYEj5sx0MqpfYH2B5iJ9Hsr4/INtYt2XnqjQwiGlOQlJB0FM
 IohSxhHGg1nQTgxbk5cxeAz2ikztQBvHFompgkH4as3HTvovpUxDsuLVb
 puzuqdLHp2A9c/x53jwf7pJq2cbsCtOFmWJw+TuMKzT3WDz7qJlIt7xBf
 mTYg9DRUmbFrv29yaRoaDvFCvFWJp0kX2iM3zoRNrnE2HtPnEdN+iBAu1
 sOJBzro0vcWW2AgrMu2y9ButtQPOcgkehs3GyDsAKD7s2I2iu0qu4qkyr
 u3C48ew01fmwxs/kZqfy/5R3xmfoAR0pMv1TnA3IBvZHyU1JwQeDZEtfl A==;
X-CSE-ConnectionGUID: 7T9RpqyhQPWb1/WqZl4kcQ==
X-CSE-MsgGUID: fe85VlwLRSeqbUO5Kq0cQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4754887"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4754887"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 21:57:58 -0800
X-CSE-ConnectionGUID: e22Pf8AgRgaVNK7Zmg0kOQ==
X-CSE-MsgGUID: K8ECcGztQICJMgzatzPUUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; d="scan'208";a="12304249"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 21:57:56 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 01/10] drm/xe/hwmon: Initialize fan-control backend and
 table cache
Date: Sat, 28 Nov 2026 11:29:14 +0530
Message-Id: <20261128055923.3316956-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261128055923.3316956-1-karthik.poosa@intel.com>
References: <20261128055923.3316956-1-karthik.poosa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Initialize Xe hwmon fan-control support by detecting enabled fans,
reading stock fan control points and min PWM.

FSC_READ_NUM_FANS returns a bitmask of enabled fans, so use it as a mask
when exposing fanN_input.

v2:
 - Avoid user table initialization during probe. (Badal)
 - Move unused code to appropriate patches.
 - Use xe helpers for dmesg logs.

v3:
 - Rebase.
 - Refine a few debug log messages and comments.
 - Update xe_hwmon_read_fan_control_info() to return on any stock table
   read failures.
 - Avoid returning when num_fans is 0 in
   xe_hwmon_get_preregistration_info(), ensuring thermal mailbox
   initialization is not skipped.
 - Remove XE_PCODE_FAN_CONTROL_TIMEOUT_MS which is unnecessary as default
   timeout itself is now 10ms.
 - Use xe_pcode_read() instead of xe_pcode_read_timeout().
 - Rename fan_control_point_count to point_count in struct fan_table.
 - Resolve kernel-doc warnings.
 - Add valid check for stock table fan point count.
 - Use the fan-enable bitmap reported by FSC_READ_NUM_FANS when enumerating
   fans. This avoids assuming contiguous fan indices and allows masks with
   gaps to be represented correctly in the hwmon interface.

v4:
 - Clamp unsupported fan masks and oversized stock tables instead of
   failing initialization. (Soham)
 - On stock table read failure, mark that fan's table empty and continue
   with the remaining fans; fan_input stays visible. (Soham)
 - Clear fan enable mask and min PWM on pcode read failure. (Soham)
 - Fix FCP_INDEX() type safety and clean up macro usage. (Soham)
 - Use xe_hwmon_pcode_read_fan_control() for fan mailbox reads. (Soham)
 - Fix kernel-doc for fan_table_type and nested fan_table members.
 - Skip min PWM read for fans without a stock table.
 - Make xe_hwmon_get_fan_enable_mask() return void.

v5:
 - Remove min_pwm as it is no longer supported by the hardware.
 - Change xe_hwmon_get_fan_enable_mask() return type from void to int.
 - Copy the stock table to the fan info only if all points are read
   successfully.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c     | 162 +++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_pcode_api.h |   4 +
 2 files changed, 151 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 717845b7e6a1..503f18625338 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -22,6 +22,7 @@
 #include "xe_pcode_api.h"
 #include "xe_sriov.h"
 #include "xe_pm.h"
+#include "xe_printk.h"
 #include "xe_vsec.h"
 #include "regs/xe_pmt.h"
 
@@ -139,13 +140,51 @@ struct xe_hwmon_energy_info {
 };
 
 /**
- * struct xe_hwmon_fan_info - to cache previous fan reading
+ * enum fan_table_type - fan table types tracked per fan
+ */
+enum fan_table_type {
+	/** @STOCK_FAN_TABLE: firmware-provided fan table */
+	STOCK_FAN_TABLE,
+	/** @USER_FAN_TABLE: user fan table written through sysfs */
+	USER_FAN_TABLE,
+	/** @FAN_TABLE_MAX: number of fan tables tracked per fan */
+	FAN_TABLE_MAX,
+};
+
+/* Check if a fan is enabled based on the fan_enable_mask got from FSC_READ_NUM_FANS. */
+#define IS_FAN_ENABLED(hwmon, fan) ((hwmon)->fan_enable_mask & BIT(fan))
+
+/* Maximum number of fan control points supported by each fan. */
+#define MAX_FAN_CONTROL_POINTS	10
+
+/* Fan control point index: bit31 selects fan table type; bits30:0 control point index. */
+#define FCP_INDEX(table_type, point_num) (((u32)(table_type) << 31) | \
+						((u32)(point_num) & GENMASK(30, 0)))
+
+/**
+ * struct xe_hwmon_fan_info - cached fan telemetry and control state
+ *
+ * Each fan keeps the latest tachometer sampling state along with two fan
+ * tables: the stock table discovered from firmware and the user table managed
+ * by hwmon sysfs writes.
  */
 struct xe_hwmon_fan_info {
 	/** @reg_val_prev: previous fan reg val */
 	u32 reg_val_prev;
 	/** @time_prev: previous timestamp */
 	u64 time_prev;
+	/** @fan_table: fan control tables */
+	struct fan_table {
+		/** @fan_table.point_count: number of fan control points */
+		u8 point_count;
+		/** @fan_table.fcp: array of fan control points */
+		struct fan_control_point {
+			/** @fan_table.fcp.temp: temperature in degree celsius */
+			u8 temp;
+			/** @fan_table.fcp.speed: fan speed in percentage */
+			u8 speed;
+		} fcp[MAX_FAN_CONTROL_POINTS];
+	} fan_table[FAN_TABLE_MAX];
 };
 
 /**
@@ -194,6 +233,8 @@ struct xe_hwmon {
 	int scl_shift_time;
 	/** @ei: Energy info for energyN_input */
 	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
+	/** @fan_enable_mask: bitmask of available fans */
+	u32 fan_enable_mask;
 	/** @fi: Fan info for fanN_input */
 	struct xe_hwmon_fan_info fi[FAN_MAX];
 	/** @read_power_limit_from_pcode: pcode accepted power limits write for the channel */
@@ -1084,17 +1125,106 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
 			      (uval & POWER_SETUP_I1_DATA_MASK));
 }
 
-static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u32 *uval)
+static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u8 fan_num,
+					   u32 *uval)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
 
+	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, fan_num),
+				     uval, NULL);
+}
+
+static int xe_hwmon_get_fan_enable_mask(struct xe_hwmon *hwmon)
+{
+	int ret;
+
 	/* Platforms that don't return correct value */
-	if (hwmon->xe->info.platform == XE_DG2 && subcmd == FSC_READ_NUM_FANS) {
-		*uval = 2;
+	if (hwmon->xe->info.platform == XE_DG2) {
+		hwmon->fan_enable_mask = GENMASK(1, 0);
 		return 0;
 	}
 
-	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL);
+	ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, 0,
+					      &hwmon->fan_enable_mask);
+	if (ret) {
+		hwmon->fan_enable_mask = 0;
+		xe_warn(hwmon->xe, "failed to read number of fans, ret=%d\n", ret);
+		return ret;
+	}
+
+	/* Check if fan mask exceeds FAN_MAX and log a warning if it does */
+	if (hwmon->fan_enable_mask & ~GENMASK(FAN_MAX - 1, 0)) {
+		xe_warn(hwmon->xe, "Fan enable mask exceeds %d supported fans, clamping\n",
+			FAN_MAX);
+		hwmon->fan_enable_mask &= GENMASK(FAN_MAX - 1, 0);
+	}
+
+	xe_info(hwmon->xe, "Number of fans detected: %u\n", hweight32(hwmon->fan_enable_mask));
+
+	return 0;
+}
+
+static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
+{
+	int err = 0;
+	int point;
+	int fan;
+	int ret;
+
+	for (fan = 0; fan < FAN_MAX; fan++) {
+		struct fan_control_point stock_fcp[MAX_FAN_CONTROL_POINTS];
+		struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
+		u32 stock_fcp_count = 0;
+
+		if (!IS_FAN_ENABLED(hwmon, fan))
+			continue;
+
+		ret = xe_hwmon_pcode_read_fan_control(hwmon,
+						      FSC_READ_STOCK_FAN_CONTROL_POINTS,
+						      fan, &stock_fcp_count);
+		if (ret || !stock_fcp_count) {
+			xe_warn(hwmon->xe,
+				"fan %d stock table unavailable, ret=%d, point count=%u\n",
+				fan, ret, ret ? 0 : stock_fcp_count);
+			err = ret ?: -ENODATA;
+			continue;
+		}
+
+		if (stock_fcp_count > MAX_FAN_CONTROL_POINTS) {
+			xe_warn(hwmon->xe,
+				"fan %d stock table point count %u exceeds maximum %u, clamping\n",
+				fan, stock_fcp_count, MAX_FAN_CONTROL_POINTS);
+			stock_fcp_count = MAX_FAN_CONTROL_POINTS;
+		}
+
+		xe_dbg(hwmon->xe, "fan %d stock table point count is %u\n", fan, stock_fcp_count);
+
+		/* Cache the stock fan table for later use. */
+		for (point = 0; point < stock_fcp_count; point++) {
+			u32 fcp = FCP_INDEX(STOCK_FAN_TABLE, point);
+
+			ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_FAN_TABLE, fan, &fcp);
+			if (ret) {
+				xe_warn(hwmon->xe, "failed to read fan %d stock point %d, ret=%d\n",
+					fan, point, ret);
+				err = ret;
+				break;
+			}
+
+			stock_fcp[point].temp =	REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
+			stock_fcp[point].speed = REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
+			xe_dbg(hwmon->xe, "fan %d stock point %d: temp %u C, speed %u %%\n",
+			       fan, point, stock_fcp[point].temp, stock_fcp[point].speed);
+		}
+
+		if (point < stock_fcp_count)
+			continue;
+
+		memcpy(fi->fan_table[STOCK_FAN_TABLE].fcp, stock_fcp,
+		       stock_fcp_count * sizeof(stock_fcp[0]));
+		fi->fan_table[STOCK_FAN_TABLE].point_count = stock_fcp_count;
+	}
+	return err;
 }
 
 static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
@@ -1632,17 +1762,12 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 static umode_t
 xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
-	u32 uval = 0;
-
 	if (!hwmon->xe->info.has_fan_control)
 		return 0;
 
 	switch (attr) {
 	case hwmon_fan_input:
-		if (xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, &uval))
-			return 0;
-
-		return channel < uval ? 0444 : 0;
+		return IS_FAN_ENABLED(hwmon, channel) ? 0444 : 0;
 	default:
 		return 0;
 	}
@@ -1876,11 +2001,18 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 		if (xe_hwmon_is_visible(hwmon, hwmon_energy, hwmon_energy_input, channel))
 			xe_hwmon_energy_get(hwmon, channel, &energy);
 
-	/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
-	for (channel = 0; channel < FAN_MAX; channel++)
-		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
-			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
+	if (hwmon->xe->info.has_fan_control) {
+		xe_hwmon_get_fan_enable_mask(hwmon);
+
+		/* Initialize 'struct xe_hwmon_fan_info' with initial fan register reading. */
+		for (channel = 0; channel < FAN_MAX; channel++)
+			if (IS_FAN_ENABLED(hwmon, channel))
+				xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
 
+		/* Fan control tables initialization */
+		if (xe_hwmon_read_fan_control_info(hwmon))
+			xe_warn(hwmon->xe, "Fan control tables are not available\n");
+	}
 	return xe_hwmon_init_temp_info(hwmon);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index f05846931059..387885760205 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -87,6 +87,10 @@
 
 #define   FAN_SPEED_CONTROL			0x7D
 #define     FSC_READ_NUM_FANS			0x4
+#define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
+#define     FSC_READ_FAN_TABLE			0x7
+#define     FAN_CONTROL_POINT_TEMP_MASK		REG_GENMASK(7, 0)
+#define     FAN_CONTROL_POINT_SPEED_MASK	REG_GENMASK(15, 8)
 
 #define PCODE_SCRATCH(x)		XE_REG(0x138320 + ((x) * 4))
 /* PCODE_SCRATCH0 */
-- 
2.34.1

