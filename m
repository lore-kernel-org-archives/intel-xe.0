Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9A8606A321
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 11:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B9mTnE94
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D751710FB1A;
	Wed, 11 Nov 2026 11:20:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41EA10FB41;
 Wed, 11 Nov 2026 11:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794396049; x=1825932049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iu6a8wVDejraHFSJrmiidZMYOO9SM4YA6+P/3o9NPes=;
 b=B9mTnE94OKtwf+q2u3mudSYxWcr50pdhfnihdaWRScB59NjscuoowGbQ
 tRaPvXoiVyH3oSEjN5PJEOxGO2pvSB7celEQvKHzann0TbMG+9EJyLUP3
 bRyBbuS/k06gMfkvSTKAw3Kd7w/yNvO6Fqu6gLjYWGh8wSc5r/CGwiwck
 /sClBfv4ESjKzhA0m8BUsk9Awr6CmuKjK5ISzrrldINKvvdWcnji8LgRh
 uk66KTDHDuaJuIWMGF5nBxGmZ7gYY2a/JHi2y6j5DPDqI0OlnRJZ0oyOT
 cVDUR2qSOW66qD6squIC8jDg2DMlD2v/lfGvOiumR6Y/mXxZK6A0eGzg5 g==;
X-CSE-ConnectionGUID: paaTUiRATbqWohW2FeA46w==
X-CSE-MsgGUID: 5c9hdbL+QL67PxPYunwF8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3162133"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3162133"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:49 -0800
X-CSE-ConnectionGUID: Q4NjoqHkQBidWHJ3e1T41w==
X-CSE-MsgGUID: m2ho84XDR0uCPws/T+TvYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8493255"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 03:20:47 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 10/13] drm/i915/dpt: Cache DPTs in the gem object
Date: Wed, 11 Nov 2026 13:20:04 +0200
Message-ID: <20261111112007.16790-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111112007.16790-1-ville.syrjala@linux.intel.com>
References: <20261111112007.16790-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Currently DPTs are tracked in the framebuffer. Each new
framebuffer gets a fresh DPT. On first glance that seems fine,
but the problem is that your typical userspace doesn't
cache framebuffers at all. Each new frame gets a whole new
framebuffer, and we have to therefore start with a new DPT
as well and populate it (and its GGTT mapping) from scratch.
This is all rather expensive.

Fix the situation by tracking the DPTs in the gem object instead.
The whole thing is somewhat modeled after the already existing
vma tracking. Each time a new framebuffer is created we first
look through the already existing DPTs on the gem object, and
if one with an identical gtt view is found it gets reused.

The one major difference between this and the vma stuff is that
vmas can get unbound when not pinned, if there is sufficient
pressure on the address space. I didn't bother implementing
a similar mechanism for DPTs, and instead any created DPT will
simply stay around as long as the actual gem object will stay
around. I'm thinking large gem objects at least shouldn't stay
around long past their use as a framebuffer. Should that turn
out to be false we might need to add some kind of reaping stuff,
or perhaps just limit the number of cached DPTs per gem object.

With this the display code no longer has to even see the
DPT object pointer. Though we do have to pass the obj+view
also the unpin functions so that we can find the right DPT
there. Technically we could now even stop passing around
the vma pointers through the display code, except that
would probably break the vma reuse hacks that xe has..

As for some performance numbers, just a quick
'vblank_mode=0 glxgears -fullscreen' run on MTL with a
debug heavy kernel used to spend ~20% of the time in
.prepare_fb(), and now it's about 5%. And an optimized
kernel on a DG2 shows approximately 6% -> 1%.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../drm/i915/display/intel_display_types.h    |   3 -
 drivers/gpu/drm/i915/display/intel_fb.c       |  16 +--
 drivers/gpu/drm/i915/display/intel_parent.c   |  26 ++--
 drivers/gpu/drm/i915/display/intel_parent.h   |  13 +-
 drivers/gpu/drm/i915/display/intel_plane.c    |  13 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   6 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   6 +
 drivers/gpu/drm/i915/i915_dpt.c               | 119 +++++++++++++++---
 drivers/gpu/drm/i915/i915_dpt.h               |   7 ++
 drivers/gpu/drm/i915/i915_fb_pin.c            |  44 +++++--
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  12 +-
 include/drm/intel/display_parent_interface.h  |  11 +-
 12 files changed, 180 insertions(+), 96 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 90a5d29169c6..afe0c6134534 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -147,8 +147,6 @@ struct intel_framebuffer {
 		struct intel_fb_view remapped_view;
 	};
 
