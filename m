Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDFAE6FE4B
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:07:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B4D10EB32;
	Sat,  7 Sep 2024 00:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jDW/w8h/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452A410EB25
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667678; x=1757203678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YdpINKyTwwKivL3ODJMyHu9slC12xEhJonTiSdNjJPA=;
 b=jDW/w8h/5MWnXJNc1CaWiTD6sh2ufo0dTkMFopTbVq0FoS3lAQDGMCWH
 GX7QSFeArO58TNjXrVsG6mtnwFITZzMxZQ60cwfUtTpxFkLH5t4L9VTPu
 iqr8DWtPcIp0nmJdEx5T60CoCz1cmdxfccNNt9QbcSPiidM/6vFv2Ij6q
 rDVb9DoQrQfBMppROrvzoXOnDf/UqFCRaKaRWXHZBiAPbMKapGLl9IxNX
 +H2PK58NE2MGxqWJT85AHmdTPCyXbLAGNNsnwhF2A9er7VwFUq4o1yr2T
 JC4DV/z9+ZAA2SSQY9vbMsK7yPvFrNEYJxQ28mO+09eT7na5BY00Uu4Ba w==;
X-CSE-ConnectionGUID: xj4rw7BXSZGpPFbCwLivZw==
X-CSE-MsgGUID: JMQGhNFDTQyZNLonHp7L4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855302"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855302"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: OlaVgE1wQZaB3R6z0IwpnA==
X-CSE-MsgGUID: JujbIJ61QGWQM9Cb0j7eJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792652"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 12/43] drm/xe/hwmon: Convert register access to use xe_mmio
Date: Fri,  6 Sep 2024 17:08:01 -0700
Message-ID: <20240907000748.2614020-57-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index aa11728e7e79..fde56dad3ab7 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -149,7 +149,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *v
 	u64 reg_val, min, max;
 	struct xe_device *xe = hwmon->xe;
 	struct xe_reg rapl_limit, pkg_power_sku;
-	struct xe_gt *mmio = xe_root_mmio_gt(xe);
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 
 	rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
 	pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
@@ -190,7 +190,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *v
 
 static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long value)
 {
-	struct xe_gt *mmio = xe_root_mmio_gt(hwmon->xe);
+	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 	int ret = 0;
 	u64 reg_val;
 	struct xe_reg rapl_limit;
@@ -222,7 +222,7 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
 
 static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, int channel, long *value)
 {
-	struct xe_gt *mmio = xe_root_mmio_gt(hwmon->xe);
+	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 	struct xe_reg reg = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
 	u64 reg_val;
 
@@ -259,7 +259,7 @@ static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, int channel, l
 static void
 xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 {
-	struct xe_gt *mmio = xe_root_mmio_gt(hwmon->xe);
+	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 	struct xe_hwmon_energy_info *ei = &hwmon->ei[channel];
 	u64 reg_val;
 
@@ -282,7 +282,7 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 				 char *buf)
 {
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
-	struct xe_gt *mmio = xe_root_mmio_gt(hwmon->xe);
+	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 	u32 x, y, x_w = 2; /* 2 bits */
 	u64 r, tau4, out;
 	int sensor_index = to_sensor_dev_attr(attr)->index;
@@ -323,7 +323,7 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 				  const char *buf, size_t count)
 {
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
-	struct xe_gt *mmio = xe_root_mmio_gt(hwmon->xe);
+	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 	u32 x, y, rxy, x_w = 2; /* 2 bits */
 	u64 tau4, r, max_win;
 	unsigned long val;
@@ -498,7 +498,7 @@ static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, int channel,
 
 static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *value)
 {
-	struct xe_gt *mmio = xe_root_mmio_gt(hwmon->xe);
+	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 	u64 reg_val;
 
 	reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS, channel));
@@ -781,7 +781,7 @@ static const struct hwmon_chip_info hwmon_chip_info = {
 static void
 xe_hwmon_get_preregistration_info(struct xe_device *xe)
 {
-	struct xe_gt *mmio = xe_root_mmio_gt(xe);
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	struct xe_hwmon *hwmon = xe->hwmon;
 	long energy;
 	u64 val_sku_unit = 0;
-- 
2.45.2

