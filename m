Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E07C64EC4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 10:52:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA42810E07E;
	Fri,  3 Mar 2023 10:52:53 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF7B10E07E
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 10:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677840771; x=1709376771;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HD2ZwVK3IKhwDYw25EeXA82S3TjsGX12Qrjp9idF658=;
 b=Lm+ZVmDNEpp3x8hz8tNvIDYvFhf6nW3iE2f/XbgJd/lo7R7neMAAHFIA
 8mFfuSl2vjHmfevDvp8IJR1dHQzXqfs3akBDXVnYfzEa4t5bC5NktJvpH
 mI35UuO7shCBzPrGG7vjwobuKMZ+qbl/DieTcYlDXP1HPF1h4CtQJUg+x
 mS1pB8u2NB0GyxdjdGsxwolrIDYgcPGzfu5obnSTfcDm2xABOqBWsuNt6
 Oiu6nkvPc70AlAI75Vi/ZLh3HzRPKCVX6kMr/Xv8ky/BKG2h/PN7UBs8G
 hjXyXHlZUCJB0mQ3j105FOxVKCftMRpgrsVjV00uRH4DGEJuSe92yfVfD w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="421288172"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="421288172"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:52:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="739467795"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="739467795"
Received: from msieb-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.184])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:52:43 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Mar 2023 12:52:18 +0200
Message-Id: <20230303105222.3550161-5-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303105222.3550161-1-jani.nikula@intel.com>
References: <20230303105222.3550161-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/8] drm/xe: drop redundant display/ from
 includes
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Drop display/ prefix when not needed. We have -I for xe/display and
i915/display subdirectories.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/ext/i915_irq.c     | 16 ++++++------
 .../drm/xe/display/ext/intel_device_info.c    |  4 +--
 drivers/gpu/drm/xe/display/ext/intel_pm.c     |  6 ++---
 drivers/gpu/drm/xe/display/i915_drv.h         |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h          |  6 ++---
 drivers/gpu/drm/xe/xe_display.c               | 26 +++++++++----------
 6 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
index ca188e69f509..60950cfaf6dc 100644
--- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
+++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
@@ -34,14 +34,14 @@
 
 #include <drm/drm_drv.h>
 
-#include "display/icl_dsi_regs.h"
-#include "display/intel_de.h"
-#include "display/intel_display_trace.h"
-#include "display/intel_display_types.h"
-#include "display/intel_fifo_underrun.h"
-#include "display/intel_hotplug.h"
-#include "display/intel_lpe_audio.h"
-#include "display/intel_psr.h"
+#include "icl_dsi_regs.h"
+#include "intel_de.h"
+#include "intel_display_trace.h"
+#include "intel_display_types.h"
+#include "intel_fifo_underrun.h"
+#include "intel_hotplug.h"
+#include "intel_lpe_audio.h"
+#include "intel_psr.h"
 
 #include "i915_drv.h"
 #include "../intel_de.h"
diff --git a/drivers/gpu/drm/xe/display/ext/intel_device_info.c b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
index 318b27a357b8..6311b8494e4d 100644
--- a/drivers/gpu/drm/xe/display/ext/intel_device_info.c
+++ b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
@@ -22,8 +22,8 @@
  *
  */
 
-#include "display/intel_cdclk.h"
-#include "display/intel_de.h"
+#include "intel_cdclk.h"
+#include "intel_de.h"
 #include "gt/intel_gt_regs.h"
 #include "intel_device_info.h"
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/xe/display/ext/intel_pm.c b/drivers/gpu/drm/xe/display/ext/intel_pm.c
index b5c5b57f4a11..b9cd063e2d21 100644
--- a/drivers/gpu/drm/xe/display/ext/intel_pm.c
+++ b/drivers/gpu/drm/xe/display/ext/intel_pm.c
@@ -25,9 +25,9 @@
  *
  */
 
-#include "display/intel_de.h"
-#include "display/intel_display_trace.h"
-#include "display/skl_watermark.h"
+#include "intel_de.h"
+#include "intel_display_trace.h"
+#include "skl_watermark.h"
 
 #include "i915_drv.h"
 #include "intel_mchbar_regs.h"
diff --git a/drivers/gpu/drm/xe/display/i915_drv.h b/drivers/gpu/drm/xe/display/i915_drv.h
index 06348cb03f44..f5b36197e29d 100644
--- a/drivers/gpu/drm/xe/display/i915_drv.h
+++ b/drivers/gpu/drm/xe/display/i915_drv.h
@@ -179,7 +179,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
 #define intel_overlay_cleanup(a) do { (void)a; } while (0)
 #define intel_overlay_setup(a) do { (void)a; } while (0)
 
-#include "display/intel_wakeref.h"
+#include "intel_wakeref.h"
 
 static inline bool intel_runtime_pm_get(struct xe_runtime_pm *pm)
 {
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 199bd37fce9a..034e0956f4ea 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -17,9 +17,9 @@
 #include "xe_step_types.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-#include "display/ext/intel_device_info.h"
-#include "display/ext/intel_pch.h"
-#include "display/intel_display_core.h"
+#include "ext/intel_device_info.h"
+#include "ext/intel_pch.h"
+#include "intel_display_core.h"
 #endif
 
 #define XE_BO_INVALID_OFFSET	LONG_MAX
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 97c77d175539..1ec0a7ccbce1 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -14,19 +14,19 @@
 #include <drm/drm_managed.h>
 #include <drm/xe_drm.h>
 
-#include "display/ext/i915_irq.h"
-#include "display/ext/intel_dram.h"
-#include "display/ext/intel_pm.h"
-#include "display/intel_acpi.h"
-#include "display/intel_audio.h"
-#include "display/intel_bw.h"
-#include "display/intel_display.h"
-#include "display/intel_display_types.h"
-#include "display/intel_dp.h"
-#include "display/intel_fbdev.h"
-#include "display/intel_hdcp.h"
-#include "display/intel_hotplug.h"
-#include "display/intel_opregion.h"
+#include "ext/i915_irq.h"
+#include "ext/intel_dram.h"
+#include "ext/intel_pm.h"
+#include "intel_acpi.h"
+#include "intel_audio.h"
+#include "intel_bw.h"
+#include "intel_display.h"
+#include "intel_display_types.h"
+#include "intel_dp.h"
+#include "intel_fbdev.h"
+#include "intel_hdcp.h"
+#include "intel_hotplug.h"
+#include "intel_opregion.h"
 #include "xe_module.h"
 
 /* Xe device functions */
-- 
2.39.1

