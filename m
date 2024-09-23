Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCACCF9C71
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 21:45:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DD410E0A0;
	Mon, 23 Sep 2024 21:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ji/ag4Tz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A2310E0A0
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 21:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727127922; x=1758663922;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YAA1mARAScXpj7yfpTjEb78f5tUiGdeQk3h/iTqDIac=;
 b=Ji/ag4Tz31yvGrzyHSJXxGJyoY4tP3tybMLcDPXcCGKyWaAAYmr3/X2j
 3PW3LLTL+nmKvu51CsFlDOOjvZWFhilk0JPBgjHT6PhwUTOhovxj3VV0E
 6mYdd/YxU27DWgPf6sS3LZDs0Jz/GmY/rSYE2Z3bKhnxoOxIEC4yUoyVt
 Ry9rUNWzJcEYQja/UlndDb7u0jBe9FjUD2s28cPkPpMEzGBvfXt6xtCdR
 x78ZaUZuwXl11xgiG7k5j0yF9Imtko8bKWz9LVq7+6wC5+qx2Sm4GVXwL
 dsYxN6P1dviLIYYtaH4is8gbP3TTJx11ZCsiJdryDdGixTW9j6F2+Y7kh A==;
X-CSE-ConnectionGUID: /CZyahX2Rcee+iRKORoMhw==
X-CSE-MsgGUID: Sb3E8szlST+7qNK3RVDPMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29815331"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="29815331"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 14:45:22 -0700
X-CSE-ConnectionGUID: MlIZvvvXTOWkYPP46Hy7Hg==
X-CSE-MsgGUID: ABuHmWI7QRCSY+g8E093ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="75307409"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 14:45:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe: Move IRQ-related registers to dedicated header
Date: Mon, 23 Sep 2024 14:45:11 -0700
Message-ID: <20240923214514.2031410-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

IRQ registers have a well-defined scope and make sense to collect in a
dedicated header file.  This also reduces confusion about the GT IRQ
registers --- even though those registers relate to the GTs, they
actually live outside the GT (in the sgunit) and thus do not need to
worry about GT-specific register concepts like forcewake, steering, etc.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c |  2 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h    | 58 -----------------
 drivers/gpu/drm/xe/regs/xe_irq_regs.h   | 82 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/regs/xe_regs.h       | 14 -----
 drivers/gpu/drm/xe/xe_gsc.c             |  1 +
 drivers/gpu/drm/xe/xe_guc.c             |  1 +
 drivers/gpu/drm/xe/xe_hw_engine.c       |  1 +
 drivers/gpu/drm/xe/xe_irq.c             |  3 +-
 drivers/gpu/drm/xe/xe_memirq.c          |  2 +-
 9 files changed, 88 insertions(+), 76 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_irq_regs.h

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 5cbee5040e91..ca00a365080f 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -4,7 +4,7 @@
  */
 
 #include "xe_display.h"
-#include "regs/xe_regs.h"
+#include "regs/xe_irq_regs.h"
 
 #include <linux/fb.h>
 
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index cf21de3adca6..a2e815251068 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -556,62 +556,4 @@
 #define GT_PERF_STATUS				XE_REG(0x1381b4)
 #define   VOLTAGE_MASK				REG_GENMASK(10, 0)
 
