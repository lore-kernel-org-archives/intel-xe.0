Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F22CC6B1D
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 11:59:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806FA10FCF5;
	Wed, 14 Oct 2026 11:59:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4BB10FCF8
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 11:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791979145; x=1823515145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cjgZMSsQyDNeixrj/JBLHbLaCU/i54stl6umpVDdYLk=;
 b=ARxlMCZdpztW2SdkThdS0LfP6qcPhLl3ZJTzsQ1ycI1HTS2/BbidI9yo
 PoDsF89u4tbVxpEgl+xWe1Y9m43z7PzDUbco1uHdHiIW2YLy4n6OjIQsv
 Kpeb0nR8qfhHo12YPtVuvgXDrT1vB7tc5fe9aUGyKBfXKfKmB6H1EjgRY
 IZmcQjbKJq/VfSmYlO6saCoWv/SMbfxdZ8RrMtgvk6I1+pkOQBrAe5GWQ
 bzEaxAUEgMW2K8Ne6sr81BQseSUi5ttznOY6BjaCvAAx2n/960CZxq/9/
 1GNPkiRXh2sK2wdpUgrmVfTscWtBVOIfNZPxSIfry3c0sW1DFD19MsbG4 Q==;
X-CSE-ConnectionGUID: t96CDSZxQt2M8/HCDxa4CA==
X-CSE-MsgGUID: zjKVTSqiSU+Xc/mcl/SZag==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="609560"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="609560"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 04:58:56 -0700
X-CSE-ConnectionGUID: hnqG1hkTRRKtPCRwkcV/iA==
X-CSE-MsgGUID: y3jMfWrMRGeH1dbii3EWmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1752130"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 04:58:53 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v13 01/16] drm/xe/hwmon: Fix pcode power limit handling
Date: Wed, 14 Oct 2026 17:27:51 +0530
Message-Id: <20261014115806.831459-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261014115806.831459-1-karthik.poosa@intel.com>
References: <20261014115806.831459-1-karthik.poosa@intel.com>
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

Return early on pcode read failure in xe_hwmon_pcode_rmw_power_limit()
and propagate errors to callers.

Replace boot_power_limit_read with per-channel
read_power_limit_from_pcode[], set on the first successful pcode write,
so reads and writes stay consistent even if the default limit write at
boot fails.

Also return PWR_LIM_EN for power label so card label visibility works.

Fixes: 8aa7306631f0 ("drm/xe/hwmon: Fix xe_hwmon_power_max_write")
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---

v2: Check return in xe_hwmon_get_preregistration_info() also. (Sashiko)
v3: Track pcode limit updates per channel. (Sashiko)

 drivers/gpu/drm/xe/xe_hwmon.c | 77 +++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 5edeac961ec3..c7f936892512 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -165,8 +165,8 @@ struct xe_hwmon {
 	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
 	/** @fi: Fan info for fanN_input */
 	struct xe_hwmon_fan_info fi[FAN_MAX];
-	/** @boot_power_limit_read: is boot power limits read */
-	bool boot_power_limit_read;
+	/** @read_power_limit_from_pcode: pcode accepted power limits write for the channel */
+	bool read_power_limit_from_pcode[CHANNEL_MAX];
 	/** @pl1_on_boot: power limit PL1 on boot */
 	u32 pl1_on_boot[CHANNEL_MAX];
 	/** @pl2_on_boot: power limit PL2 on boot */
@@ -175,9 +175,9 @@ struct xe_hwmon {
 	struct xe_hwmon_thermal_info temp;
 };
 
-static inline int prepare_power_limit_param2(const struct xe_hwmon *hwmon)
+static inline int prepare_power_limit_param2(const struct xe_hwmon *hwmon, int channel)
 {
-	if (hwmon->boot_power_limit_read) {
+	if (hwmon->read_power_limit_from_pcode[channel]) {
 		if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)
 			return READ_PL_ACCEPTED;
 		else
@@ -198,7 +198,8 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
 						  (channel == CHANNEL_CARD) ?
 						  READ_PSYSGPU_POWER_LIMIT :
 						  READ_PACKAGE_POWER_LIMIT,
-						  prepare_power_limit_param2(hwmon)), &val0, &val1);
+						  prepare_power_limit_param2(hwmon, channel)),
+			    &val0, &val1);
 
 	if (ret) {
 		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
@@ -213,14 +214,14 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
 	else if (attr == PL2_HWMON_ATTR)
 		*uval = (val1 & PWR_LIM_EN) ? val1 : 0;
 	else if (attr == hwmon_power_label)
-		*uval = (val0 & PWR_LIM_EN) ? 1 : (val1 & PWR_LIM_EN) ? 1 : 0;
+		*uval = (val0 | val1) & PWR_LIM_EN;
 	else
 		*uval = 0;
 
 	return ret;
 }
 
