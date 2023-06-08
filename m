Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3A8C7EE25
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 18:12:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3813010E02A;
	Thu,  8 Jun 2023 18:12:25 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7135D10E101
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 18:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686247943; x=1717783943;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=89+1fFFYleSf1oG6yYVCzhLxdZQKoE9j0oIVJYCXPxI=;
 b=CD61BCTefO/DRiTs6Ei8ic6qyszTryTtEOEajLW2vmD8SZUjPEOpmqaM
 aVhdmV/jv75logiOHkpeqOgyr6ReI6VGDR9Aij8w/4EXYZS/24GQrDs64
 xHzXdtMQuvwMrjMzusHGM0gydpZQzzI7t3bVuZco81W0XaBDCtVD6rNEn
 JSIlPzZtyVTirqXtEaNR443U8ncWtvlTxuH6I5BS6WnA5/wIIhkFzonSf
 QdtNuipKZjeEi5pCiICsR1xi8ux4Z6L7z+RtZF6pIl31Gr1FrPh61qmtd
 u58Zatzxk0I5qVn29XpxrMCEIM5O2296gSq4qZDZ+b1dFlNUpusgI650b A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="385741899"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="385741899"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 11:12:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="739844895"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="739844895"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 11:12:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  8 Jun 2023 11:12:17 -0700
Message-Id: <20230608181217.2385932-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/mtl: Add some initial MTL workarounds
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

This adds a handful of workarounds that apply to production steppings of
MTL:
 - Wa_14018575942
 - Wa_22016670082
 - Wa_14017856879
 - Wa_18019271663

Wa_22016670082 is currently only applied to the primary GT at the
moment, but may need to be extended to the media GT in the future if a
pending update to the workaround database gets finalized.

OOB workarounds will need to be implemented separately in future patches
for Wa_14016712196, Wa_16018063123, and Wa_18013179988.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++++++
 drivers/gpu/drm/xe/xe_wa.c           | 31 ++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 0f920175526e..3f664011eaea 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -133,6 +133,9 @@
 #define VFG_PREEMPTION_CHICKEN			XE_REG(0x83b4, XE_REG_OPTION_MASKED)
 #define   POLYGON_TRIFAN_LINELOOP_DISABLE	REG_BIT(4)
 
+#define SQCNT1					XE_REG_MCR(0x8718)
+#define   ENFORCE_RAR				REG_BIT(23)
+
 #define XEHP_SQCM				XE_REG_MCR(0x8724)
 #define   EN_32B_ACCESS				REG_BIT(30)
 
@@ -268,7 +271,9 @@
 #define RENDER_MOD_CTRL				XE_REG_MCR(0xcf2c)
 #define COMP_MOD_CTRL				XE_REG_MCR(0xcf30)
 #define XEHP_VDBX_MOD_CTRL			XE_REG_MCR(0xcf34)
+#define XELPMP_VDBX_MOD_CTRL			XE_REG(0xcf34)
 #define XEHP_VEBX_MOD_CTRL			XE_REG_MCR(0xcf38)
+#define XELPMP_VEBX_MOD_CTRL			XE_REG(0xcf38)
 #define   FORCE_MISS_FTLB			REG_BIT(3)
 
 #define XEHP_GAMSTLB_CTRL			XE_REG_MCR(0xcf4c)
@@ -302,6 +307,9 @@
 #define   THREAD_EX_ARB_MODE			REG_GENMASK(3, 2)
 #define   THREAD_EX_ARB_MODE_RR_AFTER_DEP	REG_FIELD_PREP(THREAD_EX_ARB_MODE, 0x2)
 
+#define ROW_CHICKEN3				XE_REG_MCR(0xe49c, XE_REG_OPTION_MASKED)
+#define   DIS_FIX_EOT1_FLUSH			REG_BIT(9)
+
 #define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
 #define   UGM_BACKUP_MODE			REG_BIT(13)
 #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index e5b3ff669465..5eaa9bed9d12 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -236,6 +236,22 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)),
 	  XE_RTP_ACTIONS(CLR(MISCCPCTL, DOP_CLOCK_GATE_RENDER_ENABLE))
 	},
+	{ XE_RTP_NAME("14018575942"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
+	  XE_RTP_ACTIONS(SET(RENDER_MOD_CTRL, FORCE_MISS_FTLB),
+			 SET(COMP_MOD_CTRL, FORCE_MISS_FTLB))
+	},
+	{ XE_RTP_NAME("22016670082"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
+	  XE_RTP_ACTIONS(SET(SQCNT1, ENFORCE_RAR))
+	},
+
+	/* Xe_LPM+ */
+	{ XE_RTP_NAME("14018575942"),
+	  XE_RTP_RULES(MEDIA_VERSION(1300)),
+	  XE_RTP_ACTIONS(SET(XELPMP_VDBX_MOD_CTRL, FORCE_MISS_FTLB),
+			 SET(XELPMP_VEBX_MOD_CTRL, FORCE_MISS_FTLB))
+	},
 
 	{}
 };
@@ -502,6 +518,14 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       GRAPHICS_STEP(B0, C0)),
 	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC))
 	},
+
+	/* Xe_LPG */
+	{ XE_RTP_NAME("14017856879"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, DIS_FIX_EOT1_FLUSH))
+	},
+
 	{}
 };
 
@@ -580,6 +604,13 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_RULES(PLATFORM(DG2)),
 	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
 	},
+
+	/* Xe_LPG */
+	{ XE_RTP_NAME("18019271663"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
+	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
+	},
+
 	{}
 };
 
-- 
2.40.1

