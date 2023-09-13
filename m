Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD9DEE0213
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 23:14:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3BD10E1DE;
	Wed, 13 Sep 2023 23:14:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48FC10E1DB
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 23:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694646891; x=1726182891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KeTgyoss/6+3GTN+OpjBRcL5Utul/GdY4y21iab2sJI=;
 b=jyk9YZ/iLhbeirVa2Vej5GaCQgN91Kw8plPEF0mYkVbukcxEDVWuKnkl
 a9FUGX/hBQDDZdk9Ozrg4DlRR7WESjc4GvWiTuvsQ9aK8XYUq8vF0KY5V
 viFxjqTUPlKYQYMKx9PsHpr6xTnUQssG8rdvUHkirhWvCYqvKiMwZ7VWm
 aXqxIWwcgrQ9QpUd15SYZX3eRU+rpM40xPc43cgSgnYAPTrhYFQvlDmAZ
 pKFBac3TLPT6T8zjw0utJlSYDFJoFUZ5+BwxWh/G8OV194ijAnWjPD8/F
 oeTbncwydubfzR4I7KUKITbBIuSS9ypocN0fXIK8+CFm+RGf86oGzwcjs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377714992"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="377714992"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 16:14:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="773659713"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="773659713"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 16:14:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 13 Sep 2023 16:14:18 -0700
Message-ID: <20230913231411.291933-14-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230913231411.291933-8-matthew.d.roper@intel.com>
References: <20230913231411.291933-8-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/6] fixup! drm/xe/display: Implement display
 support
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

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   4 +-
 .../drm/xe/display/ext/intel_clock_gating.c   | 124 ------------------
 drivers/gpu/drm/xe/xe_display.c               |   2 -
 3 files changed, 2 insertions(+), 128 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_clock_gating.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 9d2311f8141f..bcfa7daf7303 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -147,8 +147,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/xe_plane_initial.o \
 	display/xe_display_rps.o \
 	display/ext/i915_irq.o \
-	display/ext/i915_utils.o \
-	display/ext/intel_clock_gating.o
+	display/ext/i915_utils.o
 
 # SOC code shared with i915
 xe-$(CONFIG_DRM_XE_DISPLAY) += \
@@ -183,6 +182,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_display_power_map.o \
 	i915-display/intel_display_power_well.o \
 	i915-display/intel_display_trace.o \
+	i915-display/intel_display_wa.o \
 	i915-display/intel_dkl_phy.o \
 	i915-display/intel_dmc.o \
 	i915-display/intel_dp.o \
