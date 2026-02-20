Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4CFC5AD57
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C6710E830;
	Fri, 20 Feb 2026 17:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D4EUuKNH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E1710E81C
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608498; x=1803144498;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=gfY3xLhUEiLbtZaOviU7Z+sGpgIPvVtpABNOjAdJ9OI=;
 b=D4EUuKNHbzabTRJHL1OE+nDxp32c20jJ8A7YSWZVlOJXQZAACgd22sbf
 +VEzw+lPnx1DtFFjUGb6gH0EU+37Mg7EpSsc/lvr6pa/SE6ODlRzpHVcR
 Ma9jo4tSd0BG/BPmOOWO6IWK6pqxN9LDLfvOshUaNaHl0xu0tt1TlVMky
 +RGWuNb6VWkGuZ+72Q0eqn7knuOvT6FBh0p1pBtVNGMNfjEMQ2IXgINq8
 RKbNjRzSwNeoPEd3n2Ef6jCvKYioMPsjsPcOBIsTxAbBjFk5rkxZYXV54
 pBW1cYjxJnqE/et6i9qtU/71JHpi5HajgauL6UbQHBiuNVnAquepu7nMY w==;
X-CSE-ConnectionGUID: /GX235s+ToqxcYrPfoLkaA==
X-CSE-MsgGUID: yXQAW1gOQ7yjb5eyG41DRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606743"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72606743"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:17 -0800
X-CSE-ConnectionGUID: cVA4qiYZTjWCOjSOdi2VRw==
X-CSE-MsgGUID: mfUu/z4NSPmMJrEGepbowg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214138712"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 20 Feb 2026 09:27:36 -0800
Subject: [PATCH v2 14/23] drm/xe: Consolidate workaround entries for
 Wa_13012615864
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-forupstream-wa_cleanup-v2-14-b12005a05af6@intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2738;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=gfY3xLhUEiLbtZaOviU7Z+sGpgIPvVtpABNOjAdJ9OI=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpmJmuRl6t3lOubG7rzHqvyWV/NbieNAKaBVgFA
 8uHIj711wKJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZiZrgAKCRBNeSQFyHKQ
 BF6cD/9iZS4u12Ju4CE8VPiBVbtJpjR3kt9aT+d/adcNwWItZrWuh/BSqIT8UinfdAdT59HYgmM
 0L3VMUrCkDCHl2fhi3FBUE3g2TiiLw2WICyru8Hl7R2wWC4HIZGGV5gAj2hvfAZ60qNF2elJ1RA
 uNhmGFFL80tMy96EItaH6yiZGD7j9DF5EqJYtaekFQreJtal+zXFtThPWIA0u2bRexlP4QOfwh8
 5CuJZZU8SlAjrhXe8kfAUTwkpeATUkx3Io8YgOLxD3/Rz6ME3mdJ7OgNtsdwQhoif20eC2Ln9NG
 T7y4komhc/+JYx7wUhQwIOaBdx0pGfEIkrfT0kv4LWUZVLmm2BL0iKvsWk2pTbSvpfMGa9i34UN
 JFJ0AUPYCRRtiEbMZ0QBjQuFdp0+OpOQeU60eUedIzBwc/5cuBttPvkIdaqRLxZ3FMI/uyDFswJ
 D5hIKOzaOVOT5nr96pktFi/V0qpqu+n7CZMxZ7Rj2Y1+Cwg88yv0BNjXKFi9oBUrXWqDYd6UEEj
 IpRTfPv8WgMQO+Df56U0hO0/ccUht+p4e7tswYrLYynljPQ29LVb+lgrLIrPxmJIZ2ne4nACSGP
 asW/HyGhVvozbDcNQlV866Ggnl8X8TMupEqj16+iZA36I/OmNAYMvjybgS8U6BgOT9/DE7SEoBD
 SfQQN1ZDVt0p8lA==
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

Wa_13012615864 applies to all graphics versions from 20.01 through 30.05
(inclusive).  Consolidate the RTP entries into a single range-based
entry.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 5d71cb9dca513803274ec1d5b766c2cbb0c31987..190b31a9d49d33e7fb80174be7ba9cbf726a8224 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -380,6 +380,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 3005), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
 	},
+	{ XE_RTP_NAME("13012615864"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 3005),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
+	},
 
 	/* TGL */
 
@@ -526,11 +531,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, SLM_WMTP_RESTORE))
 	},
-	{ XE_RTP_NAME("13012615864"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
-	},
 	{ XE_RTP_NAME("18041344222"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
 		       FUNC(xe_rtp_match_first_render_or_compute),
@@ -555,11 +555,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, STK_ID_RESTRICT))
 	},
-	{ XE_RTP_NAME("13012615864"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
-	},
 	{ XE_RTP_NAME("18041344222"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
 		       FUNC(xe_rtp_match_first_render_or_compute),
@@ -587,12 +582,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE))
 	},
-	{ XE_RTP_NAME("13012615864"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), OR,
-		       GRAPHICS_VERSION_RANGE(3003, 3005),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
-	},
 	{ XE_RTP_NAME("16023105232"),
 	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3000), OR,
 		       GRAPHICS_VERSION_RANGE(2001, 3001)),

-- 
2.53.0

