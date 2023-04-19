Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB2FC6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 12:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A37210E96B;
	Wed, 19 Apr 2023 12:40:37 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4D310E973
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 12:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681908035; x=1713444035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XOejXoM8C0ueF6cFAzss8lNHjiwziChphuDvLZQbPBA=;
 b=lN1lOrI8FNc0JFiv2ytRiu2N+oHDB9GsFVEFiS5A5YFyiIXyWsHUX2z7
 5+37FpDm/vpO/Gxasu5Je9Dvm41fYwfB/BJIhJwYbpvGwMP5GRcROQJcv
 2MAkL1A++n8PQWLseXMgMXAi46NzxnrAv4smLnRGpxr4xkjoiCXn11pHa
 44ecPart8Wm2ZTmvxNPeuA9CMTC7mrS2LHxcai1eLYjq3z+RhhhBx8G0/
 HVjrCi4ztsvuA2/MjxSUzWJXSWr065Nh8Disq5BhtLSV+xFph6vYYz+fY
 QKy9OvJrIawgvtwtMYKGg+yXOzWW16Md9g2hzN0I2l/ovsPVE1SV3WaOF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="431711547"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="431711547"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:40:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="865821850"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="865821850"
Received: from yedidyal-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.37])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:40:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Apr 2023 15:39:45 +0300
Message-Id: <20230419123947.543175-8-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230419123947.543175-1-jani.nikula@intel.com>
References: <20230419123947.543175-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 7/9] drm/i915: use explicit includes for
 i915_reg.h and i915_irq.h
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

A lot of places include i915_reg.h implicitly via i915_irq.h, which gets
included implicitly via intel_display_trace.h. Remove the includes from
the headers, and include i915_reg.h and i915_irq.h explicitly where
needed.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230419094243.366821-1-jani.nikula@intel.com
---
 drivers/gpu/drm/i915/display/i9xx_wm.c                  | 1 +
 drivers/gpu/drm/i915/display/intel_display_power.c      | 1 +
 drivers/gpu/drm/i915/display/intel_display_power_well.c | 1 +
 drivers/gpu/drm/i915/display/intel_display_trace.h      | 1 -
 drivers/gpu/drm/i915/display/intel_fbc.c                | 1 +
 drivers/gpu/drm/i915/display/intel_fifo_underrun.c      | 2 ++
 drivers/gpu/drm/i915/gt/intel_gt_irq.c                  | 1 +
 drivers/gpu/drm/i915/gt/intel_reset.c                   | 1 +
 drivers/gpu/drm/i915/gt/intel_rps.c                     | 1 +
 drivers/gpu/drm/i915/gt/selftest_rps.c                  | 1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c                  | 1 +
 drivers/gpu/drm/i915/i915_debugfs.c                     | 1 +
 drivers/gpu/drm/i915/i915_irq.c                         | 1 +
 drivers/gpu/drm/i915/i915_irq.h                         | 2 +-
 drivers/gpu/drm/i915/intel_clock_gating.c               | 1 +
 15 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.c b/drivers/gpu/drm/i915/display/i9xx_wm.c
index caef72d38798..e42f5844ae56 100644
--- a/drivers/gpu/drm/i915/display/i9xx_wm.c
+++ b/drivers/gpu/drm/i915/display/i9xx_wm.c
@@ -4,6 +4,7 @@
  */
 
 #include "i915_drv.h"
+#include "i915_reg.h"
 #include "i9xx_wm.h"
 #include "intel_atomic.h"
 #include "intel_display.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index d02378d2ab4e..d5330db12846 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -7,6 +7,7 @@
 
 #include "i915_drv.h"
 #include "i915_irq.h"
+#include "i915_reg.h"
 #include "intel_backlight_regs.h"
 #include "intel_cdclk.h"
 #include "intel_combo_phy.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index bd86f570f462..dfd3fd250f1c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -5,6 +5,7 @@
 
 #include "i915_drv.h"
 #include "i915_irq.h"
+#include "i915_reg.h"
 #include "intel_backlight_regs.h"
 #include "intel_combo_phy.h"
 #include "intel_combo_phy_regs.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_trace.h b/drivers/gpu/drm/i915/display/intel_display_trace.h
index 651ea8564e1b..99bdb833591c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_trace.h
+++ b/drivers/gpu/drm/i915/display/intel_display_trace.h
@@ -14,7 +14,6 @@
 #include <linux/tracepoint.h>
 
 #include "i915_drv.h"
