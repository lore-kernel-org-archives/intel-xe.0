Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A90CA0EF7
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 14:38:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D84310E611;
	Tue, 19 Aug 2025 14:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rRkFxE1O";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB09D10E61B
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 14:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ic1+ksFrx8nqfVqSInSucrNxdwfs4QaTGKCBB2ZYqV8=; b=rRkFxE1OIFEqxnotpFhI2sR6oG
 /sXQkd2MS/89itiTxB5by5GmBbcPXD8cyc8VRUPye1cz3IK82K8Wd8pF+hTLCYMlhJL9IjgqNfdpj
 XxZrQCV8o8NwqvhQoPUNjgUHe1QPdmCnmJ/rzr2OZuciu3hbKKvnF7g7PY7mlMwjK0yIdw19nqHu2
 mS4rpcCUT2wgXiADZQun4kQb5F+8/tZBHaW9RasmtocEpserGR4a/9OqIk9UDLEJTp8o/xNDORa8N
 b+kyXEaZTj2zsavC6RMl9vumQyqM+cn6DHDL7gwzMUJ/MkBa7EdkTIl1xlLv9scSGbKk/mQcEF8Vc
 0NHoWXxw==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uoNTq-00GLCp-Vy
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 16:38:31 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 12/13] late flush
Date: Tue, 19 Aug 2025 15:38:19 +0100
Message-ID: <20250819143821.3158-13-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250819143821.3158-1-tvrtko.ursulin@igalia.com>
References: <20250819143821.3158-1-tvrtko.ursulin@igalia.com>
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

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  | 15 ++++-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  5 ++
 .../compat-i915-headers/gem/i915_gem_object.h |  3 +
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 56 +++++--------------
 drivers/gpu/drm/xe/xe_bo_types.h              |  4 +-
 5 files changed, 39 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index c1a3a95c65f0..bdd487f5b3de 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -45,6 +45,7 @@
 #include <drm/drm_rect.h>
 #include <drm/drm_vblank.h>
 
+#include "gem/i915_gem_object.h"
 #include "g4x_dp.h"
 #include "g4x_hdmi.h"
 #include "hsw_ips.h"
