Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90F2C369DC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 20:36:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B010910E027;
	Wed, 30 Apr 2025 20:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ch9HxKep";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C8710E027
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 20:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746045405; x=1777581405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jee/Cb1kb7UomnSBnAEbDq9y0bmrn9I0Btd1WycbcKM=;
 b=ch9HxKep/TFoO4udA4nj9J8aMTm1Q3LkjFaQyOb7Jcz0SWAZy+suN5qM
 n2uR9kwYz8Ke8xMEaDYy5ijGAlj29lhV8mf9xi6qK4z6NxuzLyWVxKd6B
 ++TR3FkHKjvl9m20B1E/KQk1D9eAtxK1NdHjR7f+/Jouneg1cTu1PJpkR
 ORhY1FMkAvQTh25YwrXHLlkrkYBr8MAo+acpWCXSp5DB7RC0POgNf0SQn
 ycqpiwrZS476C1fS+vsLvTwPJF6NIAXkwimRS+XFFWRBN2GEiFn7ZjdAP
 XU9Gyb/EU9kTm0IoTLvxw26Kz/iJccU8LW7qyyWcIpPgZYnwQTcUiNFoN Q==;
X-CSE-ConnectionGUID: 9iyyYeoVTla9LjkZNqIVsg==
X-CSE-MsgGUID: q3paLObuSRqcU3ZVZedqCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="58712389"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="58712389"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 13:36:45 -0700
X-CSE-ConnectionGUID: whUy44DsS3StxYkFwtveZQ==
X-CSE-MsgGUID: onEEdS2lTYSZTeeVN/2/RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="134112621"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 13:36:42 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 ashutosh.dixit@intel.com, rodrigo.vivi@intel.com, michael.j.ruhl@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 4/5] drm/xe/hwmon: Expose powerX_cap_interval
Date: Thu,  1 May 2025 02:06:06 +0530
Message-Id: <20250430203607.926585-5-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250430203607.926585-1-karthik.poosa@intel.com>
References: <20250430203607.926585-1-karthik.poosa@intel.com>
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

Expose powerX_cap_interval to manage burst power limit time window.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon    | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.c                  | 16 +++++++++++++---
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index 9dc2ee348aa6..124fa0883924 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -176,3 +176,21 @@ Description:	RW. Package burst (PL2) power limit in microwatts.
 		limit. Writing values > 0 and <= TDP will enable the power limit.
 
 		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap_interval
+Date:		May 2025
+KernelVersion:	6.15
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RW. Card burst power limit interval (Tau in PL2/Tau) in
+		milliseconds over which sustained power is averaged.
+
+		Only supported for particular Intel Xe graphics platforms.
+
+What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power2_cap_interval
+Date:		May 2025
+KernelVersion:	6.15
+Contact:	intel-xe@lists.freedesktop.org
+Description:	RW. Package burst power limit interval (Tau in PL2/Tau) in
+		milliseconds over which sustained power is averaged.
+
+		Only supported for particular Intel Xe graphics platforms.
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 115758c88175..ada8c15829a3 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -473,7 +473,7 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 	u32 x, y, x_w = 2; /* 2 bits */
 	u64 r, tau4, out;
 	int channel = (to_sensor_dev_attr(attr)->index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
-	u32 power_attr = PL1_HWMON_ATTR;
+	u32 power_attr = (to_sensor_dev_attr(attr)->index > 1) ? PL2_HWMON_ATTR : PL1_HWMON_ATTR;
 
 	int ret = 0;
 
@@ -528,7 +528,7 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 	u64 tau4, r, max_win;
 	unsigned long val;
 	int channel = (to_sensor_dev_attr(attr)->index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
-	u32 power_attr = PL1_HWMON_ATTR;
+	u32 power_attr = (to_sensor_dev_attr(attr)->index > 1) ? PL2_HWMON_ATTR : PL1_HWMON_ATTR;
 	int ret;
 
 	ret = kstrtoul(buf, 0, &val);
@@ -612,10 +612,20 @@ static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
 static SENSOR_DEVICE_ATTR(power2_max_interval, 0664,
 			  xe_hwmon_power_max_interval_show,
 			  xe_hwmon_power_max_interval_store, SENSOR_INDEX_PKG_PL1);
+/* PSYS PL2 */
+static SENSOR_DEVICE_ATTR(power1_cap_interval, 0664,
+			  xe_hwmon_power_max_interval_show,
+			  xe_hwmon_power_max_interval_store, SENSOR_INDEX_PSYS_PL2);
+/* PKG PL2 */
+static SENSOR_DEVICE_ATTR(power2_cap_interval, 0664,
+			  xe_hwmon_power_max_interval_show,
+			  xe_hwmon_power_max_interval_store, SENSOR_INDEX_PKG_PL2);
 
 static struct attribute *hwmon_attributes[] = {
 	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
 	&sensor_dev_attr_power2_max_interval.dev_attr.attr,
+	&sensor_dev_attr_power1_cap_interval.dev_attr.attr,
+	&sensor_dev_attr_power2_cap_interval.dev_attr.attr,
 	NULL
 };
 
@@ -626,7 +636,7 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
 	int ret = 0;
 	int channel = (index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
-	u32 power_attr = PL1_HWMON_ATTR;
+	u32 power_attr = (index > 1) ? PL2_HWMON_ATTR : PL1_HWMON_ATTR;
 	u32 uval;
 
 	xe_pm_runtime_get(hwmon->xe);
-- 
2.25.1

