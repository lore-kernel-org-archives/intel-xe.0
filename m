Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FDED20686
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 23:47:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950E210E14B;
	Tue, 15 Oct 2024 23:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZnWC3SLq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAFD10E14B
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 23:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729036021; x=1760572021;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8E2dM83XBZ9QKzTRzQFx7GEaYUNM60KiAOH7QeysCIY=;
 b=ZnWC3SLqnVDQ7Lz0ta3Ox3tcJSAahlhWkAGGjWcnYKF65taCvHSWS7j8
 IOXrLzV2wkngfwOj0dpGvBP2vlUZHyYyBbjANQwSZWvcX0bYU/PrEd3GM
 XmzGZ1CuGBq1x2J2XpUAhpfCrZ/BCRAapaTKVihflIoKSbo6Pgb+t0oVY
 O88+dljlPJlimjCdUrQp6QeF1pkm02o8YaU8DpirK0IuAQWPuIWvB8YS5
 D3H/XAJDXM9DLjVgPvXzRLr8e1XLE0k3VXXS6X77p9Ti6qrWhJLB23Vje
 kIwk18XZF9zgBAJkUr4MhZ2hin0kfxbQHYN/CRd++dbOfObv9okyB1Um8 A==;
X-CSE-ConnectionGUID: FI03+YyvS2KC1DHoBzYRPg==
X-CSE-MsgGUID: lwT7PTRkT4OxgkuJpQH0zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="32264530"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="32264530"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 16:47:01 -0700
X-CSE-ConnectionGUID: xuPn7xsASkKMkV49Nl9zQg==
X-CSE-MsgGUID: JLV7rkXST6WqRpr6QA3UPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="78516472"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa007.jf.intel.com with ESMTP; 15 Oct 2024 16:47:00 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/ptl: Apply Wa_14022866841
Date: Tue, 15 Oct 2024 16:44:28 -0700
Message-Id: <20241015234428.2004825-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

As part of this WA, GuC will hold a forcewake for certain
MMIO accesses outside the GT/media domains.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       | 5 +++++
 drivers/gpu/drm/xe/xe_wa_oob.rules    | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 6b30743a2f6c..37606cf8cc5e 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -352,6 +352,7 @@ enum xe_guc_klv_ids {
 	GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE				= 0x9007,
 	GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE			= 0x9008,
 	GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET				= 0x9009,
+	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 25292997c7f3..4e746ae98888 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -359,6 +359,11 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 					GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
 					&offset, &remain);
 
+	if (XE_WA(gt, 14022866841))
+		guc_waklv_enable_simple(ads,
+					GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
+					&offset, &remain);
+
 	/*
 	 * On RC6 exit, GuC will write register 0xB04 with the default value provided. As of now,
 	 * the default value for this register is determined to be 0xC40. This could change in the
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 264d6e116499..bcd04464b85e 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -39,3 +39,5 @@
 14019789679	GRAPHICS_VERSION(1255)
 		GRAPHICS_VERSION_RANGE(1270, 2004)
 no_media_l3	MEDIA_VERSION(3000)
+14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
+		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
-- 
2.38.1

