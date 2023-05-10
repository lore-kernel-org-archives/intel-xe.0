Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58793C7EE23
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 12:12:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2795F10E4B0;
	Wed, 10 May 2023 12:12:18 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CB910E48D
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 12:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683720735; x=1715256735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1066wqxzbwXYGMQxu/GDSSy5O+KhnrvNMY2nK6fPJ9I=;
 b=NXllCugZyLKH4yn6fFqijKmi1nYcHHglWPvJp2vF+UyIqtd1ATyMX5AM
 nPR7PEc3BoB86cgDtsquDMXLC4Nn/b9weKgRIkgptPyMtx3u1dVHcxAgd
 THQgmgyDYIIRNOpzy3bWKGa08vQVrvwqep0bgIGBZtFcK5ubHgc08tqxE
 GsfZOo7+kKMKjchsTkVUTnKVJU07N/tRsxkurPstoal+vjmtLlVRkojBn
 A4H3pbaO4SrXSJdPcJVM3V7neVee6dMng5Ce5YOT95GuByRrrMZ8Y70J9
 55rrPsCJfH2FP1mxx7xg//xN5z8aV9QFmgLsfOtMgx92JVM1FeQ3bOg/J A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="353268064"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="353268064"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="788906029"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="788906029"
Received: from iisaev-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.141])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:12 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 15:11:31 +0300
Message-Id: <20230510121152.736148-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510121152.736148-1-jouni.hogander@intel.com>
References: <20230510121152.736148-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH v2 02/23] Revert "drm/i915/display: Neuter
 frontbuffer tracking harder"
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
Cc: jani.nikula@intel.com, rodrigo.vivi@kernel.org,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 ville.syrjala@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit be61174d7bac499b131da0fe6438a456bbc9f5a2.

We want to keep frontbuffer tracking as removing it would break
GPU rendering in i915 driver.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c   |   6 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   4 +-
 .../drm/i915/display/intel_display_types.h    |   8 +-
 drivers/gpu/drm/i915/display/intel_fb.c       |  11 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |   6 +
 drivers/gpu/drm/i915/display/intel_fbdev.c    |   7 +-
 .../gpu/drm/i915/display/intel_frontbuffer.c  | 103 ++++++++++++++++--
 .../gpu/drm/i915/display/intel_frontbuffer.h  |  67 +++++++++---
 .../drm/i915/display/intel_plane_initial.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_sprite.c   |   1 -
 10 files changed, 182 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 7ed555ea48db..8dd9dac3389c 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -692,10 +692,10 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	if (ret)
 		goto out_free;
 
