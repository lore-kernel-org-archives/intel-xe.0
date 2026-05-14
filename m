Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB1BCD4F41
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 21:45:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A31D10E601;
	Thu, 14 May 2026 21:45:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FGPrEHsd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2ADC10E5FC
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 21:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778795116; x=1810331116;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=NGI9H+VYACKdu1ch7RA7OC6vppvmU5+dSUUpR/pByeM=;
 b=FGPrEHsdAMgELGKr/n8rGvp5VOF3DQrMtwrxY2Q2YSfsbzXpt/5dM/0V
 Ccex9JuNJ6p13QIBdcmMbEafA0qg9eQvjPlxnmTfjd+VnXyeBGp1lyyHC
 02Dne1bpKane+Zvs+wkn0lSdVcDKtOp2n8Ppv7nQ1JLzPTGdHX9LaSHX3
 Y1vwF9ryoiFEIIFO2Wdv8fX/41q+7/7cXmNpq09nVpAgGg17r2LuBO9Md
 gTiwW5e5+LaZSAKA2bM8iSc8uYyeFSnevxHkTKipk/doewTKTi+OThi//
 VVVCs/WgNSjxzcjO5YJyWJqFriuhvAtPop7ite9xz/5QLW0zsYa/bT4xz w==;
X-CSE-ConnectionGUID: Xi9CgoDvSc+R1GWw0+z/6w==
X-CSE-MsgGUID: VgxfsWg4T++P0a70ZYCPsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="67277255"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="67277255"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 14:45:15 -0700
X-CSE-ConnectionGUID: Zkpp+FK+SKCABPkuwwet5Q==
X-CSE-MsgGUID: ASFtOqJVTMyb5HrunfkC0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="238613184"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.189])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 14:45:14 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 14 May 2026 18:44:45 -0300
Subject: [PATCH v3 2/7] drm/xe: Define and use MCR version of
 COMMON_SLICE_CHICKEN1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-rtp-mcr-check-v3-2-30dd47855fee@intel.com>
References: <20260514-rtp-mcr-check-v3-0-30dd47855fee@intel.com>
In-Reply-To: <20260514-rtp-mcr-check-v3-0-30dd47855fee@intel.com>
To: intel-xe@lists.freedesktop.org
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

The register COMMON_SLICE_CHICKEN1 is a MCR register on Xe2.
Let's make sure to define a MCR version of it and use it for the
relevant IP versions.

Use XEHP_ as prefix for the register name, since it is MCR as of Xe_HP.

Fixes: a5d221924e13 ("drm/xe/xe2_hpg: Add set of workarounds")
Fixes: 9f18b55b6d3f ("drm/xe/xe2: Add workaround 18033852989")
Bspec: 66534, 71185
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
 drivers/gpu/drm/xe/xe_wa.c           | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 408933aee08a..b21c66a1b777 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -156,6 +156,7 @@
 #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
 
 #define COMMON_SLICE_CHICKEN1			XE_REG(0x7010, XE_REG_OPTION_MASKED)
+#define XEHP_COMMON_SLICE_CHICKEN1		XE_REG_MCR(0x7010, XE_REG_OPTION_MASKED)
 #define   DISABLE_BOTTOM_CLIP_RECTANGLE_TEST	REG_BIT(14)
 
 #define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 49f5e3e4c7cc..d6f94486673e 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -664,7 +664,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	},
 	{ XE_RTP_NAME("18033852989"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
+	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
 	},
 	{ XE_RTP_NAME("15016589081"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),

-- 
2.53.0

