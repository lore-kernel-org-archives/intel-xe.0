Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4C0C87FCA
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 19:36:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9794010E3A2;
	Thu, 31 Jul 2025 19:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Le6O162z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC1D10E3A2
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 19:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753990586; x=1785526586;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YpL1eg2o3ovLSHH2r/93v8xZl7R7QrpmGn1OsF/tYvA=;
 b=Le6O162zguJeDkga7pglHCBATqq6u4MMhbPfdCUhFDtzbXoHcxywYOKI
 3O5r/4W1ArIUU2mIgbOv4I2uXUuJepDZtJ+QAcXYVZ/BfgjSQLT1U4XPr
 0Qli9DQDOI1fkpj0WVf9tdYY3QqYsbxuwI+emlGabr8PhuR5ExooK2WaE
 u4OZ0++f5M+TQBY+K0ARWSgyAqm6gSMCjTh29RkXJH5hofFfD6tgo4NWK
 8Qg1KBzbs7LrVHWHU6YW+E9GFnHqPnkJYPkFHp8FDHUWAZV3tzkf/n6uO
 LAp0Ou+ejEKALGYuAavoSRw80GYB3UuXaNCLqypkrMalPjYhurLb/bMNz A==;
X-CSE-ConnectionGUID: bzuI4ZnNRbaCwdqxu9S/Zg==
X-CSE-MsgGUID: hyzuoxw8SNuigwu3dbHpCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56212655"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56212655"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:36:25 -0700
X-CSE-ConnectionGUID: lWv5bkAlQSe6kj+efIg0xw==
X-CSE-MsgGUID: bCzqwY/oRoitaz+eYn+6TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163263487"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 12:36:23 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH] drm/xe/hwmon: Add SW clamp for power limits writes
Date: Fri,  1 Aug 2025 01:06:07 +0530
Message-Id: <20250731193607.3067834-1-karthik.poosa@intel.com>
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

Clamp writes to power limits powerX_crit/currX_crit, powerX_cap,
powerX_max, to the maximum supported by the pcode mailbox
when sysfs-provided values exceed this limit.
Although the pcode already performs clamping, values beyond the pcode
mailbox's supported range get truncated, leading to incorrect
critical power settings.
This patch ensures proper clamping to prevent such truncation.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical power")
Fixes: fb1b70607f73 ("drm/xe/hwmon: Expose power attributes")
---
 drivers/gpu/drm/xe/xe_hwmon.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index f08fc4377d25..6f56f9192c6b 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -356,6 +356,15 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
 		goto unlock;
 	}
 
+	/*
+	 * If the sysfs value exceeds the pcode mailbox cmd WRITE_PSYSGPU/PACKAGE_POWER_LIMIT
+	 * max supported value, clamp it to the command's max (U12.3 format) to avoid
+	 * truncation during reg_val calculation below and ensure the valid power limit is sent for
+	 * pcode which would clamp it to card-supported value.
+	 */
+	if (value > (((PWR_LIM_VAL) >> hwmon->scl_shift_power) * SF_POWER))
+		value = (((PWR_LIM_VAL) >> hwmon->scl_shift_power) * SF_POWER);
+
 	/* Computation in 64-bits to avoid overflow. Round to nearest. */
 	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
 
@@ -739,9 +748,22 @@ static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, int channel,
 {
 	int ret;
 	u32 uval;
+	unsigned long max_crit_power_curr = 0;
 
 	mutex_lock(&hwmon->hwmon_lock);
 
+	/*
+	 * If the sysfs value exceeds the pcode mailbox cmd POWER_SETUP_SUBCOMMAND_WRITE_I1
+	 * max supported value, clamp it to the command's max (U10.6 format) to avoid
+	 * truncation during uval calculation below and ensure the valid power limit is sent for
+	 * pcode which would clamp it to card-supported value.
+	 */
+	max_crit_power_curr = (POWER_SETUP_I1_DATA_MASK >> POWER_SETUP_I1_SHIFT) * scale_factor;
+	if (value > max_crit_power_curr) {
+		value = max_crit_power_curr;
+		drm_dbg(&hwmon->xe->drm,
+			"Clamping critical power/curr to max supported\n");
+	}
 	uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT, scale_factor);
 	ret = xe_hwmon_pcode_write_i1(hwmon, uval);
 
-- 
2.25.1

