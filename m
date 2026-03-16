Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77431F53D70
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 15:29:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B4E10E3AB;
	Mon, 16 Mar 2026 15:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="NkdgoXee";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C9710E325
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 15:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZDY/qsBaHCGWwSvwuKY/2zkKxSbz4ODwpyylGXwALAg=; b=NkdgoXee4Ra5j1EYGkMoeD1T8W
 3UN/C1ZnXQGO27JQSedX1GsAApkLFCDa3LcVIryP2X2MbN0liZ5eQa2EOvZdHM5qauvs+EaueafEg
 ZJjKu2pFdlM4xy8J7f2RdiF/Bs0oG0PgDthiXzc9HlkoVIP9ayfz0Xx0rBVHy2J9iDCjO5jRX5biL
 Ixm6MT8KTYhH2DjIliq9/bFrOqob3r6On1OjNIk93jM5VQDls9XX4YF4xPdJUdfcviX2DuqYFs7Tu
 axJ/gCeqYnWwhMObsQez4IAqa4hQc3iw/iHGk5O8BtFsveZix+4FaXkgW8sVEY2k1UBvoP1P0R4H0
 1vfVyKLA==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1w29sp-00GZ2B-KI; Mon, 16 Mar 2026 16:29:31 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Uma Shankar <uma.shankar@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v22 01/12] drm/xe: Rename XE_BO_FLAG_SCANOUT to
 XE_BO_FLAG_FORCE_WC
Date: Mon, 16 Mar 2026 15:29:21 +0000
Message-ID: <20260316152929.1247-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260316152929.1247-1-tvrtko.ursulin@igalia.com>
References: <20260316152929.1247-1-tvrtko.ursulin@igalia.com>
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

Rename XE_BO_FLAG_SCANOUT to XE_BO_FLAG_FORCE_WC so that the usage of the
flag can legitimately be expanded to more than just the actual frame-
buffer objects.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/intel_fb_bo.c      |  6 +++---
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c   | 12 ++++++++----
 drivers/gpu/drm/xe/display/xe_dsb_buffer.c    |  4 +++-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  2 +-
 drivers/gpu/drm/xe/display/xe_initial_plane.c |  2 +-
 drivers/gpu/drm/xe/xe_bo.c                    | 15 ++++++++-------
 drivers/gpu/drm/xe/xe_bo.h                    |  2 +-
 7 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/intel_fb_bo.c b/drivers/gpu/drm/xe/display/intel_fb_bo.c
index db8b1a27b4de..d2e72dc5abd9 100644
--- a/drivers/gpu/drm/xe/display/intel_fb_bo.c
+++ b/drivers/gpu/drm/xe/display/intel_fb_bo.c
@@ -45,9 +45,9 @@ int intel_fb_bo_framebuffer_init(struct drm_gem_object *obj,
 	if (ret)
 		goto err;
 
-	if (!(bo->flags & XE_BO_FLAG_SCANOUT)) {
+	if (!(bo->flags & XE_BO_FLAG_FORCE_WC)) {
 		/*
-		 * XE_BO_FLAG_SCANOUT should ideally be set at creation, or is
+		 * XE_BO_FLAG_FORCE_WC should ideally be set at creation, or is
 		 * automatically set when creating FB. We cannot change caching
 		 * mode when the bo is VM_BINDed, so we can only set
 		 * coherency with display when unbound.
@@ -57,7 +57,7 @@ int intel_fb_bo_framebuffer_init(struct drm_gem_object *obj,
 			ret = -EINVAL;
 			goto err;
 		}
-		bo->flags |= XE_BO_FLAG_SCANOUT;
+		bo->flags |= XE_BO_FLAG_FORCE_WC;
 	}
 	ttm_bo_unreserve(&bo->ttm);
 	return 0;
diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
index 87af5646c938..d7030e4d814c 100644
--- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
@@ -56,9 +56,11 @@ struct drm_gem_object *intel_fbdev_fb_bo_create(struct drm_device *drm, int size
 	if (intel_fbdev_fb_prefer_stolen(drm, size)) {
 		obj = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe),
 						size,
-						ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
+						ttm_bo_type_kernel,
+						XE_BO_FLAG_FORCE_WC |
 						XE_BO_FLAG_STOLEN |
-						XE_BO_FLAG_GGTT, false);
+						XE_BO_FLAG_GGTT,
+						false);
 		if (!IS_ERR(obj))
 			drm_info(&xe->drm, "Allocated fbdev into stolen\n");
 		else
@@ -69,9 +71,11 @@ struct drm_gem_object *intel_fbdev_fb_bo_create(struct drm_device *drm, int size
 
 	if (IS_ERR(obj)) {
 		obj = xe_bo_create_pin_map_novm(xe, xe_device_get_root_tile(xe), size,
-						ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
+						ttm_bo_type_kernel,
+						XE_BO_FLAG_FORCE_WC |
 						XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
-						XE_BO_FLAG_GGTT, false);
+						XE_BO_FLAG_GGTT,
+						false);
 	}
 
 	if (IS_ERR(obj)) {
diff --git a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
index 1c67a950c6ad..a7158c73a14c 100644
--- a/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
+++ b/drivers/gpu/drm/xe/display/xe_dsb_buffer.c
@@ -54,7 +54,9 @@ static struct intel_dsb_buffer *xe_dsb_buffer_create(struct drm_device *drm, siz
 					PAGE_ALIGN(size),
 					ttm_bo_type_kernel,
 					XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
-					XE_BO_FLAG_SCANOUT | XE_BO_FLAG_GGTT, false);
+					XE_BO_FLAG_FORCE_WC |
+					XE_BO_FLAG_GGTT,
+					false);
 	if (IS_ERR(obj)) {
 		ret = PTR_ERR(obj);
 		goto err_pin_map;
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index dbbc61032b7f..d4a9eb550cae 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -429,7 +429,7 @@ int intel_plane_pin_fb(struct intel_plane_state *new_plane_state,
 		return 0;
 
 	/* We reject creating !SCANOUT fb's, so this is weird.. */
-	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags & XE_BO_FLAG_SCANOUT));
+	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags & XE_BO_FLAG_FORCE_WC));
 
 	vma = __xe_pin_fb_vma(intel_fb, &new_plane_state->view.gtt, alignment);
 
