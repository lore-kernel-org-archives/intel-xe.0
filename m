Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9481BC36014
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 11:24:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6357A10E1B0;
	Tue, 17 Sep 2024 11:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="BDAqJkQE";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDCCE10E211
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 11:24:00 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1726572233; bh=8tHOmflhhbOHNnDOy+Ergsyj8ip+uyoigqAc0fI00Ew=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BDAqJkQEqMcfhds8/rFTJj67xtpxQlKtwDWJ1PRokHo7C60OtT3WcIjgeckeUjGO3
 tvAUgy+0LYn4f+e6ojx3hOZ2bJ1aZav5ijCEU8B/+8FYzcab1mKLNE4BKFzQk9wrnR
 KadtQl6nGYMjHCMYeD+2U42l3VwrkQE4iaPzY9QgVBAnKNRgw7Xpd71CF/0/pUQFfY
 JabDQxdCxk3qFCOKoBSr6PuK5AK1PfTZJIcbUWvxdrxBFwOUT8MXcQ54k5RQSw2z0Y
 QhSpl7dgXIG770+Xvrs+/FVn44q6mG02qcQ2wpcqnbcAuB5p3EuOeVicAQUDgKlLK5
 VK24VlHCGF0iw==
Received: from illevi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by illevi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 48HBNmuN1242354; Tue, 17 Sep 2024 14:23:48 +0300
From: Ilia Levi <illevi@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, michal.wajdeczko@intel.com, jonathan.cavitt@intel.com,
 koby.elbaz@intel.com, yaron.avizrat@intel.com
Subject: [PATCH v5 3/5] drm/xe: move memirq out of VF
Date: Tue, 17 Sep 2024 14:23:05 +0300
Message-ID: <20240917112307.1242329-4-illevi@habana.ai>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240917112307.1242329-1-illevi@habana.ai>
References: <20240917112307.1242329-1-illevi@habana.ai>
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

From: Ilia Levi <ilia.levi@intel.com>

Up until now only VF used Memory Based Interrupts (memirq).
Moving it out of VF to cater for other usages, specifically MSI-X.

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++--
 drivers/gpu/drm/xe/xe_guc.c          |  2 +-
 drivers/gpu/drm/xe/xe_irq.c          |  6 ++--
 drivers/gpu/drm/xe/xe_lrc.c          |  2 +-
 drivers/gpu/drm/xe/xe_memirq.c       | 48 ++++++++++++++++------------
 6 files changed, 36 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4719d9b04069..bccd985f6c62 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -671,7 +671,7 @@ int xe_device_probe(struct xe_device *xe)
 		err = xe_ggtt_init_early(tile->mem.ggtt);
 		if (err)
 			return err;
