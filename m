Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B6BD69106
	for <intel-xe@archiver.kernel.org>; Thu, 28 Nov 2024 12:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2229710EC74;
	Thu, 28 Nov 2024 12:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D5pqPS8U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8587F10EC74
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Nov 2024 12:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732798454; x=1764334454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PmJU5fx4AbRvZF6oZ/sFPFrTd47R3gcajtiWSl5D4TA=;
 b=D5pqPS8U7r1MAHWtf/HxeXcerPqVsX8kYDuxyi2JHv4w5zuAtW3iAB3W
 a8Gi4MZvBSGICKqP4jhFKzNWy2rNY3q18ncTd2e0nUuysAc1O4WtPevq3
 /akki03GEUf65kazGxDapyFe0hHIVGaCPPFza0Sw0p8+hxfbV7OSHs044
 ZJMZSZH7B+X2haMqqNZB5lvs+xg+u2pHa8nhym+GAL9wY7vFRMIySmFLC
 j9oO6ksUtrpcMuhava8KUpESm6s095eNVxGOVGSnEjc3VQ1fXDd+J+h07
 1VKdvrCa4J7g+gatN2g1E8HpdS3fVzjdgDj9Vg0ByGoHHyQJYaNSOcV76 w==;
X-CSE-ConnectionGUID: mQHjx8OIReGM1yW0qj0yLA==
X-CSE-MsgGUID: pB/94279Tju+tIbRYJQBhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="43698659"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="43698659"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 04:54:02 -0800
X-CSE-ConnectionGUID: rOpmpnYHTiClox9T979SMA==
X-CSE-MsgGUID: ay42pYHITHG2wijHezcpgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="93069854"
Received: from ilevi-mobl.ger.corp.intel.com (HELO ilevi-mobl.intel.com)
 ([10.245.200.63])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 04:53:59 -0800
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, piotr.piorkowski@intel.com,
 niranjana.vishwanathapura@intel.com, koby.elbaz@intel.com,
 yaron.avizrat@intel.com
Subject: [PATCH v5 3/5] drm/xe: Initial MSI-X support for HW engines
Date: Thu, 28 Nov 2024 14:53:43 +0200
Message-Id: <20241128125345.1115-4-ilia.levi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128125345.1115-1-ilia.levi@intel.com>
References: <20241128125345.1115-1-ilia.levi@intel.com>
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

- Configure the HW engines to work with MSI-X
- Program the LRC to use memirq infra (similar to VF)
- CS_INT_VEC field added to the LRC

Bspec: 60342, 72547

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  3 +++
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |  3 +++
 drivers/gpu/drm/xe/xe_exec_queue.c       |  4 +++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
 drivers/gpu/drm/xe/xe_execlist.c         | 10 +++++++---
 drivers/gpu/drm/xe/xe_hw_engine.c        |  7 +++++--
 drivers/gpu/drm/xe/xe_lrc.c              | 24 ++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_lrc.h              |  2 +-
 8 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 7c78496e6213..d86219dedde2 100644
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
@@ -138,6 +140,7 @@
 
 #define RING_MODE(base)				XE_REG((base) + 0x29c)
 #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
+#define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
 
 #define RING_TIMESTAMP(base)			XE_REG((base) + 0x358)
 
diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index 045dfd09db99..57944f90bbf6 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -25,6 +25,9 @@
 #define CTX_INT_SRC_REPORT_REG		(CTX_LRI_INT_REPORT_PTR + 3)
 #define CTX_INT_SRC_REPORT_PTR		(CTX_LRI_INT_REPORT_PTR + 4)
 
+#define CTX_CS_INT_VEC_REG		0x5a
+#define CTX_CS_INT_VEC_DATA		(CTX_CS_INT_VEC_REG + 1)
+
 #define INDIRECT_CTX_RING_HEAD		(0x02 + 1)
 #define INDIRECT_CTX_RING_TAIL		(0x04 + 1)
 #define INDIRECT_CTX_RING_START		(0x06 + 1)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index aab9e561153d..9c94be571900 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -16,6 +16,7 @@
 #include "xe_hw_engine_class_sysfs.h"
 #include "xe_hw_engine_group.h"
 #include "xe_hw_fence.h"
