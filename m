Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3506AEB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 16:11:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F412110E443;
	Thu,  6 Jul 2023 16:11:42 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB6310E443
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 16:11:40 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Jul 2023 18:11:30 +0200
Message-Id: <20230706161130.520247-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix bo refcounting in intel_framebuffer
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

Seems we have various confused refcounting mechanisms.
intel_frontbuffer.c was holding a reference on the bo, but it should be
handled in the framebuffer.

A few rebases before, there was code that explicitly adds a refcount in
intel_fb_init, but chunks of that have disappeared. The changes in
xe_plane_initial are reminders of it.

By adding a refcount, we match how drm_gem_framebuffer_helper handles
things. In i915, this is opaquely (and accidentally?) handled through
intel_frontbuffer_get(), not going to duplicate that mistake in xe.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c          | 10 +++++++---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c |  4 ----
 drivers/gpu/drm/xe/display/xe_plane_initial.c    |  5 ++---
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index d3e8721610794..2ef0a5227c2d3 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1895,7 +1895,8 @@ static void intel_user_framebuffer_destroy_vm(struct drm_framebuffer *fb)
 		xe_bo_lock_no_vm(bo, NULL);
 		xe_bo_unpin(bo);
 		xe_bo_unlock_no_vm(bo);
-        }
+	}
+	xe_bo_put(intel_fb_obj(fb));
 #endif
 }
 
@@ -1905,10 +1906,10 @@ static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
 
 	drm_framebuffer_cleanup(fb);
 
-	intel_user_framebuffer_destroy_vm(fb);
-
 	intel_frontbuffer_put(intel_fb->frontbuffer);
 
+	intel_user_framebuffer_destroy_vm(fb);
+
 	kfree(intel_fb);
 }
 
@@ -2125,6 +2126,9 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 
 		intel_fb->dpt_vm = vm;
 	}
+#else
+	/* Hold a reference to object while fb is alive */
+	xe_bo_get(obj);
 #endif
 
 	ret = drm_framebuffer_init(&dev_priv->drm, fb, &intel_fb_funcs);
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 64fdc78803815..15d414ed0d731 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -256,8 +256,6 @@ static void frontbuffer_release(struct kref *ref)
 	i915_active_fini(&front->write);
 
 	i915_gem_object_put(obj);
-#else
-	xe_bo_get(obj);
 #endif
 	kfree_rcu(front, rcu);
 }
@@ -300,8 +298,6 @@ intel_frontbuffer_get(struct drm_i915_gem_object *obj)
 		rcu_assign_pointer(obj->frontbuffer, front);
 	}
 	spin_unlock(&i915->display.fb_tracking.lock);
-#else
-	xe_bo_get(obj);
 #endif
 
 	return front;
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index fad4c66a82264..f6caf64b99d54 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -166,6 +166,8 @@ intel_alloc_initial_plane_obj(struct intel_crtc *crtc,
 		drm_dbg_kms(&dev_priv->drm, "intel fb init failed\n");
 		goto err_bo;
 	}
+	/* Reference handed over to fb */
+	xe_bo_put(bo);
 
 	return true;
 
@@ -265,9 +267,6 @@ static void plane_config_fini(struct intel_initial_plane_config *plane_config)
 		else
 			kfree(fb);
 	}
-
-	if (plane_config->vma)
-		drm_gem_object_put(&plane_config->vma->bo->ttm.base);
 }
 
 void intel_crtc_initial_plane_config(struct intel_crtc *crtc)
-- 
2.39.2

