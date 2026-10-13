Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525ABCA9ED0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 02:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1183810E4D8;
	Tue, 13 Oct 2026 02:08:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CFDA10E4D8
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 02:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791857293; x=1823393293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VEWbyKOjIzX1MQFwtq83ntJKa7h9Kn1gOvKvahg2xE4=;
 b=JZ9SvQeeUy4JoLBqKvmRMzxVSctpCzb1oKxb9PCTR0n9GEoue0wxL5rK
 R4nvuigQZGcDNPNKkMzy1nyqxUIlJHiJa+EeCtD4l1hH6DjPGdrZuLXYc
 C6Pq0OtW696GZ9XoljlORLPExBdyTFFGvfWvqvUXgWyuZ5D72OvmpMVoj
 r1Rdmrd6Mdszupf28/w/CCWf/9sJHA9GVQg7YkgzR8k4pGL5pbrQFWfCC
 HTbyizywGBNt5lLPq1Bl4W4U02Qx44fZOeBd003el+pE8AKedqeXK4jOE
 whJUl8y+rNhpjZ8Ka6Ibj5wZMSV0emxNBaYjtoBKrL8Yz9ve7IGxngfgG w==;
X-CSE-ConnectionGUID: kGmpdLPwSTGaSTEofD1zNA==
X-CSE-MsgGUID: nzfRp+6KTJ2i4SFLKF3Tww==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="670227"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="670227"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 19:08:13 -0700
X-CSE-ConnectionGUID: T/AbniPtT/iXexceLFbcug==
X-CSE-MsgGUID: HHhjrVn9S7uLCnRtH9w6Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1369233"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 19:08:10 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v11 16/16] drm/xe/hwmon: Propagate all hardware read errors
Date: Tue, 13 Oct 2026 07:36:36 +0530
Message-Id: <20261013020636.447620-17-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261013020636.447620-1-karthik.poosa@intel.com>
References: <20261013020636.447620-1-karthik.poosa@intel.com>
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

Propagate all failures from pcode and mailbox accesses and fix missed
return-value checks found by Sashiko in
https://patchwork.freedesktop.org/patch/758843/?series=174898&rev=6.

Fixes: 7596d839f622 ("drm/xe/hwmon: Add support to manage power limits though mailbox")
Fixes: 0c5405d3aa4ad ("drm/xe/hwmon: Read energy status from PMT")
Fixes: 25e963a09e059 ("drm/xe/hwmon: Move card reactive critical power under channel card")
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 47 +++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 702c739c9bf0..58f04c122577 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -381,17 +381,20 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
  * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
  * clamped values when read.
  */
-static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *value)
+static int xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *value)
 {
 	u32 reg_val = 0;
 	struct xe_device *xe = hwmon->xe;
 	struct xe_reg rapl_limit, pkg_power_sku;
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	int ret = 0;
 
 	mutex_lock(&hwmon->hwmon_lock);
 
 	if (hwmon->xe->info.has_mbx_power_limits) {
-		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
+		ret = xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
+		if (ret)
+			goto unlock;
 	} else {
 		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
 		pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
@@ -423,6 +426,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channe
 	}
 unlock:
 	mutex_unlock(&hwmon->hwmon_lock);
+	return ret;
 }
 
 static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channel, long value)
@@ -445,7 +449,9 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
 			ret = xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
 			if (ret)
 				goto unlock;
-			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
+			ret = xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
+			if (ret)
+				goto unlock;
 		} else {
 			reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN, 0);
 			reg_val = xe_mmio_read32(mmio, rapl_limit);
@@ -502,15 +508,18 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
 	return ret;
 }
 
-static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, u32 attr, int channel,
-					  long *value)
+static int xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, u32 attr, int channel,
+					 long *value)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 	u32 reg_val;
+	int ret = 0;
 
 	if (hwmon->xe->info.has_mbx_power_limits) {
 		/* PL1 is rated max if supported. */
-		xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, channel, &reg_val);
+		ret = xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, channel, &reg_val);
+		if (ret)
+			return ret;
 	} else {
 		/*
 		 * This sysfs file won't be visible if REG_PKG_POWER_SKU is invalid, so valid check
@@ -524,6 +533,7 @@ static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, u32 attr, int
 
 	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
 	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
+	return ret;
 }
 
 /*
@@ -546,7 +556,7 @@ static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, u32 attr, int
  * hwmon->scl_shift_energy of 14 bits we have 57 (63 - 20 + 14) bits before
  * energyN_input overflows. This at 1000 W is an overflow duration of 278 years.
  */
-static void
+static int
 xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
@@ -557,7 +567,7 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 	/* Energy is supported only for card and pkg */
 	if (channel > CHANNEL_PKG) {
 		*energy = 0;
-		return;
+		return 0;
 	}
 
 	if (hwmon->xe->info.platform == XE_BATTLEMAGE) {
@@ -569,7 +579,7 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 		if (ret != sizeof(pmt_val)) {
 			drm_warn(&hwmon->xe->drm, "energy read from pmt failed, ret %d\n", ret);
 			*energy = 0;
-			return;
+			return ret < 0 ? ret : -EIO;
 		}
 
 		if (channel == CHANNEL_PKG)
@@ -586,6 +596,7 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
 
 	*energy = mul_u64_u32_shr(ei->accum_energy, SF_ENERGY,
 				  hwmon->scl_shift_energy);
+	return 0;
 }
 
 static ssize_t
@@ -611,7 +622,8 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 			drm_err(&hwmon->xe->drm,
 				"power interval read fail, ch %d, attr %d, val 0x%08x, ret %d\n",
 				channel, power_attr, reg_val, ret);
-			reg_val = 0;
+			mutex_unlock(&hwmon->hwmon_lock);
+			return ret;
 		}
 	} else {
 		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
@@ -1393,7 +1405,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 		}
 	case hwmon_power_crit:
 		if (channel == CHANNEL_CARD) {
-			xe_hwmon_pcode_read_i1(hwmon, &uval);
+			if (xe_hwmon_pcode_read_i1(hwmon, &uval))
+				return 0;
 			return (uval & POWER_SETUP_I1_WATTS) ? 0644 : 0;
 		}
 		break;
@@ -1412,7 +1425,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 			}
 		}
 		if ((!(uval & PWR_LIM_EN)) && channel == CHANNEL_CARD) {
-			xe_hwmon_pcode_read_i1(hwmon, &uval);
+			if (xe_hwmon_pcode_read_i1(hwmon, &uval))
+				return 0;
 			return (uval & POWER_SETUP_I1_WATTS) ? 0444 : 0;
 		}
 		return (uval) ? 0444 : 0;
@@ -1428,11 +1442,9 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 	switch (attr) {
 	case hwmon_power_max:
 	case hwmon_power_cap:
-		xe_hwmon_power_max_read(hwmon, attr, channel, val);
-		return 0;
+		return xe_hwmon_power_max_read(hwmon, attr, channel, val);
 	case hwmon_power_rated_max:
-		xe_hwmon_power_rated_max_read(hwmon, attr, channel, val);
-		return 0;
+		return xe_hwmon_power_rated_max_read(hwmon, attr, channel, val);
 	case hwmon_power_crit:
 		return xe_hwmon_power_curr_crit_read(hwmon, channel, val, SF_POWER);
 	default:
@@ -1549,8 +1561,7 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 {
 	switch (attr) {
 	case hwmon_energy_input:
-		xe_hwmon_energy_get(hwmon, channel, val);
-		return 0;
+		return xe_hwmon_energy_get(hwmon, channel, val);
 	default:
 		return -EOPNOTSUPP;
 	}
-- 
2.25.1

