Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9B1CC6B12
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 18:50:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DBC10E7C2;
	Tue, 13 Oct 2026 18:50:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3C410E5E5
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 18:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791917430; x=1823453430;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5GidMhwh+ti0hOi6gKyJC2er4VZ9h9FU3hfvUGDb+Do=;
 b=XwfgUEDw1y7soalvifu5uozFuU1qgCtNo4TyjjHA4pXC7h8PYuVwdsaM
 R6+DTsppu4Zw/YqV62aiwIkTnzthzy5WVdG5jJPNP0K+ZvCTILmD3lFEv
 4mR8ILqV9wE4zQMG2YbP4ryR1IawsksRIYlLovzWOZPFyB8HJ1LYrIKAf
 bHe/w0MHSrw2xj3fpJ1/JFMImptkvHF9lerdWqf8QHis22+XfaFS6+lxf
 jbGoXlLhXA1BfrR7h/48XXGLkbsXONBF/ZpzuACBAVxxWL6A0NYU2z2+3
 p/GcB5hziJJn98muFC1WL2PwiiKewd2wMLzfKrDi/MnO2mQRzbDm0U1uE A==;
X-CSE-ConnectionGUID: 7jn/CnRZSAKGuEMvt47OGg==
X-CSE-MsgGUID: OjYbtwJFRqGUN+avtUkNPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="545767"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="545767"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:50:30 -0700
X-CSE-ConnectionGUID: RpvHCWUOQNOgIiXjguyOxA==
X-CSE-MsgGUID: XqUXsJQMRy6cN4lEoVQvDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1596105"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:50:28 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v12 01/16] drm/xe/hwmon: Handle pcode read failures of
 xe_hwmon_pcode_rmw_power_limit
Date: Wed, 14 Oct 2026 00:19:24 +0530
Message-Id: <20261013184939.694945-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261013184939.694945-1-karthik.poosa@intel.com>
References: <20261013184939.694945-1-karthik.poosa@intel.com>
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

Return early when the pcode read operation fails in
xe_hwmon_pcode_rmw_power_limit() and check the returned error in
callers to avoid updating power limit settings with invalid data.

v2: Check return in xe_hwmon_get_preregistration_info() also. (Sashiko)

Fixes: 8aa7306631f0 ("drm/xe/hwmon: Fix xe_hwmon_power_max_write")
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 56 ++++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 5edeac961ec3..0b46572bb3c8 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -232,9 +232,11 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
 						  READ_PSYSGPU_POWER_LIMIT :
 						  READ_PACKAGE_POWER_LIMIT,
 						  prepare_power_limit_param2(hwmon)), &val0, &val1);
-	if (ret)
-		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
+	if (ret) {
+		drm_err(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
 			channel, val0, val1, ret);
+		return ret;
+	}
 
 	if (attr == PL1_HWMON_ATTR)
 		val0 = (val0 & ~clr) | set;
@@ -394,7 +396,9 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
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
@@ -679,15 +683,19 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 
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
@@ -1510,23 +1518,29 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 				 "Failed to read power limits, check GPU firmware !\n");
 		} else {
 			drm_info(&hwmon->xe->drm, "Using mailbox commands for power limits\n");
-			/* Write default limits to read from pcode from now on. */
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
+
 			hwmon->scl_shift_power = PWR_UNIT;
 			hwmon->scl_shift_energy = ENERGY_UNIT;
 			hwmon->scl_shift_time = TIME_UNIT;
-			hwmon->boot_power_limit_read = true;
+
+			/* Write default limits to read from pcode from now on. */
+			if (xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
+							   CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
+							   hwmon->pl1_on_boot[CHANNEL_CARD]) ||
+			    xe_hwmon_pcode_rmw_power_limit(hwmon, PL1_HWMON_ATTR,
+							   CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
+							   hwmon->pl1_on_boot[CHANNEL_PKG]) ||
+			    xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
+							   CHANNEL_CARD, PWR_LIM | PWR_LIM_TIME,
+							   hwmon->pl2_on_boot[CHANNEL_CARD]) ||
+			    xe_hwmon_pcode_rmw_power_limit(hwmon, PL2_HWMON_ATTR,
+							   CHANNEL_PKG, PWR_LIM | PWR_LIM_TIME,
+							   hwmon->pl2_on_boot[CHANNEL_PKG])) {
+				drm_warn(&hwmon->xe->drm,
+					 "Failed to set default power limits !\n");
+			} else {
+				hwmon->boot_power_limit_read = true;
+			}
 		}
 	} else {
 		drm_info(&hwmon->xe->drm, "Using register for power limits\n");
-- 
2.25.1

