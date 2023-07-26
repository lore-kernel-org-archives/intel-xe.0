Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4890DC001DC
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 16:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200E010E49F;
	Wed, 26 Jul 2023 16:10:07 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9E610E49E
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 16:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690387799; x=1721923799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YyebSgWbUEjxlbE3qqQ5MD6/tWi1ctZZQJq18VayjsQ=;
 b=IMfOcGVAIKbczavPZcZ30ffyOQeaaFhf7ti8ivJjN9c1srQwWuIdAe5K
 kND8nfP/kBga1LK8odE3Al7Lo9Y16LR5X6VMiAS9rEO8bDidYbU9L8pby
 oNMrMtJAEztVfgR8lKpmrP9sxKmiNXKgBTBFKSwUUe3k7SFPGrIs6oe2e
 Y2gfMXLbU+dhGd2oM3Sc3S7YKLcVH6tno4Azo3TybcecpkZUigs4EAzZK
 lbjArRVp9YpxLmmufSYCz4vaOfU9jUSEzMVrScWOxGG8kQBP++s44GD0y
 kvi9b0jRS60w/DICA6oa91rawGFBVxgy88Pk7AOtXY/b+tb7dB1AfP6jb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="398994909"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="398994909"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:07:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057279381"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="1057279381"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:07:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jul 2023 09:07:08 -0700
Message-Id: <20230726160708.3967790-11-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230726160708.3967790-1-lucas.demarchi@intel.com>
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 10/10] drm/xe: Sort xe_regs.h
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Sort it by register address to make it easy to update when needed.

v2: Do not create exception for registers with same functionality.
Always sort it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h | 59 ++++++++++++++++---------------
 1 file changed, 31 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 315f6f8dadf3..ec45b1ba9db1 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -7,9 +7,6 @@
 
 #include "regs/xe_reg_defs.h"
 
-#define GU_CNTL					XE_REG(0x101010)
-#define   LMEM_INIT				REG_BIT(7)
-
 #define RENDER_RING_BASE			0x02000
 #define BSD_RING_BASE				0x1c0000
 #define BSD2_RING_BASE				0x1c4000
@@ -45,46 +42,52 @@
 #define FF_THREAD_MODE				XE_REG(0x20a0)
 #define   FF_TESSELATION_DOP_GATE_DISABLE	BIT(19)
 
-#define PVC_RP_STATE_CAP			XE_REG(0x281014)
-#define MTL_RP_STATE_CAP			XE_REG(0x138000)
-
-#define MTL_MEDIAP_STATE_CAP			XE_REG(0x138020)
-#define   MTL_RP0_CAP_MASK			REG_GENMASK(8, 0)
-#define   MTL_RPN_CAP_MASK			REG_GENMASK(24, 16)
-
-#define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
-#define MTL_MPE_FREQUENCY			XE_REG(0x13802c)
-#define   MTL_RPE_MASK				REG_GENMASK(8, 0)
-
-#define SOFTWARE_FLAGS_SPR33			XE_REG(0x4f084)
+#define TIMESTAMP_OVERRIDE					XE_REG(0x44074)
+#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	REG_GENMASK(15, 12)
+#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		REG_GENMASK(9, 0)
 
 #define PCU_IRQ_OFFSET				0x444e0
 #define GU_MISC_IRQ_OFFSET			0x444f0
 #define   GU_MISC_GSE				REG_BIT(27)
 
-#define GFX_MSTR_IRQ				XE_REG(0x190010)
-#define   MASTER_IRQ				REG_BIT(31)
-#define   GU_MISC_IRQ				REG_BIT(29)
-#define   DISPLAY_IRQ				REG_BIT(16)
-#define   GT_DW_IRQ(x)				REG_BIT(x)
-
-#define DG1_MSTR_TILE_INTR			XE_REG(0x190008)
-#define   DG1_MSTR_IRQ				REG_BIT(31)
-#define   DG1_MSTR_TILE(t)			REG_BIT(t)
+#define SOFTWARE_FLAGS_SPR33			XE_REG(0x4f084)
 
-#define TIMESTAMP_OVERRIDE					XE_REG(0x44074)
-#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	REG_GENMASK(15, 12)
-#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		REG_GENMASK(9, 0)
+#define GU_CNTL					XE_REG(0x101010)
+#define   LMEM_INIT				REG_BIT(7)
 
 #define GGC					XE_REG(0x108040)
 #define   GMS_MASK				REG_GENMASK(15, 8)
 #define   GGMS_MASK				REG_GENMASK(7, 6)
 
-#define GSMBASE					XE_REG(0x108100)
 #define DSMBASE					XE_REG(0x1080C0)
 #define   BDSM_MASK				REG_GENMASK64(63, 20)
 
+#define GSMBASE					XE_REG(0x108100)
+
 #define STOLEN_RESERVED				XE_REG(0x1082c0)
 #define   WOPCM_SIZE_MASK			REG_GENMASK64(8, 7)
 
+#define MTL_RP_STATE_CAP			XE_REG(0x138000)
+
+#define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
+
+#define MTL_MEDIAP_STATE_CAP			XE_REG(0x138020)
+#define   MTL_RPN_CAP_MASK			REG_GENMASK(24, 16)
+#define   MTL_RP0_CAP_MASK			REG_GENMASK(8, 0)
+
+#define MTL_MPE_FREQUENCY			XE_REG(0x13802c)
+#define   MTL_RPE_MASK				REG_GENMASK(8, 0)
+
+#define DG1_MSTR_TILE_INTR			XE_REG(0x190008)
+#define   DG1_MSTR_IRQ				REG_BIT(31)
+#define   DG1_MSTR_TILE(t)			REG_BIT(t)
+
+#define GFX_MSTR_IRQ				XE_REG(0x190010)
+#define   MASTER_IRQ				REG_BIT(31)
+#define   GU_MISC_IRQ				REG_BIT(29)
+#define   DISPLAY_IRQ				REG_BIT(16)
+#define   GT_DW_IRQ(x)				REG_BIT(x)
+
+#define PVC_RP_STATE_CAP			XE_REG(0x281014)
+
 #endif
-- 
2.40.1

