Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82846C41513
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 07:33:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E3010E9C9;
	Wed, 17 Jul 2024 07:33:28 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71E510E9D4
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 07:33:22 +0000 (UTC)
Received: internal info suppressed
Received: from illevi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by illevi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 46H7WN0t1135105; Wed, 17 Jul 2024 10:33:08 +0300
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, dliberman@habana.ai,
 niranjana.vishwanathapura@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v3 05/11] drm/xe: memirq infra changes for msix
Date: Wed, 17 Jul 2024 10:32:17 +0300
Message-ID: <20240717073223.1135072-6-ilia.levi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240717073223.1135072-1-ilia.levi@intel.com>
References: <20240717073223.1135072-1-ilia.levi@intel.com>
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

When using MSI-X, hw engines report interrupt status and source to engine
instance 0. We pass a flag to memirq initialization routine for this case.

For this scenario, in order to differentiate between the engines, we need
to pass different status/source pointers in the lrc.

The requirements on those pointers are:
- Interrupt status should be 4KB aligned
- Interrupt source should be 64 bytes aligned

To accommodate this, we duplicate the current memirq page layout -
allocating a page for each engine instance and pass this page in the lrc.
Note that the same page can be reused for different engine types.
For example, an lrc executing on ccs #x will have pointers to page #x,
and an lrc executing on bcs #x will have the same pointers. Thus, to
locate the proper page, the pointer accessors were modified to receive
the hw engine.

In addition, this patch exposes an interrupt processing handler for a
single hw engine.

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c          |  4 +-
 drivers/gpu/drm/xe/xe_memirq.c       | 77 ++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_memirq.h       |  8 +--
 drivers/gpu/drm/xe/xe_memirq_types.h |  6 ++-
 5 files changed, 68 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index eb2e4a3c7e0b..93970dbda4d8 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -608,7 +608,7 @@ int xe_device_probe(struct xe_device *xe)
 		if (err)
 			return err;
 		if (IS_SRIOV_VF(xe)) {
-			err = xe_memirq_init(&tile->memirq);
+			err = xe_memirq_init(&tile->memirq, false);
 			if (err)
 				return err;
 		}
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 838609915916..7cb23f66b76b 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -610,9 +610,9 @@ static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
 	regs[CTX_LRI_INT_REPORT_PTR] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(2) |
 				       MI_LRI_LRM_CS_MMIO | MI_LRI_FORCE_POSTED;
 	regs[CTX_INT_STATUS_REPORT_REG] = RING_INT_STATUS_RPT_PTR(0).addr;
-	regs[CTX_INT_STATUS_REPORT_PTR] = xe_memirq_status_ptr(memirq);
+	regs[CTX_INT_STATUS_REPORT_PTR] = xe_memirq_status_ptr(memirq, hwe);
 	regs[CTX_INT_SRC_REPORT_REG] = RING_INT_SRC_RPT_PTR(0).addr;
-	regs[CTX_INT_SRC_REPORT_PTR] = xe_memirq_source_ptr(memirq);
+	regs[CTX_INT_SRC_REPORT_PTR] = xe_memirq_source_ptr(memirq, hwe);
 }
 
 static int lrc_ring_mi_mode(struct xe_hw_engine *hwe)
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 0db0726b76f3..fc951af73c10 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -112,18 +112,18 @@ static void __release_xe_bo(struct drm_device *drm, void *arg)
 	xe_bo_unpin_map_no_vm(bo);
 }
 
-static int memirq_alloc_pages(struct xe_memirq *memirq)
+static int memirq_alloc_pages(struct xe_memirq *memirq, size_t bo_size)
 {
 	struct xe_device *xe = memirq_to_xe(memirq);
 	struct xe_tile *tile = memirq_to_tile(memirq);
 	struct xe_bo *bo;
 	int err;
 
-	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_SOURCE_OFFSET, SZ_64));
-	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_STATUS_OFFSET, SZ_4K));
+	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_SOURCE_OFFSET(0), SZ_64));
+	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_STATUS_OFFSET(0), SZ_4K));
 
 	/* XXX: convert to managed bo */
