Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D036FD4697D
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 23:08:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACFF10E8B1;
	Wed, 21 Jan 2026 23:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QkxyFMPZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A908410E8AD;
 Wed, 21 Jan 2026 23:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769036924; x=1800572924;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qBfrfyfCYJY2I7Wm5uiMCG9g6lHIuBOiyE+KcjOUVjc=;
 b=QkxyFMPZatUuKS3aj6UesZNWU72YdUHjBfavOMsLeUWo47rJI2WqXV9/
 D27mxePMVMVWLp8rS538/+2Y80awIH32cuvErP6hxHu56559+7goFurMm
 QWIz6aMPi0xE8BuimI9biZs/+pODuDI+jvnb1g7Og6C1fCao2PQKehylG
 LLwu2wXE5rH2yb8sZyI5LfSq6NZ1PA0Cl35zNxWM3YnQ1qnByd6PHRzQy
 JYj5YoIb6CJjVP8onKAJK6BW071XfiHVSpflzbum9Zr47Hn2r6TGycmBI
 4nDWaXvymPTLISCp7rXNoecOKCDdDypH4x6N+2AhIFdmss3MJ8LLxCONF Q==;
X-CSE-ConnectionGUID: hRQB50C3T0SiS3vzIGMwjA==
X-CSE-MsgGUID: BEfx9tfIT3iJTIn9qJaw9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70244988"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="70244988"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 15:08:43 -0800
X-CSE-ConnectionGUID: jONi1na8S2m95RtrqvWrXQ==
X-CSE-MsgGUID: lJkjp2QvSnKZS34Jk6aGrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="206889593"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa010.fm.intel.com with ESMTP; 21 Jan 2026 15:08:42 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v2 08/19] drm/{i915, xe}: Removed i915_reg.h from intel_display.c
Date: Thu, 22 Jan 2026 04:54:03 +0530
Message-ID: <20260121232414.707192-9-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260121232414.707192-1-uma.shankar@intel.com>
References: <20260121232414.707192-1-uma.shankar@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Move CHICKEN_PIPESL_1 register definition to display header.
This allows intel_display.c free of i915_reg.h include.

v2: Drop common header in include and use display_regs.h (Jani)

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  |  1 -
 .../gpu/drm/i915/display/intel_display_regs.h | 23 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_reg.h               | 22 ------------------
 3 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 7491e00e3858..b7d4ac7e5ff9 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -50,7 +50,6 @@
 #include "g4x_hdmi.h"
 #include "hsw_ips.h"
 #include "i915_config.h"
-#include "i915_reg.h"
 #include "i9xx_plane.h"
 #include "i9xx_plane_regs.h"
 #include "i9xx_wm.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index f395b7d4d640..b26e6a4ee1c3 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -1544,6 +1544,29 @@
 #define   CHICKEN_FBC_STRIDE_MASK	REG_GENMASK(12, 0)
 #define   CHICKEN_FBC_STRIDE(x)		REG_FIELD_PREP(CHICKEN_FBC_STRIDE_MASK, (x))
 
+#define _CHICKEN_PIPESL_1_A	0x420b0
+#define _CHICKEN_PIPESL_1_B	0x420b4
+#define CHICKEN_PIPESL_1(pipe)	_MMIO_PIPE(pipe, _CHICKEN_PIPESL_1_A, _CHICKEN_PIPESL_1_B)
+#define   HSW_PRI_STRETCH_MAX_MASK	REG_GENMASK(28, 27)
+#define   HSW_PRI_STRETCH_MAX_X8	REG_FIELD_PREP(HSW_PRI_STRETCH_MAX_MASK, 0)
+#define   HSW_PRI_STRETCH_MAX_X4	REG_FIELD_PREP(HSW_PRI_STRETCH_MAX_MASK, 1)
+#define   HSW_PRI_STRETCH_MAX_X2	REG_FIELD_PREP(HSW_PRI_STRETCH_MAX_MASK, 2)
+#define   HSW_PRI_STRETCH_MAX_X1	REG_FIELD_PREP(HSW_PRI_STRETCH_MAX_MASK, 3)
+#define   HSW_SPR_STRETCH_MAX_MASK	REG_GENMASK(26, 25)
+#define   HSW_SPR_STRETCH_MAX_X8	REG_FIELD_PREP(HSW_SPR_STRETCH_MAX_MASK, 0)
+#define   HSW_SPR_STRETCH_MAX_X4	REG_FIELD_PREP(HSW_SPR_STRETCH_MAX_MASK, 1)
+#define   HSW_SPR_STRETCH_MAX_X2	REG_FIELD_PREP(HSW_SPR_STRETCH_MAX_MASK, 2)
+#define   HSW_SPR_STRETCH_MAX_X1	REG_FIELD_PREP(HSW_SPR_STRETCH_MAX_MASK, 3)
+#define   HSW_FBCQ_DIS			REG_BIT(22)
+#define   HSW_UNMASK_VBL_TO_REGS_IN_SRD REG_BIT(15) /* hsw */
+#define   SKL_PSR_MASK_PLANE_FLIP	REG_BIT(11) /* skl+ */
+#define   SKL_PLANE1_STRETCH_MAX_MASK	REG_GENMASK(1, 0)
+#define   SKL_PLANE1_STRETCH_MAX_X8	REG_FIELD_PREP(SKL_PLANE1_STRETCH_MAX_MASK, 0)
+#define   SKL_PLANE1_STRETCH_MAX_X4	REG_FIELD_PREP(SKL_PLANE1_STRETCH_MAX_MASK, 1)
+#define   SKL_PLANE1_STRETCH_MAX_X2	REG_FIELD_PREP(SKL_PLANE1_STRETCH_MAX_MASK, 2)
+#define   SKL_PLANE1_STRETCH_MAX_X1	REG_FIELD_PREP(SKL_PLANE1_STRETCH_MAX_MASK, 3)
+#define   BDW_UNMASK_VBL_TO_REGS_IN_SRD	REG_BIT(0) /* bdw */
+
 #define _CHICKEN_TRANS_A	0x420c0
 #define _CHICKEN_TRANS_B	0x420c4
 #define _CHICKEN_TRANS_C	0x420c8
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index c9fb9af1a35c..c1d141e9ca47 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -878,28 +878,6 @@
 #define CHICKEN_PAR2_1		_MMIO(0x42090)
 #define   KVM_CONFIG_CHANGE_NOTIFICATION_SELECT	REG_BIT(14)
 
