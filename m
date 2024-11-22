Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AAAE69184
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 16:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6681F10EBFE;
	Fri, 22 Nov 2024 16:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nXPbKCRf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0CC10EBFE
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Nov 2024 16:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732294364; x=1763830364;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C9O2igvR4cZ4VQogBgg8+HVE0/zO9qb60MBZxay3iUM=;
 b=nXPbKCRfPe9DXzsbVsloGM/Kkn5tKGo2z/F/56qI6Zqc2IyQgeGIyJZq
 y0t1Dr+2XvUb/Z9vI/i8L1siu6VLNNT9qOGe0Vy/BZ7e3O9SnByJQ3K73
 NL908JMdG0oqV5F89Z9G00DJ7hH07YcaxMCH4dupvprPiqmmw//prg7dR
 bDlqiN+gg92+mAygz7XKiDWBOdQpeeSOiWkdXfa/AXg5nGkGWhb+nUv5U
 bAtvSUAOaaPN5BLPbpwmv1O8xjBbNacdDXSurQyzK1sdxxIWIvQszZnAF
 B+/4kAWpwR54EjPltVys5gb3CiqDPB86LS9QV3N13+HeMzEKJaikNXyYd Q==;
X-CSE-ConnectionGUID: nZob2BktTeav4B4q+N6Ddw==
X-CSE-MsgGUID: Mxnkd8DWT42U5lqXbqImAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32701016"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="32701016"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 08:52:28 -0800
X-CSE-ConnectionGUID: fmefyqbDQ2iaA+L6mAl4Sw==
X-CSE-MsgGUID: k03+bxhZSwi8wVeYuDfcbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="90548357"
Received: from pltuser2-ms-7d25.iind.intel.com ([10.190.239.58])
 by orviesa010.jf.intel.com with ESMTP; 22 Nov 2024 08:52:27 -0800
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe2LPD DMC v2.24
Date: Fri, 22 Nov 2024 22:21:40 +0530
Message-Id: <20241122165140.2527130-1-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
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

NOT TO BE REVIEWED/MERGED
Hardcode path to DMC firmware for CI purposes only.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 48bbbf8f312c9..2d617d45c9b3c 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -113,7 +113,7 @@ static bool dmc_firmware_param_disabled(struct intel_display *display)
 #define DISPLAY_VER13_DMC_MAX_FW_SIZE	0x20000
 #define DISPLAY_VER12_DMC_MAX_FW_SIZE	ICL_DMC_MAX_FW_SIZE
 
-#define XE2LPD_DMC_PATH			DMC_PATH(xe2lpd)
+#define XE2LPD_DMC_PATH			DMC_LEGACY_PATH(xe2lpd, 2, 24)
 MODULE_FIRMWARE(XE2LPD_DMC_PATH);
 
 #define BMG_DMC_PATH			DMC_PATH(bmg)
-- 
2.34.1

