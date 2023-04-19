Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23991C6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 12:40:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0401D10E972;
	Wed, 19 Apr 2023 12:40:34 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F07110E96B
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 12:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681908032; x=1713444032;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dDLJDgXUdTRGHTT0bq3L8kFOcEVGwGTAI3A7v3XgTDU=;
 b=c2nlwzdk1ugFgCQDPVltBJQmoOEcRt+uxX/5vVoUnaqm48RfMHuanb05
 aLsvfj1CcskLsTGtX8a3xe1KD/t9xC5zyp1KNuQmanGdHxxbzbfp/Lj6J
 vvE20Z2Q5DP7/4zF/09nEJYqp3lgkFJVJSgTp+1XKD89MRYOFm6InFW3u
 znSkXleliHBoWe9V4GqSdVTpKq14y8KAHXzw6zW1X1VOSEMBtbX8NjlyB
 NtCG3TuI6Lvqv6DKjvSJUDjHpqOJwXXXJUo73ZM0m079Nz/89+wron83D
 rpbVzosUqzL5IRBBeVr2ifvRQaoy7yjBzgSi8QCUGEdmYUfrFWignch2H w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="348189515"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="348189515"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:40:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="937660306"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="937660306"
Received: from yedidyal-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.37])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:40:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Apr 2023 15:39:43 +0300
Message-Id: <20230419123947.543175-6-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230419123947.543175-1-jani.nikula@intel.com>
References: <20230419123947.543175-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/9] drm/i915: rename intel_pm.[ch] to
 intel_clock_gating.[ch]
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

Observe that intel_pm.[ch] is now purely about clock gating, so rename
them to intel_clock_gating.[ch]. Rename the functions to
intel_clock_gating_*() to follow coding conventions.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230403122428.3526263-1-jani.nikula@intel.com
(cherry picked from commit d670c78ea7564f9baf915c8e1dc5898a9e6c360b)
---
 drivers/gpu/drm/i915/Makefile                  |  2 +-
 drivers/gpu/drm/i915/display/intel_display.c   |  4 ++--
 drivers/gpu/drm/i915/i915_driver.c             |  8 ++++----
 drivers/gpu/drm/i915/i915_gem.c                |  8 ++++----
 .../i915/{intel_pm.c => intel_clock_gating.c}  |  8 ++++----
 drivers/gpu/drm/i915/intel_clock_gating.h      | 14 ++++++++++++++
 drivers/gpu/drm/i915/intel_pm.h                | 18 ------------------
 drivers/gpu/drm/i915/vlv_suspend.c             |  4 ++--
 8 files changed, 31 insertions(+), 35 deletions(-)
 rename drivers/gpu/drm/i915/{intel_pm.c => intel_clock_gating.c} (99%)
 create mode 100644 drivers/gpu/drm/i915/intel_clock_gating.h
 delete mode 100644 drivers/gpu/drm/i915/intel_pm.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 09a8106c284b..48846365436e 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -47,10 +47,10 @@ i915-y += i915_driver.o \
 	  i915_switcheroo.o \
 	  i915_sysfs.o \
 	  i915_utils.o \
+	  intel_clock_gating.o \
 	  intel_device_info.o \
 	  intel_memory_region.o \
 	  intel_pcode.o \
-	  intel_pm.o \
 	  intel_region_ttm.o \
 	  intel_runtime_pm.o \
 	  intel_sbi.o \
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 6d9abc95dbcd..28a227450329 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -65,6 +65,7 @@
 #include "intel_audio.h"
 #include "intel_bw.h"
 #include "intel_cdclk.h"
+#include "intel_clock_gating.h"
 #include "intel_color.h"
 #include "intel_crt.h"
 #include "intel_crtc.h"
@@ -106,7 +107,6 @@
 #include "intel_pch_refclk.h"
 #include "intel_pipe_crc.h"
 #include "intel_plane_initial.h"
