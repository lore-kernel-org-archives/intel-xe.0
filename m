Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359ABCD1284
	for <intel-xe@archiver.kernel.org>; Thu,  4 Apr 2024 03:44:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B386112E0E;
	Thu,  4 Apr 2024 03:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nPzSTtTa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E20C6112E0E
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Apr 2024 03:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712202262; x=1743738262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lh3EXiCR/KX6UIdBzvB980Is96hskNAutm6T1mT3taw=;
 b=nPzSTtTasGvbTJK1J/RTfMGhfTZ1uYbvnN4qLV+kDTQv7ImnirZlwDkl
 2ssjPMu9caPl5/K5FZYmKT514ymSDM4kwiC1AQbUx6ipy+by5gGEuVEop
 APhN07F+shu/7n34JDs5k+mNBmfbqvEux+jlfSsPIPCmy+12VQGOgjmO9
 17xhAbIY6s4JIaDbWTVp/svFyqezr5iQKzGIO5kH7aiZDrUEZ6L72Rra2
 FAYVcXQ+25aC9O8DX+J4Pr3qmpW3rEkbyJ+Kc+7jylUbAN1dVY8n66DXC
 isemN8x/3RMMMvyp0RRfHAAXk8H+V4UYpjPwpcPUADVaR2lY/qmuRFi2f g==;
X-CSE-ConnectionGUID: vIgY9zAJRfabCc76CV6l0A==
X-CSE-MsgGUID: 0pDhym3gQumevgjnWDiKZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11296496"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="11296496"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 20:44:22 -0700
X-CSE-ConnectionGUID: CdcYJBURSOeGaMby/USzcQ==
X-CSE-MsgGUID: cyQoRsd2ThulVO6YuuNoYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; d="scan'208";a="23405180"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 20:44:19 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v5 2/4] drm/xe/hwmon: Update xe_hwmon_get_reg to return struct
 xe_reg
Date: Thu,  4 Apr 2024 09:24:39 +0530
Message-Id: <20240404035441.965590-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240404035441.965590-1-karthik.poosa@intel.com>
References: <20240404035441.965590-1-karthik.poosa@intel.com>
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

Return register address as struct xe_reg from xe_hwmon_get_reg
instead of u32. (Lucas)
Use XE_REG_IS_VALID() from caller to check returned xe_reg. (Badal)
These changes are done to have abstracted usage of struct xe_reg.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 47 +++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 7e8caac838e0..2385f05d9504 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -79,46 +79,46 @@ struct xe_hwmon {
 	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
 };
 
-static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg, int channel)
+static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
+				      int channel)
 {
 	struct xe_device *xe = gt_to_xe(hwmon->gt);
-	struct xe_reg reg = XE_REG(0);
 
 	switch (hwmon_reg) {
 	case REG_PKG_RAPL_LIMIT:
 		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
-			reg = PVC_GT0_PACKAGE_RAPL_LIMIT;
+			return PVC_GT0_PACKAGE_RAPL_LIMIT;
 		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
-			reg = PCU_CR_PACKAGE_RAPL_LIMIT;
+			return PCU_CR_PACKAGE_RAPL_LIMIT;
 		break;
 	case REG_PKG_POWER_SKU:
 		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
-			reg = PVC_GT0_PACKAGE_POWER_SKU;
+			return PVC_GT0_PACKAGE_POWER_SKU;
 		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
-			reg = PCU_CR_PACKAGE_POWER_SKU;
+			return PCU_CR_PACKAGE_POWER_SKU;
 		break;
 	case REG_PKG_POWER_SKU_UNIT:
 		if (xe->info.platform == XE_PVC)
-			reg = PVC_GT0_PACKAGE_POWER_SKU_UNIT;
+			return PVC_GT0_PACKAGE_POWER_SKU_UNIT;
 		else if (xe->info.platform == XE_DG2)
-			reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
+			return PCU_CR_PACKAGE_POWER_SKU_UNIT;
 		break;
 	case REG_GT_PERF_STATUS:
 		if (xe->info.platform == XE_DG2 && channel == CHANNEL_PKG)
-			reg = GT_PERF_STATUS;
+			return GT_PERF_STATUS;
 		break;
 	case REG_PKG_ENERGY_STATUS:
 		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
-			reg = PVC_GT0_PLATFORM_ENERGY_STATUS;
+			return PVC_GT0_PLATFORM_ENERGY_STATUS;
 		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
-			reg = PCU_CR_PACKAGE_ENERGY_STATUS;
+			return PCU_CR_PACKAGE_ENERGY_STATUS;
 		break;
 	default:
 		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);
 		break;
 	}
 
-	return reg.raw;
+	return XE_REG(0);
 }
 
 static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
@@ -127,9 +127,9 @@ static void xe_hwmon_process_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon
 {
 	struct xe_reg reg;
 
-	reg.raw = xe_hwmon_get_reg(hwmon, hwmon_reg, channel);
+	reg = xe_hwmon_get_reg(hwmon, hwmon_reg, channel);
 
-	if (!reg.raw)
+	if (!XE_REG_IS_VALID(reg))
 		return;
 
 	switch (operation) {
@@ -400,7 +400,7 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
 
 	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
 
-	ret = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, index) ? attr->mode : 0;
+	ret = XE_REG_IS_VALID(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, index)) ? attr->mode : 0;
 
 	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
 
@@ -496,16 +496,19 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 
 	switch (attr) {
 	case hwmon_power_max:
-		return xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel) ? 0664 : 0;
+		return XE_REG_IS_VALID(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
+				       channel)) ? 0664 : 0;
 	case hwmon_power_rated_max:
-		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel) ? 0444 : 0;
+		return XE_REG_IS_VALID(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU,
+				       channel)) ? 0444 : 0;
 	case hwmon_power_crit:
 		if (channel == CHANNEL_PKG)
 			return (xe_hwmon_pcode_read_i1(hwmon->gt, &uval) ||
 				!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
 		break;
 	case hwmon_power_label:
-		return xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, channel) ? 0444 : 0;
+		return XE_REG_IS_VALID(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
+				       channel)) ? 0444 : 0;
 	default:
 		return 0;
 	}
@@ -588,7 +591,8 @@ xe_hwmon_in_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	switch (attr) {
 	case hwmon_in_input:
 	case hwmon_in_label:
-		return xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS, channel) ? 0444 : 0;
+		return XE_REG_IS_VALID(xe_hwmon_get_reg(hwmon, REG_GT_PERF_STATUS,
+				       channel)) ? 0444 : 0;
 	default:
 		return 0;
 	}
@@ -612,7 +616,8 @@ xe_hwmon_energy_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 	switch (attr) {
 	case hwmon_energy_input:
 	case hwmon_energy_label:
-		return xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS, channel) ? 0444 : 0;
+		return XE_REG_IS_VALID(xe_hwmon_get_reg(hwmon, REG_PKG_ENERGY_STATUS,
+				       channel)) ? 0444 : 0;
 	default:
 		return 0;
 	}
@@ -763,7 +768,7 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
 	 * The contents of register PKG_POWER_SKU_UNIT do not change,
 	 * so read it once and store the shift values.
 	 */
-	if (xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0)) {
+	if (XE_REG_IS_VALID(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0))) {
 		xe_hwmon_process_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
 				     REG_READ32, &val_sku_unit, 0, 0, 0);
 		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
-- 
2.25.1

