Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD88CD13CF
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 14:08:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52C110E305;
	Mon,  2 Sep 2024 14:08:43 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF9C10E306
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Sep 2024 14:08:41 +0000 (UTC)
Received: internal info suppressed
Received: from illevi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by illevi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 482E8QnT2526278; Mon, 2 Sep 2024 17:08:29 +0300
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, michal.wajdeczko@intel.com, jonathan.cavitt@intel.com,
 niranjana.vishwanathapura@intel.com, matthew.brost@intel.com,
 koby.elbaz@intel.com, yaron.avizrat@intel.com
Subject: [PATCH v3 2/4] drm/xe: move memirq out of VF
Date: Mon,  2 Sep 2024 17:08:24 +0300
Message-ID: <20240902140826.2526259-3-ilia.levi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240902140826.2526259-1-ilia.levi@intel.com>
References: <20240902140826.2526259-1-ilia.levi@intel.com>
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

Up until now only VF used Memory Based Interrupts (memirq).
Moving it out of VF to cater for other usages.

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  8 ++--
 drivers/gpu/drm/xe/xe_device.h       |  7 ++++
 drivers/gpu/drm/xe/xe_device_types.h |  6 +--
 drivers/gpu/drm/xe/xe_guc.c          |  2 +-
 drivers/gpu/drm/xe/xe_irq.c          | 40 ++++++++++--------
 drivers/gpu/drm/xe/xe_lrc.c          |  4 +-
 drivers/gpu/drm/xe/xe_memirq.c       | 61 ++++++++++++----------------
 7 files changed, 63 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1a0d7fdd094b..b594daa5026d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -660,11 +660,9 @@ int xe_device_probe(struct xe_device *xe)
 		err = xe_ggtt_init_early(tile->mem.ggtt);
 		if (err)
 			return err;
-		if (IS_SRIOV_VF(xe)) {
-			err = xe_memirq_init(&tile->sriov.vf.memirq);
-			if (err)
-				return err;
-		}
+		err = xe_memirq_init(&tile->memirq);
+		if (err)
+			return err;
 	}
 
 	for_each_gt(gt, xe, id) {
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 196b72c181f2..6901083654ba 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -9,6 +9,7 @@
 #include <drm/drm_util.h>
 
 #include "xe_device_types.h"
+#include "xe_sriov.h"
 
 static inline struct xe_device *to_xe_device(const struct drm_device *dev)
 {
@@ -160,6 +161,12 @@ static inline bool xe_device_has_msix(struct xe_device *xe)
 	return false;
 }
 
+static inline bool xe_device_uses_memirq(struct xe_device *xe)
+{
+	return (IS_SRIOV_VF(xe) || xe_device_has_msix(xe)) &&
+		xe_device_has_memirq(xe);
+}
+
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index ec7eb7811126..aa7e6dfad982 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -200,14 +200,14 @@ struct xe_tile {
 			struct xe_lmtt lmtt;
 		} pf;
 		struct {
-			/** @sriov.vf.memirq: Memory Based Interrupts. */
-			struct xe_memirq memirq;
-
 			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
 			struct xe_ggtt_node *ggtt_balloon[2];
 		} vf;
 	} sriov;
 
