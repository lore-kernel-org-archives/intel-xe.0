Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482E4CEBF78
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 19:57:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1529E10E59F;
	Mon, 30 Sep 2024 19:57:55 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F3410E59B
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 19:57:50 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 13/15] drm/xe/display: Use async flip for flipping initial
 fb.
Date: Mon, 30 Sep 2024 21:57:47 +0200
Message-ID: <20240930195749.318998-14-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930195749.318998-1-maarten.lankhorst@linux.intel.com>
References: <20240930195749.318998-1-maarten.lankhorst@linux.intel.com>
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

Since memirq requires a ggtt allocation, irqs will be initialised
later. This means we cannot rely on drm_wait_for_vblank any more as
it requires interrupts.

Fortunately there's still SURFLIVE

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_plane_initial.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 4660db0aecb68..3fd0fe2dbc27a 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -17,6 +17,8 @@
 #include "intel_fb_pin.h"
 #include "intel_frontbuffer.h"
 #include "intel_plane_initial.h"
+#include "intel_uncore.h"
+#include "skl_universal_plane_regs.h"
 #include "xe_bo.h"
 #include "xe_wa.h"
 
@@ -187,6 +189,7 @@ static void
 intel_find_initial_plane_obj(struct intel_crtc *crtc,
 			     struct intel_initial_plane_config plane_configs[])
 {
+	struct xe_device *xe = to_xe_device(crtc->base.dev);
 	struct intel_initial_plane_config *plane_config =
 		&plane_configs[crtc->pipe];
 	struct intel_plane *plane =
@@ -235,6 +238,14 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
 	plane_state->uapi.crtc = &crtc->base;
 	intel_plane_copy_uapi_to_hw_state(plane_state, plane_state, crtc);
 
+	/* Flip async, we don't have interrupts yet */
+	plane_state->ctl = intel_uncore_read(&xe->uncore, PLANE_CTL(plane->pipe, PLANE_1));
+	plane->async_flip(plane, to_intel_crtc_state(crtc->base.state), plane_state, true);
+
+	/* Wait 40 ms (1 frame at 25 fps) for async flip to complete */
+	if (intel_wait_for_register_fw(&xe->uncore, PLANE_SURFLIVE(plane->pipe, PLANE_1), XE_PAGE_SIZE - 1, vma->node->base.start, 40) < 0)
+		drm_warn(&xe->drm, "async flip timed out\n");
+
 	atomic_or(plane->frontbuffer_bit, &to_intel_frontbuffer(fb)->bits);
 
 	plane_config->vma = vma;
@@ -292,9 +303,6 @@ void intel_initial_plane_config(struct drm_i915_private *i915)
 		 */
 		intel_find_initial_plane_obj(crtc, plane_configs);
 
-		if (i915->display.funcs.display->fixup_initial_plane_config(crtc, plane_config))
-			intel_crtc_wait_for_next_vblank(crtc);
-
 		plane_config_fini(plane_config);
 	}
 }
-- 
2.45.2

