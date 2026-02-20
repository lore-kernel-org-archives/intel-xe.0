Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA5AC5AD6A
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9BF10E83A;
	Fri, 20 Feb 2026 17:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l6D2oz/a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A0E10E827
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608497; x=1803144497;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=aIjrZWYQGQtpt5nZFBSuzPLroEQiz73HuEcdbq+qrWg=;
 b=l6D2oz/atvFCFOotj1wdVdjlVRML7R+saEOcWJCGKoMfpdGGVWxuuiBS
 UkTPHbBH+xxP2n8RUWupQkDmunfaE48SnQczXtsGUikZvL1bycGKB0Qm8
 8pbSyoxYjPvT25ER/XQDFQT9f96nAHS7HQdg7Z0/+XV7Gp6UZMEXW/+NH
 4WNNmNqDHN3wJBZfs1blZvauKnCRTWuJ3vdhrmTHRZxP/kEfaxRIYyniA
 VWwk6ZzMju46Ydq6SxFXlZvVJpjheCJEDxm1IO5bLw3NGocl3DmIhlCcc
 JiC3TD3E7l5Gr63Q/+vo63haWoFPcA7CaocnTRaWWuHDmtcPy9giZndO3 w==;
X-CSE-ConnectionGUID: wfyD0EkEQwi3kCrTLNrFqg==
X-CSE-MsgGUID: n0d8tFLvTri1BGPPt4KEXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606737"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72606737"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:16 -0800
X-CSE-ConnectionGUID: sH9lQXDHQAGNdcTzu1RSZA==
X-CSE-MsgGUID: WMbdj27IQr6T8oz5WwHqrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214138694"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 20 Feb 2026 09:27:31 -0800
Subject: [PATCH v2 09/23] drm/xe: Consolidate workaround entries for
 Wa_16018712365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-forupstream-wa_cleanup-v2-9-b12005a05af6@intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=aIjrZWYQGQtpt5nZFBSuzPLroEQiz73HuEcdbq+qrWg=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpmJmtirFpoT7MTCIcOzC+1EEaW0Gg14rkAdQpa
 pc6rr+dhC6JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZiZrQAKCRBNeSQFyHKQ
 BKCGEACISDaXrJUa41fVJZ/isIHamMghrY5NumCrDBKCzubtu+H2je7E9QozUaVrbcBIsErTFX4
 SbTcWCaMFTXxJTT47PVJ7q4rtvbyQnWrF53N/+8Dr+yPgg0Gy+/opj8sifFYjWDwmLn8tSmvcFk
 ipI19FJ41QHqirxj6PV7ErA6s5T2ajyJxTS2q1KS7QqMDQIRysM+0QIea3ik1eNBbv/zhH6KK1A
 NOsHygMDgE12SSZ+9nPs28X6cbB6v9uiTmPyzMtYd3mIpZGp97pyDRzAHle9PByEngrhFHsAIpz
 S1pYMf/vYZmYQk4nu9SA/YpiEGgsL4MST3kAjweOWQVXJ+nJ+mjCcqwkJQLzVkmTaSI5Z9LB6kh
 jvVxSCEEawQZdFJCpweRK7SdwHoHneRZwM0zrQu2E0/rqZfUnq5jGgOvbyRVEcJFLdoPq0WLPhZ
 jRSg03exwNqMnYEeoHf2Xkxith8JbT2QKRXmE9LELGyv3Xg9R04Jrp5QvKD/cSkmw6JmEIIyUzu
 iIYPOyxPDfq3bMkSFEmwebTds5vus5XerbfAaDA6BVr6e+n6iMtZHw2TghuEH5wCAAsPGETXSCT
 bSsT6QNC99XBUK+OKzJOxXg1EHU5NRM5W6g56X+6W6FbbEUtraGTQU+b0gRSJxPdZ0qAzMBxxXK
 ijh+dMMF2WLFG7A==
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

Wa_16018712365 applies to all graphics versions from 20.01 through 20.04
(inclusive).  Consolidate the two RTP entries into a single range-based
entry.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index a483a76c7665eba1c6a87a18bab1a31d11a01f4d..f99f1fbe3aee016d8a8aa19d62f6fd503e6e19f2 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -348,6 +348,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, SEQUENTIAL_ACCESS_UPGRADE_DISABLE))
 	},
+	{ XE_RTP_NAME("16018712365"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
+	},
 
 	/* TGL */
 
@@ -485,10 +490,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 
 	/* Xe2_LPG */
 
-	{ XE_RTP_NAME("16018712365"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
-	},
 	{ XE_RTP_NAME("14020338487"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
@@ -538,11 +539,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 
 	/* Xe2_HPG */
 
-	{ XE_RTP_NAME("16018712365"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
-	},
 	{ XE_RTP_NAME("16018737384"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2999),
 		       FUNC(xe_rtp_match_first_render_or_compute)),

-- 
2.53.0

