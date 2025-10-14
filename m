Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B72ECCD18E
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 21:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C506110E6A4;
	Tue, 14 Oct 2025 21:20:15 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D42110E6A2
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 21:20:13 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v6 04/12] drm/xe/display: Avoid dereferencing xe_ggtt_node
Date: Tue, 14 Oct 2025 23:20:01 +0200
Message-ID: <20251014211956.1607561-18-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014211956.1607561-14-dev@lankhorst.se>
References: <20251014211956.1607561-14-dev@lankhorst.se>
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

Start using xe_ggtt_node_addr, and avoid comparing the base offset
as vma->node is dynamically allocated.

Also sneak in a xe_bo_size() for stolen, too small to put as separate commit.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h | 4 ++--
 drivers/gpu/drm/xe/display/xe_fb_pin.c            | 4 ++--
 drivers/gpu/drm/xe/display/xe_stolen.c            | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
index 4465c40f81341..1c599963169a0 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
@@ -8,7 +8,7 @@
 
 #include <uapi/drm/i915_drm.h>
 
-#include "xe_ggtt_types.h"
+#include "xe_ggtt.h"
 
 #include <linux/refcount.h>
 
@@ -32,7 +32,7 @@ struct i915_vma {
 
 static inline u32 i915_ggtt_offset(const struct i915_vma *vma)
 {
-	return vma->node->base.start;
+	return xe_ggtt_node_addr(vma->node);
 }
 
 #endif
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index d2e4903de0977..784d2db5fd0db 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -206,7 +206,7 @@ static void write_ggtt_rotated_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *n
 	struct fb_rotate_args *args = data;
 	struct xe_bo *bo = args->bo;
 	const struct intel_rotation_info *rot_info = &args->view->rotated;
-	u32 ggtt_ofs = node->base.start;
+	u32 ggtt_ofs = xe_ggtt_node_addr(node);
 
 	for (u32 i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
 		write_ggtt_rotated(ggtt, &ggtt_ofs, pte_flags, write_pte,
@@ -351,7 +351,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 	if (vma->dpt)
 		xe_bo_unpin_map_no_vm(vma->dpt);
 	else if (!xe_ggtt_node_allocated(vma->bo->ggtt_node[tile_id]) ||
-		 vma->bo->ggtt_node[tile_id]->base.start != vma->node->base.start)
+		 vma->bo->ggtt_node[tile_id] != vma->node)
 		xe_ggtt_node_remove(vma->node, false);
 
 	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
diff --git a/drivers/gpu/drm/xe/display/xe_stolen.c b/drivers/gpu/drm/xe/display/xe_stolen.c
index 9f04ba36e930b..ef5ef5aa8d847 100644
--- a/drivers/gpu/drm/xe/display/xe_stolen.c
+++ b/drivers/gpu/drm/xe/display/xe_stolen.c
@@ -100,7 +100,7 @@ u64 i915_gem_stolen_node_address(struct intel_stolen_node *node)
 
 u64 i915_gem_stolen_node_size(const struct intel_stolen_node *node)
 {
-	return node->bo->ttm.base.size;
+	return xe_bo_size(node->bo);
 }
 
 struct intel_stolen_node *i915_gem_stolen_node_alloc(struct drm_device *drm)
-- 
2.51.0

