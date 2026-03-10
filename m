Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD3CFD2D62
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 12:14:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA1010E27B;
	Tue, 10 Mar 2026 12:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WnfQCzth";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72EA10E703
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 12:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773144857; x=1804680857;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KF10Fn/G46Fn7EHGYuZKONxn0DnGOTITzzc3FZHF+5Y=;
 b=WnfQCzthBHGjSIkHNvXsLJeZ6irT1DAGYL9iDbNI2JDL84nhy0zQqk8P
 3wkSQNUXBbWYsVcgKSdFDRIx2pmz68Cxa+BLStM80cP5PT6hyqv8c0jqB
 B4LLRdjOKJoBpvjcUNnlt12tFYr9nHf1Vzhy9aWBOrPsXoS9kLC36iiJG
 W59FeaCsaN33XTI9py9AHWrcIeI0XpXb70pzMfoRTAXSWAezmXl3XR2fN
 NcQu395w7cpGGR0N7ZeMmoJk43mT6oY5ObVr37EtiEFoo9PxyS1gz0iRg
 my+6MgdA+ADLC3Y1/HfpnolZq1UnBuTgCn2UxYIc+wPKMH6g8wrwuyUOc w==;
X-CSE-ConnectionGUID: vM+joEoiTM+nrrlqOcRXEg==
X-CSE-MsgGUID: WPXq0bC5TzeDG5rMTJS1Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85276180"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="85276180"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 05:14:12 -0700
X-CSE-ConnectionGUID: CCl0cdgYS4+FXC7bnFI8Vg==
X-CSE-MsgGUID: KX9UXtA6RvmYwbkhqlmgAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="219333813"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 05:14:10 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH] drm/xe/hwmon: Enable energy attributes for CRI
Date: Tue, 10 Mar 2026 17:50:18 +0530
Message-Id: <20260310122018.2734260-1-karthik.poosa@intel.com>
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

Enable HWMON energy attributes for CRI which is available through
MMIO registers.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_hwmon.c           | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
index 4b3c46eb858f..c63b409d7a82 100644
--- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
@@ -27,4 +27,7 @@
 #define   TEMP_SIGN_MASK			REG_BIT(31)
 #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
 
+#define CRI_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
+#define CRI_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
+
 #endif /* _XE_PCODE_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 0fd4d4f1014a..852681bdb84c 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -296,7 +296,12 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 			return GT_PERF_STATUS;
 		break;
 	case REG_PKG_ENERGY_STATUS:
-		if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG) {
+		if (xe->info.platform == XE_CRESCENTISLAND) {
+			if (channel == CHANNEL_CARD)
+				return CRI_PLATFORM_ENERGY_STATUS;
+			else if (channel == CHANNEL_PKG)
+				return CRI_PACKAGE_ENERGY_STATUS;
+		} else if (xe->info.platform == XE_PVC && channel == CHANNEL_PKG) {
 			return PVC_GT0_PLATFORM_ENERGY_STATUS;
 		} else if ((xe->info.platform == XE_DG2) && (channel == CHANNEL_PKG)) {
 			return PCU_CR_PACKAGE_ENERGY_STATUS;
-- 
2.25.1