+#include "xe_irq.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_migrate.h"
@@ -68,6 +69,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->gt = gt;
 	q->class = hwe->class;
 	q->width = width;
+	q->msix_vec = XE_IRQ_DEFAULT_MSIX;
 	q->logical_mask = logical_mask;
 	q->fence_irq = &gt->fence_irq[hwe->class];
 	q->ring_ops = gt->ring_ops[hwe->class];
@@ -117,7 +119,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	}
 
 	for (i = 0; i < q->width; ++i) {
-		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K);
+		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec);
 		if (IS_ERR(q->lrc[i])) {
 			err = PTR_ERR(q->lrc[i]);
 			goto err_unlock;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 1158b6062a6c..eec8f9935a58 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -63,6 +63,8 @@ struct xe_exec_queue {
 	char name[MAX_FENCE_NAME_LEN];
 	/** @width: width (number BB submitted per exec) of this exec queue */
 	u16 width;
+	/** @msix_vec: MSI-X vector (for platforms that support it) */
+	u16 msix_vec;
 	/** @fence_irq: fence IRQ used to signal job completion */
 	struct xe_hw_fence_irq *fence_irq;
 
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index a8c416a48812..5ef96deaa881 100644
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
@@ -47,6 +48,7 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
 	struct xe_mmio *mmio = &gt->mmio;
 	struct xe_device *xe = gt_to_xe(gt);
 	u64 lrc_desc;
+	u32 ring_mode = _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE);
 
 	lrc_desc = xe_lrc_descriptor(lrc);
 
@@ -80,8 +82,10 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
 	xe_mmio_write32(mmio, RING_HWS_PGA(hwe->mmio_base),
 			xe_bo_ggtt_addr(hwe->hwsp));
 	xe_mmio_read32(mmio, RING_HWS_PGA(hwe->mmio_base));
-	xe_mmio_write32(mmio, RING_MODE(hwe->mmio_base),
-			_MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE));
+
+	if (xe_device_has_msix(gt_to_xe(hwe->gt)))
+		ring_mode |= _MASKED_BIT_ENABLE(GFX_MSIX_INTERRUPT_ENABLE);
+	xe_mmio_write32(mmio, RING_MODE(hwe->mmio_base), ring_mode);
 
 	xe_mmio_write32(mmio, RING_EXECLIST_SQ_CONTENTS_LO(hwe->mmio_base),
 			lower_32_bits(lrc_desc));
@@ -265,7 +269,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
 
 	port->hwe = hwe;
 
