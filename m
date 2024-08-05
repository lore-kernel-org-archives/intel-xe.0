Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6035CC3DA4A
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 20:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35D110E2B4;
	Mon,  5 Aug 2024 20:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HQMZgazo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB03210E2B4
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Aug 2024 20:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722891290; x=1754427290;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q6kGD2/3adM7V+vs+fV4hyKbRNX3t6P+NhHDrpQP2P0=;
 b=HQMZgazot4X63rrWLEIDL82y1p0kcJQnmrQSQr9EDGYEC92n61Bu9S/N
 2JwDzVMtMWkBpHaz5CHLHHrtZw7urjvDGQgjVwUVERJroRqhSvHGm8a5A
 EtKGKVcjnVuv63EACy0D0s0750HFU/nzxeKvrSmP7mbTPxZYwFpJcMFI0
 3hrPg1krNBm1VAk6/S0qWaZXSThR5f1ZWJJ0b7ue3Bu/F3psh7rqgubJT
 huVXiYFXjPKDMkHbuL0phPSKvjeS4EByK7vrtrnCi/dWsnFhulpzhj3SK
 0CcW+72no2U+bZz7hcdZlrf7kO7VaXzkqwVMR8VKQfUebxOvclD12+Ol/ Q==;
X-CSE-ConnectionGUID: gFAlI5PQTvejXKSzIYjHag==
X-CSE-MsgGUID: eJWejfjGTEGu9bWY4SgY9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="32034266"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="32034266"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 13:54:50 -0700
X-CSE-ConnectionGUID: Ou2TG1MWRFaLMiWJnfFEhw==
X-CSE-MsgGUID: p+euWUDbQJ6RznctxGFy+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="93817724"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 13:54:49 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v5] drm/xe/guc: Enable w/a 14022293748 and 22019794406
Date: Mon,  5 Aug 2024 13:54:35 -0700
Message-ID: <20240805205435.921921-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Julia Filipchuk <julia.filipchuk@intel.com>

Enable workarounds for HW bug where render engine reset fails. Given
that we're bumping the minimun required GuC version to 70.29, we're
guaranteed to always have support for this KLV in the GuC.

v2: Enable KLV correctly for either workaround (Lucas)
v4: Add check for minimum supported GuC firmware version. Enable w/a for
hw version 20.01 too. (Daniele)
v5 (Daniele): remove now unneeded fw type and version checks (JohnH)

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       | 6 ++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    | 4 ++++
 3 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 8f9f60b28306..6b30743a2f6c 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -351,6 +351,7 @@ enum xe_guc_klv_ids {
 	GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING				= 0x9005,
 	GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE				= 0x9007,
 	GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE			= 0x9008,
+	GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET				= 0x9009,
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 1c60b685dbc6..d1902a8581ca 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -24,6 +24,7 @@
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_platform_types.h"
+#include "xe_uc_fw.h"
 #include "xe_wa.h"
 
 /* Slack of a few additional entries per engine */
@@ -367,6 +368,11 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 					  0xC40,
 					  &offset, &remain);
 
+	if (XE_WA(gt, 14022293748) || XE_WA(gt, 22019794406))
+		guc_waklv_enable_simple(ads,
+					GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
+					&offset, &remain);
+
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 540d38603f32..5cf27ff27ce6 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -27,6 +27,10 @@
 16022287689	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
 13011645652	GRAPHICS_VERSION(2004)
+14022293748	GRAPHICS_VERSION(2001)
+		GRAPHICS_VERSION(2004)
+22019794406	GRAPHICS_VERSION(2001)
+		GRAPHICS_VERSION(2004)
 22019338487	MEDIA_VERSION(2000)
 		GRAPHICS_VERSION(2001)
 22019338487_display	PLATFORM(LUNARLAKE)
-- 
2.43.0

