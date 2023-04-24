Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C3CC77B61
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 16:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458D410E1BA;
	Mon, 24 Apr 2023 16:51:50 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415FA10E1BA
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 16:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682355107; x=1713891107;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4gWtdpRQHnIWmGe0xRWRIAKMKjjxr9yQLoEjwgKdtV4=;
 b=P/61uSHn4WMtvy7MzmZjgFlr+jgSmhcm7fa5q2UDjO9RM5g2e7/hRb+R
 EaFhV3TMYFxT3DV31+vDGPa4D/OKyzJq6Oi9yaBf388tGcZN00hu0WJq7
 1kfwl1mENbElqQgPcWEAmvjVPE02XmNH0DJk4COjT77zXKJk9ccla4SIa
 vbuO5JVZEWlWVx1DdoIqMHMgLinj5LQwtQkdk4JRSw1Uun1lX0Rjfqr85
 6qUTz+H9JjLAJHLAR3fxUQGXsRhH3+zAUY/fg/IqYpqE+/mOXYduNQDU3
 DKpUTPzEW6jOM/WY80mAXDYflkYxYm4P32Wj4aQJH3mfaHeTIm8JIKHqK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="330704208"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="330704208"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:51:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="1022785349"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="1022785349"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:51:45 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 24 Apr 2023 09:51:22 -0700
Message-Id: <20230424165135.132494-3-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424165135.132494-1-jose.souza@intel.com>
References: <20230424165135.132494-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 02/15] drm/i915/display: start high level display
 driver file
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
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Jani Nikula <jani.nikula@intel.com>

The only way to truly clean up intel_display.[ch] is to move stuff out
of them until there's absolutely nothing left.

Start moving the high level display driver entry points, i.e. functions
called from top level driver code only, to a new file, which we'll call
intel_display_driver.c. The intention is that there's no low-level
display code or details here. This is an in-between layer.

Initially, move intel_display_driver_register() and
intel_display_driver_unregister() there.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/e42cc037881a4c6042948a34bd4a9698f9e8487c.1681465222.git.jani.nikula@intel.com
(cherry picked from commit 77316e7552137e1ed1ac3d719be844f36756eb1c)
---
 drivers/gpu/drm/i915/Makefile                 |  1 +
 drivers/gpu/drm/i915/display/intel_display.c  | 53 --------------
 drivers/gpu/drm/i915/display/intel_display.h  |  3 -
 .../drm/i915/display/intel_display_driver.c   | 71 +++++++++++++++++++
 .../drm/i915/display/intel_display_driver.h   | 15 ++++
 drivers/gpu/drm/i915/i915_driver.c            |  1 +
 6 files changed, 88 insertions(+), 56 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_driver.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_driver.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 48846365436ed..53ebbadc8bc47 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -237,6 +237,7 @@ i915-y += \
 	display/intel_crtc_state_dump.o \
 	display/intel_cursor.o \
 	display/intel_display.o \
+	display/intel_display_driver.o \
 	display/intel_display_power.o \
 	display/intel_display_power_map.o \
 	display/intel_display_power_well.o \
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index fccd067cc9cb0..226710bcec7a2 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -32,7 +32,6 @@
 #include <linux/slab.h>
 #include <linux/string_helpers.h>
 #include <linux/vga_switcheroo.h>
-#include <acpi/video.h>
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_atomic.h>
@@ -72,7 +71,6 @@
 #include "intel_crtc_state_dump.h"
 #include "intel_ddi.h"
 #include "intel_de.h"
-#include "intel_display_debugfs.h"
 #include "intel_display_power.h"
 #include "intel_display_types.h"
 #include "intel_dmc.h"
@@ -8913,57 +8911,6 @@ bool intel_modeset_probe_defer(struct pci_dev *pdev)
 	return false;
 }
 
