Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7514C2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 12:41:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB4F10E029;
	Thu, 27 Jun 2024 12:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="lTMifZa7";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFA310E228
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 12:41:13 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1719492073; bh=s24eHF+76rQcFaxLw80uzUYI9U3a6rfpQE0GWMR0LnU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lTMifZa7DVeA1nDk8wyzTX2wOO9M+J6QNsFjVX59oDpkKhF2vU1ImjYxGtzOrv4Sx
 UikzsY6x7dPtbbJkcFvltw6lY+FTVMSaCdGlvZ3lkaNs53Mnad4TnJA2my7Opi2I3Y
 c1kTzpbnsIqEQNRy1hcRrUBxTAoneAX+QYwx15yojUNe2VLOp++HIKEHXFfQ8LHckj
 kRGE9gHV8yIsxqx7jKEX86PtL9hgBFNq9t81b1wJdrnHpGQrk2ngxRRw+Fw2hxyE+i
 ceCzto/qbrxl2EfAARW7pEqtEygVSxfZgv9Lulo2cWQ0rjLKYfre5Af82ZO8O/zlOc
 cYkZMkfP9BpYQ==
Received: from dliberman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 45RCf11h2923646
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2024 15:41:01 +0300
Received: (from dliberman@localhost)
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 45RCf1gY2923645; 
 Thu, 27 Jun 2024 15:41:01 +0300
From: Dani Liberman <dliberman@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: dliberman@habana.ai, illevi@habana.ai, rodrigo.vivi@intel.com
Subject: [PATCH v2 6/8] drm/xe: move memirq out of vf
Date: Thu, 27 Jun 2024 15:40:41 +0300
Message-Id: <20240627124043.2923586-7-dliberman@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627124043.2923586-1-dliberman@habana.ai>
References: <20240627124043.2923586-1-dliberman@habana.ai>
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

From: Ilia Levi <illevi@habana.ai>

Up until now only VF used Memory Based Interrupts (memirq).
Moving it out of VF to cater for other usages.

Signed-off-by: Ilia Levi <illevi@habana.ai>
---
 drivers/gpu/drm/xe/xe_device.c       |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++--
 drivers/gpu/drm/xe/xe_guc.c          |  2 +-
 drivers/gpu/drm/xe/xe_irq.c          |  6 ++--
 drivers/gpu/drm/xe/xe_lrc.c          |  2 +-
 drivers/gpu/drm/xe/xe_memirq.c       | 46 ++++++++++------------------
 6 files changed, 26 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cfda7cb5df2c..e4c7ecefa33d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -605,7 +605,7 @@ int xe_device_probe(struct xe_device *xe)
 		if (err)
 			return err;
 		if (IS_SRIOV_VF(xe)) {
-			err = xe_memirq_init(&tile->sriov.vf.memirq);
+			err = xe_memirq_init(&tile->memirq);
 			if (err)
 				return err;
 		}
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0d772f8d4b40..377e17a653fd 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -195,14 +195,14 @@ struct xe_tile {
 			struct xe_lmtt lmtt;
 		} pf;
 		struct {
-			/** @sriov.vf.memirq: Memory Based Interrupts. */
-			struct xe_memirq memirq;
-
 			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
 			struct drm_mm_node ggtt_balloon[2];
 		} vf;
 	} sriov;
 
+	/** @memirq: Memory Based Interrupts. */
+	struct xe_memirq memirq;
+
 	/** @migrate: Migration helper for vram blits and clearing */
 	struct xe_migrate *migrate;
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index eb655cee19f7..5ffede3eb268 100644
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
index cf4f523b7fae..3fdd297516ab 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -568,7 +568,7 @@ static void vf_irq_reset(struct xe_device *xe)
 
 	for_each_tile(tile, xe, id) {
 		if (xe_device_has_memirq(xe))
-			xe_memirq_reset(&tile->sriov.vf.memirq);
+			xe_memirq_reset(&tile->memirq);
 		else
 			gt_irq_reset(tile);
 	}
@@ -611,7 +611,7 @@ static void vf_irq_postinstall(struct xe_device *xe)
 
 	for_each_tile(tile, xe, id)
 		if (xe_device_has_memirq(xe))
-			xe_memirq_postinstall(&tile->sriov.vf.memirq);
+			xe_memirq_postinstall(&tile->memirq);
 
 	if (GRAPHICS_VERx100(xe) < 1210)
 		xelp_intr_enable(xe, true);
@@ -654,7 +654,7 @@ static irqreturn_t vf_mem_irq_handler(int irq, void *arg)
 	spin_unlock(&xe->irq.lock);
 
 	for_each_tile(tile, xe, id)