-	bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
+	bo = xe_bo_create_pin_map(xe, tile, NULL, bo_size,
 				  ttm_bo_type_kernel,
 				  XE_BO_FLAG_SYSTEM |
 				  XE_BO_FLAG_GGTT |
@@ -138,11 +138,11 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 	memirq_assert(memirq, !xe_bo_is_vram(bo));
 	memirq_assert(memirq, !memirq->bo);
 
-	iosys_map_memset(&bo->vmap, 0, 0, SZ_4K);
+	iosys_map_memset(&bo->vmap, 0, 0, bo_size);
 
 	memirq->bo = bo;
-	memirq->source = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_SOURCE_OFFSET);
-	memirq->status = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_STATUS_OFFSET);
+	memirq->source = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_SOURCE_OFFSET(0));
+	memirq->status = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_STATUS_OFFSET(0));
 	memirq->mask = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_ENABLE_OFFSET);
 
 	memirq_assert(memirq, !memirq->source.is_iomem);
@@ -150,7 +150,7 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 	memirq_assert(memirq, !memirq->mask.is_iomem);
 
 	memirq_debug(memirq, "page offsets: source %#x status %#x\n",
-		     xe_memirq_source_ptr(memirq), xe_memirq_status_ptr(memirq));
+		     xe_memirq_source_ptr(memirq, NULL), xe_memirq_status_ptr(memirq, NULL));
 
 	return drmm_add_action_or_reset(&xe->drm, __release_xe_bo, memirq->bo);
 
@@ -170,6 +170,7 @@ static void memirq_set_enable(struct xe_memirq *memirq, bool enable)
 /**
  * xe_memirq_init - Initialize data used by `Memory Based Interrupts`_.
  * @memirq: the &xe_memirq to initialize
+ * @reports_to_e0: Does the HW report status and source to engine instance 0?
  *
  * Allocate `Interrupt Source Report Page`_ and `Interrupt Status Report Page`_
  * used by `Memory Based Interrupts`_.
@@ -181,15 +182,19 @@ static void memirq_set_enable(struct xe_memirq *memirq, bool enable)
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_memirq_init(struct xe_memirq *memirq)
+int xe_memirq_init(struct xe_memirq *memirq, bool reports_to_e0)
 {
 	struct xe_device *xe = memirq_to_xe(memirq);
+	size_t bo_size;
 	int err;
 
 	if (!xe_device_has_memirq(xe))
 		return 0;
 
-	err = memirq_alloc_pages(memirq);
+	memirq->reports_to_e0 = reports_to_e0;
+	bo_size = reports_to_e0 ? XE_HW_ENGINE_MAX_INSTANCE * SZ_4K : SZ_4K;
+
+	err = memirq_alloc_pages(memirq, bo_size);
 	if (unlikely(err))
 		return err;
 
@@ -202,35 +207,47 @@ int xe_memirq_init(struct xe_memirq *memirq)
 /**
  * xe_memirq_source_ptr - Get GGTT's offset of the `Interrupt Source Report Page`_.
  * @memirq: the &xe_memirq to query
+ * @hwe: the hw engine for which we want the report page
  *
  * Shall be called when `Memory Based Interrupts`_ are used
  * and xe_memirq_init() didn't fail.
  *
  * Return: GGTT's offset of the `Interrupt Source Report Page`_.
  */
