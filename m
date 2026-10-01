Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D7BCA5FD4
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 19:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A8710E48D;
	Thu,  1 Oct 2026 19:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihGCVdGi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318B210E025
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 19:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790884317; x=1822420317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NnJKlNn4sW4YERgwI7EUrfm/A2JvaEqHEHAE8WDizWQ=;
 b=ihGCVdGieTGmRmb1XhsGAcKj6dOms3W8mKnfNX5XDptGCuBUVfCYmJok
 Ju00wBxCcSqPoqNPpHL4omt/262oUJEWcbeI6bAPAxpmK4aV6S6/tiwLd
 pPVI7IfHA5726Im/CW+QzB/fvTW1m+aw5IZDgHEVKqZVGVt/E8rDhX0pb
 pFGETaUAnssLhsc6QXJ8d60jHU7BCG5JofPRnFGjMis0fsl1lw4la35Cy
 T673nLgr8TFbgqFGy2mK6Nsej5+8HP8EQ9CLTL0AolBMCXoWaQ2E1/KWD
 7vtnqsrkF5ZdRgAsaID1UXfTMLickXXe0X2dadgC7+dih3Hioj3F5dBwB w==;
X-CSE-ConnectionGUID: XF+KbVEnQ3KmbbIZudwe+g==
X-CSE-MsgGUID: 38KgqswjQhWRvLIjNowJaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102177926"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="102177926"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 12:51:46 -0700
X-CSE-ConnectionGUID: tZi+MKsBQEaBF6JsSmzM5w==
X-CSE-MsgGUID: rN6FxooxSpOnha70a1BkZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; d="scan'208";a="273893829"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 12:51:44 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v7 09/15] drm/xe/hwmon: use CRI-specific package and VRAM
 temperature registers
Date: Fri,  2 Oct 2026 01:20:27 +0530
Message-Id: <20261001195033.3466205-10-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261001195033.3466205-1-karthik.poosa@intel.com>
References: <20261001195033.3466205-1-karthik.poosa@intel.com>
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

Crescent Island uses different MMIO offsets for package and VRAM
temperature than Battlemage. Add CRI-specific register definitions
and select them in xe_hwmon_get_reg() for REG_TEMP handling.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h | 3 +++
 drivers/gpu/drm/xe/xe_hwmon.c           | 9 ++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
index c63b409d7a82..a969661f0c95 100644
--- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
@@ -28,6 +28,9 @@
 #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
 
 #define CRI_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
+#define CRI_PACKAGE_TEMPERATURE			XE_REG(0x138344)
+#define CRI_VRAM_TEMPERATURE			XE_REG(0x138348)
 #define CRI_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
+#define CRI_VRAM_TEMPERATURE_N(n)		XE_REG(0x138a00 + ((n) * (sizeof(u32))))
 
 #endif /* _XE_PCODE_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 841868cb5e05..3b7a7b127fd6 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -276,7 +276,14 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 
 	switch (hwmon_reg) {
 	case REG_TEMP:
-		if (xe->info.platform == XE_BATTLEMAGE || xe->info.platform == XE_CRESCENTISLAND) {
+		if (xe->info.platform == XE_CRESCENTISLAND) {
+			if (channel == CHANNEL_PKG)
+				return CRI_PACKAGE_TEMPERATURE;
+			else if (channel == CHANNEL_VRAM)
+				return CRI_VRAM_TEMPERATURE;
+			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
+				return CRI_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
+		} else if (xe->info.platform == XE_BATTLEMAGE) {
 			if (channel == CHANNEL_PKG)
 				return BMG_PACKAGE_TEMPERATURE;
 			else if (channel == CHANNEL_VRAM)
-- 
2.25.1

