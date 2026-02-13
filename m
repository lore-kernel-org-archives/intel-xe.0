Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7841FEF99E8
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 22:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122ED10E84D;
	Fri, 13 Feb 2026 22:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AKEPPwY5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895C310E845
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 22:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771021958; x=1802557958;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=hl/B/YOF9tSbCuDk2vfA7Pdm2q0FLXqr5IcLxIM0qEg=;
 b=AKEPPwY5ZrNi6NIr5k4+yolpfephVIKGj4mA1KHg2d+X+tn1tdxjwJD3
 v5tID3fvQYu4lepOAuvoLWN8NxZQsHN659htRsbOU+lfkPygnvCFJQY79
 hyxexfBuUy2Do40Gs5qN0BwUW2Y9DVfHArTvrs9RoZP4JTJ3OalP8glIk
 19PQBvRmfK9EtbM5+fMWYitJGdVPtcGo5Mg9RoHVoU7PQBgegQTdTbQUh
 Fg8J+b3uF2PQ2SV+uHAjRzH/zuOQ58wo+f7Z4FkvBeo8MDi5dPLSRCBu5
 ayrD8D+8b7C1FiVdjLYg8Jb/TcG2G9D4bvPmSbmzLIZnpnLhWsJItN1AJ Q==;
X-CSE-ConnectionGUID: iWA9sZvRQQG0oMqLtmGuNA==
X-CSE-MsgGUID: 3Cf3E28jTq67RGQZaJA5QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83654444"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="83654444"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:37 -0800
X-CSE-ConnectionGUID: EifnteuySnC6yZseeN7TAA==
X-CSE-MsgGUID: Ef+a/9c4Q32PunPgqlUgBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211705668"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 14:32:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 13 Feb 2026 14:31:51 -0800
Subject: [PATCH 16/22] drm/xe: Consolidate workaround entries for
 Wa_14019877138
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-forupstream-wa_cleanup-v1-16-961f2dd3a8e9@intel.com>
References: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
In-Reply-To: <20260213-forupstream-wa_cleanup-v1-0-961f2dd3a8e9@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2931;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=hl/B/YOF9tSbCuDk2vfA7Pdm2q0FLXqr5IcLxIM0qEg=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpj6aD5hgavyNQlWj5UD8g8Gwf7Ka3Cx/WVREOV
 ZPqzxpju0yJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaY+mgwAKCRBNeSQFyHKQ
 BOfZEACvynxWifU5YItsog+EKnVGHpgwBtMQXMfBVQ4B01iuW04Mr4ZPrVadyj6/6WapZA8MQs4
 e5f6MWEE48orDRCnEOFl0UBWSMqlKGZktd/12w7IX/saQKPXVZq7rayCTWq2ez+tCectz+tBmJS
 RCjb9eHWrANNR/+B+YY0sM6zHl6FwGPHwKd/pQ1ueWtJGfTydOy7y6idnjc7OG1fQwlsypU/LaG
 KZ2+rvimFCwMj3E22FpOmBOcTUazvwqAe3AhUmXw5crK89bJuLaQHM8JoUnBh5wJbJP3xqxqI0O
 pVtR476DcVE6tFyW8Em8QqrDKV2+4CB01HIwJwmeP3WhgI13K5E++F6Nw/HKwpFtcrtTJFOhA+x
 xwnlqQRwfyr+xEP8KgLnGco7itcpJaek3BveHObF+U/eTOAewyWdVT1IbNh8OGgYlxooK3yCu9k
 r48LIo7hNhvg6q0mtaQhcqZvGWpQJQP5CYVMiDF0zYPflio+AfLZXfyhWX72lkybCRHVM6PmmJj
 0GpfPSQENU7af0oYgiTXAnc8ED0jGAvPtM+PeEPvvdFVXqNJiY9ihbA08nB+GwECfhd48QYi0fX
 JWs08FkkkdUvpee0q19wjyBl9T5JsskVVt4z/04woO0JPUpuFe/6HusRzi2+fYABNRzSAzndX1z
 2pIhYOhYdieealA==
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
index 52066e9e7dcfcc3e8ff1b8c5eb40430da1d247f4..af1cbdc1d273576ba4500e5b863f26133447c7fc 100644
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