-u32 xe_memirq_source_ptr(struct xe_memirq *memirq)
+u32 xe_memirq_source_ptr(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
 {
+	u16 instance = 0;
+
+	if (memirq->reports_to_e0 && hwe)
+		instance = hwe->instance;
+
 	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
 	memirq_assert(memirq, memirq->bo);
 
-	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_SOURCE_OFFSET;
+	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_SOURCE_OFFSET(instance);
 }
 
 /**
  * xe_memirq_status_ptr - Get GGTT's offset of the `Interrupt Status Report Page`_.
  * @memirq: the &xe_memirq to query
+ * @hwe: the hw engine for which we want the report page
  *
  * Shall be called when `Memory Based Interrupts`_ are used
  * and xe_memirq_init() didn't fail.
  *
  * Return: GGTT's offset of the `Interrupt Status Report Page`_.
  */
-u32 xe_memirq_status_ptr(struct xe_memirq *memirq)
+u32 xe_memirq_status_ptr(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
 {
+	u16 instance = 0;
+
+	if (memirq->reports_to_e0 && hwe)
+		instance = hwe->instance;
+
 	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
 	memirq_assert(memirq, memirq->bo);
 
-	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_STATUS_OFFSET;
+	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_STATUS_OFFSET(instance);
 }
 
 /**
@@ -273,8 +290,8 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
 	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
 	memirq_assert(memirq, memirq->bo);
 
-	source = xe_memirq_source_ptr(memirq) + offset;
-	status = xe_memirq_status_ptr(memirq) + offset * SZ_16;
+	source = xe_memirq_source_ptr(memirq, NULL) + offset;
+	status = xe_memirq_status_ptr(memirq, NULL) + offset * SZ_16;
 
 	err = xe_guc_self_cfg64(guc, GUC_KLV_SELF_CFG_MEMIRQ_SOURCE_ADDR_KEY,
 				source);
@@ -366,6 +383,28 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
 		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
 }
 
+/**
+ * xe_memirq_hwe_handler - Check and process interrupts for a specific HW engine.
+ * @memirq: the &xe_memirq
+ * @hwe: the hw engine to process
+ *
+ * This function reads and dispatches `Memory Based Interrupts` for the provided HW engine.
+ */
+void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
+{
+	u16 offset = memirq->reports_to_e0 ? hwe->e0_irq_offset : hwe->irq_offset;
+	u16 instance = memirq->reports_to_e0 ? hwe->instance : 0;
+
+	struct iosys_map src_offset = IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
+						XE_MEMIRQ_SOURCE_OFFSET(instance));
+	if (memirq_received(memirq, &src_offset, offset, "SRC")) {
+		struct iosys_map status_offset = IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
+							XE_MEMIRQ_STATUS_OFFSET(instance) +
+							offset * SZ_16);
+		memirq_dispatch_engine(memirq, &status_offset, hwe);
+	}
+}
+
 /**
  * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
  * @memirq: the &xe_memirq
@@ -394,11 +433,7 @@ void xe_memirq_handler(struct xe_memirq *memirq)
 			continue;
 
 		for_each_hw_engine(hwe, gt, id) {
-			if (memirq_received(memirq, &memirq->source, hwe->irq_offset, "SRC")) {
-				map = IOSYS_MAP_INIT_OFFSET(&memirq->status,
-							    hwe->irq_offset * SZ_16);
-				memirq_dispatch_engine(memirq, &map, hwe);
-			}
+			xe_memirq_hwe_handler(memirq, hwe);
 		}
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memirq.h
index 2d40d03c3095..8a9334482a9b 100644
--- a/drivers/gpu/drm/xe/xe_memirq.h
+++ b/drivers/gpu/drm/xe/xe_memirq.h
@@ -10,15 +10,17 @@
 
 struct xe_guc;
 struct xe_memirq;
+struct xe_hw_engine;
 
-int xe_memirq_init(struct xe_memirq *memirq);
+int xe_memirq_init(struct xe_memirq *memirq, bool reports_to_e0);
 
-u32 xe_memirq_source_ptr(struct xe_memirq *memirq);
-u32 xe_memirq_status_ptr(struct xe_memirq *memirq);
+u32 xe_memirq_source_ptr(struct xe_memirq *memirq, struct xe_hw_engine *hwe);
+u32 xe_memirq_status_ptr(struct xe_memirq *memirq, struct xe_hw_engine *hwe);
 u32 xe_memirq_enable_ptr(struct xe_memirq *memirq);
 
 void xe_memirq_reset(struct xe_memirq *memirq);
 void xe_memirq_postinstall(struct xe_memirq *memirq);
+void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe);
 void xe_memirq_handler(struct xe_memirq *memirq);
 
 int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_memirq_types.h b/drivers/gpu/drm/xe/xe_memirq_types.h
index 625b6b8736cc..078a1500c918 100644
--- a/drivers/gpu/drm/xe/xe_memirq_types.h
+++ b/drivers/gpu/drm/xe/xe_memirq_types.h
@@ -11,9 +11,9 @@
 struct xe_bo;
 
 /* ISR */
-#define XE_MEMIRQ_STATUS_OFFSET		0x0
+#define XE_MEMIRQ_STATUS_OFFSET(inst)	((inst) * SZ_4K + 0x0)
 /* IIR */
-#define XE_MEMIRQ_SOURCE_OFFSET		0x400
+#define XE_MEMIRQ_SOURCE_OFFSET(inst)	((inst) * SZ_4K + 0x400)
 /* IMR */
 #define XE_MEMIRQ_ENABLE_OFFSET		0x440
 
@@ -25,6 +25,7 @@ struct xe_bo;
  * @status: iosys pointer to `Interrupt Status Report Page`_.
  * @mask: iosys pointer to Interrupt Enable Mask.
  * @enabled: internal flag used to control processing of the interrupts.
+ * @reports_to_e0: configuration parameter (see xe_memirq_init)
  */
 struct xe_memirq {
 	struct xe_bo *bo;
@@ -32,6 +33,7 @@ struct xe_memirq {
 	struct iosys_map status;
 	struct iosys_map mask;
 	bool enabled;
+	bool reports_to_e0;
 };
 
 #endif
-- 
2.43.2

