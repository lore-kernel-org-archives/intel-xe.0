Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92555D73E8C
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 20:58:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5294710E912;
	Thu, 29 Jan 2026 20:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCaVE3bA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7988C10E906;
 Thu, 29 Jan 2026 20:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769720331; x=1801256331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CM/6k2sf6WgXyVTGF1GuISPeDWSXFFBru9R4TA4Ia6k=;
 b=mCaVE3bAqWKWUU6rme+M1Axo0zDgdwoEzb9qjLs9igbI0YoOZD1mmaXr
 4Kqum5L+JYIywFX3SotyFuqLFLARneiL2RsFoII0LO4y1tbKhLSx3o9Y5
 UyWUw/z34INTqQ+y2Iz68FwJT3+RBjfZxF+lDevewqwGL0uhjEuElHrec
 qgynGgqgZRNjhEcda23HJ5IHkK+kJ5PTBle/Js11GBeKR867TQ1jZ+1r2
 cynEptKczzZOCba2IupC34f4z5RGIvjheumbyAigym+4rAOk7NrouGrrq
 7xyqxUfGARB/C99iLn1gjxym+3370BF2RId71PohYRUVsuBAExMbOX1j9 g==;
X-CSE-ConnectionGUID: frgLjng2RVi5cykV5bYuzg==
X-CSE-MsgGUID: ik/ZNqqDQgWRCL5Jx2nl3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88545352"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="88545352"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 12:58:50 -0800
X-CSE-ConnectionGUID: hZr0NLcBS2mqcj4zCMPosA==
X-CSE-MsgGUID: ZpKjp817TyuWkkNc9h4rWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="239927283"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa001.fm.intel.com with ESMTP; 29 Jan 2026 12:58:48 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v3 19/19] drm/{i915, xe}: Remove i915_reg.h from display
Date: Fri, 30 Jan 2026 02:43:58 +0530
Message-ID: <20260129211358.1240283-20-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260129211358.1240283-1-uma.shankar@intel.com>
References: <20260129211358.1240283-1-uma.shankar@intel.com>
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

Make display files free from including i915_reg.h.

v2: Include modular per component headers (Jani)

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/hsw_ips.c               | 2 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c            | 1 -
 drivers/gpu/drm/i915/display/icl_dsi.c               | 1 -
 drivers/gpu/drm/i915/display/intel_backlight.c       | 1 -
 drivers/gpu/drm/i915/display/intel_bw.c              | 2 +-
 drivers/gpu/drm/i915/display/intel_casf.c            | 1 -
 drivers/gpu/drm/i915/display/intel_ddi.c             | 1 -
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 1 -
 drivers/gpu/drm/i915/display/intel_display_power.c   | 2 +-
 drivers/gpu/drm/i915/display/intel_display_wa.c      | 1 -
 drivers/gpu/drm/i915/display/intel_dmc.c             | 1 -
 drivers/gpu/drm/i915/display/intel_fdi.c             | 1 -
 drivers/gpu/drm/i915/display/intel_hdcp.c            | 2 +-
 drivers/gpu/drm/i915/display/intel_hotplug_irq.c     | 1 -
 drivers/gpu/drm/i915/display/intel_lt_phy.c          | 1 -
 drivers/gpu/drm/i915/display/intel_pps.c             | 1 -
 drivers/gpu/drm/i915/display/intel_tc.c              | 1 -
 drivers/gpu/drm/i915/display/skl_watermark.c         | 2 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c               | 1 -
 19 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/hsw_ips.c b/drivers/gpu/drm/i915/display/hsw_ips.c
index 0caaea2e64e1..5697fa4eb11f 100644
--- a/drivers/gpu/drm/i915/display/hsw_ips.c
+++ b/drivers/gpu/drm/i915/display/hsw_ips.c
@@ -6,9 +6,9 @@
 #include <linux/debugfs.h>
 
 #include <drm/drm_print.h>
+#include <drm/intel/intel_pcode.h>
 
 #include "hsw_ips.h"
-#include "i915_reg.h"
 #include "intel_color_regs.h"
 #include "intel_de.h"
 #include "intel_display_regs.h"
diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
index b1fecf178906..9c16753a1f3b 100644
--- a/drivers/gpu/drm/i915/display/i9xx_plane.c
+++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
@@ -10,7 +10,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_print.h>
 
-#include "i915_reg.h"
 #include "i9xx_plane.h"
 #include "i9xx_plane_regs.h"
 #include "intel_atomic.h"
diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index c8e0333706c1..7cf511a6c0f9 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -34,7 +34,6 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
-#include "i915_reg.h"
 #include "icl_dsi.h"
 #include "icl_dsi_regs.h"
 #include "intel_atomic.h"
diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
index a68fdbd2acb9..34e95f05936e 100644
--- a/drivers/gpu/drm/i915/display/intel_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_backlight.c
@@ -12,7 +12,6 @@
 #include <drm/drm_file.h>
 #include <drm/drm_print.h>
 
-#include "i915_reg.h"
 #include "intel_backlight.h"
 #include "intel_backlight_regs.h"
 #include "intel_connector.h"
diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 8d84445c69f1..71149d8bcd73 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -5,8 +5,8 @@
 
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_print.h>
+#include <drm/intel/intel_pcode.h>
 
-#include "i915_reg.h"
 #include "intel_bw.h"
 #include "intel_crtc.h"
 #include "intel_display_core.h"
diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index 0fe4398a1a4e..b167af31de5b 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -3,7 +3,6 @@
 
 #include <drm/drm_print.h>
 
-#include "i915_reg.h"
 #include "intel_casf.h"
 #include "intel_casf_regs.h"
 #include "intel_de.h"
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index d8739e2bb004..3f0c9c7fd5f8 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -34,7 +34,6 @@
 #include <drm/drm_print.h>
 #include <drm/drm_privacy_screen_consumer.h>
 
-#include "i915_reg.h"
 #include "icl_dsi.h"
 #include "intel_alpm.h"
 #include "intel_audio.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index aba13e8a9051..1ce28a31affb 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -15,7 +15,6 @@
 #include <drm/drm_print.h>
 
 #include "hsw_ips.h"
-#include "i915_reg.h"
 #include "i9xx_wm_regs.h"
 #include "intel_alpm.h"
 #include "intel_bo.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 06adf6afbec0..a6e9f1c8d2dc 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -7,8 +7,8 @@
 #include <linux/string_helpers.h>
 
 #include <drm/drm_print.h>
+#include <drm/intel/intel_pcode.h>
 
-#include "i915_reg.h"
 #include "intel_backlight_regs.h"
 #include "intel_cdclk.h"
 #include "intel_clock_gating.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 2eb4af62d556..d9788a979561 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -5,7 +5,6 @@
 
 #include <drm/drm_print.h>
 
-#include "i915_reg.h"
 #include "intel_de.h"
 #include "intel_display_core.h"
 #include "intel_display_regs.h"
diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i915/display/intel_dmc.c
index 1182bc9a2e6d..8df06b993890 100644
--- a/drivers/gpu/drm/i915/display/intel_dmc.c
+++ b/drivers/gpu/drm/i915/display/intel_dmc.c
@@ -29,7 +29,6 @@
 #include <drm/drm_file.h>
 #include <drm/drm_print.h>
 
-#include "i915_reg.h"
 #include "intel_crtc.h"
 #include "intel_de.h"
 #include "intel_display_power_well.h"
diff --git a/drivers/gpu/drm/i915/display/intel_fdi.c b/drivers/gpu/drm/i915/display/intel_fdi.c
index 5bb0090dd5ed..24ce8a7842c7 100644
--- a/drivers/gpu/drm/i915/display/intel_fdi.c
+++ b/drivers/gpu/drm/i915/display/intel_fdi.c
@@ -8,7 +8,6 @@
 #include <drm/drm_fixed.h>
 #include <drm/drm_print.h>
 
-#include "i915_reg.h"
 #include "intel_atomic.h"
 #include "intel_crtc.h"
 #include "intel_ddi.h"
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index b7479ced7871..6110a582437c 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -17,8 +17,8 @@
 #include <drm/display/drm_hdcp_helper.h>
 #include <drm/drm_print.h>
 #include <drm/intel/i915_component.h>
+#include <drm/intel/intel_pcode.h>
 
-#include "i915_reg.h"
 #include "intel_connector.h"
 #include "intel_de.h"
 #include "intel_display_jiffies.h"
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug_irq.c b/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
index 82c39e4ffa37..8865cb2ac569 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug_irq.c
@@ -5,7 +5,6 @@
 
 #include <drm/drm_print.h>
 
-#include "i915_reg.h"
 #include "intel_de.h"
 #include "intel_display_irq.h"
 #include "intel_display_regs.h"
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index 04f63bdd0b87..1df23447fd84 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -5,7 +5,6 @@
 
 #include <drm/drm_print.h>
 
-#include "i915_reg.h"
 #include "intel_cx0_phy.h"
 #include "intel_cx0_phy_regs.h"
 #include "intel_ddi.h"
diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
index b217ec7aa758..2d799af73bb7 100644
--- a/drivers/gpu/drm/i915/display/intel_pps.c
+++ b/drivers/gpu/drm/i915/display/intel_pps.c
@@ -9,7 +9,6 @@
 #include <drm/drm_print.h>
 
 #include "g4x_dp.h"
-#include "i915_reg.h"
 #include "intel_de.h"
 #include "intel_display_jiffies.h"
 #include "intel_display_power_well.h"
diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
index 064f572bbc85..78ed9c58a72f 100644
--- a/drivers/gpu/drm/i915/display/intel_tc.c
+++ b/drivers/gpu/drm/i915/display/intel_tc.c
@@ -7,7 +7,6 @@
 
 #include <drm/drm_print.h>
 
-#include "i915_reg.h"
 #include "intel_atomic.h"
 #include "intel_cx0_phy_regs.h"
 #include "intel_ddi.h"
diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index b41da10f0f85..9efb94b4cbdb 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -7,8 +7,8 @@
 
 #include <drm/drm_blend.h>
 #include <drm/drm_print.h>
+#include <drm/intel/intel_pcode.h>
 
-#include "i915_reg.h"
 #include "i9xx_wm.h"
 #include "intel_atomic.h"
 #include "intel_bw.h"
diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
index d705af3bf8ba..67f0082d3a69 100644
--- a/drivers/gpu/drm/i915/display/vlv_dsi.c
+++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
@@ -33,7 +33,6 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
-#include "i915_reg.h"
 #include "intel_atomic.h"
 #include "intel_backlight.h"
 #include "intel_connector.h"
-- 
2.50.1

