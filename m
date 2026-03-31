Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29BC1061B3E
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 12:16:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3B410EAE1;
	Tue, 31 Mar 2026 12:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UoN7Namb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE11310EADE;
 Tue, 31 Mar 2026 12:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774959400; x=1806495400;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KtozwgyFokeqjUx7kZS9WwjpmVmBzzazH4levquwP2c=;
 b=UoN7NambxckbWOExTQTXBGhd6SPIGZmZzRPacc4rmZqO/CqfdiNGuOOl
 xMRr1MIWVkDjINU8C4M95Obth1EwsQ1d7jRvLr4mEcuaAUEtcx7PHVtKm
 RXv2gFcFZaxpDV0Ysd6hhWwDRMqPc9tHLhMKRvo8UAy6cGF1rVPNCaZQj
 pvkC/1gataIHkdN+MUDi7dAFHgjydYbte8OIDrqKlYJj4xOIH7fhkJ9FE
 Dot5ld4psMNdAuiGE15MkFu+kewh99IEg8tbvov7Ih7GHCCxG732c3AAf
 ABHf7DjILK+TovhWCvUMLxN9ZX4Yvtwp7eILwTSVv14JEtIXB/oThaxp8 Q==;
X-CSE-ConnectionGUID: OQD14K3rTOa7VvlDs4RoJg==
X-CSE-MsgGUID: K8/iM33HQSKJoN1C+QZ6bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="87361416"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="87361416"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 05:16:40 -0700
X-CSE-ConnectionGUID: Hn/RGScURQWapnCb8wl+tQ==
X-CSE-MsgGUID: VUFUbCiKR/umTSUNoA3sgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="223469099"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.244])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 05:16:38 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH v2 6/8] drm/i915/display: move HSW and BDW clock gating init
 to display
Date: Tue, 31 Mar 2026 15:07:17 +0300
Message-ID: <20260331121608.1016333-7-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331121608.1016333-1-luciano.coelho@intel.com>
References: <20260331121608.1016333-1-luciano.coelho@intel.com>
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

Move the HSW and BDW display clock gating programming into the display
code.  In this case we need two different helpers, because the common
code between these two is split in the middle.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 .../i915/display/intel_display_clock_gating.c | 44 +++++++++++++++++++
 .../i915/display/intel_display_clock_gating.h |  4 ++
 .../gpu/drm/i915/display/intel_display_regs.h |  3 ++
 drivers/gpu/drm/i915/intel_clock_gating.c     | 34 ++------------
 4 files changed, 55 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
index e3b7522b4101..d5085ce7adae 100644
--- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
+++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
@@ -123,3 +123,47 @@ void intel_display_glk_init_clock_gating(struct intel_display *display)
 		       intel_de_read(display, GEN9_CLKGATE_DIS_0) |
 		       PWM1_GATING_DIS | PWM2_GATING_DIS);
 }
+
+void intel_display_bdw_clock_gating_disable_fbcq(struct intel_display *display)
+{
+	/* WaFbcAsynchFlipDisableFbcQueue:hsw,bdw */
+	intel_de_rmw(display, CHICKEN_PIPESL_1(PIPE_A), 0, HSW_FBCQ_DIS);
+}
+
+void intel_display_bdw_clock_gating_vblank_in_srd(struct intel_display *display)
+{
+	enum pipe pipe;
+
+	/* WaPsrDPAMaskVBlankInSRD:hsw */
+	intel_de_rmw(display, CHICKEN_PAR1_1, 0, HSW_MASK_VBL_TO_PIPE_IN_SRD);
+
+	for_each_pipe(display, pipe) {
+		/* WaPsrDPRSUnmaskVBlankInSRD:hsw,bdw */
+		intel_de_rmw(display, CHICKEN_PIPESL_1(pipe), 0,
+			     BDW_UNMASK_VBL_TO_REGS_IN_SRD);
+	}
+}
+
+void intel_display_bdw_clock_gating_kvm_notif(struct intel_display *display)
+{
+	/* WaKVMNotificationOnConfigChange:bdw */
+	intel_de_rmw(display, CHICKEN_PAR2_1, 0,
+		     KVM_CONFIG_CHANGE_NOTIFICATION_SELECT);
+}
+
+void intel_display_hsw_init_clock_gating(struct intel_display *display)
+{
+	enum pipe pipe;
+
+	/* WaFbcAsynchFlipDisableFbcQueue:hsw,bdw */
+	intel_de_rmw(display, CHICKEN_PIPESL_1(PIPE_A), 0, HSW_FBCQ_DIS);
+
+	/* WaPsrDPAMaskVBlankInSRD:hsw */
+	intel_de_rmw(display, CHICKEN_PAR1_1, 0, HSW_MASK_VBL_TO_PIPE_IN_SRD);
+
+	for_each_pipe(display, pipe) {
+		/* WaPsrDPRSUnmaskVBlankInSRD:hsw,bdw */
+		intel_de_rmw(display, CHICKEN_PIPESL_1(pipe), 0,
+			     HSW_UNMASK_VBL_TO_REGS_IN_SRD);
+	}
+}
diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
index a7784db9d97a..e0300dc8b041 100644
--- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
+++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
@@ -13,5 +13,9 @@ void intel_display_kbl_init_clock_gating(struct intel_display *display);
 void intel_display_cfl_init_clock_gating(struct intel_display *display);
 void intel_display_bxt_init_clock_gating(struct intel_display *display);
 void intel_display_glk_init_clock_gating(struct intel_display *display);