-	struct intel_dpt *dpt;
-
 	unsigned int min_alignment;
 	unsigned int vtd_guard;
 
@@ -690,7 +688,6 @@ struct intel_plane_state {
 	} hw;
 
 	struct i915_vma *ggtt_vma;
-	struct i915_vma *dpt_vma;
 
 	struct intel_fb_view view;
 
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 35f1d5dd31d7..dba2d5ec6688 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -2078,9 +2078,6 @@ static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
 
 	drm_framebuffer_cleanup(fb);
 
-	if (intel_fb_uses_dpt(fb))
-		intel_parent_dpt_destroy(display, intel_fb->dpt);
-
 	intel_bo_framebuffer_fini(intel_fb_bo(fb));
 
 	intel_parent_frontbuffer_put(display, intel_fb->frontbuffer);
@@ -2276,34 +2273,27 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 	if (intel_fb_uses_dpt(fb)) {
 		struct drm_gem_object *obj = intel_fb_bo(&intel_fb->base);
 		const struct intel_gtt_view *view;
-		struct intel_dpt *dpt;
 
 		if (intel_fb_needs_pot_stride_remap(intel_fb))
 			view = &intel_fb->remapped_view.gtt;
 		else
 			view = &intel_fb->normal_view.gtt;
 
-		dpt = intel_parent_dpt_create(display, obj, view);
-		if (IS_ERR(dpt)) {
+		ret = intel_parent_dpt_create(display, obj, view);
+		if (ret) {
 			drm_dbg_kms(display->drm, "failed to create DPT\n");
-			ret = PTR_ERR(dpt);
 			goto err_bo_framebuffer_fini;
 		}
-
-		intel_fb->dpt = dpt;
 	}
 
 	ret = drm_framebuffer_init(display->drm, fb, &intel_fb_funcs);
 	if (ret) {
 		drm_err(display->drm, "framebuffer init failed %d\n", ret);
-		goto err_free_dpt;
+		goto err_bo_framebuffer_fini;
 	}
 
 	return 0;
 
-err_free_dpt:
-	if (intel_fb_uses_dpt(fb))
-		intel_parent_dpt_destroy(display, intel_fb->dpt);
 err_bo_framebuffer_fini:
 	intel_bo_framebuffer_fini(obj);
 err_frontbuffer_put:
diff --git a/drivers/gpu/drm/i915/display/intel_parent.c b/drivers/gpu/drm/i915/display/intel_parent.c
index 8497694b29d7..22be54098b3d 100644
--- a/drivers/gpu/drm/i915/display/intel_parent.c
+++ b/drivers/gpu/drm/i915/display/intel_parent.c
@@ -25,20 +25,14 @@
 #include "intel_parent.h"
 
 /* dpt */
-struct intel_dpt *intel_parent_dpt_create(struct intel_display *display,
-					  struct drm_gem_object *obj,
-					  const struct intel_gtt_view *view)
+int intel_parent_dpt_create(struct intel_display *display,
+			    struct drm_gem_object *obj,
+			    const struct intel_gtt_view *view)
 {
 	if (display->parent->dpt)
 		return display->parent->dpt->create(obj, view);
 
-	return NULL;
-}
-
-void intel_parent_dpt_destroy(struct intel_display *display, struct intel_dpt *dpt)
-{
-	if (display->parent->dpt)
-		display->parent->dpt->destroy(dpt);
+	return 0;
 }
 
 /* fb_pin */
@@ -62,22 +56,20 @@ void intel_parent_fb_pin_ggtt_unpin(struct intel_display *display,
 
 int intel_parent_fb_pin_dpt_pin(struct intel_display *display,
 				struct drm_gem_object *obj,
-				struct intel_dpt *dpt,
 				const struct intel_fb_pin_params *pin_params,
-				struct i915_vma **out_dpt_vma,
 				struct i915_vma **out_ggtt_vma,
 				u32 *out_offset)
 {
-	return display->parent->fb_pin->dpt_pin(obj, dpt, pin_params,
-						out_dpt_vma, out_ggtt_vma, out_offset);
+	return display->parent->fb_pin->dpt_pin(obj, pin_params,
+						out_ggtt_vma, out_offset);
 }
 
 void intel_parent_fb_pin_dpt_unpin(struct intel_display *display,
-				   struct intel_dpt *dpt,
-				   struct i915_vma *dpt_vma,
+				   struct drm_gem_object *obj,
+				   const struct intel_gtt_view *view,
 				   struct i915_vma *ggtt_vma)
 {
-	return display->parent->fb_pin->dpt_unpin(dpt, dpt_vma, ggtt_vma);
+	return display->parent->fb_pin->dpt_unpin(obj, view, ggtt_vma);
 }
 
 struct i915_vma *intel_parent_fb_pin_reuse_vma(struct intel_display *display,
diff --git a/drivers/gpu/drm/i915/display/intel_parent.h b/drivers/gpu/drm/i915/display/intel_parent.h
index b22f92404f65..e95710e115be 100644
--- a/drivers/gpu/drm/i915/display/intel_parent.h
+++ b/drivers/gpu/drm/i915/display/intel_parent.h
@@ -23,10 +23,9 @@ struct intel_stolen_node;
 struct iosys_map;
 
 /* dpt */
-struct intel_dpt *intel_parent_dpt_create(struct intel_display *display,
-					  struct drm_gem_object *obj,
-					  const struct intel_gtt_view *view);
-void intel_parent_dpt_destroy(struct intel_display *display, struct intel_dpt *dpt);
+int intel_parent_dpt_create(struct intel_display *display,
+			    struct drm_gem_object *obj,
+			    const struct intel_gtt_view *view);
 
 /* fb_pin */
 int intel_parent_fb_pin_ggtt_pin(struct intel_display *display,
@@ -40,14 +39,12 @@ void intel_parent_fb_pin_ggtt_unpin(struct intel_display *display,
 				    int fence_id);
 int intel_parent_fb_pin_dpt_pin(struct intel_display *display,
 				struct drm_gem_object *obj,
-				struct intel_dpt *dpt,
 				const struct intel_fb_pin_params *pin_params,
-				struct i915_vma **out_dpt_vma,
 				struct i915_vma **out_ggtt_vma,
 				u32 *out_offset);
 void intel_parent_fb_pin_dpt_unpin(struct intel_display *display,
-				   struct intel_dpt *dpt,
-				   struct i915_vma *dpt_vma,
+				   struct drm_gem_object *obj,
+				   const struct intel_gtt_view *view,
 				   struct i915_vma *ggtt_vma);
 struct i915_vma *intel_parent_fb_pin_reuse_vma(struct intel_display *display,
 					       struct i915_vma *old_ggtt_vma,
diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index d23de0f34e4b..40e9b1ac4e11 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -137,7 +137,6 @@ intel_plane_duplicate_state(struct drm_plane *plane)
 	__drm_atomic_helper_plane_duplicate_state(plane, &intel_state->uapi);
 
 	intel_state->ggtt_vma = NULL;
-	intel_state->dpt_vma = NULL;
 	intel_state->fence_id = -1;
 	intel_state->damage = DRM_RECT_INIT(0, 0, 0, 0);
 	intel_state->psr2_sel_fetch_area = DRM_RECT_INIT(0, 0, 0, 0);
@@ -173,7 +172,6 @@ intel_plane_destroy_state(struct drm_plane *plane,
 	struct intel_plane_state *plane_state = to_intel_plane_state(state);
 
 	drm_WARN_ON(plane->dev, plane_state->ggtt_vma);
-	drm_WARN_ON(plane->dev, plane_state->dpt_vma);
 
 	__drm_atomic_helper_plane_destroy_state(&plane_state->uapi);
 	if (plane_state->hw.fb)
@@ -1371,7 +1369,6 @@ int intel_plane_pin_fb(struct intel_plane_state *plane_state,
 	const struct intel_framebuffer *old_fb =
 		to_intel_framebuffer(old_plane_state->hw.fb);
 	struct i915_vma *ggtt_vma = NULL;
-	struct i915_vma *dpt_vma = NULL;
 	int fence_id = -1;
 	u32 offset = 0;
 	int ret;
@@ -1410,14 +1407,12 @@ int intel_plane_pin_fb(struct intel_plane_state *plane_state,
 		};
 
 		ret = intel_parent_fb_pin_dpt_pin(display, intel_fb_bo(&fb->base),
-						  fb->dpt, &pin_params,
-						  &dpt_vma, &ggtt_vma, &offset);
+						  &pin_params, &ggtt_vma, &offset);
 	}
 	if (ret)
 		return ret;
 
 got_vma:
-	plane_state->dpt_vma = dpt_vma;
 	plane_state->ggtt_vma = ggtt_vma;
 	plane_state->fence_id = fence_id;
 
@@ -1440,11 +1435,11 @@ void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state)
 		old_plane_state->ggtt_vma = NULL;
 		old_plane_state->fence_id = -1;
 	} else {
-		intel_parent_fb_pin_dpt_unpin(display, fb->dpt,
-					      old_plane_state->dpt_vma,
+		intel_parent_fb_pin_dpt_unpin(display,
+					      intel_fb_bo(&fb->base),
+					      &old_plane_state->view.gtt,
 					      old_plane_state->ggtt_vma);
 
-		old_plane_state->dpt_vma = NULL;
 		old_plane_state->ggtt_vma = NULL;
 	}
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 9e01f8b2079a..f5873e59666b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -32,6 +32,7 @@
 #include "display/intel_frontbuffer.h"
 #include "pxp/intel_pxp.h"
 
+#include "i915_dpt.h"
 #include "i915_drv.h"
 #include "i915_file_private.h"
 #include "i915_gem_clflush.h"
@@ -116,6 +117,9 @@ void i915_gem_object_init(struct drm_i915_gem_object *obj,
 	INIT_LIST_HEAD(&obj->lut_list);
 	spin_lock_init(&obj->lut_lock);
 
+	INIT_LIST_HEAD(&obj->dpt_list);
+	spin_lock_init(&obj->dpt_lock);
+
 	spin_lock_init(&obj->mmo.lock);
 	obj->mmo.offsets = RB_ROOT;
 
@@ -402,6 +406,8 @@ void __i915_gem_free_object(struct drm_i915_gem_object *obj)
 	if (obj->shares_resv_from)
 		i915_vm_resv_put(obj->shares_resv_from);
 
+	i915_dpt_obj_free(obj);
+
 	__i915_gem_object_fini(obj);
 }
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 969f6ea2b855..2a2735bfc7c9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -288,6 +288,12 @@ struct drm_i915_gem_object {
 	struct list_head lut_list;
 	spinlock_t lut_lock; /* guards lut_list */
 
+	/**
+	 * @dpt_list: List of DPTs backed by this object
+	 */
+	struct list_head dpt_list;
+	spinlock_t dpt_lock; /* protects dpt_list */
+
 	/**
 	 * @obj_link: Link into @i915_gem_ww_ctx.obj_list
 	 *
diff --git a/drivers/gpu/drm/i915/i915_dpt.c b/drivers/gpu/drm/i915/i915_dpt.c
index e625ec293c5c..27f9a648bb26 100644
--- a/drivers/gpu/drm/i915/i915_dpt.c
+++ b/drivers/gpu/drm/i915/i915_dpt.c
@@ -20,16 +20,15 @@ struct intel_dpt {
 	struct drm_i915_gem_object *obj;
 	struct i915_vma *vma;
 	void __iomem *iomem;
+	struct intel_gtt_view view;
+	struct list_head obj_link;
 	struct list_head ggtt_link;
 };
 
-#define i915_is_dpt(vm) ((vm)->is_dpt)
-
-static inline struct intel_dpt *
-i915_vm_to_dpt(struct i915_address_space *vm)
+struct intel_dpt *i915_vm_to_dpt(struct i915_address_space *vm)
 {
 	BUILD_BUG_ON(offsetof(struct intel_dpt, vm));
-	drm_WARN_ON(&vm->i915->drm, !i915_is_dpt(vm));
+	drm_WARN_ON(&vm->i915->drm, !vm->is_dpt);
 	return container_of(vm, struct intel_dpt, vm);
 }
 
@@ -196,10 +195,66 @@ static void i915_dpt_free(struct intel_dpt *dpt)
 	i915_dpt_put(dpt);
 }
 
-static struct intel_dpt *i915_dpt_create(struct drm_gem_object *obj,
-					 const struct intel_gtt_view *view)
+static struct intel_dpt *__i915_dpt_lookup(struct drm_i915_gem_object *obj,
+					   const struct intel_gtt_view *view)
+{
+	struct intel_dpt *dpt;
+
+	lockdep_assert_held(&obj->dpt_lock);
+
+	list_for_each_entry(dpt, &obj->dpt_list, obj_link) {
+		if (!intel_gtt_view_compare(&dpt->view, view))
+			return dpt;
+	}
+
+	return NULL;
+}
+
+struct intel_dpt *i915_dpt_lookup(struct drm_i915_gem_object *obj,
+				  const struct intel_gtt_view *view)
+{
+	struct intel_dpt *dpt;
+
+	spin_lock(&obj->dpt_lock);
+	dpt = __i915_dpt_lookup(obj, view);
+	spin_unlock(&obj->dpt_lock);
+
+	return dpt;
+}
+
+static void i915_dpt_add(struct drm_i915_gem_object *obj,
+			 struct intel_dpt *new_dpt)
+{
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
+	struct intel_dpt *old_dpt;
+
+	spin_lock(&obj->dpt_lock);
+
+	/*
+	 * If someone else inserted a suitable DPT in the
+	 * meantime we keep that and throw away the new one.
+	 */
+	old_dpt = __i915_dpt_lookup(obj, &new_dpt->view);
+	if (old_dpt) {
+		spin_unlock(&obj->dpt_lock);
+		i915_dpt_free(new_dpt);
+		return;
+	}
+
+	list_add_tail(&new_dpt->obj_link, &obj->dpt_list);
+
+	spin_unlock(&obj->dpt_lock);
+
+	spin_lock(&ggtt->dpt_lock);
+	list_add_tail(&new_dpt->ggtt_link, &ggtt->dpt_list);
+	spin_unlock(&ggtt->dpt_lock);
+}
+
+static struct intel_dpt *dpt_create(struct drm_i915_gem_object *obj,
+				    const struct intel_gtt_view *view)
 {
-	struct drm_i915_private *i915 = to_i915(obj->dev);
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
 	struct drm_i915_gem_object *dpt_obj;
 	struct i915_address_space *vm;
@@ -211,7 +266,7 @@ static struct intel_dpt *i915_dpt_create(struct drm_gem_object *obj,
 		size = intel_remapped_info_size(&view->remapped);
 	} else {
 		drm_WARN_ON(&i915->drm, !intel_gtt_view_is_normal(view));
-		size = DIV_ROUND_UP_ULL(obj->size, I915_GTT_PAGE_SIZE);
+		size = DIV_ROUND_UP_ULL(obj->base.size, I915_GTT_PAGE_SIZE);
 	}
 
 	size = round_up(size * sizeof(gen8_pte_t), I915_GTT_PAGE_SIZE);
@@ -241,6 +296,8 @@ static struct intel_dpt *i915_dpt_create(struct drm_gem_object *obj,
 
 	vm = &dpt->vm;
 
+	dpt->view = *view;
+
 	vm->gt = to_gt(i915);
 	vm->i915 = i915;
 	vm->dma = i915->drm.dev;
@@ -262,22 +319,47 @@ static struct intel_dpt *i915_dpt_create(struct drm_gem_object *obj,
 	dpt->obj = dpt_obj;
 	dpt->obj->is_dpt = true;
 
-	spin_lock(&ggtt->dpt_lock);
-	list_add_tail(&dpt->ggtt_link, &ggtt->dpt_list);
-	spin_unlock(&ggtt->dpt_lock);
-
 	return dpt;
 }
 
-static void i915_dpt_destroy(struct intel_dpt *dpt)
+static int i915_dpt_create(struct drm_gem_object *_obj,
+			   const struct intel_gtt_view *view)
 {
-	struct i915_ggtt *ggtt = i915_dpt_to_vm(dpt)->gt->ggtt;
+	struct drm_i915_gem_object *obj = to_intel_bo(_obj);
+	struct intel_dpt *dpt;
+
+	/* already have one? */
+	dpt = i915_dpt_lookup(obj, view);
+	if (dpt)
+		return 0;
+
+	dpt = dpt_create(obj, view);
+	if (IS_ERR(dpt))
+		return PTR_ERR(dpt);
+
+	i915_dpt_add(obj, dpt);
+
+	return 0;
+}
+
+void i915_dpt_obj_free(struct drm_i915_gem_object *obj)
+{
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
+	struct intel_dpt *dpt, *next;
+	LIST_HEAD(dpt_list);
+
+	spin_lock(&obj->dpt_lock);
+	list_splice_init(&obj->dpt_list, &dpt_list);
+	spin_unlock(&obj->dpt_lock);
 
 	spin_lock(&ggtt->dpt_lock);
-	list_del_init(&dpt->ggtt_link);
+	list_for_each_entry(dpt, &dpt_list, obj_link)
+		list_del_init(&dpt->ggtt_link);
 	spin_unlock(&ggtt->dpt_lock);
 
-	i915_dpt_free(dpt);
+	list_for_each_entry_safe(dpt, next, &dpt_list, obj_link)
+		i915_dpt_free(dpt);
 }
 
 void i915_dpt_suspend(struct i915_ggtt *ggtt)
@@ -321,7 +403,7 @@ void i915_dpt_resume(struct i915_ggtt *ggtt)
 
 	/*
 	 * i915_ggtt_resume_vm() with evict_all==true
-	 * only does a quick sanity check, so OK to call
+	 * only does a sanity check, so OK to call
 	 * with ggtt->dpt_lock held.
 	 */
 	spin_lock(&ggtt->dpt_lock);
@@ -339,5 +421,4 @@ u64 i915_dpt_offset(struct i915_vma *dpt_vma)
 
 const struct intel_display_dpt_interface i915_display_dpt_interface = {
 	.create = i915_dpt_create,
-	.destroy = i915_dpt_destroy,
 };
diff --git a/drivers/gpu/drm/i915/i915_dpt.h b/drivers/gpu/drm/i915/i915_dpt.h
index 51a497abb5e1..5e88d8881db1 100644
--- a/drivers/gpu/drm/i915/i915_dpt.h
+++ b/drivers/gpu/drm/i915/i915_dpt.h
@@ -6,10 +6,17 @@
 
 #include <linux/types.h>
 
+struct drm_i915_gem_object;
 struct i915_address_space;
 struct i915_ggtt;
 struct i915_vma;
 struct intel_dpt;
+struct intel_gtt_view;
+
+struct intel_dpt *i915_vm_to_dpt(struct i915_address_space *vm);
+void i915_dpt_obj_free(struct drm_i915_gem_object *obj);
+struct intel_dpt *i915_dpt_lookup(struct drm_i915_gem_object *obj,
+				  const struct intel_gtt_view *view);
 
 struct i915_address_space *i915_dpt_to_vm(struct intel_dpt *dpt);
 struct i915_vma *i915_dpt_pin_to_ggtt(struct intel_dpt *dpt, unsigned int alignment);
diff --git a/drivers/gpu/drm/i915/i915_fb_pin.c b/drivers/gpu/drm/i915/i915_fb_pin.c
index b5672b2cf5bd..91385c17e564 100644
--- a/drivers/gpu/drm/i915/i915_fb_pin.c
+++ b/drivers/gpu/drm/i915/i915_fb_pin.c
@@ -15,11 +15,10 @@
 #include "i915_vma.h"
 
 static struct i915_vma *
-intel_fb_pin_to_dpt(struct drm_gem_object *_obj, struct intel_dpt *dpt,
+intel_fb_pin_to_dpt(struct drm_i915_gem_object *obj, struct intel_dpt *dpt,
 		    const struct intel_fb_pin_params *pin_params)
 {
-	struct drm_i915_private *i915 = to_i915(_obj->dev);
-	struct drm_i915_gem_object *obj = to_intel_bo(_obj);
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct i915_address_space *vm = i915_dpt_to_vm(dpt);
 	struct i915_gem_ww_ctx ww;
 	struct i915_vma *vma;
@@ -225,6 +224,8 @@ static int i915_fb_pin_ggtt_pin(struct drm_gem_object *obj,
 	if (IS_ERR(ggtt_vma))
 		return PTR_ERR(ggtt_vma);
 
+	drm_WARN_ON(obj->dev, ggtt_vma->vm->is_dpt);
+
 	*out_ggtt_vma = ggtt_vma;
 
 	/*
@@ -244,18 +245,23 @@ static int i915_fb_pin_ggtt_pin(struct drm_gem_object *obj,
 static void i915_fb_pin_ggtt_unpin(struct i915_vma *ggtt_vma,
 				   int fence_id)
 {
+	WARN_ON(ggtt_vma->vm->is_dpt);
+
 	intel_fb_unpin_vma(ggtt_vma, fence_id);
 }
 
-static int i915_fb_pin_dpt_pin(struct drm_gem_object *obj, struct intel_dpt *dpt,
+static int i915_fb_pin_dpt_pin(struct drm_gem_object *_obj,
 			       const struct intel_fb_pin_params *pin_params,
-			       struct i915_vma **out_dpt_vma,
 			       struct i915_vma **out_ggtt_vma,
 			       u32 *out_offset)
 {
+	struct drm_i915_gem_object *obj = to_intel_bo(_obj);
 	struct i915_vma *ggtt_vma, *dpt_vma;
+	struct intel_dpt *dpt;
 
-	WARN_ON(!dpt);
+	dpt = i915_dpt_lookup(obj, pin_params->view);
+	if (drm_WARN_ON(obj->base.dev, !dpt))
+		return -EINVAL;
 
 	ggtt_vma = i915_dpt_pin_to_ggtt(dpt, pin_params->alignment / 512);
 	if (IS_ERR(ggtt_vma))
@@ -267,20 +273,36 @@ static int i915_fb_pin_dpt_pin(struct drm_gem_object *obj, struct intel_dpt *dpt
 		return PTR_ERR(dpt_vma);
 	}
 
-	drm_WARN_ON(obj->dev, ggtt_vma == dpt_vma);
+	drm_WARN_ON(obj->base.dev, ggtt_vma == dpt_vma);
+	drm_WARN_ON(obj->base.dev, ggtt_vma->vm->is_dpt);
+	drm_WARN_ON(obj->base.dev, !dpt_vma->vm->is_dpt);
 
 	*out_ggtt_vma = ggtt_vma;
-	*out_dpt_vma = dpt_vma;
-
 	*out_offset = i915_ggtt_offset(ggtt_vma);
 
 	return 0;
 }
 
-static void i915_fb_pin_dpt_unpin(struct intel_dpt *dpt,
-				  struct i915_vma *dpt_vma,
+static void i915_fb_pin_dpt_unpin(struct drm_gem_object *_obj,
+				  const struct intel_gtt_view *view,
 				  struct i915_vma *ggtt_vma)
 {
+	struct drm_i915_gem_object *obj = to_intel_bo(_obj);
+	struct i915_vma *dpt_vma;
+	struct intel_dpt *dpt;
+
+	dpt = i915_dpt_lookup(obj, view);
+	if (drm_WARN_ON(obj->base.dev, !dpt))
+		return;
+
+	dpt_vma = i915_vma_lookup(obj, i915_dpt_to_vm(dpt), view);
+	if (drm_WARN_ON(obj->base.dev, !dpt_vma))
+		return;
+
+	drm_WARN_ON(obj->base.dev, ggtt_vma == dpt_vma);
+	drm_WARN_ON(obj->base.dev, ggtt_vma->vm->is_dpt);
+	drm_WARN_ON(obj->base.dev, !dpt_vma->vm->is_dpt);
+
 	intel_fb_unpin_vma(dpt_vma, -1);
 	i915_dpt_unpin_from_ggtt(dpt);
 }
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 8df844120ea8..5cf02eb5b380 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -421,33 +421,27 @@ static void xe_fb_pin_ggtt_unpin(struct i915_vma *ggtt_vma,
 	__xe_unpin_fb_vma(ggtt_vma);
 }
 
-static int xe_fb_pin_dpt_pin(struct drm_gem_object *obj, struct intel_dpt *dpt,
+static int xe_fb_pin_dpt_pin(struct drm_gem_object *obj,
 			     const struct intel_fb_pin_params *pin_params,
-			     struct i915_vma **out_dpt_vma,
 			     struct i915_vma **out_ggtt_vma,
 			     u32 *out_offset)
 {
 	struct i915_vma *ggtt_vma;
 
-	WARN_ON(dpt);
-
 	ggtt_vma = __xe_pin_fb_vma(obj, true, pin_params);
 	if (IS_ERR(ggtt_vma))
 		return PTR_ERR(ggtt_vma);
 
-	*out_dpt_vma = NULL; /* not used on xe */
 	*out_ggtt_vma = ggtt_vma;
 	*out_offset = xe_ggtt_node_addr(ggtt_vma->node);
 
 	return 0;
 }
 
-static void xe_fb_pin_dpt_unpin(struct intel_dpt *dpt,
-				struct i915_vma *dpt_vma,
+static void xe_fb_pin_dpt_unpin(struct drm_gem_object *obj,
+				const struct intel_gtt_view *view,
 				struct i915_vma *ggtt_vma)
 {
-	WARN_ON(dpt || dpt_vma);
-
 	__xe_unpin_fb_vma(ggtt_vma);
 }
 
diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
index 00f8e27be9f3..d905d59cc43e 100644
--- a/include/drm/intel/display_parent_interface.h
+++ b/include/drm/intel/display_parent_interface.h
@@ -66,9 +66,8 @@ struct intel_display_bo_interface {
 };
 
 struct intel_display_dpt_interface {
-	struct intel_dpt *(*create)(struct drm_gem_object *obj,
-				    const struct intel_gtt_view *view);
-	void (*destroy)(struct intel_dpt *dpt);
+	int (*create)(struct drm_gem_object *obj,
+		      const struct intel_gtt_view *view);
 };
 
 struct intel_display_dsb_interface {
@@ -90,13 +89,11 @@ struct intel_display_fb_pin_interface {
 	void (*ggtt_unpin)(struct i915_vma *ggtt_vma,
 			   int fence_id);
 	int (*dpt_pin)(struct drm_gem_object *obj,
-		       struct intel_dpt *dpt,
 		       const struct intel_fb_pin_params *pin_params,
-		       struct i915_vma **out_dpt_vma,
 		       struct i915_vma **out_ggtt_vma,
 		       u32 *out_offset);
-	void (*dpt_unpin)(struct intel_dpt *dpt,
-			  struct i915_vma *dpt_vma,
+	void (*dpt_unpin)(struct drm_gem_object *obj,
+			  const struct intel_gtt_view *view,
 			  struct i915_vma *ggtt_vma);
 	struct i915_vma *(*reuse_vma)(struct i915_vma *old_ggtt_vma,
 				      struct drm_gem_object *old_obj,
-- 
2.56.0

