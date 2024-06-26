Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2082AC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 10:34:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB99310E09B;
	Wed, 26 Jun 2024 10:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="un+aaebZ";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59DE10E270
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 10:34:20 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1719398068; bh=SHqqdsDrAeR0waZpS2eAwIO2qZ18hCKMPuflmvP5fU0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=un+aaebZiYPdU8hn9TlCGZV4OIP8zgz/O4QnWWmJadxtSeSweT5s4FZxuI2L6Abp0
 0/gP4HT1IsqrwoZooM0J3nb46FaxjV2GymjvTIVDc5bBkNt/ilMPlaf0O7msp+voX2
 FhXlXJCMRJGdu3ebrPS5wMK9LiOVeRwaC5Fy+BBIfVXm5/UCAnDhU5PhCi4GDD7kVK
 1an1Oq2CTQ/uRibFKBh8AQNsIANnRNX22No8eLr0d3B0cvxkCZiRUd0ZiZpPwUjld9
 9iPr9vAV1IVEmQdXXYBfG6jqK9QQGJLj2nK8RxaDjPzQzBz22S5UUm6znlUGa/uAmd
 hkirlUP5Xdgaw==
Received: from dliberman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 45QAYAjP2801817
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2024 13:34:10 +0300
Received: (from dliberman@localhost)
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 45QAYAvt2801816; 
 Wed, 26 Jun 2024 13:34:10 +0300
From: Dani Liberman <dliberman@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: dliberman@habana.ai, illevi@habana.ai
Subject: [PATCH 8/8] drm/xe: msix support for hw engines
Date: Wed, 26 Jun 2024 13:33:45 +0300
Message-Id: <20240626103345.2801735-9-dliberman@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626103345.2801735-1-dliberman@habana.ai>
References: <20240626103345.2801735-1-dliberman@habana.ai>
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

For devices that support MSIX, we would like to be able to configure
the hw engines to work with MSI-X. This patch allocates MSIX vectors
for exec queues (via MSIX allocator), registers a handler and
programs the lrc the same way vf does it (using memirq). An
additional field added to the lrc is CS_INT_VEC.

MSIX vector 0 is used for GuC-to-host interrupt.

bspec: 60342, 72547

Signed-off-by: Ilia Levi <illevi@habana.ai>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  3 ++
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |  3 ++
 drivers/gpu/drm/xe/xe_exec_queue.c       |  2 +-
 drivers/gpu/drm/xe/xe_execlist.c         | 13 ++++++--
 drivers/gpu/drm/xe/xe_execlist_types.h   |  1 +
 drivers/gpu/drm/xe/xe_hw_engine.c        |  7 +++--
 drivers/gpu/drm/xe/xe_irq.c              | 40 ++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_lrc.c              | 21 ++++++++++---
 drivers/gpu/drm/xe/xe_lrc.h              |  2 +-
 9 files changed, 78 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index c38db2a74614..4c9e4f467e64 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -83,6 +83,8 @@
 #define RING_IMR(base)				XE_REG((base) + 0xa8)
 #define RING_INT_STATUS_RPT_PTR(base)		XE_REG((base) + 0xac)
 
+#define CS_INT_VEC(base)			XE_REG((base) + 0x1b8)
+
 #define RING_EIR(base)				XE_REG((base) + 0xb0)
 #define RING_EMR(base)				XE_REG((base) + 0xb4)
 #define RING_ESR(base)				XE_REG((base) + 0xb8)
@@ -137,6 +139,7 @@
 
 #define RING_MODE(base)				XE_REG((base) + 0x29c)
 #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
+#define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
 
 #define RING_TIMESTAMP(base)			XE_REG((base) + 0x358)
 
diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index 045dfd09db99..9b3eafd2bdc4 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -25,6 +25,9 @@
 #define CTX_INT_SRC_REPORT_REG		(CTX_LRI_INT_REPORT_PTR + 3)
 #define CTX_INT_SRC_REPORT_PTR		(CTX_LRI_INT_REPORT_PTR + 4)
 