-		xe_memirq_handler(&tile->sriov.vf.memirq);
+		xe_memirq_handler(&tile->memirq);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 94ff62e1d95e..838609915916 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -596,7 +596,7 @@ static void set_context_control(u32 *regs, struct xe_hw_engine *hwe)
 
 static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
 {
-	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->sriov.vf.memirq;
+	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->memirq;
 	struct xe_device *xe = gt_to_xe(hwe->gt);
 
 	if (!IS_SRIOV_VF(xe) || !xe_device_has_memirq(xe))
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 95b6e9d7b7db..0db0726b76f3 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -19,15 +19,13 @@
 #include "xe_hw_engine.h"
 #include "xe_map.h"
 #include "xe_memirq.h"
-#include "xe_sriov.h"
-#include "xe_sriov_printk.h"
 
 #define memirq_assert(m, condition)	xe_tile_assert(memirq_to_tile(m), condition)
-#define memirq_debug(m, msg...)		xe_sriov_dbg_verbose(memirq_to_xe(m), "MEMIRQ: " msg)
+#define memirq_debug(m, msg...)		drm_dbg(&memirq_to_xe(m)->drm, "MEMIRQ: " msg)
 
 static struct xe_tile *memirq_to_tile(struct xe_memirq *memirq)
 {
-	return container_of(memirq, struct xe_tile, sriov.vf.memirq);
+	return container_of(memirq, struct xe_tile, memirq);
 }
 
 static struct xe_device *memirq_to_xe(struct xe_memirq *memirq)
@@ -157,8 +155,8 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 	return drmm_add_action_or_reset(&xe->drm, __release_xe_bo, memirq->bo);
 
 out:
-	xe_sriov_err(memirq_to_xe(memirq),
-		     "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
+	drm_err(&memirq_to_xe(memirq)->drm,
+		"Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
 	return err;
 }
 
@@ -178,9 +176,7 @@ static void memirq_set_enable(struct xe_memirq *memirq, bool enable)
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
@@ -190,8 +186,6 @@ int xe_memirq_init(struct xe_memirq *memirq)
 	struct xe_device *xe = memirq_to_xe(memirq);
 	int err;
 
-	memirq_assert(memirq, IS_SRIOV_VF(xe));
-
 	if (!xe_device_has_memirq(xe))
 		return 0;
 
@@ -209,14 +203,13 @@ int xe_memirq_init(struct xe_memirq *memirq)
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
 	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
 	memirq_assert(memirq, memirq->bo);
 
@@ -227,14 +220,13 @@ u32 xe_memirq_source_ptr(struct xe_memirq *memirq)
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
 	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
 	memirq_assert(memirq, memirq->bo);
 
@@ -245,14 +237,13 @@ u32 xe_memirq_status_ptr(struct xe_memirq *memirq)
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
 	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
 	memirq_assert(memirq, memirq->bo);
 
@@ -267,7 +258,7 @@ u32 xe_memirq_enable_ptr(struct xe_memirq *memirq)
  * Register `Interrupt Source Report Page`_ and `Interrupt Status Report Page`_
  * to be used by the GuC when `Memory Based Interrupts`_ are required.
  *
- * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
+ * Shall be called when `Memory Based Interrupts`_ are used
  * and xe_memirq_init() didn't fail.
  *
  * Return: 0 on success or a negative error code on failure.
@@ -279,7 +270,6 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
 	u32 source, status;
 	int err;
 
-	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
 	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
 	memirq_assert(memirq, memirq->bo);
 
@@ -299,9 +289,9 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
 	return 0;
 
 failed:
-	xe_sriov_err(memirq_to_xe(memirq),
-		     "Failed to setup report pages in %s (%pe)\n",
-		     guc_name(guc), ERR_PTR(err));
+	drm_err(&memirq_to_xe(memirq)->drm,
+		"Failed to setup report pages in %s (%pe)\n",
+		guc_name(guc), ERR_PTR(err));
 	return err;
 }
 
@@ -311,12 +301,11 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
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
 	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
 
 	if (memirq->bo)
@@ -329,12 +318,11 @@ void xe_memirq_reset(struct xe_memirq *memirq)
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
 	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
 
 	if (memirq->bo)
@@ -349,9 +337,9 @@ static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
 	value = iosys_map_rd(vector, offset, u8);
 	if (value) {
 		if (value != 0xff)
-			xe_sriov_err_ratelimited(memirq_to_xe(memirq),
-						 "Unexpected memirq value %#x from %s at %u\n",
-						 value, name, offset);
+			drm_err_ratelimited(&memirq_to_xe(memirq)->drm,
+					    "Unexpected memirq value %#x from %s at %u\n",
+					    value, name, offset);
 		iosys_map_wr(vector, offset, u8, 0x00);
 	}
 
-- 
2.34.1

