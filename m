Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423F9EEB56A
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 08:55:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B8C10EB15;
	Thu, 12 Sep 2024 08:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="mAk37yiw";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02DD010E208
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 08:54:57 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1726131291; bh=3CfDXz8JT8C8109kAr3jTY3E5wyPmYQOXvsTjS+ygwc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mAk37yiwGQvkOfkP2v64gtgll7MeAWwaEEMFT5niKu+3jkiVsemkdBotmStOA5d3t
 SD8Lw689UY7IaRXM/uS5M+Ifj0DuKSmFH63LDlrPKSNeyyya4N//7wfElaL7SbY/fq
 W356eWBsbsdUUeDe+pXz0FyFEOYAtDVwVhkxIQt1qDfM1Mz1OsWK9d5+60EWJb2Ou5
 S43EoDEPsijdoOjv+FybVTlYjmRQgzT7uPNSQTDn1PiCHb/OdwdiRl9Wy4msWLNky0
 nutOei5r0v10p6j26UONE6QPoBLIW5ensvAtbHlEtAOnXMSjIxzIlAxRQ/gBGkjPwq
 nvdnLNeq4bWBQ==
Received: from illevi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by illevi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 48C8siWV737034; Thu, 12 Sep 2024 11:54:44 +0300
From: Ilia Levi <illevi@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, michal.wajdeczko@intel.com, jonathan.cavitt@intel.com,
 niranjana.vishwanathapura@intel.com, koby.elbaz@intel.com,
 yaron.avizrat@intel.com
Subject: [PATCH v4 1/3] drm/xe: move memirq out of VF
Date: Thu, 12 Sep 2024 11:54:36 +0300
Message-ID: <20240912085438.737015-2-illevi@habana.ai>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240912085438.737015-1-illevi@habana.ai>
References: <20240912085438.737015-1-illevi@habana.ai>
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
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug     | 12 +++++
 drivers/gpu/drm/xe/xe_device.c       |  8 ++-
 drivers/gpu/drm/xe/xe_device.h       | 13 +++++
 drivers/gpu/drm/xe/xe_device_types.h |  6 +--
 drivers/gpu/drm/xe/xe_guc.c          |  2 +-
 drivers/gpu/drm/xe/xe_irq.c          | 40 ++++++++-------
 drivers/gpu/drm/xe/xe_lrc.c          |  4 +-
 drivers/gpu/drm/xe/xe_memirq.c       | 73 ++++++++++++++--------------
 8 files changed, 93 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index bc177368af6c..2de0de41b8dd 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -40,9 +40,21 @@ config DRM_XE_DEBUG_VM
 
 	  If in doubt, say "N".
 
+config DRM_XE_DEBUG_MEMIRQ
+	bool "Enable extra memirq debugging"
+	default n
+	help
+	  Choose this option to enable additional debugging info for
+	  memory based interrupts.
+
+	  Recommended for driver developers only.
+
+	  If in doubt, say "N".
+
 config DRM_XE_DEBUG_SRIOV
 	bool "Enable extra SR-IOV debugging"
 	default n
+	select DRM_XE_DEBUG_MEMIRQ
 	help
 	  Enable extra SR-IOV debugging info.
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4d3c794f134c..bccd985f6c62 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -671,11 +671,9 @@ int xe_device_probe(struct xe_device *xe)
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
index ca8d8ef6342b..65b81160460b 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -10,6 +10,7 @@
 
 #include "xe_device_types.h"
 #include "xe_gt_types.h"
+#include "xe_sriov.h"
 
 static inline struct xe_device *to_xe_device(const struct drm_device *dev)
 {
@@ -159,6 +160,18 @@ static inline bool xe_device_has_memirq(struct xe_device *xe)
 	return GRAPHICS_VERx100(xe) >= 1250;
 }
 
+static inline bool xe_device_has_msix(struct xe_device *xe)
+{
+	/* TODO: change this when MSI-X support is fully integrated */
+	return false;
+}
+
+static inline bool xe_device_uses_memirq(struct xe_device *xe)
+{
+	return (IS_SRIOV_VF(xe) || xe_device_has_msix(xe)) &&
+		xe_device_has_memirq(xe);
+}
+
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
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
index 07577b418205..8fec8982c9c8 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -135,7 +135,7 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 	u32 gsc_mask = 0;
 	u32 heci_mask = 0;
 
