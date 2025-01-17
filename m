Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD48C02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 11:53:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7534A10EAD4;
	Fri, 17 Jan 2025 11:53:44 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFDA10EAD7
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jan 2025 11:53:43 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH] drm/xe/display: Clarify XE_IOCTL_DBG message
Date: Fri, 17 Jan 2025 12:53:05 +0100
Message-ID: <20250117115305.53113-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.43.0
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

This should make it easier to understand from userspace why importing BO
fails.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/display/intel_fb_bo.c |  5 +++--
 drivers/gpu/drm/xe/xe_bo.c               | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_bo.h               |  1 +
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/intel_fb_bo.c b/drivers/gpu/drm/xe/display/intel_fb_bo.c
index 4d209ebc26c2a..a3914b61b7049 100644
--- a/drivers/gpu/drm/xe/display/intel_fb_bo.c
+++ b/drivers/gpu/drm/xe/display/intel_fb_bo.c
@@ -24,6 +24,7 @@ void intel_fb_bo_framebuffer_fini(struct drm_gem_object *obj)
 	xe_bo_put(bo);
 }
 
+
 int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
 				 struct drm_gem_object *obj,
 				 struct drm_mode_fb_cmd2 *mode_cmd)
@@ -50,10 +51,10 @@ int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
 		/*
 		 * XE_BO_FLAG_SCANOUT should ideally be set at creation, or is
 		 * automatically set when creating FB. We cannot change caching
-		 * mode when the boect is VM_BINDed, so we can only set
+		 * mode when the bo is VM_BINDed, so we can only set
 		 * coherency with display when unbound.
 		 */
-		if (XE_IOCTL_DBG(xe, !list_empty(&bo->ttm.base.gpuva.list))) {
+		if (XE_IOCTL_DBG(xe, xe_bo_is_vm_bound(bo))) {
 			ttm_bo_unreserve(&bo->ttm);
 			ret = -EINVAL;
 			goto err;
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3f5391d416d46..03f93b8561659 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -124,6 +124,22 @@ bool xe_bo_is_stolen_devmem(struct xe_bo *bo)
 		GRAPHICS_VERx100(xe_bo_device(bo)) >= 1270;
 }
 
+/**
+ * xe_bo_is_vm_bound - check if BO has any mappings through VM_BIND
+ * @bo: The BO
+ *
+ * Check if a given bo is bound through VM_BIND. This requires the
+ * reservation lock for the BO to be held.
+ *
+ * Returns: boolean
+ */
+bool xe_bo_is_vm_bound(struct xe_bo *bo)
+{
+	xe_bo_assert_held(bo);
+
+	return !list_empty(&bo->ttm.base.gpuva.list);
+}
+
 static bool xe_bo_is_user(struct xe_bo *bo)
 {
 	return bo->flags & XE_BO_FLAG_USER;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index d9386ab031404..6d2f1086d533a 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -234,6 +234,7 @@ bool mem_type_is_vram(u32 mem_type);
 bool xe_bo_is_vram(struct xe_bo *bo);
 bool xe_bo_is_stolen(struct xe_bo *bo);
 bool xe_bo_is_stolen_devmem(struct xe_bo *bo);
+bool xe_bo_is_vm_bound(struct xe_bo *bo);
 bool xe_bo_has_single_placement(struct xe_bo *bo);
 uint64_t vram_region_gpu_offset(struct ttm_resource *res);
 
-- 
2.43.0

