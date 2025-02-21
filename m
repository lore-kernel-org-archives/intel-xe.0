Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB806C021B5
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 10:17:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6296710E281;
	Fri, 21 Feb 2025 10:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QxUP5Rgg";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C209E10E275
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 10:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=icV23R52bWJ30MHB0wl5rmdOO4wdnr3rjMxW6dY9/SM=; b=QxUP5RggbvHYZVVmDpLalqQeAj
 +4kknThddAPpY1iO1oF1OpYm/XB//M1kye9Kfj7WjcmBCuWTiageO7t/P4k1pS1dtb5HuDpozOiP/
 bjp2oih9pLF5Ly020jDaokrW5tcvz0LpKz6m5TlcoAGDsUTQxNgo9VxGps7vBNI6I4X6uW2QQ0+97
 +ZTkzgXv96KFv9SbG4kgmZcEr/FEfs7vcucGUN7PZ7dKwNk5auFjeg/1zLFmWfaawOGlR4jXll2Uu
 IJ3E7DEDfDQADjuMw//HU7kPxw0IrjocqC5DoJVXxcZo0Bh/Z72kVpyYCgXr3SL9zVrRSHk2cYmND
 hFhIu2Aw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tlQ6D-00G2bD-6n; Fri, 21 Feb 2025 11:17:43 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 05/12] drm/xe: Use correct type width for alignment in fb
 pinning code
Date: Fri, 21 Feb 2025 10:17:24 +0000
Message-ID: <20250221101736.78986-6-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
References: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
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

Plane->min_alignment returns an unsigned int so lets use that in the whole
relevant call chain.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 11a6b996d739..3df51cd4a86b 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -81,7 +81,7 @@ write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
 static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 			       const struct i915_gtt_view *view,
 			       struct i915_vma *vma,
-			       u64 physical_alignment)
+			       unsigned int alignment)
 {
 	struct xe_device *xe = to_xe_device(fb->base.dev);
 	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
@@ -107,7 +107,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 						      XE_BO_FLAG_VRAM0 |
 						      XE_BO_FLAG_GGTT |
 						      XE_BO_FLAG_PAGETABLE,
-						      physical_alignment);
+						      alignment);
 	else
 		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
 						      dpt_size,  ~0ull,
@@ -115,7 +115,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 						      XE_BO_FLAG_STOLEN |
 						      XE_BO_FLAG_GGTT |
 						      XE_BO_FLAG_PAGETABLE,
-						      physical_alignment);
+						      alignment);
 	if (IS_ERR(dpt))
 		dpt = xe_bo_create_pin_map_at_aligned(xe, tile0, NULL,
 						      dpt_size,  ~0ull,
@@ -123,7 +123,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 						      XE_BO_FLAG_SYSTEM |
 						      XE_BO_FLAG_GGTT |
 						      XE_BO_FLAG_PAGETABLE,
-						      physical_alignment);
+						      alignment);
 	if (IS_ERR(dpt))
 		return PTR_ERR(dpt);
 
@@ -193,7 +193,7 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo
 static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 				const struct i915_gtt_view *view,
 				struct i915_vma *vma,
-				u64 physical_alignment)
+				unsigned int alignment)
 {
 	struct drm_gem_object *obj = intel_fb_bo(&fb->base);
 	struct xe_bo *bo = gem_to_xe_bo(obj);
@@ -276,7 +276,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 
 static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 					const struct i915_gtt_view *view,
-					u64 physical_alignment)
+					unsigned int alignment)
 {
 	struct drm_device *dev = fb->base.dev;
 	struct xe_device *xe = to_xe_device(dev);
@@ -326,9 +326,9 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 
 	vma->bo = bo;
 	if (intel_fb_uses_dpt(&fb->base))
-		ret = __xe_pin_fb_vma_dpt(fb, view, vma, physical_alignment);
+		ret = __xe_pin_fb_vma_dpt(fb, view, vma, alignment);
 	else
-		ret = __xe_pin_fb_vma_ggtt(fb, view, vma,  physical_alignment);
+		ret = __xe_pin_fb_vma_ggtt(fb, view, vma,  alignment);
 	if (ret)
 		goto err_unpin;
 
@@ -421,7 +421,7 @@ int intel_plane_pin_fb(struct intel_plane_state *new_plane_state,
 	struct i915_vma *vma;
 	struct intel_framebuffer *intel_fb = to_intel_framebuffer(fb);
 	struct intel_plane *plane = to_intel_plane(new_plane_state->uapi.plane);
-	u64 phys_alignment = plane->min_alignment(plane, fb, 0);
+	unsigned int alignment = plane->min_alignment(plane, fb, 0);
 
 	if (reuse_vma(new_plane_state, old_plane_state))
 		return 0;
@@ -429,7 +429,7 @@ int intel_plane_pin_fb(struct intel_plane_state *new_plane_state,
 	/* We reject creating !SCANOUT fb's, so this is weird.. */
 	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags & XE_BO_FLAG_SCANOUT));
 
-	vma = __xe_pin_fb_vma(intel_fb, &new_plane_state->view.gtt, phys_alignment);
+	vma = __xe_pin_fb_vma(intel_fb, &new_plane_state->view.gtt, alignment);
 
 	if (IS_ERR(vma))
 		return PTR_ERR(vma);
-- 
2.48.0

