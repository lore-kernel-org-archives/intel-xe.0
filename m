Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F749C761A6
	for <intel-xe@archiver.kernel.org>; Fri, 10 Mar 2023 22:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC51810EA2C;
	Fri, 10 Mar 2023 22:16:31 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E5510EA1E
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Mar 2023 22:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678486588; x=1710022588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zBVDJoexFfM5pKz53yQPWuGBIvBnY/9cy4HjBT2gIX0=;
 b=dyu+LA6uHE04KNQhKJ9T5XxWn5meQ7HGz/1sZ+x6Aw2ALlw4DeR4lrRW
 eV/SDctsETzXBDa9rv9FGalrbffmKcg7JjvRtzbZ6bFFkMASTCMY9jzLZ
 vuP+StWvCTL3KqzP0f+ZzJ0OmM+Xhbmkb/J3Pspol/UsjJG/Bi5bx2YGT
 iVpniKCqMLJMDw+o4WN1jtpQGAez37Rjr/F82FivxznTTUEiuemh3Cypg
 K/p3nRPBsANENjySaGHrH1bhwwHqWeTAsKeA++qkDq12V+l53mIYxLmah
 iwuVNDJEPIK/85Ngj3ZFiPFlvqRJDX57g+u4zCbMBlVx8JyGXpL1Lpsrf w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="423106179"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="423106179"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 14:16:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="821234963"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="821234963"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 14:16:23 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Mar 2023 14:15:43 -0800
Message-Id: <20230310221549.2337402-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230310221549.2337402-1-lucas.demarchi@intel.com>
References: <20230310221549.2337402-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 06/12] drm/xe: Reorder WAs to consider the
 platform
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Now that number of platforms is growing, it's getting hard to know the
workarounds for each platform. Split the entries inside the same table
so the workarounds checking IP version are listed first, followed by
each platform. Next step when it grows too much is to split in smaller
tables.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 85 ++++++++++++++++++++++----------------
 1 file changed, 50 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 76c603dfc030..26b94d580e56 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -99,6 +99,24 @@ static const struct xe_rtp_entry gt_was[] = {
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
+	{ XE_RTP_NAME("14011059788"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
+	  XE_RTP_ACTIONS(SET(GEN10_DFR_RATIO_EN_AND_CHICKEN, DFR_DISABLE))
+	},
+
+	/* DG1 */
+
+	{ XE_RTP_NAME("1409420604"),
+	  XE_RTP_RULES(PLATFORM(DG1)),
+	  XE_RTP_ACTIONS(SET(SUBSLICE_UNIT_LEVEL_CLKGATE2, CPSSUNIT_CLKGATE_DIS))
+	},
+	{ XE_RTP_NAME("1408615072"),
+	  XE_RTP_RULES(PLATFORM(DG1)),
+	  XE_RTP_ACTIONS(SET(UNSLICE_UNIT_LEVEL_CLKGATE2, VSUNIT_CLKGATE_DIS_TGL))
+	},
+
+	/* DG2 */
+
 	{ XE_RTP_NAME("16010515920"),
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G10),
 		       STEP(A0, B0),
@@ -162,47 +180,15 @@ static const struct xe_rtp_entry gt_was[] = {
 	  XE_RTP_RULES(PLATFORM(DG2)),
 	  XE_RTP_ACTIONS(CLR(GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE))
 	},
-	{ XE_RTP_NAME("14011059788"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
-	  XE_RTP_ACTIONS(SET(GEN10_DFR_RATIO_EN_AND_CHICKEN, DFR_DISABLE))
-	},
-	{ XE_RTP_NAME("1409420604"),
-	  XE_RTP_RULES(PLATFORM(DG1)),
-	  XE_RTP_ACTIONS(SET(SUBSLICE_UNIT_LEVEL_CLKGATE2, CPSSUNIT_CLKGATE_DIS))
-	},
-	{ XE_RTP_NAME("1408615072"),
-	  XE_RTP_RULES(PLATFORM(DG1)),
-	  XE_RTP_ACTIONS(SET(UNSLICE_UNIT_LEVEL_CLKGATE2, VSUNIT_CLKGATE_DIS_TGL))
-	},
 	{}
 };
 
 static const struct xe_rtp_entry engine_was[] = {
-	{ XE_RTP_NAME("14015227452"),
-	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
-	},
-	{ XE_RTP_NAME("1606931601"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(GEN8_ROW_CHICKEN2, GEN12_DISABLE_EARLY_READ,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
-	},
 	{ XE_RTP_NAME("22010931296, 18011464164, 14010919138"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(1200), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(GEN7_FF_THREAD_MODE,
 			     GEN12_FF_TESSELATION_DOP_GATE_DISABLE))
 	},
-	{ XE_RTP_NAME("14010826681, 1606700617, 22010271021"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
-	},
-	{ XE_RTP_NAME("18019627453"),
-	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
-	},
 	{ XE_RTP_NAME("1409804808"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(1200),
 		       ENGINE_CLASS(RENDER),
@@ -217,6 +203,24 @@ static const struct xe_rtp_entry engine_was[] = {
 	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4, GEN12_DISABLE_TDL_PUSH,
 			     XE_RTP_ACTION_FLAG(MASKED_REG)))
 	},
+	{ XE_RTP_NAME("1606931601"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(GEN8_ROW_CHICKEN2, GEN12_DISABLE_EARLY_READ,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("14010826681, 1606700617, 22010271021"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("1406941453"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, ENABLE_SMALLPL,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+
+	/* TGL */
+
 	{ XE_RTP_NAME("1607297627, 1607030317, 1607186500"),
 	  XE_RTP_RULES(PLATFORM(TIGERLAKE), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(RENDER_RING_BASE),
@@ -224,6 +228,9 @@ static const struct xe_rtp_entry engine_was[] = {
 			     GEN8_RC_SEMA_IDLE_MSG_DISABLE,
 			     XE_RTP_ACTION_FLAG(MASKED_REG)))
 	},
+
+	/* RKL */
+
 	{ XE_RTP_NAME("1607297627, 1607030317, 1607186500"),
 	  XE_RTP_RULES(PLATFORM(ROCKETLAKE), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(RENDER_RING_BASE),
@@ -231,9 +238,17 @@ static const struct xe_rtp_entry engine_was[] = {
 			     GEN8_RC_SEMA_IDLE_MSG_DISABLE,
 			     XE_RTP_ACTION_FLAG(MASKED_REG)))
 	},
-	{ XE_RTP_NAME("1406941453"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, ENABLE_SMALLPL,
+
+	/* DG2 */
+
+	{ XE_RTP_NAME("14015227452"),
+	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("18019627453"),
+	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
 			     XE_RTP_ACTION_FLAG(MASKED_REG)))
 	},
 	{}
-- 
2.39.0