+void intel_display_bdw_clock_gating_disable_fbcq(struct intel_display *display);
+void intel_display_bdw_clock_gating_vblank_in_srd(struct intel_display *display);
+void intel_display_bdw_clock_gating_kvm_notif(struct intel_display *display);
+void intel_display_hsw_init_clock_gating(struct intel_display *display);
 
 #endif /* __INTEL_DISPLAY_CLOCK_GATING_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 4746e9ebd920..fc9d3bbb921c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -405,6 +405,9 @@
 #define   SKL_EDP_PSR_FIX_RDWRAP	REG_BIT(3)
 #define   IGNORE_PSR2_HW_TRACKING	REG_BIT(1)
 
+#define CHICKEN_PAR2_1		_MMIO(0x42090)
+#define   KVM_CONFIG_CHANGE_NOTIFICATION_SELECT	REG_BIT(14)
+
 /*
  * GEN9 clock gating regs
  */
diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index 777314e0c75d..47b437a82f4e 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
@@ -284,23 +284,12 @@ static void skl_init_clock_gating(struct drm_i915_private *i915)
 
 static void bdw_init_clock_gating(struct drm_i915_private *i915)
 {
-	struct intel_display *display = i915->display;
-	enum pipe pipe;
-
-	/* WaFbcAsynchFlipDisableFbcQueue:hsw,bdw */
-	intel_uncore_rmw(&i915->uncore, CHICKEN_PIPESL_1(PIPE_A), 0, HSW_FBCQ_DIS);
+	intel_display_bdw_clock_gating_disable_fbcq(i915->display);
 
 	/* WaSwitchSolVfFArbitrationPriority:bdw */
 	intel_uncore_rmw(&i915->uncore, GAM_ECOCHK, 0, HSW_ECOCHK_ARB_PRIO_SOL);
 
-	/* WaPsrDPAMaskVBlankInSRD:bdw */
-	intel_uncore_rmw(&i915->uncore, CHICKEN_PAR1_1, 0, HSW_MASK_VBL_TO_PIPE_IN_SRD);
-
-	for_each_pipe(display, pipe) {
-		/* WaPsrDPRSUnmaskVBlankInSRD:bdw */
-		intel_uncore_rmw(&i915->uncore, CHICKEN_PIPESL_1(pipe),
-				 0, BDW_UNMASK_VBL_TO_REGS_IN_SRD);
-	}
+	intel_display_bdw_clock_gating_vblank_in_srd(i915->display);
 
 	/* WaVSRefCountFullforceMissDisable:bdw */
 	/* WaDSRefCountFullforceMissDisable:bdw */
@@ -316,9 +305,7 @@ static void bdw_init_clock_gating(struct drm_i915_private *i915)
 	/* WaProgramL3SqcReg1Default:bdw */
 	gen8_set_l3sqc_credits(i915, 30, 2);
 
-	/* WaKVMNotificationOnConfigChange:bdw */
-	intel_uncore_rmw(&i915->uncore, CHICKEN_PAR2_1,
-			 0, KVM_CONFIG_CHANGE_NOTIFICATION_SELECT);
+	intel_display_bdw_clock_gating_kvm_notif(i915->display);
 
 	intel_pch_init_clock_gating(i915->display);
 
@@ -332,20 +319,7 @@ static void bdw_init_clock_gating(struct drm_i915_private *i915)
 
 static void hsw_init_clock_gating(struct drm_i915_private *i915)
 {
-	struct intel_display *display = i915->display;
-	enum pipe pipe;
-
-	/* WaFbcAsynchFlipDisableFbcQueue:hsw,bdw */
-	intel_uncore_rmw(&i915->uncore, CHICKEN_PIPESL_1(PIPE_A), 0, HSW_FBCQ_DIS);
-
-	/* WaPsrDPAMaskVBlankInSRD:hsw */
-	intel_uncore_rmw(&i915->uncore, CHICKEN_PAR1_1, 0, HSW_MASK_VBL_TO_PIPE_IN_SRD);
-
-	for_each_pipe(display, pipe) {
-		/* WaPsrDPRSUnmaskVBlankInSRD:hsw */
-		intel_uncore_rmw(&i915->uncore, CHICKEN_PIPESL_1(pipe),
-				 0, HSW_UNMASK_VBL_TO_REGS_IN_SRD);
-	}
+	intel_display_hsw_init_clock_gating(i915->display);
 
 	/* This is required by WaCatErrorRejectionIssue:hsw */
 	intel_uncore_rmw(&i915->uncore, GEN7_SQ_CHICKEN_MBCUNIT_CONFIG,
-- 
2.53.0

