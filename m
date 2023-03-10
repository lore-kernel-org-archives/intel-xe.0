Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF1DC74A4B
	for <intel-xe@archiver.kernel.org>; Fri, 10 Mar 2023 22:16:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D6F10EA1C;
	Fri, 10 Mar 2023 22:16:30 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACB710EA1B
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Mar 2023 22:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678486588; x=1710022588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NG67A/b1p6svo5/5q/fTgxs0K+CQQtB35mdchOyNjro=;
 b=HjEhekw/uAUBrGB+JRe4U1T3ioDIPUc3gLCTs6DgVUDMrDc/hXDn35Jp
 D0sVXxspkU9emzwD1Ji6yuCfblPw2lUD29IwfIsGCKZyYZb6YtLzQZWYj
 GHDBhTZuwyxRNUuKr5fkaKMw+zZfmIm93x6c1YSibTSN+UhTPfo7B3r++
 Henrib3ZezkQQY6oVHcv/bIB1yeXR1Tsmq2FFM3tjzvwdqzi0LGq98sjG
 ucCxBACCgcPVmNBlHF/jffoWUQJ2aSug35ImD9N782vu1QrBXdCiIAAjb
 J2sycUeNhBRyyfNSOQ3nzfBjw24gYZOws3ALqWyUEusA/IR+L+qCZkxxl g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="423106171"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="423106171"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 14:16:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="821234969"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="821234969"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 14:16:23 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Mar 2023 14:15:45 -0800
Message-Id: <20230310221549.2337402-9-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230310221549.2337402-1-lucas.demarchi@intel.com>
References: <20230310221549.2337402-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 08/12] drm/xe: Add PVC engine workarounds
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

Sync PVC engine workarounds with i915.

v2: Remove 16016694945. It was added by mistake. It's a GT workaround,
already present in the GT table (Matt Roper)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  9 +++++++++
 drivers/gpu/drm/xe/xe_wa.c           | 22 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)

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
index 853c8b602cbd..03663bf98bf0 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -270,6 +270,28 @@ static const struct xe_rtp_entry engine_was[] = {
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

