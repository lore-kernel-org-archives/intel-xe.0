Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577CCC5AD46
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35D910E82C;
	Fri, 20 Feb 2026 17:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xqae/lF2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2B110E81C
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608498; x=1803144498;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=XX8igp0yRG3tqNyIss+UI6OxSVZc89Pn5FkB7NZ4hA4=;
 b=Xqae/lF2WpQFRpeycRWBBoxDWeao5eUvFntdizvknEE1rmD9hFnU3OFp
 Buft4Dv7phdzJHMm0roFwz6HIPbkMmGCq0CRPZJQ20b17bSgMx9RNnY/v
 cL6M5Bxqb8Ob26fSlwcVxvTxRGgqgUOtBIE0+NbJ1BBibQdr4boBjorba
 izzbUgRmp7zUN87f1GrRBYjunRPQBFC1mWzI/QwJ+Wo8Yp29NdWBCpzrt
 Ma8I9O2DZfuH5BZbwJFuunGBdbroYilqE6LZxAU1NdaDzg91HbHatR3MV
 Y2WXjvDyOKRhMZ78ro4DlQ9xQB5xHeHGoTM69KYAzyJDbeh8bwK8D9Lpa w==;
X-CSE-ConnectionGUID: K8h/5bovQm2UcVVRLXiPAg==
X-CSE-MsgGUID: 5TWJlc5BRA+zSW8ohDTVNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606748"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72606748"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:17 -0800
X-CSE-ConnectionGUID: Sa60nVrwRVyBDqAiz8KVEQ==
X-CSE-MsgGUID: wGnddf1qReWrXgi5GUfRtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214138725"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:18 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 20 Feb 2026 09:27:40 -0800
Subject: [PATCH v2 18/23] drm/xe: Consolidate workaround entries for
 Wa_14019988906
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-forupstream-wa_cleanup-v2-18-b12005a05af6@intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1948;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=XX8igp0yRG3tqNyIss+UI6OxSVZc89Pn5FkB7NZ4hA4=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpmJmvzIDYHiMaWdNO0c3cFup1rwlUIxPTXJoX5
 AiomGwYx2OJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZiZrwAKCRBNeSQFyHKQ
 BG+JD/wKOGltAxIENe3PAQRSqzJ+iAgqD5S/tFAeB0ArKPcoTgOgkWfAKOQQO9HJnrbQQT4naYO
 3SOQVydkFqhcfSBOGwne0+1buuYBFUIsdOezCrWhTUhQIpuN/nfpN0UfF5yFA4SUOPm5rRZN3dv
 DxHQWjoe7NhnxFmgVlWB1UAG6660m6mRTjt+PK6uSaP9Baowi82mC4sUmaFy7U800a/JdRwPsEd
 3jykyJ4jXwmiJ2G1wNlpld3BzV5F5wKLWFLF3wmu/OmMNXDvr6jtcLgnGayuc7vVTK4wUuTUGDE
 rkTcfx8ZHInMTuEM4DpSD/YCYQbj84glcF71kQFxAaZ+s6Fboksp9+oXxZLu9BeIYygqzqcRqo+
 NFNcUy5arseB2rZSlnMh62cP4+kgwhqou0LzzddK7As5M4NpSDvkvKNdXX2QoBevDAaji4OgFc/
 tLwa+lK73irpiL4gEe9agany0+IehAxWqj/crDz05FwezSWwmwuGl4QgUtx8ra1S6cKjMRxEg7j
 G+t+qgck8ovwacB6Treqm0lOtkdBpcVa95B638um0pYlcgnhNfYFV0IWZMXyEcbURgIBKCmcd1M
 l0VQFJz772IlErAirUD5aPsL18xyxKMU9+TPqUSdu8Kk/44CIA0FcNcZcln836n5/plU/HWB6Wu
 LPPJGP2N9aSJDkg==
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

Wa_14019988906 applies to all graphics versions from 20.01 through 20.04
(inclusive).  Consolidate the RTP entries into a single range-based entry.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 03bef11370ae589d1035cf2cb7b022fd173d37b5..0a0f94ef5c68c2e583f28ab48eb4f96b2896b665 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -645,6 +645,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(VF_SCRATCHPAD, XE2_VFG_TED_CREDIT_INTERFACE_DISABLE))
 	},
+	{ XE_RTP_NAME("14019988906"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
+	},
 
 	/* DG1 */
 
@@ -701,10 +705,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 
 	/* Xe2_LPG */
 
-	{ XE_RTP_NAME("14019988906"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
-	},
 	{ XE_RTP_NAME("18033852989"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
@@ -742,10 +742,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
 	},
-	{ XE_RTP_NAME("14019988906"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
-	},
 	{ XE_RTP_NAME("14021490052"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(FF_MODE,

-- 
2.53.0

