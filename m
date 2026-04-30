Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA158CD13DE
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 16:15:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B07310F3C9;
	Thu, 30 Apr 2026 16:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D8APmBI1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2DC10F3BB
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 16:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777565704; x=1809101704;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=PPLMkRZv67ygFSh8iEmxirjPNiSdcLAGhNOVPHoPRWY=;
 b=D8APmBI1xbY4XkW6+uXlmBY2g6K/RFf9zfjd9ss64tG0itctqsroOxsg
 nKhpjFwhco+wELidaqCsHHAgF1vxGczXZuMbXouVRuGNmKrTu3WLqVTy6
 fMy03SwCyvCJjMVwCk36z/XsF5BtocASBmMRQz9zC00ewKV5MC31D/uoJ
 S80iPVAMSE130hIeoE8HqJFI/uPrY8nXT4CvoFRKPdPfNDh2/aNb/BwGG
 yytuZ5qFmnhAaRvjTASdO/mHfPG6UMOhMk7H+72LTp0hHLEV3OZVwSl64
 M1fzk00WEc/KjoI/qPJtalHxrN/vuQ0lEPzXBSll7E+Q+kTmID2wM2O2K A==;
X-CSE-ConnectionGUID: KNWBC5wdSYWTwyvh3brJGQ==
X-CSE-MsgGUID: kJLBlKDjRiSlmvsQ03faug==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="89620094"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="89620094"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 09:15:03 -0700
X-CSE-ConnectionGUID: ZJvMw8LqSG6/u4oAM95xug==
X-CSE-MsgGUID: 2eSFPUvIRuWHbP1P52TW2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="238609918"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 09:15:03 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/4] drm/xe/oa: MERTOA Wa_14026746987
Date: Thu, 30 Apr 2026 09:14:57 -0700
Message-ID: <20260430161459.2892545-3-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430161459.2892545-1-ashutosh.dixit@intel.com>
References: <20260430161459.2892545-1-ashutosh.dixit@intel.com>
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

Wa_14026746987 implies that only XE_OAM_FORMAT_MPEC8u32_B8_C8 and not
XE_OAM_FORMAT_MPEC8u64_B8_C8 can be supported for MERTOA unit.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_device_wa_oob.rules | 1 +
 drivers/gpu/drm/xe/xe_oa.c                | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index 92371c4905290..0793b9e635495 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -5,3 +5,4 @@
 14022085890	SUBPLATFORM(BATTLEMAGE, G21)
 14026539277	PLATFORM(NOVALAKE_P), PLATFORM_STEP(A0, B0)
 14026633728	PLATFORM(CRESCENTISLAND)
+14026746987	PLATFORM(CRESCENTISLAND)
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index b767dccfc4fc7..13458050907ad 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1942,9 +1942,12 @@ static bool oa_unit_supports_oa_format(struct xe_oa *oa, struct xe_oa_open_param
 	case DRM_XE_OA_UNIT_TYPE_OAG:
 		return f->type == DRM_XE_OA_FMT_TYPE_OAG || f->type == DRM_XE_OA_FMT_TYPE_OAR ||
 			f->type == DRM_XE_OA_FMT_TYPE_OAC || f->type == DRM_XE_OA_FMT_TYPE_PEC;
+	case DRM_XE_OA_UNIT_TYPE_MERT:
+		if (XE_DEVICE_WA(oa->xe, 14026746987))
+			return param->oa_format == XE_OAM_FORMAT_MPEC8u32_B8_C8;
+		fallthrough;
 	case DRM_XE_OA_UNIT_TYPE_OAM:
 	case DRM_XE_OA_UNIT_TYPE_OAM_SAG:
-	case DRM_XE_OA_UNIT_TYPE_MERT:
 		return f->type == DRM_XE_OA_FMT_TYPE_OAM || f->type == DRM_XE_OA_FMT_TYPE_OAM_MPEC;
 	default:
 		return false;
-- 
2.54.0

