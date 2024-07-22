Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D17C3DA5D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 20:56:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18ABC10E138;
	Mon, 22 Jul 2024 20:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LmVXXs+N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8A910E138
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 20:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721681786; x=1753217786;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7otyGv74bus6iPDOcQLdw50GjYwR7MeIzDWzq2i7S5c=;
 b=LmVXXs+N6ttBuOcNOopUDXzExoGeQbrhlpE5+DEzkQGzgtvrGgDEdhGq
 W5rVZaSb47a4ucGo/Sx8+81Shc8mtiHI78/9rBpnbmeTkkniam8njbc0+
 BWRkHp0ey7GWK40qiwou1+YMMWwL6z0qQg/0+46RHSOtrlwNtcUL5ZcwA
 8e5aD6ONergZ6dux6xq0OZq78ugA1iNtFoYD2kw2Axbj4wbgzOtXFKCH/
 D8QjVnN4YvzLbFgPrxrYjHt3+dv2RaBvAK2qXeD5aZ8iW6Hy8Nl0yGfF5
 kt2GlA63NSrjeMqis/RGmVRio6dnxMrJaLLNp7LK+TCuC1q3SLRc4mfQp g==;
X-CSE-ConnectionGUID: vM0FtkE6TeanN5bfY0+Jkg==
X-CSE-MsgGUID: 6uPlkNa5TZCHMuDZjdie5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="23078100"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="23078100"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 13:56:25 -0700
X-CSE-ConnectionGUID: VLogMJotT0GQNiZAGqG4ig==
X-CSE-MsgGUID: zuHgAE0DTeKAEoi+JGtMKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="51714944"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 13:56:25 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [CI v2] drm/xe/guc: Enable w/a 14022293748 and 22019794406
Date: Mon, 22 Jul 2024 13:56:08 -0700
Message-ID: <20240722205608.2539635-1-julia.filipchuk@intel.com>
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

