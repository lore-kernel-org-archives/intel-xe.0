Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BEDC5AD5A
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDFC10E836;
	Fri, 20 Feb 2026 17:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FGojMdm8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBED410E82C
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608498; x=1803144498;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=oGwWs56G6OxWD2I4BSCeQmC78bMNgBJ5b2QZQQ8R1so=;
 b=FGojMdm8B3pJiUE2nIk3jw3WrA2wO+R8J+9c88hf2E6Qc2DPopjvNsJu
 PZRQD8jlcyKrFMWwoAy6cQO5QfDt7UH87yFaBGmO4SHmpUiXOVH0u5BDc
 rVTuT+JMBrYQhHIb4IAHUX2xc7Bpmqf10QNj7Q2ddSnA6NOE0jR8UxPuq
 wfzJVwxCcqEM/LhSJ7ZYXqIL/dWMeHzrHV8fkDYvuEL+svOhhl5DI0VDw
 cPs7dzkGO4NIps3vSOmRkRirUML/TrYmNs5AKe2jGVJSq1AnxVyctbjRr
 N/y1IIhrCyzlRdzkXRVnOrEfyifO4TS461qVbh8xmaIWeR7daPE1t6m57 w==;
X-CSE-ConnectionGUID: HzhOAt3HSiajnycvG9PFRg==
X-CSE-MsgGUID: NFyAHP7TQ1W0ygWTxMERXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606742"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72606742"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:17 -0800
X-CSE-ConnectionGUID: NqCZnoKqRvytfHc3W+Cv6g==
X-CSE-MsgGUID: IxIrlKbsT0qJQIrJT0x19w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214138708"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 20 Feb 2026 09:27:35 -0800
Subject: [PATCH v2 13/23] drm/xe: Consolidate workaround entries for
 Wa_14021402888
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-forupstream-wa_cleanup-v2-13-b12005a05af6@intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3048;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=oGwWs56G6OxWD2I4BSCeQmC78bMNgBJ5b2QZQQ8R1so=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpmJmuhnx5jv+Uubj15pgWUPeDjJUkbFR9OJUJc
 C5Ds3D4ff+JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZiZrgAKCRBNeSQFyHKQ
 BC4GEACGvSMz24xylijbhP/coaIp9/xCSF4yXdgoE1nmkr08IM+6BQHN9sVcuSWPeel021/Nz32
 ac2PCNxZVQpMnE1wt4sZB2hleGX7BVJTT9Z6z8Ut/JlY1JWEk5YEWdYUQT3d25oe0E67rQjdyIU
 edDR2IZhdFIfp+nTllHqvLCFl8xK0M49mgM/mqskMkku/TKV5fk4Iav/RgiosAMXJ5H/peTm6hr
 fnzvdYn++O73zt9gjdE2zjGrGhSOFhSp8qGRE9F+fCiPCB2LBOHXxu+OsfVhMMgwboWAdrnYshs
 WybY/EqLCXURttD7xSr4em9hVRwe5Am6d4f/JFKFr86/3nJFt5joRMCNCttPvD7zCsbFgbjULSK
 IYlmcCNdz/AfxuMzqVH+eDofPojm16CnHwCiku2IYMgbgq7Zm19VGUC7iIM3hVSrYOrNQiLS8eV
 5Mg+S67NTeSOwscbpbRCFto54YRBT30oG8802eHUd0AxN91eKxDWwyJBpN3DQVV64dQRt0QxYxd
 +i83Mwr88ebUqejS+X4hCQfKOMTBTvUGibj9ZeNrws9LGbdu/pBEAjnh4bOL2/s3nOOcY2/WnFp
 Iq+pfdl0THBEitLqdTjLVxT1C/is5vSEc7Cp37TXUqWxphxv0Trr6XcgjbkjT5fQHTBfWVTiCSw
 yyk38UspvcaGrgw==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

Wa_14021402888 applies to all graphics versions from 20.01 through 30.05
(inclusive).  Consolidate the RTP entries into a single range-based
entry.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index f0c42be062146837e6ba40621af54fcafa34f8e8..5d71cb9dca513803274ec1d5b766c2cbb0c31987 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -376,6 +376,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
 			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 	},
+	{ XE_RTP_NAME("14021402888"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 3005), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
+	},
 
 	/* TGL */
 
@@ -522,10 +526,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, SLM_WMTP_RESTORE))
 	},
-	{ XE_RTP_NAME("14021402888"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
-	},
 	{ XE_RTP_NAME("13012615864"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
@@ -550,10 +550,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, WR_REQ_CHAINING_DIS))
 	},
-	{ XE_RTP_NAME("14021402888"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
-	},
 	{ XE_RTP_NAME("14021821874, 14022954250"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
@@ -573,11 +569,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 
 	/* Xe3_LPG */
 
-	{ XE_RTP_NAME("14021402888"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
-	},
 	{ XE_RTP_NAME("18034896535"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
@@ -608,10 +599,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(0), RC_SEMA_IDLE_MSG_DISABLE,
 			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 	},
-	{ XE_RTP_NAME("14021402888"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3003, 3005), FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
-	},
 	{ XE_RTP_NAME("18041344222"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(3000),
 		       FUNC(xe_rtp_match_first_render_or_compute),

-- 
2.53.0

