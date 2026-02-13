Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74343EF99E0
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:32:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C887E10E849;
	Fri, 13 Feb 2026 22:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJTamGMc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED5E10E327
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771021959; x=1802557959;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=WK6gEa1QkPi0/hjhmSVLu1C+E//7+j0Btwwo+T9zB5s=;
 b=OJTamGMc1GfmwTS6Me7UDShsOad/2y0EvPDvXolt8Hsy8fN1pckYTT0u
 OSLAelkPaAwxKJcZ8rah03tvb49TAdwmEvIVJML8BCpWJAT+VSskIAXr5
 ZXIRpd/SDCpFV6wWqpQBHCX9jfyWHjVNA1S4fqW+NJE2gPsoKBJdeEQpz
 gxSXL1hRBcZcltnZv9OoW1bHx8YbgDKqfpStvlXLWNr4EJrDXOMwsjhk0
 bos3AWOnqITi/CkDr8XDTpj+5zbLHd65m1rDOyeGBdqi/Br2CWPnvrZB2
 gVUxCXMbUnfhs9mwnV7nn0F8UOiSIX6DtBg1notw0lL/k5N9xmopmX4WG g==;
X-CSE-ConnectionGUID: tik5gq5lTmikFz4ajNWukw==
X-CSE-MsgGUID: fr0FGxLqTsqf75vyA1lMGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83654447"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="83654447"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:38 -0800
X-CSE-ConnectionGUID: sQpVLfSFSG63TBZsoE/RFw==
X-CSE-MsgGUID: Mj1wzoddTEKAgk7wtBjngA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211705677"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 13 Feb 2026 14:31:54 -0800
Subject: [PATCH 19/22] drm/xe: Consolidate workaround entries for
 Wa_18033852989
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-forupstream-wa_cleanup-v1-19-961f2dd3a8e9@intel.com>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
In-Reply-To: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1905;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=WK6gEa1QkPi0/hjhmSVLu1C+E//7+j0Btwwo+T9zB5s=;
 b=kA0DAAoBTXkkBchykAQByyZiAGmPpoPIgkUBPsZJwTTizqVb9Tz9+O0k3PHfdvCUKf3tbxVJ3
 okCMwQAAQoAHRYhBMJnwwlEf+tPPyFtrE15JAXIcpAEBQJpj6aDAAoJEE15JAXIcpAElNcP/1MD
 Q8HSkbNF+PtSsiJ2M/MjFBYyoK8HLenVdpX1WO0VPsolJbis0+wS6bhEEUoDWclrKWSHZrAIecx
 fVglZyy2aMvl0lrmOfjOn/8iYe9HkMJwLBDqnUwlOf/vYuH9NXTCKuI+368StUt3lfeTtgCWVsP
 ePoT5Xyjg7H7ZkE7d5LReal5HOPXUC3mpSb0648YoAyt5e8GMHNYnuLcJ5jEer9RrNHg2f5dxnW
 rkMcON3YIQNxDYMCKG66tOHv88JaAa4r4XbRBK8eMNRnXwKNOtFLzh03yFqfpvW3Zsi2ugfAHJr
 OcqRxziFsoqGz8tKE+hiv/XPQsRj7QvyAzbtGDJRrK/nEoc9n0BcImULMHAXij8HIaOtNpt1erg
 9plLcQtdzZ8oaXGGQbRgLFGLg/81Om6GAYsrmZx2DhZnwEUtrHHxCfJUbuZsuhaa5ACXQIbQi/+
 EAqbwytbZZp80h6RUhALRRMjGlnbkYj3UgflI1hvNDt7Z2ifP3kttixxZWjNpYCPqTd47QKKjva
 IKF0Z9Nhp3w17mhvJmQiCIP/4eoHfWC3PdE7B1JT1rXhloBLqlog9UYpsMEmuNO9M/Pjd4Ppj7v
 YFw2sAjOc6cG59c+N6N9HBgBwIlu45UqttN4ykCiHAVOrOWH+QpmkBsW/M9egFhA+D9ntMhZC4b
 sxIpN
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

Wa_18033852989 applies to all graphics versions from 20.01 through 20.04
(inclusive).  Consolidate the RTP entries into a single range-based entry.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 099493c660943d3e46bb404e199dcfbf9f71be92..d3948e50b011a2721b8388e06cead7f16ecad174 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -649,6 +649,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
 	},
+	{ XE_RTP_NAME("18033852989"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
+	},
 
 	/* DG1 */
 
@@ -705,10 +709,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 
 	/* Xe2_LPG */
 
-	{ XE_RTP_NAME("18033852989"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
-	},
 	{ XE_RTP_NAME("14021567978"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
 		       ENGINE_CLASS(RENDER)),
@@ -759,10 +759,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
 	},
-	{ XE_RTP_NAME("18033852989"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
-	},
 
 	/* Xe3_LPG */
 	{ XE_RTP_NAME("14021490052"),

-- 
2.53.0

