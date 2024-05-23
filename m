Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B9EC25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 14:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AF610E318;
	Thu, 23 May 2024 14:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X+6u5Jov";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4088D10E3D5
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 14:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716475370; x=1748011370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v14MyiT4LGqpPZTRI0KQh/t02MwqB9r/BtCU0EkYiyU=;
 b=X+6u5JovHukyADnE8YrEgwEiTFOSigUMYbZQ0M0rIVrFc1UypDjS4PO6
 Az52PQH/kDi+KKUor+RndT8SufsPL9xNqlfOmk45YiR9HdCLUsUqfHnYj
 rAFtRMncRXhU8yAfxL1V5f5XWFpraAus6we4feI2xI/JdlA4tzTebK8XK
 qM1p4M+tn24cC2GER6qfT/51X1+cj22L6L9NsQ9Ud8k6Z7PWW6ziuSIy7
 l+aFQ39lSGGc8c60P9tykOAUdO4uyL4Vi0ugDD0MGrg772ot5fbRdLXMM
 SzaXWOnx/vrJ0Ef8uocxgtm1TYm5znBVjliCmT1yPdSVE0GNUcWLbY1Yx A==;
X-CSE-ConnectionGUID: b/hj6NuQSGiIxZ1n9lXQeQ==
X-CSE-MsgGUID: OZEmVYzhRwuaMeIvEMAQlQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="16585093"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="16585093"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 07:42:49 -0700
X-CSE-ConnectionGUID: eI6ruifXQm+/ck4LZLBunQ==
X-CSE-MsgGUID: M4JVlTPjQVOdg7HP4qW7Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="34155706"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 07:42:47 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH 2/2] drm/xe/hwmon: Expose card power and energy attributes of
 BMG
Date: Thu, 23 May 2024 20:13:51 +0530
Message-Id: <20240523144351.4040131-3-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240523144351.4040131-1-balasubramani.vivekanandan@intel.com>
References: <20240523144351.4040131-1-balasubramani.vivekanandan@intel.com>
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

From: Karthik Poosa <karthik.poosa@intel.com>

In BMG there are separate registers for card/platform power and
energy.
These are exposed through channel 0 i.e power_1/energy1_xxx.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h |  2 ++
 drivers/gpu/drm/xe/xe_hwmon.c           | 26 +++++++++++++++++--------
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
index beba16d592fc..0b0b49d850ae 100644
--- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
@@ -22,5 +22,7 @@
 #define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
 #define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
 #define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
+#define BMG_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
+#define BMG_PLATFORM_POWER_LIMIT		XE_REG(0x138460)
 
 #endif /* _XE_PCODE_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 8daa070d7b1a..aae9670428a3 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -86,12 +86,17 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 
 	switch (hwmon_reg) {
 	case REG_PKG_RAPL_LIMIT:
-		if (xe->info.platform == XE_BATTLEMAGE && channel == CHANNEL_PKG)
-			return BMG_PACKAGE_RAPL_LIMIT;
-		else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
+		if (xe->info.platform == XE_BATTLEMAGE) {
+			if (channel == CHANNEL_PKG) {
+				return BMG_PACKAGE_RAPL_LIMIT;
+			} else {
+				return BMG_PLATFORM_POWER_LIMIT;
+			}
+		} else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG) {
 			return PVC_GT0_PACKAGE_RAPL_LIMIT;
-		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
+		} else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG)) {
 			return PCU_CR_PACKAGE_RAPL_LIMIT;
+		}
 		break;
 	case REG_PKG_POWER_SKU:
 		if (xe->info.platform == XE_BATTLEMAGE)
@@ -114,12 +119,17 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 			return GT_PERF_STATUS;
 		break;
 	case REG_PKG_ENERGY_STATUS:
-		if (xe->info.platform == XE_BATTLEMAGE && channel == CHANNEL_PKG)
-			return BMG_PACKAGE_ENERGY_STATUS;
-		else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
+		if (xe->info.platform == XE_BATTLEMAGE) {
+			if (channel == CHANNEL_PKG) {
+				return BMG_PACKAGE_ENERGY_STATUS;
+			} else {
+				return BMG_PLATFORM_ENERGY_STATUS;
+			}
+		} else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG) {
 			return PVC_GT0_PLATFORM_ENERGY_STATUS;
-		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
+		} else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG)) {
 			return PCU_CR_PACKAGE_ENERGY_STATUS;
+		}
 		break;
 	default:
 		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);
-- 
2.25.1

