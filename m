Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C31FEF99EE
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:32:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A3F10E853;
	Fri, 13 Feb 2026 22:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DsaLyFI+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCB810E849
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771021958; x=1802557958;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=rsRGQwhX4ZciggjVoMMBJ7aw/cuotg0m40uUNbny/Kc=;
 b=DsaLyFI+oXqEaTvhthCbz5sufZNMhLacklrYx8KB4syuMbRLcNAaDRoq
 ARRXl78HVx3wmU+hV1mHY43oihJ0SwRNhr2JKF3p9B1kPPGTYFkBlQzFa
 T7/zRdQjED3I4eugAhAZ4cSSgfAiar5DVHZxIP4WjCUaHjzYhz4M4wZld
 DDhmqR7xtH1TrtLAbrEiIpeMzBGsVXUwdAyqJeBkn1ElvTZM/q7WdPqsG
 BijdoPRiPvI0k8hZ3ERz2QxqDUlHdo8vqdlkDEueBGJusUWhwEhanUVZJ
 We2b6rE4htIiOj6vtF0W+2TF9P9Yk0N8nB9j7isIQQ8WhtY1fNTQAFPWu w==;
X-CSE-ConnectionGUID: 3e+RV6UmTsW4k1E8yVH9MQ==
X-CSE-MsgGUID: Mb1Yv766TJizqCnGbUWm3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83654441"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="83654441"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:37 -0800
X-CSE-ConnectionGUID: znAH4k2CQGOe2pjtGO0LIg==
X-CSE-MsgGUID: MJl0IeIIRVq0ea3qBV5cIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211705659"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 13 Feb 2026 14:31:48 -0800
Subject: [PATCH 13/22] drm/xe: Consolidate workaround entries for
 Wa_14021402888
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-forupstream-wa_cleanup-v1-13-961f2dd3a8e9@intel.com>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
In-Reply-To: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3048;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=rsRGQwhX4ZciggjVoMMBJ7aw/cuotg0m40uUNbny/Kc=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpj6aC0ZMxbYDyHY7R9HM9nvD5kf/7l58n4MRlI
 LOHJC5YfEKJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaY+mggAKCRBNeSQFyHKQ
 BP6jD/sGYdU9XAsRv/woaGIl67tXGchtt7TNG2GcDy0YnmVWwroUBBs0n9GeZi/ADU1yWb3gi/b
 iaVT5VPRBJK9N51WYjC1l0eeBNDAkvpk6J5i6P7ZkJpLFR32Uhe+jwAGAeQyRZ5tXgNR61woYFJ
 qrUKmau7exS0+SZhaTslEZ006zl6/pNrlV8uEg7vMPbS5D9XGkbqX5+ZxDMtulHqTsBfSogugGx
 46GZfFIethqLY7gnCdx0VgdMb09WNyVaJ7wtObfWi2PbnQvqjTr2YELkW0QchHKwoPXo/Us3Qgu
 gE8xa1m0zFG76VTopBWl5PJQgM/xBewjH0PXlUhN+KTxTNf6+lqAPzYsQ4reJa5jUdlLkTa1vqS
 cE/QPrEoDe+UvDnJ19MztdnQM5fXKKdBqQRWnaJvxUsEiUwG1vEpqiNnCXWMY7haqzdtaq7ucrt
 1pxHPi0zr9kp0WhWV6MpVrhB+gxn2/0ePOlSdoJ/uV+SojEipCRJmWgpDh2ThBDxYUXo+htkpyz
 y3N55Sghvvjovo1yu5GFgmtuuvf8OHBJTmGNLuDUSL2wEhEN66Et+G66moC3wMUeFCvLw3DRow4
 VyTuz78DIVaMdYPUA4I1z5tiboloUDmLBf1kH3nZmU2llTeHtJQTG3izmAlfYbSIzqa4W34wE3M
 9sxb6F3dTaxkkJA==
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
index 460cfabfb4442fa33ff645392788549026dfc9d4..75f4f09e2cffffd8a0ba63e508fe04b42e4f0222 100644
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
@@ -544,10 +544,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
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
@@ -568,11 +564,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 
 	/* Xe3_LPG */
 
-	{ XE_RTP_NAME("14021402888"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
-	},
 	{ XE_RTP_NAME("18034896535"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
@@ -603,10 +594,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
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

