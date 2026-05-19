Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF07CD4851
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 09:11:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE2410EB94;
	Tue, 19 May 2026 09:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tph1B2fM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0F310EB94
 for <intel-xe@lists.freedesktop.org>; Tue, 19 May 2026 09:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779181877; x=1810717877;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tUi6uVGcCwZxVrWB+INhHAvLtva4lkhs8E1yJQSBDyY=;
 b=Tph1B2fMawb11sAH59UbBUP73dyWNlN+T+3bzWOMjkFaMh2Lwy2YutWT
 Do9TwiY8h2tjncwQOyHovM/7vU3tohey2m9jCZJRqRAMJgsRfo47CLB6i
 rZ7P6H6mcqajcv20C1cxY+k+LaIFqBrkyxBm+ua8UU23px4s7zZghS+H3
 EoIvKw+aY/KXJEY8nL2DQB2KJJ5sh+7KRdULiH4NG4WJ3rgExT6pwuZp3
 dVRYtrSludahF+Mh0YsaivPbCKNzjiuX+8WtTa6Z9meHmiGcVT0to56y9
 lebMwzDNHTGqqkyNxDXXWGjYx6G7WVV6GLMw/W1dLV9vC/n1cltkpO0Dn Q==;
X-CSE-ConnectionGUID: OQmdKocpQVSTMed8K1vRNQ==
X-CSE-MsgGUID: Dvzs80pxSayTD2C3DkxNPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="91519751"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="91519751"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 02:11:17 -0700
X-CSE-ConnectionGUID: +IGJGX4AQkGjv6J1/uuPBA==
X-CSE-MsgGUID: +d1zhROTS5e+OPFIHosplw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="239953533"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa007.jf.intel.com with ESMTP; 19 May 2026 02:11:16 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH] [CI] drm/i915/dmc: Test Xe3LPD_3002 DMC v2.30
Date: Tue, 19 May 2026 14:41:12 +0530
Message-ID: <20260519091112.1345388-1-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
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
index 481fb65b7..04e5bd75e 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -128,7 +128,7 @@ static bool dmc_firmware_param_disabled(struct intel_display *display)
 #define XE3P_LPD_DMC_PATH		DMC_PATH(xe3p_lpd)
 MODULE_FIRMWARE(XE3P_LPD_DMC_PATH);
 
-#define XE3LPD_3002_DMC_PATH		DMC_PATH(xe3lpd_3002)
+#define XE3LPD_3002_DMC_PATH		"i915/xe3lpd_3002_dmc_ver2_30.bin"
 MODULE_FIRMWARE(XE3LPD_3002_DMC_PATH);
 
 #define XE3LPD_DMC_PATH			DMC_PATH(xe3lpd)
-- 
2.54.0

