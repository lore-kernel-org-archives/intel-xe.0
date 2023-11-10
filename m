Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73188C4167B
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 13:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368ED10E057;
	Fri, 10 Nov 2023 13:29:16 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC3310E033
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 13:29:12 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507bd644a96so2867795e87.3
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 05:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699622950; x=1700227750; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s51/8eWqmGoBvxQhfptRKaF+kLsAdhn5BwJtr/aMrOU=;
 b=jutCgkJQSU34KoslYRX6dR2Cnj+p9wyS9qFZhEBUgPu5xRBjxn12v7tyn37ieAI/jn
 XfA4HG9oJSjKGYZWqDUxOYbN0rMykuGwxk7xjGXDni74Zd/embf+2dZTJV1HjXcD1zrq
 5EoPkqGKfrzd1ShNah8yeL6MwgUm8SUWoUWKXptDjuGhHjXAiGQSn6iI9Q8tRDLdHwUm
 r9fx5gdQo88QCyXFe0jexGk7FebDJEu+sbF8ZIUKNOHMLeI8ekImzigT9e05ym4vvjEE
 3gcLhb8CLpHO4eExEqVYty8AbYBqpV94WgFi/w8XI2LKFj5PWhm89DT25F0sFKTyERcF
 bn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699622950; x=1700227750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s51/8eWqmGoBvxQhfptRKaF+kLsAdhn5BwJtr/aMrOU=;
 b=nyUROySucMOLkC+egWDrs1NNzubxDcRq5lErGG1CyiOFg2dIj7kFklxBerXzKTE8wX
 eRj7YSorEl+JMJVyeMKx89PVpC8faeGjoarR7QRGMbJvJdiSc6KoqHKZatXHp4Az249O
 OtU+vseHYRrTmlw2vVaXQpO15+A5smtfzNYZm0lhqHsBz1HrsIBHcPMTIWojIruvDcdy
 I6UpAija3MZ5BbgDcVz01eRwJ2wiS96gQNetWGEXhVO6qiAn74toexaC8oaOLgpvf/t3
 oHmgPfb2RosMrfZUW9QKSzEsAuLVNQQv3ulkevLfvr0zUdlNlxaOjB6zuRFUYxjeapnC
 iqtA==
X-Gm-Message-State: AOJu0YwI2MErkjj+ZfZFzV7Kj2OdAP0gsdDd1M45S2iXV4zPqnKMOlyB
 pDjPUlCt6iM6l1Fq7B/8r6UuQYzKbXmGkA==
X-Google-Smtp-Source: AGHT+IFbvsx+W5kINI7yvbop9d/XdEsgjsp5VHw62/0XGn0ZsiAJBHul4ToK7PHEr1eKwboK+TxSqw==
X-Received: by 2002:a19:3842:0:b0:509:4980:7bf0 with SMTP id
 d2-20020a193842000000b0050949807bf0mr4061650lfj.38.1699622949634; 
 Fri, 10 Nov 2023 05:29:09 -0800 (PST)
Received: from jheikkil-mobl1.. ([2001:998:22:0:dab1:ffff:74fa:defd])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a056512128200b0050a6f98cffesm215621lfs.291.2023.11.10.05.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 05:29:09 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Nov 2023 15:29:03 +0200
Message-Id: <20231110132904.73357-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110132904.73357-1-juhapekka.heikkila@gmail.com>
References: <20231110132904.73357-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v7 2/3] drm/i915: xe dpt integration
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Abstract i915 and Xe dpt related differences. Create
intel_dpt_common.c where common dpt code go into.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 drivers/gpu/drm/i915/Makefile                 |  1 +
 drivers/gpu/drm/i915/display/intel_display.c  |  1 +
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dpt.c      | 26 --------------
 drivers/gpu/drm/i915/display/intel_dpt.h      |  2 --
 .../gpu/drm/i915/display/intel_dpt_common.c   | 34 +++++++++++++++++++
 .../gpu/drm/i915/display/intel_dpt_common.h   | 13 +++++++
 drivers/gpu/drm/i915/display/intel_fb.c       | 18 ++++++----
 .../drm/i915/display/skl_universal_plane.c    |  3 +-
 drivers/gpu/drm/xe/Makefile                   |  2 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 14 ++++++++
 11 files changed, 79 insertions(+), 36 deletions(-)
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
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index b27b533f03d6..5069b31bf1b7 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -79,6 +79,7 @@
 #include "intel_dpll.h"
 #include "intel_dpll_mgr.h"
 #include "intel_dpt.h"