-static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr, u8 channel,
+static int xe_hwmon_pcode_rmw_power_limit(struct xe_hwmon *hwmon, u32 attr, u8 channel,
 					  u32 clr, u32 set)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
@@ -231,10 +232,13 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
 						  (channel == CHANNEL_CARD) ?
 						  READ_PSYSGPU_POWER_LIMIT :
 						  READ_PACKAGE_POWER_LIMIT,
-						  prepare_power_limit_param2(hwmon)), &val0, &val1);
-	if (ret)
-		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
+						  prepare_power_limit_param2(hwmon, channel)),
+			    &val0, &val1);
+	if (ret) {
+		drm_err(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
 			channel, val0, val1, ret);
+		return ret;
+	}
 
 	if (attr == PL1_HWMON_ATTR)
 		val0 = (val0 & ~clr) | set;
@@ -248,10 +252,17 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
 							     WRITE_PSYSGPU_POWER_LIMIT :
 							     WRITE_PACKAGE_POWER_LIMIT, 0),
 							     val0, val1, PCODE_DEFAULT_TIMEOUT_MS);
-	if (ret)
+	if (ret) {
 		drm_dbg(&hwmon->xe->drm, "write failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
 			channel, val0, val1, ret);
-	return ret;
+		return ret;
+	}
+
+	/* Read from pcode once it holds a driver-written limit */
+	if (!hwmon->read_power_limit_from_pcode[channel])
+		hwmon->read_power_limit_from_pcode[channel] = true;
+
+	return 0;
 }
 
 static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
@@ -394,7 +405,9 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
 		if (hwmon->xe->info.has_mbx_power_limits) {
 			drm_dbg(&hwmon->xe->drm, "disabling %s on channel %d\n",
 				PWR_ATTR_TO_STR(attr), channel);
-			xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
+			ret = xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
+			if (ret)
+				goto unlock;
 			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
 		} else {
 			reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN, 0);
@@ -679,15 +692,19 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-	if (hwmon->xe->info.has_mbx_power_limits)
-		xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM_TIME, rxy);
-	else
+	ret = count;
+	if (hwmon->xe->info.has_mbx_power_limits) {
+		ret = xe_hwmon_pcode_rmw_power_limit(hwmon, power_attr, channel, PWR_LIM_TIME, rxy);
+		if (!ret)
+			ret = count;
+	} else {
 		r = xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel),
 				  PWR_LIM_TIME, rxy);
+	}
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
-	return count;
+	return ret;
 }
 
 /* PSYS PL1 */
@@ -1511,22 +1528,22 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 		} else {
 			drm_info(&hwmon->xe->drm, "Using mailbox commands for power limits\n");
 			/* Write default limits to read from pcode from now on. */
-			xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
-						       CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
-						       hwmon->pl1_on_boot[CHANNEL_CARD]);
-			xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
-						       CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
-						       hwmon->pl1_on_boot[CHANNEL_PKG]);
-			xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
-						       CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
-						       hwmon->pl2_on_boot[CHANNEL_CARD]);
-			xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
-						       CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
-						       hwmon->pl2_on_boot[CHANNEL_PKG]);
+			if (xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
+							   CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
+							   hwmon->pl1_on_boot[CHANNEL_CARD]) |
+			    xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
+							   CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
+							   hwmon->pl1_on_boot[CHANNEL_PKG]) |
+			    xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
+							   CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
+							   hwmon->pl2_on_boot[CHANNEL_CARD]) |
+			    xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
+							   CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
+							   hwmon->pl2_on_boot[CHANNEL_PKG]))
+				drm_warn(&hwmon->xe->drm, "Failed to set default power limits\n");
 			hwmon->scl_shift_power = PWR_UNIT;
 			hwmon->scl_shift_energy = ENERGY_UNIT;
 			hwmon->scl_shift_time = TIME_UNIT;
-			hwmon->boot_power_limit_read = true;
 		}
 	} else {
 		drm_info(&hwmon->xe->drm, "Using register for power limits\n");
-- 
2.25.1