-#define _CHICKEN_PIPESL_1_A	0x420b0
-#define _CHICKEN_PIPESL_1_B	0x420b4
-#define CHICKEN_PIPESL_1(pipe)	_MMIO_PIPE(pipe, _CHICKEN_PIPESL_1_A, _CHICKEN_PIPESL_1_B)
-#define   HSW_PRI_STRETCH_MAX_MASK	REG_GENMASK(28, 27)
-#define   HSW_PRI_STRETCH_MAX_X8	REG_FIELD_PREP(HSW_PRI_STRETCH_MAX_MASK, 0)
-#define   HSW_PRI_STRETCH_MAX_X4	REG_FIELD_PREP(HSW_PRI_STRETCH_MAX_MASK, 1)
-#define   HSW_PRI_STRETCH_MAX_X2	REG_FIELD_PREP(HSW_PRI_STRETCH_MAX_MASK, 2)
-#define   HSW_PRI_STRETCH_MAX_X1	REG_FIELD_PREP(HSW_PRI_STRETCH_MAX_MASK, 3)
-#define   HSW_SPR_STRETCH_MAX_MASK	REG_GENMASK(26, 25)
-#define   HSW_SPR_STRETCH_MAX_X8	REG_FIELD_PREP(HSW_SPR_STRETCH_MAX_MASK, 0)
-#define   HSW_SPR_STRETCH_MAX_X4	REG_FIELD_PREP(HSW_SPR_STRETCH_MAX_MASK, 1)
-#define   HSW_SPR_STRETCH_MAX_X2	REG_FIELD_PREP(HSW_SPR_STRETCH_MAX_MASK, 2)
-#define   HSW_SPR_STRETCH_MAX_X1	REG_FIELD_PREP(HSW_SPR_STRETCH_MAX_MASK, 3)
-#define   HSW_FBCQ_DIS			REG_BIT(22)
-#define   HSW_UNMASK_VBL_TO_REGS_IN_SRD REG_BIT(15) /* hsw */
-#define   SKL_PSR_MASK_PLANE_FLIP	REG_BIT(11) /* skl+ */
-#define   SKL_PLANE1_STRETCH_MAX_MASK	REG_GENMASK(1, 0)
-#define   SKL_PLANE1_STRETCH_MAX_X8	REG_FIELD_PREP(SKL_PLANE1_STRETCH_MAX_MASK, 0)
-#define   SKL_PLANE1_STRETCH_MAX_X4	REG_FIELD_PREP(SKL_PLANE1_STRETCH_MAX_MASK, 1)
-#define   SKL_PLANE1_STRETCH_MAX_X2	REG_FIELD_PREP(SKL_PLANE1_STRETCH_MAX_MASK, 2)
-#define   SKL_PLANE1_STRETCH_MAX_X1	REG_FIELD_PREP(SKL_PLANE1_STRETCH_MAX_MASK, 3)
-#define   BDW_UNMASK_VBL_TO_REGS_IN_SRD	REG_BIT(0) /* bdw */
 
 #define DISP_ARB_CTL	_MMIO(0x45000)
 #define   DISP_FBC_MEMORY_WAKE		REG_BIT(31)
-- 
2.50.1

