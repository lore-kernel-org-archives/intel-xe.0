Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789E7E77347
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 23:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C1610E0F7;
	Fri, 29 Sep 2023 23:03:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E5B10E0F7
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 23:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696028625; x=1727564625;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xqPlZeFBPkriAmBivebf7daeumgeCNdT2fDAPz46x+U=;
 b=mTOm7/uktoccd5RMy9hNCURhxveAl1MKFBG6ylWwhqILEkwMctEZEua3
 QoSb7XuCxUSeR91a5iYKAPULp6fDnP1KcTeDIX9jK3HK7t2iQPd34RB8m
 HTrUsVh5nH9l2lmdvw+a2eQ/diEuCUwjzTqLqHj4Ob4yivJPvZwn2e+ug
 lH5E0n/8U5CuWjMGBpxNhl3r+DVu3JISsFeuKkJhKnPzgjp9V02DHoN/g
 Z6dulNLmo5uZLPT+E3Ghf+/cSLWGuSvpsgeVMGi5J61HxiPQVGiaCrSep
 ORHINGO4XUvGL3DD5khhCPTy5WMbUchY60wgaq73Dsg1KrbCgKtH+S/Z4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="3970731"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="3970731"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 16:03:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="997071405"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="997071405"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 16:03:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 29 Sep 2023 16:03:33 -0700
Message-ID: <20230929230332.3348841-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/tuning: Add missing engine class rules
 for LRC tuning
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The LRC tuning settings we have today are modifying registers that are
part of the RCS engine's context; they're not part of the general CSFE
context that would apply to all engines.  Add ENGINE_CLASS(RENDER) to
the RTP rules to properly restrict these to the RCS.

Bspec: 46255, 46261
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_tuning.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 412e59de9842..08174dda9bc7 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -29,7 +29,7 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
 
 static const struct xe_rtp_entry_sr lrc_tunings[] = {
 	{ XE_RTP_NAME("Tuning: ganged timer, also known as 16011163337"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
 	  /* read verification is ignored due to 1608008084. */
 	  XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(FF_MODE2,
 						FF_MODE2_GS_TIMER_MASK,
@@ -39,19 +39,19 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
 	/* DG2 */
 
 	{ XE_RTP_NAME("Tuning: L3 cache"),
-	  XE_RTP_RULES(PLATFORM(DG2)),
+	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(FIELD_SET(XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
 				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
 	},
 	{ XE_RTP_NAME("Tuning: TDS gang timer"),
-	  XE_RTP_RULES(PLATFORM(DG2)),
+	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
 	  /* read verification is ignored as in i915 - need to check enabling */
 	  XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(XEHP_FF_MODE2,
 						FF_MODE2_TDS_TIMER_MASK,
 						FF_MODE2_TDS_TIMER_128))
 	},
 	{ XE_RTP_NAME("Tuning: TBIMR fast clip"),
-	  XE_RTP_RULES(PLATFORM(DG2)),
+	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP))
 	},
 	{}
-- 
2.41.0

