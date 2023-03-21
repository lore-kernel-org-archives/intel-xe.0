Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F33C74A5B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 16:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA1110E7D3;
	Tue, 21 Mar 2023 16:07:17 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B761410E7D3
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 16:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679414836; x=1710950836;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oJqW7mdE7HMjA/uZjVBo/jCGvkutN384sCkkk/VyoJ8=;
 b=kUSW2BhyDpTtdz8Ya2qMyjRNPA9V2TwaCFvQVNvkkn2mBmorPdpS2+x7
 OJVOWQ0YBfHxJxLO6NMlclqbPn/gC53S/V+PcmE+IRcsjIBzoPT1r0X8/
 M0pmd1WwvcgYdATpw1F0wgjmo8hBxx2C5K4mkn9IWB8tyYpRe/2qweOCw
 Licl1WsMgWb/R9uR6Ir1IszqTFAU34c6M6FwyIDKUOjiIMzm3bHkn9i2u
 IoYljVkeZB4JIA6aEO/hLy2lbXoI4ysLEeoGyQJMYLXqqpHENTJyjlEkp
 Gg65Q8X/nM1mN2WVZsUakx5vF+Db0BEnTIVkkGu3bGh4Ojs48NXAOcabV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="322826372"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="322826372"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 09:04:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="674893621"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="674893621"
Received: from trybicki-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.119])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 09:04:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Mar 2023 18:04:20 +0200
Message-Id: <20230321160420.1352889-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/i915/rps: split out display rps parts to a
 separate file
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Split out the RPS parts so they can be conditionally compiled out later.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230302164936.3034161-1-jani.nikula@intel.com
(cherry picked from commit 6dbbff25b39565c801c87379bc85933fb436518e)

---

Here's an example of an upstream i915 commit that can help clean up
cherry-pick as well as cleanup of the #ifdefs in one go, otherwise it
breaks bisect.
---
 drivers/gpu/drm/i915/Makefile                 |  1 +
 .../gpu/drm/i915/display/intel_atomic_plane.c | 85 ++-----------------
 .../gpu/drm/i915/display/intel_display_rps.c  | 81 ++++++++++++++++++
 .../gpu/drm/i915/display/intel_display_rps.h  | 34 ++++++++
 4 files changed, 123 insertions(+), 78 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_rps.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_rps.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index ae9259ab3261..f689132e1506 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -239,6 +239,7 @@ i915-y += \
 	display/intel_display_power.o \
 	display/intel_display_power_map.o \
 	display/intel_display_power_well.o \
+	display/intel_display_rps.o \
 	display/intel_dmc.o \
 	display/intel_dpio_phy.o \
 	display/intel_dpll.o \
diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 3d37f44ec835..e666a5c1fd91 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -34,13 +34,10 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
 
-#ifdef I915
-#include "gt/intel_rps.h"
-#endif
-
 #include "i915_config.h"
 #include "intel_atomic_plane.h"
 #include "intel_cdclk.h"
+#include "intel_display_rps.h"
 #include "intel_display_trace.h"
 #include "intel_display_types.h"
 #include "intel_fb.h"
@@ -951,66 +948,6 @@ int intel_atomic_plane_check_clipping(struct intel_plane_state *plane_state,
 	return 0;
 }
 
-#ifdef I915
-struct wait_rps_boost {
-	struct wait_queue_entry wait;
-
-	struct drm_crtc *crtc;
-	struct i915_request *request;
-};
-
-static int do_rps_boost(struct wait_queue_entry *_wait,
-			unsigned mode, int sync, void *key)
-{
-	struct wait_rps_boost *wait = container_of(_wait, typeof(*wait), wait);
-	struct i915_request *rq = wait->request;
-
-	/*
-	 * If we missed the vblank, but the request is already running it
-	 * is reasonable to assume that it will complete before the next
-	 * vblank without our intervention, so leave RPS alone.
-	 */
-	if (!i915_request_started(rq))
-		intel_rps_boost(rq);
-	i915_request_put(rq);
-
-	drm_crtc_vblank_put(wait->crtc);
-
-	list_del(&wait->wait.entry);
-	kfree(wait);
-	return 1;
-}
-
-static void add_rps_boost_after_vblank(struct drm_crtc *crtc,
-				       struct dma_fence *fence)
-{
-	struct wait_rps_boost *wait;
-
-	if (!dma_fence_is_i915(fence))
-		return;
-
-	if (DISPLAY_VER(to_i915(crtc->dev)) < 6)
-		return;
-
-	if (drm_crtc_vblank_get(crtc))
-		return;
-
-	wait = kmalloc(sizeof(*wait), GFP_KERNEL);
-	if (!wait) {
-		drm_crtc_vblank_put(crtc);
-		return;
-	}
-
-	wait->request = to_request(dma_fence_get(fence));
-	wait->crtc = crtc;
-
-	wait->wait.func = do_rps_boost;
-	wait->wait.flags = 0;
-
-	add_wait_queue(drm_crtc_vblank_waitqueue(crtc), &wait->wait);
-}
-#endif
-
 /**
  * intel_prepare_plane_fb - Prepare fb for usage on plane
  * @_plane: drm plane to prepare for
@@ -1102,13 +1039,13 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 		dma_resv_iter_begin(&cursor, obj->base.resv,
 				    DMA_RESV_USAGE_WRITE);
 		dma_resv_for_each_fence_unlocked(&cursor, fence) {
-			add_rps_boost_after_vblank(new_plane_state->hw.crtc,
-						   fence);
+			intel_display_rps_boost_after_vblank(new_plane_state->hw.crtc,
+							     fence);
 		}
 		dma_resv_iter_end(&cursor);
 	} else {
-		add_rps_boost_after_vblank(new_plane_state->hw.crtc,
-					   new_plane_state->uapi.fence);
+		intel_display_rps_boost_after_vblank(new_plane_state->hw.crtc,
+						     new_plane_state->uapi.fence);
 	}
 
 	/*
@@ -1119,10 +1056,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 	 * that are not quite steady state without resorting to forcing
 	 * maximum clocks following a vblank miss (see do_rps_boost()).
 	 */