-		err = xe_memirq_init(&tile->sriov.vf.memirq);
+		err = xe_memirq_init(&tile->memirq);
 		if (err)
 			return err;
 	}
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c92df0a2423f..2eb68bf66062 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -226,14 +226,14 @@ struct xe_tile {
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
index 1eb5bb7e8771..b6cd5e941f19 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -866,7 +866,7 @@ int xe_guc_enable_communication(struct xe_guc *guc)
 		struct xe_gt *gt = guc_to_gt(guc);
 		struct xe_tile *tile = gt_to_tile(gt);
 
-		err = xe_memirq_init_guc(&tile->sriov.vf.memirq, guc);
+		err = xe_memirq_init_guc(&tile->memirq, guc);
 		if (err)
 			return err;
 	} else {
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 250036abec52..5eb7775c0fd2 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -567,7 +567,7 @@ static void vf_irq_reset(struct xe_device *xe)
 
 	for_each_tile(tile, xe, id) {
 		if (xe_device_has_memirq(xe))
-			xe_memirq_reset(&tile->sriov.vf.memirq);
+			xe_memirq_reset(&tile->memirq);
 		else
 			gt_irq_reset(tile);
 	}
@@ -610,7 +610,7 @@ static void vf_irq_postinstall(struct xe_device *xe)
 
 	for_each_tile(tile, xe, id)
 		if (xe_device_has_memirq(xe))
-			xe_memirq_postinstall(&tile->sriov.vf.memirq);
+			xe_memirq_postinstall(&tile->memirq);
 
 	if (GRAPHICS_VERx100(xe) < 1210)
 		xelp_intr_enable(xe, true);
@@ -653,7 +653,7 @@ static irqreturn_t vf_mem_irq_handler(int irq, void *arg)
 	spin_unlock(&xe->irq.lock);
 
 	for_each_tile(tile, xe, id)
-		xe_memirq_handler(&tile->sriov.vf.memirq);
+		xe_memirq_handler(&tile->memirq);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 50d9521ba9f5..e40f48f4240f 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -599,7 +599,7 @@ static void set_context_control(u32 *regs, struct xe_hw_engine *hwe)
 
 static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
 {
-	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->sriov.vf.memirq;
+	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->memirq;
 	struct xe_device *xe = gt_to_xe(hwe->gt);
 
 	if (!xe_device_uses_memirq(xe))
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 464cb9d7fee2..8b12209d995a 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -19,15 +19,25 @@
 #include "xe_hw_engine.h"
 #include "xe_map.h"
 #include "xe_memirq.h"
-#include "xe_sriov.h"
-#include "xe_sriov_printk.h"
 
 #define memirq_assert(m, condition)	xe_tile_assert(memirq_to_tile(m), condition)
-#define memirq_debug(m, msg...)		xe_sriov_dbg_verbose(memirq_to_xe(m), "MEMIRQ: " msg)
+#define memirq_printk(m, _level, _fmt, ...)			\
+	drm_##_level(&memirq_to_xe(m)->drm, "MEMIRQ%u: " _fmt,	\
+		     memirq_to_tile(m)->id, ##__VA_ARGS__)
+
+#ifdef CONFIG_DRM_XE_DEBUG_MEMIRQ
+#define memirq_debug(m, _fmt, ...)	memirq_printk(m, dbg, _fmt, ##__VA_ARGS__)
+#else
+#define memirq_debug(...)
+#endif
+
+#define memirq_err(m, _fmt, ...)	memirq_printk(m, err, _fmt, ##__VA_ARGS__)
+#define memirq_err_ratelimited(m, _fmt, ...)	\
+	memirq_printk(m, err_ratelimited, _fmt, ##__VA_ARGS__)
 
 static struct xe_tile *memirq_to_tile(struct xe_memirq *memirq)
 {
-	return container_of(memirq, struct xe_tile, sriov.vf.memirq);
+	return container_of(memirq, struct xe_tile, memirq);
 }
 
 static struct xe_device *memirq_to_xe(struct xe_memirq *memirq)
@@ -157,8 +167,7 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 	return drmm_add_action_or_reset(&xe->drm, __release_xe_bo, memirq->bo);
 
 out:
-	xe_sriov_err(memirq_to_xe(memirq),
-		     "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
+	memirq_err(memirq, "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
 	return err;
 }
 
@@ -178,9 +187,7 @@ static void memirq_set_enable(struct xe_memirq *memirq, bool enable)
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
@@ -207,7 +214,7 @@ int xe_memirq_init(struct xe_memirq *memirq)
  * xe_memirq_source_ptr - Get GGTT's offset of the `Interrupt Source Report Page`_.
  * @memirq: the &xe_memirq to query
  *
- * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
+ * Shall be called when `Memory Based Interrupts`_ are used
  * and xe_memirq_init() didn't fail.
  *
  * Return: GGTT's offset of the `Interrupt Source Report Page`_.
@@ -224,7 +231,7 @@ u32 xe_memirq_source_ptr(struct xe_memirq *memirq)
  * xe_memirq_status_ptr - Get GGTT's offset of the `Interrupt Status Report Page`_.
  * @memirq: the &xe_memirq to query
  *
- * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
+ * Shall be called when `Memory Based Interrupts`_ are used
  * and xe_memirq_init() didn't fail.
  *
  * Return: GGTT's offset of the `Interrupt Status Report Page`_.
@@ -241,7 +248,7 @@ u32 xe_memirq_status_ptr(struct xe_memirq *memirq)
  * xe_memirq_enable_ptr - Get GGTT's offset of the Interrupt Enable Mask.
  * @memirq: the &xe_memirq to query
  *
- * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
+ * Shall be called when `Memory Based Interrupts`_ are used
  * and xe_memirq_init() didn't fail.
  *
  * Return: GGTT's offset of the Interrupt Enable Mask.
@@ -262,7 +269,7 @@ u32 xe_memirq_enable_ptr(struct xe_memirq *memirq)
  * Register `Interrupt Source Report Page`_ and `Interrupt Status Report Page`_
  * to be used by the GuC when `Memory Based Interrupts`_ are required.
  *
- * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
+ * Shall be called when `Memory Based Interrupts`_ are used
  * and xe_memirq_init() didn't fail.
  *
  * Return: 0 on success or a negative error code on failure.
@@ -293,9 +300,8 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
 	return 0;
 
 failed:
-	xe_sriov_err(memirq_to_xe(memirq),
-		     "Failed to setup report pages in %s (%pe)\n",
-		     guc_name(guc), ERR_PTR(err));
+	memirq_err(memirq, "Failed to setup report pages in %s (%pe)\n",
+		   guc_name(guc), ERR_PTR(err));
 	return err;
 }
 
@@ -305,7 +311,7 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
  *
  * This is part of the driver IRQ setup flow.
  *
- * This function shall only be used by the VF driver on platforms that use
+ * This function shall only be used on platforms that use
  * `Memory Based Interrupts`_.
  */
 void xe_memirq_reset(struct xe_memirq *memirq)
@@ -322,7 +328,7 @@ void xe_memirq_reset(struct xe_memirq *memirq)
  *
  * This is part of the driver IRQ setup flow.
  *
- * This function shall only be used by the VF driver on platforms that use
+ * This function shall only be used on platforms that use
  * `Memory Based Interrupts`_.
  */
 void xe_memirq_postinstall(struct xe_memirq *memirq)
@@ -341,9 +347,9 @@ static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
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

