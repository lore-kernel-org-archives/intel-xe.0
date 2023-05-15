Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29592C7EE24
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 09:46:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C27E10E198;
	Mon, 15 May 2023 09:46:49 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB7410E1A6
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 09:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684144006; x=1715680006;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sy/u3iPP6DHbsPoygnQaYf3BmX6COnqDT6Tw2HvtLxM=;
 b=fg5K2L8W7Mvg4L/DOuGMQkI/gG5BVL0BFp2zcDANapvd77mgb58S28qI
 FaBjBxgAKolexUiNXMUX34E7X+p0C+Puf9acvAtIiLWks+RCOoQ8WwIyv
 lSTNB0GF2pFv2ovsV/QBdyyuo5dfpKAZ1ROkh7M8/o9jeV2Aaxcm7kDVf
 7AyI/3tMlj3ot3jF3UaPR3AmozMQJTzVr6oN6GOnGIviSD9T6fy5yrfIf
 oihyg8uxkB+einKRd9CUzCdS4XRSXARovyfSzIx0/ORTYuNgPF4mwy81F
 YNw/jfJHGM4rt6nwS2r6TR92LDgtMDLN3AeWLENx7x1UlxJY+IyCH6cEQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="340510198"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="340510198"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 02:46:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694947288"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="694947288"
Received: from dbenelli-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.48.185])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 02:46:40 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 15 May 2023 12:46:13 +0300
Message-Id: <20230515094614.1850878-4-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515094614.1850878-1-jouni.hogander@intel.com>
References: <20230515094614.1850878-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/4] fixup! drm/i915/display: Remaining changes
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, uma.shankar@intel.com,
 rodrigo.vivi@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

After reverting frontbuffer tracking removal our build is broken. Fix this
by adding some includes and ifdefs.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_drrs.c     |  1 +
 drivers/gpu/drm/i915/display/intel_fb.c       |  5 ++-
 .../gpu/drm/i915/display/intel_frontbuffer.c  | 43 +++++++++++++++----
 .../gpu/drm/i915/display/intel_frontbuffer.h  |  9 ++++
 drivers/gpu/drm/i915/display/intel_psr.c      |  1 +
 .../drm/i915/display/skl_universal_plane.c    |  1 +
 6 files changed, 49 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_drrs.c b/drivers/gpu/drm/i915/display/intel_drrs.c
index 760e63cdc0c8..59527a4667f4 100644
--- a/drivers/gpu/drm/i915/display/intel_drrs.c
+++ b/drivers/gpu/drm/i915/display/intel_drrs.c
@@ -9,6 +9,7 @@
 #include "intel_de.h"
 #include "intel_display_types.h"
 #include "intel_drrs.h"
