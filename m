Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A32CD8CB9
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 07:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FBC10ED41;
	Thu, 11 Jun 2026 07:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F+1Wv73P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0434C10ED3F
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 07:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781163276; x=1812699276;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TUTG8r54b0QDU75wkt6tL7mNplEWMytusW11K7ROd1A=;
 b=F+1Wv73PncfFs0s+9cIUrv990qp2SI6lFoLhaRhB2YNfNftxeNsmJI/d
 O1dM3hpdwoKTIz11yvK12Nnzpjz9rSo7UXjVTK66wecfo0BGktC0XQcXf
 6R/R3rt10GSOqfjVyD2DMFCMKu/h6Xkn27Zoz8kL4g8YanLjdzOCzhaXq
 5QwuvPnxGCwFtDPxolhgoK4LtsPC/S3tmuQvOb7BXqJXpnScEwD+nbetE
 ZOLpOLUwH8g0pJ6Q4olt21mM8fBXAGSl4NLD6RtlzLG2/wDJm04yCGp6s
 iQQoOZHgPKj8bvSZAw/PHGJUJt91kPMFMVU4iihAlLs0hpLSaXtbOJle/ Q==;
X-CSE-ConnectionGUID: q3Pz2CYRRIW5OOzwi5igVw==
X-CSE-MsgGUID: FVOIcoVHS6eM8BuZBFgEaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92535303"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="92535303"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:34:36 -0700
X-CSE-ConnectionGUID: enWrZ0uZTLuZVq5fSVP1NA==
X-CSE-MsgGUID: YwnkjKfCQw2hymhfoOwXBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="251499832"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 00:34:33 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 ravi.kishore.koppuravuri@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH] drm/xe/pcode: add default timeout macro and pass read timeout
Date: Thu, 11 Jun 2026 13:13:55 +0530
Message-Id: <20260611074355.3562414-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Introduce a default 1 ms pcode timeout macro in xe_pcode.h and modify
xe_pcode_read() to accept a timeout value from its callers.
Apply this shared default timeout macro across existing read/write call
sites so that the mailbox timeout is centralized and defined in one place.
This shall also allow callers to override the default timeout when needed,
enabling explicit use of custom timeouts for specific commands.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display_pcode.c |  2 +-
 drivers/gpu/drm/xe/xe_device_sysfs.c          | 16 ++++++------
 drivers/gpu/drm/xe/xe_hwmon.c                 | 26 +++++++++++--------
 drivers/gpu/drm/xe/xe_late_bind_fw.c          |  3 ++-
 drivers/gpu/drm/xe/xe_pcode.c                 |  4 +--
 drivers/gpu/drm/xe/xe_pcode.h                 |  9 ++++---
 drivers/gpu/drm/xe/xe_vram_freq.c             |  4 +--
 7 files changed, 36 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display_pcode.c b/drivers/gpu/drm/xe/display/xe_display_pcode.c
index f6820ef7e666..aec4cbd25a75 100644
--- a/drivers/gpu/drm/xe/display/xe_display_pcode.c
+++ b/drivers/gpu/drm/xe/display/xe_display_pcode.c
@@ -11,7 +11,7 @@ static int xe_display_pcode_read(struct drm_device *drm, u32 mbox, u32 *val, u32
 	struct xe_device *xe = to_xe_device(drm);
 	struct xe_tile *tile = xe_device_get_root_tile(xe);
 
-	return xe_pcode_read(tile, mbox, val, val1);
+	return xe_pcode_read(tile, mbox, val, val1, XE_PCODE_DEFAULT_TIMEOUT_MS);
 }
 
 static int xe_display_pcode_write_timeout(struct drm_device *drm, u32 mbox, u32 val, int timeout_ms)
diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index a73e0e957cb0..02462dca68a2 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -86,18 +86,18 @@ lb_fan_control_version_show(struct device *dev, struct device_attribute *attr, c
 	guard(xe_pm_runtime)(xe);
 
 	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
-			    &cap, NULL);
+			    &cap, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 	if (ret)
 		return ret;
 
 	if (REG_FIELD_GET(V1_FAN_PROVISIONED, cap)) {
 		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_LOW, 0),
