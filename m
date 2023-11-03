Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA36C4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 16:10:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 608C810EA23;
	Fri,  3 Nov 2023 16:10:08 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDE210EA23
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 16:10:05 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-507adc3381cso2816769e87.3
 for <intel-xe@lists.freedesktop.org>; Fri, 03 Nov 2023 09:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699027803; x=1699632603; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ps+E2+d0dfWZ96u1MYIYZL1iylFaEdHkGrwQcbK1ANo=;
 b=MeEp8kSyJfPovhnZzCCdukZD0ZcPRkONhAswQ08xu7dt3dy1ipb8sDAQGEFTTGezLN
 tQVrYb9HnWyiKPYEJkfT13Ko7rHSdP/1mKh5AblRurud4lY+7NgS/rcsSU62npkKVeV/
 dM0XUMmxureU6LbJkrGiuZZjMS8yv06Hdekq7KxV8Y82q59O1u0N1NWSd98KReoxczAT
 3U+10XHR05BinRT9o5TayInAzjtpfRoNGCcK/7wHkCUG9/KNASBD/IyCSeZEmleUfJk7
 RxnbX7fJWJbffYeG/0vJRSOfxLi8cey4XtQ9e6/scYx3jYLn3LXgT3tp4lC3UCzOXgnq
 1abA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699027803; x=1699632603;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ps+E2+d0dfWZ96u1MYIYZL1iylFaEdHkGrwQcbK1ANo=;
 b=lyDxONc0iGf7sHHVTNLvzHA4hsqQytf6aPiz8IAzdg278PLF9/gIl0qKEcAVtZpaZ/
 A8ntvDRmvNwcrMxaIo0u4r1gIW6XT9hS/4f/UmlbaAl0MDlZu/qSL/Jhryg07+uAz/lR
 JzF9ZQgWbGdCi/75IVCvhmbHMTfsqDOUSzfieddGmSK96BMyGUz8ZNpQ9N/ANXByhZvB
 HxoKPP9cLEHfyx60prP6G5X2WJQw/bA/8twRv7SH1u+hBOAqHrveSAKMXOA316shHJuD
 SeRXs1EXp9rQDJIwcG7ByLCQjE6gzpu6CzROMviJl1sf89OoabetVG6pL90olXr52xr9
 97iQ==
X-Gm-Message-State: AOJu0Yx9Zz6VKY/kUAGIJw6/FnVRcSok96q6pe7/XLxcld39B+WA5yh3
 GOWDLaJf/bdyMMFE4Tp7sX+wezHtlz3ukQ==
X-Google-Smtp-Source: AGHT+IGFKpHPnLfZ7svNsuD2VJ+i7O+EoFGNzITzIlR65JHRGBADgltCXZ/qVGrtnN1U0GKHLq/ekg==
X-Received: by 2002:a05:6512:1255:b0:507:ce49:81ba with SMTP id
 fb21-20020a056512125500b00507ce4981bamr19984696lfb.67.1699027803098; 
 Fri, 03 Nov 2023 09:10:03 -0700 (PDT)
Received: from jheikkil-mobl1.home (77-105-100-22.lpok.fi. [77.105.100.22])
 by smtp.gmail.com with ESMTPSA id
 q16-20020ac25290000000b004fdde1db756sm258664lfm.26.2023.11.03.09.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 09:10:02 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 18:09:59 +0200
Message-Id: <20231103160959.420507-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/i915: xe dpt integration
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Here moved ifdef I915 parts to helpers. dpt code which is needed from i915
to Xe was separated into new file to avoid one file sized ifdef.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/i915/Makefile                 |  1 +
 .../gpu/drm/i915/display/intel_atomic_plane.c | 28 ++++++---
 drivers/gpu/drm/i915/display/intel_display.c  |  1 +
 drivers/gpu/drm/i915/display/intel_dpt.c      | 30 ----------
 drivers/gpu/drm/i915/display/intel_dpt.h      |  2 -
 .../gpu/drm/i915/display/intel_dpt_common.c   | 34 +++++++++++
 .../gpu/drm/i915/display/intel_dpt_common.h   | 13 ++++
 drivers/gpu/drm/i915/display/intel_fb.c       | 60 ++++++++++++-------
 drivers/gpu/drm/xe/Makefile                   |  2 +-
 9 files changed, 108 insertions(+), 63 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_dpt_common.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dpt_common.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 3c26e9ae3722..3b745ee8b3c5 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -260,6 +260,7 @@ i915-y += \
 	display/intel_dpll.o \
 	display/intel_dpll_mgr.o \
 	display/intel_dpt.o \
+	display/intel_dpt_common.o \
 	display/intel_drrs.o \
 	display/intel_dsb.o \
 	display/intel_fb.o \
diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 62b6108c4380..c91c24e68e42 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -86,6 +86,14 @@ void intel_plane_free(struct intel_plane *plane)
 	kfree(plane);
 }
 
