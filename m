Return-Path: <intel-xe-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 12 Jan 2023 17:25:16 -0500
Message-ID: <20230112222538.2000142-16-rodrigo.vivi@intel.com>
In-Reply-To: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
References: <20230112222538.2000142-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [Intel-xe] [PATCH 15/37] drm/xe: Rework initialisation ordering
 slightly so we can inherit fb
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

To inherit the framebuffer, we need to have TTM initialisation for
memory allocations, but not a single allocation needs to be done
because the FB is put at the start, and the first memory allocation
will likely wipe out the initial framebuffer.

There's still a small flicker, as we should probably set GGTT to exactly
the same adress, but the contents are preserved.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 28 +++++++++----
 drivers/gpu/drm/xe/xe_ggtt.c   | 72 ++++++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_ggtt.h   |  1 +
 drivers/gpu/drm/xe/xe_gt.c     | 41 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt.h     |  1 +
 5 files changed, 105 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0b154c0a1381..bd6c54aa5649 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -335,7 +335,7 @@ static int xe_device_init_display_noirq(struct xe_device *xe)
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
-static inline void xe_device_fini_display_early(struct drm_device *dev, void *dummy)
+static void xe_device_fini_display_noaccel(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
@@ -343,20 +343,20 @@ static inline void xe_device_fini_display_early(struct drm_device *dev, void *du
 }
 #endif
 
-static int xe_device_init_display_early(struct xe_device *xe)
+static int xe_device_init_display_noaccel(struct xe_device *xe)
 {
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 	int err = intel_modeset_init_nogem(xe);
 	if (err)
 		return err;
 
-	return drmm_add_action_or_reset(&xe->drm, xe_device_fini_display_early, NULL);
+	return drmm_add_action_or_reset(&xe->drm, xe_device_fini_display_noaccel, NULL);
 #else
 	return 0;
 #endif
 }
 
-static int xe_device_init_display_late(struct xe_device *xe)
+static int xe_device_init_display(struct xe_device *xe)
 {
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 	return intel_modeset_init(xe);
@@ -412,17 +412,29 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err;
 
-	err = xe_device_init_display_early(xe);
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_init_early(gt);
+		if (err)
+			goto err_irq_shutdown;
+	}
+
+	err = xe_mmio_probe_vram(xe);
 	if (err)
 		goto err_irq_shutdown;
 
 	for_each_gt(gt, xe, id) {
-		err = xe_gt_init_early(gt);
+		err = xe_gt_init_noalloc(gt);
 		if (err)
 			goto err_irq_shutdown;
 	}
 
-	err = xe_mmio_probe_vram(xe);
+	/*
+	 * Now that GT is initialized (TTM in particular),
+	 * we can try to init display, and inherit the initial fb.
+	 * This is the reason the first allocation needs to be done
+	 * inside display.
+	 */
+	err = xe_device_init_display_noaccel(xe);
 	if (err)
 		goto err_irq_shutdown;
 
@@ -432,7 +444,7 @@ int xe_device_probe(struct xe_device *xe)
 			goto err_irq_shutdown;
 	}
 
-	err = xe_device_init_display_late(xe);
+	err = xe_device_init_display(xe);
 	if (err)
 		goto err_fini_display;
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 3ace37d90f8d..d67f66b33aed 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -68,7 +68,10 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 
 	XE_BUG_ON(start >= end);
 
-	scratch_pte = xe_ggtt_pte_encode(ggtt->scratch, 0);
+	if (ggtt->scratch)
+		scratch_pte = xe_ggtt_pte_encode(ggtt->scratch, 0);
+	else
+		scratch_pte = 0;
 
 	while (start < end) {
 		xe_ggtt_set_pte(ggtt, start, scratch_pte);
@@ -76,7 +79,7 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 	}
 }
 
-static void ggtt_fini(struct drm_device *drm, void *arg)
+static void ggtt_fini_noalloc(struct drm_device *drm, void *arg)
 {
 	struct xe_ggtt *ggtt = arg;
 
@@ -86,12 +89,11 @@ static void ggtt_fini(struct drm_device *drm, void *arg)
 	xe_bo_unpin_map_no_vm(ggtt->scratch);
 }
 
-int xe_ggtt_init(struct xe_gt *gt, struct xe_ggtt *ggtt)
+int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	unsigned int gsm_size;
-	int err;
 
 	XE_BUG_ON(xe_gt_is_media_type(gt));
 
@@ -104,22 +106,7 @@ int xe_ggtt_init(struct xe_gt *gt, struct xe_ggtt *ggtt)
 	}
 
 	ggtt->gsm = gt->mmio.regs + SZ_8M;
