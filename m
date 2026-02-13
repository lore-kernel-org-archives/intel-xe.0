Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E038EF99E9
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0051710E84B;
	Fri, 13 Feb 2026 22:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HMXpDke4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F85210E327
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771021958; x=1802557958;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=W2l5N/DIKtHCXhz6fBLGoalnL52S1ko9KkH5pCwdKxU=;
 b=HMXpDke4BvPcL9zkx0+aCQX0dUSKhfSFOjLvOJK/KNqFOGaPv+sxOuqp
 B66rFypyOHyZWN8vzLp9BIFw3a4u6mx5Ddp01AeiQIvFvEWtBLXyscWQO
 c035IDV0l9rL0WsOCjxX84oNQ0OCzOoS8QYKUVRwmDSAXi2Q1XEsph8/T
 zeJ8DBwVv3j1AsRP7ChdpUNWxZb2EpaZfwXKZ+y4WitNn56aOWL07FxYX
 9Dlo1p2Ud49e0U/+a3aoCBsIHqRJIEuX6gF1wSmnoNEDU9idvFxunq3T4
 pMN3qKHeK34RY4Fk3YrqwVao3uC5sm0QChA7RgQg2pbxZt0zpM8EcDQ/r g==;
X-CSE-ConnectionGUID: gT8enANBTa2StToW72zY+A==
X-CSE-MsgGUID: 1vhMMrlBQoGLvJOj/rZWGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83654443"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="83654443"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:37 -0800
X-CSE-ConnectionGUID: Kxy12bzRQaODhBxg0kNW1Q==
X-CSE-MsgGUID: F4qnghrTT2amVAuK7KW9ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211705662"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 13 Feb 2026 14:31:49 -0800
Subject: [PATCH 14/22] drm/xe: Consolidate workaround entries for
 Wa_13012615864
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-forupstream-wa_cleanup-v1-14-961f2dd3a8e9@intel.com>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
In-Reply-To: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2631;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=W2l5N/DIKtHCXhz6fBLGoalnL52S1ko9KkH5pCwdKxU=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpj6aCqRydIjnC/ALvkrVkpaUAGz66H/UcOlOwl
 c4Jc74VFBCJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaY+mggAKCRBNeSQFyHKQ
 BN9oD/9BWgrAFaVwy1sqUKwUa7JWkWNDd2l605OdXbmZdMSVr9TVhoLHJqW7f43XuaaGqqwLbPq
 y4iBnTkCOzvCV5FEAUuCh4vb9r3Gj6LL05aU3YwbiE7XlrxwzawZtITxvMU7knCxb3dsbw0QWy0
 sevLEfzg+SbCpb4kDD5K4KE/5PNCFwt4FEpFIRi6+3yQZO6yETCNNJCPaF5iril1niHg4olOccm
 MLKOjInnwAKNAZDY+pYWhcbBtFxJrD8GmyzWswkqTC4B7nolzhZ8nkoOy6H/9URrb7tGsM8/jOC
 afo2F7wXsxB3w/9B1wwRdS4ZE+lRnLYcCIjCUVGZtjONk+PxbQoFn+gDtPCaTUeQKJpsV329oSV
 8XR0fOIezS+Bg03RONMtqkINKsxp2GjNlaD0VLhwqfzlCl1ODeQVEWTtYdL3Hx3S4oe//gcTtvU
 o1oSufC4CUQqEE1ZBrl+ay5ZOoo6K+CHKXY9a6/mTUsPOEIw7IUO8jEV8jwVPGyE0Qo1m04SvA5
 c0vfQY4CGjjIpEPTDy80isHFzfBsfKHQe5l9IJUbdv3VqyL2qTczH0yHUYPErJwCYfnyeETvsFU
 Q15iPq2h1zvoq4qCWvJgXvhItMZi7RmgfTZsacvtUZx+vN4mnR6lA6mwsRt6MwsLsWXQ6IErtLv
 wXzH7gJ8j/Uh6Uw==
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
index 75f4f09e2cffffd8a0ba63e508fe04b42e4f0222..27e22f23088b5807dd11daa4d08eb80dc6eacd6a 100644
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
 
 	/* Xe2_HPG */
 
@@ -549,11 +549,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
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
@@ -582,12 +577,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
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