diff --git a/drivers/gpu/drm/xe/display/xe_initial_plane.c b/drivers/gpu/drm/xe/display/xe_initial_plane.c
index 65cc0b0c934b..8bcae552dddc 100644
--- a/drivers/gpu/drm/xe/display/xe_initial_plane.c
+++ b/drivers/gpu/drm/xe/display/xe_initial_plane.c
@@ -48,7 +48,7 @@ initial_plane_bo(struct xe_device *xe,
 	if (plane_config->size == 0)
 		return NULL;
 
-	flags = XE_BO_FLAG_SCANOUT | XE_BO_FLAG_GGTT;
+	flags = XE_BO_FLAG_FORCE_WC | XE_BO_FLAG_GGTT;
 
 	base = round_down(plane_config->base, page_size);
 	if (IS_DGFX(xe)) {
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 22179b2df85c..72cb6047f718 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -510,12 +510,10 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 		WARN_ON((bo->flags & XE_BO_FLAG_USER) && !bo->cpu_caching);
 
 		/*
-		 * Display scanout is always non-coherent with the CPU cache.
-		 *
 		 * For Xe_LPG and beyond up to NVL-P (excluding), PPGTT PTE
 		 * lookups are also non-coherent and require a CPU:WC mapping.
 		 */
-		if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT) ||
+		if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_FORCE_WC) ||
 		     (!xe->info.has_cached_pt && bo->flags & XE_BO_FLAG_PAGETABLE))
 			caching = ttm_write_combined;
 	}
@@ -3196,8 +3194,11 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING)
 		bo_flags |= XE_BO_FLAG_DEFER_BACKING;
 
+	/*
+	 * Display scanout is always non-coherent with the CPU cache.
+	 */
 	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
-		bo_flags |= XE_BO_FLAG_SCANOUT;
+		bo_flags |= XE_BO_FLAG_FORCE_WC;
 
 	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION) {
 		if (XE_IOCTL_DBG(xe, GRAPHICS_VER(xe) < 20))
@@ -3209,7 +3210,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 
 	/* CCS formats need physical placement at a 64K alignment in VRAM. */
 	if ((bo_flags & XE_BO_FLAG_VRAM_MASK) &&
-	    (bo_flags & XE_BO_FLAG_SCANOUT) &&
+	    (args->flags & XE_BO_FLAG_FORCE_WC) &&
 	    !(xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) &&
 	    IS_ALIGNED(args->size, SZ_64K))
 		bo_flags |= XE_BO_FLAG_NEEDS_64K;
@@ -3229,7 +3230,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 			 args->cpu_caching != DRM_XE_GEM_CPU_CACHING_WC))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, bo_flags & XE_BO_FLAG_SCANOUT &&
+	if (XE_IOCTL_DBG(xe, bo_flags & XE_BO_FLAG_FORCE_WC &&
 			 args->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB))
 		return -EINVAL;
 
@@ -3697,7 +3698,7 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 	bo = xe_bo_create_user(xe, NULL, args->size,
 			       DRM_XE_GEM_CPU_CACHING_WC,
 			       XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
-			       XE_BO_FLAG_SCANOUT |
+			       XE_BO_FLAG_FORCE_WC |
 			       XE_BO_FLAG_NEEDS_CPU_ACCESS, NULL);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 2cbac16f7db7..a0ad846e9450 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -35,7 +35,7 @@
 #define XE_BO_FLAG_PINNED		BIT(7)
 #define XE_BO_FLAG_NO_RESV_EVICT	BIT(8)
 #define XE_BO_FLAG_DEFER_BACKING	BIT(9)
-#define XE_BO_FLAG_SCANOUT		BIT(10)
+#define XE_BO_FLAG_FORCE_WC		BIT(10)
 #define XE_BO_FLAG_FIXED_PLACEMENT	BIT(11)
 #define XE_BO_FLAG_PAGETABLE		BIT(12)
 #define XE_BO_FLAG_NEEDS_CPU_ACCESS	BIT(13)
-- 
2.52.0

