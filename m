Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3866EC5AD44
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:28:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9ECF10E824;
	Fri, 20 Feb 2026 17:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UyXRPMPY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E56510E82C
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608498; x=1803144498;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=88W16SX+m2ydG1MqHSPklQnjo+cTgeOt1sJujd1tfs0=;
 b=UyXRPMPYqdEEP/bUoR5HwPocC4BmgZVqFkPnrBHoISrjNBS5zrNIkcxs
 S+KzDrbux7nJpNkuSjK+0qZDTYYQVaPM/2KPe/NVOX4bbAAmfasK1vdV9
 KB3pr/ABHuR6xW6h48LqUdleHbAXEDWZl9SvUOi6JIXqawp9f3bj+9dd8
 04GYdk1KbfJXkynyhn+jRhGoshCK+0YFkklONeHd4edsJITFEA5G1SsIn
 61BsyCfxzLPx6/qjdlfCG7T+zpA5Oj/ZlA9FRbv5+w95P97zLJpGS1ayj
 lXFRl77zvA4gm4TMVQ+JGBG65sm8TyqRb57b+OwjRHGe/WID5EYwyi7PG A==;
X-CSE-ConnectionGUID: ZYAKFD1JSlmKkoFCpeYMCg==
X-CSE-MsgGUID: Dtwt12rHSdKQfnsVJLd8sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606745"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72606745"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:17 -0800
X-CSE-ConnectionGUID: JlRpA/GOQ4GZ2NBKegLz3w==
X-CSE-MsgGUID: zGl3j5r7TPKANoS+LarJeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214138718"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:18 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 20 Feb 2026 09:27:38 -0800
Subject: [PATCH v2 16/23] drm/xe: Consolidate workaround entries for
 Wa_14019877138
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-forupstream-wa_cleanup-v2-16-b12005a05af6@intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2931;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=88W16SX+m2ydG1MqHSPklQnjo+cTgeOt1sJujd1tfs0=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpmJmuykiDM0xzLakSEiBjDU/CBlupykHPlZejY
 UcI2wl1s+aJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZiZrgAKCRBNeSQFyHKQ
 BJV3D/9Ybqz9/AHJGjls2gSHmXUeZ1y+FK1A2PV+B0XOS6exLvKXtMzcUSKHVUT6rm+VnX4VdRD
 f0TwkB2911oJrrSKvH10W59FAABSg31wbAwkgfcVyCGwE8+wf1sFj9wn7vOlYj5uOoAHbI0ZueH
 uGJ+9fjAJ616oOtfjuZRZYIhFyL9awDnAIqFgb30NO4LCYxxq6sBp7dBHiKao61qNpYeHbEgK59
 U7gN6f0LT+JnhFy6q0yR/HMuQtgc3vZOssaTuMf00C1t8ZlZ3qPjhVTt8YlS6h7vBdfIMD6RpNl
 JKswDygdYb8PnwGRcOxgXKu2g9dI4pIpR8dLUYcfdT6+zyCLvT7FVjd5h1/bLPHCUP31AxO7A6E
 X9G9mjZfs1QzHHihZz+RMImrCGg5Qm4Y6xnHomnMVmy7flQ76JUrNuZRcMO9M8YCzCUJZBHU+LG
 M8TFjPZgUo4fGh2GuwLb+4kDch/b2FmkO1yht58yI5biH1WWYel75Kt7Fhiajt3vIWPjx6zd39J
 zzNMvgPGMh2ULH73Vh1RwC6xeWrpo1UroMin3vHxwa11jtNEviKrlmp+2K6RCU1xRe0fhUanGYQ
 NoEaTC2p5nqT0W1+ydoktS2pNxyl2SnzCuL1pEC7mx+itY0e6TUkFQFAfL1tsRfHukw0JnatzXe
 ELGiZQSpNZDi2mA==
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

Wa_14019877138 applies to all graphics versions from 12.55 through 20.04
(inclusive) that have a render engine.  Consolidate the RTP entries into
a single range-based entry.

Note that the DG2 entry for this workaround was missing an
ENGINE_CLASS(RENDER) rule; that mistake is fixed by this consolidation.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 83318a4ebcb51e004497e2cb9460e95691b5d9ff..21af997447e78951dd6d40c87454e8ef69343006 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -637,6 +637,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(1200)),
 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, DISABLE_TDC_LOAD_BALANCING_CALC))
 	},
+	{ XE_RTP_NAME("14019877138"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255, 2004), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
+	},
 
 	/* DG1 */
 
@@ -673,10 +677,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(PLATFORM(DG2)),
 	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
 	},
-	{ XE_RTP_NAME("14019877138"),
-	  XE_RTP_RULES(PLATFORM(DG2)),
-	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
-	},
 
 	/* PVC */
 
@@ -694,10 +694,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274)),
 	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
 	},
-	{ XE_RTP_NAME("14019877138"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
-	},
 
 	/* Xe2_LPG */
 
@@ -705,10 +701,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(VF_SCRATCHPAD, XE2_VFG_TED_CREDIT_INTERFACE_DISABLE))
 	},
-	{ XE_RTP_NAME("14019877138"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
-	},
 	{ XE_RTP_NAME("14019988906"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
@@ -758,10 +750,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
 	},
-	{ XE_RTP_NAME("14019877138"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
-	},
 	{ XE_RTP_NAME("14021490052"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(FF_MODE,

-- 
2.53.0

