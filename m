Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6127DE7AD58
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 14:35:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3232110E191;
	Tue,  3 Oct 2023 14:35:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1913B10E2B7
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 14:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696343742; x=1727879742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kMBdt9ppFVRhrIDwOn/7tFvZZW5S9K4a5gZ9gs6fqn0=;
 b=G09ObTGuOXIGbGKt1I2r2SB7wKEy5SBklz82nanLwBgSulBrqe4aY0/e
 pSiM0evDUed+D4xD+Nuk5+iuslNocZa9Ez3IWNPffItkT9RQdvqsp8nC+
 H+nyxMKBh8Q+CpOIC0e08kyvma7McF1wgdAtnonXGEIQlxJz91u3Lm1vq
 VevEnxecWdZigCqj6thMXAXa2KZVII2o9MhIfptFr9iN2/tRXB85Go08m
 ci2dma2pc+1+A/YHJ7xGNDCIvU0x2pzb4NoIyCXMvNM8pGcV0U9iCdDoy
 rPV3mE6wSNHqbUtzTY47wXtOjlUdzwm5Uen+210RUF1wB4RX7Obtjtmnb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="449375114"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="449375114"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 07:35:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="754462201"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; d="scan'208";a="754462201"
Received: from akorotox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.199])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 07:35:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  3 Oct 2023 17:34:55 +0300
Message-Id: <e40596b157f7689f2870b074b7a1cdd9696f70a4.1696343521.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1696343521.git.jani.nikula@intel.com>
References: <cover.1696343521.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 08/10] fixup! drm/xe/display: Implement display
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

Turn the enable_display module parameter to the same thing as it is for
i915: assuming you have display hardware, take over it, put it to sleep,
and keep connectors disconnected.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h |  5 ++++-
 drivers/gpu/drm/xe/xe_display.c                   | 11 +++++------
 drivers/gpu/drm/xe/xe_module.c                    |  4 ----
 drivers/gpu/drm/xe/xe_module.h                    |  1 -
 drivers/gpu/drm/xe/xe_pci.c                       |  1 -
 5 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index e7c9b4ea2153..feaa1e244838 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -24,6 +24,9 @@
 #include "intel_runtime_pm.h"
 #include <linux/pm_runtime.h>
 
+/* For INTEL_DISPLAY_ENABLED() */
+extern bool enable_display;
+
 static inline struct drm_i915_private *to_i915(const struct drm_device *dev)
 {
 	return container_of(dev, struct drm_i915_private, drm);
@@ -89,7 +92,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
 
 #define IP_VER(ver, rel)                ((ver) << 8 | (rel))
 
-#define INTEL_DISPLAY_ENABLED(xe) (HAS_DISPLAY((xe)) && !intel_opregion_headless_sku((xe)))
+#define INTEL_DISPLAY_ENABLED(xe) (enable_display && !intel_opregion_headless_sku((xe)))
 #define DISPLAY_VER(i915)	(DISPLAY_RUNTIME_INFO(i915)->ip.ver)
 #define DISPLAY_VER_FULL(i915)	IP_VER(DISPLAY_RUNTIME_INFO(i915)->ip.ver, \
 				       DISPLAY_RUNTIME_INFO(i915)->ip.rel)
diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 391f08c1caca..75054f78d7ae 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -29,6 +29,11 @@
 #include "intel_opregion.h"
 #include "xe_module.h"
 
+/* Only to be used for INTEL_DISPLAY_ENABLED() */
+bool enable_display = true;
+module_param_named(enable_display, enable_display, bool, 0444);
+MODULE_PARM_DESC(enable_display, "Enable display");
+
 /* Xe device functions */
 
 static bool has_display(struct xe_device *xe)
@@ -45,9 +50,6 @@ static bool has_display(struct xe_device *xe)
  */
 bool xe_display_driver_probe_defer(struct pci_dev *pdev)
 {
-	if (!enable_display)
-		return 0;
-
 	return intel_display_driver_probe_defer(pdev);
 }
 
@@ -69,9 +71,6 @@ static void xe_display_last_close(struct drm_device *dev)
  */
 void xe_display_driver_set_hooks(struct drm_driver *driver)
 {
-	if (!enable_display)
-		return;
-
 	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
 	driver->lastclose = xe_display_last_close;
 }
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 7194595e7f31..82817a46f887 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -19,10 +19,6 @@ bool force_execlist = false;
 module_param_named_unsafe(force_execlist, force_execlist, bool, 0444);
 MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
 
-bool enable_display = true;
-module_param_named(enable_display, enable_display, bool, 0444);
-MODULE_PARM_DESC(enable_display, "Enable display");
-
 u32 xe_force_vram_bar_size;
 module_param_named(vram_bar_size, xe_force_vram_bar_size, uint, 0600);
 MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index e1da1e9ca5cb..58604ed161cc 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -7,7 +7,6 @@
 
 /* Module modprobe variables */
 extern bool force_execlist;
-extern bool enable_display;
 extern u32 xe_force_vram_bar_size;
 extern int xe_guc_log_level;
 extern char *xe_guc_firmware_path;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index b19506fe3e18..8ee430c6f8b1 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -575,7 +575,6 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
 
 	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
-				  enable_display &&
 				  desc->has_display;
 	/*
 	 * All platforms have at least one primary GT.  Any platform with media
-- 
2.39.2

