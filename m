Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:20 -0500
Message-ID: <20230112222538.2000142-20-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 19/37] drm/xe: Put DPT into stolen memory,
 if available
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
To: intel-xe@lists.freedesktop.org, matthew.brost@intel.com, maarten.lankhorst@linux.intel.com, philippe.lecluse@intel.com, mchehab@kernel.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Same as i915 does, why not?

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 40 +++++++++++++++-----------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index b989d37b94f1..f23d00daf574 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -48,16 +48,31 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 	struct xe_bo *bo = intel_fb_obj(&fb->base), *dpt;
 	u32 dpt_size, size = bo->ttm.base.size;
 
-	if (view->type == I915_GTT_VIEW_NORMAL) {
-		u32 x;
-
+	if (view->type == I915_GTT_VIEW_NORMAL)
 		dpt_size = ALIGN(size / GEN8_PAGE_SIZE * 8, GEN8_PAGE_SIZE);
+	else
+		/* display uses 4K tiles instead of bytes here, convert to entries.. */
+		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8, GEN8_PAGE_SIZE);
+
+	dpt = xe_bo_create_pin_map(xe, to_gt(xe), NULL, dpt_size,
+				  ttm_bo_type_kernel,
+				  XE_BO_CREATE_VRAM0_BIT |
+				  XE_BO_CREATE_GGTT_BIT);
+	if (IS_ERR(dpt))
+		dpt = xe_bo_create_pin_map(xe, to_gt(xe), NULL, dpt_size,
+					   ttm_bo_type_kernel,
+					   XE_BO_CREATE_STOLEN_BIT |
+					   XE_BO_CREATE_GGTT_BIT);
+	if (IS_ERR(dpt))
 		dpt = xe_bo_create_pin_map(xe, to_gt(xe), NULL, dpt_size,
-					  ttm_bo_type_kernel,
-					  XE_BO_CREATE_VRAM_IF_DGFX(to_gt(xe)) |
-					  XE_BO_CREATE_GGTT_BIT);
-		if (IS_ERR(dpt))
-			return PTR_ERR(dpt);
+					   ttm_bo_type_kernel,
+					   XE_BO_CREATE_SYSTEM_BIT |
+					   XE_BO_CREATE_GGTT_BIT);
+	if (IS_ERR(dpt))
+		return PTR_ERR(dpt);
+
+	if (view->type == I915_GTT_VIEW_NORMAL) {
+		u32 x;
 
 		for (x = 0; x < size / GEN8_PAGE_SIZE; x++)
 			iosys_map_wr(&dpt->vmap, x * 8, u64,
@@ -66,15 +81,6 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 		const struct intel_rotation_info *rot_info = &view->rotated;
 		u32 i, dpt_ofs = 0;
 
-		/* display uses 4K tiles instead of bytes here, convert to entries.. */
-		dpt_size = ALIGN(intel_rotation_info_size(rot_info) * 8, GEN8_PAGE_SIZE);
-		dpt = xe_bo_create_pin_map(xe, to_gt(xe), NULL, dpt_size,
-					  ttm_bo_type_kernel,
-					  XE_BO_CREATE_VRAM_IF_DGFX(to_gt(xe)) |
-					  XE_BO_CREATE_GGTT_BIT);
-		if (IS_ERR(dpt))
-			return PTR_ERR(dpt);
-
 		for (i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
 			write_dpt_rotated(bo, &dpt->vmap, &dpt_ofs,
 					  rot_info->plane[i].offset,
-- 
2.38.1


