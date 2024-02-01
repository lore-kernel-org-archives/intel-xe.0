Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1A7C4828D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 18:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D2110E090;
	Thu,  1 Feb 2024 18:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EXWlQv5f";
	dkim-atps=neutral
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Thu, 01 Feb 2024 18:04:48 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768ED10E090
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 18:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706810689; x=1738346689;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+IBn9xmhpdMKeHZ6vy1pnZen+eaI6dgFlj7hOMIW/H8=;
 b=EXWlQv5f9gG99i84+9JKz+54oaZQUcak7KG0qBi6/BRTkyj4WR/xT6LN
 CBp48UqWz7VO/JpfEV5ci1ugYHUSjVO3+C3UCnv6qqQ25lRiTBiSNzMQO
 Hw8Z4mpHPKE2SVT7jK0cfDaFO3LP+qUEVP8R6VpNYMnjurbOMB8D8wATA
 GHkXqY8Hm9C5yafAgZMpli5PB8dMtW0QipHtefQD7vB/8H1f1d8j6qrUm
 qnRIdiai3WIGfDb5Cx6+OYeZGvsnZfRIePaYpTXQQmtJviz1sxyNr7kDy
 r6VdHiK9ww8oxTMHgBc4dxiUG5hQmto4asXxlehlNCxaalxavbYZkNYmH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="144222"
X-IronPort-AV: E=Sophos;i="6.05,235,1701158400"; 
   d="scan'208";a="144222"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 09:57:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="961986691"
X-IronPort-AV: E=Sophos;i="6.05,235,1701158400"; d="scan'208";a="961986691"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 09:57:39 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 matthew.d.roper@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH] drm/xe/hwmon: Refactor xe hwmon
Date: Thu,  1 Feb 2024 23:36:00 +0530
Message-Id: <20240201180600.434822-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Check latest platform first in xe_hwmon_get_reg.
Move PVC HWMON registers to regs/xe_pcode.h.

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h    |  6 ------
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hwmon.c           | 25 +++++++++++++------------
 3 files changed, 34 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_pcode_regs.h

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
diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
new file mode 100644
index 000000000000..3dae858508c8
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_PCODE_REGS_H_
+#define _XE_PCODE_REGS_H_
+
+#include "regs/xe_reg_defs.h"
+
+/*
+ * This file contains addresses of PCODE registers visible through GT MMIO space.
+ */
+
+#define PVC_GT0_PACKAGE_ENERGY_STATUS           XE_REG(0x281004)
+#define PVC_GT0_PACKAGE_RAPL_LIMIT              XE_REG(0x281008)
+#define PVC_GT0_PACKAGE_POWER_SKU_UNIT          XE_REG(0x281068)
+#define PVC_GT0_PLATFORM_ENERGY_STATUS          XE_REG(0x28106c)
+#define PVC_GT0_PACKAGE_POWER_SKU               XE_REG(0x281080)
+
+#endif /* _XE_PCODE_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 89c6f7f84b5a..f0194d5121a5 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -10,6 +10,7 @@
 #include <drm/drm_managed.h>
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_mchbar_regs.h"
+#include "regs/xe_pcode_regs.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_hwmon.h"
@@ -77,32 +78,32 @@ static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg)
 
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

