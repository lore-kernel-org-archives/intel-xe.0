Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33117C3DA63
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 15:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF74810E29C;
	Tue, 23 Jul 2024 15:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T9nUWYGG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B68410E013
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 15:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721749701; x=1753285701;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lS4tKpOCHrh5paT7C7Cj7v2GVKVwa3fvNhQNtJIOC/0=;
 b=T9nUWYGGnp9fXZiLvGmtIqgKH1x2XbP3GOXewLvQVdVI0X8ovLai4Tw8
 Egeo6EInVRALFab23emHEh+UDjsNwtaeT+d8XqlfEgeIgFWD3pypZk4iB
 o+d3YozkwMpVbZLSSuPfa0F1xEqrCiu6vsgJtFOdtsyAzvvZk0GV3JSqE
 /DUf292cp240VUMZivw2T3NjIq2b48bATAV3OF3i/hKKB3IzakNu1+j9a
 wVgo7wFg6jY9rmbEq8iBFuzVOpqMgRy0V6nH4/9jDkJADxO0ZZIfjwED5
 0BopMP35XrZAlX9HdCtVgNz8qaE69gqnP86FFUT84D9Ec0z1+7IWXOKh9 Q==;
X-CSE-ConnectionGUID: oV3ngY0ZTUC0YKg/VIppuw==
X-CSE-MsgGUID: WST2TM34Q6qw/kbnOhFtXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="30535512"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="30535512"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 08:48:21 -0700
X-CSE-ConnectionGUID: z3OYto1iSh6xWiwpwHnL5w==
X-CSE-MsgGUID: eVUT9VYaR4aZ4aVSllDFTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="57388312"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 08:48:20 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v3] drm/xe/guc: Enable w/a 14022293748 and 22019794406
Date: Tue, 23 Jul 2024 08:48:15 -0700
Message-ID: <20240723154815.2601622-1-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.45.2
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

Enable workarounds for HW bug where render engine reset fails.

v2: Enable KLV for either workarrounds (feedback from Lucas De Marchi)
v3: Resubmit for Kunit fails strange failure.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
This patch is for testing KLV workarrounds.

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       | 5 +++++
 drivers/gpu/drm/xe/xe_uc_fw.c         | 4 ++--
 drivers/gpu/drm/xe/xe_wa_oob.rules    | 2 ++
 4 files changed, 10 insertions(+), 2 deletions(-)

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
index 1c60b685dbc6..d27dd4f21eeb 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -367,6 +367,11 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
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
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index c902f4a10f44..d145ce77008e 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -105,8 +105,8 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
-	fw_def(BATTLEMAGE,	major_ver(intel-ci/xe,	guc,	bmg,	70, 24, 0))	\
-	fw_def(LUNARLAKE,	major_ver(intel-ci/xe,	guc,	lnl,	70, 24, 0))	\
+	fw_def(BATTLEMAGE,	major_ver(intel-ci/xe,	guc,	bmg,	70, 29, 0))	\
+	fw_def(LUNARLAKE,	major_ver(intel-ci/xe,	guc,	lnl,	70, 29, 0))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
 	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 540d38603f32..b0d7d4114967 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -27,6 +27,8 @@
 16022287689	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
 13011645652	GRAPHICS_VERSION(2004)
+14022293748	GRAPHICS_VERSION(2004)
+22019794406	GRAPHICS_VERSION(2004)
 22019338487	MEDIA_VERSION(2000)
 		GRAPHICS_VERSION(2001)
 22019338487_display	PLATFORM(LUNARLAKE)
-- 
2.45.2