+#define CTX_CS_INT_VEC_REG		0x5a
+#define CTX_CS_INT_VEC_DATA		(0x5a + 1)
+
 #define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
 #define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
 #define INDIRECT_CTX_RING_START		(0x06 + 1)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index e40c5380e292..8b709968ec56 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -143,7 +143,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	int i, err;
 
 	for (i = 0; i < q->width; ++i) {
-		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K);
+		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_number);
 		if (IS_ERR(q->lrc[i])) {
 			err = PTR_ERR(q->lrc[i]);
 			goto err_lrc;
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 354f85b591b1..ae3307b3f2f7 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -17,6 +17,7 @@
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_hw_fence.h"
+#include "xe_irq.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
@@ -254,7 +255,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
 {
 	struct drm_device *drm = &xe->drm;
 	struct xe_execlist_port *port;
-	int i;
+	int i, err;
 
 	port = drmm_kzalloc(drm, sizeof(*port), GFP_KERNEL);
 	if (!port)
@@ -262,10 +263,18 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
 
 	port->hwe = hwe;
 
-	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K);
+	if (xe_device_has_msix(xe)) {
+		err = xe_request_irq(xe, xe_irq_hwe_handler, hwe,
+			hwe->name, true, &port->msix_number);
+		if (err)
+			return ERR_PTR(err);
+	}
+
+	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K, port->msix_number);
 	if (IS_ERR(port->lrc))
 		return ERR_PTR(PTR_ERR(port->lrc));
 
+
 	spin_lock_init(&port->lock);
 	for (i = 0; i < ARRAY_SIZE(port->active); i++)
 		INIT_LIST_HEAD(&port->active[i]);
diff --git a/drivers/gpu/drm/xe/xe_execlist_types.h b/drivers/gpu/drm/xe/xe_execlist_types.h
index 415140936f11..bbb05310368e 100644
--- a/drivers/gpu/drm/xe/xe_execlist_types.h
+++ b/drivers/gpu/drm/xe/xe_execlist_types.h
@@ -23,6 +23,7 @@ struct xe_execlist_port {
 	struct list_head active[XE_EXEC_QUEUE_PRIORITY_COUNT];
 
 	u32 last_ctx_id;
+	u32 msix_number;
 
 	struct xe_execlist_exec_queue *running_exl;
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 90660d9382a0..667393d70d6d 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -298,16 +298,19 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 {
 	u32 ccs_mask =
 		xe_hw_engine_mask_per_class(hwe->gt, XE_ENGINE_CLASS_COMPUTE);
+	u32 ring_mode = _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE);
 
 	if (hwe->class == XE_ENGINE_CLASS_COMPUTE && ccs_mask)
 		xe_mmio_write32(hwe->gt, RCU_MODE,
 				_MASKED_BIT_ENABLE(RCU_MODE_CCS_ENABLE));
 
+	if (xe_device_has_msix(gt_to_xe(hwe->gt)))
+		ring_mode |= _MASKED_BIT_ENABLE(GFX_MSIX_INTERRUPT_ENABLE);
+
 	hw_engine_mmio_write32(hwe, RING_HWSTAM(0), ~0x0);
 	hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
 			       xe_bo_ggtt_addr(hwe->hwsp));
-	hw_engine_mmio_write32(hwe, RING_MODE(0),
-			       _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE));
+	hw_engine_mmio_write32(hwe, RING_MODE(0), ring_mode);
 	hw_engine_mmio_write32(hwe, RING_MI_MODE(0),
 			       _MASKED_BIT_DISABLE(STOP_RING));
 	hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index efa584e90cbf..d9d6444314e2 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -11,6 +11,7 @@
 
 #include "display/xe_display.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_guc_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_device.h"
 #include "xe_drv.h"
@@ -31,6 +32,7 @@
 #define IER(offset)				XE_REG(offset + 0xc)
 
 enum static_msix_allocations {
+	GUC2HOST_MSIX = 0,
 	NUM_OF_STATIC_MSIX,
 };
 
@@ -686,7 +688,13 @@ static void xe_irq_msi_free(struct xe_device *xe)
 
 static void xe_irq_msix_free(struct xe_device *xe)
 {
+	unsigned long idx;
+	u32 *dummy;
 
+	xa_for_each(&xe->irq.msix_indexes, idx, dummy)
+		xe_free_irq(xe, idx);
+
+	xa_destroy(&xe->irq.msix_indexes);
 }
 
 static void xe_irq_free(struct xe_device *xe)
@@ -732,8 +740,31 @@ static int xe_irq_msi_request(struct xe_device *xe)
 	return 0;
 }
 
+static irqreturn_t guc2host_irq_handler(int irq, void *arg)
+{
+	struct xe_device *xe = arg;
+	struct xe_tile *tile;
+	u8 id;
+
+	for_each_tile(tile, xe, id)
+		xe_guc_irq_handler(&tile->primary_gt->uc.guc,
+			GUC_INTR_GUC2HOST);
+
+	return IRQ_HANDLED;
+}
+
 static int xe_irq_msix_request(struct xe_device *xe)
 {
+	int err;
+	u32 msix = GUC2HOST_MSIX;
+
+	err = xe_request_irq(xe, guc2host_irq_handler, xe, DRIVER_NAME,
+		false, &msix);
+	if (err) {
+		drm_err(&xe->drm, "Failed to request MSIX IRQ %d\n", err);
+		return err;
+	}
+
 	return 0;
 }
 