+#include "intel_frontbuffer.h"
 #include "intel_panel.h"
 
 /**
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 953e3a4269b6..7856b6191cd8 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -13,6 +13,7 @@
 #include "intel_display_types.h"
 #include "intel_dpt.h"
 #include "intel_fb.h"
+#include "intel_frontbuffer.h"
 
 #ifdef I915
 /*
@@ -1923,11 +1924,13 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 	int i;
 #ifdef I915
 	unsigned tiling, stride;
+#endif
 
 	intel_fb->frontbuffer = intel_frontbuffer_get(obj);
 	if (!intel_fb->frontbuffer)
 		return -ENOMEM;
 
+#ifdef I915
 	i915_gem_object_lock(obj, NULL);
 	tiling = i915_gem_object_get_tiling(obj);
 	stride = i915_gem_object_get_stride(obj);
@@ -1975,8 +1978,6 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 	ttm_bo_unreserve(&obj->ttm);
 #endif
 
-	atomic_set(&intel_fb->bits, 0);
-
 	if (!drm_any_plane_has_format(&dev_priv->drm,
 				      mode_cmd->pixel_format,
 				      mode_cmd->modifier[0])) {
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 17a7aa8b28c2..64fdc7880381 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -163,11 +163,17 @@ void intel_frontbuffer_flip(struct drm_i915_private *i915,
 	frontbuffer_flush(i915, frontbuffer_bits, ORIGIN_FLIP);
 }
 
+#ifdef I915
+#define intel_bo_to_i915(obj) to_i915((obj)->base.dev)
+#else
+#define intel_bo_to_i915(obj) to_i915((obj)->ttm.base.dev)
+#endif
+
 void __intel_fb_invalidate(struct intel_frontbuffer *front,
 			   enum fb_op_origin origin,
 			   unsigned int frontbuffer_bits)
 {
-	struct drm_i915_private *i915 = to_i915(front->obj->base.dev);
+	struct drm_i915_private *i915 = intel_bo_to_i915(front->obj);
 
 	if (origin == ORIGIN_CS) {
 		spin_lock(&i915->display.fb_tracking.lock);
@@ -188,7 +194,7 @@ void __intel_fb_flush(struct intel_frontbuffer *front,
 		      enum fb_op_origin origin,
 		      unsigned int frontbuffer_bits)
 {
-	struct drm_i915_private *i915 = to_i915(front->obj->base.dev);
+	struct drm_i915_private *i915 = intel_bo_to_i915((front->obj));
 
 	if (origin == ORIGIN_CS) {
 		spin_lock(&i915->display.fb_tracking.lock);
@@ -202,6 +208,7 @@ void __intel_fb_flush(struct intel_frontbuffer *front,
 		frontbuffer_flush(i915, frontbuffer_bits, origin);
 }
 
+#ifdef I915
 static int frontbuffer_active(struct i915_active *ref)
 {
 	struct intel_frontbuffer *front =
@@ -219,17 +226,21 @@ static void frontbuffer_retire(struct i915_active *ref)
 	intel_frontbuffer_flush(front, ORIGIN_CS);
 	intel_frontbuffer_put(front);
 }
+#endif
 
 static void frontbuffer_release(struct kref *ref)
-	__releases(&to_i915(front->obj->base.dev)->display.fb_tracking.lock)
+	__releases(&intel_bo_to_i915(front->obj)->display.fb_tracking.lock)
 {
 	struct intel_frontbuffer *front =
 		container_of(ref, typeof(*front), ref);
 	struct drm_i915_gem_object *obj = front->obj;
+#ifdef I915
 	struct i915_vma *vma;
+#endif
 
-	drm_WARN_ON(obj->base.dev, atomic_read(&front->bits));
+	drm_WARN_ON(&intel_bo_to_i915(obj)->drm, atomic_read(&front->bits));
 
+#ifdef I915
 	spin_lock(&obj->vma.lock);
 	for_each_ggtt_vma(vma, obj) {
 		i915_vma_clear_scanout(vma);
@@ -238,23 +249,32 @@ static void frontbuffer_release(struct kref *ref)
 	spin_unlock(&obj->vma.lock);
 
 	RCU_INIT_POINTER(obj->frontbuffer, NULL);
-	spin_unlock(&to_i915(obj->base.dev)->display.fb_tracking.lock);
+#endif
+	spin_unlock(&intel_bo_to_i915(obj)->display.fb_tracking.lock);
 
+#ifdef I915
 	i915_active_fini(&front->write);
 
 	i915_gem_object_put(obj);
+#else
+	xe_bo_get(obj);
+#endif
 	kfree_rcu(front, rcu);
 }
 
 struct intel_frontbuffer *
 intel_frontbuffer_get(struct drm_i915_gem_object *obj)
 {
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+#ifdef I915
+	struct drm_i915_private *i915 = intel_bo_to_i915(obj);
+#endif
 	struct intel_frontbuffer *front;
 
+#ifdef I915
 	front = __intel_frontbuffer_get(obj);
 	if (front)
 		return front;
+#endif
 
 	front = kmalloc(sizeof(*front), GFP_KERNEL);
 	if (!front)
@@ -263,6 +283,7 @@ intel_frontbuffer_get(struct drm_i915_gem_object *obj)
 	front->obj = obj;
 	kref_init(&front->ref);
 	atomic_set(&front->bits, 0);
+#ifdef I915
 	i915_active_init(&front->write,
 			 frontbuffer_active,
 			 frontbuffer_retire,
@@ -274,10 +295,14 @@ intel_frontbuffer_get(struct drm_i915_gem_object *obj)
 		front = rcu_dereference_protected(obj->frontbuffer, true);
 		kref_get(&front->ref);
 	} else {
+
 		i915_gem_object_get(obj);
 		rcu_assign_pointer(obj->frontbuffer, front);
 	}
 	spin_unlock(&i915->display.fb_tracking.lock);
+#else
+	xe_bo_get(obj);
+#endif
 
 	return front;
 }
@@ -286,7 +311,7 @@ void intel_frontbuffer_put(struct intel_frontbuffer *front)
 {
 	kref_put_lock(&front->ref,
 		      frontbuffer_release,
-		      &to_i915(front->obj->base.dev)->display.fb_tracking.lock);
+		      &intel_bo_to_i915(front->obj)->display.fb_tracking.lock);
 }
 
 /**
@@ -315,13 +340,13 @@ void intel_frontbuffer_track(struct intel_frontbuffer *old,
 	BUILD_BUG_ON(I915_MAX_PLANES > INTEL_FRONTBUFFER_BITS_PER_PIPE);
 
 	if (old) {
-		drm_WARN_ON(old->obj->base.dev,
+		drm_WARN_ON(&intel_bo_to_i915(old->obj)->drm,
 			    !(atomic_read(&old->bits) & frontbuffer_bits));
 		atomic_andnot(frontbuffer_bits, &old->bits);
 	}
 
 	if (new) {
-		drm_WARN_ON(new->obj->base.dev,
+		drm_WARN_ON(&intel_bo_to_i915(old->obj)->drm,
 			    atomic_read(&new->bits) & frontbuffer_bits);
 		atomic_or(frontbuffer_bits, &new->bits);
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.h b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
index 3c474ed937fb..be33bc2a84cd 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.h
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.h
@@ -28,7 +28,12 @@
 #include <linux/bits.h>
 #include <linux/kref.h>
 
+#ifdef I915
 #include "gem/i915_gem_object_types.h"
+#else
+#include "xe_bo.h"
+#endif
+
 #include "i915_active_types.h"
 
 struct drm_i915_private;
@@ -44,7 +49,9 @@ enum fb_op_origin {
 struct intel_frontbuffer {
 	struct kref ref;
 	atomic_t bits;
+#ifdef I915
 	struct i915_active write;
+#endif
 	struct drm_i915_gem_object *obj;
 	struct rcu_head rcu;
 };
@@ -75,6 +82,7 @@ void intel_frontbuffer_flip(struct drm_i915_private *i915,
 
 void intel_frontbuffer_put(struct intel_frontbuffer *front);
 
+#ifdef I915
 static inline struct intel_frontbuffer *
 __intel_frontbuffer_get(const struct drm_i915_gem_object *obj)
 {
@@ -101,6 +109,7 @@ __intel_frontbuffer_get(const struct drm_i915_gem_object *obj)
 
 	return front;
 }
+#endif
 
 struct intel_frontbuffer *
 intel_frontbuffer_get(struct drm_i915_gem_object *obj);
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index ea0389c5f656..2ecc902a85a2 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -32,6 +32,7 @@
 #include "intel_display_types.h"
 #include "intel_dp.h"
 #include "intel_dp_aux.h"
+#include "intel_frontbuffer.h"
 #include "intel_hdmi.h"
 #include "intel_psr.h"
 #include "intel_psr_regs.h"
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 71ba544eda71..0f1e4e61d32e 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -16,6 +16,7 @@
 #include "intel_display_types.h"
 #include "intel_fb.h"
 #include "intel_fbc.h"
+#include "intel_frontbuffer.h"
 #include "intel_psr.h"
 #include "skl_scaler.h"
 #include "skl_universal_plane.h"
-- 
2.34.1

