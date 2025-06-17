Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC19AC71157
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 12:01:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B292B10E618;
	Tue, 17 Jun 2025 12:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7OqxFiu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C0C10E618
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 12:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750161699; x=1781697699;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EcueTJ12Qcb4nPYQaG1gsrjq4Pjuukyls5RXL0yYKJE=;
 b=W7OqxFiuDolXfFsZh/xUi6cg0v8oENqhMzl4GkHoXYmIEtCfpy/+35xb
 yukTnufpy4iiR9W3+APOfE6ioyn2qvPJA7cALd77px6hJXUoSp5D9NFW4
 Y3GD73GmMwmjWaOk6vVs8u5ejB+evOq+WbFd1t1+sZK349WFjKgIqqwhB
 TvG3Klp/3njUKbUmsHAzvDIaEOBio2F6vwktRhiwuf+z6VuvEJY01q4/6
 fWAoqvnbVJVNXNI2ByCQPdFLVPtqI89PFbFuYiRWrZtRI6xWIvueC9Sba
 VPeQFG8qljjmzuVlmU1PGGO5B6O/wzLQki2Sx5gBq/AhEUqxfmTv6bTDJ A==;
X-CSE-ConnectionGUID: bPepAQMUQWOKuJbwlkmBsA==
X-CSE-MsgGUID: jXWuC7/yTrCfLt9Iy1vp8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="56144475"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="56144475"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 05:00:42 -0700
X-CSE-ConnectionGUID: erljFAr1QSmkNfbg+nOVsA==
X-CSE-MsgGUID: 7HW5xvU6RCOEfHcy2TwLoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="148615174"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 05:00:40 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v4] drm/xe/hwmon: Fix xe_hwmon_power_max_write
Date: Tue, 17 Jun 2025 17:30:30 +0530
Message-Id: <20250617120030.612819-1-karthik.poosa@intel.com>
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

Prevent other bits of mailbox power limit from being overwritten with 0.
This issue was due to a missing read and modify of current power limit,
before setting a requested mailbox power limit, which is added in this
patch.

v2:
 - Improve commit message. (Anshuman)

v3:
 - Rebase.
 - Rephrase commit message. (Riana)
 - Add read-modify-write variant of xe_hwmon_pcode_write_power_limit()
   i.e. xe_hwmon_pcode_rmw_power_limit(). (Badal)
 - Use xe_hwmon_pcode_rmw_power_limit() to set mailbox power limits.
 - Remove xe_hwmon_pcode_write_power_limit() as all mailbox power limits
   writes use xe_hwmon_pcode_rmw_power_limit() only.

v4:
 - Use PWR_LIM in place of (PWR_LIM_EN | PWR_LIM_VAL) wherever
   applicable. (Riana)

Fixes: 7596d839f6228 ("drm/xe/hwmon: Add support to manage power limits though mailbox")
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h |  1 +
 drivers/gpu/drm/xe/xe_hwmon.c            | 50 +++++++++++-------------
 2 files changed, 24 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
index 5394a1373a6b..ef2bf984723f 100644
--- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
@@ -40,6 +40,7 @@
 #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
 #define   PWR_LIM_VAL				REG_GENMASK(14, 0)
 #define   PWR_LIM_EN				REG_BIT(15)
+#define   PWR_LIM				REG_GENMASK(15, 0)
 #define   PWR_LIM_TIME				REG_GENMASK(23, 17)
 #define   PWR_LIM_TIME_X			REG_GENMASK(23, 22)
 #define   PWR_LIM_TIME_Y			REG_GENMASK(21, 17)
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 0d32e977537c..f08fc4377d25 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -175,8 +175,8 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
 	return ret;
 }
 
-static int xe_hwmon_pcode_write_power_limit(const struct xe_hwmon *hwmon, u32 attr, u8 channel,
-					    u32 uval)
+static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr, u8 channel,
+					  u32 clr, u32 set)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
 	u32 val0, val1;
@@ -195,9 +195,9 @@ static int xe_hwmon_pcode_write_power_limit(const struct xe_hwmon *hwmon, u32 at
 			channel, val0, val1, ret);
 
 	if (attr == PL1_HWMON_ATTR)
-		val0 = uval;
+		val0 = (val0 & ~clr) | set;
 	else if (attr == PL2_HWMON_ATTR)
-		val1 = uval;
+		val1 = (val1 & ~clr) | set;
 	else
 		return -EIO;
 
@@ -342,7 +342,7 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
 		if (hwmon->xe->info.has_mbx_power_limits) {
 			drm_dbg(&hwmon->xe->drm, "disabling %s on channel %d\n",
 				PWR_ATTR_TO_STR(attr), channel);
-			xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, 0);
+			xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
 			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
 		} else {
 			reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN, 0);
@@ -378,10 +378,9 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
 	reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
 
 	if (hwmon->xe->info.has_mbx_power_limits)
-		ret = xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, reg_val);
+		ret = xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM, reg_val);
 	else
-		reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN | PWR_LIM_VAL,
-					reg_val);
+		reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM, reg_val);
 unlock:
 	mutex_unlock(&hwmon->hwmon_lock);
 	return ret;
@@ -591,14 +590,11 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	if (hwmon->xe->info.has_mbx_power_limits) {
-		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, (u32 *)&r);
-		r = (r & ~PWR_LIM_TIME) | rxy;
-		xe_hwmon_pcode_write_power_limit(hwmon, power_attr, channel, r);
-	} else {
+	if (hwmon->xe->info.has_mbx_power_limits)
+		xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM_TIME, rxy);
+	else
 		r = xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel),
 				  PWR_LIM_TIME, rxy);
-	}
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
@@ -1217,25 +1213,25 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 						    &hwmon->pl1_on_boot[CHANNEL_PKG]) |
 		    xe_hwmon_pcode_read_power_limit(hwmon, PL2_HWMON_ATTR, CHANNEL_CARD,
 						    &hwmon->pl2_on_boot[CHANNEL_CARD]) |
-		    xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
+		    xe_hwmon_pcode_read_power_limit(hwmon, PL2_HWMON_ATTR, CHANNEL_PKG,
 						    &hwmon->pl2_on_boot[CHANNEL_PKG])) {
 			drm_warn(&hwmon->xe->drm,
 				 "Failed to read power limits, check GPU firmware !\n");
 		} else {
 			drm_info(&hwmon->xe->drm, "Using mailbox commands for power limits\n");
 			/* Write default limits to read from pcode from now on. */
-			xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR,
-							 CHANNEL_CARD,
-							 hwmon->pl1_on_boot[CHANNEL_CARD]);
-			xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR,
-							 CHANNEL_PKG,
-							 hwmon->pl1_on_boot[CHANNEL_PKG]);
-			xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
-							 CHANNEL_CARD,
-							 hwmon->pl2_on_boot[CHANNEL_CARD]);
-			xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
-							 CHANNEL_PKG,
-							 hwmon->pl2_on_boot[CHANNEL_PKG]);
+			xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
+						       CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
+						       hwmon->pl1_on_boot[CHANNEL_CARD]);
+			xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
+						       CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
+						       hwmon->pl1_on_boot[CHANNEL_PKG]);
+			xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
+						       CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
+						       hwmon->pl2_on_boot[CHANNEL_CARD]);
+			xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
+						       CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
+						       hwmon->pl2_on_boot[CHANNEL_PKG]);
 			hwmon->scl_shift_power = PWR_UNIT;
 			hwmon->scl_shift_energy = ENERGY_UNIT;
 			hwmon->scl_shift_time = TIME_UNIT;
-- 
2.25.1

