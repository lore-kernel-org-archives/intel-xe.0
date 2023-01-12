Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:21 -0500
Message-ID: <20230112222538.2000142-21-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 20/37] drm/xe: Implement FBC support
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

Initialise the stolen memory allocator earlier to make it available
when FBC is initialised, so we can check if it's succesfull there.

With this, we can easily implement FBC by hooking a few calls
inside intel_fbc.c

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 85 +++++++++++++++++-------
 drivers/gpu/drm/xe/xe_bo.c               | 29 ++++----
 drivers/gpu/drm/xe/xe_bo.h               |  5 ++
 drivers/gpu/drm/xe/xe_device.c           |  6 +-
 4 files changed, 85 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 77c848b5b7ae..2804db71d630 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -45,9 +45,6 @@
 
 #include "i915_drv.h"
 #include "i915_utils.h"
-#ifdef I915
-#include "i915_vgpu.h"
-#endif
 #include "intel_cdclk.h"
 #include "intel_de.h"
 #include "intel_display_trace.h"
@@ -57,28 +54,66 @@
 
 #ifdef I915
 
+#include "i915_vgpu.h"
+
 #define i915_gem_stolen_initialized(i915) (drm_mm_initialized(&(i915)->mm.stolen))
+#define i915_gem_stolen_allocated(node) drm_mm_node_allocated(&(node))
+#define i915_gem_stolen_compressed_offset(node) ((node).start)
+#define i915_gem_stolen_compressed_size(node) ((node).size)
 
 #else
 
-/* No stolen memory support in xe yet */
-static int i915_gem_stolen_insert_node_in_range(struct xe_device *xe, void *ptr, u32 size, u32 align, u32 start, u32 end)
+#include "xe_ttm_stolen_mgr.h"
+#include "xe_res_cursor.h"
+
+static int i915_gem_stolen_insert_node_in_range(struct xe_device *xe, struct xe_bo **bo, u32 size, u32 align, u32 start, u32 end)
 {
-	return -ENODEV;
+	int err;
+	u32 flags = XE_BO_CREATE_PINNED_BIT | XE_BO_CREATE_STOLEN_BIT;
+
+	*bo = xe_bo_create_locked_range(xe, to_gt(xe), NULL, size, start, end,
+					ttm_bo_type_kernel, flags);
+	if (IS_ERR(*bo)) {
+		err = PTR_ERR(*bo);
+		bo = NULL;
+		return err;
+	}
+	err = xe_bo_pin(*bo);
+	xe_bo_unlock_vm_held(*bo);
+
+	if (err) {
+		xe_bo_put(*bo);
+		*bo = NULL;
+	}
+
+	return err;
 }
 
-static int i915_gem_stolen_insert_node(struct xe_device *xe, void *ptr, u32 size, u32 align)
+static int i915_gem_stolen_insert_node(struct xe_device *xe, struct xe_bo **bo, u32 size, u32 align)
 {
-	XE_WARN_ON(1);
+	/* Not used on xe */
+	BUG_ON(1);
 	return -ENODEV;
 }
 
-static void i915_gem_stolen_remove_node(struct xe_device *xe, void *ptr)
+static void i915_gem_stolen_remove_node(struct xe_device *xe, struct xe_bo **bo)
 {
+	xe_bo_unpin_map_no_vm(*bo);
+	*bo = NULL;
 }
 
-#define i915_gem_stolen_initialized(xe) ((xe) && 0)
+#define i915_gem_stolen_initialized(xe) (!!ttm_manager_type(&(xe)->ttm, XE_PL_STOLEN))
+#define i915_gem_stolen_allocated(bo) (!!(bo))
+
+static u32 i915_gem_stolen_compressed_offset(struct xe_bo *bo)
+{
+	struct xe_res_cursor res;
+
+	xe_res_first(bo->ttm.resource, 0, 4096, &res);
+	return res.start;
+}
 
+#define i915_gem_stolen_compressed_size(fb) ((u64)((fb)->ttm.base.size))
 #endif
 
 #define for_each_fbc_id(__dev_priv, __fbc_id) \
