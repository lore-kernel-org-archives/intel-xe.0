Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F9BE7FDF0
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 21:44:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803FF10E3DB;
	Mon,  2 Feb 2026 21:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hATJE3dL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85DB10E479;
 Mon,  2 Feb 2026 21:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770068658; x=1801604658;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=MGU9U7uvYMu8jXWvNVdBp/FV0SH2J7+u1AqUWTyIKPc=;
 b=hATJE3dL6t4u+560oB4yAniS31+OqF+vNOrsNTrhv3HexC6pfE0TavXP
 RCDuRG4zqQYdnU+thmZPwdmxFSsDWEX1l7xrVqngcY9W7+LNUefUVlj9m
 +i2Xxn0noaQbuXzyQJ3c0dgDZ4UeLgv6h3MyvP1pgWjj5mzkoTxYJ7z8l
 +XL7okki8jQKodO1LS+EVSX7mDNJnZWknH1ca3xGbrklgEA95/PsCISjU
 yJtxxIbBTy9x/4WI551nNlbo/8K7c8g8fkLN+CnWi2UQamtb+UsP5EsMo
 7/Uo1CD3suxlDbz4SkjQmg2SvE/d/K0Eh4g0fXJDEJlc4chvmJB5fD7Nj g==;
X-CSE-ConnectionGUID: z5mJph5hS7uXWWQdvHaN5Q==
X-CSE-MsgGUID: 9RXIISNEQqqbsQvsOetBlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="58814347"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="58814347"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:44:17 -0800
X-CSE-ConnectionGUID: i+g52pwBTs6/x3OX3xsajw==
X-CSE-MsgGUID: N8JWbuI+TTyfk3YMOFb+/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="209646851"
Received: from smoehrl-linux.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.51])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 13:44:16 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 02 Feb 2026 18:43:14 -0300
Subject: [PATCH 08/16] drm/xe/xe3p_lpg: Drop unnecessary tuning settings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-nvl-p-upstreaming-v1-8-653e4ff105dc@intel.com>
References: <20260202-nvl-p-upstreaming-v1-0-653e4ff105dc@intel.com>
In-Reply-To: <20260202-nvl-p-upstreaming-v1-0-653e4ff105dc@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
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

From: Matt Roper <matthew.d.roper@intel.com>

From Xe3p onward, the desired settings are now the hardware's
default values and the driver does not need to program them explicitly.

Since 35.xx seems to be the starting point for "Xe3p" version numbers;
we'll adjust the bounds of the old programming to stop at 34.99.  Even
though there's no platform with version 35.00 at the moment, this is
simplest in case one does show up in the future.

Bspec: 72161, 59928, 59930
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_tuning.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index a97872b3214b..694385ae75f1 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -32,12 +32,12 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 	/* Xe2 */
 
 	{ XE_RTP_NAME("Tuning: L3 cache"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 3499)),
 	  XE_RTP_ACTIONS(FIELD_SET(XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
 				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
 	},
 	{ XE_RTP_NAME("Tuning: L3 cache - media"),
-	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, 3499)),
 	  XE_RTP_ACTIONS(FIELD_SET(XE2LPM_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
 				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
 	},
@@ -53,7 +53,7 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 			 SET(XE2LPM_CCCHKNREG1, L3CMPCTRL))
 	},
 	{ XE_RTP_NAME("Tuning: Enable compressible partial write overfetch in L3"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 3499)),
 	  XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
 	},
 	{ XE_RTP_NAME("Tuning: Enable compressible partial write overfetch in L3 - media"),

-- 
2.52.0