-void intel_display_driver_register(struct drm_i915_private *i915)
-{
-	if (!HAS_DISPLAY(i915))
-		return;
-
-	/* Must be done after probing outputs */
-	intel_opregion_register(i915);
-	intel_acpi_video_register(i915);
-
-	intel_audio_init(i915);
-
-	intel_display_debugfs_register(i915);
-
-	/*
-	 * Some ports require correctly set-up hpd registers for
-	 * detection to work properly (leading to ghost connected
-	 * connector status), e.g. VGA on gm45.  Hence we can only set
-	 * up the initial fbdev config after hpd irqs are fully
-	 * enabled. We do it last so that the async config cannot run
-	 * before the connectors are registered.
-	 */
-	intel_fbdev_initial_config_async(i915);
-
-	/*
-	 * We need to coordinate the hotplugs with the asynchronous
-	 * fbdev configuration, for which we use the
-	 * fbdev->async_cookie.
-	 */
-	drm_kms_helper_poll_init(&i915->drm);
-}
-
-void intel_display_driver_unregister(struct drm_i915_private *i915)
-{
-	if (!HAS_DISPLAY(i915))
-		return;
-
-	intel_fbdev_unregister(i915);
-	intel_audio_deinit(i915);
-
-	/*
-	 * After flushing the fbdev (incl. a late async config which
-	 * will have delayed queuing of a hotplug event), then flush
-	 * the hotplug events.
-	 */
-	drm_kms_helper_poll_fini(&i915->drm);
-	drm_atomic_helper_shutdown(&i915->drm);
-
-	acpi_video_unregister();
-	intel_opregion_unregister(i915);
-}
-
 bool intel_scanout_needs_vtd_wa(struct drm_i915_private *i915)
 {
 	return DISPLAY_VER(i915) >= 6 && i915_vtd_active(i915);
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index 7eb6628cde5ce..6fa33ff74928c 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -526,9 +526,6 @@ void intel_set_plane_visible(struct intel_crtc_state *crtc_state,
 			     bool visible);
 void intel_plane_fixup_bitmasks(struct intel_crtc_state *crtc_state);
 
-void intel_display_driver_register(struct drm_i915_private *i915);
-void intel_display_driver_unregister(struct drm_i915_private *i915);
-
 void intel_update_watermarks(struct drm_i915_private *i915);
 
 /* modesetting */
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
new file mode 100644
index 0000000000000..d4a1893e9218a
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022-2023 Intel Corporation
+ *
+ * High level display driver entry points. This is a layer between top level
+ * driver code and low level display functionality; no low level display code or
+ * details here.
+ */
+
+#include <acpi/video.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_probe_helper.h>
+
+#include "i915_drv.h"
+#include "intel_acpi.h"
+#include "intel_audio.h"
+#include "intel_display_debugfs.h"
+#include "intel_display_driver.h"
+#include "intel_fbdev.h"
+#include "intel_opregion.h"
+
+void intel_display_driver_register(struct drm_i915_private *i915)
+{
+	if (!HAS_DISPLAY(i915))
+		return;
+
+	/* Must be done after probing outputs */
+	intel_opregion_register(i915);
+	intel_acpi_video_register(i915);
+
+	intel_audio_init(i915);
+
+	intel_display_debugfs_register(i915);
+
+	/*
+	 * Some ports require correctly set-up hpd registers for
+	 * detection to work properly (leading to ghost connected
+	 * connector status), e.g. VGA on gm45.  Hence we can only set
+	 * up the initial fbdev config after hpd irqs are fully
+	 * enabled. We do it last so that the async config cannot run
+	 * before the connectors are registered.
+	 */
+	intel_fbdev_initial_config_async(i915);
+
+	/*
+	 * We need to coordinate the hotplugs with the asynchronous
+	 * fbdev configuration, for which we use the
+	 * fbdev->async_cookie.
+	 */
+	drm_kms_helper_poll_init(&i915->drm);
+}
+
+void intel_display_driver_unregister(struct drm_i915_private *i915)
+{
+	if (!HAS_DISPLAY(i915))
+		return;
+
+	intel_fbdev_unregister(i915);
+	intel_audio_deinit(i915);
+
+	/*
+	 * After flushing the fbdev (incl. a late async config which
+	 * will have delayed queuing of a hotplug event), then flush
+	 * the hotplug events.
+	 */
+	drm_kms_helper_poll_fini(&i915->drm);
+	drm_atomic_helper_shutdown(&i915->drm);
+
+	acpi_video_unregister();
+	intel_opregion_unregister(i915);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.h b/drivers/gpu/drm/i915/display/intel_display_driver.h
new file mode 100644
index 0000000000000..4f6deef5a23ff
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022-2023 Intel Corporation
+ */
+
+#ifndef __INTEL_DISPLAY_DRIVER_H__
+#define __INTEL_DISPLAY_DRIVER_H__
+
+struct drm_i915_private;
+
+void intel_display_driver_register(struct drm_i915_private *i915);
+void intel_display_driver_unregister(struct drm_i915_private *i915);
+
+#endif /* __INTEL_DISPLAY_DRIVER_H__ */
+
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index f68ad1e2c529c..4ae8b12189a87 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -48,6 +48,7 @@
 #include "display/intel_acpi.h"
 #include "display/intel_bw.h"
 #include "display/intel_cdclk.h"
+#include "display/intel_display_driver.h"
 #include "display/intel_display_types.h"
 #include "display/intel_dmc.h"
 #include "display/intel_dp.h"
-- 
2.40.0

