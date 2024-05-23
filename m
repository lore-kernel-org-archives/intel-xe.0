Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2412DC25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 14:42:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5520910E610;
	Thu, 23 May 2024 14:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRocTNUk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFFA10E5B2
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 14:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716475367; x=1748011367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RlCYTAu2eW7OSllADOs9EkyhtTaTuqxcITEQj+HGw40=;
 b=LRocTNUkMpPmH8rYEuHESZCgvTHxrqkCItJ9fLwvl20njPbFAok9+N7w
 xYHcZvhc6UAuW8QErrLva1GozLB6BMFGcPkCAkhO3d7O+7yWZGucSkzWM
 tAe7u1/PxgYGnzmVnUPRGCr3Jvi6f3S3xPxR7qXyx4L6MqiOsap1OzsDs
 gzKnBCdYtl6S7SIZ5CUPXI8T7+g003D0tYx7nzJ3UsY/yKrzuVtlsZLMi
 N1qhxV4PSPS6XWSwu9mJmQsuxRoKlG+beuy3IWBhW/jsRXzagobKhiY8L
 BptsXz6pghuBCY7KPIqSHomBnUIgXmNeyQfFeFwT+nPi6KceUZ9lXEHXj A==;
X-CSE-ConnectionGUID: dp6dgLbzSkGBw4M8N7kREQ==
X-CSE-MsgGUID: UWUCq8b2TjubmgkS/zHarQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="16585089"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="16585089"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 07:42:47 -0700
X-CSE-ConnectionGUID: VLg0w68xRimMebtWqo+NZQ==
X-CSE-MsgGUID: Ofpbz30pSsS8THXAa7YQjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="34155702"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 07:42:45 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH 1/2] drm/xe/hwmon: Add HWMON support for BMG
Date: Thu, 23 May 2024 20:13:50 +0530
Message-Id: <20240523144351.4040131-2-balasubramani.vivekanandan@intel.com>
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

Add HWMON support for BMG. Exposing the pkg power, current,
energy info.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h |  5 +++++
 drivers/gpu/drm/xe/xe_hwmon.c           | 16 ++++++++++++----
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
index 3dae858508c8..beba16d592fc 100644
--- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
@@ -18,4 +18,9 @@
 #define PVC_GT0_PLATFORM_ENERGY_STATUS          XE_REG(0x28106c)
 #define PVC_GT0_PACKAGE_POWER_SKU               XE_REG(0x281080)
 
+#define BMG_PACKAGE_POWER_SKU			XE_REG(0x138098)
+#define BMG_PACKAGE_POWER_SKU_UNIT		XE_REG(0x1380dc)
+#define BMG_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
+#define BMG_PACKAGE_RAPL_LIMIT			XE_REG(0x138440)
+
 #endif /* _XE_PCODE_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index dca275117232..8daa070d7b1a 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -86,19 +86,25 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 
 	switch (hwmon_reg) {
 	case REG_PKG_RAPL_LIMIT:
-		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
+		if (xe->info.platform == XE_BATTLEMAGE && channel == CHANNEL_PKG)
+			return BMG_PACKAGE_RAPL_LIMIT;
+		else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
 			return PVC_GT0_PACKAGE_RAPL_LIMIT;
 		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
 			return PCU_CR_PACKAGE_RAPL_LIMIT;
 		break;
 	case REG_PKG_POWER_SKU:
-		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
+		if (xe->info.platform == XE_BATTLEMAGE)
+			return BMG_PACKAGE_POWER_SKU;
+		else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
 			return PVC_GT0_PACKAGE_POWER_SKU;
 		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
 			return PCU_CR_PACKAGE_POWER_SKU;
 		break;
 	case REG_PKG_POWER_SKU_UNIT:
-		if (xe->info.platform == XE_PVC)
+		if (xe->info.platform == XE_BATTLEMAGE)
+			return BMG_PACKAGE_POWER_SKU_UNIT;
+		else if (xe->info.platform == XE_PVC)
 			return PVC_GT0_PACKAGE_POWER_SKU_UNIT;
 		else if (xe->info.platform == XE_DG2)
 			return PCU_CR_PACKAGE_POWER_SKU_UNIT;
@@ -108,7 +114,9 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 			return GT_PERF_STATUS;
 		break;
 	case REG_PKG_ENERGY_STATUS:
-		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
+		if (xe->info.platform == XE_BATTLEMAGE && channel == CHANNEL_PKG)
+			return BMG_PACKAGE_ENERGY_STATUS;
+		else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
 			return PVC_GT0_PLATFORM_ENERGY_STATUS;
 		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
 			return PCU_CR_PACKAGE_ENERGY_STATUS;
-- 
2.25.1

