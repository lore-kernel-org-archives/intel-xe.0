Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AA1CCFA19
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 18:13:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC34B10EB9E;
	Fri,  7 Nov 2025 18:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RnhXEbfu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A045E10EB83
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 18:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762539212; x=1794075212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IK/vwrUcjmFzHPnxpiXQGDDElpnubeWYv6LR85GFAkw=;
 b=RnhXEbfu6Rub1QIpI5qF608tITdEhSO0Oy2+qPVrit0n9sGrhmarl1II
 tqZx2SajcOy8vnf9AWpr9piuJzQw0Vh9KRuCVixLM5+dg9GRAGO5cdC+D
 OvQMDZUf4/RS287uTr1QldrgDbt1VkPp6e6xzQeellGTRH280AlSrQyf6
 5zFIggQGf0iYgodJBSjcLnONtJoqQA84XMZWSlVnFB9sUxgAQvm4eAUuY
 SgUU4Djm/JxTqz+97zQN0rAVy5nqWkEIaafp3WtoKXuSAtHr0DgC+4+bg
 V+FfKj9RMYTDGsb3NKvwG1nfQ+jdHSelXOtJpQvxw6Rpin3ULZaKalZxs g==;
X-CSE-ConnectionGUID: RcWX9fPTS/yrOHT1AEVlfQ==
X-CSE-MsgGUID: ZoCWavklRBO28VDP7CGxQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64733164"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64733164"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:31 -0800
X-CSE-ConnectionGUID: T4LNnYUXQvGAXnchrj4P4Q==
X-CSE-MsgGUID: DVtgwWnxRLehRN0JhtDB8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="193271241"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 10:13:31 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 29/33] drm/xe/hwmon: Use scope-based runtime PM
Date: Fri,  7 Nov 2025 10:13:45 -0800
Message-ID: <20251107181315.631642-64-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107181315.631642-35-matthew.d.roper@intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
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

