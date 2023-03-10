Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBEBC7618D
	for <intel-xe@archiver.kernel.org>; Fri, 10 Mar 2023 22:16:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D7210EA24;
	Fri, 10 Mar 2023 22:16:30 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCD410EA1C
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Mar 2023 22:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678486588; x=1710022588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/W3C5Peq0jT+Zh9WUT03Ht2/+pSmnzEyTQS3gj8sgss=;
 b=OvX0b7BvKlYOIoE3Y/bzaZnGbpAfz1MosCEx9AIDRSFmizSHECgpO4Sd
 jRfY3TCUTUgRkLkdNzqwyPbHUW2Rd8KV592CVcGFJgnJ082D/lbZmBkg6
 uO8dMKDZukiRoCDB8S04rQCIFsLfgFVEpdOQNz1PT5VKOL+SydBWlvoA3
 6bGdFykZoeS8Wb+72Q/C+H2BQ3hbivtHyXfggl75dsVQq0f/fi32Z3tAq
 C7VjsyOWYcEfdw5KDEgi1/5tuDWauKpdGPNDSCml9mVxz9wVl6EI3Ub1l
 Xx6EY/2Pzhvk5fP+HSiUhN2CzarqeNqiJXFNQJAXDYitxY+igk7gEjRLV Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="423106175"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="423106175"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 14:16:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="821234976"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="821234976"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 14:16:24 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Mar 2023 14:15:49 -0800
Message-Id: <20230310221549.2337402-13-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230310221549.2337402-1-lucas.demarchi@intel.com>
References: <20230310221549.2337402-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 12/12] drm/xe: Add missing DG2 lrc workarounds
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

Synchronize with i915 the DG2 lrc workarounds as of
commit 4d14d7717f19 ("drm/i915/selftest: Fix ktime_get() and h/w access
order").

A few simplifications were done when the WA should be applied to some
steps of a subplatform and all the steppings of the other subplatforms.
In this case, it was simply applied to all the steppings, which only
means applying it to a few more A* steppings.

The implementation of the workaround 16011186671 triggers a bug in the
RTP infra: it's not possible to set the flag the usual way when having
multiple actions in the entry. This may be fixed later, but for now it's
sufficient to just set the flag directly without the helper macro.

v2: Fix 14014947963 to use FIELD_SET (Matt Roper)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 19 +++++++++++
 drivers/gpu/drm/xe/xe_wa.c           | 51 ++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 7a578672a818..4a7ce09d6b60 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -73,9 +73,16 @@
 #define XEHP_TILE0_ADDR_RANGE			MCR_REG(0x4900)
 #define XEHP_FLAT_CCS_BASE_ADDR			MCR_REG(0x4910)
 
+#define CHICKEN_RASTER_1			MCR_REG(0x6204)
+#define   DIS_SF_ROUND_NEAREST_EVEN		REG_BIT(8)
+
 #define CHICKEN_RASTER_2			MCR_REG(0x6208)
 #define   TBIMR_FAST_CLIP			REG_BIT(5)
 
+#define VFLSKPD					MCR_REG(0x62a8)
+#define   DIS_OVER_FETCH_CACHE			REG_BIT(1)
+#define   DIS_MULT_MISS_RD_SQUASH		REG_BIT(0)
+
 #define GEN12_FF_MODE2				_MMIO(0x6604)
 #define XEHP_FF_MODE2				MCR_REG(0x6604)
 #define   FF_MODE2_GS_TIMER_MASK		REG_GENMASK(31, 24)
@@ -83,6 +90,12 @@
 #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
 #define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
 
+#define CACHE_MODE_1				_MMIO(0x7004)
+#define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
+
+#define XEHP_PSS_MODE2				MCR_REG(0x703c)
+#define   SCOREBOARD_STALL_FLUSH_CONTROL	REG_BIT(5)
+
 #define HIZ_CHICKEN				_MMIO(0x7018)
 #define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
 
@@ -96,6 +109,12 @@
 #define   GEN11_BLEND_EMB_FIX_DISABLE_IN_RCC	REG_BIT(11)
 #define   GEN12_DISABLE_CPS_AWARE_COLOR_PIPE	REG_BIT(9)
 
+#define XEHP_SLICE_COMMON_ECO_CHICKEN1		MCR_REG(0x731c)
+#define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
+
+#define VF_PREEMPTION				_MMIO(0x83a4)
+#define   PREEMPTION_VERTEX_COUNT		REG_GENMASK(15, 0)
+
 #define VFG_PREEMPTION_CHICKEN			_MMIO(0x83b4)
 #define   POLYGON_TRIFAN_LINELOOP_DISABLE	REG_BIT(4)
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index cc7a6552f17c..f97350184057 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -540,6 +540,57 @@ static const struct xe_rtp_entry lrc_was[] = {
 			     DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE,
 			     XE_RTP_ACTION_FLAG(MASKED_REG)))
 	},
+
+	/* DG2 */
+
+	{ XE_RTP_NAME("16011186671"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0)),
+	  XE_RTP_ACTIONS(CLR(VFLSKPD, DIS_MULT_MISS_RD_SQUASH,
+			     .flags = XE_RTP_ACTION_FLAG_MASKED_REG),
+			 SET(VFLSKPD, DIS_OVER_FETCH_CACHE,
+			     .flags = XE_RTP_ACTION_FLAG_MASKED_REG))
+	},
+	{ XE_RTP_NAME("14010469329"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
+	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN3,
+			     XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("14010698770, 22010613112, 22010465075"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
+	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN3,
+			     GEN12_DISABLE_CPS_AWARE_COLOR_PIPE,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("16013271637"),
+	  XE_RTP_RULES(PLATFORM(DG2)),
+	  XE_RTP_ACTIONS(SET(XEHP_SLICE_COMMON_ECO_CHICKEN1,
+			     MSC_MSAA_REODER_BUF_BYPASS_DISABLE,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("14014947963"),
+	  XE_RTP_RULES(PLATFORM(DG2)),
+	  XE_RTP_ACTIONS(FIELD_SET(VF_PREEMPTION,
+				   PREEMPTION_VERTEX_COUNT,
+				   0x4000,
+				   XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("18018764978"),
+	  XE_RTP_RULES(PLATFORM(DG2)),
+	  XE_RTP_ACTIONS(SET(XEHP_PSS_MODE2,
+			     SCOREBOARD_STALL_FLUSH_CONTROL,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("15010599737"),
+	  XE_RTP_RULES(PLATFORM(DG2)),
+	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("18019271663"),
+	  XE_RTP_RULES(PLATFORM(DG2)),
+	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
 	{}
 };
 
-- 
2.39.0

