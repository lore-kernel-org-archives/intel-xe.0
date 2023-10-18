Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AADCDB483
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 18:56:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756D610E454;
	Wed, 18 Oct 2023 18:56:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ADE910E083
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 18:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697655360; x=1729191360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sduCQda60aEzEeSlOqKFg9ZrneWM8YSUqmnw2pPHNK8=;
 b=FnVx27S0r1QpdzUQTjFBpSXxsDfwHqYFk7dQN5ul7+o0pMk39+JOctDt
 ja6QdIuwDWhd5cEvnM93RB8vY64wFCbqJv5T7htDv1a6wXkbOeWp/8sZg
 S6OzIvoh2SbRdLibTdsCVi4l7+dYQNRef7QE+sR2fNyOHRX0e8+lqYqlc
 qjllclT4DJPKOtVayf/onU9ZjTSGXIyyqdAEy4cY1iFnP6aqJXIV+hoD6
 sCMDHQNEX0TZSgkaVHlyEln5zBHY9D+5s7296GX6B0HrdaZtTyZRB0KYn
 +TDPo1EhdNUV2Yy+B6GJs2bSZ0hvNTYAbpimq2JTLNQpuJvHGethjIVO2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="388946344"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="388946344"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 11:55:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="900447218"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="900447218"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 11:53:53 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 19 Oct 2023 00:33:40 +0530
Message-Id: <20231018190341.726098-3-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018190341.726098-1-badal.nilawar@intel.com>
References: <20231018190341.726098-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/3] drm/xe/hwmon: Protect hwmon rw attributes
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
 drivers/gpu/drm/xe/xe_hwmon.c | 92 ++++++++++++++++++++---------------
 1 file changed, 52 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 08c7289723ae..c87d028f1955 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -47,7 +47,7 @@ struct xe_hwmon_energy_info {
 struct xe_hwmon {
 	struct device *hwmon_dev;
 	struct xe_gt *gt;
-	struct mutex hwmon_lock; /* rmw operations*/
+	struct mutex hwmon_lock; /* For rw attributes */
 	int scl_shift_power;
 	int scl_shift_energy;
 	struct xe_hwmon_energy_info ei;	/*  Energy info for energy1_input */
@@ -135,11 +135,13 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
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
@@ -153,12 +155,17 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
 
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
@@ -166,8 +173,10 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
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
@@ -176,8 +185,9 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
 
 	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW32, &reg_val,
 			     PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
-
-	return 0;
+unlock:
+	mutex_unlock(&hwmon->hwmon_lock);
+	return ret;
 }
 
 static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
@@ -215,8 +225,6 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)
 	struct xe_hwmon_energy_info *ei = &hwmon->ei;
 	u64 reg_val;
 
-	mutex_lock(&hwmon->hwmon_lock);
-
 	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, REG_READ32,
 			     &reg_val, 0, 0);
 
@@ -229,8 +237,6 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)
 
 	*energy = mul_u64_u32_shr(ei->accum_energy, SF_ENERGY,
 				  hwmon->scl_shift_energy);
-
-	mutex_unlock(&hwmon->hwmon_lock);
 }
 
 static const struct hwmon_channel_info *hwmon_info[] = {
@@ -260,6 +266,38 @@ static int xe_hwmon_pcode_write_i1(struct xe_gt *gt, u32 uval)
 			      uval);
 }
 
+static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, long *value, u32 scale_factor)
+{
+	int ret;
+	u32 uval;
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
+	if (ret)
+		goto unlock;
+
+	*value = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
+				 scale_factor, POWER_SETUP_I1_SHIFT);
+unlock:
+	mutex_unlock(&hwmon->hwmon_lock);
+	return ret;
+}
+
+static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, long value, u32 scale_factor)
+{
+	int ret;
+	u32 uval;
+
+	mutex_lock(&hwmon->hwmon_lock);
+
+	uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT, scale_factor);
+	ret = xe_hwmon_pcode_write_i1(hwmon->gt, uval);
+
+	mutex_unlock(&hwmon->hwmon_lock);
+	return ret;
+}
+
 static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long *value)
 {
 	u64 reg_val;
@@ -291,9 +329,6 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int chan)
 static int
 xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int chan, long *val)
 {
-	int ret;
-	u32 uval;
-
 	switch (attr) {
 	case hwmon_power_max:
 		xe_hwmon_power_max_read(hwmon, val);
@@ -302,14 +337,7 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int chan, long *val)
 		xe_hwmon_power_rated_max_read(hwmon, val);
 		return 0;
 	case hwmon_power_crit:
-		ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
-		if (ret)
-			return ret;
-		if (!(uval & POWER_SETUP_I1_WATTS))
-			return -ENODEV;
-		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
-				       SF_POWER, POWER_SETUP_I1_SHIFT);
-		return 0;
+		return xe_hwmon_power_curr_crit_read(hwmon, val, SF_POWER);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -318,14 +346,11 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int chan, long *val)
 static int
 xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int chan, long val)
 {
-	u32 uval;
-
 	switch (attr) {
 	case hwmon_power_max:
 		return xe_hwmon_power_max_write(hwmon, val);
 	case hwmon_power_crit:
-		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_POWER);
-		return xe_hwmon_pcode_write_i1(hwmon->gt, uval);
+		return xe_hwmon_power_curr_crit_write(hwmon, val, SF_POWER);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -348,19 +373,9 @@ xe_hwmon_curr_is_visible(const struct xe_hwmon *hwmon, u32 attr)
 static int
 xe_hwmon_curr_read(struct xe_hwmon *hwmon, u32 attr, long *val)
 {
-	int ret;
-	u32 uval;
-
 	switch (attr) {
 	case hwmon_curr_crit:
-		ret = xe_hwmon_pcode_read_i1(hwmon->gt, &uval);
-		if (ret)
-			return ret;
-		if (uval & POWER_SETUP_I1_WATTS)
-			return -ENODEV;
-		*val = mul_u64_u32_shr(REG_FIELD_GET(POWER_SETUP_I1_DATA_MASK, uval),
-				       SF_CURR, POWER_SETUP_I1_SHIFT);
-		return 0;
+		return xe_hwmon_power_curr_crit_read(hwmon, val, SF_CURR);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -369,12 +384,9 @@ xe_hwmon_curr_read(struct xe_hwmon *hwmon, u32 attr, long *val)
 static int
 xe_hwmon_curr_write(struct xe_hwmon *hwmon, u32 attr, long val)
 {
-	u32 uval;
-
 	switch (attr) {
 	case hwmon_curr_crit:
-		uval = DIV_ROUND_CLOSEST_ULL(val << POWER_SETUP_I1_SHIFT, SF_CURR);
-		return xe_hwmon_pcode_write_i1(hwmon->gt, uval);
+		return xe_hwmon_power_curr_crit_write(hwmon, val, SF_CURR);
 	default:
 		return -EOPNOTSUPP;
 	}
-- 
2.25.1

