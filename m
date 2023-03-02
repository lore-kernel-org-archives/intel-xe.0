Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A60C7EE3A
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 01:35:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453D710E376;
	Thu,  2 Mar 2023 01:35:02 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D08210E35A
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 01:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677720900; x=1709256900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EriPYxSUu1a0h8KL9gKtSecLNGnIFoaVST0Cn+WcIKA=;
 b=iFCgWIACqLuRh3Edh+qtE7ZAOP7yQHG/E+jUYaojwtBM+i8QI4FET6hL
 7WmmJyX5+46Zrq7EdjxZiBmRpQBMfhWI8Y9Pw8O0PX09/Ug3KqtBVaAvA
 /6ywTpPXKL/I/nNGwZAxtVpFco2Qrz9WV8mGzWxvQe8Wwol+szArMOyeK
 JNZ3lG3ICGYZEbh1YUqIadvkGs2AcHf48L5c4S2/optwNFvLFJ1CsTRWN
 8rbMlFad/B/8klg5mbCB7S0+4PLin85HjUf25C48KB8ZyORKF/0nuWjcF
 MXGouxtvRqZjyXfZIML66ja1aSZt+DnLOZYvFUlkiQBwppyTtmE1gBwXS Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="397148704"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; d="scan'208";a="397148704"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 17:34:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="798635062"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; d="scan'208";a="798635062"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 17:34:58 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  1 Mar 2023 17:34:10 -0800
Message-Id: <20230302013411.3262608-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230302013411.3262608-1-lucas.demarchi@intel.com>
References: <20230302013411.3262608-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/7] drm/xe/display: Rename GEN13_DISPLAY
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, maarten.lankhorst@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There is no such thing as GEN13 display. With the IP disaggregation the
"gen" stopped being used. The display IP used in DG2 should be using
XE_LPD as short name. For Meterlake, it's XE_LPDP, so go ahead and
define that macro for it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 76e4fb6bd67c..97c77d175539 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -430,7 +430,7 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 	.has_psr_hw_tracking = 1,					\
 	.color = { .degamma_lut_size = 33, .gamma_lut_size = 262145 }
 
-#define GEN13_DISPLAY							\
+#define XE_LPD								\
 	__DISPLAY_DEFAULTS,						\
 	.ver = 13,							\
 	.abox_mask = GENMASK(1, 0),					\
@@ -452,6 +452,13 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 	.has_ipc = 1,							\
 	.has_psr = 1
 
+#define XE_LPDP								\
+	XE_LPD,								\
+	.ver = 14,							\
+	.has_cdclk_crawl = 1,						\
+	.has_cdclk_squash = 1
+
+
 void xe_display_info_init(struct xe_device *xe)
 {
 	if (!xe->info.enable_display)
@@ -472,19 +479,14 @@ void xe_display_info_init(struct xe_device *xe)
 		break;
 	case XE_DG2:
 		xe->info.display = (struct xe_device_display_info) {
-			GEN13_DISPLAY,
+			XE_LPD,
 			.cpu_transcoder_mask =
 				BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
 				BIT(TRANSCODER_C) | BIT(TRANSCODER_D),
 		};
 		break;
 	case XE_METEORLAKE:
-		xe->info.display = (struct xe_device_display_info) {
-			GEN13_DISPLAY,
-			.ver = 14,
-			.has_cdclk_crawl = 1,
-			.has_cdclk_squash = 1,
-		};
+		xe->info.display = (struct xe_device_display_info) { XE_LPDP };
 		break;
 	default:
 		/*
-- 
2.39.0

