Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAEFC76195
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 00:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D7F10E6AD;
	Tue, 14 Mar 2023 00:30:48 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61CD10E6AA
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 00:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678753846; x=1710289846;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZkEeBM2hxsu29X3EhRT1Kr3nE0ovD1YolbL3vCAsPdc=;
 b=lRifWMSMgSB0ILN+wyWWJzLuWyxfZjKgs9pLhQL41Tl8eT3zqLSImbId
 09lFnJdzeTPgUc9tbtJP6qGb3PBcbuokb85YZ+UWmzO+SQtdwwTUk7LXF
 9DAi8t2M+GR13Yb4G1Vglwf7IUXdgIGEoBXCWrZNqIbhYTJqA6vZkGTxW
 MZ4POJjyF8YOyTGTnMBxXuPyNyuU3OPf8OSPCYnZ0D6PpEA34tk+leVJN
 1ANVwmz7hxRfPvfG5/L8gln7RuWZWoo508i3/9nhMyDEaY/mi1oD/i5gm
 aItstlFJR1L5Wkb/GfSjoG2ZRmvoI2DZzs9CWnfoVxGAkkFg54DmjFlRV w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="402168034"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="402168034"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 17:30:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="789116707"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="789116707"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 17:30:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 17:30:08 -0700
Message-Id: <20230314003012.2600353-11-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230314003012.2600353-1-lucas.demarchi@intel.com>
References: <20230314003012.2600353-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 10/14] drm/xe: Add missing DG2 lrc tunings
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
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  7 +++++++
 drivers/gpu/drm/xe/xe_tuning.c       | 20 ++++++++++++++++++++
 2 files changed, 27 insertions(+)

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
index 47b27dccb385..7ff5eb762da5 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -35,6 +35,26 @@ static const struct xe_rtp_entry lrc_tunings[] = {
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
 	{}
 };
 
-- 
2.39.0

