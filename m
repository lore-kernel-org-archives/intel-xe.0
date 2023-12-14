Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91341C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 18:47:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2794710E0D7;
	Thu, 14 Dec 2023 18:47:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E50D10E204
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 18:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702579649; x=1734115649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S0iBuRz+5EG+J1+8Mo6xA2nggfZ2qdIvYatcTQMQWQU=;
 b=YbpA0Nu3hOwpo6G5HJkH+Nl9ovk+k6bm4N8cUflR2oYXgM1OnFzqOadb
 0TCvbcZtXUNkrBPcPgK4pGRNwIH9Hefl9JekGiWn39IjAWb5IBgvGg3jJ
 I766wPDXblRN6oKpHt+NeDrkFfml6hvi8lURfE13CK+0h5gOM8w01glVw
 0xcxwnrYDVnq30IBNRk7lvvm2/nzAVO3ei23F9W9qLfVgxwycshI5VdVZ
 hlFWvsVHJBusjFJiNI/Lk6ha9vVpos3aKgVs6bXaKyn1MjZalj44fQyZy
 JlQdlhYK5IWOaewHvEjU6ESY52AUmtPVlTCxJJa5fvkJkap9O3Tc2OFzm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="397953935"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="397953935"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 10:47:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="892581854"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="892581854"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 10:47:11 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 7/8] drm/xe: Re-sort GT register header
Date: Thu, 14 Dec 2023 10:47:07 -0800
Message-ID: <20231214184659.2249559-17-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214184659.2249559-10-matthew.d.roper@intel.com>
References: <20231214184659.2249559-10-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Keeping the register definitions sorted will make it easy to find
existing definitions and prevent accidental introduction of duplicate
definitions.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 58 ++++++++++++++--------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 2c48de2076a6..d152f0da9d97 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -42,11 +42,6 @@
 #define FORCEWAKE_ACK_GSC			XE_REG(0xdf8)
 #define FORCEWAKE_ACK_GT_MTL			XE_REG(0xdfc)
 
-/* L3 Cache Control */
-#define XELP_LNCFCMOCS(i)			XE_REG(0xb020 + (i) * 4)
-#define XEHP_LNCFCMOCS(i)			XE_REG_MCR(0xb020 + (i) * 4)
-#define LNCFCMOCS_REG_COUNT			32
-
 #define MCFG_MCR_SELECTOR			XE_REG(0xfd0)
 #define MTL_MCR_SELECTOR			XE_REG(0xfd4)
 #define SF_MCR_SELECTOR				XE_REG(0xfd8)
@@ -102,6 +97,12 @@
 #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
 #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
 
+#define COMMON_SLICE_CHICKEN1			XE_REG(0x7010)
+
+#define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
+#define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
+#define   HZ_DEPTH_TEST_LE_GE_OPT_DISABLE		REG_BIT(13)
+
 #define XEHP_PSS_MODE2				XE_REG_MCR(0x703c, XE_REG_OPTION_MASKED)
 #define   SCOREBOARD_STALL_FLUSH_CONTROL	REG_BIT(5)
 
@@ -109,12 +110,6 @@
 #define   FLSH_IGNORES_PSD			REG_BIT(10)
 #define   FD_END_COLLECT			REG_BIT(5)
 
-#define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
-#define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
-#define   HZ_DEPTH_TEST_LE_GE_OPT_DISABLE		REG_BIT(13)
-
-#define COMMON_SLICE_CHICKEN1			XE_REG(0x7010)
-
 #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
 #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
 
@@ -162,13 +157,14 @@
 #define   CCS_EN_MASK				REG_GENMASK(19, 16)
 #define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
 
-#define GT_VEBOX_VDBOX_DISABLE			XE_REG(0x9140)
-#define   GT_VEBOX_DISABLE_MASK			REG_GENMASK(19, 16)
-#define   GT_VDBOX_DISABLE_MASK			REG_GENMASK(7, 0)
-
 #define XELP_EU_ENABLE				XE_REG(0x9134)	/* "_DISABLE" on Xe_LP */
 #define   XELP_EU_MASK				REG_GENMASK(7, 0)
 #define XELP_GT_GEOMETRY_DSS_ENABLE		XE_REG(0x913c)