-	intel_frontbuffer_flush(to_intel_framebuffer(new_plane_state->hw.fb),
+	intel_frontbuffer_flush(to_intel_frontbuffer(new_plane_state->hw.fb),
 				ORIGIN_CURSOR_UPDATE);
-	intel_frontbuffer_track(to_intel_framebuffer(old_plane_state->hw.fb),
-				to_intel_framebuffer(new_plane_state->hw.fb),
+	intel_frontbuffer_track(to_intel_frontbuffer(old_plane_state->hw.fb),
+				to_intel_frontbuffer(new_plane_state->hw.fb),
 				plane->frontbuffer_bit);
 
 	/* Swap plane state */
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 960f31a75e39..9187d37ffdf4 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7199,8 +7199,8 @@ static void intel_atomic_track_fbs(struct intel_atomic_state *state)
 
 	for_each_oldnew_intel_plane_in_state(state, plane, old_plane_state,
 					     new_plane_state, i)
-		intel_frontbuffer_track(to_intel_framebuffer(old_plane_state->hw.fb),
-					to_intel_framebuffer(new_plane_state->hw.fb),
+		intel_frontbuffer_track(to_intel_frontbuffer(old_plane_state->hw.fb),
+					to_intel_frontbuffer(new_plane_state->hw.fb),
 					plane->frontbuffer_bit);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 0ca35d21326f..dc6ed6280afb 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -135,7 +135,7 @@ struct intel_fb_view {
 
 struct intel_framebuffer {
 	struct drm_framebuffer base;
-	atomic_t bits;
+	struct intel_frontbuffer *frontbuffer;
 
 	/* Params to remap the FB pages and program the plane registers in each view. */
 	struct intel_fb_view normal_view;
@@ -2092,4 +2092,10 @@ static inline u32 intel_plane_ggtt_offset(const struct intel_plane_state *plane_
 #endif
 }
 
+static inline struct intel_frontbuffer *
+to_intel_frontbuffer(struct drm_framebuffer *fb)
+{
+	return fb ? to_intel_framebuffer(fb)->frontbuffer : NULL;
+}
+
 #endif /*  __INTEL_DISPLAY_TYPES_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 24637199c274..9a7928f7fa08 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1865,7 +1865,8 @@ static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
 
 	intel_user_framebuffer_destroy_vm(fb);
 
-	drm_gem_object_put(fb->obj[0]);
+	intel_frontbuffer_put(intel_fb->frontbuffer);
+
 	kfree(intel_fb);
 }
 
@@ -1896,7 +1897,7 @@ static int intel_user_framebuffer_dirty(struct drm_framebuffer *fb,
 	struct drm_i915_gem_object *obj = intel_fb_obj(fb);
 
 	i915_gem_object_flush_if_display(obj);
-	intel_frontbuffer_flush(to_intel_framebuffer(fb), ORIGIN_DIRTYFB);
+	intel_frontbuffer_flush(to_intel_frontbuffer(fb), ORIGIN_DIRTYFB);
 
 	return 0;
 }
@@ -1924,6 +1925,10 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 #ifdef I915
 	unsigned tiling, stride;
 
+	intel_fb->frontbuffer = intel_frontbuffer_get(obj);
+	if (!intel_fb->frontbuffer)
+		return -ENOMEM;
+
 	i915_gem_object_lock(obj, NULL);
 	tiling = i915_gem_object_get_tiling(obj);
 	stride = i915_gem_object_get_stride(obj);
@@ -2086,12 +2091,12 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 		goto err_free_dpt;
 	}
 
-	drm_gem_object_get(fb->obj[0]);
 	return 0;
 
 err_free_dpt:
 	intel_user_framebuffer_destroy_vm(fb);
 err:
+	intel_frontbuffer_put(intel_fb->frontbuffer);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
index 70bce1a99a53..1aca7552a85d 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
+++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
@@ -37,6 +37,9 @@ intel_pin_fb_obj_dpt(struct drm_framebuffer *fb,
 	 */
 	GEM_WARN_ON(vm->bind_async_flags);
 
+	if (WARN_ON(!i915_gem_object_is_framebuffer(obj)))
+		return ERR_PTR(-EINVAL);
+
 	alignment = 4096 * 512;
 
 	atomic_inc(&dev_priv->gpu_error.pending_fb_pin);
@@ -116,6 +119,9 @@ intel_pin_and_fence_fb_obj(struct drm_framebuffer *fb,
 	u32 alignment;
 	int ret;
 
+	if (drm_WARN_ON(dev, !i915_gem_object_is_framebuffer(obj)))
+		return ERR_PTR(-EINVAL);
+
 	if (phys_cursor)
 		alignment = intel_cursor_alignment(dev_priv);
 	else
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 6362c4ce15b6..95f4cbc2e675 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -87,9 +87,14 @@ static struct intel_fbdev *to_intel_fbdev(struct drm_fb_helper *fb_helper)
 	return container_of(fb_helper, struct intel_fbdev, helper);
 }
 
+static struct intel_frontbuffer *to_frontbuffer(struct intel_fbdev *ifbdev)
+{
+	return ifbdev->fb->frontbuffer;
+}
+
 static void intel_fbdev_invalidate(struct intel_fbdev *ifbdev)
 {
-	intel_frontbuffer_invalidate(ifbdev->fb, ORIGIN_CPU);
+	intel_frontbuffer_invalidate(to_frontbuffer(ifbdev), ORIGIN_CPU);
 }
 
 static int intel_fbdev_set_par(struct fb_info *info)
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 99d194803520..17a7aa8b28c2 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -163,11 +163,11 @@ void intel_frontbuffer_flip(struct drm_i915_private *i915,
 	frontbuffer_flush(i915, frontbuffer_bits, ORIGIN_FLIP);
 }
 
-void __intel_fb_invalidate(struct intel_framebuffer *fb,
+void __intel_fb_invalidate(struct intel_frontbuffer *front,
 			   enum fb_op_origin origin,
 			   unsigned int frontbuffer_bits)
 {
-	struct drm_i915_private *i915 = to_i915(fb->base.dev);
+	struct drm_i915_private *i915 = to_i915(front->obj->base.dev);
 
 	if (origin == ORIGIN_CS) {
 		spin_lock(&i915->display.fb_tracking.lock);
@@ -184,11 +184,11 @@ void __intel_fb_invalidate(struct intel_framebuffer *fb,
 	intel_fbc_invalidate(i915, frontbuffer_bits, origin);
 }
 
-void __intel_fb_flush(struct intel_framebuffer *fb,
+void __intel_fb_flush(struct intel_frontbuffer *front,
 		      enum fb_op_origin origin,
 		      unsigned int frontbuffer_bits)
 {
-	struct drm_i915_private *i915 = to_i915(fb->base.dev);
+	struct drm_i915_private *i915 = to_i915(front->obj->base.dev);
 
 	if (origin == ORIGIN_CS) {
 		spin_lock(&i915->display.fb_tracking.lock);
@@ -202,6 +202,93 @@ void __intel_fb_flush(struct intel_framebuffer *fb,
 		frontbuffer_flush(i915, frontbuffer_bits, origin);
 }
 
+static int frontbuffer_active(struct i915_active *ref)
+{
+	struct intel_frontbuffer *front =
+		container_of(ref, typeof(*front), write);
+
+	kref_get(&front->ref);
+	return 0;
+}
+
+static void frontbuffer_retire(struct i915_active *ref)
+{
+	struct intel_frontbuffer *front =
+		container_of(ref, typeof(*front), write);
+
+	intel_frontbuffer_flush(front, ORIGIN_CS);
+	intel_frontbuffer_put(front);
+}
+
+static void frontbuffer_release(struct kref *ref)
+	__releases(&to_i915(front->obj->base.dev)->display.fb_tracking.lock)
+{
+	struct intel_frontbuffer *front =
+		container_of(ref, typeof(*front), ref);
+	struct drm_i915_gem_object *obj = front->obj;
+	struct i915_vma *vma;
+
+	drm_WARN_ON(obj->base.dev, atomic_read(&front->bits));
+
+	spin_lock(&obj->vma.lock);
+	for_each_ggtt_vma(vma, obj) {
+		i915_vma_clear_scanout(vma);
+		vma->display_alignment = I915_GTT_MIN_ALIGNMENT;
+	}
+	spin_unlock(&obj->vma.lock);
+
+	RCU_INIT_POINTER(obj->frontbuffer, NULL);
+	spin_unlock(&to_i915(obj->base.dev)->display.fb_tracking.lock);
+
+	i915_active_fini(&front->write);
+
+	i915_gem_object_put(obj);
+	kfree_rcu(front, rcu);
+}
+
+struct intel_frontbuffer *
+intel_frontbuffer_get(struct drm_i915_gem_object *obj)
+{
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct intel_frontbuffer *front;
+
+	front = __intel_frontbuffer_get(obj);
+	if (front)
+		return front;
+
+	front = kmalloc(sizeof(*front), GFP_KERNEL);
+	if (!front)
+		return NULL;
+
+	front->obj = obj;
+	kref_init(&front->ref);
+	atomic_set(&front->bits, 0);
+	i915_active_init(&front->write,
+			 frontbuffer_active,
+			 frontbuffer_retire,
+			 I915_ACTIVE_RETIRE_SLEEPS);
+
+	spin_lock(&i915->display.fb_tracking.lock);
+	if (rcu_access_pointer(obj->frontbuffer)) {
+		kfree(front);
+		front = rcu_dereference_protected(obj->frontbuffer, true);
+		kref_get(&front->ref);
+	} else {
+		i915_gem_object_get(obj);
+		rcu_assign_pointer(obj->frontbuffer, front);
+	}
+	spin_unlock(&i915->display.fb_tracking.lock);
+
+	return front;
+}
+
+void intel_frontbuffer_put(struct intel_frontbuffer *front)
+{
+	kref_put_lock(&front->ref,
+		      frontbuffer_release,
+		      &to_i915(front->obj->base.dev)->display.fb_tracking.lock);
+}
+
 /**
  * intel_frontbuffer_track - update frontbuffer tracking
  * @old: current buffer for the frontbuffer slots
@@ -211,8 +298,8 @@ void __intel_fb_flush(struct intel_framebuffer *fb,
  * This updates the frontbuffer tracking bits @frontbuffer_bits by clearing them
  * from @old and setting them in @new. Both @old and @new can be NULL.
  */
-void intel_frontbuffer_track(struct intel_framebuffer *old,
-			     struct intel_framebuffer *new,
+void intel_frontbuffer_track(struct intel_frontbuffer *old,
+			     struct intel_frontbuffer *new,
 			     unsigned int frontbuffer_bits)
 {
 	/*
@@ -228,13 +315,13 @@ void intel_frontbuffer_track(struct intel_framebuffer *old,
 	BUILD_BUG_ON(I915_MAX_PLANES > INTEL_FRONTBUFFER_BITS_PER_PIPE);
 
 	if (old) {
-		drm_WARN_ON(old->base.dev,
+		drm_WARN_ON(old->obj->base.dev,
 			    !(atomic_read(&old->bits) & frontbuffer_bits));
 		atomic_andnot(frontbuffer_bits, &old->bits);
 	}
 
 	if (new) {
-		drm_WARN_ON(new->base.dev,
+		drm_WARN_ON(new->obj->base.dev,
 			    atomic_read(&new->bits) & frontbuffer_bits);
 		atomic_or(frontbuffer_bits, &new->bits);
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.h b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
index b91338651139..3c474ed937fb 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.h
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
@@ -28,7 +28,8 @@
 #include <linux/bits.h>
 #include <linux/kref.h>
 
-#include "intel_display_types.h"
+#include "gem/i915_gem_object_types.h"
+#include "i915_active_types.h"
 
 struct drm_i915_private;
 
@@ -40,6 +41,14 @@ enum fb_op_origin {
 	ORIGIN_CURSOR_UPDATE,
 };
 
+struct intel_frontbuffer {
+	struct kref ref;
+	atomic_t bits;
+	struct i915_active write;
+	struct drm_i915_gem_object *obj;
+	struct rcu_head rcu;
+};
+
 /*
  * Frontbuffer tracking bits. Set in obj->frontbuffer_bits while a gem bo is
  * considered to be the frontbuffer for the given plane interface-wise. This
@@ -64,7 +73,39 @@ void intel_frontbuffer_flip_complete(struct drm_i915_private *i915,
 void intel_frontbuffer_flip(struct drm_i915_private *i915,
 			    unsigned frontbuffer_bits);
 
-void __intel_fb_invalidate(struct intel_framebuffer *front,
+void intel_frontbuffer_put(struct intel_frontbuffer *front);
+
+static inline struct intel_frontbuffer *
+__intel_frontbuffer_get(const struct drm_i915_gem_object *obj)
+{
+	struct intel_frontbuffer *front;
+
+	if (likely(!rcu_access_pointer(obj->frontbuffer)))
+		return NULL;
+
+	rcu_read_lock();
+	do {
+		front = rcu_dereference(obj->frontbuffer);
+		if (!front)
+			break;
+
+		if (unlikely(!kref_get_unless_zero(&front->ref)))
+			continue;
+
+		if (likely(front == rcu_access_pointer(obj->frontbuffer)))
+			break;
+
+		intel_frontbuffer_put(front);
+	} while (1);
+	rcu_read_unlock();
+
+	return front;
+}
+
+struct intel_frontbuffer *
+intel_frontbuffer_get(struct drm_i915_gem_object *obj);
+
+void __intel_fb_invalidate(struct intel_frontbuffer *front,
 			   enum fb_op_origin origin,
 			   unsigned int frontbuffer_bits);
 
@@ -79,23 +120,23 @@ void __intel_fb_invalidate(struct intel_framebuffer *front,
  * until the rendering completes or a flip on this frontbuffer plane is
  * scheduled.
  */
-static inline bool intel_frontbuffer_invalidate(struct intel_framebuffer *fb,
+static inline bool intel_frontbuffer_invalidate(struct intel_frontbuffer *front,
 						enum fb_op_origin origin)
 {
 	unsigned int frontbuffer_bits;
 
-	if (!fb)
+	if (!front)
 		return false;
 
-	frontbuffer_bits = atomic_read(&fb->bits);
+	frontbuffer_bits = atomic_read(&front->bits);
 	if (!frontbuffer_bits)
 		return false;
 
-	__intel_fb_invalidate(fb, origin, frontbuffer_bits);
+	__intel_fb_invalidate(front, origin, frontbuffer_bits);
 	return true;
 }
 
-void __intel_fb_flush(struct intel_framebuffer *fb,
+void __intel_fb_flush(struct intel_frontbuffer *front,
 		      enum fb_op_origin origin,
 		      unsigned int frontbuffer_bits);
 
@@ -107,23 +148,23 @@ void __intel_fb_flush(struct intel_framebuffer *fb,
  * This function gets called every time rendering on the given object has
  * completed and frontbuffer caching can be started again.
  */
-static inline void intel_frontbuffer_flush(struct intel_framebuffer *fb,
+static inline void intel_frontbuffer_flush(struct intel_frontbuffer *front,
 					   enum fb_op_origin origin)
 {
 	unsigned int frontbuffer_bits;
 
-	if (!fb)
+	if (!front)
 		return;
 
-	frontbuffer_bits = atomic_read(&fb->bits);
+	frontbuffer_bits = atomic_read(&front->bits);
 	if (!frontbuffer_bits)
 		return;
 
-	__intel_fb_flush(fb, origin, frontbuffer_bits);
+	__intel_fb_flush(front, origin, frontbuffer_bits);
 }
 
-void intel_frontbuffer_track(struct intel_framebuffer *old,
-			     struct intel_framebuffer *new,
+void intel_frontbuffer_track(struct intel_frontbuffer *old,
+			     struct intel_frontbuffer *new,
 			     unsigned int frontbuffer_bits);
 
 #endif /* __INTEL_FRONTBUFFER_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index 573b193c7595..451a642e106e 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -283,7 +283,7 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
 	plane_state->uapi.crtc = &crtc->base;
 	intel_plane_copy_uapi_to_hw_state(plane_state, plane_state, crtc);
 
-	atomic_or(plane->frontbuffer_bit, &to_intel_framebuffer(fb)->bits);
+	atomic_or(plane->frontbuffer_bit, &to_intel_frontbuffer(fb)->bits);
 }
 
 static void plane_config_fini(struct intel_initial_plane_config *plane_config)
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 718fe026c5f7..d9713094735b 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -46,7 +46,6 @@
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_fb.h"
-#include "intel_frontbuffer.h"
 #include "intel_sprite.h"
 
 static void i9xx_plane_linear_gamma(u16 gamma[8])
-- 
2.34.1

