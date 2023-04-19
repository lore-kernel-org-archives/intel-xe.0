Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559DDC77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 12:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FAF710E96B;
	Wed, 19 Apr 2023 12:40:33 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C0510E96B
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 12:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681908031; x=1713444031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DHj0/6l7cA7C6NijMmz/GuFGkFWGswmAi4bLoeGYBZ8=;
 b=KmuWAniEJHgRksxRCvG7tPXm1jJfRdjrgofTnNavQAldHbpV8rRvw48v
 kWHEyfFJJi+NQha9cRrkcnQBaO4NeZ9nfSWu70zxIy4VICYUwHAyncMhc
 M+BPgbhzj1hw/EmDDMaiEG+1fVIHlB+2j8rj+0f4dT2jqXNTGjMMhFjzv
 095rbLJbyiVncQtJNwtacnUX2NhVthPbMDYSWqFRtark4yEsY7wzS3kgH
 BCmYPMByTfK+9p4jJJeYgV1tChjb9DpIab9Mvz68kohVQQnNRI9fAZvV8
 0Py1cgJQwLdiSwWuVUvnS6Hz6SBBaos9fFW5aqN/wWtutdU92UujSkDeG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="348189508"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="348189508"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:40:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="802909828"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="802909828"
Received: from yedidyal-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.37])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:40:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Apr 2023 15:39:44 +0300
Message-Id: <20230419123947.543175-7-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230419123947.543175-1-jani.nikula@intel.com>
References: <20230419123947.543175-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/9] fixup! drm/xe/display: Implement display
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Prepare for the inevitable rebase.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |  4 +--
 .../compat-i915-headers/intel_clock_gating.h  |  1 +
 drivers/gpu/drm/xe/display/ext/i915_irq.c     |  2 +-
 .../ext/{intel_pm.c => intel_clock_gating.c}  |  4 +--
 drivers/gpu/drm/xe/display/ext/intel_pm.h     | 29 -------------------
 drivers/gpu/drm/xe/xe_display.c               |  4 +--
 6 files changed, 8 insertions(+), 36 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h
 rename drivers/gpu/drm/xe/display/ext/{intel_pm.c => intel_clock_gating.c} (97%)
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_pm.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 61739cacbc5b..ee4a95beec20 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -120,10 +120,10 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/xe_plane_initial.o \
 	display/xe_display_rps.o \
 	display/ext/i915_irq.o \
+	display/ext/intel_clock_gating.o \
 	display/ext/intel_device_info.o \
 	display/ext/intel_dram.o \
-	display/ext/intel_pch.o \
-	display/ext/intel_pm.o
+	display/ext/intel_pch.o
 
 # Display code shared with i915
 xe-$(CONFIG_DRM_XE_DISPLAY) += \
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h
new file mode 100644
index 000000000000..6e35e0bace9e
--- /dev/null
+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h
@@ -0,0 +1 @@
+#include "../../i915/intel_clock_gating.h"
diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
index 61faf15b6bf0..8a97c3f45620 100644
--- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
@@ -63,7 +63,7 @@ static void raw_reg_write(void __iomem *base, i915_reg_t reg, u32 value)
 }
 
 #include "i915_irq.h"
-#include "intel_pm.h"
+#include "intel_clock_gating.h"
 
 static void gen3_irq_reset(struct xe_device *dev_priv, i915_reg_t imr,
 		    i915_reg_t iir, i915_reg_t ier)
diff --git a/drivers/gpu/drm/xe/display/ext/intel_pm.c b/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
similarity index 97%
rename from drivers/gpu/drm/xe/display/ext/intel_pm.c
rename to drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
index 62219a010d62..7d1854652d17 100644
--- a/drivers/gpu/drm/xe/display/ext/intel_pm.c
+++ b/drivers/gpu/drm/xe/display/ext/intel_clock_gating.c
@@ -29,8 +29,8 @@
 #include "intel_display_trace.h"
 
 #include "i915_drv.h"
+#include "intel_clock_gating.h"
 #include "intel_mchbar_regs.h"
-#include "intel_pm.h"
 
 static void gen12lp_init_clock_gating(struct drm_i915_private *dev_priv)
 {
@@ -104,7 +104,7 @@ static void pvc_init_clock_gating(struct drm_i915_private *dev_priv)
 		intel_de_rmw(dev_priv, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_DIS);
 }
 
-void intel_init_clock_gating(struct drm_i915_private *dev_priv)
+void intel_clock_gating_init(struct drm_i915_private *dev_priv)
 {
 	if (IS_PONTEVECCHIO(dev_priv))
 		pvc_init_clock_gating(dev_priv);
diff --git a/drivers/gpu/drm/xe/display/ext/intel_pm.h b/drivers/gpu/drm/xe/display/ext/intel_pm.h
deleted file mode 100644
index 482b714d1d22..000000000000
--- a/drivers/gpu/drm/xe/display/ext/intel_pm.h
+++ /dev/null
@@ -1,29 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2019 Intel Corporation
- */
-
-#ifndef __INTEL_PM_H__
-#define __INTEL_PM_H__
-
-#include <linux/types.h>
-
-struct drm_i915_private;
-struct intel_crtc_state;
-struct intel_plane_state;
-
-void intel_init_clock_gating(struct drm_i915_private *dev_priv);
-void intel_suspend_hw(struct drm_i915_private *dev_priv);
-int ilk_wm_max_level(const struct drm_i915_private *dev_priv);
-void intel_init_pm(struct drm_i915_private *dev_priv);
-void intel_init_clock_gating_hooks(struct drm_i915_private *dev_priv);
-void intel_pm_setup(struct drm_i915_private *dev_priv);
-void ilk_wm_get_hw_state(struct drm_i915_private *dev_priv);
-bool intel_wm_plane_visible(const struct intel_crtc_state *crtc_state,
-			    const struct intel_plane_state *plane_state);
-void intel_print_wm_latency(struct drm_i915_private *dev_priv,
-			    const char *name, const u16 wm[]);
-
-bool intel_set_memory_cxsr(struct drm_i915_private *dev_priv, bool enable);
-
-#endif /* __INTEL_PM_H__ */
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index aae362f27c77..a8af9eddb496 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -17,10 +17,10 @@
 
 #include "ext/i915_irq.h"
 #include "ext/intel_dram.h"
-#include "ext/intel_pm.h"
 #include "intel_acpi.h"
 #include "intel_audio.h"
 #include "intel_bw.h"
+#include "intel_clock_gating.h"
 #include "intel_display.h"
 #include "intel_display_types.h"
 #include "intel_dmc.h"
@@ -379,7 +379,7 @@ void xe_display_pm_resume(struct xe_device *xe)
 		drm_mode_config_reset(&xe->drm);
 
 	intel_modeset_init_hw(xe);
-	intel_init_clock_gating(xe);
+	intel_clock_gating_init(xe);
 	intel_hpd_init(xe);
 
 	/* MST sideband requires HPD interrupts enabled */
-- 
2.39.2