-	if (IS_SRIOV_VF(xe) && xe_device_has_memirq(xe))
+	if (xe_device_uses_memirq(xe))
 		return;
 
 	if (xe_device_uc_enabled(xe)) {
@@ -560,17 +560,15 @@ static void vf_irq_reset(struct xe_device *xe)
 
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
@@ -578,6 +576,11 @@ static void xe_irq_reset(struct xe_device *xe)
 	struct xe_tile *tile;
 	u8 id;
 
+	if (xe_device_uses_memirq(xe)) {
+		for_each_tile(tile, xe, id)
+			xe_memirq_reset(&tile->memirq);
+	}
+
 	if (IS_SRIOV_VF(xe))
 		return vf_irq_reset(xe);
 
@@ -605,13 +608,6 @@ static void xe_irq_reset(struct xe_device *xe)
 
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
@@ -620,6 +616,14 @@ static void vf_irq_postinstall(struct xe_device *xe)
 
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
 
@@ -653,7 +657,7 @@ static irqreturn_t vf_mem_irq_handler(int irq, void *arg)
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
index 95b6e9d7b7db..91a1a91fa930 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -19,15 +19,28 @@
 #include "xe_hw_engine.h"
 #include "xe_map.h"
 #include "xe_memirq.h"
-#include "xe_sriov.h"
-#include "xe_sriov_printk.h"
 
 #define memirq_assert(m, condition)	xe_tile_assert(memirq_to_tile(m), condition)
-#define memirq_debug(m, msg...)		xe_sriov_dbg_verbose(memirq_to_xe(m), "MEMIRQ: " msg)
+#define __memirq_msg(m, msg_method, fmt, ...)					\
+	do {									\
+		struct xe_memirq *__m = m;	/* avoid MACRO_ARG_REUSE */	\
+		msg_method(&memirq_to_xe(__m)->drm, "MEMIRQ (tile %u): " fmt,	\
+			   memirq_to_tile(__m)->id, ##__VA_ARGS__);		\
+	} while (0)
+
+#ifdef CONFIG_DRM_XE_DEBUG_MEMIRQ
+#define memirq_debug(m, fmt, ...)	__memirq_msg(m, drm_dbg, fmt, ##__VA_ARGS__)
+#else
+#define memirq_debug(...)
+#endif
+
+#define memirq_err(m, fmt, ...)		__memirq_msg(m, drm_err, fmt, ##__VA_ARGS__)
+#define memirq_err_ratelimited(m, fmt, ...)	\
+	__memirq_msg(m, drm_err_ratelimited, fmt, ##__VA_ARGS__)
 
 static struct xe_tile *memirq_to_tile(struct xe_memirq *memirq)
 {
-	return container_of(memirq, struct xe_tile, sriov.vf.memirq);
+	return container_of(memirq, struct xe_tile, memirq);
 }
 
 static struct xe_device *memirq_to_xe(struct xe_memirq *memirq)
@@ -157,8 +170,7 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 	return drmm_add_action_or_reset(&xe->drm, __release_xe_bo, memirq->bo);
 
 out:
-	xe_sriov_err(memirq_to_xe(memirq),
-		     "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
+	memirq_err(memirq, "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
 	return err;
 }
 
@@ -178,9 +190,7 @@ static void memirq_set_enable(struct xe_memirq *memirq, bool enable)
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
@@ -190,9 +200,7 @@ int xe_memirq_init(struct xe_memirq *memirq)
 	struct xe_device *xe = memirq_to_xe(memirq);
 	int err;
 
-	memirq_assert(memirq, IS_SRIOV_VF(xe));
-
-	if (!xe_device_has_memirq(xe))
+	if (!xe_device_uses_memirq(xe))
 		return 0;
 
 	err = memirq_alloc_pages(memirq);
@@ -209,15 +217,14 @@ int xe_memirq_init(struct xe_memirq *memirq)
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
@@ -227,15 +234,14 @@ u32 xe_memirq_source_ptr(struct xe_memirq *memirq)
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
@@ -245,15 +251,14 @@ u32 xe_memirq_status_ptr(struct xe_memirq *memirq)
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
@@ -267,7 +272,7 @@ u32 xe_memirq_enable_ptr(struct xe_memirq *memirq)
  * Register `Interrupt Source Report Page`_ and `Interrupt Status Report Page`_
  * to be used by the GuC when `Memory Based Interrupts`_ are required.
  *
- * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
+ * Shall be called when `Memory Based Interrupts`_ are used
  * and xe_memirq_init() didn't fail.
  *
  * Return: 0 on success or a negative error code on failure.
@@ -279,8 +284,7 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
 	u32 source, status;
 	int err;
 
-	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
-	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
+	memirq_assert(memirq, xe_device_uses_memirq(memirq_to_xe(memirq)));
 	memirq_assert(memirq, memirq->bo);
 
 	source = xe_memirq_source_ptr(memirq) + offset;
@@ -299,9 +303,8 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
 	return 0;
 
 failed:
-	xe_sriov_err(memirq_to_xe(memirq),
-		     "Failed to setup report pages in %s (%pe)\n",
-		     guc_name(guc), ERR_PTR(err));
+	memirq_err(memirq, "Failed to setup report pages in %s (%pe)\n",
+		   guc_name(guc), ERR_PTR(err));
 	return err;
 }
 
@@ -311,13 +314,12 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
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
@@ -329,13 +331,12 @@ void xe_memirq_reset(struct xe_memirq *memirq)
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
@@ -349,9 +350,9 @@ static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
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

