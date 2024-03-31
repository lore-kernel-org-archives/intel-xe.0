Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3170CD1284
	for <intel-xe@archiver.kernel.org>; Sun, 31 Mar 2024 14:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7537910E78D;
	Sun, 31 Mar 2024 14:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aVAE9xpQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB2E10E78D
 for <intel-xe@lists.freedesktop.org>; Sun, 31 Mar 2024 14:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711896200; x=1743432200;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0KYRYEt+tmez7vY7NeL47Hu+vzRJEvxVD8D438wzjg4=;
 b=aVAE9xpQaZLLSfbQ3iue5GRuFZW4VsbVDDkwM7yNNTyg6+JQRDs9ax8A
 bin6oXlcITyzcv17HD87/j52dXTIU/0IlDwcelZiAysp4unvQolv3wYCm
 dUv0pU4TpA0GhV4sr09azGCQeLcHHTnULV9FjS8Uo0O1b4i1+a5k6kKv2
 4PWUbQkgZmRrhVWcAYjUyJtpSRGuRU4Lo1zYpNWjK3Kveeh5MTg36lKZC
 doYRne5Ur76u4EAsi0d/vVHc+MSkOH5i3pw/HXBn67egLM32Y4/7/vX6r
 pbf4eL28oymZmwspRJO3yJyO55SdC/rjm9j3qN/Q60xwQQutdPK8omccG g==;
X-CSE-ConnectionGUID: GbsZMO6IRV6PWTgKgwKMXg==
X-CSE-MsgGUID: wDQRMJJoQga3avpKy+wCYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="6862215"
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="6862215"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2024 07:43:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; d="scan'208";a="17451324"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2024 07:43:18 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2] drm/xe/hwmon: Update xe hwmon with couple of fixes
Date: Sun, 31 Mar 2024 20:23:40 +0530
Message-Id: <20240331145340.4065125-1-karthik.poosa@intel.com>
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

Fix potential overflows with upcasting.
Initialize variables which were being used uninitialized.

v2:
 - Rebase.
 - In xe_hwmon_process_reg, set argument 'value' to 0 on failure.
   With this change caller function need not initialize value to 0.

Fixes: 4446fcf220ce ("drm/xe/hwmon: Expose power1_max_interval")
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 7e8caac838e0..bc1bc73749c1 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -129,8 +129,10 @@ static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon
 
 	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg, channel);
 
-	if (!reg.raw)
+	if (!reg.raw) {
+		*value = 0;
 		return;
+	}
 
 	switch (operation) {
 	case REG_READ32:
@@ -143,6 +145,7 @@ static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon
 		*value = xe_mmio_read64_2x32(hwmon->gt, reg);
 		break;
 	default:
+		*value = 0;
 		drm_warn(&gt_to_xe(hwmon->gt)->drm, "Invalid xe hwmon reg operation: %d\n",
 			 operation);
 		break;
@@ -298,7 +301,7 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 	 * As y can be < 2, we compute tau4 = (4 | x) << y
 	 * and then add 2 when doing the final right shift to account for units
 	 */
-	tau4 = ((1 << x_w) | x) << y;
+	tau4 = (u64)((1 << x_w) | x) << y;
 
 	/* val in hwmon interface units (millisec) */
 	out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
@@ -339,7 +342,7 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 	r = FIELD_PREP(PKG_MAX_WIN, PKG_MAX_WIN_DEFAULT);
 	x = REG_FIELD_GET(PKG_MAX_WIN_X, r);
 	y = REG_FIELD_GET(PKG_MAX_WIN_Y, r);
-	tau4 = ((1 << x_w) | x) << y;
+	tau4 = (u64)((1 << x_w) | x) << y;
 	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
 
 	if (val > max_win)
-- 
2.25.1