@@ -121,8 +156,11 @@ struct intel_fbc {
 	struct mutex lock;
 	unsigned int busy_bits;
 
-	struct drm_mm_node compressed_fb;
-	struct drm_mm_node compressed_llb;
+#ifdef I915
+	struct drm_mm_node compressed_fb, compressed_llb;
+#else
+	struct xe_bo *compressed_fb, *compressed_llb;
+#endif
 
 	enum intel_fbc_id id;
 
@@ -476,7 +514,8 @@ static void g4x_fbc_program_cfb(struct intel_fbc *fbc)
 {
 	struct drm_i915_private *i915 = fbc->i915;
 
-	intel_de_write(i915, DPFC_CB_BASE, fbc->compressed_fb.start);
+	intel_de_write(i915, DPFC_CB_BASE,
+		       i915_gem_stolen_compressed_offset(fbc->compressed_fb));
 }
 
 static const struct intel_fbc_funcs g4x_fbc_funcs = {
@@ -527,7 +566,8 @@ static void ilk_fbc_program_cfb(struct intel_fbc *fbc)
 {
 	struct drm_i915_private *i915 = fbc->i915;
 
-	intel_de_write(i915, ILK_DPFC_CB_BASE(fbc->id), fbc->compressed_fb.start);
+	intel_de_write(i915, ILK_DPFC_CB_BASE(fbc->id),
+		       i915_gem_stolen_compressed_offset(fbc->compressed_fb));
 }
 
 static const struct intel_fbc_funcs ilk_fbc_funcs = {
@@ -747,8 +787,6 @@ static u64 intel_fbc_stolen_end(struct drm_i915_private *i915)
 	    (DISPLAY_VER(i915) == 9 && !IS_BROXTON(i915)))
 		end = resource_size(&i915->dsm) - 8 * 1024 * 1024;
 	else
-#else
-	/* TODO */
 #endif
 		end = U64_MAX;
 
@@ -805,9 +843,9 @@ static int intel_fbc_alloc_cfb(struct intel_fbc *fbc,
 	int ret;
 
 	drm_WARN_ON(&i915->drm,
-		    drm_mm_node_allocated(&fbc->compressed_fb));
+		    i915_gem_stolen_allocated(fbc->compressed_fb));
 	drm_WARN_ON(&i915->drm,
-		    drm_mm_node_allocated(&fbc->compressed_llb));
+		    i915_gem_stolen_allocated(fbc->compressed_llb));
 
 	if (DISPLAY_VER(i915) < 5 && !IS_G4X(i915)) {
 		ret = i915_gem_stolen_insert_node(i915, &fbc->compressed_llb,
@@ -827,12 +865,12 @@ static int intel_fbc_alloc_cfb(struct intel_fbc *fbc,
 
 	drm_dbg_kms(&i915->drm,
 		    "reserved %llu bytes of contiguous stolen space for FBC, limit: %d\n",
-		    fbc->compressed_fb.size, fbc->limit);
+		    i915_gem_stolen_compressed_size(fbc->compressed_fb), fbc->limit);
 
 	return 0;
 
 err_llb:
-	if (drm_mm_node_allocated(&fbc->compressed_llb))
+	if (i915_gem_stolen_allocated(fbc->compressed_llb))
 		i915_gem_stolen_remove_node(i915, &fbc->compressed_llb);
 err:
 	if (i915_gem_stolen_initialized(i915))
@@ -860,9 +898,9 @@ static void __intel_fbc_cleanup_cfb(struct intel_fbc *fbc)
 	if (WARN_ON(intel_fbc_hw_is_active(fbc)))
 		return;
 
-	if (drm_mm_node_allocated(&fbc->compressed_llb))
+	if (i915_gem_stolen_allocated(fbc->compressed_llb))
 		i915_gem_stolen_remove_node(i915, &fbc->compressed_llb);
-	if (drm_mm_node_allocated(&fbc->compressed_fb))
+	if (i915_gem_stolen_allocated(fbc->compressed_fb))
 		i915_gem_stolen_remove_node(i915, &fbc->compressed_fb);
 }
 
@@ -1070,7 +1108,8 @@ static bool intel_fbc_is_cfb_ok(const struct intel_plane_state *plane_state)
 	struct intel_fbc *fbc = plane->fbc;
 
 	return intel_fbc_min_limit(plane_state) <= fbc->limit &&
-		intel_fbc_cfb_size(plane_state) <= fbc->compressed_fb.size * fbc->limit;
+		intel_fbc_cfb_size(plane_state) <= fbc->limit *
+			i915_gem_stolen_compressed_size(fbc->compressed_fb);
 }
 
 static bool intel_fbc_is_ok(const struct intel_plane_state *plane_state)
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 314f9b5d34f1..0889c3c89511 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1023,7 +1023,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 static int __xe_bo_fixed_placement(struct xe_device *xe,
 				   struct xe_bo *bo,
 				   u32 flags,
-				   u64 offset, u64 size)
+				   u64 start, u64 end, u64 size)
 {
 	struct ttm_place *place = bo->placements;
 
@@ -1031,8 +1031,8 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
 		return -EINVAL;
 
 	place->flags = TTM_PL_FLAG_CONTIGUOUS;
-	place->fpfn = offset >> PAGE_SHIFT;
-	place->lpfn = (offset + size) >> PAGE_SHIFT;
+	place->fpfn = start >> PAGE_SHIFT;
+	place->lpfn = end >> PAGE_SHIFT;
 
 	switch (flags & (XE_BO_CREATE_STOLEN_BIT |
 		XE_BO_CREATE_VRAM0_BIT |XE_BO_CREATE_VRAM1_BIT)) {
@@ -1061,11 +1061,11 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
 	return 0;
 }
 
-static struct xe_bo *
-xe_bo_create_locked_at(struct xe_device *xe,
-		       struct xe_gt *gt, struct xe_vm *vm,
-		       size_t size, u64 offset,
-		       enum ttm_bo_type type, u32 flags)
+struct xe_bo *
+xe_bo_create_locked_range(struct xe_device *xe,
+			  struct xe_gt *gt, struct xe_vm *vm,
+			  size_t size, u64 start, u64 end,
+			  enum ttm_bo_type type, u32 flags)
 {
 	struct xe_bo *bo = NULL;
 	int err;
@@ -1073,13 +1073,13 @@ xe_bo_create_locked_at(struct xe_device *xe,
 	if (vm)
 		xe_vm_assert_held(vm);
 
-	if (offset != ~0ULL) {
+	if (start || end != ~0ULL) {
 		bo = xe_bo_alloc();
 		if (IS_ERR(bo))
 			return bo;
 
 		flags |= XE_BO_FIXED_PLACEMENT_BIT;
-		err = __xe_bo_fixed_placement(xe, bo, flags, offset, size);
+		err = __xe_bo_fixed_placement(xe, bo, flags, start, end, size);
 		if (err) {
 			xe_bo_free(bo);
 			return ERR_PTR(err);
@@ -1096,7 +1096,6 @@ xe_bo_create_locked_at(struct xe_device *xe,
 	bo->vm = vm;
 
 	if (bo->flags & XE_BO_CREATE_GGTT_BIT) {
-
 		if (!gt && flags & XE_BO_CREATE_STOLEN_BIT)
 			gt = xe_device_get_gt(xe, 0);
 
@@ -1119,7 +1118,7 @@ struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_gt *gt,
 				  struct xe_vm *vm, size_t size,
 				  enum ttm_bo_type type, u32 flags)
 {
-	return xe_bo_create_locked_at(xe, gt, vm, size, ~0ULL, type, flags);
+	return xe_bo_create_locked_range(xe, gt, vm, size, 0, ~0ULL, type, flags);
 }
 
 struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_gt *gt,
@@ -1141,12 +1140,14 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_gt *gt,
 {
 	struct xe_bo *bo;
 	int err;
+	u64 start = offset == ~0ull ? 0 : offset;
+	u64 end = offset == ~0ull ? offset : start + size;
 
 	if (flags & XE_BO_CREATE_STOLEN_BIT &&
 	    xe_ttm_stolen_inaccessible(xe))
 		flags |= XE_BO_CREATE_GGTT_BIT;
 
-	bo = xe_bo_create_locked_at(xe, gt, vm, size, offset, type, flags);
+	bo = xe_bo_create_locked_range(xe, gt, vm, size, start, end, type, flags);
 	if (IS_ERR(bo))
 		return bo;
 
@@ -1174,7 +1175,7 @@ struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_gt *gt,
 				   struct xe_vm *vm, size_t size,
 				   enum ttm_bo_type type, u32 flags)
 {
-	return xe_bo_create_pin_map_at(xe, gt, vm, size, ~0ULL, type, flags);
+	return xe_bo_create_pin_map_at(xe, gt, vm, size, ~0ull, type, flags);
 }
 
 struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_gt *gt,
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index ed71b594f407..8d8a3332dbc8 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -79,6 +79,11 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 				    struct xe_gt *gt, struct dma_resv *resv,
 				    size_t size, enum ttm_bo_type type,
 				    u32 flags);
+struct xe_bo *
+xe_bo_create_locked_range(struct xe_device *xe,
+			  struct xe_gt *gt, struct xe_vm *vm,
+			  size_t size, u64 start, u64 end,
+			  enum ttm_bo_type type, u32 flags);
 struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_gt *gt,
 				  struct xe_vm *vm, size_t size,
 				  enum ttm_bo_type type, u32 flags);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 86e386931206..c8b4c580bd98 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -405,6 +405,9 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
+	/* Harmless if stolen initialization fails */
+	xe_ttm_stolen_mgr_init(xe);
+
 	err = xe_device_init_display_noirq(xe);
 	if (err)
 		return err;
@@ -429,9 +432,6 @@ int xe_device_probe(struct xe_device *xe)
 			goto err_irq_shutdown;
 	}
 
-	/* Harmless if stolen initialization fails */
-	xe_ttm_stolen_mgr_init(xe);
-
 	/*
 	 * Now that GT is initialized (TTM in particular),
 	 * we can try to init display, and inherit the initial fb.
-- 
2.38.1


