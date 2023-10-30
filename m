Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1475C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Oct 2023 11:48:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D15010E29F;
	Mon, 30 Oct 2023 11:48:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C69E10E29F
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Oct 2023 11:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698666506; x=1730202506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+3gvER/0+aNogDI+RKH63WWy9wefWSMBRqZv1wPzr8g=;
 b=g8AkgN6oQGIG2BCvVxZW1yChoi+IhZjz6NzKFX8YIYE//C4dCxp6bAB2
 khPeNJVSMJjOZOdHXozxPC8Pqt9U7R8vjoyEFAHDk1RX8jJx8152kH1FP
 8/iIZEz1Ammjl+5/PbPvH44ozmsZYPKevzgLux2oYtmUeZ1l2URQrp24I
 0bay1rCsZa3BPPGqHpM52d+JkWwcT/Ywpfhx9d1wodBxoo9BLKRaV2y3w
 01CGARayk671xv93yFJdaDHTQHkkweekmjb/wOs5CKw0eQ5gBBB/aKJ2I
 A9KHsMkPm2rumdBrjRPOgSzxDo/i7a6e12Ilti2re8+hF0rJ4LA11rCDG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="391917220"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="391917220"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 04:48:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="736713683"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; d="scan'208";a="736713683"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 04:48:23 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 30 Oct 2023 17:26:17 +0530
Message-Id: <20231030115618.1382200-3-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231030115618.1382200-1-badal.nilawar@intel.com>
References: <20231030115618.1382200-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/3] drm/xe/hwmon: Protect hwmon rw attributes
 with hwmon_lock
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Take hwmon_lock while accessing hwmon rw attributes. For readonly
attributes its not required to take lock as reads are protected
by sysfs layer and therefore sequential.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 9b7773441f62..7b4f88fdf647 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -57,7 +57,7 @@ struct xe_hwmon {
 	struct device *hwmon_dev;
 	/** @gt: primary gt */
 	struct xe_gt *gt;
-	/** @hwmon_lock: lock for rmw operations */
+	/** @hwmon_lock: lock for rw attributes*/
 	struct mutex hwmon_lock;
 	/** @scl_shift_power: pkg power unit */
 	int scl_shift_power;
@@ -149,11 +149,13 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
 {
 	u64 reg_val, min, max;
 
+	mutex_lock(&hwmon->hwmon_lock);
+
 	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, &reg_val, 0, 0);
 	/* Check if PL1 limit is disabled */
 	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
 		*value = PL1_DISABLE;
-		return;
+		goto unlock;
 	}
 
 	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
@@ -167,12 +169,17 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
 
 	if (min && max)
 		*value = clamp_t(u64, *value, min, max);
+unlock:
+	mutex_unlock(&hwmon->hwmon_lock);
 }
 
 static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
 {
+	int ret = 0;
 	u64 reg_val;
 
+	mutex_lock(&hwmon->hwmon_lock);
+
 	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
 	if (value == PL1_DISABLE) {
 		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, &reg_val,
@@ -180,8 +187,10 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
 		xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_READ32, &reg_val,
 				     PKG_PWR_LIM_1_EN, 0);
 
-		if (reg_val & PKG_PWR_LIM_1_EN)
-			return -EOPNOTSUPP;
+		if (reg_val & PKG_PWR_LIM_1_EN) {
+			ret = -EOPNOTSUPP;
+			goto unlock;
+		}
 	}
 
 	/* Computation in 64-bits to avoid overflow. Round to nearest. */
@@ -190,8 +199,9 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
 
 	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, &reg_val,
 			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
-
-	return 0;
+unlock:
+	mutex_unlock(&hwmon->hwmon_lock);
+	return ret;
 }
 
 static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
@@ -229,8 +239,6 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)
 	struct xe_hwmon_energy_info *ei = &hwmon->ei;
 	u64 reg_val;
 
-	mutex_lock(&hwmon->hwmon_lock);
-
 	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, REG_READ32,
 			     &reg_val, 0, 0);
 
@@ -243,8 +251,6 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)
 
 	*energy = mul_u64_u32_shr(ei->accum_energy, SF_ENERGY,
 				  hwmon->scl_shift_energy);
-
-	mutex_unlock(&hwmon->hwmon_lock);
 }
 
 static const struct hwmon_channel_info *hwmon_info[] = {
@@ -279,12 +285,16 @@ static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, long *value, u3
 	int ret;
 	u32 uval;
 
+	mutex_lock(&hwmon->hwmon_lock);
+
 	ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
 	if (ret)
-		return ret;
+		goto unlock;
 
 	*value = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
 				 scale_factor, POWER_SETUP_I1_SHIFT);
+unlock:
+	mutex_unlock(&hwmon->hwmon_lock);
 	return ret;
 }
 
@@ -293,9 +303,12 @@ static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, long value, u3
 	int ret;
 	u32 uval;
 
+	mutex_lock(&hwmon->hwmon_lock);
+
 	uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT, scale_factor);
 	ret = xe_hwmon_pcode_write_i1(hwmon->gt, uval);
 
+	mutex_unlock(&hwmon->hwmon_lock);
 	return ret;
 }
 
-- 
2.25.1

