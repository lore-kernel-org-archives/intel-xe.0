Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28085C5AD49
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 02:07:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC17610E23E;
	Wed,  4 Jun 2025 02:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GAnAIaEP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3BC10E23E
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 02:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749002826; x=1780538826;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UU2BxP18bi3FUVkoEFOYzR5APxABKsi6mMW9rwnFNM0=;
 b=GAnAIaEPXR4EWldQpJg9ZngRGe224XCE68qM9PoNl8XiB10iiVKWdc3Y
 8837F0R3JAgK07JcMkelpjebNGf6+WpXd5Sse8PyRiYYbguzhl3lgsCft
 FudEZZl49v10EFaMsCdwZ6442ltRHBFZi8ixyaz+6xVS+0jqXP7WAMXM9
 9LkEK5aKE6cBUbBAx9NplhnvMN4LuRRVKMCPfK5d9jyYXt14+S6Wty11s
 8qWTi9h/mSx57bJiVz3EWViovjoWQHd94/jt2UIsvE+W0x7GoMCO95gUV
 QwRuRCltvmE3QDZyvm7JJsr4mBXyDRpVy/UBAgAHYXXeevODwv+QXMQtt w==;
X-CSE-ConnectionGUID: vUlwQUAQQb6FjNSAdmjOpw==
X-CSE-MsgGUID: skY3uXF+RjWpSPZdfeVd1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51205232"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="51205232"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 19:05:28 -0700
X-CSE-ConnectionGUID: tRdfRG0yTgy/68Yu3VVPpg==
X-CSE-MsgGUID: b8JvbpFxSNWopdVmHI4ooQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="145984518"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 19:05:26 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH] drm/xe/hwmon: Fix xe_hwmon_power_max_write
Date: Wed,  4 Jun 2025 07:35:20 +0530
Message-Id: <20250604020520.2627638-1-karthik.poosa@intel.com>
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

Avoid power limit time interval overwrite in xe_hwmon_power_max_write.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Fixes: 7596d839f6228 ("drm/xe/hwmon: Add support to manage power limits though mailbox")
---
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h | 1 +
 drivers/gpu/drm/xe/xe_hwmon.c            | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
index 5394a1373a6b..ef2bf984723f 100644
--- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
@@ -40,6 +40,7 @@
 #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
 #define   PWR_LIM_VAL				REG_GENMASK(14, 0)
 #define   PWR_LIM_EN				REG_BIT(15)
+#define   PWR_LIM				REG_GENMASK(15, 0)
 #define   PWR_LIM_TIME				REG_GENMASK(23, 17)
 #define   PWR_LIM_TIME_X			REG_GENMASK(23, 22)
 #define   PWR_LIM_TIME_Y			REG_GENMASK(21, 17)
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 0cf5107547d9..bcd5a32c9a37 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -379,11 +379,14 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
 
 	reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
 
-	if (hwmon->xe->info.has_mbx_power_limits)
+	if (hwmon->xe->info.has_mbx_power_limits) {
+		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &max);
+		reg_val = (max & ~PWR_LIM) | reg_val;
 		ret = xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, reg_val);
-	else
+	} else {
 		reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN | PWR_LIM_VAL,
 					reg_val);
+	}
 unlock:
 	mutex_unlock(&hwmon->hwmon_lock);
 	return ret;
-- 
2.25.1

