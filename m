Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4ACBC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 19:56:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A218310E40E;
	Mon, 13 Nov 2023 19:56:44 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530BA10E411
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 19:56:42 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-507bd64814fso7101881e87.1
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 11:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699905400; x=1700510200; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pp8akGAIZc5H09BxEKHhY2mWDQk7DrDuGEok3tk5wj8=;
 b=ILDLVvyiZ+XFCgUeZIn7SgFo65qxndJbaHjl/emoGX6tdxpxWqAsYUYHuVKCuAITTG
 EVU48lo/ctn7X6CeFg3TzacJ5KMKoO50crI+ZhaIkc9/CnULHZlMK8crYOo3xMHhDVc9
 Nro0/Nv917IWO+Jo3A2nrM1kgTNYIr3B2+K2igvUA9joFJu9hCK+14Lqvg3tNtFkNCIi
 +beLo5j3ijhaJAwmo9nGr5dE6UFB16s+N6Ii0EthOvHgFfny2Id/dsnSRBGco3pc/jAQ
 WW/hMJ/JRWX5SCjGtjLnmneUQAWNtNf9TjsfmdaaMEcxRjerXoBsBcWflfzPxDl+A6gM
 Tj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699905400; x=1700510200;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pp8akGAIZc5H09BxEKHhY2mWDQk7DrDuGEok3tk5wj8=;
 b=cB0oxnTEs46I+QIq6I8ou9zx/8AtvieRWti/aWfwyqeqnaoYjtCni1UywhAtWSTCZZ
 cZBMsOCt8sTrfDCF5FqOnrmH+wA++puPqMGAAPBS2++lWn5AROlXqZ04MkKsdxpXcoKm
 +xynIhrIUP+NrTWU2TrvbQt7Aa78S67LUEt4SolspIpPMPGCk7LJq79H4ZveoMv+pWuh
 DO38YZOxJ10Y4XwWUY2qPH92zisQpNK8YkcF9geGyLKrHmSt4sNddon/YgmfiSH7sJw4
 bPgAS4TmHzBs6Vcb1g0dx4mSxUATvjpJ4mDXgDbWJGTUodj0MpQlfT64/gGNHFB4qUJ+
 lbRg==
X-Gm-Message-State: AOJu0YxZ4dU6vrsPDPYa/t57HFkka6j8M3uvanpnBNp/SBO2ziRgFHoK
 BQMmFpsXntZOKDO/K/ztQ2guT/mhQc1eag==
X-Google-Smtp-Source: AGHT+IHjwrJaGmuaTWHbVLBqOpepVfbuX0R5K99vi11GId3oMXcgehepvuCO6mNNOie7CgY3WTjC4g==
X-Received: by 2002:a19:7106:0:b0:50a:6f8a:6461 with SMTP id
 m6-20020a197106000000b0050a6f8a6461mr4369529lfc.58.1699905399624; 
 Mon, 13 Nov 2023 11:56:39 -0800 (PST)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 t25-20020a195f19000000b00507d478c211sm1068710lfb.76.2023.11.13.11.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 11:56:39 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Nov 2023 21:56:28 +0200
Message-Id: <20231113195633.119188-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v9 1/6] Revert "FIXME: drm/i915: xe dpt
 integration"
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

This reverts commit e417510409165b44ad59bfdbc59cd90316e91dc1.
---
 .../gpu/drm/i915/display/intel_atomic_plane.c |  4 ---
 .../drm/i915/display/intel_display_types.h    |  6 ----
 drivers/gpu/drm/i915/display/intel_dpt.c      | 14 +++-----
 drivers/gpu/drm/i915/display/intel_fb.c       | 36 +++----------------
 .../drm/i915/display/skl_universal_plane.c    |  6 +---
 5 files changed, 11 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index 77e281bf4cb5..a8f36ca11e2e 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -111,9 +111,7 @@ intel_plane_duplicate_state(struct drm_plane *plane)
 	__drm_atomic_helper_plane_duplicate_state(plane, &intel_state->uapi);
 
 	intel_state->ggtt_vma = NULL;
-#ifdef I915
 	intel_state->dpt_vma = NULL;