+static void null_intel_plane_state_vmas(struct intel_plane_state *intel_state)
+{
+	intel_state->ggtt_vma = NULL;
+#ifdef I915
+	intel_state->dpt_vma = NULL;
+#endif
+}
+
 /**
  * intel_plane_duplicate_state - duplicate plane state
  * @plane: drm plane
@@ -108,10 +116,8 @@ intel_plane_duplicate_state(struct drm_plane *plane)
 
 	__drm_atomic_helper_plane_duplicate_state(plane, &intel_state->uapi);
 
-	intel_state->ggtt_vma = NULL;
-#ifdef I915
-	intel_state->dpt_vma = NULL;
-#endif
+	null_intel_plane_state_vmas(intel_state);
+
 	intel_state->flags = 0;
 
 	/* add reference to fb */
@@ -121,6 +127,15 @@ intel_plane_duplicate_state(struct drm_plane *plane)
 	return &intel_state->uapi;
 }
 
+static void check_intel_plane_state_vmas(struct drm_device *dev,
+					 struct intel_plane_state *intel_state)
+{
+	drm_WARN_ON(dev, intel_state->ggtt_vma);
+#ifdef I915
+	drm_WARN_ON(dev, intel_state->dpt_vma);
+#endif
+}
+
 /**
  * intel_plane_destroy_state - destroy plane state
  * @plane: drm plane
@@ -135,10 +150,7 @@ intel_plane_destroy_state(struct drm_plane *plane,
 {
 	struct intel_plane_state *plane_state = to_intel_plane_state(state);
 
-	drm_WARN_ON(plane->dev, plane_state->ggtt_vma);
-#ifdef I915
-	drm_WARN_ON(plane->dev, plane_state->dpt_vma);
-#endif
+	check_intel_plane_state_vmas(plane->dev, plane_state);
 
 	__drm_atomic_helper_plane_destroy_state(&plane_state->uapi);
 	if (plane_state->hw.fb)
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 478b8764101a..66b63f21f7f1 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -78,6 +78,7 @@
 #include "intel_dpll.h"
 #include "intel_dpll_mgr.h"
 #include "intel_dpt.h"
+#include "intel_dpt_common.h"
 #include "intel_drrs.h"
 #include "intel_dsb.h"
 #include "intel_dsi.h"
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
index 6e73c7a15942..7fe5827d051a 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -4,14 +4,10 @@
  */
 
 #include "i915_drv.h"
-#include "i915_reg.h"
-#include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_dpt.h"
 #include "intel_fb.h"
 
-#ifdef I915
-
 #include "gem/i915_gem_domain.h"
 #include "gem/i915_gem_internal.h"
 #include "gem/i915_gem_lmem.h"
@@ -320,29 +316,3 @@ void intel_dpt_destroy(struct i915_address_space *vm)
 	i915_vm_put(&dpt->vm);
 }
 
-#endif
-
-void intel_dpt_configure(struct intel_crtc *crtc)
-{
-	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
-
-	if (DISPLAY_VER(i915) == 14) {
-		enum pipe pipe = crtc->pipe;
-		enum plane_id plane_id;
-
-		for_each_plane_id_on_crtc(crtc, plane_id) {
-			if (plane_id == PLANE_CURSOR)
-				continue;
-
-			intel_de_rmw(i915, PLANE_CHICKEN(pipe, plane_id),
-				     PLANE_CHICKEN_DISABLE_DPT,
-				     i915->display.params.enable_dpt ? 0 :
-				     PLANE_CHICKEN_DISABLE_DPT);
-		}
-	} else if (DISPLAY_VER(i915) == 13) {
-		intel_de_rmw(i915, CHICKEN_MISC_2,
-			     CHICKEN_MISC_DISABLE_DPT,
-			     i915->display.params.enable_dpt ? 0 :
-			     CHICKEN_MISC_DISABLE_DPT);
-	}
-}
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.h b/drivers/gpu/drm/i915/display/intel_dpt.h
index d9a166550185..e18a9f767b11 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.h
+++ b/drivers/gpu/drm/i915/display/intel_dpt.h
@@ -10,7 +10,6 @@ struct drm_i915_private;
 
 struct i915_address_space;
 struct i915_vma;
-struct intel_crtc;
 struct intel_framebuffer;
 
 void intel_dpt_destroy(struct i915_address_space *vm);
@@ -20,6 +19,5 @@ void intel_dpt_suspend(struct drm_i915_private *i915);
 void intel_dpt_resume(struct drm_i915_private *i915);
 struct i915_address_space *
 intel_dpt_create(struct intel_framebuffer *fb);
-void intel_dpt_configure(struct intel_crtc *crtc);
 
 #endif /* __INTEL_DPT_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dpt_common.c b/drivers/gpu/drm/i915/display/intel_dpt_common.c
