Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9BCCD13D9
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 23:20:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385C910E4A2;
	Mon, 10 Nov 2025 23:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Up4uPY5g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B8B10E49B
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 23:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762816834; x=1794352834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IK/vwrUcjmFzHPnxpiXQGDDElpnubeWYv6LR85GFAkw=;
 b=Up4uPY5gJuApeAjxgJuzbNCN8ZdVByTXOntfe4t6iiwDHUqHhtVppjA6
 r5Ihi2rFZ0kbg0g17vbo7YKSK7/23J4sX/KbZF4ub9UP6CHBNavtLrfYr
 bDQkANo3yonLFxFOpegLvjDKh4IUrhMDXOWWfuYjCLp32LUPLpSKvKBAf
 AR05dQTTAXAnj8P4QYiNgOZAiWUIe9ckA7WHS9SMaURzfS9E3Vxyx6FHj
 AhgOLKXjNIKhfSeI0JMRo5GM9v5k0WXoYmA4R2aZuwT1oUm7Xt8YmRf+c
 kYm+bsj4vWHny3lA5BC7gV9kzqLVxqYWqRsFuAB5ZN4E2nlUe1ve1gpnS g==;
X-CSE-ConnectionGUID: ro3BmLxRT8GAJDVWxNKWHg==
X-CSE-MsgGUID: sZc7rgYXRL2Hte+XjOP27g==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75486463"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="75486463"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:33 -0800
X-CSE-ConnectionGUID: +u1VPHYjRXCM/iTT4AAbhQ==
X-CSE-MsgGUID: sigrzn9rRSalYyyEazeLAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="189244025"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:20:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 26/30] drm/xe/hwmon: Use scope-based runtime PM
Date: Mon, 10 Nov 2025 15:20:44 -0800
Message-ID: <20251110232017.1475869-58-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251110232017.1475869-32-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
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

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 97879daeefc1..5ad351fad6e2 100644
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
 
@@ -1126,7 +1122,7 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
 	int ret;
 
-	xe_pm_runtime_get(hwmon->xe);
+	guard(xe_pm_runtime)(hwmon->xe);
 
 	switch (type) {
 	case hwmon_temp:
@@ -1152,8 +1148,6 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		break;
 	}
 
-	xe_pm_runtime_put(hwmon->xe);
-
 	return ret;
 }
 
@@ -1164,7 +1158,7 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
 	int ret;
 
-	xe_pm_runtime_get(hwmon->xe);
+	guard(xe_pm_runtime)(hwmon->xe);
 
 	switch (type) {
 	case hwmon_power:
@@ -1178,8 +1172,6 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		break;
 	}
 
-	xe_pm_runtime_put(hwmon->xe);
-
 	return ret;
 }
 
-- 
2.51.1

