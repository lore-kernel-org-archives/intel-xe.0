Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F82FC87FCA
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 22:02:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CC510E2C8;
	Thu, 31 Jul 2025 22:02:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jo+CbiY8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3A710E2C8
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 22:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753999332; x=1785535332;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o3h83R79o8GpD6PAikfspyk+LlaXz4XMrPI8yTdcMt8=;
 b=Jo+CbiY8dsSvdPKExAFwA7+mRRIvtlmzTjqHZx7QOJySIL3KEEM8CqiV
 +/0G48NAzvcSXTGNm+5Y2QvlbIicAmCcIWb+ql4iNlx0kgi9TEXU4N3Wr
 7VD1vKpPmMCYhAmHvKRAhPIuD9uF3cYuh0d/Y+BTcQs087oj4+a+SvgNp
 fHmA/Ui9n2bYB35E/7DPATe0oIcVPzs1EjXxX6xc86v3mdD+3dtPceQS6
 VYS9gVkv+A3T1doy9b9jPqjPI9WnWnv6b3pSDAEeTlA5l5PRZDfn1MuPG
 hpLiZ9GUH4tnIyy0EKyiAZpq5AFw0Ix/QYXpd4sb1DpwL6AJ67+AYumCB g==;
X-CSE-ConnectionGUID: sJQqXW+NQi2jwAi3sPuBhQ==
X-CSE-MsgGUID: CM29+5PoTxmDx5ay1nFRgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67785641"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="67785641"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 15:01:47 -0700
X-CSE-ConnectionGUID: /FoG+7O7ReWZVvlR7IzsOQ==
X-CSE-MsgGUID: brHodbKlTMu5oGaizlzasw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="167605324"
Received: from dut4086lnl.fm.intel.com ([10.105.10.26])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 15:01:45 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 tilak.tirumalesh.tangudu@intel.com, matthew.d.roper@intel.com,
 michal.wajdeczko@intel.com, rodrigo.vivi@intel.com
Subject: [PATCH] drm/xe: Extend wa_13012615864 to additional Xe2 and Xe3
 platforms
Date: Thu, 31 Jul 2025 22:01:44 +0000
Message-ID: <20250731220143.72942-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Extend WA 13012615864 to Graphics Versions 20.01,20.02,20.04
and 30.03.

Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 22a98600fd8f..535067e7fb0c 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -538,6 +538,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
 	},
+	{ XE_RTP_NAME("13012615864"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
+	},
 
 	/* Xe2_HPG */
 
@@ -602,6 +607,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, STK_ID_RESTRICT))
 	},
+	{ XE_RTP_NAME("13012615864"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
+	},
 
 	/* Xe2_LPM */
 
@@ -647,7 +657,8 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE))
 	},
 	{ XE_RTP_NAME("13012615864"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), OR,
+		       GRAPHICS_VERSION(3003),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
 	},
-- 
2.43.0