new file mode 100644
index 000000000000..cdba47165c04
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_dpt_common.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "i915_reg.h"
+#include "intel_de.h"
+#include "intel_display_types.h"
+#include "intel_dpt_common.h"
+
+void intel_dpt_configure(struct intel_crtc *crtc)
+{
+	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
+
+	if (DISPLAY_VER(i915) == 14) {
+		enum pipe pipe = crtc->pipe;
+		enum plane_id plane_id;
+
+		for_each_plane_id_on_crtc(crtc, plane_id) {
+			if (plane_id == PLANE_CURSOR)
+				continue;
+
+			intel_de_rmw(i915, PLANE_CHICKEN(pipe, plane_id),
+				     PLANE_CHICKEN_DISABLE_DPT,
+				     i915->display.params.enable_dpt ? 0 :
+				     PLANE_CHICKEN_DISABLE_DPT);
+		}
+	} else if (DISPLAY_VER(i915) == 13) {
+		intel_de_rmw(i915, CHICKEN_MISC_2,
+			     CHICKEN_MISC_DISABLE_DPT,
+			     i915->display.params.enable_dpt ? 0 :
+			     CHICKEN_MISC_DISABLE_DPT);
+	}
+}
diff --git a/drivers/gpu/drm/i915/display/intel_dpt_common.h b/drivers/gpu/drm/i915/display/intel_dpt_common.h
new file mode 100644
index 000000000000..6d7de405126a
--- /dev/null
+++ b/drivers/gpu/drm/i915/display/intel_dpt_common.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __INTEL_DPT_COMMON_H__
+#define __INTEL_DPT_COMMON_H__
+
+struct intel_crtc;
+
+void intel_dpt_configure(struct intel_crtc *crtc);
+
+#endif /* __INTEL_DPT_COMMON_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 1ce61245728a..53147d641a9b 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -2005,6 +2005,41 @@ static const struct drm_framebuffer_funcs intel_fb_funcs = {
 	.dirty = intel_user_framebuffer_dirty,
 };
 
+static bool setup_dpt_for_fb(struct intel_framebuffer *intel_fb,
+			     struct drm_i915_gem_object *obj)
+{
+	#ifdef I915
+	struct drm_i915_private *dev_priv = to_i915(obj->ttm.base.dev);
+	struct drm_framebuffer *fb = &intel_fb->base;
+
+	if (intel_fb_uses_dpt(fb)) {
+		struct i915_address_space *vm;
+
+		vm = intel_dpt_create(intel_fb);
+		if (IS_ERR(vm)) {
+			drm_dbg_kms(&dev_priv->drm, "failed to create DPT\n");
+			return false;
+		}
+
+		intel_fb->dpt_vm = vm;
+	}
+#else
+	/* Hold a reference to object while fb is alive */
+	xe_bo_get(obj);
+#endif
+
+	return true;
+}
+
+static struct drm_gem_object *get_plane_base(struct drm_i915_gem_object *obj)
+{
+#ifdef I915
+		return &obj->base;
+#else
+		return &obj->ttm.base;
+#endif
+}
+
 int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			   struct drm_i915_gem_object *obj,
 			   struct drm_mode_fb_cmd2 *mode_cmd)
@@ -2155,34 +2190,15 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			}
 		}
 
-#ifdef I915
-		fb->obj[i] = &obj->base;
-#else
-		fb->obj[i] = &obj->ttm.base;
-#endif
+		fb->obj[i] = get_plane_base(obj);
 	}
 
 	ret = intel_fill_fb_info(dev_priv, intel_fb);
 	if (ret)
 		goto err;
 
-#ifdef I915
-	if (intel_fb_uses_dpt(fb)) {
-		struct i915_address_space *vm;
-
-		vm = intel_dpt_create(intel_fb);
-		if (IS_ERR(vm)) {
-			drm_dbg_kms(&dev_priv->drm, "failed to create DPT\n");
-			ret = PTR_ERR(vm);
-			goto err;
-		}
-
-		intel_fb->dpt_vm = vm;
-	}
-#else
-	/* Hold a reference to object while fb is alive */
-	xe_bo_get(obj);
-#endif
+	if (!setup_dpt_for_fb(intel_fb, obj))
+		goto err;
 
 	ret = drm_framebuffer_init(&dev_priv->drm, fb, &intel_fb_funcs);
 	if (ret) {
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 776c31e73f29..226325580fee 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -201,7 +201,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_dp_mst.o \
 	i915-display/intel_dpll.o \
 	i915-display/intel_dpll_mgr.o \
-	i915-display/intel_dpt.o \
+	i915-display/intel_dpt_common.o \
 	i915-display/intel_drrs.o \
 	i915-display/intel_dsb.o \
 	i915-display/intel_dsi.o \
-- 
2.25.1

