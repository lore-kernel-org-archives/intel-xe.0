Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947CBC87FCF
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 14:06:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA8F10E85E;
	Thu,  7 Aug 2025 14:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7KT/k0w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4624710E85E
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 14:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754575571; x=1786111571;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+YKSRhBNAee0/4ZXwu0L5F4s1qC3xrukMc5wahL3EwM=;
 b=W7KT/k0wbGuI3sRdyWUpIAKFVea6xHkwYABjaIDAQdfHh4Oddz1spfFF
 /ZWSVjFFq/OqjvGay5ENgv2FfCMW0KIJ0nzvskapHU6uwKU9mO8CrMwBw
 +iKFZ5uN2nAYzSj06OxwPXbwI/0oMh9nCiDrU5o02PR0/bkKRv+d78Ylo
 7iBYDBClGE5yNLN38imj4zSq1+WLNaU0Sg92u5Z6Tkjpk2kn4b69R0whg
 6s0TDEaYKasbDjJ+HUKoaoTlDu4YQtKlik09DuRmHKkS0OcpLW1m6ackb
 CoVjxQ4v3TThA/2Zx9nmn8T4/aFSWZYnwxy8mODV/xU5dh1qqR8DwHVfi g==;
X-CSE-ConnectionGUID: UIOYKRJQTKG99azSHHqe8g==
X-CSE-MsgGUID: eXOowYoqQn+BqrvGwuiHqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56830384"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56830384"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 07:06:11 -0700
X-CSE-ConnectionGUID: Z9C314CuSHeWbuQ2vxYHig==
X-CSE-MsgGUID: sJpWzvGPRFGCJPKUHZ871w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="164320534"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 07:06:08 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3] drm/xe/hwmon: Add SW clamp for power limits writes
Date: Thu,  7 Aug 2025 19:36:02 +0530
Message-Id: <20250807140602.3247853-1-karthik.poosa@intel.com>
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

v2:
 - Address below review comments. (Riana)
 - Split comments into multiple sentences.
 - Use local variables for readability.
 - Add a debug log.
 - Use u64 instead of unsigned long.

v3:
 - Change drm_dbg logs to drm_info. (Badal)

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical power")
Fixes: fb1b70607f73 ("drm/xe/hwmon: Expose power attributes")
---
 drivers/gpu/drm/xe/xe_hwmon.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index f08fc4377d25..a43bc8b91fea 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -332,6 +332,7 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
 	int ret = 0;
 	u32 reg_val, max;
 	struct xe_reg rapl_limit;
+	u64 max_mbx_power_limit = 0;
 
 	mutex_lock(&hwmon->hwmon_lock);
 
@@ -356,6 +357,20 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
 		goto unlock;
 	}
 
+	/*
+	 * If the sysfs value exceeds the pcode mailbox cmd WRITE_PSYSGPU/PACKAGE_POWER_LIMIT
+	 * max supported value, clamp it to the command's max (U12.3 format).
+	 * This is to avoid truncation during reg_val calculation below and ensure the valid
+	 * power limit is sent for pcode which would clamp it to card-supported value.
+	 */
+	max_mbx_power_limit = ((PWR_LIM_VAL) >> hwmon->scl_shift_power) * SF_POWER;
+	if (value > max_mbx_power_limit) {
+		value = max_mbx_power_limit;
+		drm_info(&hwmon->xe->drm,
+			 "Sysfs value for ch %d %s exceeds limit; clamped to supported maximum\n",
+			 channel, PWR_ATTR_TO_STR(attr));
+	}
+
 	/* Computation in 64-bits to avoid overflow. Round to nearest. */
 	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
 
@@ -739,9 +754,23 @@ static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, int channel,
 {
 	int ret;
 	u32 uval;
+	u64 max_crit_power_curr = 0;
 
 	mutex_lock(&hwmon->hwmon_lock);
 
+	/*
+	 * If the sysfs value exceeds the pcode mailbox cmd POWER_SETUP_SUBCOMMAND_WRITE_I1
+	 * max supported value, clamp it to the command's max (U10.6 format).
+	 * This is to avoid truncation during uval calculation below and ensure the valid power
+	 * limit is sent for pcode which would clamp it to card-supported value.
+	 */
+	max_crit_power_curr = (POWER_SETUP_I1_DATA_MASK >> POWER_SETUP_I1_SHIFT) * scale_factor;
+	if (value > max_crit_power_curr) {
+		value = max_crit_power_curr;
+		drm_info(&hwmon->xe->drm,
+			 "Sysfs value for ch %d exceeds limit; clamped to supported maximum\n",
+			 channel);
+	}
 	uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT, scale_factor);
 	ret = xe_hwmon_pcode_write_i1(hwmon, uval);
 
-- 
2.25.1

