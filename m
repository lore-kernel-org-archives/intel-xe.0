Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF600CEACEB
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 21:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5ED10EB48;
	Fri, 14 Nov 2025 21:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wg+K5juy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55A210EB33
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 21:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763156630; x=1794692630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ix9siTqjDFcZuEAZMHFHNKkHpKamIJADOG1UIQ41+6U=;
 b=Wg+K5juyFsBBXyeUSuHLBHJL6kX9tLrUb2Gd+KOkiRnqhz+zZ7On3D8v
 84RG8L3dGxpPSe58M0ZFQCS0QOkshY7c5IwuRPwiysXnkzrsQy91w0rzo
 M8OI6akNBwe+cOgP/pb1VF5C6a+ST5ukv8QwF88G01FbupSd2ecIRlcLW
 JbYX0WPMyFC957QqbDVpkxKfjRsnt14wIo9UFE+1YI1mR29EcLQ3K7hk4
 wB2fHd7KhL3oB+xtylXl3abB3p6i7oi/sIT9IGCQeTgTaetpnQiknVNCP
 4jJSPFRzf+RKhkznSUsbmdWE/4xMjjspilKVHJAccNlO5qLJX79LCaC9G w==;
X-CSE-ConnectionGUID: j/M3X7aASum6SxfKamQ/ow==
X-CSE-MsgGUID: TEPihxP6QSa3uICUXpGW9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82648327"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82648327"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:50 -0800
X-CSE-ConnectionGUID: tly4N8YCS0SoSPSE1CYU7Q==
X-CSE-MsgGUID: oVtKKzsJQr+KpV0JFd7ZhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="190308341"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v3 23/27] drm/xe/hwmon: Use scope-based runtime PM
Date: Fri, 14 Nov 2025 13:43:59 -0800
Message-ID: <20251114214335.2388972-52-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114214335.2388972-29-matthew.d.roper@intel.com>
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
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

Use scope-based runtime power management in the hwmon code for
consistency with other parts of the driver.

v2:
 - Drop unnecessary 'ret' variables.  (Gustavo)

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 52 ++++++++++-------------------------
 1 file changed, 14 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 97879daeefc1..ff2aea52ef75 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -502,7 +502,7 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 
 	int ret = 0;
 
-	xe_pm_runtime_get(hwmon->xe);
+	guard(xe_pm_runtime)(hwmon->xe);
 
 	mutex_lock(&hwmon->hwmon_lock);
 
@@ -521,8 +521,6 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
-	xe_pm_runtime_put(hwmon->xe);
-
 	x = REG_FIELD_GET(PWR_LIM_TIME_X, reg_val);
 	y = REG_FIELD_GET(PWR_LIM_TIME_Y, reg_val);
 
@@ -604,7 +602,7 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 	rxy = REG_FIELD_PREP(PWR_LIM_TIME_X, x) |
 			       REG_FIELD_PREP(PWR_LIM_TIME_Y, y);
 
-	xe_pm_runtime_get(hwmon->xe);
+	guard(xe_pm_runtime)(hwmon->xe);
 
 	mutex_lock(&hwmon->hwmon_lock);
 
@@ -616,8 +614,6 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
-	xe_pm_runtime_put(hwmon->xe);
-
 	return count;
 }
 
@@ -1124,37 +1120,25 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	      int channel, long *val)
 {
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
-	int ret;
 
-	xe_pm_runtime_get(hwmon->xe);
+	guard(xe_pm_runtime)(hwmon->xe);
 
 	switch (type) {
 	case hwmon_temp:
-		ret = xe_hwmon_temp_read(hwmon, attr, channel, val);
-		break;
+		return xe_hwmon_temp_read(hwmon, attr, channel, val);
 	case hwmon_power:
-		ret = xe_hwmon_power_read(hwmon, attr, channel, val);
-		break;
+		return xe_hwmon_power_read(hwmon, attr, channel, val);
 	case hwmon_curr:
-		ret = xe_hwmon_curr_read(hwmon, attr, channel, val);
-		break;
+		return xe_hwmon_curr_read(hwmon, attr, channel, val);
 	case hwmon_in:
-		ret = xe_hwmon_in_read(hwmon, attr, channel, val);
-		break;
+		return xe_hwmon_in_read(hwmon, attr, channel, val);
 	case hwmon_energy:
-		ret = xe_hwmon_energy_read(hwmon, attr, channel, val);
-		break;
+		return xe_hwmon_energy_read(hwmon, attr, channel, val);
 	case hwmon_fan:
-		ret = xe_hwmon_fan_read(hwmon, attr, channel, val);
-		break;
+		return xe_hwmon_fan_read(hwmon, attr, channel, val);
 	default:
-		ret = -EOPNOTSUPP;
-		break;
+		return -EOPNOTSUPP;
 	}
-
-	xe_pm_runtime_put(hwmon->xe);
-
-	return ret;
 }
 
 static int
@@ -1162,25 +1146,17 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	       int channel, long val)
 {
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
-	int ret;
 
-	xe_pm_runtime_get(hwmon->xe);
+	guard(xe_pm_runtime)(hwmon->xe);
 
 	switch (type) {
 	case hwmon_power:
-		ret = xe_hwmon_power_write(hwmon, attr, channel, val);
-		break;
+		return xe_hwmon_power_write(hwmon, attr, channel, val);
 	case hwmon_curr:
-		ret = xe_hwmon_curr_write(hwmon, attr, channel, val);
-		break;
+		return xe_hwmon_curr_write(hwmon, attr, channel, val);
 	default:
-		ret = -EOPNOTSUPP;
-		break;
+		return -EOPNOTSUPP;
 	}
-
-	xe_pm_runtime_put(hwmon->xe);
-
-	return ret;
 }
 
 static int xe_hwmon_read_label(struct device *dev,
-- 
2.51.1

