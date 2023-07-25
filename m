Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED22C001DF
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 20:28:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B8110E3F3;
	Tue, 25 Jul 2023 20:28:27 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A7B10E3F3
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 20:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690316906; x=1721852906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9IPtDG4uwEV4iK1HxVQh7Aq6o7w53MOnClizlhLpqRc=;
 b=GmeCh8hCBnqZNTqqq8dA69lumJMzUT7cjU66ep48kxRvmhCkeS6u6JZB
 jS9E92VysK8Y+/YEC2xvuJbrOER7U+HGJ1g5uX0cGuJMI/yFujCuCoN/I
 UJLsRXKiVGaCiIoTK5L+jCaF5WMFQf02mkI+IIN2DuquS28myDw7cnvTk
 W83u4/wowLLxk5Ome1bsVO/BM4y+VtmEWFk3JDgSNrvco+Qi0xb7az3CR
 0a9ZHZTkgq3xIbqBHACFAi0NQ2MYN/8FOcY3wN0V9sbsFymqLnuG1Qe3E
 7p088HvdAnqrbBhs6Z553Cf479JamHgcIZRQnB28dVebEFhpxxsxCzbak A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="366717422"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="366717422"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 13:28:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="726220317"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="726220317"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 13:28:25 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jul 2023 13:28:36 -0700
Message-Id: <20230725202836.3854908-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725202836.3854908-1-lucas.demarchi@intel.com>
References: <20230725202836.3854908-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/4] drm/xe: Sort xe_regs.h
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

Sort it by register address, but  keeping a few exceptions when a
register for a platform changed the address, but has the same
functionality as an already existing register.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h | 56 +++++++++++++++----------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 3f7052fec6cc..0b3607e0ba1c 100644
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
@@ -45,36 +42,15 @@
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
-
-#define TIMESTAMP_OVERRIDE					XE_REG(0x44074)
-#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	REG_GENMASK(15, 12)
-#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		REG_GENMASK(9, 0)
+#define SOFTWARE_FLAGS_SPR33			XE_REG(0x4f084)
 
 #define GGC					XE_REG(0x108040)
 #define   GMS_MASK				REG_GENMASK(15, 8)
@@ -87,4 +63,28 @@
 #define STOLEN_RESERVED				XE_REG(0x1082C0)
 #define   WOPCM_SIZE_MASK			REG_GENMASK64(8, 7)
 
+#define GU_CNTL					XE_REG(0x101010)
+#define   LMEM_INIT				REG_BIT(7)
+
+#define MTL_RP_STATE_CAP			XE_REG(0x138000)
+#define PVC_RP_STATE_CAP			XE_REG(0x281014)
+
+#define MTL_MEDIAP_STATE_CAP			XE_REG(0x138020)
+#define   MTL_RPN_CAP_MASK			REG_GENMASK(24, 16)
+#define   MTL_RP0_CAP_MASK			REG_GENMASK(8, 0)
+
+#define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
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
 #endif
-- 
2.40.1

