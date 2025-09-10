Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2242CCA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 20:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD81210E368;
	Wed, 10 Sep 2025 20:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iFx4TeFC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727AD10E368
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757537043; x=1789073043;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C8k5OPgAoDw246dFXQCisQO8SgBphS+3gdBVmfW3pZo=;
 b=iFx4TeFCcef2yYl1oKFzfggJbVEBuwdCy/DmEsD7AVkEKsITAPcKp1yc
 oJezpTKMbqjMxcIWt+OIQsQLl0agnrMwOV5qR1BWhUt5rfn2Nz9QTArMN
 RPZ9AalKpWsbXH4rdZbOSg8fskhWI41jW8DfJbFyW5DmpxfUn23pwfoHB
 Fq6npT/9sT8DjNfJr8+6ha/UtP69it8FqZcyVgtwEm3k354MZQwWETaIT
 lR8Jsi7cdkHkZ5qwB1aJDQxBntdgje8kqVGlj/5U8WSl3aJ3p/qJssuMx
 HNRaVLI6sevgDHYpCml6/U5YVHugXL2DhavwuICYIejioXblomLySxSe4 g==;
X-CSE-ConnectionGUID: vxQlU5fPQ7C4bYcqdATOAg==
X-CSE-MsgGUID: QXngV6cjTzOTPH9JPbaEhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="77315086"
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="77315086"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 13:44:02 -0700
X-CSE-ConnectionGUID: j2Kc9GguS3eSnA6KamKvgA==
X-CSE-MsgGUID: uQPRU1jNSYqNpTxPblAyxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,255,1751266800"; d="scan'208";a="173874030"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa008.fm.intel.com with ESMTP; 10 Sep 2025 13:43:58 -0700
From: mallesh.koujalagi@intel.com
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [v4] drm/xe/hwmon: Remove type casting.
Date: Thu, 11 Sep 2025 02:12:34 +0530
Message-Id: <20250910204234.2724272-1-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

Refactor: eliminate type casts by using proper u32
declarations.

v2:
- Address review comments. (Karthik)

v3:
- Use the proper u32 type and drop cast. (Lucas De Marchi)
- Modify variable when actually using u64 value.
- Change r value to reg_value with u32 type.

v4:
- Remove newline between trailer and Signed-off-by. (Lucas De Marchi)
- Change reg_val to val for more user-friendly logging.
- Use mul_u32_u32 function since both values are u32.

Fixes: 7596d839f6228 ("drm/xe/hwmon: Add support to manage power limits though mailbox")
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index e65382d4426a..b9ae3921c8b7 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -286,7 +286,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
  */
 static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *value)
 {
-	u64 reg_val = 0, min, max;
+	u32 reg_val = 0;
 	struct xe_device *xe = hwmon->xe;
 	struct xe_reg rapl_limit, pkg_power_sku;
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
@@ -294,7 +294,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channe
 	mutex_lock(&hwmon->hwmon_lock);
 
 	if (hwmon->xe->info.has_mbx_power_limits) {
-		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, (u32 *)&reg_val);
+		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
 	} else {
 		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
 		pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
@@ -304,19 +304,21 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channe
 	/* Check if PL limits are disabled. */
 	if (!(reg_val & PWR_LIM_EN)) {
 		*value = PL_DISABLE;
-		drm_info(&hwmon->xe->drm, "%s disabled for channel %d, val 0x%016llx\n",
+		drm_info(&hwmon->xe->drm, "%s disabled for channel %d, val 0x%08x\n",
 			 PWR_ATTR_TO_STR(attr), channel, reg_val);
 		goto unlock;
 	}
 
 	reg_val = REG_FIELD_GET(PWR_LIM_VAL, reg_val);
-	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
+	*value = mul_u32_u32(reg_val, SF_POWER);
 
 	/* For platforms with mailbox power limit support clamping would be done by pcode. */
 	if (!hwmon->xe->info.has_mbx_power_limits) {
-		reg_val = xe_mmio_read64_2x32(mmio, pkg_power_sku);
-		min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
-		max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
+		u64 pkg_pwr, min, max;
+
+		pkg_pwr = xe_mmio_read64_2x32(mmio, pkg_power_sku);
+		min = REG_FIELD_GET(PKG_MIN_PWR, pkg_pwr);
+		max = REG_FIELD_GET(PKG_MAX_PWR, pkg_pwr);
 		min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
 		max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
 		if (min && max)
@@ -493,8 +495,8 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 {
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
-	u32 x, y, x_w = 2; /* 2 bits */
-	u64 r, tau4, out;
+	u32 reg_val, x, y, x_w = 2; /* 2 bits */
+	u64 tau4, out;
 	int channel = (to_sensor_dev_attr(attr)->index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
 	u32 power_attr = (to_sensor_dev_attr(attr)->index > 1) ? PL2_HWMON_ATTR : PL1_HWMON_ATTR;
 
@@ -505,23 +507,24 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 	mutex_lock(&hwmon->hwmon_lock);
 
 	if (hwmon->xe->info.has_mbx_power_limits) {
-		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, (u32 *)&r);
+		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &reg_val);
 		if (ret) {
 			drm_err(&hwmon->xe->drm,
-				"power interval read fail, ch %d, attr %d, r 0%llx, ret %d\n",
-				channel, power_attr, r, ret);
-			r = 0;
+				"power interval read fail, ch %d, attr %d, val 0x%08x, ret %d\n",
+				channel, power_attr, reg_val, ret);
+			reg_val = 0;
 		}
 	} else {
-		r = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel));
+		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
+								channel));
 	}
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
 	xe_pm_runtime_put(hwmon->xe);
 
-	x = REG_FIELD_GET(PWR_LIM_TIME_X, r);
-	y = REG_FIELD_GET(PWR_LIM_TIME_Y, r);
+	x = REG_FIELD_GET(PWR_LIM_TIME_X, reg_val);
+	y = REG_FIELD_GET(PWR_LIM_TIME_Y, reg_val);
 
 	/*
 	 * tau = (1 + (x / 4)) * power(2,y), x = bits(23:22), y = bits(21:17)
-- 
2.34.1

