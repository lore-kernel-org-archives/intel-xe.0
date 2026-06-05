Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64836CD6E74
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 09:26:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC2511A643;
	Fri,  5 Jun 2026 09:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OdGftYC6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE0F11A5E0
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 09:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780651568; x=1812187568;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IifiZeVkIuUce2cx/tPSkX/aq+Vx1bzNPnYZWVOt2g0=;
 b=OdGftYC6Mps5Bfui609/fMZT+rCX6/IMiooOG9KRa6iWw7AkhZPozbEY
 qVRiTOaSBVaOCLyzBrYMcN48YsMe26w/cQToFYvdbS4u8giwwZ9G1PRsu
 3Bv/R5B9QPw0WXnTCOFhM2iNBhb/AmSg8+Y2UDIxAeLL89VRq3ljgojmH
 Z3y61INcaWkaRYhVdK8MX3rnJdznRe4zL8VdK/pYq1afU8hwyPZJYQhXj
 AKctEON0Terei7K/kvBi9kpguTmtWB4PFPMh4belbCmWOxscHTo84Olqh
 O3MLC5k30kb0uuOUROwL6dV+pm1Y+0YNqFaRSJOj7fEZRFh1dL6deE+YG Q==;
X-CSE-ConnectionGUID: 7oTZulrJTPiSbfZy6ItH2g==
X-CSE-MsgGUID: wRTf06Z5T1eUscfcYTsZBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81517241"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="81517241"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 02:26:08 -0700
X-CSE-ConnectionGUID: DUn3SsL/QH6hDBV7m9phnQ==
X-CSE-MsgGUID: 5DaCQy5DQMON2DsXj7teBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="238443351"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 02:26:06 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH] drm/xe/hwmon: handle CRI+ power interval encoding
Date: Fri,  5 Jun 2026 15:05:27 +0530
Message-Id: <20260605093527.2257977-1-karthik.poosa@intel.com>
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

On CRI and newer platforms, the power-limit interval encoding is changed
from the legacy 1.x * 2^y format to a U5.2 value in milliseconds.
Update the interval calculation accordingly for CRI and future platforms.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 84 ++++++++++++++++++++++-------------
 1 file changed, 53 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index de3f2aeffc3f..4038e1da2e71 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -575,23 +575,34 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
-	x = REG_FIELD_GET(PWR_LIM_TIME_X, reg_val);
-	y = REG_FIELD_GET(PWR_LIM_TIME_Y, reg_val);
+	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
+		/**
+		 * On CRI and newer platforms, the interval encoding changed.
+		 * The value is now stored directly in milliseconds as U5.2,
+		 * replacing the older 1.x * 2^y representation.
+		 * Bits [6:2] hold the integer part and bits [1:0] the fraction,
+		 * so convert to milliseconds by shifting the field right by 2.
+		 */
+		out = (u64)(REG_FIELD_GET(PWR_LIM_TIME, reg_val) >> 2);
+	} else {
+		x = REG_FIELD_GET(PWR_LIM_TIME_X, reg_val);
+		y = REG_FIELD_GET(PWR_LIM_TIME_Y, reg_val);
 
-	/*
-	 * tau = (1 + (x / 4)) * power(2,y), x = bits(23:22), y = bits(21:17)
-	 *     = (4 | x) << (y - 2)
-	 *
-	 * Here (y - 2) ensures a 1.x fixed point representation of 1.x
-	 * As x is 2 bits so 1.x can be 1.0, 1.25, 1.50, 1.75
-	 *
-	 * As y can be < 2, we compute tau4 = (4 | x) << y
-	 * and then add 2 when doing the final right shift to account for units
-	 */
-	tau4 = (u64)((1 << x_w) | x) << y;
+		/*
+		 * tau = (1 + (x / 4)) * power(2,y), x = bits(23:22), y = bits(21:17)
+		 *     = (4 | x) << (y - 2)
+		 *
+		 * Here (y - 2) ensures a 1.x fixed point representation of 1.x
+		 * As x is 2 bits so 1.x can be 1.0, 1.25, 1.50, 1.75
+		 *
+		 * As y can be < 2, we compute tau4 = (4 | x) << y
+		 * and then add 2 when doing the final right shift to account for units
+		 */
+		tau4 = (u64)((1 << x_w) | x) << y;
 
-	/* val in hwmon interface units (millisec) */
-	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
+		/* val in hwmon interface units (millisec) */
+		out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
+	}
 
 	return sysfs_emit(buf, "%llu\n", out);
 }
@@ -637,24 +648,35 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 	if (val > max_win)
 		return -EINVAL;
 
-	/* val in hw units */
-	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME) + 1;
-
-	/*
-	 * Convert val to 1.x * power(2,y)
-	 * y = ilog2(val)
-	 * x = (val - (1 << y)) >> (y - 2)
-	 */
-	if (!val) {
-		y = 0;
-		x = 0;
+	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND) {
+		/**
+		 * On CRI and newer platforms, the interval encoding changed.
+		 * The value is now stored directly in milliseconds as U5.2,
+		 * replacing the older 1.x * 2^y representation.
+		 * Bits [6:2] hold the integer part and bits [1:0] the fraction,so
+		 * convert from milliseconds by shifting the value left by 2 to fit into the field.
+		 */
+		rxy = REG_FIELD_PREP(PWR_LIM_TIME, (val << 2));
 	} else {
-		y = ilog2(val);
-		x = (val - (1ul << y)) << x_w >> y;
-	}
+		/* val in hw units */
+		val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME) + 1;
+
+		/*
+		 * Convert val to 1.x * power(2,y)
+		 * y = ilog2(val)
+		 * x = (val - (1 << y)) >> (y - 2)
+		 */
+		if (!val) {
+			y = 0;
+			x = 0;
+		} else {
+			y = ilog2(val);
+			x = (val - (1ul << y)) << x_w >> y;
+		}
 
-	rxy = REG_FIELD_PREP(PWR_LIM_TIME_X, x) |
-			       REG_FIELD_PREP(PWR_LIM_TIME_Y, y);
+		rxy = REG_FIELD_PREP(PWR_LIM_TIME_X, x) |
+				       REG_FIELD_PREP(PWR_LIM_TIME_Y, y);
+	}
 
 	guard(xe_pm_runtime)(hwmon->xe);
 
-- 
2.25.1

