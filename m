Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31015C61DA4
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 00:30:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D47610E6B0;
	Tue, 14 Mar 2023 00:30:47 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F0010E6AA
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 00:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678753846; x=1710289846;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s7vvuWtT4QR+cAEGmy/8Jc8kTWQKqjkE3GYLVTpJbg8=;
 b=JJvCCUQS4SWzA/tp+Ue20btANk8zuSw6gZxM8IYg3GchiythWyZvpwyf
 vRSa4ygx8WFBeR7ubt+kxzniZTXDXfEkb3IxskXxOPjsocTyHcnDNaa4M
 NU+Mk2g1JvbAH5NiISkZrV/JLfyAI5b+Gny2kdBa7rPKWRaFNT6IbpVHz
 JeS4j6muw8LlYzwemQRe1yWu8iE2VQ9MZmUWa+T2CFceZSR2Ty1lK8taO
 jSwoCUlGwZkqRjxMfuKDy2MOAd12aYvzEYWzh7ZaWnkZgPM8GPmHH5TJW
 sGaJWN8+ZiaG+XFd5c3EBMHqH2FkjT9EBRny1ebVVi/z61oW8m/zL/sfl A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="402168027"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="402168027"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 17:30:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="789116691"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="789116691"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 17:30:45 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 17:30:04 -0700
Message-Id: <20230314003012.2600353-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230314003012.2600353-1-lucas.demarchi@intel.com>
References: <20230314003012.2600353-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 06/14] drm/xe: Add PVC gt workarounds
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

Synchronize with i915 the PVC gt workarounds as of committ
commit 4d14d7717f19 ("drm/i915/selftest: Fix ktime_get() and h/w
access order").

v2: Add masked flag to XEHPC_LNCFMISCCFGREG0 (Matt Roper)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  9 +++++++++
 drivers/gpu/drm/xe/xe_wa.c           | 19 +++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 70457c0ff4a6..1b39a209898b 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -216,6 +216,15 @@
 #define FORCEWAKE_MEDIA_VDBOX_GEN11(n)		_MMIO(0xa540 + (n) * 4)
 #define FORCEWAKE_MEDIA_VEBOX_GEN11(n)		_MMIO(0xa560 + (n) * 4)
 
+#define XEHPC_LNCFMISCCFGREG0			MCR_REG(0xb01c)
+#define   XEHPC_OVRLSCCC			REG_BIT(0)
+
+#define RENDER_MOD_CTRL				MCR_REG(0xcf2c)
+#define COMP_MOD_CTRL				MCR_REG(0xcf30)
+#define XEHP_VDBX_MOD_CTRL			MCR_REG(0xcf34)
+#define XEHP_VEBX_MOD_CTRL			MCR_REG(0xcf38)
+#define   FORCE_MISS_FTLB			REG_BIT(3)
+
 #define GEN10_SAMPLER_MODE			MCR_REG(0xe18c)
 #define   ENABLE_SMALLPL			REG_BIT(15)
 #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 155cabe16e2e..e8d523033b87 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -180,6 +180,25 @@ static const struct xe_rtp_entry gt_was[] = {
 	  XE_RTP_RULES(PLATFORM(DG2)),
 	  XE_RTP_ACTIONS(CLR(GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE))
 	},
+
+	/* PVC */
+
+	{ XE_RTP_NAME("14015795083"),
+	  XE_RTP_RULES(PLATFORM(PVC)),
+	  XE_RTP_ACTIONS(CLR(GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE))
+	},
+	{ XE_RTP_NAME("18018781329"),
+	  XE_RTP_RULES(PLATFORM(PVC)),
+	  XE_RTP_ACTIONS(SET(RENDER_MOD_CTRL, FORCE_MISS_FTLB),
+			 SET(COMP_MOD_CTRL, FORCE_MISS_FTLB),
+			 SET(XEHP_VDBX_MOD_CTRL, FORCE_MISS_FTLB),
+			 SET(XEHP_VEBX_MOD_CTRL, FORCE_MISS_FTLB))
+	},
+	{ XE_RTP_NAME("16016694945"),
+	  XE_RTP_RULES(PLATFORM(PVC)),
+	  XE_RTP_ACTIONS(SET(XEHPC_LNCFMISCCFGREG0, XEHPC_OVRLSCCC,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
 	{}
 };
 
-- 
2.39.0

