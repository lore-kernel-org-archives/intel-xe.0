Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A9FC5B543
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 10:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA1E10E20B;
	Thu, 29 May 2025 10:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SRAvZElp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7910810E1E6
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 10:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748514898; x=1780050898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NJDe5j6wEZxGGJs8/rJ+KMueQlecoOc6t8EXATr3TD8=;
 b=SRAvZElp5pKz1jOtf/o9no944jhf4bxZEbAX+j0gD1WOHg0e6Gc5RGVM
 cjRU9UmbeTg8D7d7j/Kl5hxXQBtT5oGhJPFlhOmMxuwyWeDXKlaPrlNGB
 zkHVdmA1jRfhPWf8rRP76hCtMXyIKjpdKxOagm0UKZAKZ9h0tR4BcQ10b
 KnxaEgEx4V8K8r71QLHpnUiEAjuBFHJsHHVi3CKOmYO7W0ihU8rr7VCk0
 blKatrztOWIHflgsMPJPni8byHb5bHizi1h6DFDVeTuk8sZGWuvcdmHf7
 iPhzJP1pBcExm3fs6B72E6p1TDNDCrm2hPu9zbuCeOSzCxxQFXG4sZXiu Q==;
X-CSE-ConnectionGUID: sS7lRf6hRXGZlecM8ZVebg==
X-CSE-MsgGUID: EnatIyxzSD2zVqIqVUpYXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61233527"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; d="scan'208";a="61233527"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 03:34:58 -0700
X-CSE-ConnectionGUID: JONdFIF9Sr6sM2CUJwtFlg==
X-CSE-MsgGUID: 6bjfeVozRO6T1BPTCfIyBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; d="scan'208";a="144511068"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 03:34:56 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v11 6/6] drm/xe/hwmon: Expose power sysfs entries based on
 firmware support
Date: Thu, 29 May 2025 16:04:30 +0530
Message-Id: <20250529103430.2348053-7-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529103430.2348053-1-karthik.poosa@intel.com>
References: <20250529103430.2348053-1-karthik.poosa@intel.com>
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

Enable hwmon sysfs entries (power_xxx) only when GPU firmware
supports it.
Previously, these entries were created if the MMIO register
was present. Now, we enable based on the data in the register.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 65 +++++++++++++++++++++--------------
 1 file changed, 40 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index c57c613471c3..25a89575a629 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -296,18 +296,12 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channe
 	if (hwmon->xe->info.has_mbx_power_limits) {
 		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, (u32 *)&reg_val);
 	} else {
-		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
-		pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
-
 		/*
-		 * Valid check of REG_PKG_RAPL_LIMIT is already done in xe_hwmon_power_is_visible.
+		 * Valid check of these registers is already done in xe_hwmon_power_is_visible.
 		 * So not checking it again here.
 		 */
-		if (!xe_reg_is_valid(pkg_power_sku)) {
-			drm_warn(&xe->drm, "pkg_power_sku invalid\n");
-			*value = 0;
-			goto unlock;
-		}
+		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
+		pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
 		reg_val = xe_mmio_read32(mmio, rapl_limit);
 	}
 
@@ -652,17 +646,20 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
 	int ret = 0;
 	int channel = (index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
 	u32 power_attr = (index > 1) ? PL2_HWMON_ATTR : PL1_HWMON_ATTR;
-	u32 uval;
+	u32 uval = 0;
+	struct xe_reg rapl_limit;
+	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 
 	xe_pm_runtime_get(hwmon->xe);
 
 	if (hwmon->xe->info.has_mbx_power_limits) {
 		xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &uval);
-		ret = (uval & PWR_LIM_EN) ? attr->mode : 0;
 	} else if (power_attr != PL2_HWMON_ATTR) {
-		ret = xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
-						       channel)) ? attr->mode : 0;
+		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
+		if (xe_reg_is_valid(rapl_limit))
+			uval = xe_mmio_read32(mmio, rapl_limit);
 	}
+	ret = (uval & PWR_LIM_EN) ? attr->mode : 0;
 
 	xe_pm_runtime_put(hwmon->xe);
 
@@ -806,24 +803,20 @@ static umode_t
 xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 {
 	u32 uval = 0;
-	struct xe_reg rapl_limit;
+	struct xe_reg reg;
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
 
 	switch (attr) {
 	case hwmon_power_max:
 	case hwmon_power_cap:
-	case hwmon_power_label:
 		if (hwmon->xe->info.has_mbx_power_limits) {
 			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
 		} else if (attr != PL2_HWMON_ATTR) {
-			rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
-			if (xe_reg_is_valid(rapl_limit))
-				uval = xe_mmio_read32(mmio, rapl_limit);
+			reg = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
+			if (xe_reg_is_valid(reg))
+				uval = xe_mmio_read32(mmio, reg);
 		}
 		if (uval & PWR_LIM_EN) {
-			if (attr == hwmon_power_label)
-				return 0444;
-
 			drm_info(&hwmon->xe->drm, "%s is supported on channel %d\n",
 				 PWR_ATTR_TO_STR(attr), channel);
 			return 0664;
@@ -832,17 +825,39 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 			PWR_ATTR_TO_STR(attr), channel);
 		return 0;
 	case hwmon_power_rated_max:
-		if (hwmon->xe->info.has_mbx_power_limits)
+		if (hwmon->xe->info.has_mbx_power_limits) {
 			return 0;
-		else
-			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU,
-					       channel)) ? 0444 : 0;
+		} else {
+			reg = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
+			if (xe_reg_is_valid(reg))
+				uval = xe_mmio_read32(mmio, reg);
+			return uval ? 0444 : 0;
+		}
 	case hwmon_power_crit:
 		if (channel == CHANNEL_CARD) {
 			xe_hwmon_pcode_read_i1(hwmon, &uval);
 			return (uval & POWER_SETUP_I1_WATTS) ? 0644 : 0;
 		}
 		break;
+	case hwmon_power_label:
+		if (hwmon->xe->info.has_mbx_power_limits) {
+			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
+		} else {
+			reg = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
+			if (xe_reg_is_valid(reg))
+				uval = xe_mmio_read32(mmio, reg);
+
+			if (!uval) {
+				reg = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
+				if (xe_reg_is_valid(reg))
+					uval = xe_mmio_read32(mmio, reg);
+			}
+		}
+		if ((!(uval & PWR_LIM_EN)) && channel == CHANNEL_CARD) {
+			xe_hwmon_pcode_read_i1(hwmon, &uval);
+			return (uval & POWER_SETUP_I1_WATTS) ? 0444 : 0;
+		}
+		return (uval) ? 0444 : 0;
 	default:
 		return 0;
 	}
-- 
2.25.1

