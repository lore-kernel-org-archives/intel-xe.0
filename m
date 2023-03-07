Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7053EC74A4B
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 09:25:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502D710E40E;
	Tue,  7 Mar 2023 09:25:34 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1BB10E3CB
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 09:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678181130; x=1709717130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ufl+/9pe0QFrVgcwjRHZd9XXhguTYHszrEIeA91uzE0=;
 b=PT3V8hpn+8/lPbwJbLIAc3V1aAdIQ+RO9MQnTD9sv9pIL7bMEtGEFpsG
 5LI/UapA8d+ivBsUM0tG/rLTMmjjyg3vqHhqswPEGh1WGq8hZShJSJM0x
 z45kc/Q5cg5bYoyHXjIQ3tjWhqY4DhS7YH38dUMzQg9n50hPPYtA3L1+J
 Y62JcIje2ydx/i8tL4RGmUg7MBBHqg60Kj9gVtYhqAzQa3wcokEplJxS6
 1N66Q1skIMzu0RkI6lFbEucOutMxb/d/0jzmQjx3Gtoz0YXLT8PGNeP5Y
 eQggCHQRbB0y8RtXkDLKs9xAcdRdzzMFUPCw9rMT2VOSuhIwJBZW/IzD7 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="422079128"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="422079128"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005798836"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="1005798836"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:15 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  7 Mar 2023 01:24:42 -0800
Message-Id: <20230307092446.1263266-16-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307092446.1263266-1-lucas.demarchi@intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 15/19] drm/xe: Add PVC engine workarounds
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Sync PVC engine workarounds with i915.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  9 +++++++++
 drivers/gpu/drm/xe/xe_wa.c           | 27 +++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 1b39a209898b..ab9dd70c0534 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -43,6 +43,9 @@
 #define GEN7_FF_SLICE_CS_CHICKEN1		_MMIO(0x20e0)
 #define   GEN9_FFSC_PERCTX_PREEMPT_CTRL		(1 << 14)
 
+#define FF_SLICE_CS_CHICKEN2			_MMIO(0x20e4)
+#define   PERF_FIX_BALANCING_CFE_DISABLE	REG_BIT(15)
+
 #define GEN9_CS_DEBUG_MODE1			_MMIO(0x20ec)
 #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
 
@@ -230,6 +233,9 @@
 #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
 #define   GEN11_SAMPLER_ENABLE_HEADLESS_MSG	REG_BIT(5)
 
+#define CACHE_MODE_SS				MCR_REG(0xe420)
+#define   DISABLE_ECC				REG_BIT(5)
+
 #define GEN9_ROW_CHICKEN4			MCR_REG(0xe48c)
 #define   GEN12_DISABLE_GRF_CLEAR		REG_BIT(13)
 #define   XEHP_DIS_BBL_SYSPIPE			REG_BIT(11)
@@ -246,6 +252,9 @@
 #define   GEN12_PUSH_CONST_DEREF_HOLD_DIS	REG_BIT(8)
 #define   GEN12_DISABLE_DOP_GATING              REG_BIT(0)
 
+#define LSC_CHICKEN_BIT_0			MCR_REG(0xe7c8)
+#define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
+
 #define SARB_CHICKEN1				MCR_REG(0xe90c)
 #define   COMP_CKN_IN				REG_GENMASK(30, 29)
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 6498f187591d..6931efb3b7bf 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -275,6 +275,33 @@ static const struct xe_rtp_entry engine_was[] = {
 	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
 			     XE_RTP_ACTION_FLAG(MASKED_REG)))
 	},
+
+	/* PVC */
+
+	{ XE_RTP_NAME("22014226127"),
+	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, DISABLE_D8_D16_COASLESCE))
+	},
+	{ XE_RTP_NAME("16016694945"),
+	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(XEHPC_LNCFMISCCFGREG0, XEHPC_OVRLSCCC,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("14015227452"),
+	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("16015675438"),
+	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2, PERF_FIX_BALANCING_CFE_DISABLE,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("14014999345"),
+	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COMPUTE), STEP(B0, C0)),
+	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
 	{}
 };
 
-- 
2.39.0

