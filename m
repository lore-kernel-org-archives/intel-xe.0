Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CF1EF99EB
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C5910E84F;
	Fri, 13 Feb 2026 22:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jCzM07UC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93DF10E844
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771021959; x=1802557959;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=+Wfllh3YrLx02QhuAMdSgWibTqpwnI+OyR/YmPndORg=;
 b=jCzM07UCBgnUqs8DVmGJoJgdbAlUh+j19agGwUzqcTJOk2uWitcOk61n
 3rcl+eAvNiheb2ldF1RkChngT1/QwAbXs6jHYIpxhHmVj08sC3iRErvSW
 GFc1+LZaF2NDi9eGizKw6ZPghBoU3PlyS5ivHVj5BauLncPbdfYyQYWqL
 VWm20JIpTrH9faKzZz6LpOZGiPSOUkmF5MAgrWCRwqk9oCUR+3SDeAoii
 cDipQlJbPYMbGGR+VCX7v7+Q4JJ3NJcDcNbX1cibPwSkWBi7/haZyRWVG
 SvbV+AdNZC0ITf7OHWizqhrJFwLtpynE94B5rZGIQAe7rb70sFWmkkkoj Q==;
X-CSE-ConnectionGUID: vdYYMGXvS0CX2CTE/bdyMQ==
X-CSE-MsgGUID: mqOUWFcFRSiYpnm5VLBuGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83654446"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="83654446"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:37 -0800
X-CSE-ConnectionGUID: 0Vxi+uDpQe+m+MeG1NNm4w==
X-CSE-MsgGUID: M0Nj6SK3SJymfiTUT5hx/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211705674"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 13 Feb 2026 14:31:53 -0800
Subject: [PATCH 18/22] drm/xe: Consolidate workaround entries for
 Wa_14019988906
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-forupstream-wa_cleanup-v1-18-961f2dd3a8e9@intel.com>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
In-Reply-To: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1948;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=+Wfllh3YrLx02QhuAMdSgWibTqpwnI+OyR/YmPndORg=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpj6aDDJl86iG82bD2dcLoS3h5e+FnSp65UUT3z
 4vdrT1nfn6JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaY+mgwAKCRBNeSQFyHKQ
 BOylEAClulvuENiNNXhKeBaTXIK+HXYu3rGKGuaLnV8StoCUBfq1z5GxbJqG1W4+tVpwmLON4uX
 E16nicDHtL6SYUB5tEBz/w3OYWUexCmPSoVbKt6zaQW6x7+w4PUt/gjXasIAnREON5SGNdTzbOW
 Q1/gKNaXtUTiHlRGJ60QejVCO3Y1dLD2w3zXeyA2y4fo0DSbI8wgvW3sS7r6E1DK3bE6XyWKJ9F
 RPmGR/vd2OnWQLx0Z5tIJZYpxe1hsVhniH0Ayx4I/2/EBLic8D3IpQF1XmMYdhg+CzFzgKiIzmU
 b3QfCJAa5BuXmSBfWEAb4SoUVB79PHgVn9wm3ada18ooxCvoA+IJ52Ph1j9MS7nJIOk1gQYtt1q
 IHyuf2pAGvk+mD6u4NINwgI0qAXPi4XfxrrwpZfUpAAI9moFUq6SzFPCNC5YEBwe2zbiwIB0h5E
 UgR4W58FGSkM335GlT/hGBB67lo8k5jWR5W6c3z89CtsPJR0/0HpGoBm+va+ze2FLdTmZVKsZYa
 LNNp6AXleLrVx3In5pJ4byDPfUxRs+bEYH26Ea7eQNGhuJnPTcyAn/X7yySDT40Lh4rSqTmmmwN
 GmibteABhIRKD6nBU79odQCGsxyJU/VCjyVre5BfCrtVFh6McrjOHuAAmG44tY+vu22SB84FSmp
 8iFcbEUVfU7fPbg==
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
index 63403ebfa2a6efad6e589dcd71b397f17a83c3e2..099493c660943d3e46bb404e199dcfbf9f71be92 100644
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