@@ -7099,7 +7100,7 @@ static void intel_atomic_commit_fence_wait(struct intel_atomic_state *intel_stat
 	struct drm_plane *plane;
 	struct drm_plane_state *new_plane_state;
 	long ret;
-	int i;
+	int i, j;
 
 	for_each_new_plane_in_state(&intel_state->base, plane, new_plane_state, i) {
 		if (new_plane_state->fence) {
@@ -7112,6 +7113,18 @@ static void intel_atomic_commit_fence_wait(struct intel_atomic_state *intel_stat
 			new_plane_state->fence = NULL;
 		}
 	}
+
+	for_each_new_plane_in_state(&intel_state->base, plane, new_plane_state, i) {
+		if (!new_plane_state->fb)
+			continue;
+
+		for (j = 0; j < new_plane_state->fb->format->num_planes; j++) {
+			if (!new_plane_state->fb->obj[j])
+				continue;
+
+			intel_display_object_sync_flush(new_plane_state->fb->obj[j]);
+		}
+	}
 }
 
 static void intel_atomic_dsb_wait_commit(struct intel_crtc_state *crtc_state)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 565f8fa330db..c185234924ab 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -772,6 +772,11 @@ void i915_gem_object_flush_if_display(struct drm_i915_gem_object *obj);
 void i915_gem_object_flush_if_display_locked(struct drm_i915_gem_object *obj);
 bool i915_gem_cpu_write_needs_clflush(struct drm_i915_gem_object *obj);
 
+static inline void intel_display_object_sync_flush(struct drm_gem_object *obj)
+{
+
+}
+
 int __must_check
 i915_gem_object_set_to_wc_domain(struct drm_i915_gem_object *obj, bool write);
 int __must_check
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
index 8a048980ea38..d962e50d42be 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
@@ -5,6 +5,7 @@
 #define __I915_GEM_OBJECT_H__
 
 struct dma_fence;
+struct drm_gem_object;
 struct i915_sched_attr;
 
 static inline void i915_gem_fence_wait_priority(struct dma_fence *fence,
@@ -12,4 +13,6 @@ static inline void i915_gem_fence_wait_priority(struct dma_fence *fence,
 {
 }
 
+void intel_display_object_sync_flush(struct drm_gem_object *obj);
+
 #endif
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index bf600cad0284..e112c01b21a0 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -6,6 +6,7 @@
 #include <drm/drm_cache.h>
 #include <drm/ttm/ttm_bo.h>
 
+#include "gem/i915_gem_object.h"
 #include "i915_vma.h"
 #include "intel_display_core.h"
 #include "intel_display_types.h"
@@ -371,44 +372,23 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	return ret;
 }
 
-static void xe_bo_clflush_auxccs(struct xe_bo *bo,
-				 const struct i915_gtt_view *view)
+void intel_display_object_sync_flush(struct drm_gem_object *obj)
 {
-	const struct intel_remapped_info *remap_info = &view->remapped;
-	unsigned int i;
+	struct xe_bo *bo = gem_to_xe_bo(obj);
+	int ret;
 
-	if (!IS_ENABLED(CONFIG_X86))
-		return;
+	ret = ttm_bo_reserve(&bo->ttm, false, false, NULL);
+	WARN_ON_ONCE(ret);
 
-	if (!static_cpu_has(X86_FEATURE_CLFLUSH))
-		return;
+	if (!bo->display_flush)
+		goto unlock;
 
-	for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++) {
-		const struct intel_remapped_plane_info *plane =
-						&remap_info->plane[i];
-		const int size = boot_cpu_data.x86_clflush_size;
-		struct sg_table *st = xe_bo_sg(bo);
-		struct sg_page_iter sg_iter;
+	drm_clflush_sg(xe_bo_sg(bo));
 
-		if (!plane->width && !plane->height && !plane->linear)
-			continue;
+	bo->display_flush = false;
 
-		if (!plane->linear)
-			continue;
-
-		mb();
-		for_each_sgtable_page(st, &sg_iter, plane->offset) {
-			struct page *page = sg_page_iter_page(&sg_iter);
-			uint8_t *page_virtual;
-			unsigned int j;
-
-			page_virtual = kmap_local_page(page);
-			for (j = 0; j < PAGE_SIZE; j += size)
-				clflushopt(page_virtual + j);
-			kunmap_local(page_virtual);
-		}
-		mb();
-	}
+unlock:
+	ttm_bo_unreserve(&bo->ttm);
 }
 
 static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
@@ -420,7 +400,6 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	struct i915_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	struct drm_gem_object *obj = intel_fb_bo(&fb->base);
 	struct xe_bo *bo = gem_to_xe_bo(obj);
-	bool first_pin;
 	int ret;
 
 	if (!vma)
@@ -452,9 +431,6 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	if (ret)
 		goto err;
 
-	first_pin = !bo->display_pin;
-	bo->display_pin = true;
-
 	if (IS_DGFX(xe))
 		ret = xe_bo_migrate(bo, XE_PL_VRAM0);
 	else
@@ -476,11 +452,9 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	/*
 	 * Force flush AuxCCS data for non-coherent display access.
 	 */
-	if (first_pin &&
-	    !xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo) &&
-	    intel_fb_is_ccs_modifier(fb->base.modifier) &&
-	    view->type == I915_GTT_VIEW_REMAPPED)
-		xe_bo_clflush_auxccs(bo, view);
+	bo->display_flush = !xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo) &&
+			    intel_fb_is_ccs_modifier(fb->base.modifier) &&
+			    view->type == I915_GTT_VIEW_REMAPPED;
 
 	return vma;
 
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index d5096f7f6f9a..150a54be0b2e 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -91,8 +91,8 @@ struct xe_bo {
 	/** @ccs_cleared */
 	bool ccs_cleared : 1;
 
-	/** @display_pin: Was it ever pinned to display */
-	bool display_pin : 1;
+	/** @display_flush: Is clflush required before first scanout */
+	bool display_flush : 1;
 
 	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
 		struct list_head vram_userfault_link;
-- 
2.48.0

