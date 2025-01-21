Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E3BC02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 14:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C636410E5C5;
	Tue, 21 Jan 2025 14:29:28 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62E310E5C5
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jan 2025 14:29:26 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 1/3] drm/xe/display: Add intel_plane_initial_vblank_wait
Date: Tue, 21 Jan 2025 15:28:48 +0100
Message-ID: <20250121142850.4960-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.43.0
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

We're changing the driver to have no interrupts during early init for
Xe, so we poll the PIPE_FRMSTMSMP counter instead.

Interrupts cannot be enabled during FB readout because memirq's requires
an allocation. This would overwrite the FB we want to read out.

While it might be possible to also run do the same in i915 and run
it without interrupts, the platforms i915 supports had a less clear
distinction between display and graphics. For this reason I choose
only to touch Xe for now.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/intel_display.c  |  6 +++---
 .../drm/i915/display/intel_plane_initial.c    |  7 ++++++-
 .../drm/i915/display/intel_plane_initial.h    |  2 ++
 drivers/gpu/drm/xe/display/xe_plane_initial.c | 19 ++++++++++++++++++-
 4 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index e63619da2e62b..605adc3a30b39 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -796,7 +796,7 @@ void intel_plane_disable_noatomic(struct intel_crtc *crtc,
 	if ((crtc_state->active_planes & ~BIT(PLANE_CURSOR)) == 0 &&
 	    hsw_ips_disable(crtc_state)) {
 		crtc_state->ips_enabled = false;
-		intel_crtc_wait_for_next_vblank(crtc);
+		intel_plane_initial_vblank_wait(crtc);
 	}
 
 	/*
@@ -810,7 +810,7 @@ void intel_plane_disable_noatomic(struct intel_crtc *crtc,
 	 */
 	if (HAS_GMCH(dev_priv) &&
 	    intel_set_memory_cxsr(dev_priv, false))
-		intel_crtc_wait_for_next_vblank(crtc);
+		intel_plane_initial_vblank_wait(crtc);
 
 	/*
 	 * Gen2 reports pipe underruns whenever all planes are disabled.
@@ -820,7 +820,7 @@ void intel_plane_disable_noatomic(struct intel_crtc *crtc,
 		intel_set_cpu_fifo_underrun_reporting(dev_priv, crtc->pipe, false);
 
 	intel_plane_disable_arm(NULL, plane, crtc_state);
-	intel_crtc_wait_for_next_vblank(crtc);
+	intel_plane_initial_vblank_wait(crtc);
 }
 
 unsigned int
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index 6789b7f140952..b1675b46e06cb 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -14,6 +14,11 @@
 #include "intel_frontbuffer.h"
 #include "intel_plane_initial.h"
 
+void intel_plane_initial_vblank_wait(struct intel_crtc *crtc)
+{
+	intel_crtc_wait_for_next_vblank(crtc);
+}
+
 static bool
 intel_reuse_initial_plane_obj(struct intel_crtc *this,
 			      const struct intel_initial_plane_config plane_configs[],
@@ -442,7 +447,7 @@ void intel_initial_plane_config(struct intel_display *display)
 		intel_find_initial_plane_obj(crtc, plane_configs);
 
 		if (display->funcs.display->fixup_initial_plane_config(crtc, plane_config))
-			intel_crtc_wait_for_next_vblank(crtc);
+			intel_plane_initial_vblank_wait(crtc);
 
 		plane_config_fini(plane_config);
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.h b/drivers/gpu/drm/i915/display/intel_plane_initial.h
index 6c6aa717ed21f..5c315acda2101 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.h
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.h
@@ -6,8 +6,10 @@
 #ifndef __INTEL_PLANE_INITIAL_H__
 #define __INTEL_PLANE_INITIAL_H__
 
+struct intel_crtc;
 struct intel_display;
 
 void intel_initial_plane_config(struct intel_display *display);
+void intel_plane_initial_vblank_wait(struct intel_crtc *crtc);
 
 #endif
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 2a2f250fa495d..41103571b870b 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -8,7 +8,9 @@
 
 #include "regs/xe_gtt_defs.h"
 #include "xe_ggtt.h"
+#include "xe_mmio.h"
 
+#include "i915_reg.h"
 #include "intel_atomic_plane.h"
 #include "intel_crtc.h"
 #include "intel_display.h"
@@ -22,6 +24,21 @@
 
 #include <generated/xe_wa_oob.h>
 
+void intel_plane_initial_vblank_wait(struct intel_crtc *crtc)
+{
+	/* Early xe has no irq */
+	struct xe_device *xe = to_xe_device(crtc->base.dev);
+	struct xe_reg pipe_frmtmstmp = XE_REG(i915_mmio_reg_offset(PIPE_FRMTMSTMP(crtc->pipe)));
+	u32 timestamp;
+	int ret;
+
+	timestamp = xe_mmio_read32(xe_root_tile_mmio(xe), pipe_frmtmstmp);
+
+	ret = xe_mmio_wait32_not(xe_root_tile_mmio(xe), pipe_frmtmstmp, ~0U, timestamp, 40000U, &timestamp, false);
+	if (ret < 0)
+		drm_warn(&xe->drm, "waiting for early vblank failed with %i\n", ret);
+}
+
 static bool
 intel_reuse_initial_plane_obj(struct intel_crtc *this,
 			      const struct intel_initial_plane_config plane_configs[],
@@ -293,7 +310,7 @@ void intel_initial_plane_config(struct intel_display *display)
 		intel_find_initial_plane_obj(crtc, plane_configs);
 
 		if (display->funcs.display->fixup_initial_plane_config(crtc, plane_config))
-			intel_crtc_wait_for_next_vblank(crtc);
+			intel_plane_initial_vblank_wait(crtc);
 
 		plane_config_fini(plane_config);
 	}
-- 
2.43.0