+
+#define GT_VEBOX_VDBOX_DISABLE			XE_REG(0x9140)
+#define   GT_VEBOX_DISABLE_MASK			REG_GENMASK(19, 16)
+#define   GT_VDBOX_DISABLE_MASK			REG_GENMASK(7, 0)
+
 #define XEHP_GT_COMPUTE_DSS_ENABLE		XE_REG(0x9144)
 #define XEHPC_GT_COMPUTE_DSS_ENABLE_EXT		XE_REG(0x9148)
 #define XE2_GT_COMPUTE_DSS_2			XE_REG(0x914c)
@@ -284,6 +280,11 @@
 #define XEHPC_LNCFMISCCFGREG0			XE_REG_MCR(0xb01c, XE_REG_OPTION_MASKED)
 #define   XEHPC_OVRLSCCC			REG_BIT(0)
 
+/* L3 Cache Control */
+#define XELP_LNCFCMOCS(i)			XE_REG(0xb020 + (i) * 4)
+#define XEHP_LNCFCMOCS(i)			XE_REG_MCR(0xb020 + (i) * 4)
+#define LNCFCMOCS_REG_COUNT			32
+
 #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
 #define   XEHP_LNESPARE				REG_BIT(19)
 
@@ -360,13 +361,13 @@
 #define   PUSH_CONST_DEREF_HOLD_DIS		REG_BIT(8)
 #define   DISABLE_DOP_GATING			REG_BIT(0)
 
+#define RT_CTRL					XE_REG_MCR(0xe530)
+#define   DIS_NULL_QUERY			REG_BIT(10)
+
 #define XEHP_HDC_CHICKEN0					XE_REG_MCR(0xe5f0, XE_REG_OPTION_MASKED)
 #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
 #define   DIS_ATOMIC_CHAINING_TYPED_WRITES	REG_BIT(3)
 
-#define RT_CTRL					XE_REG_MCR(0xe530)
-#define   DIS_NULL_QUERY			REG_BIT(10)
-
 #define LSC_CHICKEN_BIT_0			XE_REG_MCR(0xe7c8)
 #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
 #define   TGM_WRITE_EOM_FORCE			REG_BIT(17)
@@ -423,11 +424,14 @@
 
 #define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4))
 
+#define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030)
+#define VCS_VECS_INTR_ENABLE			XE_REG(0x190034)
 #define GUC_SG_INTR_ENABLE			XE_REG(0x190038)
 #define   ENGINE1_MASK				REG_GENMASK(31, 16)
 #define   ENGINE0_MASK				REG_GENMASK(15, 0)
-
 #define GPM_WGBOXPERF_INTR_ENABLE		XE_REG(0x19003c)
+#define GUNIT_GSC_INTR_ENABLE			XE_REG(0x190044)
+#define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048)
 
 #define INTR_IDENTITY_REG(x)			XE_REG(0x190060 + ((x) * 4))
 #define   INTR_DATA_VALID			REG_BIT(31)
@@ -437,10 +441,6 @@
 #define   OTHER_GUC_INSTANCE			0
 #define   OTHER_GSC_INSTANCE			6
 
-#define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030)
-#define VCS_VECS_INTR_ENABLE			XE_REG(0x190034)
-#define GUNIT_GSC_INTR_ENABLE			XE_REG(0x190044)
-#define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048)
 #define IIR_REG_SELECTOR(x)			XE_REG(0x190070 + ((x) * 4))
 #define RCS0_RSVD_INTR_MASK			XE_REG(0x190090)
 #define BCS_RSVD_INTR_MASK			XE_REG(0x1900a0)
@@ -462,12 +462,6 @@
 #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
 #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
 
-#define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
-#define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
-#define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
-#define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
-#define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
-
 #define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
 #define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
 #define   PROCHOT_MASK				REG_BIT(0)
@@ -480,4 +474,10 @@
 #define   POWER_LIMIT_2_MASK			REG_BIT(11)
 #define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
 
+#define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
+#define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
+#define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
+#define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
+#define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
+
 #endif
-- 
2.43.0