-				    &ver_low, NULL);
+				    &ver_low, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 		if (ret)
 			return ret;
 
 		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_HIGH, 0),
-				    &ver_high, NULL);
+				    &ver_high, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 		if (ret)
 			return ret;
 
@@ -123,18 +123,18 @@ lb_voltage_regulator_version_show(struct device *dev, struct device_attribute *a
 	guard(xe_pm_runtime)(xe);
 
 	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
-			    &cap, NULL);
+			    &cap, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 	if (ret)
 		return ret;
 
 	if (REG_FIELD_GET(VR_PARAMS_PROVISIONED, cap)) {
 		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_LOW, 0),
-				    &ver_low, NULL);
+				    &ver_low, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 		if (ret)
 			return ret;
 
 		ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_VERSION_HIGH, 0),
-				    &ver_high, NULL);
+				    &ver_high, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 		if (ret)
 			return ret;
 
@@ -164,7 +164,7 @@ static umode_t late_bind_attr_is_visible(struct kobject *kobj,
 	int ret;
 
 	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
-			    &cap, NULL);
+			    &cap, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 	if (ret)
 		return 0;
 
@@ -248,7 +248,7 @@ auto_link_downgrade_status_show(struct device *dev, struct device_attribute *att
 	guard(xe_pm_runtime)(xe);
 	ret = xe_pcode_read(xe_device_get_root_tile(xe),
 			    PCODE_MBOX(DGFX_PCODE_STATUS, DGFX_GET_INIT_STATUS, 0),
-			    &val, NULL);
+			    &val, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 
 	return ret ?: sysfs_emit(buf, "%u\n", REG_FIELD_GET(DGFX_LINK_DOWNGRADE_STATUS, val));
 }
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index de3f2aeffc3f..ddf3ba906d1a 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -202,8 +202,9 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
 						  (channel == CHANNEL_CARD) ?
 						  READ_PSYSGPU_POWER_LIMIT :
-						  READ_PACKAGE_POWER_LIMIT,
-						  prepare_power_limit_param2(hwmon)), &val0, &val1);
+					  READ_PACKAGE_POWER_LIMIT,
+					  prepare_power_limit_param2(hwmon)),
+				    &val0, &val1, XE_PCODE_DEFAULT_TIMEOUT_MS);
 
 	if (ret) {
 		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
@@ -235,8 +236,9 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
 						  (channel == CHANNEL_CARD) ?
 						  READ_PSYSGPU_POWER_LIMIT :
-						  READ_PACKAGE_POWER_LIMIT,
-						  prepare_power_limit_param2(hwmon)), &val0, &val1);
+					  READ_PACKAGE_POWER_LIMIT,
+					  prepare_power_limit_param2(hwmon)),
+				    &val0, &val1, XE_PCODE_DEFAULT_TIMEOUT_MS);
 	if (ret)
 		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
 			channel, val0, val1, ret);
@@ -771,7 +773,8 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
 	int ret;
 
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
-			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
+			    &hwmon->temp.data[0], &hwmon->temp.data[1],
+			   XE_PCODE_DEFAULT_TIMEOUT_MS);
 	if (ret)
 		return ret;
 
@@ -779,7 +782,7 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
 		hwmon->temp.data[0], hwmon->temp.data[1]);
 
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_CONFIG, 0),
-			    &config, NULL);
+			    &config, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 	if (ret)
 		return ret;
 
@@ -798,7 +801,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 
 	for (i = 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
 		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
-				    (dword + i), NULL);
+				    (dword + i), NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 		if (ret)
 			return ret;
 		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i, dword[i]);
@@ -819,7 +822,7 @@ static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
 	int ret;
 
 	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA,
-						  PCIE_SENSOR_GROUP_ID), &data, NULL);
+			    PCIE_SENSOR_GROUP_ID), &data, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 	if (ret)
 		return ret;
 