-	ggtt->scratch = xe_bo_create_locked(xe, gt, NULL, GEN8_PAGE_SIZE,
-					    ttm_bo_type_kernel,
-					    XE_BO_CREATE_VRAM_IF_DGFX(gt) |
-					    XE_BO_CREATE_PINNED_BIT);
-	if (IS_ERR(ggtt->scratch)) {
-		err = PTR_ERR(ggtt->scratch);
-		goto err_iomap;
-	}
-
-	err = xe_bo_pin(ggtt->scratch);
-	xe_bo_unlock_no_vm(ggtt->scratch);
-	if (err)
-		goto err_scratch;
-
 	ggtt->size = (gsm_size / 8) * (u64)GEN8_PAGE_SIZE;
-	xe_ggtt_clear(ggtt, 0, ggtt->size - 1);
 
 	/*
 	 * 8B per entry, each points to a 4KB page.
@@ -142,15 +129,48 @@ int xe_ggtt_init(struct xe_gt *gt, struct xe_ggtt *ggtt)
 		    ggtt->size - xe_wopcm_size(xe));
 	mutex_init(&ggtt->lock);
 
-	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini, ggtt);
-	if (err)
-		return err;
+	return drmm_add_action_or_reset(&xe->drm, ggtt_fini_noalloc, ggtt);
+}
 
-	return 0;
+static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
+{
+	struct drm_mm_node *hole;
+	u64 start, end;
+
+	/* Display may have allocated inside ggtt, so be careful with clearing here */
+	mutex_lock(&ggtt->lock);
+	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
+		xe_ggtt_clear(ggtt, start, end - start);
 
-err_scratch:
-	xe_bo_put(ggtt->scratch);
-err_iomap:
+	xe_ggtt_invalidate(ggtt->gt);
+	mutex_unlock(&ggtt->lock);
+}
+
+int xe_ggtt_init(struct xe_gt *gt, struct xe_ggtt *ggtt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	int err;
+
+	ggtt->scratch = xe_bo_create_locked(xe, gt, NULL, GEN8_PAGE_SIZE,
+					    ttm_bo_type_kernel,
+					    XE_BO_CREATE_VRAM_IF_DGFX(gt) |
+					    XE_BO_CREATE_PINNED_BIT);
+	if (IS_ERR(ggtt->scratch)) {
+		err = PTR_ERR(ggtt->scratch);
+		goto err;
+	}
+
+	err = xe_bo_pin(ggtt->scratch);
+	xe_bo_unlock_no_vm(ggtt->scratch);
+	if (err) {
+		xe_bo_put(ggtt->scratch);
+		goto err;
+	}
+
+	xe_ggtt_initial_clear(ggtt);
+	return 0;
+err:
+	ggtt->scratch = NULL;
 	return err;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index ebb5c312f331..289c6852ad1a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -11,6 +11,7 @@
 u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset);
 void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte);
 void xe_ggtt_invalidate(struct xe_gt *gt);
+int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_gt *gt, struct xe_ggtt *ggtt);
 void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix);
 
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index ccb87a7c6554..6cea15725cae 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -389,6 +389,43 @@ int xe_gt_init_early(struct xe_gt *gt)
 	return 0;
 }
 
+/**
+ * xe_gt_init_noalloc - Init GT up to the point where allocations can happen.
+ * @gt: The GT to initialize.
+ *
+ * This function prepares the GT to allow memory allocations to VRAM, but is not
+ * allowed to allocate memory itself. This state is useful for display readout,
+ * because the inherited display framebuffer will otherwise be overwritten as it
+ * is usually put at the start of VRAM.
+ *
+ * Returns: 0 on success, negative error code on error.
+ */
+int xe_gt_init_noalloc(struct xe_gt *gt)
+{
+	int err, err2;
+
+	if (xe_gt_is_media_type(gt))
+		return 0;
+
+	xe_device_mem_access_get(gt_to_xe(gt));
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (err)
+		goto err;
+
+	err = gt_ttm_mgr_init(gt);
+	if (err)
+		goto err_force_wake;
+
+	err = xe_ggtt_init_noalloc(gt, gt->mem.ggtt);
+
+err_force_wake:
+	err2 = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	XE_WARN_ON(err2);
+	xe_device_mem_access_put(gt_to_xe(gt));
+err:
+	return err;
+}
+
 static int gt_fw_domain_init(struct xe_gt *gt)
 {
 	int err, i;
@@ -399,10 +436,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 		goto err_hw_fence_irq;
 
 	if (!xe_gt_is_media_type(gt)) {
-		err = gt_ttm_mgr_init(gt);
-		if (err)
-			goto err_force_wake;
-
 		err = xe_ggtt_init(gt, gt->mem.ggtt);
 		if (err)
 			goto err_force_wake;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 1e070ab4e5aa..5dc08a993cfe 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -18,6 +18,7 @@
 
 int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt);
 int xe_gt_init_early(struct xe_gt *gt);
+int xe_gt_init_noalloc(struct xe_gt *gt);
 int xe_gt_init(struct xe_gt *gt);
 int xe_gt_record_default_lrcs(struct xe_gt *gt);
 void xe_gt_suspend_prepare(struct xe_gt *gt);
-- 
2.38.1


