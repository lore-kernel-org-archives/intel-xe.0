Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA93CEE343
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 16:44:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83B510E50B;
	Tue, 18 Nov 2025 16:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D5S0KJkW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56EF610E4FB
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 16:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763484231; x=1795020231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ix9siTqjDFcZuEAZMHFHNKkHpKamIJADOG1UIQ41+6U=;
 b=D5S0KJkW52nGGE6b9uvO68PQzBRCvm9VYcog4b+TZrEIV93f1m/HoFZ+
 YyLV+FaZ7FREvnsW3MEeZlPA41HyiQhTlXRnF+h/6uygzvZ2agmszXHNn
 /wkwlMZTA3s9PAg38IO+LGJizDjY8kMMEBcdSeX1UsVDHKGvANH583B0B
 T0aZRvRz0mhpZ5sbAR3qoDAdI1iJY8rNaZ8RugEepgyggzuaE7bcvwKEH
 LtFMggHGDqTBf6kntPsCL/fWvnvCDPaslyHnA0RB++cSWwCY3v/2vyadt
 tJ+qda6fxv6E6cNCB++UDK5N8wF/50dCqmqZXQcxIzk4S9Iit6ApDZpdc A==;
X-CSE-ConnectionGUID: GN1mn3flQoyzub75Rv405w==
X-CSE-MsgGUID: kLSnwA+aQee/yTsIJ2ZEWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65544789"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65544789"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:51 -0800
X-CSE-ConnectionGUID: fbl0uph6TkWKxd541cTCug==
X-CSE-MsgGUID: m2qL4UyBTDmHzwOIrPgmqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190952267"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:52 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [CI 23/27] drm/xe/hwmon: Use scope-based runtime PM
Date: Tue, 18 Nov 2025 08:44:02 -0800
Message-ID: <20251118164338.3572146-52-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118164338.3572146-29-matthew.d.roper@intel.com>
References: <20251118164338.3572146-29-matthew.d.roper@intel.com>
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