-	if (!state->rps_interactive) {
-		intel_rps_mark_interactive(&to_gt(dev_priv)->rps, true);
-		state->rps_interactive = true;
-	}
+	intel_display_rps_mark_interactive(dev_priv, state, true);
 
 	return 0;
 
@@ -1159,12 +1093,7 @@ intel_cleanup_plane_fb(struct drm_plane *plane,
 	if (!obj)
 		return;
 
-#ifdef I915
-	if (state->rps_interactive) {
-		intel_rps_mark_interactive(&to_gt(dev_priv)->rps, false);
-		state->rps_interactive = false;
-	}
-#endif
+	intel_display_rps_mark_interactive(dev_priv, state, false);
 
 	/* Should only be called after a successful intel_prepare_plane_fb()! */
 	intel_plane_unpin_fb(old_plane_state);
diff --git a/drivers/gpu/drm/i915/display/intel_display_rps.c b/drivers/gpu/drm/i915/display/intel_display_rps.c
new file mode 100644
index 000000000000..918d0327169a
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_display_rps.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_vblank.h>
+
+#include "gt/intel_rps.h"
+#include "i915_drv.h"
+#include "intel_display_rps.h"
+#include "intel_display_types.h"
+
+struct wait_rps_boost {
+	struct wait_queue_entry wait;
+
+	struct drm_crtc *crtc;
+	struct i915_request *request;
+};
+
+static int do_rps_boost(struct wait_queue_entry *_wait,
+			unsigned mode, int sync, void *key)
+{
+	struct wait_rps_boost *wait = container_of(_wait, typeof(*wait), wait);
+	struct i915_request *rq = wait->request;
+
+	/*
+	 * If we missed the vblank, but the request is already running it
+	 * is reasonable to assume that it will complete before the next
+	 * vblank without our intervention, so leave RPS alone.
+	 */
+	if (!i915_request_started(rq))
+		intel_rps_boost(rq);
+	i915_request_put(rq);
+
+	drm_crtc_vblank_put(wait->crtc);
+
+	list_del(&wait->wait.entry);
+	kfree(wait);
+	return 1;
+}
+
+void intel_display_rps_boost_after_vblank(struct drm_crtc *crtc,
+					  struct dma_fence *fence)
+{
+	struct wait_rps_boost *wait;
+
+	if (!dma_fence_is_i915(fence))
+		return;
+
+	if (DISPLAY_VER(to_i915(crtc->dev)) < 6)
+		return;
+
+	if (drm_crtc_vblank_get(crtc))
+		return;
+
+	wait = kmalloc(sizeof(*wait), GFP_KERNEL);
+	if (!wait) {
+		drm_crtc_vblank_put(crtc);
+		return;
+	}
+
+	wait->request = to_request(dma_fence_get(fence));
+	wait->crtc = crtc;
+
+	wait->wait.func = do_rps_boost;
+	wait->wait.flags = 0;
+
+	add_wait_queue(drm_crtc_vblank_waitqueue(crtc), &wait->wait);
+}
+
+void intel_display_rps_mark_interactive(struct drm_i915_private *i915,
+					struct intel_atomic_state *state,
+					bool interactive)
+{
+	if (state->rps_interactive == interactive)
+		return;
+
+	intel_rps_mark_interactive(&to_gt(i915)->rps, interactive);
+	state->rps_interactive = interactive;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_display_rps.h b/drivers/gpu/drm/i915/display/intel_display_rps.h
new file mode 100644
index 000000000000..2cfb8a303b77
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_display_rps.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __INTEL_DISPLAY_RPS_H__
+#define __INTEL_DISPLAY_RPS_H__
+
+#include <linux/types.h>
+
+struct dma_fence;
+struct drm_crtc;
+struct drm_i915_private;
+struct intel_atomic_state;
+
+#ifdef I915
+void intel_display_rps_boost_after_vblank(struct drm_crtc *crtc,
+					  struct dma_fence *fence);
+void intel_display_rps_mark_interactive(struct drm_i915_private *i915,
+					struct intel_atomic_state *state,
+					bool interactive);
+#else
+static inline void intel_display_rps_boost_after_vblank(struct drm_crtc *crtc,
+							struct dma_fence *fence)
+{
+}
+static inline void intel_display_rps_mark_interactive(struct drm_i915_private *i915,
+						      struct intel_atomic_state *state,
+						      bool interactive)
+{
+}
+#endif
+
+#endif /* __INTEL_DISPLAY_RPS_H__ */
-- 
2.39.2

