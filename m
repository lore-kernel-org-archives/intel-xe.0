Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831C7C021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 20:27:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EBF10E9E5;
	Wed, 26 Feb 2025 20:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ck0gm5Af";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800D510E9EA
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 20:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740601633; x=1772137633;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=txOUTMp5nTMYRbU22ZqwLv+84cjae7ioV7wxxWuvotU=;
 b=ck0gm5Af47kii1Ek0d6CrucVWX1WDoQmXE0fyZ8dY+y/SLAjNUe8T5r6
 AkvC3Jh3gew6MSgiSjebygxOk1YZhKIN3qsHfUAxdl6FcUzuggPenTX2+
 +sQTp1DXfEPOOOm64KgMKDXOFU6tZRr8W0FG6JRextwrvZ2oxmtjYOl2p
 QF7qGhz2UIA2mqZbwYnGNAClctzOBdAARnHHvD3Dx3fW0Q4FPnwye4J2F
 8+kTTGAxIZImSAGB03IKBI0feCOtsyuw7BLRBRlgQcGnkaCejGhTpVsoZ
 VLuM7blKisp3K4zIT6CrStI15azf6vbRLzn7yb47lPwvtqISZOOuJ+KNx g==;
X-CSE-ConnectionGUID: j4TE6bjcQ3SDgbCSvnAPqQ==
X-CSE-MsgGUID: YtmrsnfCSbySz3j+To8PZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="40710481"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="40710481"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 12:27:07 -0800
X-CSE-ConnectionGUID: A7Dq0lqeRS6pM1dIF7AecQ==
X-CSE-MsgGUID: ZNiSiaAFRhe3RdvWeuRQ6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="116593409"
Received: from puneetse-mobl.amr.corp.intel.com (HELO
 gjsousa-mobl2.corp.amr.intel.com) ([10.125.111.247])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 12:27:06 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe3LPD DMC v2.20
Date: Wed, 26 Feb 2025 17:26:43 -0300
Message-ID: <20250226202647.137052-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.48.1
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

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index fa6944e55d95..21974793cc92 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -113,7 +113,7 @@ static bool dmc_firmware_param_disabled(struct intel_display *display)
 #define DISPLAY_VER13_DMC_MAX_FW_SIZE	0x20000
 #define DISPLAY_VER12_DMC_MAX_FW_SIZE	ICL_DMC_MAX_FW_SIZE
 
-#define XE3LPD_DMC_PATH			DMC_PATH(xe3lpd)
+#define XE3LPD_DMC_PATH			"i915/xe3lpd_dmc_ver2_20.bin"
 MODULE_FIRMWARE(XE3LPD_DMC_PATH);
 
 #define XE2LPD_DMC_PATH			DMC_PATH(xe2lpd)
-- 
2.48.1