@@ -804,13 +835,16 @@ void xe_irq_shutdown(struct xe_device *xe)
 
 static void xe_irq_msix_synchronize_irq(struct xe_device *xe)
 {
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	unsigned long msix_irq;
+	u32 *dummy;
 
+	xa_for_each(&xe->irq.msix_indexes, msix_irq, dummy)
+		synchronize_irq(pci_irq_vector(pdev, msix_irq));
 }
 
 void xe_irq_suspend(struct xe_device *xe)
 {
-	int irq = to_pci_dev(xe->drm.dev)->irq;
-
 	spin_lock_irq(&xe->irq.lock);
 	xe->irq.enabled = false; /* no new irqs */
 	spin_unlock_irq(&xe->irq.lock);
@@ -819,7 +853,7 @@ void xe_irq_suspend(struct xe_device *xe)
 	if (xe->irq.msix_enabled)
 		xe_irq_msix_synchronize_irq(xe);
 	else
-		synchronize_irq(irq);
+		synchronize_irq(pci_irq_vector(to_pci_dev(xe->drm.dev), 0));
 
 	xe_irq_reset(xe); /* turn irqs off */
 }
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 838609915916..ea8284c2a498 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -598,8 +598,9 @@ static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
 {
 	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->memirq;
 	struct xe_device *xe = gt_to_xe(hwe->gt);
+	u8 num_regs;
 
-	if (!IS_SRIOV_VF(xe) || !xe_device_has_memirq(xe))
+	if (!xe_device_needs_memirq(xe))
 		return;
 
 	regs[CTX_LRM_INT_MASK_ENABLE] = MI_LOAD_REGISTER_MEM |
@@ -607,12 +608,18 @@ static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
 	regs[CTX_INT_MASK_ENABLE_REG] = RING_IMR(0).addr;
 	regs[CTX_INT_MASK_ENABLE_PTR] = xe_memirq_enable_ptr(memirq);
 
-	regs[CTX_LRI_INT_REPORT_PTR] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(2) |
+	num_regs = xe_device_has_msix(xe) ? 3 : 2;
+	regs[CTX_LRI_INT_REPORT_PTR] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(num_regs) |
 				       MI_LRI_LRM_CS_MMIO | MI_LRI_FORCE_POSTED;
 	regs[CTX_INT_STATUS_REPORT_REG] = RING_INT_STATUS_RPT_PTR(0).addr;
 	regs[CTX_INT_STATUS_REPORT_PTR] = xe_memirq_status_ptr(memirq);
 	regs[CTX_INT_SRC_REPORT_REG] = RING_INT_SRC_RPT_PTR(0).addr;
 	regs[CTX_INT_SRC_REPORT_PTR] = xe_memirq_source_ptr(memirq);
+
+	if (xe_device_has_msix(xe)) {
+		regs[CTX_CS_INT_VEC_REG] = CS_INT_VEC(0).addr;
+		/* CTX_CS_INT_VEC_DATA will be set in xe_lrc_init */
+	}
 }
 
 static int lrc_ring_mi_mode(struct xe_hw_engine *hwe)
@@ -890,7 +897,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
 
 static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
-		       struct xe_vm *vm, u32 ring_size)
+		       struct xe_vm *vm, u32 ring_size, u32 msix)
 {
 	struct xe_gt *gt = hwe->gt;
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -959,6 +966,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 			xe_drm_client_add_bo(vm->xef->client, lrc->bo);
 	}
 
+	if (xe_device_has_msix(xe)) {
+		xe_lrc_write_ctx_reg(lrc, CTX_CS_INT_VEC_DATA, msix);
+	}
+
 	if (xe_gt_has_indirect_ring_state(gt)) {
 		xe_lrc_write_ctx_reg(lrc, CTX_INDIRECT_RING_STATE,
 				     __xe_lrc_indirect_ring_ggtt_addr(lrc));
@@ -1026,7 +1037,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * upon failure.
  */
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size)
+			     u32 ring_size, u32 msix)
 {
 	struct xe_lrc *lrc;
 	int err;
@@ -1035,7 +1046,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 	if (!lrc)
 		return ERR_PTR(-ENOMEM);
 
-	err = xe_lrc_init(lrc, hwe, vm, ring_size);
+	err = xe_lrc_init(lrc, hwe, vm, ring_size, msix);
 	if (err) {
 		kfree(lrc);
 		return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index c24542e89318..1eded8919d73 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -23,7 +23,7 @@ struct xe_vm;
 #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
 
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size);
+			     u32 ring_size, u32 msix);
 void xe_lrc_destroy(struct kref *ref);
 
 /**
-- 
2.34.1