+	/** @memirq: Memory Based Interrupts. */
+	struct xe_memirq memirq;
+
 	/** @pcode: tile's PCODE */
 	struct {
 		/** @pcode.lock: protecting tile's PCODE mailbox data */
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 52df28032a6f..5fd14e387d79 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -863,7 +863,7 @@ int xe_guc_enable_communication(struct xe_guc *guc)
 		struct xe_gt *gt = guc_to_gt(guc);
 		struct xe_tile *tile = gt_to_tile(gt);
 
-		err = xe_memirq_init_guc(&tile->sriov.vf.memirq, guc);
+		err = xe_memirq_init_guc(&tile->memirq, guc);
 		if (err)
 			return err;
 	} else {
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 5f2c368c35ad..8b011d9f7b32 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -134,7 +134,7 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 	u32 gsc_mask = 0;
 	u32 heci_mask = 0;
 
-	if (IS_SRIOV_VF(xe) && xe_device_has_memirq(xe))
+	if (xe_device_uses_memirq(xe))
 		return;
 
 	if (xe_device_uc_enabled(xe)) {
@@ -559,17 +559,15 @@ static void vf_irq_reset(struct xe_device *xe)
 
 	xe_assert(xe, IS_SRIOV_VF(xe));
 
-	if (GRAPHICS_VERx100(xe) < 1210)
-		xelp_intr_disable(xe);
-	else
+	if (GRAPHICS_VERx100(xe) >= 1210) {
 		xe_assert(xe, xe_device_has_memirq(xe));
-
-	for_each_tile(tile, xe, id) {
-		if (xe_device_has_memirq(xe))
-			xe_memirq_reset(&tile->sriov.vf.memirq);
-		else
-			gt_irq_reset(tile);
+		return;
 	}
+
+	xelp_intr_disable(xe);
+
+	for_each_tile(tile, xe, id)
+		gt_irq_reset(tile);
 }
 
 static void xe_irq_reset(struct xe_device *xe)
@@ -577,6 +575,11 @@ static void xe_irq_reset(struct xe_device *xe)
 	struct xe_tile *tile;
 	u8 id;
 
+	if (xe_device_uses_memirq(xe)) {
+		for_each_tile(tile, xe, id)
+			xe_memirq_reset(&tile->memirq);
+	}
+
 	if (IS_SRIOV_VF(xe))
 		return vf_irq_reset(xe);
 
@@ -604,13 +607,6 @@ static void xe_irq_reset(struct xe_device *xe)
 
 static void vf_irq_postinstall(struct xe_device *xe)
 {
-	struct xe_tile *tile;
-	unsigned int id;
-
-	for_each_tile(tile, xe, id)
-		if (xe_device_has_memirq(xe))
-			xe_memirq_postinstall(&tile->sriov.vf.memirq);
-
 	if (GRAPHICS_VERx100(xe) < 1210)
 		xelp_intr_enable(xe, true);
 	else
@@ -619,6 +615,14 @@ static void vf_irq_postinstall(struct xe_device *xe)
 
 static void xe_irq_postinstall(struct xe_device *xe)
 {
+	struct xe_tile *tile;
+	unsigned int id;
+
+	if (xe_device_uses_memirq(xe)) {
+		for_each_tile(tile, xe, id)
+			xe_memirq_postinstall(&tile->memirq);
+	}
+
 	if (IS_SRIOV_VF(xe))
 		return vf_irq_postinstall(xe);
 
@@ -652,7 +656,7 @@ static irqreturn_t vf_mem_irq_handler(int irq, void *arg)
 	spin_unlock(&xe->irq.lock);
 
 	for_each_tile(tile, xe, id)
-		xe_memirq_handler(&tile->sriov.vf.memirq);
+		xe_memirq_handler(&tile->memirq);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index aec7db39c061..e40f48f4240f 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -599,10 +599,10 @@ static void set_context_control(u32 *regs, struct xe_hw_engine *hwe)
 
 static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
 {
-	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->sriov.vf.memirq;
+	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->memirq;
 	struct xe_device *xe = gt_to_xe(hwe->gt);
 
-	if (!IS_SRIOV_VF(xe) || !xe_device_has_memirq(xe))
+	if (!xe_device_uses_memirq(xe))
 		return;
 
 	regs[CTX_LRM_INT_MASK_ENABLE] = MI_LOAD_REGISTER_MEM |
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 95b6e9d7b7db..0f12b8aa412b 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -19,15 +19,16 @@
 #include "xe_hw_engine.h"
 #include "xe_map.h"
 #include "xe_memirq.h"
-#include "xe_sriov.h"
-#include "xe_sriov_printk.h"
 
 #define memirq_assert(m, condition)	xe_tile_assert(memirq_to_tile(m), condition)
-#define memirq_debug(m, msg...)		xe_sriov_dbg_verbose(memirq_to_xe(m), "MEMIRQ: " msg)
+#define memirq_debug(m, msg...)		drm_dbg(&memirq_to_xe(m)->drm, "MEMIRQ: " msg)
+#define memirq_err(m, msg...)		drm_err(&memirq_to_xe(m)->drm, "MEMIRQ: " msg)
+#define memirq_err_ratelimited(m, msg...) \
+	drm_err_ratelimited(&memirq_to_xe(m)->drm, "MEMIRQ: " msg)
 
 static struct xe_tile *memirq_to_tile(struct xe_memirq *memirq)
 {
-	return container_of(memirq, struct xe_tile, sriov.vf.memirq);
+	return container_of(memirq, struct xe_tile, memirq);
 }
 
 static struct xe_device *memirq_to_xe(struct xe_memirq *memirq)
@@ -157,8 +158,7 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 	return drmm_add_action_or_reset(&xe->drm, __release_xe_bo, memirq->bo);
 
 out:
-	xe_sriov_err(memirq_to_xe(memirq),
-		     "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
+	memirq_err(memirq, "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
 	return err;
 }
 
@@ -178,9 +178,7 @@ static void memirq_set_enable(struct xe_memirq *memirq, bool enable)
  *
  * These allocations are managed and will be implicitly released on unload.
  *
- * Note: This function shall be called only by the VF driver.
- *
- * If this function fails then VF driver won't be able to operate correctly.
+ * If this function fails then the driver won't be able to operate correctly.
  * If `Memory Based Interrupts`_ are not used this function will return 0.
  *
  * Return: 0 on success or a negative error code on failure.
@@ -190,9 +188,7 @@ int xe_memirq_init(struct xe_memirq *memirq)
 	struct xe_device *xe = memirq_to_xe(memirq);
 	int err;
 
-	memirq_assert(memirq, IS_SRIOV_VF(xe));
-
-	if (!xe_device_has_memirq(xe))
+	if (!xe_device_uses_memirq(xe))
 		return 0;
 
 	err = memirq_alloc_pages(memirq);
@@ -209,15 +205,14 @@ int xe_memirq_init(struct xe_memirq *memirq)
  * xe_memirq_source_ptr - Get GGTT's offset of the `Interrupt Source Report Page`_.
  * @memirq: the &xe_memirq to query
  *
- * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
+ * Shall be called when `Memory Based Interrupts`_ are used
  * and xe_memirq_init() didn't fail.
  *
  * Return: GGTT's offset of the `Interrupt Source Report Page`_.
  */
 u32 xe_memirq_source_ptr(struct xe_memirq *memirq)
 {
-	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
-	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
+	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
 	memirq_assert(memirq, memirq->bo);
 
 	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_SOURCE_OFFSET;
@@ -227,15 +222,14 @@ u32 xe_memirq_source_ptr(struct xe_memirq *memirq)
  * xe_memirq_status_ptr - Get GGTT's offset of the `Interrupt Status Report Page`_.
  * @memirq: the &xe_memirq to query
  *
- * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
+ * Shall be called when `Memory Based Interrupts`_ are used
  * and xe_memirq_init() didn't fail.
  *
  * Return: GGTT's offset of the `Interrupt Status Report Page`_.
  */
 u32 xe_memirq_status_ptr(struct xe_memirq *memirq)
 {
-	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
-	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
+	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
 	memirq_assert(memirq, memirq->bo);
 
 	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_STATUS_OFFSET;
@@ -245,15 +239,14 @@ u32 xe_memirq_status_ptr(struct xe_memirq *memirq)
  * xe_memirq_enable_ptr - Get GGTT's offset of the Interrupt Enable Mask.
  * @memirq: the &xe_memirq to query
  *
- * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
+ * Shall be called when `Memory Based Interrupts`_ are used
  * and xe_memirq_init() didn't fail.
  *
  * Return: GGTT's offset of the Interrupt Enable Mask.
  */
 u32 xe_memirq_enable_ptr(struct xe_memirq *memirq)
 {
-	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
-	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
+	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
 	memirq_assert(memirq, memirq->bo);
 
 	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_ENABLE_OFFSET;
@@ -267,7 +260,7 @@ u32 xe_memirq_enable_ptr(struct xe_memirq *memirq)
  * Register `Interrupt Source Report Page`_ and `Interrupt Status Report Page`_
  * to be used by the GuC when `Memory Based Interrupts`_ are required.
  *
- * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
+ * Shall be called when `Memory Based Interrupts`_ are used
  * and xe_memirq_init() didn't fail.
  *
  * Return: 0 on success or a negative error code on failure.
@@ -279,8 +272,7 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
 	u32 source, status;
 	int err;
 
-	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
-	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
+	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
 	memirq_assert(memirq, memirq->bo);
 
 	source = xe_memirq_source_ptr(memirq) + offset;
@@ -299,9 +291,8 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
 	return 0;
 
 failed:
-	xe_sriov_err(memirq_to_xe(memirq),
-		     "Failed to setup report pages in %s (%pe)\n",
-		     guc_name(guc), ERR_PTR(err));
+	memirq_err(memirq, "Failed to setup report pages in %s (%pe)\n",
+		   guc_name(guc), ERR_PTR(err));
 	return err;
 }
 
@@ -311,13 +302,12 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
  *
  * This is part of the driver IRQ setup flow.
  *
- * This function shall only be used by the VF driver on platforms that use
+ * This function shall only be used on platforms that use
  * `Memory Based Interrupts`_.
  */
 void xe_memirq_reset(struct xe_memirq *memirq)
 {
-	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
-	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
+	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
 
 	if (memirq->bo)
 		memirq_set_enable(memirq, false);
@@ -329,13 +319,12 @@ void xe_memirq_reset(struct xe_memirq *memirq)
  *
  * This is part of the driver IRQ setup flow.
  *
- * This function shall only be used by the VF driver on platforms that use
+ * This function shall only be used on platforms that use
  * `Memory Based Interrupts`_.
  */
 void xe_memirq_postinstall(struct xe_memirq *memirq)
 {
-	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
-	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
+	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
 
 	if (memirq->bo)
 		memirq_set_enable(memirq, true);
@@ -349,9 +338,9 @@ static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
 	value = iosys_map_rd(vector, offset, u8);
 	if (value) {
 		if (value != 0xff)
-			xe_sriov_err_ratelimited(memirq_to_xe(memirq),
-						 "Unexpected memirq value %#x from %s at %u\n",
-						 value, name, offset);
+			memirq_err_ratelimited(memirq,
+					       "Unexpected memirq value %#x from %s at %u\n",
+					       value, name, offset);
 		iosys_map_wr(vector, offset, u8, 0x00);
 	}
 
-- 
2.43.2

