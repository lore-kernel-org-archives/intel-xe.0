Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3604AC61D92
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 14:05:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E939C10E02C;
	Tue, 21 Nov 2023 14:05:09 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8A510E02C
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 14:05:08 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Nov 2023 15:05:00 +0100
Message-Id: <20231121140502.9793-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231121140502.9793-1-dev@lankhorst.se>
References: <20231121140502.9793-1-dev@lankhorst.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/4] drm/xe/display: Cache pinned ggtt_vma's.
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Look for currently pinned VMA's first, before creating a new one.
This is especially required for cursor, which flips the same BO,
but should help all.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  4 +++
 drivers/gpu/drm/i915/display/intel_fb.c       |  2 ++
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |  3 ++
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 35 +++++++++++++++++--
 4 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index db20dd7e5c0d..7d11f9a277e2 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -143,6 +143,10 @@ struct intel_framebuffer {
 		struct intel_fb_view remapped_view;
 	};
 
+	struct xe_vma_cache {
+		struct list_head list;
+	} vma;
+
 	struct i915_address_space *dpt_vm;
 };
 
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 16c37a508552..8068cb3d15da 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1902,6 +1902,7 @@ static void intel_user_framebuffer_destroy_vm(struct drm_framebuffer *fb)
 	}
 	xe_bo_put(intel_fb_obj(fb));
 #endif
+	WARN_ON(!list_empty(&intel_fb->vma.list));
 }
 
 static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
@@ -2178,6 +2179,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 	/* Hold a reference to object while fb is alive */
 	xe_bo_get(obj);
 #endif
+	INIT_LIST_HEAD(&intel_fb->vma.list);
 
 	ret = drm_framebuffer_init(&dev_priv->drm, fb, &intel_fb_funcs);
 	if (ret) {
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
index 23f2d037c313..3ff508503d29 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
@@ -12,8 +12,11 @@
 struct xe_bo;
 
 struct i915_vma {
+	struct kref ref;
+	unsigned int view_type;
 	struct xe_bo *bo, *dpt;
 	struct drm_mm_node node;
+	struct list_head link;
 };
 
 #define i915_ggtt_clear_scanout(bo) do { } while (0)
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 722c84a56607..4a5aa5d563e6 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -246,18 +246,38 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 	return ret;
 }
 
+static struct i915_vma *find_cached_vma(struct intel_framebuffer *fb,
+					const struct i915_gtt_view *view)
+{
+	struct i915_vma *vma;
+
+	list_for_each_entry(vma, &fb->vma.list, link)
+		if (vma->view_type == view->type) {
+			kref_get(&vma->ref);
+			return vma;
+		}
+
+	return NULL;
+}
+
 static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
 					const struct i915_gtt_view *view)
 {
 	struct drm_device *dev = fb->base.dev;
 	struct xe_device *xe = to_xe_device(dev);
-	struct i915_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	struct xe_bo *bo = intel_fb_obj(&fb->base);
+	struct i915_vma *vma;
 	int ret;
 
+	vma = find_cached_vma(fb, view);
+	if (vma)
+		return vma;
+
+	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	if (!vma)
 		return ERR_PTR(-ENODEV);
 
+	vma->view_type = view->type;
 	if (IS_DGFX(to_xe_device(bo->ttm.base.dev)) &&
 	    intel_fb_rc_ccs_cc_plane(&fb->base) >= 0 &&
 	    !(bo->flags & XE_BO_NEEDS_CPU_ACCESS)) {
@@ -301,6 +321,8 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
 	if (ret)
 		goto err_unpin;
 
+	kref_init(&vma->ref);
+	list_add_tail(&vma->link, &fb->vma.list);
 	return vma;
 
 err_unpin:
@@ -312,8 +334,9 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
 	return ERR_PTR(ret);
 }
 
-static void __xe_unpin_fb_vma(struct i915_vma *vma)
+static void __xe_unpin_free_vma(struct kref *kref)
 {
+	struct i915_vma *vma = container_of(kref, typeof(*vma), ref);
 	struct xe_device *xe = to_xe_device(vma->bo->ttm.base.dev);
 	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
 
@@ -326,9 +349,15 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
 	ttm_bo_unpin(&vma->bo->ttm);
 	ttm_bo_unreserve(&vma->bo->ttm);
+	list_del(&vma->link);
 	kfree(vma);
 }
 
+static void __xe_unpin_fb_vma(struct i915_vma *vma)
+{
+	kref_put(&vma->ref, __xe_unpin_free_vma);
+}
+
 struct i915_vma *
 intel_pin_and_fence_fb_obj(struct drm_framebuffer *fb,
 			   bool phys_cursor,
@@ -381,4 +410,4 @@ struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
 void intel_dpt_destroy(struct i915_address_space *vm)
 {
 	return;
-}
\ No newline at end of file
+}
-- 
2.40.1

