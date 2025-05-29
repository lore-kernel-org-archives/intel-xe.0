Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5819C5AD49
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 10:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6614110E027;
	Thu, 29 May 2025 10:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jBwRjyyw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C30E10E027
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 10:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748514893; x=1780050893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m/tsGk59kW7PnKSvnVdsZWX3MKCOykmoDkfp0z4Zm0k=;
 b=jBwRjyywHJCClI+RiEf2VMRCxeQ73ZSzoTvoQRzkjcd5Aqf0MO/rfE/N
 AnhcLb7j72RNsIk2AsGsZ54v7fBy23lprQk51B2l0IkzIiUcYDBl6uP3E
 pTs0t7ZXYlzxEdRjZgALahYeQUR7tGkzzfdfbkcPd0ISTjnzmaOw5Hwtw
 Y42bYvTZtNJnzWU8OCA9dlLoTZLny0E9OyQdSwn0GXK7b7H5LjZZghcPb
 w9EMUyQvuTu2rJVSb/OuXM1P5Cb0IidduQxOQU92tUGb3M85hkfh0cwKQ
 KGqWOMsvzFKd3vnBd2VZOSAvWJUQLUVDQB+TNDWNXTxbhbs/TbkQ3JEVW w==;
X-CSE-ConnectionGUID: 5FQLom5HQ/Ovn7WffFPCZQ==
X-CSE-MsgGUID: aFYO2Xd9RfW86VnK6FMBgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61233509"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; d="scan'208";a="61233509"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 03:34:53 -0700
X-CSE-ConnectionGUID: 1s09xNj+Qs21QX9TbmojNw==
X-CSE-MsgGUID: ujEghz4pTyWnSKea/+cFLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; d="scan'208";a="144511049"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 03:34:51 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v11 4/6] drm/xe/hwmon: Expose powerX_cap_interval
Date: Thu, 29 May 2025 16:04:28 +0530
Message-Id: <20250529103430.2348053-5-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529103430.2348053-1-karthik.poosa@intel.com>
References: <20250529103430.2348053-1-karthik.poosa@intel.com>
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
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
 .../ABI/testing/sysfs-driver-intel-xe-hwmon    | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.c                  | 16 +++++++++++++---
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
index dffd6443664a..d9e2b17c6872 100644
--- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
+++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
@@ -178,3 +178,21 @@ Description:	RW. Package burst (PL2) power limit in microwatts.
 		compared to PL1.
 
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
index 7a5837199492..f07592aba226 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -474,7 +474,7 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 	u32 x, y, x_w = 2; /* 2 bits */
 	u64 r, tau4, out;
 	int channel = (to_sensor_dev_attr(attr)->index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
-	u32 power_attr = PL1_HWMON_ATTR;
+	u32 power_attr = (to_sensor_dev_attr(attr)->index > 1) ? PL2_HWMON_ATTR : PL1_HWMON_ATTR;
 
 	int ret = 0;
 
@@ -529,7 +529,7 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 	u64 tau4, r, max_win;
 	unsigned long val;
 	int channel = (to_sensor_dev_attr(attr)->index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
-	u32 power_attr = PL1_HWMON_ATTR;
+	u32 power_attr = (to_sensor_dev_attr(attr)->index > 1) ? PL2_HWMON_ATTR : PL1_HWMON_ATTR;
 	int ret;
 
 	ret = kstrtoul(buf, 0, &val);
@@ -607,10 +607,20 @@ static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
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
 
@@ -621,7 +631,7 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
 	int ret = 0;
 	int channel = (index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
-	u32 power_attr = PL1_HWMON_ATTR;
+	u32 power_attr = (index > 1) ? PL2_HWMON_ATTR : PL1_HWMON_ATTR;
 	u32 uval;
 
 	xe_pm_runtime_get(hwmon->xe);
-- 
2.25.1

