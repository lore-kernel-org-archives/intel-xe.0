Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B4DC4828D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 17:50:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3BD10F2BC;
	Thu,  1 Feb 2024 17:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GoDhQsX/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB52510F2BC
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 17:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706809823; x=1738345823;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JUcX6zBKCkht//aas2e8/m+iSYCfcFSjJ/o0MgVy25s=;
 b=GoDhQsX/ao78uUoIZbjKT38bwVXLxPSirC5Uw7E5YRfUf+/IyYjtbPqt
 ptfa0n4poW671azfxnBcoxVaOXz6b/CV0ct7xOcDTu5SFkc6Lr4G+6hEx
 WUBFxKJAnRrT6lyi3K8ivpR4hbY8tyCm7Ytgd5TGnZy7Z+YYsFCLd4rsO
 zaHct4Y/th5E/3QKplQlxcGn2KKn9Fmrcp1nu1PPhH8xvHcyo8V1tjmw4
 X2VqHZ7jLSlbHQ8b3/FxiGTKOzL1DWxsMlyPXfCu+3ziLBGeSQ1MOvWpN
 dg5ZUOlZ7uck2CM11Bfep/G08SqQvovPQDs5VYMunkUPrh68w2Qf7y2kd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="402798762"
X-IronPort-AV: E=Sophos;i="6.05,235,1701158400"; d="scan'208";a="402798762"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 09:50:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,235,1701158400"; 
   d="scan'208";a="4472482"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 09:50:21 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH] drm/xe/hwmon: Add label support
Date: Thu,  1 Feb 2024 23:28:46 +0530
Message-Id: <20240201175846.434392-1-karthik.poosa@intel.com>
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

Add label for power and energy attributes.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 89c6f7f84b5a..9fd70bff3435 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -403,10 +403,10 @@ static const struct attribute_group *hwmon_groups[] = {
 };
 
 static const struct hwmon_channel_info * const hwmon_info[] = {
-	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
+	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT | HWMON_P_LABEL),
 	HWMON_CHANNEL_INFO(curr, HWMON_C_CRIT),
 	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
-	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
+	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL),
 	NULL
 };
 
@@ -484,6 +484,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int chan)
 	case hwmon_power_crit:
 		return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
 			!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
+	case hwmon_power_label:
+		return 0444;
 	default:
 		return 0;
 	}
@@ -584,6 +586,8 @@ xe_hwmon_energy_is_visible(struct xe_hwmon *hwmon, u32 attr)
 	switch (attr) {
 	case hwmon_energy_input:
 		return xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS) ? 0444 : 0;
+	case hwmon_energy_label:
+		return 0444;
 	default:
 		return 0;
 	}
@@ -691,10 +695,26 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	return ret;
 }
 
+static int xe_hwmon_read_label(struct device *dev,
+			       enum hwmon_sensor_types type,
+			       u32 attr, int channel, const char **str)
+{
+	switch (type) {
+	case hwmon_power:
+	case hwmon_energy:
+		*str = "card";
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+
 static const struct hwmon_ops hwmon_ops = {
 	.is_visible = xe_hwmon_is_visible,
 	.read = xe_hwmon_read,
 	.write = xe_hwmon_write,
+	.read_string = xe_hwmon_read_label,
 };
 
 static const struct hwmon_chip_info hwmon_chip_info = {
-- 
2.25.1

