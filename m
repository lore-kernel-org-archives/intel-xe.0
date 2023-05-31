Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82BFC7EE23
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 15:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D96110E0F4;
	Wed, 31 May 2023 15:18:13 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742D610E0CF
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 15:18:11 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 31 May 2023 17:18:03 +0200
Message-Id: <20230531151804.2017924-2-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230531151804.2017924-1-maarten.lankhorst@linux.intel.com>
References: <20230531151804.2017924-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] fixup! drm/i915/display: Remaining changes
 to make xe compile
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

---
 drivers/gpu/drm/i915/display/intel_atomic_plane.c  |  4 ----
 drivers/gpu/drm/i915/display/intel_display_types.h |  7 -------
 drivers/gpu/drm/i915/display/intel_dpt.c           | 14 +++++---------
 drivers/gpu/drm/i915/display/intel_fb.c            |  7 +++----
 drivers/gpu/drm/i915/display/skl_universal_plane.c |  6 +-----
 drivers/gpu/drm/xe/Makefile                        |  1 -
 6 files changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index b756561f08bd..51aea28a57d2 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -108,9 +108,7 @@ intel_plane_duplicate_state(struct drm_plane *plane)
 	__drm_atomic_helper_plane_duplicate_state(plane, &intel_state->uapi);
 
 	intel_state->ggtt_vma = NULL;
-#ifdef I915
 	intel_state->dpt_vma = NULL;
-#endif
 	intel_state->flags = 0;
 
 	/* add reference to fb */
@@ -135,9 +133,7 @@ intel_plane_destroy_state(struct drm_plane *plane,
 	struct intel_plane_state *plane_state = to_intel_plane_state(state);
 
 	drm_WARN_ON(plane->dev, plane_state->ggtt_vma);
-#ifdef I915
 	drm_WARN_ON(plane->dev, plane_state->dpt_vma);
-#endif
 
 	__drm_atomic_helper_plane_destroy_state(&plane_state->uapi);
 	if (plane_state->hw.fb)
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index dc6ed6280afb..c85cf8adc7a6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -46,7 +46,6 @@
 #include <drm/i915_hdcp_interface.h>
 #include <media/cec-notifier.h>
 
-#include "i915_utils.h"
 #include "i915_vma.h"
 #include "i915_vma_types.h"
 #include "intel_bios.h"
@@ -144,9 +143,7 @@ struct intel_framebuffer {
 		struct intel_fb_view remapped_view;
 	};
 
-#ifdef I915
 	struct i915_address_space *dpt_vm;
-#endif
 };
 
 enum intel_hotplug_state {
@@ -689,11 +686,7 @@ struct intel_plane_state {
 	} hw;
 
 	struct i915_vma *ggtt_vma;
-#ifdef I915
 	struct i915_vma *dpt_vma;
-#else
-	struct i915_vma embed_vma;
-#endif
 	unsigned long flags;
 #define PLANE_HAS_FENCE BIT(0)
 
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
index 647d4ed8ba45..c5eacfdba1a5 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -3,6 +3,11 @@
  * Copyright © 2021 Intel Corporation
  */
 
+#include "gem/i915_gem_domain.h"
+#include "gem/i915_gem_internal.h"
+#include "gem/i915_gem_lmem.h"
+#include "gt/gen8_ppgtt.h"
+
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "intel_de.h"
@@ -10,13 +15,6 @@
 #include "intel_dpt.h"
 #include "intel_fb.h"
 
-#ifdef I915
-
-#include "gem/i915_gem_domain.h"
-#include "gem/i915_gem_internal.h"
-#include "gem/i915_gem_lmem.h"
-#include "gt/gen8_ppgtt.h"
-
 struct i915_dpt {
 	struct i915_address_space vm;
 
@@ -318,8 +316,6 @@ void intel_dpt_destroy(struct i915_address_space *vm)
 	i915_vm_put(&dpt->vm);
 }
 
-#endif
-
 void intel_dpt_configure(struct intel_crtc *crtc)
 {
 	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 0984e3070d29..da29c4017d47 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1841,11 +1841,12 @@ int intel_plane_compute_gtt(struct intel_plane_state *plane_state)
 
 static void intel_user_framebuffer_destroy_vm(struct drm_framebuffer *fb)
 {
-#ifdef I915
 	struct intel_framebuffer *intel_fb = to_intel_framebuffer(fb);
+
 	if (intel_fb_uses_dpt(fb))
 		intel_dpt_destroy(intel_fb->dpt_vm);
-#else
+
+#ifndef I915
 	if (intel_fb_obj(fb)->flags & XE_BO_CREATE_PINNED_BIT) {
 		struct xe_bo *bo = intel_fb_obj(fb);
 
@@ -2070,7 +2071,6 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 	if (ret)
 		goto err;
 
-#ifdef I915
 	if (intel_fb_uses_dpt(fb)) {
 		struct i915_address_space *vm;
 
@@ -2083,7 +2083,6 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 
 		intel_fb->dpt_vm = vm;
 	}
-#endif
 
 	ret = drm_framebuffer_init(&dev_priv->drm, fb, &intel_fb_funcs);
 	if (ret) {
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 0f1e4e61d32e..acf8e834fe34 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1002,13 +1002,9 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
 		 * The DPT object contains only one vma, so the VMA's offset
 		 * within the DPT is always 0.
 		 */
-		drm_WARN_ON(&i915->drm, offset & 0x1fffff);
-#ifdef I915
 		drm_WARN_ON(&i915->drm, plane_state->dpt_vma->node.start);
+		drm_WARN_ON(&i915->drm, offset & 0x1fffff);
 		return offset >> 9;
-#else
-		return 0;
-#endif
 	} else {
 		drm_WARN_ON(&i915->drm, offset & 0xfff);
 		return offset;
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index da1e447c08c7..ecf37dded78d 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -176,7 +176,6 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_dp_mst.o \
 	i915-display/intel_dpll.o \
 	i915-display/intel_dpll_mgr.o \
-	i915-display/intel_dpt.o \
 	i915-display/intel_drrs.o \
 	i915-display/intel_dsb.o \
 	i915-display/intel_dsi.o \
-- 
2.34.1