-	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K);
+	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K, XE_IRQ_DEFAULT_MSIX);
 	if (IS_ERR(port->lrc)) {
 		err = PTR_ERR(port->lrc);
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index c4b0dc3be39c..0a1baaedff38 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -324,6 +324,7 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 {
 	u32 ccs_mask =
 		xe_hw_engine_mask_per_class(hwe->gt, XE_ENGINE_CLASS_COMPUTE);
+	u32 ring_mode = _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE);
 
 	if (hwe->class == XE_ENGINE_CLASS_COMPUTE && ccs_mask)
 		xe_mmio_write32(&hwe->gt->mmio, RCU_MODE,
@@ -332,8 +333,10 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 	xe_hw_engine_mmio_write32(hwe, RING_HWSTAM(0), ~0x0);
 	xe_hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
 				  xe_bo_ggtt_addr(hwe->hwsp));
-	xe_hw_engine_mmio_write32(hwe, RING_MODE(0),
-				  _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE));
+
+	if (xe_device_has_msix(gt_to_xe(hwe->gt)))
+		ring_mode |= _MASKED_BIT_ENABLE(GFX_MSIX_INTERRUPT_ENABLE);
+	xe_hw_engine_mmio_write32(hwe, RING_MODE(0), ring_mode);
 	xe_hw_engine_mmio_write32(hwe, RING_MI_MODE(0),
 				  _MASKED_BIT_DISABLE(STOP_RING));
 	xe_hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 22e58c6e2a35..bbb9ffbf6367 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -584,6 +584,7 @@ static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
 {
 	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->memirq;
 	struct xe_device *xe = gt_to_xe(hwe->gt);
+	u8 num_regs;
 
 	if (!xe_device_uses_memirq(xe))
 		return;
@@ -593,12 +594,18 @@ static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
 	regs[CTX_INT_MASK_ENABLE_REG] = RING_IMR(0).addr;
 	regs[CTX_INT_MASK_ENABLE_PTR] = xe_memirq_enable_ptr(memirq);
 
-	regs[CTX_LRI_INT_REPORT_PTR] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(2) |
+	num_regs = xe_device_has_msix(xe) ? 3 : 2;
+	regs[CTX_LRI_INT_REPORT_PTR] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(num_regs) |
 				       MI_LRI_LRM_CS_MMIO | MI_LRI_FORCE_POSTED;
 	regs[CTX_INT_STATUS_REPORT_REG] = RING_INT_STATUS_RPT_PTR(0).addr;
 	regs[CTX_INT_STATUS_REPORT_PTR] = xe_memirq_status_ptr(memirq, hwe);
 	regs[CTX_INT_SRC_REPORT_REG] = RING_INT_SRC_RPT_PTR(0).addr;
 	regs[CTX_INT_SRC_REPORT_PTR] = xe_memirq_source_ptr(memirq, hwe);
+
+	if (xe_device_has_msix(xe)) {
+		regs[CTX_CS_INT_VEC_REG] = CS_INT_VEC(0).addr;
+		/* CTX_CS_INT_VEC_DATA will be set in xe_lrc_init */
+	}
 }
 
 static int lrc_ring_mi_mode(struct xe_hw_engine *hwe)
@@ -876,7 +883,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
 
 static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
-		       struct xe_vm *vm, u32 ring_size)
+		       struct xe_vm *vm, u32 ring_size, u16 msix_vec)
 {
 	struct xe_gt *gt = hwe->gt;
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -945,6 +952,14 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 			xe_drm_client_add_bo(vm->xef->client, lrc->bo);
 	}
 
+	if (xe_device_has_msix(xe)) {
+		xe_lrc_write_ctx_reg(lrc, CTX_INT_STATUS_REPORT_PTR,
+				     xe_memirq_status_ptr(&tile->memirq, hwe));
+		xe_lrc_write_ctx_reg(lrc, CTX_INT_SRC_REPORT_PTR,
+				     xe_memirq_source_ptr(&tile->memirq, hwe));
+		xe_lrc_write_ctx_reg(lrc, CTX_CS_INT_VEC_DATA, msix_vec << 16 | msix_vec);
+	}
+
 	if (xe_gt_has_indirect_ring_state(gt)) {
 		xe_lrc_write_ctx_reg(lrc, CTX_INDIRECT_RING_STATE,
 				     __xe_lrc_indirect_ring_ggtt_addr(lrc));
@@ -1005,6 +1020,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * @hwe: Hardware Engine
  * @vm: The VM (address space)
  * @ring_size: LRC ring size
+ * @msix_vec: MSI-X interrupt vector (for platforms that support it)
  *
  * Allocate and initialize the Logical Ring Context (LRC).
  *
@@ -1012,7 +1028,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * upon failure.
  */
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size)
+			     u32 ring_size, u16 msix_vec)
 {
 	struct xe_lrc *lrc;
 	int err;
@@ -1021,7 +1037,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 	if (!lrc)
 		return ERR_PTR(-ENOMEM);
 
-	err = xe_lrc_init(lrc, hwe, vm, ring_size);
+	err = xe_lrc_init(lrc, hwe, vm, ring_size, msix_vec);
 	if (err) {
 		kfree(lrc);
 		return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index b459dcab8787..4206e6a8b50a 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -42,7 +42,7 @@ struct xe_lrc_snapshot {
 #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
 
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size);
+			     u32 ring_size, u16 msix_vec);
 void xe_lrc_destroy(struct kref *ref);
 
 /**
-- 
2.43.2