-#include "intel_pm.h"
 #include "intel_pps.h"
 #include "intel_psr.h"
 #include "intel_quirks.h"
@@ -852,7 +852,7 @@ void intel_display_finish_reset(struct drm_i915_private *i915)
 		 */
 		intel_pps_unlock_regs_wa(i915);
 		intel_modeset_init_hw(i915);
-		intel_init_clock_gating(i915);
+		intel_clock_gating_init(i915);
 		intel_hpd_init(i915);
 
 		ret = __intel_display_resume(i915, state, ctx);
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 066d79c2069c..f68ad1e2c529 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -79,11 +79,11 @@
 #include "soc/intel_dram.h"
 #include "soc/intel_gmch.h"
 
-#include "i915_file_private.h"
 #include "i915_debugfs.h"
 #include "i915_driver.h"
 #include "i915_drm_client.h"
 #include "i915_drv.h"
+#include "i915_file_private.h"
 #include "i915_getparam.h"
 #include "i915_hwmon.h"
 #include "i915_ioc32.h"
@@ -97,11 +97,11 @@
 #include "i915_sysfs.h"
 #include "i915_utils.h"
 #include "i915_vgpu.h"
+#include "intel_clock_gating.h"
 #include "intel_gvt.h"
 #include "intel_memory_region.h"
 #include "intel_pci_config.h"
 #include "intel_pcode.h"
-#include "intel_pm.h"
 #include "intel_region_ttm.h"
 #include "vlv_suspend.h"
 
@@ -254,7 +254,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
 
 	intel_irq_init(dev_priv);
 	intel_init_display_hooks(dev_priv);
-	intel_init_clock_gating_hooks(dev_priv);
+	intel_clock_gating_hooks_init(dev_priv);
 
 	intel_detect_preproduction_hw(dev_priv);
 
@@ -1234,7 +1234,7 @@ static int i915_drm_resume(struct drm_device *dev)
 	i915_gem_resume(dev_priv);
 
 	intel_modeset_init_hw(dev_priv);
-	intel_init_clock_gating(dev_priv);
+	intel_clock_gating_init(dev_priv);
 	intel_hpd_init(dev_priv);
 
 	/* MST sideband requires HPD interrupts enabled */
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index cf100ce56704..c82726c37e2d 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -57,7 +57,7 @@
 #include "i915_file_private.h"
 #include "i915_trace.h"
 #include "i915_vgpu.h"
-#include "intel_pm.h"
+#include "intel_clock_gating.h"
 
 static int
 insert_mappable_node(struct i915_ggtt *ggtt, struct drm_mm_node *node, u32 size)
@@ -1158,7 +1158,7 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
 	}
 
 	/*
-	 * Despite its name intel_init_clock_gating applies both display
+	 * Despite its name intel_clock_gating_init applies both display
 	 * clock gating workarounds; GT mmio workarounds and the occasional
 	 * GT power context workaround. Worse, sometimes it includes a context
 	 * register workaround which we need to apply before we record the
@@ -1166,7 +1166,7 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
 	 *
 	 * FIXME: break up the workarounds and apply them at the right time!
 	 */
-	intel_init_clock_gating(dev_priv);
+	intel_clock_gating_init(dev_priv);
 
 	for_each_gt(gt, dev_priv, i) {
 		ret = intel_gt_init(gt);
@@ -1210,7 +1210,7 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
 		/* Minimal basic recovery for KMS */
 		ret = i915_ggtt_enable_hw(dev_priv);
 		i915_ggtt_resume(to_gt(dev_priv)->ggtt);
-		intel_init_clock_gating(dev_priv);
+		intel_clock_gating_init(dev_priv);
 	}
 
 	i915_gem_drain_freed_objects(dev_priv);
diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_clock_gating.c
similarity index 99%
rename from drivers/gpu/drm/i915/intel_pm.c
rename to drivers/gpu/drm/i915/intel_clock_gating.c
index c45af0d981fd..8cfc19b48760 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
@@ -36,8 +36,8 @@
 #include "gt/intel_gt_regs.h"
 
 #include "i915_drv.h"
