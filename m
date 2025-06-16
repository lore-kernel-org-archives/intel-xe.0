Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8275BC71135
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 07:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CB210E2C8;
	Mon, 16 Jun 2025 07:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hyVYGDnR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DCC10E2C8
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 07:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750057902; x=1781593902;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NyypV9cTtw6VOdKX5tlmUmu9De8Yt36pNPGEGlVvrcU=;
 b=hyVYGDnRbM/Xet1LGlhyn0T5KhGEg10ZDhFvTuknqWw9iQBqNBimOYjt
 ISjhSg+X6gieG/m+XhqXwe0502xw27Kyv/x7nY61E0avcgm+0n9PcKybh
 dtNt2iKMbFdlC88nd+jFxGdbJVSRXBAElMaoVtGRi3KWW16/28B0vKYTu
 6hwwOJ+gay3LQkHQLK6bmSXSYpoCkDzsfxoV1/p6uKxcMe7RoSVML2TMk
 kiJtJ2atLzCCmfD1ptzcmv3iFwxNdKdlYh8kfejSKkxsgkfDKhvVLSJo8
 zAOT2KQGnD1mmsu3vXfB4eaZCsA70+2U6PxpMC1hhkj8GlLMteOXZMDLE g==;
X-CSE-ConnectionGUID: 42YRQxRUQuyOHosP1kzuiA==
X-CSE-MsgGUID: RTMWjhYsQTSSM1SMYIk5rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51903419"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="51903419"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 00:11:42 -0700
X-CSE-ConnectionGUID: 1Acz/7xpQ8GMGa9zvFAoCw==
X-CSE-MsgGUID: py8iE5qaQ+OTojLerKDjOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="148291098"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 00:11:39 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3] drm/xe/hwmon: Fix xe_hwmon_power_max_write
Date: Mon, 16 Jun 2025 12:41:33 +0530
Message-Id: <20250616071133.458363-1-karthik.poosa@intel.com>
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

Fixes: 7596d839f6228 ("drm/xe/hwmon: Add support to manage power limits though mailbox")
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h |  1 +
 drivers/gpu/drm/xe/xe_hwmon.c            | 48 ++++++++++++------------
 2 files changed, 24 insertions(+), 25 deletions(-)

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
index 0d32e977537c..fa841311bdcf 100644
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
@@ -378,7 +378,8 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
 	reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
 
 	if (hwmon->xe->info.has_mbx_power_limits)
-		ret = xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, reg_val);
+		ret = xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN | PWR_LIM_VAL,
+						     reg_val);
 	else
 		reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN | PWR_LIM_VAL,
 					reg_val);
@@ -591,14 +592,11 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 
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
 
@@ -1217,25 +1215,25 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
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

