Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69D0C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 14:25:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0721124DE;
	Fri, 22 Mar 2024 14:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aj2n5czN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5451124DD
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 14:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711117521; x=1742653521;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZqvbRAI+e2x+7+vMrk33ErPxZLIHi2dX7Y25Sj10tZc=;
 b=aj2n5czNK95B45AQXxv4Ow0v16rEA6sxS7oijlLtUIp4Blem89SRTziI
 cOFLHCLOIyQ3aVo3OSX2DWWk6tloFZAKdPa3TOz1RaX7ZKVVpSBNyIthm
 5/v4W/IxNg5h/C1f4gawIYJIDSGy/lXSqpEiVl61dAwMNfwRk8nJD0fw2
 bGMUMyh6Vd4epX5syYg1wKw5N0KJkMxEvltVdr4ufDEyTwIzirbK0/5DL
 SsOWXTBEvk/Yej1yea2X2aOrsSKPq2WmA+QCXCwczYFIoj/5SlW58KcnZ
 deZNjrzIB52KVedcNHM3mweXsWo266nEVFYdA2Yyv/9n4HUWotNrpaffs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="23622660"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="23622660"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 07:25:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="15334226"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 07:25:19 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH 2/2] drm/xe/hwmon: Fix static analysis tool reported issues
Date: Fri, 22 Mar 2024 20:05:23 +0530
Message-Id: <20240322143523.2531519-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240322143523.2531519-1-karthik.poosa@intel.com>
References: <20240322143523.2531519-1-karthik.poosa@intel.com>
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

Update xe hwmon with fixes for issues reported by static analysis
tool.
Fix integer overflow with upcasting.
Initialize uninitialized variables.

Fixes: 4446fcf220ce ("drm/xe/hwmon: Expose power1_max_interval")
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index a256af8c2012..6ed9d5c4f6b1 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -153,7 +153,7 @@ static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon
  */
 static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
 {
-	u64 reg_val, min, max;
+	u64 reg_val = 0, min, max;
 
 	mutex_lock(&hwmon->hwmon_lock);
 
@@ -182,7 +182,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, long *value)
 static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
 {
 	int ret = 0;
-	u64 reg_val;
+	u64 reg_val = 0;
 
 	mutex_lock(&hwmon->hwmon_lock);
 
@@ -212,7 +212,7 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, long value)
 
 static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, long *value)
 {
-	u64 reg_val;
+	u64 reg_val = 0;
 
 	xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU, REG_READ32, &reg_val, 0, 0);
 	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
@@ -243,7 +243,7 @@ static void
 xe_hwmon_energy_get(struct xe_hwmon *hwmon, long *energy)
 {
 	struct xe_hwmon_energy_info *ei = &hwmon->ei;
-	u64 reg_val;
+	u64 reg_val = 0;
 
 	xe_hwmon_process_reg(hwmon, REG_PKG_ENERGY_STATUS, REG_READ32,
 			     &reg_val, 0, 0);
@@ -264,8 +264,8 @@ xe_hwmon_power1_max_interval_show(struct device *dev, struct device_attribute *a
 				  char *buf)
 {
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
-	u32 x, y, x_w = 2; /* 2 bits */
-	u64 r, tau4, out;
+	u32 x = 0, y = 0, x_w = 2; /* 2 bits */
+	u64 r = 0, tau4, out;
 
 	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
 
@@ -291,7 +291,7 @@ xe_hwmon_power1_max_interval_show(struct device *dev, struct device_attribute *a
 	 * As y can be < 2, we compute tau4 = (4 | x) << y
 	 * and then add 2 when doing the final right shift to account for units
 	 */
-	tau4 = ((1 << x_w) | x) << y;
+	tau4 = (u64)((1 << x_w) | x) << y;
 
 	/* val in hwmon interface units (millisec) */
 	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
@@ -331,7 +331,7 @@ xe_hwmon_power1_max_interval_store(struct device *dev, struct device_attribute *
 	r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
 	x = REG_FIELD_GET(PKG_MAX_WIN_X, r);
 	y = REG_FIELD_GET(PKG_MAX_WIN_Y, r);
-	tau4 = ((1 << x_w) | x) << y;
+	tau4 = (u64)((1 << x_w) | x) << y;
 	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
 
 	if (val > max_win)
@@ -466,7 +466,7 @@ static int xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, long value, u3
 
 static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, long *value)
 {
-	u64 reg_val;
+	u64 reg_val = 0;
 
 	xe_hwmon_process_reg(hwmon, REG_GT_PERF_STATUS,
 			     REG_READ32, &reg_val, 0, 0);
-- 
2.25.1