+#include "intel_dpt_common.h"
 #include "intel_drrs.h"
 #include "intel_dsb.h"
 #include "intel_dsi.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index db20dd7e5c0d..29dd712956b9 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -695,6 +695,7 @@ struct intel_plane_state {
 
 	struct i915_vma *ggtt_vma;
 	struct i915_vma *dpt_vma;
+	struct i915_vma embed_vma;
 	unsigned long flags;
 #define PLANE_HAS_FENCE BIT(0)
 
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
index 2b067cb952f0..b29bceff73f2 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -9,8 +9,6 @@
 #include "gt/gen8_ppgtt.h"
 
 #include "i915_drv.h"
-#include "i915_reg.h"
-#include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_dpt.h"
 #include "intel_fb.h"
@@ -318,27 +316,3 @@ void intel_dpt_destroy(struct i915_address_space *vm)
 	i915_vm_put(&dpt->vm);
 }
 
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
index 3862e55e8980..f7675284907f 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1885,17 +1885,24 @@ int intel_plane_compute_gtt(struct intel_plane_state *plane_state)
 	return intel_plane_check_stride(plane_state);
 }
 
-static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
+static void intel_user_framebuffer_destroy_vm(struct drm_framebuffer *fb)
 {
 	struct intel_framebuffer *intel_fb = to_intel_framebuffer(fb);
 
-	drm_framebuffer_cleanup(fb);
-
 	if (intel_fb_uses_dpt(fb))
 		intel_dpt_destroy(intel_fb->dpt_vm);
+}
+
+static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
+{
+	struct intel_framebuffer *intel_fb = to_intel_framebuffer(fb);
+
+	drm_framebuffer_cleanup(fb);
 
 	intel_frontbuffer_put(intel_fb->frontbuffer);
 
+	intel_user_framebuffer_destroy_vm(fb);
+
 	kfree(intel_fb);
 }
 
@@ -2137,7 +2144,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			}
 		}
 
-		fb->obj[i] = &obj->base;
+		fb->obj[i] = intel_bo_to_drm_bo(obj);
 	}
 
 	ret = intel_fill_fb_info(dev_priv, intel_fb);
@@ -2166,8 +2173,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 	return 0;
 
 err_free_dpt:
-	if (intel_fb_uses_dpt(fb))
-		intel_dpt_destroy(intel_fb->dpt_vm);
+	intel_user_framebuffer_destroy_vm(fb);
 err:
 	intel_frontbuffer_put(intel_fb->frontbuffer);
 	return ret;
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 4553dd6bfbbd..1ed9d5a6283e 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1010,7 +1010,8 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
 		 * The DPT object contains only one vma, so the VMA's offset
 		 * within the DPT is always 0.
 		 */
-		drm_WARN_ON(&i915->drm, plane_state->dpt_vma->node.start);
+		drm_WARN_ON(&i915->drm, plane_state->dpt_vma &&
+			    plane_state->dpt_vma->node.start);
 		drm_WARN_ON(&i915->drm, offset & 0x1fffff);
 		return offset >> 9;
 	} else {
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a1a8847e2ba3..b82641dcca70 100644
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
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index ffd35a59f405..722c84a56607 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -368,3 +368,17 @@ void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state)
 	__xe_unpin_fb_vma(old_plane_state->ggtt_vma);
 	old_plane_state->ggtt_vma = NULL;
 }
+
+/*
+ * For Xe introduce dummy intel_dpt_create which just return NULL and
+ * intel_dpt_destroy which does nothing.
+ */
+struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
+{
+	return NULL;
+}
+
+void intel_dpt_destroy(struct i915_address_space *vm)
+{
+	return;
+}
\ No newline at end of file
-- 
2.25.1