@@ -844,7 +847,7 @@ static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
 
 	return xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
 			     POWER_SETUP_SUBCOMMAND_READ_I1, 0),
-			     uval, NULL);
+			     uval, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 }
 
 static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
@@ -853,7 +856,7 @@ static int xe_hwmon_pcode_write_i1(const struct xe_hwmon *hwmon, u32 uval)
 
 	return xe_pcode_write(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
 			      POWER_SETUP_SUBCOMMAND_WRITE_I1, 0),
-			      (uval & POWER_SETUP_I1_DATA_MASK));
+			      (uval & POWER_SETUP_I1_DATA_MASK), XE_PCODE_DEFAULT_TIMEOUT_MS);
 }
 
 static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 subcmd, u32 *uval)
@@ -866,7 +869,8 @@ static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon *hwmon, u32 sub
 		return 0;
 	}
 
-	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL);
+	return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, subcmd, 0), uval, NULL,
+						 XE_PCODE_DEFAULT_TIMEOUT_MS);
 }
 
 static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, int channel,
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 768442ca7da6..2c8aef2b533b 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -190,7 +190,8 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind, u32 *num_fan
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 
 	return xe_pcode_read(root_tile,
-			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), num_fans, NULL);
+			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0),
+			     num_fans, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 }
 
 void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 866986694d9c..7d1e33bb5800 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -132,12 +132,12 @@ int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0, u32 data
 	return err;
 }
 
-int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1)
+int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1, u16 timeout_ms)
 {
 	int err;
 
 	mutex_lock(&tile->pcode.lock);
-	err = pcode_mailbox_rw(tile, mbox, val, val1, 1, true, false);
+	err = pcode_mailbox_rw(tile, mbox, val, val1, timeout_ms, true, false);
 	mutex_unlock(&tile->pcode.lock);
 
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
index 18260c29e620..1b4319470b5f 100644
--- a/drivers/gpu/drm/xe/xe_pcode.h
+++ b/drivers/gpu/drm/xe/xe_pcode.h
@@ -12,19 +12,22 @@ struct drm_device;
 struct xe_device;
 struct xe_tile;
 
+#define XE_PCODE_DEFAULT_TIMEOUT_MS	(1)
+
 int xe_pcode_init_early(struct xe_tile *tile);
 int xe_pcode_probe_early(struct xe_device *xe);
 int xe_pcode_ready(struct xe_device *xe, bool locked);
 int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
 				 u32 max_gt_freq);
-int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1);
+int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1,
+		  u16 timeout_ms);
 int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 val,
 			   int timeout_ms);
 int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
 			     u32 data1, int timeout);
 
-#define xe_pcode_write(tile, mbox, val) \
-	xe_pcode_write_timeout(tile, mbox, val, 1)
+#define xe_pcode_write(tile, mbox, val, timeout_ms) \
+	xe_pcode_write_timeout(tile, mbox, val, timeout_ms)
 
 int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
 		     u32 reply_mask, u32 reply, int timeout_ms);
diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
index 8717367ccd4c..ca52e25caef3 100644
--- a/drivers/gpu/drm/xe/xe_vram_freq.c
+++ b/drivers/gpu/drm/xe/xe_vram_freq.c
@@ -40,7 +40,7 @@ static ssize_t max_freq_show(struct device *dev, struct device_attribute *attr,
 		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_P0)
 		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
 
-	err = xe_pcode_read(tile, mbox, &val, NULL);
+	err = xe_pcode_read(tile, mbox, &val, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 	if (err)
 		return err;
 
@@ -62,7 +62,7 @@ static ssize_t min_freq_show(struct device *dev, struct device_attribute *attr,
 		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_PN)
 		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
 
-	err = xe_pcode_read(tile, mbox, &val, NULL);
+	err = xe_pcode_read(tile, mbox, &val, NULL, XE_PCODE_DEFAULT_TIMEOUT_MS);
 	if (err)
 		return err;
 
-- 
2.25.1

