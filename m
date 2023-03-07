Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D5DC678D4
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 09:25:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B926410E3C5;
	Tue,  7 Mar 2023 09:25:33 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC63710E3C5
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 09:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678181130; x=1709717130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UJCRwgf1iot9Snrz+c2OrljnBYEwSUagwh6Deam91qk=;
 b=AygpyIT2pTFVqOqQO7XKjCXwv0zGBpD83LZ91umDjULQbFxyUb4Cd2wF
 rZ5dpz8blEldbmFRFv1+70lEyRjL1pN72eQ/SpXfAeFZUJbQTdbJ1Bxil
 6Wf9FvgEmNAij+1qUgzEh8E8CV3owsSpnBTMnseghzWCc96ao0ivGuMxN
 ytezGQLJlgb2J140HcSKV+XhDHlL1VBTEmGuL0sM13Q6BbcXFOOQ+ssfF
 Mo50McfvEWqSAb168CSQ1ex56VUASiLxA2yWIqI9ButgUHGfIoGGQFvpa
 9RWEuVcA1fQHvEO/9j959LkC++mX0SUBsvZiXpVJ7MnK8r7WqDjncGula w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="422079127"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="422079127"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005798832"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="1005798832"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:15 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  7 Mar 2023 01:24:41 -0800
Message-Id: <20230307092446.1263266-15-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307092446.1263266-1-lucas.demarchi@intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 14/19] drm/xe: Add PVC gt workarounds
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

Synchronize with i915 the PVC gt workarounds as of committ
commit 4d14d7717f19 ("drm/i915/selftest: Fix ktime_get() and h/w
access order").

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  9 +++++++++
 drivers/gpu/drm/xe/xe_wa.c           | 18 ++++++++++++++++++
 2 files changed, 27 insertions(+)

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
index 155cabe16e2e..6498f187591d 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -180,6 +180,24 @@ static const struct xe_rtp_entry gt_was[] = {
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
+	  XE_RTP_ACTIONS(SET(XEHPC_LNCFMISCCFGREG0, XEHPC_OVRLSCCC))
+	},
 	{}
 };
 
-- 
2.39.0

