Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62B1C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 15:13:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6828010EA57;
	Fri, 27 Jun 2025 15:13:20 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D7710EA52
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 15:13:19 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 2/2] drm/xe/display: Make panic support work on vram.
Date: Fri, 27 Jun 2025 17:13:10 +0200
Message-ID: <20250627151307.23001-6-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250627151307.23001-4-dev@lankhorst.se>
References: <20250627151307.23001-4-dev@lankhorst.se>
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

Add a special path for VRAM using xe_res iterators to ensure a panic
screen is shown on VRAM as well.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/display/intel_bo.c | 36 +++++++++++++++++++++------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
index 910632f57c3d6..03be519207397 100644
--- a/drivers/gpu/drm/xe/display/intel_bo.c
+++ b/drivers/gpu/drm/xe/display/intel_bo.c
@@ -9,6 +9,7 @@
 #include "intel_display_types.h"
 
 #include "xe_bo.h"
+#include "xe_res_cursor.h"
 #include "intel_bo.h"
 
 bool intel_bo_is_tiled(struct drm_gem_object *obj)
@@ -69,6 +70,9 @@ struct xe_panic_data {
 	struct page **pages;
 	int page;
 	void *vaddr;
+
+	struct xe_res_cursor res;
+	struct iosys_map vmap;
 };
 
 struct xe_framebuffer {
@@ -112,15 +116,29 @@ static void xe_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int
 	new_page = offset >> PAGE_SHIFT;
 	offset = offset % PAGE_SIZE;
 	if (new_page != panic->page) {
-		xe_panic_kunmap(panic);
+		if (xe_bo_is_vram(bo)) {
+			/* Display is always mapped on root tile */
+			struct xe_vram_region *vram = &xe_bo_device(bo)->mem.vram;
+
+			if (panic->page < 0 || new_page < panic->page) {
+				xe_res_first(bo->ttm.resource, new_page * PAGE_SIZE,
+					     bo->ttm.base.size - new_page * PAGE_SIZE, &panic->res);
+			} else {
+				xe_res_next(&panic->res, PAGE_SIZE * (new_page - panic->page));
+			}
+			iosys_map_set_vaddr_iomem(&panic->vmap,
+						  vram->mapping + panic->res.start);
+		} else {
+			xe_panic_kunmap(panic);
+			panic->vaddr = ttm_bo_kmap_try_from_panic(&bo->ttm,
+								  new_page);
+			iosys_map_set_vaddr(&panic->vmap, panic->vaddr);
+		}
 		panic->page = new_page;
-		panic->vaddr = ttm_bo_kmap_try_from_panic(&bo->ttm,
-							  panic->page);
-	}
-	if (panic->vaddr) {
-		u32 *pix = panic->vaddr + offset;
-		*pix = color;
 	}
+
+	if (iosys_map_is_set(&panic->vmap))
+		iosys_map_wr(&panic->vmap, offset, u32, color);
 }
 
 struct intel_framebuffer *intel_bo_alloc_framebuffer(void)
@@ -137,6 +155,10 @@ int intel_bo_panic_setup(struct drm_scanout_buffer *sb)
 {
 	struct intel_framebuffer *fb = (struct intel_framebuffer *)sb->private;
 	struct xe_panic_data *panic = to_xe_panic_data(fb);
+	struct xe_bo *bo = gem_to_xe_bo(intel_fb_bo(&fb->base));
+
+	if (xe_bo_is_vram(bo) && !xe_bo_is_visible_vram(bo))
+		return -ENODEV;
 
 	panic->page = -1;
 	sb->set_pixel = xe_panic_page_set_pixel;
-- 
2.45.2

