Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C41F532EE
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 08:05:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6861310E5FE;
	Tue, 24 Mar 2026 08:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A3d1RsiI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DEC410E5FC;
 Tue, 24 Mar 2026 08:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774339501; x=1805875501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=th3qewyR7g4/n9ruspdy/Msa9++KkCtRD5R70M8Aos8=;
 b=A3d1RsiIUVQpWfQjNg1bicDqq3PNoe4/1U8UM1gT6Q3gqknygQNn0QsL
 BYo83PgRA8kr+qS5gadIJvxEfcwGyKgmBFkvG361s+InneePXAbqZSyIh
 wTf+Oze8cnS6o7C4lZd6o8FZf0kvmCcpgZE9KNYdW58lTUNBZooxRwbiH
 lCNZ+NSyJ4uRxUDPtmiP1qfQz+ceJoa91GjYASAIyosWMBGhxUvTTRBC4
 xV3eG7xQOX4N1ERHdkKegavTwK343r81IRJXEckw+6W+OtnF3yzfbFGeK
 hysn91+LcM40aVV4fZQAdlGrT3UWimM1RNn5J9bfm7SjWxdF52kNzioZs A==;
X-CSE-ConnectionGUID: o/QyfCWdSeiz4ZFY/y43UQ==
X-CSE-MsgGUID: cl2Xx8FpQ6WkhuwV1tcB2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86045476"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="86045476"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 01:05:01 -0700
X-CSE-ConnectionGUID: IOiXvkjWTGKfd7EA+PT4lQ==
X-CSE-MsgGUID: DgDjVzOCTYqGi5IVliqO0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="223494969"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.170])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 01:04:59 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v2 3/4] drm/i915: move LPT clock gating init into intel_pch
Date: Tue, 24 Mar 2026 10:04:27 +0200
Message-ID: <20260324080441.154609-4-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324080441.154609-1-luciano.coelho@intel.com>
References: <20260324080441.154609-1-luciano.coelho@intel.com>
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

Move the LPT PCH clock gating programming into
intel_pch_init_clock_gating() and switch the corresponding
Haswell/Broadwell callers to the display-specific code.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_pch.c  | 19 +++++++++++++++++++
 drivers/gpu/drm/i915/intel_clock_gating.c | 21 ++-------------------
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pch.c b/drivers/gpu/drm/i915/display/intel_pch.c
index bcd66bdf2a22..b7fade66b1da 100644
--- a/drivers/gpu/drm/i915/display/intel_pch.c
+++ b/drivers/gpu/drm/i915/display/intel_pch.c
@@ -264,6 +264,21 @@ static void intel_pch_cpt_init_clock_gating(struct intel_display *display)
 			       TRANS_CHICKEN1_DP0UNIT_GC_DISABLE);
 }
 
+static void intel_pch_lpt_init_clock_gating(struct intel_display *display)
+{
+	/*
+	 * TODO: this bit should only be enabled when really needed, then
+	 * disabled when not needed anymore in order to save power.
+	 */
+	if (HAS_PCH_LPT_LP(display))
+		intel_de_rmw(display, SOUTH_DSPCLK_GATE_D, 0,
+			     PCH_LP_PARTITION_LEVEL_DISABLE);
+
+	/* WADPOClockGatingDisable:hsw */
+	intel_de_rmw(display, TRANS_CHICKEN1(PIPE_A), 0,
+		     TRANS_CHICKEN1_DP0UNIT_GC_DISABLE);
+}
+
 void intel_pch_init_clock_gating(struct intel_display *display)
 {
 	switch (INTEL_PCH_TYPE(display)) {
@@ -273,6 +288,10 @@ void intel_pch_init_clock_gating(struct intel_display *display)
 	case PCH_CPT:
 		intel_pch_cpt_init_clock_gating(display);
 		break;
+	case PCH_LPT_H:
+	case PCH_LPT_LP:
+		intel_pch_lpt_init_clock_gating(display);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index 0218196d183a..4c19028a9e20 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
@@ -266,23 +266,6 @@ static void gen6_init_clock_gating(struct drm_i915_private *i915)
 	gen6_check_mch_setup(i915);
 }
 
-static void lpt_init_clock_gating(struct drm_i915_private *i915)
-{
-	struct intel_display *display = i915->display;
-
-	/*
-	 * TODO: this bit should only be enabled when really needed, then
-	 * disabled when not needed anymore in order to save power.
-	 */
-	if (HAS_PCH_LPT_LP(display))
-		intel_uncore_rmw(&i915->uncore, SOUTH_DSPCLK_GATE_D,
-				 0, PCH_LP_PARTITION_LEVEL_DISABLE);
-
-	/* WADPOClockGatingDisable:hsw */
-	intel_uncore_rmw(&i915->uncore, TRANS_CHICKEN1(PIPE_A),
-			 0, TRANS_CHICKEN1_DP0UNIT_GC_DISABLE);
-}
-
 static void gen8_set_l3sqc_credits(struct drm_i915_private *i915,
 				   int general_prio_credits,
 				   int high_prio_credits)
@@ -422,7 +405,7 @@ static void bdw_init_clock_gating(struct drm_i915_private *i915)
 	intel_uncore_rmw(&i915->uncore, CHICKEN_PAR2_1,
 			 0, KVM_CONFIG_CHANGE_NOTIFICATION_SELECT);
 
-	lpt_init_clock_gating(i915);
+	intel_pch_init_clock_gating(i915->display);
 
 	/* WaDisableDopClockGating:bdw
 	 *
@@ -456,7 +439,7 @@ static void hsw_init_clock_gating(struct drm_i915_private *i915)
 	/* WaSwitchSolVfFArbitrationPriority:hsw */
 	intel_uncore_rmw(&i915->uncore, GAM_ECOCHK, 0, HSW_ECOCHK_ARB_PRIO_SOL);
 
-	lpt_init_clock_gating(i915);
+	intel_pch_init_clock_gating(i915->display);
 }
 
 static void ivb_init_clock_gating(struct drm_i915_private *i915)
-- 
2.53.0