+#include "intel_clock_gating.h"
 #include "intel_mchbar_regs.h"
-#include "intel_pm.h"
 #include "vlv_sideband.h"
 
 struct drm_i915_clock_gating_funcs {
@@ -774,7 +774,7 @@ static void i830_init_clock_gating(struct drm_i915_private *dev_priv)
 		   _MASKED_BIT_ENABLE(MEM_DISPLAY_B_TRICKLE_FEED_DISABLE));
 }
 
-void intel_init_clock_gating(struct drm_i915_private *dev_priv)
+void intel_clock_gating_init(struct drm_i915_private *dev_priv)
 {
 	dev_priv->clock_gating_funcs->init_clock_gating(dev_priv);
 }
@@ -818,7 +818,7 @@ CG_FUNCS(nop);
 #undef CG_FUNCS
 
 /**
- * intel_init_clock_gating_hooks - setup the clock gating hooks
+ * intel_clock_gating_hooks_init - setup the clock gating hooks
  * @dev_priv: device private
  *
  * Setup the hooks that configure which clocks of a given platform can be
@@ -826,7 +826,7 @@ CG_FUNCS(nop);
  * platforms. Note that some GT specific workarounds are applied separately
  * when GPU contexts or batchbuffers start their execution.
  */
-void intel_init_clock_gating_hooks(struct drm_i915_private *dev_priv)
+void intel_clock_gating_hooks_init(struct drm_i915_private *dev_priv)
 {
 	if (IS_METEORLAKE(dev_priv))
 		dev_priv->clock_gating_funcs = &nop_clock_gating_funcs;
diff --git a/drivers/gpu/drm/i915/intel_clock_gating.h b/drivers/gpu/drm/i915/intel_clock_gating.h
new file mode 100644
index 000000000000..5b4e4c55b2c2
--- /dev/null
+++ b/drivers/gpu/drm/i915/intel_clock_gating.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2019 Intel Corporation
+ */
+
+#ifndef __INTEL_CLOCK_GATING_H__
+#define __INTEL_CLOCK_GATING_H__
+
+struct drm_i915_private;
+
+void intel_clock_gating_init(struct drm_i915_private *i915);
+void intel_clock_gating_hooks_init(struct drm_i915_private *i915);
+
+#endif /* __INTEL_CLOCK_GATING_H__ */
diff --git a/drivers/gpu/drm/i915/intel_pm.h b/drivers/gpu/drm/i915/intel_pm.h
deleted file mode 100644
index f774bddcdca6..000000000000
--- a/drivers/gpu/drm/i915/intel_pm.h
+++ /dev/null
@@ -1,18 +0,0 @@
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
-void intel_init_clock_gating_hooks(struct drm_i915_private *dev_priv);
-
-#endif /* __INTEL_PM_H__ */
diff --git a/drivers/gpu/drm/i915/vlv_suspend.c b/drivers/gpu/drm/i915/vlv_suspend.c
index 02e63ed77f60..94595dde2b96 100644
--- a/drivers/gpu/drm/i915/vlv_suspend.c
+++ b/drivers/gpu/drm/i915/vlv_suspend.c
@@ -12,7 +12,7 @@
 #include "i915_reg.h"
 #include "i915_trace.h"
 #include "i915_utils.h"
-#include "intel_pm.h"
+#include "intel_clock_gating.h"
 #include "vlv_suspend.h"
 
 #include "gt/intel_gt_regs.h"
@@ -451,7 +451,7 @@ int vlv_resume_prepare(struct drm_i915_private *dev_priv, bool rpm_resume)
 	vlv_check_no_gt_access(dev_priv);
 
 	if (rpm_resume)
-		intel_init_clock_gating(dev_priv);
+		intel_clock_gating_init(dev_priv);
 
 	return ret;
 }
-- 
2.39.2

