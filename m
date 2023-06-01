Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C209BC77B7E
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 20:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9AD10E5DE;
	Thu,  1 Jun 2023 20:30:40 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD4F10E5C0
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 20:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685651432; x=1717187432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p7h5GlTE/M0Rr374xZ0xxh0/XSNQdhQrkRV1JeNe3Uw=;
 b=A4v6+m6RJ25Gduc9Wegi1EMR3dF5vzMZucYigWmEi1M3yRk+NRBxaR5h
 LrMJdGNuVHRTLyVWCZvu/4TAgb2Zqr+E7hAZxnQOrYuowg5AAbhmXnZtX
 EYXIJnGlyBWjcfjfydGQISFJV/eNXwTJNq6pmnTLChNflUOm/FWKX4VLD
 hNkTD5J/2C+neztHbmsg1aKveaVVHFC8roFGRvfqU+34L8tZ1qHljpVKL
 ASRgEParIe8ZFNKpMmLN8GNjrU2/ZhW8HSmy5dRLC6E4JNHKLqs1faF4r
 QiJiCJSji33Lcf7lu0j7no1XVvRbCkSeJ6brbuZ890vtK8zErcJMY6kkj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358102517"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="358102517"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 13:30:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="740493249"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="740493249"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 13:30:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 13:30:07 -0700
Message-Id: <20230601203025.615494-14-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601203025.615494-1-matthew.d.roper@intel.com>
References: <20230601203025.615494-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 13/31] fixup! drm/xe/display: Implement display
 support
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c      | 5 +++--
 drivers/gpu/drm/i915/display/intel_fbc.c      | 3 ++-
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 7 ++++---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 7 ++++---
 drivers/gpu/drm/xe/display/xe_plane_initial.c | 2 +-
 5 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index 7c93580282b4..3830309aacf4 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -379,9 +379,10 @@ struct intel_dsb *intel_dsb_prepare(struct intel_crtc *crtc,
 #else
 	/* ~1 qword per instruction, full cachelines */
 	size = ALIGN(max_cmds * 8, 64);
-	obj = xe_bo_create_pin_map(i915, to_gt(i915), NULL, PAGE_ALIGN(size),
+	obj = xe_bo_create_pin_map(i915, xe_device_get_root_tile(i915),
+				   NULL, PAGE_ALIGN(size),
 				   ttm_bo_type_kernel,
-				   XE_BO_CREATE_VRAM_IF_DGFX(to_gt(i915)) |
+				   XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(i915)) |
 				   XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(obj)) {
 		kfree(dsb);
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 9dc7083fe974..0e8e899f596b 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -71,7 +71,8 @@ static int i915_gem_stolen_insert_node_in_range(struct xe_device *xe, struct xe_
 	int err;
 	u32 flags = XE_BO_CREATE_PINNED_BIT | XE_BO_CREATE_STOLEN_BIT;
 
-	*bo = xe_bo_create_locked_range(xe, to_gt(xe), NULL, size, start, end,
+	*bo = xe_bo_create_locked_range(xe, xe_device_get_root_tile(xe),
+					NULL, size, start, end,
 					ttm_bo_type_kernel, flags);
 	if (IS_ERR(*bo)) {
 		err = PTR_ERR(*bo);
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 95f4cbc2e675..ebb07d0ccff6 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -210,7 +210,8 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 	}
 #else
 	if (!IS_DGFX(dev_priv)) {
-		obj = xe_bo_create_pin_map(dev_priv, to_gt(dev_priv), NULL, size,
+		obj = xe_bo_create_pin_map(dev_priv, xe_device_get_root_tile(dev_priv),
+					   NULL, size,
 					   ttm_bo_type_kernel, XE_BO_SCANOUT_BIT |
 					   XE_BO_CREATE_STOLEN_BIT |
 					   XE_BO_CREATE_PINNED_BIT);
@@ -220,9 +221,9 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 			drm_info(&dev_priv->drm, "Allocated fbdev into stolen failed: %li\n", PTR_ERR(obj));
 	}
 	if (IS_ERR(obj)) {
-		obj = xe_bo_create_pin_map(dev_priv, to_gt(dev_priv), NULL, size,
+		obj = xe_bo_create_pin_map(dev_priv, xe_device_get_root_tile(dev_priv), NULL, size,
 					  ttm_bo_type_kernel, XE_BO_SCANOUT_BIT |
-					  XE_BO_CREATE_VRAM_IF_DGFX(to_gt(dev_priv)) |
+					  XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(dev_priv)) |
 					  XE_BO_CREATE_PINNED_BIT);
 	}
 #endif
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 3e863461fe79..83c9245dd362 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -45,6 +45,7 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 			       struct i915_vma *vma)
 {
 	struct xe_device *xe = to_xe_device(fb->base.dev);
+	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
 	struct xe_bo *bo = intel_fb_obj(&fb->base), *dpt;
 	u32 dpt_size, size = bo->ttm.base.size;
 
@@ -55,17 +56,17 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
 				 XE_PAGE_SIZE);
 
-	dpt = xe_bo_create_pin_map(xe, to_gt(xe), NULL, dpt_size,
+	dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
 				  ttm_bo_type_kernel,
 				  XE_BO_CREATE_VRAM0_BIT |
 				  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(dpt))
-		dpt = xe_bo_create_pin_map(xe, to_gt(xe), NULL, dpt_size,
+		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
 					   ttm_bo_type_kernel,
 					   XE_BO_CREATE_STOLEN_BIT |
 					   XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(dpt))
-		dpt = xe_bo_create_pin_map(xe, to_gt(xe), NULL, dpt_size,
+		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
 					   ttm_bo_type_kernel,
 					   XE_BO_CREATE_SYSTEM_BIT |
 					   XE_BO_CREATE_GGTT_BIT);
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 39dd97acae08..99c35a4ef673 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -115,7 +115,7 @@ initial_plane_bo(struct xe_device *xe,
 			page_size);
 	size -= base;
 
-	bo = xe_bo_create_pin_map_at(xe, &tile0->primary_gt, NULL, size, phys_base,
+	bo = xe_bo_create_pin_map_at(xe, tile0, NULL, size, phys_base,
 				     ttm_bo_type_kernel, flags);
 	if (IS_ERR(bo)) {
 		drm_dbg(&xe->drm,
-- 
2.40.1