diff --git a/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c b/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
deleted file mode 100644
index 88b1aee0351f..000000000000
--- a/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
+++ /dev/null
@@ -1,124 +0,0 @@
-/*
- * Copyright © 2012 Intel Corporation
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
- * IN THE SOFTWARE.
- *
- * Authors:
- *    Eugeni Dodonov <eugeni.dodonov@intel.com>
- *
- */
-
-#include "intel_de.h"
-#include "intel_display_trace.h"
-
-#include "i915_drv.h"
-#include "i915_reg.h"
-#include "intel_clock_gating.h"
-#include "intel_mchbar_regs.h"
-
-static void gen12lp_init_clock_gating(struct drm_i915_private *dev_priv)
-{
-	/* Wa_1409120013 */
-	if (DISPLAY_VER(dev_priv) == 12)
-		intel_de_write(dev_priv, ILK_DPFC_CHICKEN(INTEL_FBC_A),
-				   DPFC_CHICKEN_COMP_DUMMY_PIXEL);
-
-	/* Wa_1409825376:tgl (pre-prod)*/
-	if (IS_TIGERLAKE(dev_priv) && IS_DISPLAY_STEP(dev_priv, STEP_A0, STEP_C0))
-		intel_de_write(dev_priv, GEN9_CLKGATE_DIS_3, intel_de_read(dev_priv, GEN9_CLKGATE_DIS_3) |
-			   TGL_VRH_GATING_DIS);
-
-	/* Wa_14013723622:tgl,rkl,dg1,adl-s */
-	if (DISPLAY_VER(dev_priv) == 12)
-		intel_de_rmw(dev_priv, CLKREQ_POLICY,
-				 CLKREQ_POLICY_MEM_UP_OVRD, 0);
-}
-
-static void adlp_init_clock_gating(struct drm_i915_private *dev_priv)
-{
-	gen12lp_init_clock_gating(dev_priv);
-
-	/* Wa_22011091694:adlp */
-	intel_de_rmw(dev_priv, GEN9_CLKGATE_DIS_5, 0, DPCE_GATING_DIS);
-
-	/* Bspec/49189 Initialize Sequence */
-	intel_de_rmw(dev_priv, GEN8_CHICKEN_DCPR_1, DDI_CLOCK_REG_ACCESS, 0);
-}
-
-static void dg1_init_clock_gating(struct drm_i915_private *dev_priv)
-{
-	gen12lp_init_clock_gating(dev_priv);
-
-	/* Wa_1409836686:dg1[a0] */
-	if (IS_DG1_GRAPHICS_STEP(dev_priv, STEP_A0, STEP_B0))
-		intel_de_write(dev_priv, GEN9_CLKGATE_DIS_3, intel_de_read(dev_priv, GEN9_CLKGATE_DIS_3) |
-			   DPT_GATING_DIS);
-}
-
-static void xehpsdv_init_clock_gating(struct drm_i915_private *dev_priv)
-{
-	/* Wa_22010146351:xehpsdv */
-	if (IS_XEHPSDV_GRAPHICS_STEP(dev_priv, STEP_A0, STEP_B0))
-		intel_de_rmw(dev_priv, XEHP_CLOCK_GATE_DIS, 0, SGR_DIS);
-}
-
-static void dg2_init_clock_gating(struct drm_i915_private *i915)
-{
-	/* Wa_22010954014:dg2 */
-	intel_de_rmw(i915, XEHP_CLOCK_GATE_DIS, 0,
-			 SGSI_SIDECLK_DIS);
-
-	/*
-	 * Wa_14010733611:dg2_g10
-	 * Wa_22010146351:dg2_g10
-	 */
-	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_A0, STEP_B0))
-		intel_de_rmw(i915, XEHP_CLOCK_GATE_DIS, 0,
-				 SGR_DIS | SGGI_DIS);
-}
-
-static void pvc_init_clock_gating(struct drm_i915_private *dev_priv)
-{
-	/* Wa_14012385139:pvc */
-	if (IS_PVC_BD_STEP(dev_priv, STEP_A0, STEP_B0))
-		intel_de_rmw(dev_priv, XEHP_CLOCK_GATE_DIS, 0, SGR_DIS);
-
-	/* Wa_22010954014:pvc */
-	if (IS_PVC_BD_STEP(dev_priv, STEP_A0, STEP_B0))
-		intel_de_rmw(dev_priv, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_DIS);
-}
-
-void intel_clock_gating_init(struct drm_i915_private *dev_priv)
-{
-	if (IS_PONTEVECCHIO(dev_priv))
-		pvc_init_clock_gating(dev_priv);
-	else if (IS_DG2(dev_priv))
-		dg2_init_clock_gating(dev_priv);
-	else if (IS_XEHPSDV(dev_priv))
-		xehpsdv_init_clock_gating(dev_priv);
-	else if (IS_ALDERLAKE_P(dev_priv))
-		adlp_init_clock_gating(dev_priv);
-	else if (IS_DG1(dev_priv))
-		dg1_init_clock_gating(dev_priv);
-	else if (GRAPHICS_VER(dev_priv) == 12)
-		gen12lp_init_clock_gating(dev_priv);
-	else
-		MISSING_CASE(INTEL_DEVID(dev_priv));
-}
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 0b569b229ab1..ffaaacc72c54 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -18,7 +18,6 @@
 #include "intel_acpi.h"
 #include "intel_audio.h"
 #include "intel_bw.h"
-#include "intel_clock_gating.h"
 #include "intel_display.h"
 #include "intel_display_driver.h"
 #include "intel_display_irq.h"
@@ -399,7 +398,6 @@ void xe_display_pm_resume(struct xe_device *xe)
 		drm_mode_config_reset(&xe->drm);
 
 	intel_display_driver_init_hw(xe);
-	intel_clock_gating_init(xe);
 	intel_hpd_init(xe);
 
 	/* MST sideband requires HPD interrupts enabled */
-- 
2.41.0

