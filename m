Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF4EC7618E
	for <intel-xe@archiver.kernel.org>; Fri, 10 Mar 2023 22:16:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B25A10EA28;
	Fri, 10 Mar 2023 22:16:31 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6E810EA1C
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Mar 2023 22:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678486588; x=1710022588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DxpNYf4yS+WYUqDlnUwFzXu1P80k0bgTQRDRpHNEpP4=;
 b=LZ4OEULKSPt34icJlT6gen5FmD9SsLrkDBXbrEtMsobPXXlxkLhcfhLv
 GHYgB1aOJ5ntB3yXirmzR+IzGsIv0Vrwl+v0+VrgUHvZF2Vp6CYJZLQwQ
 glhdsWyzu7HI+t1ZweW3h0ge6/CH+wVAOMhAU4i0CpB6Bu3NNy0dzuTN5
 7wi5sNQhns6SD4VNNDEqcIvktTrY+UCaouIGbJsB7hVz9BCLtbkACpPml
 r6lD/gOTN/8JiZxhcni5Tfzh3tIBlU/wE15I2kUQsPSRgzB6zs5VNjRph
 bXvNXP29a7ZvpwYywJ2jMOKaEmAuecC/Qxukbq9bSACm61Fl/2oCpSt9e w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="423106177"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="423106177"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 14:16:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="821234974"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="821234974"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 14:16:24 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Mar 2023 14:15:48 -0800
Message-Id: <20230310221549.2337402-12-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230310221549.2337402-1-lucas.demarchi@intel.com>
References: <20230310221549.2337402-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 11/12] drm/xe: Add missing DG2 lrc tunings
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

Synchronize with i915 the DG2 tunings as of
commit 4d14d7717f19 ("drm/i915/selftest: Fix ktime_get() and h/w access
order").

Contrary to the tuning "gang timer" for TGL, there is no quick
justification for why the read back is disabled in i915. Keep it
with that flag for now. That can be tentatively removed later when the
read values are checked.

v2: Use XEHP_FF_MODE2 instead of GEN12_FF_MODE2 (Matt Roper)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  7 +++++++
 drivers/gpu/drm/xe/xe_tuning.c       | 21 +++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 2600704ace0a..7a578672a818 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -73,7 +73,11 @@
 #define XEHP_TILE0_ADDR_RANGE			MCR_REG(0x4900)
 #define XEHP_FLAT_CCS_BASE_ADDR			MCR_REG(0x4910)
 
+#define CHICKEN_RASTER_2			MCR_REG(0x6208)
+#define   TBIMR_FAST_CLIP			REG_BIT(5)
+
 #define GEN12_FF_MODE2				_MMIO(0x6604)
+#define XEHP_FF_MODE2				MCR_REG(0x6604)
 #define   FF_MODE2_GS_TIMER_MASK		REG_GENMASK(31, 24)
 #define   FF_MODE2_GS_TIMER_224			REG_FIELD_PREP(FF_MODE2_GS_TIMER_MASK, 224)
 #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
@@ -228,6 +232,9 @@
 #define XEHP_L3NODEARBCFG			MCR_REG(0xb0b4)
 #define   XEHP_LNESPARE				REG_BIT(19)
 
+#define XEHP_L3SQCREG5				MCR_REG(0xb158)
+#define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
+
 #define XEHP_L3SCQREG7				MCR_REG(0xb188)
 #define   BLEND_FILL_CACHING_OPT_DIS		REG_BIT(3)
 
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 47b27dccb385..928453b4636a 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -35,6 +35,27 @@ static const struct xe_rtp_entry lrc_tunings[] = {
 						FF_MODE2_GS_TIMER_MASK,
 						FF_MODE2_GS_TIMER_224))
 	},
+
+	/* DG2 */
+
+	{ XE_RTP_NAME("Tuning: L3 cache"),
+	  XE_RTP_RULES(PLATFORM(DG2)),
+	  XE_RTP_ACTIONS(FIELD_SET(XEHP_L3SQCREG5, L3_PWM_TIMER_INIT_VAL_MASK,
+				   REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
+	},
+	{ XE_RTP_NAME("Tuning: TDS gang timer"),
+	  XE_RTP_RULES(PLATFORM(DG2)),
+	  /* read verification is ignored as in i915 - need to check enabling */
+	  XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(XEHP_FF_MODE2,
+						FF_MODE2_TDS_TIMER_MASK,
+						FF_MODE2_TDS_TIMER_128))
+	},
+	{ XE_RTP_NAME("Tuning: TBIMR fast clip"),
+	  XE_RTP_RULES(PLATFORM(DG2)),
+	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+
 	{}
 };
 
-- 
2.39.0

