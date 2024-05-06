Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285C9C10F16
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 10:35:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A589F10EF2D;
	Mon,  6 May 2024 10:35:50 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00AB10EF29;
 Mon,  6 May 2024 10:35:49 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v4 3/4] drm/xe: Use simple xchg to cache DPT
Date: Mon,  6 May 2024 12:36:03 +0200
Message-ID: <20240506103604.146146-4-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240506103604.146146-1-maarten.lankhorst@linux.intel.com>
References: <20240506103604.146146-1-maarten.lankhorst@linux.intel.com>
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

Preallocate a DPT when creating the FB, and store it in
i915_address_space. This can be used to prevent an expensive
allocation in the pinning path.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 33 +++++++++++++++-----------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 5a8d6857fb89..6ebda3ded8b4 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -112,9 +112,11 @@ static struct xe_bo *xe_fb_dpt_alloc(struct intel_framebuffer *fb)
 	return dpt;
 }
 
-static void xe_fb_dpt_free(struct i915_vma *vma)
+static void xe_fb_dpt_free(struct i915_vma *vma, struct intel_framebuffer *fb)
 {
-	xe_bo_put(vma->dpt);
+	if (!fb || cmpxchg((struct xe_bo **)&fb->dpt_vm, NULL, vma->dpt))
+		xe_bo_put(vma->dpt);
+
 	vma->dpt = NULL;
 }
 
@@ -152,10 +154,11 @@ static int xe_fb_dpt_map_ggtt(struct xe_bo *dpt)
 static int
 xe_fb_dpt_alloc_pinned(struct i915_vma *vma, struct intel_framebuffer *fb)
 {
-	struct xe_bo *dpt;
+	struct xe_bo *dpt = (struct xe_bo *)xchg(&fb->dpt_vm, NULL);
 	int err;
 
-	dpt = xe_fb_dpt_alloc(fb);
+	if (!dpt)
+		dpt = xe_fb_dpt_alloc(fb);
 	if (IS_ERR(dpt))
 		return PTR_ERR(dpt);
 
@@ -171,17 +174,17 @@ xe_fb_dpt_alloc_pinned(struct i915_vma *vma, struct intel_framebuffer *fb)
 		ttm_bo_unreserve(&dpt->ttm);
 	}
 	if (err)
-		xe_fb_dpt_free(vma);
+		xe_fb_dpt_free(vma, fb);
 	return err;
 }
 
-static void xe_fb_dpt_unpin_free(struct i915_vma *vma)
+static void xe_fb_dpt_unpin_free(struct i915_vma *vma, struct intel_framebuffer *fb)
 {
 	ttm_bo_reserve(&vma->dpt->ttm, false, false, NULL);
 	ttm_bo_unpin(&vma->dpt->ttm);
 	ttm_bo_unreserve(&vma->dpt->ttm);
 
-	xe_fb_dpt_free(vma);
+	xe_fb_dpt_free(vma, fb);
 }
 
 static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
@@ -237,7 +240,7 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 
 	ret = xe_fb_dpt_map_ggtt(dpt);
 	if (ret)
-		xe_fb_dpt_unpin_free(vma);
+		xe_fb_dpt_unpin_free(vma, fb);
 	return ret;
 }
 
@@ -399,14 +402,14 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
 	return ERR_PTR(ret);
 }
 
-static void __xe_unpin_fb_vma(struct i915_vma *vma)
+static void __xe_unpin_fb_vma(struct i915_vma *vma, struct intel_framebuffer *fb)
 {
 	struct xe_device *xe = to_xe_device(vma->bo->ttm.base.dev);
 	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
 
 	if (vma->dpt) {
 		xe_ggtt_remove_bo(ggtt, vma->dpt);
-		xe_fb_dpt_unpin_free(vma);
+		xe_fb_dpt_unpin_free(vma, fb);
 	} else {
 		if (!drm_mm_node_allocated(&vma->bo->ggtt_node) ||
 		    vma->bo->ggtt_node.start != vma->node.start)
@@ -433,7 +436,7 @@ intel_pin_and_fence_fb_obj(struct drm_framebuffer *fb,
 
 void intel_unpin_fb_vma(struct i915_vma *vma, unsigned long flags)
 {
-	__xe_unpin_fb_vma(vma);
+	__xe_unpin_fb_vma(vma, NULL);
 }
 
 int intel_plane_pin_fb(struct intel_plane_state *plane_state)
@@ -455,7 +458,7 @@ int intel_plane_pin_fb(struct intel_plane_state *plane_state)
 
 void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state)
 {
-	__xe_unpin_fb_vma(old_plane_state->ggtt_vma);
+	__xe_unpin_fb_vma(old_plane_state->ggtt_vma, to_intel_framebuffer(old_plane_state->hw.fb));
 	old_plane_state->ggtt_vma = NULL;
 }
 
@@ -465,10 +468,12 @@ void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state)
  */
 struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
 {
-	return NULL;
+	return (struct i915_address_space *)xe_fb_dpt_alloc(fb);
 }
 
 void intel_dpt_destroy(struct i915_address_space *vm)
 {
-	return;
+	struct xe_bo *bo = (struct xe_bo *)vm;
+
+	xe_bo_put(bo);
 }
-- 
2.43.0