-/*
- * Note: Interrupt registers 1900xx are VF accessible only until version 12.50.
- *       On newer platforms, VFs are using memory-based interrupts instead.
- *       However, for simplicity we keep this XE_REG_OPTION_VF tag intact.
- */
-
-#define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4), XE_REG_OPTION_VF)
-#define   INTR_GSC				REG_BIT(31)
-#define   INTR_GUC				REG_BIT(25)
-#define   INTR_MGUC				REG_BIT(24)
-#define   INTR_BCS8				REG_BIT(23)
-#define   INTR_BCS(x)				REG_BIT(15 - (x))
-#define   INTR_CCS(x)				REG_BIT(4 + (x))
-#define   INTR_RCS0				REG_BIT(0)
-#define   INTR_VECS(x)				REG_BIT(31 - (x))
-#define   INTR_VCS(x)				REG_BIT(x)
-
-#define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030, XE_REG_OPTION_VF)
-#define VCS_VECS_INTR_ENABLE			XE_REG(0x190034, XE_REG_OPTION_VF)
-#define GUC_SG_INTR_ENABLE			XE_REG(0x190038, XE_REG_OPTION_VF)
-#define   ENGINE1_MASK				REG_GENMASK(31, 16)
-#define   ENGINE0_MASK				REG_GENMASK(15, 0)
-#define GPM_WGBOXPERF_INTR_ENABLE		XE_REG(0x19003c, XE_REG_OPTION_VF)
-#define GUNIT_GSC_INTR_ENABLE			XE_REG(0x190044, XE_REG_OPTION_VF)
-#define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048, XE_REG_OPTION_VF)
-
-#define INTR_IDENTITY_REG(x)			XE_REG(0x190060 + ((x) * 4), XE_REG_OPTION_VF)
-#define   INTR_DATA_VALID			REG_BIT(31)
-#define   INTR_ENGINE_INSTANCE(x)		REG_FIELD_GET(GENMASK(25, 20), x)
-#define   INTR_ENGINE_CLASS(x)			REG_FIELD_GET(GENMASK(18, 16), x)
-#define   INTR_ENGINE_INTR(x)			REG_FIELD_GET(GENMASK(15, 0), x)
-#define   OTHER_GUC_INSTANCE			0
-#define   OTHER_GSC_HECI2_INSTANCE		3
-#define   OTHER_GSC_INSTANCE			6
-
-#define IIR_REG_SELECTOR(x)			XE_REG(0x190070 + ((x) * 4), XE_REG_OPTION_VF)
-#define RCS0_RSVD_INTR_MASK			XE_REG(0x190090, XE_REG_OPTION_VF)
-#define BCS_RSVD_INTR_MASK			XE_REG(0x1900a0, XE_REG_OPTION_VF)
-#define VCS0_VCS1_INTR_MASK			XE_REG(0x1900a8, XE_REG_OPTION_VF)
-#define VCS2_VCS3_INTR_MASK			XE_REG(0x1900ac, XE_REG_OPTION_VF)
-#define VECS0_VECS1_INTR_MASK			XE_REG(0x1900d0, XE_REG_OPTION_VF)
-#define HECI2_RSVD_INTR_MASK			XE_REG(0x1900e4)
-#define GUC_SG_INTR_MASK			XE_REG(0x1900e8, XE_REG_OPTION_VF)
-#define GPM_WGBOXPERF_INTR_MASK			XE_REG(0x1900ec, XE_REG_OPTION_VF)
-#define GUNIT_GSC_INTR_MASK			XE_REG(0x1900f4, XE_REG_OPTION_VF)
-#define CCS0_CCS1_INTR_MASK			XE_REG(0x190100)
-#define CCS2_CCS3_INTR_MASK			XE_REG(0x190104)
-#define XEHPC_BCS1_BCS2_INTR_MASK		XE_REG(0x190110)
-#define XEHPC_BCS3_BCS4_INTR_MASK		XE_REG(0x190114)
-#define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
-#define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
-#define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
-#define   GT_CONTEXT_SWITCH_INTERRUPT		REG_BIT(8)
-#define   GSC_ER_COMPLETE			REG_BIT(5)
-#define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
-#define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
-#define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
-
 #endif
diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
new file mode 100644
index 000000000000..1776b3f78ccb
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+#ifndef _XE_IRQ_REGS_H_
+#define _XE_IRQ_REGS_H_
+
+#include "regs/xe_reg_defs.h"
+
+#define PCU_IRQ_OFFSET				0x444e0
+#define GU_MISC_IRQ_OFFSET			0x444f0
+#define   GU_MISC_GSE				REG_BIT(27)
+
+#define DG1_MSTR_TILE_INTR			XE_REG(0x190008)
+#define   DG1_MSTR_IRQ				REG_BIT(31)
+#define   DG1_MSTR_TILE(t)			REG_BIT(t)
+
+#define GFX_MSTR_IRQ				XE_REG(0x190010, XE_REG_OPTION_VF)
+#define   MASTER_IRQ				REG_BIT(31)
+#define   GU_MISC_IRQ				REG_BIT(29)
+#define   DISPLAY_IRQ				REG_BIT(16)
+#define   GT_DW_IRQ(x)				REG_BIT(x)
+
+/*
+ * Note: Interrupt registers 1900xx are VF accessible only until version 12.50.
+ *       On newer platforms, VFs are using memory-based interrupts instead.
+ *       However, for simplicity we keep this XE_REG_OPTION_VF tag intact.
+ */
+
+#define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4), XE_REG_OPTION_VF)
+#define   INTR_GSC				REG_BIT(31)
+#define   INTR_GUC				REG_BIT(25)
+#define   INTR_MGUC				REG_BIT(24)
+#define   INTR_BCS8				REG_BIT(23)
+#define   INTR_BCS(x)				REG_BIT(15 - (x))
+#define   INTR_CCS(x)				REG_BIT(4 + (x))
+#define   INTR_RCS0				REG_BIT(0)
+#define   INTR_VECS(x)				REG_BIT(31 - (x))
+#define   INTR_VCS(x)				REG_BIT(x)
+
+#define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030, XE_REG_OPTION_VF)
+#define VCS_VECS_INTR_ENABLE			XE_REG(0x190034, XE_REG_OPTION_VF)
+#define GUC_SG_INTR_ENABLE			XE_REG(0x190038, XE_REG_OPTION_VF)
+#define   ENGINE1_MASK				REG_GENMASK(31, 16)
+#define   ENGINE0_MASK				REG_GENMASK(15, 0)
+#define GPM_WGBOXPERF_INTR_ENABLE		XE_REG(0x19003c, XE_REG_OPTION_VF)
+#define GUNIT_GSC_INTR_ENABLE			XE_REG(0x190044, XE_REG_OPTION_VF)
+#define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048, XE_REG_OPTION_VF)
+
+#define INTR_IDENTITY_REG(x)			XE_REG(0x190060 + ((x) * 4), XE_REG_OPTION_VF)
+#define   INTR_DATA_VALID			REG_BIT(31)
+#define   INTR_ENGINE_INSTANCE(x)		REG_FIELD_GET(GENMASK(25, 20), x)
+#define   INTR_ENGINE_CLASS(x)			REG_FIELD_GET(GENMASK(18, 16), x)
+#define   INTR_ENGINE_INTR(x)			REG_FIELD_GET(GENMASK(15, 0), x)
+#define   OTHER_GUC_INSTANCE			0
+#define   OTHER_GSC_HECI2_INSTANCE		3
+#define   OTHER_GSC_INSTANCE			6
+
+#define IIR_REG_SELECTOR(x)			XE_REG(0x190070 + ((x) * 4), XE_REG_OPTION_VF)
+#define RCS0_RSVD_INTR_MASK			XE_REG(0x190090, XE_REG_OPTION_VF)
+#define BCS_RSVD_INTR_MASK			XE_REG(0x1900a0, XE_REG_OPTION_VF)
+#define VCS0_VCS1_INTR_MASK			XE_REG(0x1900a8, XE_REG_OPTION_VF)
+#define VCS2_VCS3_INTR_MASK			XE_REG(0x1900ac, XE_REG_OPTION_VF)
+#define VECS0_VECS1_INTR_MASK			XE_REG(0x1900d0, XE_REG_OPTION_VF)
+#define HECI2_RSVD_INTR_MASK			XE_REG(0x1900e4)
+#define GUC_SG_INTR_MASK			XE_REG(0x1900e8, XE_REG_OPTION_VF)
+#define GPM_WGBOXPERF_INTR_MASK			XE_REG(0x1900ec, XE_REG_OPTION_VF)
+#define GUNIT_GSC_INTR_MASK			XE_REG(0x1900f4, XE_REG_OPTION_VF)
+#define CCS0_CCS1_INTR_MASK			XE_REG(0x190100)
+#define CCS2_CCS3_INTR_MASK			XE_REG(0x190104)
+#define XEHPC_BCS1_BCS2_INTR_MASK		XE_REG(0x190110)
+#define XEHPC_BCS3_BCS4_INTR_MASK		XE_REG(0x190114)
+#define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
+#define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
+#define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
+#define   GT_CONTEXT_SWITCH_INTERRUPT		REG_BIT(8)
+#define   GSC_ER_COMPLETE			REG_BIT(5)
+#define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
+#define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
+#define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
+
+#endif
diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index dfa869f0dddd..3293172b0128 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -11,10 +11,6 @@
 #define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	REG_GENMASK(15, 12)
 #define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		REG_GENMASK(9, 0)
 
