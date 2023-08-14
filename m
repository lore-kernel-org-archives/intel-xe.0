Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADB9C001E0
	for <intel-xe@archiver.kernel.org>; Mon, 14 Aug 2023 15:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED1A10E211;
	Mon, 14 Aug 2023 15:03:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A724410E211
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Aug 2023 15:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692025415; x=1723561415;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F4lRdpeZHyMrOW8VEKlYk/JAJoU+HmUZi3Gs4hfLZBw=;
 b=VzEnh1CFyDamf8j291BcyU5MNxM5PSb/Ib8BX4bGKeO8ap6ObeRIv0ln
 1DHOMbAAX8vgpOSrW2NS+hZaOXQvvCt/WQA5XEpAhdmkkDVx1SfFVDLh5
 OIl4e/m+Xo8tDBibJZuCcOvw+FZzODAyJbdfpPA7HxuQt9f5cAvHu7ArM
 isSxNlhb+SzI/a7xtnLH1PqB4+ytslG52IkNVLxsVCI4lvkBuCZUoybg4
 mOyO7VVpICnWNiKrxlte4hwTxBjI7v4Ru+iJsTmxZbi3JZ6zqBCclwt63
 7oCQGSaT9Vssff4glVOvOAlo0Kd81FLpcV2jTwat09haL5rYJRnqSsxiq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="438390398"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; d="scan'208";a="438390398"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 08:03:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="736544560"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; d="scan'208";a="736544560"
Received: from shekharc-desk.iind.intel.com ([10.190.239.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 08:03:33 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 14 Aug 2023 20:33:23 +0530
Message-Id: <20230814150323.874033-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/dg2: Remove Wa_15010599737
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

Since this is specific to DirectX, we don't need it on Linux.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 ---
 drivers/gpu/drm/xe/xe_wa.c           | 4 ----
 2 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index c93d8f8cd93a..7590990599e6 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -90,9 +90,6 @@
 #define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900 + (_idx) * 4)
 #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
 
-#define CHICKEN_RASTER_1			XE_REG_MCR(0x6204, XE_REG_OPTION_MASKED)
-#define   DIS_SF_ROUND_NEAREST_EVEN		REG_BIT(8)
-
 #define CHICKEN_RASTER_2			XE_REG_MCR(0x6208, XE_REG_OPTION_MASKED)
 #define   TBIMR_FAST_CLIP			REG_BIT(5)
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 5cf84a096302..e2b6e17d7ec4 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -599,10 +599,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_ACTIONS(SET(XEHP_PSS_MODE2,
 			     SCOREBOARD_STALL_FLUSH_CONTROL))
 	},
-	{ XE_RTP_NAME("15010599737"),
-	  XE_RTP_RULES(PLATFORM(DG2)),
-	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN))
-	},
 	{ XE_RTP_NAME("18019271663"),
 	  XE_RTP_RULES(PLATFORM(DG2)),
 	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
-- 
2.34.1

