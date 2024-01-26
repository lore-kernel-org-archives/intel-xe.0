Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E3FC47DDB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 07:40:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B254E10E14F;
	Fri, 26 Jan 2024 07:40:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1B510E14F
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 07:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706254809; x=1737790809;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MFu8HgzcHENtLLYdUNbaaQrkceqhGyJNjiofenAk/+I=;
 b=dlOxqooHRbG9vGbsqhmBoZQQbVX+mmdz7RC2L/RqK8HNkrn/lwzr73u0
 KARGoKV6oWyjei6hYOGmnzCaiVYvX8etQZwzqOxjS4GQv0/nM6GXeC9Z1
 zfkkKk2VdUExQcoU+S4SA9HxXl/64D98LX54Tc8XJCjUp5z36BxbaMvPu
 QCdLa2VCBXmZNz7e1LjY9BXzcqmKaL4HUor4dUlYCP/lyxrFol8nf5toU
 8XDbDUNau/oom53ghouT/xBdqg0UTSJ7p6UowI4i9MUvdnSfAuMVANAuR
 KqZLQvgtgdmpGzBYtJUEgrJ8B2lBfexkXyOx6gakxq7iu0yynniHHdTFt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="1338501"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1338501"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 23:40:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="28748761"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 23:40:06 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/hwmon: Refactor xe hwmon
Date: Fri, 26 Jan 2024 13:18:19 +0530
Message-Id: <20240126074819.3851075-1-karthik.poosa@intel.com>
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
Cc: Karthik Poosa <karthik.poosa@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Check latest platform first in xe_hwmon_get_reg.
Move PVC registers to xe_mchbar_regs.h.

Fixes: fb1b70607f73 ("drm/xe/hwmon: Expose power attributes")
Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  6 ------
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h |  6 ++++++
 drivers/gpu/drm/xe/xe_hwmon.c            | 24 ++++++++++++------------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index cd27480f6486..15ac2d284d48 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -490,10 +490,4 @@
 #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
 #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
 
-#define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
-#define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
-#define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
-#define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
-#define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
-
 #endif
diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
index 519dd1067a19..97652b4297ff 100644
--- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
@@ -41,4 +41,10 @@
 #define   PKG_PWR_LIM_1_TIME_X			REG_GENMASK(23, 22)
 #define   PKG_PWR_LIM_1_TIME_Y			REG_GENMASK(21, 17)
 
+#define PVC_GT0_PACKAGE_ENERGY_STATUS           XE_REG(0x281004)
+#define PVC_GT0_PACKAGE_RAPL_LIMIT              XE_REG(0x281008)
+#define PVC_GT0_PACKAGE_POWER_SKU_UNIT          XE_REG(0x281068)
+#define PVC_GT0_PLATFORM_ENERGY_STATUS          XE_REG(0x28106c)
+#define PVC_GT0_PACKAGE_POWER_SKU               XE_REG(0x281080)
+
 #endif /* _XE_MCHBAR_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 89c6f7f84b5a..c19a0daf7fd7 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -77,32 +77,32 @@ static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
 
 	switch (hwmon_reg) {
 	case REG_PKG_RAPL_LIMIT:
-		if (xe->info.platform == XE_DG2)
-			reg = PCU_CR_PACKAGE_RAPL_LIMIT;
-		else if (xe->info.platform == XE_PVC)
+		if (xe->info.platform == XE_PVC)
 			reg = PVC_GT0_PACKAGE_RAPL_LIMIT;
+		else if (xe->info.platform == XE_DG2)
+			reg = PCU_CR_PACKAGE_RAPL_LIMIT;
 		break;
 	case REG_PKG_POWER_SKU:
-		if (xe->info.platform == XE_DG2)
-			reg = PCU_CR_PACKAGE_POWER_SKU;
-		else if (xe->info.platform == XE_PVC)
+		if (xe->info.platform == XE_PVC)
 			reg = PVC_GT0_PACKAGE_POWER_SKU;
+		else if (xe->info.platform == XE_DG2)
+			reg = PCU_CR_PACKAGE_POWER_SKU;
 		break;
 	case REG_PKG_POWER_SKU_UNIT:
-		if (xe->info.platform == XE_DG2)
-			reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
-		else if (xe->info.platform == XE_PVC)
+		if (xe->info.platform == XE_PVC)
 			reg = PVC_GT0_PACKAGE_POWER_SKU_UNIT;
+		else if (xe->info.platform == XE_DG2)
+			reg = PCU_CR_PACKAGE_POWER_SKU_UNIT;
 		break;
 	case REG_GT_PERF_STATUS:
 		if (xe->info.platform == XE_DG2)
 			reg = GT_PERF_STATUS;
 		break;
 	case REG_PKG_ENERGY_STATUS:
-		if (xe->info.platform == XE_DG2)
-			reg = PCU_CR_PACKAGE_ENERGY_STATUS;
-		else if (xe->info.platform == XE_PVC)
+		if (xe->info.platform == XE_PVC)
 			reg = PVC_GT0_PLATFORM_ENERGY_STATUS;
+		else if (xe->info.platform == XE_DG2)
+			reg = PCU_CR_PACKAGE_ENERGY_STATUS;
 		break;
 	default:
 		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);
-- 
2.25.1

