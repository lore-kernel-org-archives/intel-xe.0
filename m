Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C69C25B7C
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 05:06:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7EF8112F2E;
	Wed, 29 May 2024 05:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TZGZZEfS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19850112F2E
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 05:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716959207; x=1748495207;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uO6t/KAFtj7t4TYz2dTkCU0FwJRqYfi3VPq4KoCiNPQ=;
 b=TZGZZEfS0MwVg06dEKF1KtdxP5BZlyNH8xuSw1LOpktWd3p+ad7XtrKn
 vt7Bxhi18lpv4BfzL5c8PUJOtL+h2asmVcERpVkOjowf6LXkY0jMJOp8d
 YvpjWDfD+H+wpRAffJ2ILjSMAvn05BocPhoe99DAGizDOO2t7uosKc0wm
 6ih3UzZooGs4oYLexVhd0jrsfBKhxdbhMDLd6qnJAvZSYxA8rbilpAwQ0
 zgqP3S2+Aj4uuTlLUmF9WH2VydgGyXG0JGyW6UHzgNpxylpD84xU/loeX
 UV4XRs9nsqFOYh3UK+L3oFgq4PijCVs9F3EGl9bwOjDVpirCBTzTw4PsO Q==;
X-CSE-ConnectionGUID: bpNaxHdfS9SJij/PDrUUgg==
X-CSE-MsgGUID: 278q8s7tSYiYGabjXbDL+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13216930"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="13216930"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 22:06:47 -0700
X-CSE-ConnectionGUID: tozU7jBuRdq5KMwyhOXuIA==
X-CSE-MsgGUID: W5EPE2ZKSa+9T3JCuVmh1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="58484667"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 22:06:45 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Karthik Poosa <karthik.poosa@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2 2/2] drm/xe/hwmon: Expose card power and energy attributes
 of BMG
Date: Wed, 29 May 2024 10:37:58 +0530
Message-Id: <20240529050758.442056-3-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240529050758.442056-1-balasubramani.vivekanandan@intel.com>
References: <20240529050758.442056-1-balasubramani.vivekanandan@intel.com>
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
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Link: https://lore.kernel.org/r/20240523144351.4040131-3-balasubramani.vivekanandan@intel.com
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h |  2 ++
 drivers/gpu/drm/xe/xe_hwmon.c           | 24 ++++++++++++++++--------
 2 files changed, 18 insertions(+), 8 deletions(-)

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
index 8daa070d7b1a..222c651ee1f8 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -86,12 +86,16 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 
 	switch (hwmon_reg) {
 	case REG_PKG_RAPL_LIMIT:
-		if (xe->info.platform == XE_BATTLEMAGE && channel == CHANNEL_PKG)
-			return BMG_PACKAGE_RAPL_LIMIT;
-		else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
+		if (xe->info.platform == XE_BATTLEMAGE) {
+			if (channel == CHANNEL_PKG)
+				return BMG_PACKAGE_RAPL_LIMIT;
+			else
+				return BMG_PLATFORM_POWER_LIMIT;
+		} else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG) {
 			return PVC_GT0_PACKAGE_RAPL_LIMIT;
-		else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG))
+		} else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG)) {
 			return PCU_CR_PACKAGE_RAPL_LIMIT;
+		}
 		break;
 	case REG_PKG_POWER_SKU:
 		if (xe->info.platform == XE_BATTLEMAGE)
@@ -114,12 +118,16 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 			return GT_PERF_STATUS;
 		break;
 	case REG_PKG_ENERGY_STATUS:
-		if (xe->info.platform == XE_BATTLEMAGE && channel == CHANNEL_PKG)
-			return BMG_PACKAGE_ENERGY_STATUS;
-		else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG)
+		if (xe->info.platform == XE_BATTLEMAGE) {
+			if (channel == CHANNEL_PKG)
+				return BMG_PACKAGE_ENERGY_STATUS;
+			else
+				return BMG_PLATFORM_ENERGY_STATUS;
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

