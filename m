Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE68CEEC2B3
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 00:12:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BD610E467;
	Tue, 24 Feb 2026 00:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jP2uY24r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4B210E465
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 00:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771891916; x=1803427916;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=C6WXHP+5Ixxpfg7hCzbmgHuBpNxoV7lEo+cpxPCwr0s=;
 b=jP2uY24r3s3FJMWfXd/segauwnW9W0Gt62EOoWdgs0OdmRB57h3yYTBr
 yHWYduZ1E8oY29RN9uYmLGbEGIIxbBMYWM0A/mDG2AEChEvsJiEXWocY6
 zljHz8Zq9ui5f5CMaV1Znf6kAd+onQLTOn66cnfAtRnijkUKmrrDaIvNr
 kNbSjS6+wXBIMM0c+6vFkJqgRUy3+qNdM6kDvHpYKyYXU/Ao4mXMy3Smh
 aQ/p+Qmw1Q01W//Q9Ej5ANqay7mb8UNZVX8yIGeP/k2spSfsz30hF4RDU
 snaExDRQljitq18uXFlxsgiJA7wG5Wyqb/LIJTGzBGfNpVIM9hLrOkOT0 Q==;
X-CSE-ConnectionGUID: nOCcnYkiSuaXsg5rZdUR7g==
X-CSE-MsgGUID: n7p/d9B+TaiTBKm8t0h5hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76729773"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="76729773"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 16:11:56 -0800
X-CSE-ConnectionGUID: voUHYyJQTQyOyIBjozzmUw==
X-CSE-MsgGUID: YIm+V9VEQGKQjJADA/RJow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="220251353"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 16:11:56 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Mon, 23 Feb 2026 16:11:32 -0800
Subject: [PATCH v3 1/2] drm/xe: Consolidate workaround entries for
 Wa_18041344222
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-forupstream-wa_cleanup-v3-1-7f201eb2f172@intel.com>
References: <20260223-forupstream-wa_cleanup-v3-0-7f201eb2f172@intel.com>
In-Reply-To: <20260223-forupstream-wa_cleanup-v3-0-7f201eb2f172@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, 
 Shuicheng Lin <shuicheng.lin@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2892;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=C6WXHP+5Ixxpfg7hCzbmgHuBpNxoV7lEo+cpxPCwr0s=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpnOzLZq/NDWB8ya03pJqK24A7Lfsl5UgbTQZaj
 YIwt2590cmJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZzsywAKCRBNeSQFyHKQ
 BI7YD/9Q9QNBhjjlUltNzWc2f8mkIC8afICyB3vjGSAiOobH254F21TqoaiSddhwEgxP0fUjhgQ
 ie5D/Xseac0LfrIumKSr94QE/yewLjd9G+OuCa3YGTaEX86POFyFPY0iiTJ142pbjS2eNOVLT+p
 dXkI31RKhUmNry4Nm2Vn3D6Fharsz6mSt1iApuZG3PwqNJrN+NmUeWSRCzjUzAuLw+ziG1Bjwof
 zXMNc6WBrPddXukwB0lgm3t+qHat1mGh/WlDhbs4Cbgx0B6/pBUXOP6VyVWTSuJ4FOdQyUerxR6
 xRitgwzymga8rkvmdQIc63gkHcHB+cD7odb2KqlsHnkSok+s21RYigh7NETWKxe+eIGXXwOnSJG
 rdOZ107Zd4LWZ9I8k4820Gsd+ECg0Aa1ddQFAt4g5f8aC9uQOh0FDtR0cvzmI/GfNMccTivNmpX
 GPgo55yvb+jIpCy6/qHMwzvgHQGsp9v90a+lfFH3K0Qz4MVVO3a7HzMtNkQHeAfVeYfmq7Emcw5
 /S35agzHZBqZlaeb7v16t+1xnCyEz1cT7chi4+6TenMv0EYqex3zNzrtHF9haNllb+aWUgmCKGh
 jxsCy0gZWndX5tTRTcnOFhD3Yep0WbA5RNVPl5yY2kzBKsLPacg3KGBkL/zWh4R0SZ5eFqhO+Xs
 ti8ZsdzP741Qvew==
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

v2:
 - Drop the FUNC(xe_rtp_match_not_sriov_vf) to align with commit
   a800b95c2498 ("drm/xe/xe2hpg: Remove SRIOV VF check for
   Wa_18041344222") and commit 0ffe9dcf260b ("drm/xe/xe3: Remove SRIOV
   VF check for Wa_18041344222") which just landed.  (Shuicheng)

Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index ec85a2bbe581612302f8087a3a0acb33ac28d393..eee56b000b14b59ea66bf227905af7b84858d9d9 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -385,6 +385,12 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
 	},
+	{ XE_RTP_NAME("18041344222"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 3000),
+		       FUNC(xe_rtp_match_first_render_or_compute),
+		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
+	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
+	},
 
 	/* TGL */
 
@@ -531,12 +537,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
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
 
@@ -555,12 +555,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
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
 
@@ -586,12 +580,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
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

