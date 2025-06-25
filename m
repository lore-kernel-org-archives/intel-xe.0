Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7DFC77B7F
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 00:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A4B10E1B2;
	Wed, 25 Jun 2025 00:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YfpciR6+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40DC10E1B2
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 00:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750810334; x=1782346334;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Hn8gwYPndKBCxlpCjYFv3eMX1A5KlQAN9rSCQlahU0I=;
 b=YfpciR6+cqO/LugAi8p/CdXKI53bKGJFgQhMWdhiaR2toLGRHfwXHL12
 SPSNmJNRxCy6ynXiaIf93lYSosbNiR1XODp+I1nZtIFIs0Xt67yhG0DP3
 5M5arjY4u+10NawHbUzqUPf4X/FNwuyJJyKL3V0hVP/tk0xYS72zmPcFH
 PWM6lTPG5Vf3U3SM72iGg1hifV2Wbiypzd8phGHgCsVT8daTj4/Jm3bep
 TUxaCdFfVfxkDdKQI04YR2kkmkf5M0vBrCKP+aXNq6WPAmVB7OfAOBXbv
 g+0g9GlgZg57wIGPv3P+nL5xRY60ldz1/TniQYO2sWxPFCkVw12d9ZA3r g==;
X-CSE-ConnectionGUID: Bo8GoTJYRqOL6jQTDwr8Ow==
X-CSE-MsgGUID: ZdBxVDbSTkCVWk30h147zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="55695376"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="55695376"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 17:12:13 -0700
X-CSE-ConnectionGUID: 86FWhLFFQ22t9kNISvsSOA==
X-CSE-MsgGUID: 0frazFxuTDuoGDsehpISyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="152581363"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 17:12:13 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 sanirban <sk.anirban@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] Revert "drm/xe/ptl: Apply Wa_16026007364"
Date: Tue, 24 Jun 2025 17:12:03 -0700
Message-ID: <20250625001202.1616606-2-daniele.ceraolospurio@intel.com>
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

This reverts commit 3972872e459d812ab5e481a231a6066cf4f4d0f4.

There are several things wrong with the way this WA was implemented:

- The KLV is only supported on GuC 70.47.0 or newer, so we shouldn't
  apply it unconditionally.

- The KLV requires 2 DWs of data, which are not currently provided.

The GuC currently ignores any unknown KLVs, so on versions older that
70.47.0 nothing happens. However, starting on 70.47.0 the GuC attempts
to parse the KLV and fails due to the missing data, causing a GuC load
abort.

Given that 70.47.0 is the first GuC version approved for public release
for PTL, let's revert this patch so it doesn't cause the GuC load to
fail with that blob. We can then re-apply it properly fixed after the
GuC definition is merged, which will also have the added benefit of
running the KLV addition through CI with the right GuC version.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: sanirban <sk.anirban@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 -
 drivers/gpu/drm/xe/xe_guc_ads.c       | 5 -----
 drivers/gpu/drm/xe/xe_wa_oob.rules    | 1 -
 3 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index e2583761a70d..7de8f827281f 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -368,7 +368,6 @@ enum xe_guc_klv_ids {
 	GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET				= 0x9009,
 	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
 	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
-	GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG					= 0x900c,
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index f3c74f9a40c6..07a027755627 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -382,11 +382,6 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 					GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH,
 					&offset, &remain);
 
-	if (XE_WA(gt, 16026007364))
-		guc_waklv_enable_simple(ads,
-					GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG,
-					&offset, &remain);
-
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 8c2aa48cb33a..96cc33da0fb5 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -70,4 +70,3 @@ no_media_l3	MEDIA_VERSION(3000)
 # SoC workaround - currently applies to all platforms with the following
 # primary GT GMDID
 14022085890	GRAPHICS_VERSION(2001)
-16026007364 	MEDIA_VERSION(3000)
-- 
2.43.0

