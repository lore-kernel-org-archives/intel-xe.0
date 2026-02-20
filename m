Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F9AC5AD48
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:28:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C28C10E82B;
	Fri, 20 Feb 2026 17:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihfDe6Xg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD8310E81F
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608498; x=1803144498;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Q85DtVStZoNWcO5w/dBtB3T8eLZ/zodLSI+mr/Xtwyg=;
 b=ihfDe6XgFm3sCAjMNlmlS8lfEW1rB9WU5yLcCN/CTeTBPYMa9I8YKzOv
 OrZLOIyT3DDXORQLM9d/I9orwEOvw/pUUjAZfvucmJ41W55/JJc1JwEXR
 Z3oeyIJIyLQZww0xvNdTjUphwc1OMgHNJ9rh7m7RkOW95Ujg4hGHMU/Yb
 xWBbKLC9FFJvWK57+c5r2HDM+obC7mw+3edCmT9O/O19qhCxQFTkypX5n
 t+70XqdflKyLM06TA7MD2+l/OSTDt9RJuslnU1f2hGU+TSws975ut9Wdb
 PYUzdFiw6CraSe6Fqqww5sp9InLo1nfKpypBOF/y48TA1KvwiXenjV3JV w==;
X-CSE-ConnectionGUID: qH9loTCcQm2RAdc0+lLUhw==
X-CSE-MsgGUID: rDcF8yrTTvaJ4RU3bwm2Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606744"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72606744"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:17 -0800
X-CSE-ConnectionGUID: Ywc/D4KIQeu7DE9DawMOKw==
X-CSE-MsgGUID: ltKnRcYHRpOblyM9wbWAlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214138715"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:18 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 20 Feb 2026 09:27:37 -0800
Subject: [PATCH v2 15/23] drm/xe: Consolidate workaround entries for
 Wa_18041344222
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-forupstream-wa_cleanup-v2-15-b12005a05af6@intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2621;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=Q85DtVStZoNWcO5w/dBtB3T8eLZ/zodLSI+mr/Xtwyg=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpmJmuO7y/6Auc2WF90ImsJWHTdZLvDGKH0Um/A
 rvCEAVcNiCJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZiZrgAKCRBNeSQFyHKQ
 BCQWEACqd/QeSLOGBYMubCDsH+PHoFFZOIXAto1U8KhkkhtkJTZUfAdQl8qSJhZVrPB8Exs0Siq
 QA6gKJ1UHcbM+YyEHc/QH3KbYumrsmLuEBSTRVlnNosubIS6gRYtAWJTBLMdo3TUJq7elv5Sci/
 WpdH6WQbyCL5KL3d1nYTIgrNSwa+CwSRYrYNQ3MohFEil9A+izefRmqDhlledE1OG2R7kovtjm8
 Qz1OG+mifTMiJw8FlolxUm/GUMXxMfAyC2jeNzKZ552S3GfG0YrY9foCcufd4IxTLL72ht2/pnh
 bnnCJm3v21HJKPyAM2fxJEZzI5afpSOjY1xvf256qQnbdQp+0FdQ2Zz+uRes1zJb4/Y+K4MWbZl
 YMDd4rrvHUlS1ijGhKEndPq9jsnEMQs+HtSOy/jq6PFWDWEBR6dDnfpwjAXh0EHu/jtBJJRU4S5
 Pleko//2p9RSEiPqQ95HAo95NmPTS9EBzR3SK/qvmsb5f1zOHlawEakcxLVnyR97Y1DYH9+8Fu8
 uZYA68wU/5yb7PhDY8QwyUQNqmytaLnlNh5HMeHzCaTQfPaGQECejjn0h2h6c0Dfb3BtPBgagPx
 PmmWdKrWIHh4csX4SM0G4ZW17GYDRA6lQMBgeDgWfGUk1xcSpkfyTv54Y2slC9i8B8D0wvkVzoM
 S4Tae+ED8Ky3Xzw==
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

Wa_18041344222 applies to all graphics versions from 20.01 through 30.00
(inclusive).  Consolidate the RTP entries into a single range-based
entry.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 190b31a9d49d33e7fb80174be7ba9cbf726a8224..83318a4ebcb51e004497e2cb9460e95691b5d9ff 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -385,6 +385,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
 	},
+	{ XE_RTP_NAME("18041344222"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 3000),
+		       FUNC(xe_rtp_match_first_render_or_compute),
+		       FUNC(xe_rtp_match_not_sriov_vf),
+		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
+	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
+	},
 
 	/* TGL */
 
@@ -531,12 +538,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, SLM_WMTP_RESTORE))
 	},
-	{ XE_RTP_NAME("18041344222"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
-		       FUNC(xe_rtp_match_first_render_or_compute),
-		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
-	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
-	},
 
 	/* Xe2_HPG */
 
@@ -555,12 +556,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, STK_ID_RESTRICT))
 	},
-	{ XE_RTP_NAME("18041344222"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
-		       FUNC(xe_rtp_match_first_render_or_compute),
-		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
-	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
-	},
 
 	/* Xe3_LPG */
 
@@ -588,12 +583,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(0), RC_SEMA_IDLE_MSG_DISABLE,
 			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 	},
-	{ XE_RTP_NAME("18041344222"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(3000),
-		       FUNC(xe_rtp_match_first_render_or_compute),
-		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
-	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
-	},
 
 	/* Xe3p_LPG*/
 

-- 
2.53.0