-#endif
 	intel_state->flags = 0;
 
 	/* add reference to fb */
@@ -138,9 +136,7 @@ intel_plane_destroy_state(struct drm_plane *plane,
 	struct intel_plane_state *plane_state = to_intel_plane_state(state);
 
 	drm_WARN_ON(plane->dev, plane_state->ggtt_vma);
-#ifdef I915
 	drm_WARN_ON(plane->dev, plane_state->dpt_vma);
-#endif
 
 	__drm_atomic_helper_plane_destroy_state(&plane_state->uapi);
 	if (plane_state->hw.fb)
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index b5e4b94c129b..db20dd7e5c0d 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -143,9 +143,7 @@ struct intel_framebuffer {
 		struct intel_fb_view remapped_view;
 	};
 
-#ifdef I915
 	struct i915_address_space *dpt_vm;
-#endif
 };
 
 enum intel_hotplug_state {
@@ -696,11 +694,7 @@ struct intel_plane_state {
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
index 6e73c7a15942..2b067cb952f0 100644
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
 
@@ -320,8 +318,6 @@ void intel_dpt_destroy(struct i915_address_space *vm)
 	i915_vm_put(&dpt->vm);
 }
 
-#endif
-
 void intel_dpt_configure(struct intel_crtc *crtc)
 {
 	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 1ce61245728a..3862e55e8980 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1885,34 +1885,16 @@ int intel_plane_compute_gtt(struct intel_plane_state *plane_state)
 	return intel_plane_check_stride(plane_state);
 }
 
-static void intel_user_framebuffer_destroy_vm(struct drm_framebuffer *fb)
-{
-#ifdef I915
-	struct intel_framebuffer *intel_fb = to_intel_framebuffer(fb);
-	if (intel_fb_uses_dpt(fb))
-		intel_dpt_destroy(intel_fb->dpt_vm);
-#else
-	if (intel_fb_obj(fb)->flags & XE_BO_CREATE_PINNED_BIT) {
-		struct xe_bo *bo = intel_fb_obj(fb);
-
-		/* Unpin our kernel fb first */
-		xe_bo_lock(bo, false);
-		xe_bo_unpin(bo);
-		xe_bo_unlock(bo);
-	}
-	xe_bo_put(intel_fb_obj(fb));
-#endif
-}
-
 static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
 {
 	struct intel_framebuffer *intel_fb = to_intel_framebuffer(fb);
 
 	drm_framebuffer_cleanup(fb);
 
-	intel_frontbuffer_put(intel_fb->frontbuffer);
+	if (intel_fb_uses_dpt(fb))
+		intel_dpt_destroy(intel_fb->dpt_vm);
 
-	intel_user_framebuffer_destroy_vm(fb);
+	intel_frontbuffer_put(intel_fb->frontbuffer);
 
 	kfree(intel_fb);
 }
@@ -2155,18 +2137,13 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 			}
 		}
 
-#ifdef I915
 		fb->obj[i] = &obj->base;
-#else
-		fb->obj[i] = &obj->ttm.base;
-#endif
 	}
 
 	ret = intel_fill_fb_info(dev_priv, intel_fb);
 	if (ret)
 		goto err;
 
-#ifdef I915
 	if (intel_fb_uses_dpt(fb)) {
 		struct i915_address_space *vm;
 
@@ -2179,10 +2156,6 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 
 		intel_fb->dpt_vm = vm;
 	}
-#else
-	/* Hold a reference to object while fb is alive */
-	xe_bo_get(obj);
-#endif
 
 	ret = drm_framebuffer_init(&dev_priv->drm, fb, &intel_fb_funcs);
 	if (ret) {
@@ -2193,7 +2166,8 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 	return 0;
 
 err_free_dpt:
-	intel_user_framebuffer_destroy_vm(fb);
+	if (intel_fb_uses_dpt(fb))
+		intel_dpt_destroy(intel_fb->dpt_vm);
 err:
 	intel_frontbuffer_put(intel_fb->frontbuffer);
 	return ret;
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 68eabe089aaf..4553dd6bfbbd 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1010,13 +1010,9 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
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
-- 
2.25.1

