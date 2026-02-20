Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB2CC5AD44
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:28:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E53010E82A;
	Fri, 20 Feb 2026 17:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SybzQDWI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9772E10E824
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608497; x=1803144497;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=i+iDKd2E/WBfjunklcJQCnNzLahWfKBBZnD15CcXFmA=;
 b=SybzQDWI99kwTGbyAVP5V8s6V26RxnhYE++rezbIMvXjFgddPMXDbC0v
 Y+XLHRmOdwFt4iuEr3Gn5tCVxGtgHI+fKNos1PHV2AFDbCIPsyiDTqqlU
 ghVH/xUyvempre7ri0zHfNg+nxxiv/X9ao+zSR8WtPJvuVPf7ZEdxe8A9
 k/lxtEAGFU7uo/PmkNHYYQnuye4jPqQZUa3cwE+FFPkNgtayV57Fudifn
 v1ifI+vs/5NXV3RrMiz7Fe3SW2rjL4ouPoEkWOzn1UoHbJ/x2nJGStZtG
 Tn2EdAq1QxE6orC/3Nj4fHjbkdw8hv2OdDtjuysIoObhIM6TKCi4phMkA w==;
X-CSE-ConnectionGUID: dx6DRxwqT66wBWhrLvDg2w==
X-CSE-MsgGUID: R+QAmGmkRNSzIumUamBqoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606735"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72606735"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:16 -0800
X-CSE-ConnectionGUID: yLUNIemzQnGzAgrAtl1dpg==
X-CSE-MsgGUID: do/hwGw/S7KjJ92/IiPW6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214138691"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 20 Feb 2026 09:27:30 -0800
Subject: [PATCH v2 08/23] drm/xe: Consolidate workaround entries for
 Wa_18032247524
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-forupstream-wa_cleanup-v2-8-b12005a05af6@intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2454;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=i+iDKd2E/WBfjunklcJQCnNzLahWfKBBZnD15CcXFmA=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpmJmtO8ZeciHWoPPUzQFQVytKANF1tWXIKH1dZ
 FMXWCfL2f+JAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZiZrQAKCRBNeSQFyHKQ
 BAmLD/4i17Mbe4Z/ANVqmq1Zpjm8wiroeeuhyWec/7wYAxmLDZrKdCWhOORSMt7P7UzkOcCSMIl
 lhYZlrFRrT2vLuKkno8uRzJ4yPKCg9XmdDgcIARmHJHgrxWW9KupRQDNCH3sy9Hqz/S/LuPfQ/B
 8PDz1Etv0oIwN08mY06frgfA08pUbu9ZE7VgTTsSptIMCjjR/sUR7SxjXxrFof4k2hjqPA3JyXL
 w7AjOcPoPp2NWUxAt2ywaNNg4Ib6LcczYFzedbtGcu+P4FPqk18Iy6VU9DpEQpCvNGxl/aHhWRf
 YQtUH+BE58ar3SC9PRCoyi2h4Xcu5KkH79h9o7RwOoTByM8NLtsfx7aTBH54tGESIvsEEhTUlgO
 2T2o8e98T9elLSI9Hr7Xg5q9B5CKhUY4AJU/d7l01olYHPqPyVJUJFjAprvnStX8Z2zIGq6Aj7I
 NO9bqxcXo+2NPlycs+Ag+pwjcH7HTQxpVAekarpygbpAL2VmSZQP/kHr2Cmjben1e5QGswODKqZ
 3P5ZHjAYhKsMdC1J/YZvfvvE5YjMgFO6yW9ylnagrhbSi4qRYuItDHTCVZ297fr9sZon1qfWrXK
 4dH3pY3c1jUbeKKJZdkXp6lD9Bw1AH2IGl8WXHIAtlJqxVfBM6igqzRLv7BgT/9EZxRQUr789pa
 LF4LgujW84SIHfA==
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

Wa_18032247524 applies to all graphics versions from 20.01 through 20.04
(inclusive).  Consolidate the two RTP entries into a single range-based
entry.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 092d46f48165d17b0ab4bf2a7e4550b97e137aad..a483a76c7665eba1c6a87a18bab1a31d11a01f4d 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -306,6 +306,8 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 };
 
 static const struct xe_rtp_entry_sr engine_was[] = {
+	/* Workarounds applying over a range of IPs */
+
 	{ XE_RTP_NAME("22010931296, 18011464164, 14010919138"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(1200), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(FF_THREAD_MODE(RENDER_RING_BASE),
@@ -341,6 +343,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN1(RENDER_RING_BASE),
 			     FFSC_PERCTX_PREEMPT_CTRL))
 	},
+	{ XE_RTP_NAME("18032247524"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, SEQUENTIAL_ACCESS_UPGRADE_DISABLE))
+	},
 
 	/* TGL */
 
@@ -478,11 +485,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 
 	/* Xe2_LPG */
 
-	{ XE_RTP_NAME("18032247524"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, SEQUENTIAL_ACCESS_UPGRADE_DISABLE))
-	},
 	{ XE_RTP_NAME("16018712365"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
@@ -551,11 +553,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
 	},
-	{ XE_RTP_NAME("18032247524"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, SEQUENTIAL_ACCESS_UPGRADE_DISABLE))
-	},
 	{ XE_RTP_NAME("14018471104"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
 		       FUNC(xe_rtp_match_first_render_or_compute)),

-- 
2.53.0