-#include "i915_irq.h"
 #include "intel_crtc.h"
 #include "intel_display_types.h"
 #include "intel_vblank.h"
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index b1e7b2588fd9..9dc7083fe974 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -44,6 +44,7 @@
 #include <drm/drm_fourcc.h>
 
 #include "i915_drv.h"
+#include "i915_reg.h"
 #include "i915_utils.h"
 #include "i915_vgpu.h"
 #include "intel_cdclk.h"
diff --git a/drivers/gpu/drm/i915/display/intel_fifo_underrun.c b/drivers/gpu/drm/i915/display/intel_fifo_underrun.c
index b708a62e509a..e7f77a225739 100644
--- a/drivers/gpu/drm/i915/display/intel_fifo_underrun.c
+++ b/drivers/gpu/drm/i915/display/intel_fifo_underrun.c
@@ -26,6 +26,8 @@
  */
 
 #include "i915_drv.h"
+#include "i915_reg.h"
+#include "i915_irq.h"
 #include "intel_de.h"
 #include "intel_display_trace.h"
 #include "intel_display_types.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
index 1b25a6039152..c0f3ff4746ad 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
@@ -7,6 +7,7 @@
 
 #include "i915_drv.h"
 #include "i915_irq.h"
+#include "i915_reg.h"
 #include "intel_breadcrumbs.h"
 #include "intel_gt.h"
 #include "intel_gt_irq.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 0bb9094fdacd..382a72727582 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -18,6 +18,7 @@
 #include "i915_file_private.h"
 #include "i915_gpu_error.h"
 #include "i915_irq.h"
+#include "i915_reg.h"
 #include "intel_breadcrumbs.h"
 #include "intel_engine_pm.h"
 #include "intel_engine_regs.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 6d7395aa404a..7bdc140addf6 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -10,6 +10,7 @@
 #include "display/intel_display.h"
 #include "i915_drv.h"
 #include "i915_irq.h"
+#include "i915_reg.h"
 #include "intel_breadcrumbs.h"
 #include "intel_gt.h"
 #include "intel_gt_clock_utils.h"
diff --git a/drivers/gpu/drm/i915/gt/selftest_rps.c b/drivers/gpu/drm/i915/gt/selftest_rps.c
index 84e77e8dbba1..fb30f733b036 100644
--- a/drivers/gpu/drm/i915/gt/selftest_rps.c
+++ b/drivers/gpu/drm/i915/gt/selftest_rps.c
@@ -8,6 +8,7 @@
 
 #include "gem/i915_gem_internal.h"
 
+#include "i915_reg.h"
 #include "intel_engine_heartbeat.h"
 #include "intel_engine_pm.h"
 #include "intel_engine_regs.h"
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index d76508fa3af7..e89f16ecf1ae 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -16,6 +16,7 @@
 #include "intel_guc_submission.h"
 #include "i915_drv.h"
 #include "i915_irq.h"
+#include "i915_reg.h"
 
 /**
  * DOC: GuC
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 80c2bf98e341..41389a32e998 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -50,6 +50,7 @@
 #include "i915_debugfs_params.h"
 #include "i915_driver.h"
 #include "i915_irq.h"
+#include "i915_reg.h"
 #include "i915_scheduler.h"
 #include "intel_mchbar_regs.h"
 
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 31271c30a8cf..aa3182918331 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -52,6 +52,7 @@
 #include "i915_driver.h"
 #include "i915_drv.h"
 #include "i915_irq.h"
+#include "i915_reg.h"
 
 /**
  * DOC: interrupt handling
diff --git a/drivers/gpu/drm/i915/i915_irq.h b/drivers/gpu/drm/i915/i915_irq.h
index 03ee4c8b1ed3..7f9e483f6ec3 100644
--- a/drivers/gpu/drm/i915/i915_irq.h
+++ b/drivers/gpu/drm/i915/i915_irq.h
@@ -9,7 +9,7 @@
 #include <linux/ktime.h>
 #include <linux/types.h>
 
-#include "i915_reg.h"
+#include "i915_reg_defs.h"
 
 enum pipe;
 struct drm_crtc;
diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index 8cfc19b48760..6692f74dc37c 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
@@ -36,6 +36,7 @@
 #include "gt/intel_gt_regs.h"
 
 #include "i915_drv.h"
+#include "i915_reg.h"
 #include "intel_clock_gating.h"
 #include "intel_mchbar_regs.h"
 #include "vlv_sideband.h"
-- 
2.39.2