-#define PCU_IRQ_OFFSET				0x444e0
-#define GU_MISC_IRQ_OFFSET			0x444f0
-#define   GU_MISC_GSE				REG_BIT(27)
-
 #define GU_CNTL_PROTECTED			XE_REG(0x10100C)
 #define   DRIVERINT_FLR_DIS			REG_BIT(31)
 
@@ -57,16 +53,6 @@
 #define MTL_MPE_FREQUENCY			XE_REG(0x13802c)
 #define   MTL_RPE_MASK				REG_GENMASK(8, 0)
 
-#define DG1_MSTR_TILE_INTR			XE_REG(0x190008)
-#define   DG1_MSTR_IRQ				REG_BIT(31)
-#define   DG1_MSTR_TILE(t)			REG_BIT(t)
-
-#define GFX_MSTR_IRQ				XE_REG(0x190010, XE_REG_OPTION_VF)
-#define   MASTER_IRQ				REG_BIT(31)
-#define   GU_MISC_IRQ				REG_BIT(29)
-#define   DISPLAY_IRQ				REG_BIT(16)
-#define   GT_DW_IRQ(x)				REG_BIT(x)
-
 #define VF_CAP_REG				XE_REG(0x1901f8, XE_REG_OPTION_VF)
 #define   VF_CAP				REG_BIT(0)
 
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 9cb326af5931..783b09bf3681 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -34,6 +34,7 @@
 #include "instructions/xe_gsc_commands.h"
 #include "regs/xe_gsc_regs.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_irq_regs.h"
 
 static struct xe_gt *
 gsc_to_gt(struct xe_gsc *gsc)
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index b6cd5e941f19..c2ddf883702b 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -14,6 +14,7 @@
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_gtt_defs.h"
 #include "regs/xe_guc_regs.h"
+#include "regs/xe_irq_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index d7408d06ee20..ea6d9ef7fab6 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -12,6 +12,7 @@
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_irq_regs.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_device.h"
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 5eb7775c0fd2..b7995ebd54ab 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -10,8 +10,7 @@
 #include <drm/drm_managed.h>
 
 #include "display/xe_display.h"
-#include "regs/xe_gt_regs.h"
-#include "regs/xe_regs.h"
+#include "regs/xe_irq_regs.h"
 #include "xe_device.h"
 #include "xe_drv.h"
 #include "xe_gsc_proxy.h"
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 3f8d4ca64302..e3610cb90bb9 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -5,8 +5,8 @@
 
 #include <drm/drm_managed.h>
 
-#include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
+#include "regs/xe_irq_regs.h"
 #include "regs/xe_regs.h"
 
 #include "xe_assert.h"
-- 
2.46.0

