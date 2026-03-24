Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41464F54AC7
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 14:34:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CE310E6EA;
	Tue, 24 Mar 2026 14:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HetHpVr0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F9710E136;
 Tue, 24 Mar 2026 14:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774362893; x=1805898893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wIehxnZmnd19yxaw0QGzo0PE4gopzMIA2uLY+n8EFwA=;
 b=HetHpVr0IaWgzZuoZr9AAoUVXXfBilqcRHQINMgAufzzKcXZlI586X1u
 JSRAiB8lmBbMM1F1wmU1MW8MErWU6kBTocNT4O6GRs8IWqphsi4ghRk+h
 TZ79cuCc5qpL6NDwCCtVfhOBsF5lLjhB4h5jpOP4Gj1txWo1Vu2msVjjD
 x6WN0B2UejAyMxgmIe7V1W31uW/d7oLxbrHYlM+ZoTLcHhoumQ5hXTVF2
 SOeBH8qcBWZPbqQ/I/Rrc8C6pmFwk1XU6zXhCfhEWmNcK3BfG+C32DGw6
 OnXLg3501RxRzr51Gj6053Ocmf1ENT35yg4ADXJF+4+r7O9hGz3FuPCxO g==;
X-CSE-ConnectionGUID: +IjotzcyTNebyBqR63xbPg==
X-CSE-MsgGUID: Ks4vZUdMQpu+ukGy3oa3aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75405165"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75405165"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 07:34:50 -0700
X-CSE-ConnectionGUID: oR2PndcJReGafct3s3UtcA==
X-CSE-MsgGUID: f3vJhnrGTHGWvz3RcntfCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="228843227"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.170])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 07:34:47 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH 6/8] drm/i915/display: move HSW and BDW clock gating init to
 display
Date: Tue, 24 Mar 2026 16:29:55 +0200
Message-ID: <20260324143420.310800-7-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324143420.310800-1-luciano.coelho@intel.com>
References: <20260324143420.310800-1-luciano.coelho@intel.com>
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
 .../i915/display/intel_display_clock_gating.c | 33 +++++++++++++++++++
 .../i915/display/intel_display_clock_gating.h |  6 ++++
 drivers/gpu/drm/i915/intel_clock_gating.c     | 31 +++--------------
 3 files changed, 43 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
index e3b7522b4101..0b2edf6acb79 100644
--- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
+++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.c
@@ -123,3 +123,36 @@ void intel_display_glk_init_clock_gating(struct intel_display *display)
 		       intel_de_read(display, GEN9_CLKGATE_DIS_0) |
 		       PWM1_GATING_DIS | PWM2_GATING_DIS);
 }
+
+static void
+intel_display_hsw_init_clock_gating_common(struct intel_display *display,
+					   u32 unmask_vbl)
+{
+	enum pipe pipe;
+
+	/* WaPsrDPAMaskVBlankInSRD:hsw */
+	intel_de_rmw(display, CHICKEN_PAR1_1, 0, HSW_MASK_VBL_TO_PIPE_IN_SRD);
+
+	for_each_pipe(display, pipe) {
+		/* WaPsrDPRSUnmaskVBlankInSRD:hsw,bdw */
+		intel_de_rmw(display, CHICKEN_PIPESL_1(pipe), 0, unmask_vbl);
+	}
+}
+
+void intel_display_bdw_hsw_init_clock_gating(struct intel_display *display)
+{
+	/* WaFbcAsynchFlipDisableFbcQueue:hsw,bdw */
+	intel_de_rmw(display, CHICKEN_PIPESL_1(PIPE_A), 0, HSW_FBCQ_DIS);
+}
+
+void intel_display_bdw_init_clock_gating(struct intel_display *display)
+{
+	intel_display_hsw_init_clock_gating_common(display,
+						   BDW_UNMASK_VBL_TO_REGS_IN_SRD);
+}
+
+void intel_display_hsw_init_clock_gating(struct intel_display *display)
+{
+	intel_display_hsw_init_clock_gating_common(display,
+						   HSW_UNMASK_VBL_TO_REGS_IN_SRD);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
index 4abd34fa5832..0eb240f2f69e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
+++ b/drivers/gpu/drm/i915/display/intel_display_clock_gating.h
@@ -14,12 +14,18 @@ void intel_display_kbl_init_clock_gating(struct intel_display *display);
 void intel_display_cfl_init_clock_gating(struct intel_display *display);
 void intel_display_bxt_init_clock_gating(struct intel_display *display);
 void intel_display_glk_init_clock_gating(struct intel_display *display);
+void intel_display_bdw_hsw_init_clock_gating(struct intel_display *display);
+void intel_display_bdw_init_clock_gating(struct intel_display *display);
+void intel_display_hsw_init_clock_gating(struct intel_display *display);
 #else
 static inline void intel_display_skl_init_clock_gating(struct intel_display *display) {}
 static inline void intel_display_kbl_init_clock_gating(struct intel_display *display) {}
 static inline void intel_display_cfl_init_clock_gating(struct intel_display *display) {}
 static inline void intel_display_bxt_init_clock_gating(struct intel_display *display) {}
 static inline void intel_display_glk_init_clock_gating(struct intel_display *display) {}
+static inline void intel_display_bdw_hsw_init_clock_gating(struct intel_display *display) {}
+static inline void intel_display_bdw_init_clock_gating(struct intel_display *display) {}
+static inline void intel_display_hsw_init_clock_gating(struct intel_display *display) {}
 #endif
 
 #endif /* __INTEL_DISPLAY_CLOCK_GATING_H__ */
diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index 777314e0c75d..a8e3eb6f06c8 100644
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
+	intel_display_bdw_hsw_init_clock_gating(i915->display);
 
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
+	intel_display_bdw_init_clock_gating(i915->display);
 
 	/* WaVSRefCountFullforceMissDisable:bdw */
 	/* WaDSRefCountFullforceMissDisable:bdw */
@@ -332,20 +321,8 @@ static void bdw_init_clock_gating(struct drm_i915_private *i915)
 
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
+	intel_display_bdw_hsw_init_clock_gating(i915->display);
+	intel_display_hsw_init_clock_gating(i915->display);
 
 	/* This is required by WaCatErrorRejectionIssue:hsw */
 	intel_uncore_rmw(&i915->uncore, GEN7_SQ_CHICKEN_MBCUNIT_CONFIG,
-- 
2.53.0

