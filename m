Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE88F532EA
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 08:05:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B8F10E5FB;
	Tue, 24 Mar 2026 08:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gqnOwvZX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBFE10E5C3;
 Tue, 24 Mar 2026 08:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774339497; x=1805875497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2ulQqAnx622WhRDHg6DY4p88EbOC6aDrU8CDZ3q/guY=;
 b=gqnOwvZXNeJwEEfRaTgEy2UmakzFbk/W0H5LfakXj9WNwvmS/HFN3CXu
 UmOsLKGuYt2w/O5iMQfb7nxnSlO7+kHkv+Ex6tgyUMrky93Q+S1lCL/Qw
 wXAMz5yd6hW3OYcRR+Hj5g5wRR4PgYItH9fxUQlWbN5t20rEnQBC5o/oV
 zayHtooRDvSIiGPL+UjTiVzZn9w6Hs1kPQUkpdbDb3sr6CtiUZ1TIIeH+
 CDLewr5v+oBcuaJ/J8cgLyru0e1HSB+9e4LEOBZ9geFvfOX2RaNY3Rkgx
 C7X0dVd4qTSfnntvtYOtQS9WquQwfJGUVaM8Pm1xvQ2wBq7NAuHCVMiph w==;
X-CSE-ConnectionGUID: o1+EPlj6QBe67Fk/BlhDqg==
X-CSE-MsgGUID: wZwOYfrEQ5aVrbhCD3OTeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86045470"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="86045470"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 01:04:57 -0700
X-CSE-ConnectionGUID: SdVXkPS1SkSJrZGp7RaXVQ==
X-CSE-MsgGUID: SHYUoS+cQdiFUCJvUbmAdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="223494954"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.170])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 01:04:55 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v2 1/4] drm/i915/display: move clock-gating init for IBX to
 display
Date: Tue, 24 Mar 2026 10:04:25 +0200
Message-ID: <20260324080441.154609-2-luciano.coelho@intel.com>
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

Add a new function in the display code to help initialize clock-gating
without reading display PCH registers directly from non-display code.

This adds a mini-framework to deal with display-specific PCH registers
and uses it for IBX as a start.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_pch.c  | 24 +++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_pch.h  |  1 +
 drivers/gpu/drm/i915/intel_clock_gating.c | 13 ++----------
 3 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pch.c b/drivers/gpu/drm/i915/display/intel_pch.c
index 65359a36df48..65812b720bda 100644
--- a/drivers/gpu/drm/i915/display/intel_pch.c
+++ b/drivers/gpu/drm/i915/display/intel_pch.c
@@ -5,6 +5,8 @@
 
 #include <drm/drm_print.h>
 
+#include "intel_de.h"
+#include "intel_display_regs.h"
 #include "intel_display_core.h"
 #include "intel_display_utils.h"
 #include "intel_pch.h"
@@ -214,6 +216,28 @@ intel_pch_type(const struct intel_display *display, unsigned short id)
 	}
 }
 
+static void intel_pch_ibx_init_clock_gating(struct intel_display *display)
+{
+	/*
+	 * On Ibex Peak and Cougar Point, we need to disable clock
+	 * gating for the panel power sequencer or it will fail to
+	 * start up when no ports are active.
+	 */
+	intel_de_write(display, SOUTH_DSPCLK_GATE_D,
+		       PCH_DPLSUNIT_CLOCK_GATE_DISABLE);
+}
+
+void intel_pch_init_clock_gating(struct intel_display *display)
+{
+	switch (INTEL_PCH_TYPE(display)) {
+	case PCH_IBX:
+		intel_pch_ibx_init_clock_gating(display);
+		break;
+	default:
+		break;
+	}
+}
+
 static bool intel_is_virt_pch(unsigned short id,
 			      unsigned short svendor, unsigned short sdevice)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_pch.h b/drivers/gpu/drm/i915/display/intel_pch.h
index 19cac7412d0a..aa971fa141e7 100644
--- a/drivers/gpu/drm/i915/display/intel_pch.h
+++ b/drivers/gpu/drm/i915/display/intel_pch.h
@@ -52,5 +52,6 @@ enum intel_pch {
 #define HAS_PCH_SPLIT(display)			(INTEL_PCH_TYPE(display) != PCH_NONE)
 
 void intel_pch_detect(struct intel_display *display);
+void intel_pch_init_clock_gating(struct intel_display *display);
 
 #endif /* __INTEL_PCH__ */
diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index 68a6f94f2a37..c0382607224d 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
@@ -33,6 +33,7 @@
 #include "display/intel_display.h"
 #include "display/intel_display_core.h"
 #include "display/intel_display_regs.h"
+#include "display/intel_pch.h"
 #include "gt/intel_engine_regs.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_mcr.h"
@@ -124,16 +125,6 @@ static void glk_init_clock_gating(struct drm_i915_private *i915)
 			   PWM1_GATING_DIS | PWM2_GATING_DIS);
 }
 
-static void ibx_init_clock_gating(struct drm_i915_private *i915)
-{
-	/*
-	 * On Ibex Peak and Cougar Point, we need to disable clock
-	 * gating for the panel power sequencer or it will fail to
-	 * start up when no ports are active.
-	 */
-	intel_uncore_write(&i915->uncore, SOUTH_DSPCLK_GATE_D, PCH_DPLSUNIT_CLOCK_GATE_DISABLE);
-}
-
 static void g4x_disable_trickle_feed(struct drm_i915_private *dev_priv)
 {
 	struct intel_display *display = dev_priv->display;
@@ -202,7 +193,7 @@ static void ilk_init_clock_gating(struct drm_i915_private *i915)
 
 	g4x_disable_trickle_feed(i915);
 
-	ibx_init_clock_gating(i915);
+	intel_pch_init_clock_gating(i915->display);
 }
 
 static void cpt_init_clock_gating(struct drm_i915_private *i915)
-- 
2.53.0

