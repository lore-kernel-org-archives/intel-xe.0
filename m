Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3942D5E140
	for <intel-xe@archiver.kernel.org>; Sun, 10 Nov 2024 12:33:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE6510E2D4;
	Sun, 10 Nov 2024 12:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZSxtxyTz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895DD10E2CD
 for <intel-xe@lists.freedesktop.org>; Sun, 10 Nov 2024 12:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731242019; x=1762778019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TetKcBw4MdlTNvimxRAQGaDu/M4d7nAq/D0g3GB7bnQ=;
 b=ZSxtxyTzGbsMJwi6SBNWahBYhrmdXI/nfrw9sLWgO1qLigoZVAaXwvHc
 vgXCBhnlK90lWDAX8NjktSZPhvldUpCT9omSiq5yR6MxpfaVG8hIOqVCV
 hrbIwFO9f6S3JM1A7xWT2p+ZslbYp32+gyiRJPbVLtSt6qbvGJpXIq66v
 Zo60CSHlkoe7ZIBJgkuJ5hVwHo1x9Wo3sE1YvFjgWsb+Dn+sElll+7Ldx
 dKtJ2RVQBD/cB8YXTi8GKzAbK8XcsKprkhe2Wb+vU2MAl4cdo9B3NbWbe
 D0yXUVG9BDC2KUfD6K2OvCLp8++uV/oY7OFp4DGfZSnE2bzQsZPDl2dd2 w==;
X-CSE-ConnectionGUID: OHxGuDyDTb+jzHvYkM8Dyw==
X-CSE-MsgGUID: +aeUogNORTConqx9wQl19w==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="31286896"
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; d="scan'208";a="31286896"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2024 04:33:39 -0800
X-CSE-ConnectionGUID: 5SDZHcU5TAGgvUgRU6iWmw==
X-CSE-MsgGUID: icgewFI1R/K47ZeNjrXuTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; d="scan'208";a="123996763"
Received: from ilevi-mobl.ger.corp.intel.com (HELO ilevi-mobl.intel.com)
 ([10.245.200.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2024 04:33:37 -0800
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, niranjana.vishwanathapura@intel.com,
 koby.elbaz@intel.com, yaron.avizrat@intel.com
Subject: [PATCH v3 1/3] drm/xe: Initial MSI-X support for HW engines
Date: Sun, 10 Nov 2024 14:33:26 +0200
Message-Id: <20241110123328.202229-2-ilia.levi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241110123328.202229-1-ilia.levi@intel.com>
References: <20241110123328.202229-1-ilia.levi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

A new flow is added for devices that support MSI-X:
- MSI-X vector 0 is used for GuC-to-host interrupt
- MSI-X vector 1 (aka default MSI-X) is used for HW engines
- Configure the HW engines to work with MSI-X
- Program the LRC to use memirq infra (similar to VF)
- CS_INT_VEC field added to the LRC

Bspec: 60342, 72547

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/Makefile              |   1 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   3 +
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |   3 +
 drivers/gpu/drm/xe/xe_device.c           |   3 -
 drivers/gpu/drm/xe/xe_device.h           |   3 +-
 drivers/gpu/drm/xe/xe_device_types.h     |  10 ++
 drivers/gpu/drm/xe/xe_exec_queue.c       |   3 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
 drivers/gpu/drm/xe/xe_execlist.c         |   9 +-
 drivers/gpu/drm/xe/xe_hw_engine.c        |   7 +-
 drivers/gpu/drm/xe/xe_irq.c              | 115 +++++++++++++------
 drivers/gpu/drm/xe/xe_irq_msix.c         | 134 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_irq_msix.h         |  16 +++
 drivers/gpu/drm/xe/xe_lrc.c              |  24 +++-
 drivers/gpu/drm/xe/xe_lrc.h              |   2 +-
 15 files changed, 287 insertions(+), 48 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_irq_msix.c
 create mode 100644 drivers/gpu/drm/xe/xe_irq_msix.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a93e6fcc0ad9..2f1e1f17b677 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -72,6 +72,7 @@ xe-y += xe_bb.o \
 	xe_hw_fence.o \
 	xe_huc.o \
 	xe_irq.o \
+	xe_irq_msix.o \
 	xe_lrc.o \
 	xe_migrate.o \
 	xe_mmio.o \
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
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 0e2dd691bdae..c930d32aca9b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -673,9 +673,6 @@ int xe_device_probe(struct xe_device *xe)
 		err = xe_ggtt_init_early(tile->mem.ggtt);
 		if (err)
 			return err;
-		err = xe_memirq_init(&tile->memirq);
-		if (err)
-			return err;
 	}
 
 	for_each_gt(gt, xe, id) {
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index f1fbfe916867..812f24a34e6b 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -157,8 +157,7 @@ static inline bool xe_device_has_sriov(struct xe_device *xe)
 
 static inline bool xe_device_has_msix(struct xe_device *xe)
 {
-	/* TODO: change this when MSI-X support is fully integrated */
-	return false;
+	return xe->irq.msix.enabled;
 }
 
 static inline bool xe_device_has_memirq(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index bccca63c8a48..159b0e25e2bb 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -346,6 +346,16 @@ struct xe_device {
 
 		/** @irq.enabled: interrupts enabled on this device */
 		bool enabled;
+
+		/** @irq.msix: irq info for platforms that support MSI-X */
+		struct {
+			/** @irq.msix.enabled: MSI-X interrupts enabled on this device */
+			bool enabled;
+			/** @irq.msix.num_of_interrupts: number of MSI-X interrupts */
+			u16 num_of_interrupts;
+			/** @irq.msix.default_msix: Default MSI-X vector */
+			u16 default_msix;
+		} msix;
 	} irq;
 
 	/** @ttm: ttm device */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index fd0f3b3c9101..fe3a10825245 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -68,6 +68,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->gt = gt;
 	q->class = hwe->class;
 	q->width = width;
+	q->msix = xe->irq.msix.default_msix;
 	q->logical_mask = logical_mask;
 	q->fence_irq = &gt->fence_irq[hwe->class];
 	q->ring_ops = gt->ring_ops[hwe->class];
@@ -117,7 +118,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	}
 
 	for (i = 0; i < q->width; ++i) {
-		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K);
+		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix);
 		if (IS_ERR(q->lrc[i])) {
 			err = PTR_ERR(q->lrc[i]);
 			goto err_unlock;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 1158b6062a6c..19fd66d59dd7 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -63,6 +63,8 @@ struct xe_exec_queue {
 	char name[MAX_FENCE_NAME_LEN];
 	/** @width: width (number BB submitted per exec) of this exec queue */
 	u16 width;
+	/** @msix: MSI-X vector (for platforms that support it) */
+	u16 msix;
 	/** @fence_irq: fence IRQ used to signal job completion */
 	struct xe_hw_fence_irq *fence_irq;
 
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index a8c416a48812..dcbc87a31ba3 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -47,6 +47,7 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
 	struct xe_mmio *mmio = &gt->mmio;
 	struct xe_device *xe = gt_to_xe(gt);
 	u64 lrc_desc;
+	u32 ring_mode = _MASKED_BIT_ENABLE(GFX_DISABLE_LEGACY_MODE);
 
 	lrc_desc = xe_lrc_descriptor(lrc);
 
@@ -80,8 +81,10 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
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
@@ -265,7 +268,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
 
 	port->hwe = hwe;
 
-	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K);
+	port->lrc = xe_lrc_create(hwe, NULL, SZ_16K, xe->irq.msix.default_msix);
 	if (IS_ERR(port->lrc)) {
 		err = PTR_ERR(port->lrc);
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 1557acee3523..080506b2c4ad 100644
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
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index b7995ebd54ab..840de45fe243 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -4,6 +4,7 @@
  */
 
 #include "xe_irq.h"
+#include "xe_irq_msix.h"
 
 #include <linux/sched/clock.h>
 
@@ -577,8 +578,12 @@ static void xe_irq_reset(struct xe_device *xe)
 	struct xe_tile *tile;
 	u8 id;
 
-	if (IS_SRIOV_VF(xe))
+	if (IS_SRIOV_VF(xe)) {
 		return vf_irq_reset(xe);
+	} else if (xe_device_uses_memirq(xe)) {
+		for_each_tile(tile, xe, id)
+			xe_memirq_reset(&tile->memirq);
+	}
 
 	for_each_tile(tile, xe, id) {
 		if (GRAPHICS_VERx100(xe) >= 1210)
@@ -619,8 +624,15 @@ static void vf_irq_postinstall(struct xe_device *xe)
 
 static void xe_irq_postinstall(struct xe_device *xe)
 {
-	if (IS_SRIOV_VF(xe))
+	if (IS_SRIOV_VF(xe)) {
 		return vf_irq_postinstall(xe);
+	} else if (xe_device_uses_memirq(xe)) {
+		struct xe_tile *tile;
+		unsigned int id;
+
+		for_each_tile(tile, xe, id)
+			xe_memirq_postinstall(&tile->memirq);
+	}
 
 	xe_display_irq_postinstall(xe, xe_root_mmio_gt(xe));
 
@@ -668,62 +680,94 @@ static irq_handler_t xe_irq_handler(struct xe_device *xe)
 		return xelp_irq_handler;
 }
 
-static void irq_uninstall(void *arg)
+static int xe_irq_msi_request(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	irq_handler_t irq_handler;
+	int irq, err;
+
+	irq_handler = xe_irq_handler(xe);
+	if (!irq_handler) {
+		drm_err(&xe->drm, "No supported interrupt handler");
+		return -EINVAL;
+	}
+
+	irq = pci_irq_vector(pdev, 0);
+	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
+	if (err < 0) {
+		drm_err(&xe->drm, "Failed to request MSI IRQ %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static void xe_irq_msi_free(struct xe_device *xe)
 {
-	struct xe_device *xe = arg;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	int irq;
 
+	irq = pci_irq_vector(pdev, 0);
+	free_irq(irq, xe);
+}
+
+static void irq_uninstall(void *arg)
+{
+	struct xe_device *xe = arg;
+
 	if (!xe->irq.enabled)
 		return;
 
 	xe->irq.enabled = false;
 	xe_irq_reset(xe);
 
-	irq = pci_irq_vector(pdev, 0);
-	free_irq(irq, xe);
+	if (xe_device_has_msix(xe))
+		xe_irq_msix_free(xe);
+	else
+		xe_irq_msi_free(xe);
 }
 
 int xe_irq_install(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	unsigned int irq_flags = PCI_IRQ_MSIX;
-	irq_handler_t irq_handler;
-	int err, irq, nvec;
-
-	irq_handler = xe_irq_handler(xe);
-	if (!irq_handler) {
-		drm_err(&xe->drm, "No supported interrupt handler");
-		return -EINVAL;
-	}
+	unsigned int irq_flags;
+	struct xe_tile *tile;
+	int err, nvec;
+	u8 id;
 
 	xe_irq_reset(xe);
 
 	nvec = pci_msix_vec_count(pdev);
-	if (nvec <= 0) {
-		if (nvec == -EINVAL) {
-			/* MSIX capability is not supported in the device, using MSI */
-			irq_flags = PCI_IRQ_MSI;
-			nvec = 1;
-		} else {
-			drm_err(&xe->drm, "MSIX: Failed getting count\n");
-			return nvec;
-		}
+	if (nvec > 0) {
+		xe_irq_msix_init(xe, nvec);
+		irq_flags = PCI_IRQ_MSIX;
+	} else if (nvec == -EINVAL) {
+		/* MSI-X capability is not supported in the device, using MSI */
+		irq_flags = PCI_IRQ_MSI;
+		nvec = 1;
+	} else {
+		drm_err(&xe->drm, "Failed getting MSI-X vectors count: %d\n", nvec);
+		return nvec;
 	}
 
 	err = pci_alloc_irq_vectors(pdev, nvec, nvec, irq_flags);
 	if (err < 0) {
-		drm_err(&xe->drm, "MSI/MSIX: Failed to enable support %d\n", err);
+		drm_err(&xe->drm, "Failed to allocate IRQ vectors: %d\n", err);
 		return err;
 	}
 
-	irq = pci_irq_vector(pdev, 0);
-	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
-	if (err < 0) {
-		drm_err(&xe->drm, "Failed to request MSI/MSIX IRQ %d\n", err);
-		return err;
+	/* memirq init must be called after we tested whether the platform is MSI-X */
+	for_each_tile(tile, xe, id) {
+		err = xe_memirq_init(&tile->memirq);
+		if (err)
+			return err;
 	}
 
+	err = xe_device_has_msix(xe) ? xe_irq_msix_request(xe) :
+				       xe_irq_msi_request(xe);
+	if (err)
+		return err;
+
 	xe->irq.enabled = true;
 
 	xe_irq_postinstall(xe);
@@ -735,7 +779,10 @@ int xe_irq_install(struct xe_device *xe)
 	return 0;
 
 free_irq_handler:
-	free_irq(irq, xe);
+	if (xe_device_has_msix(xe))
+		xe_irq_msix_free(xe);
+	else
+		xe_irq_msi_free(xe);
 
 	return err;
 }
@@ -748,7 +795,11 @@ void xe_irq_suspend(struct xe_device *xe)
 	xe->irq.enabled = false; /* no new irqs */
 	spin_unlock_irq(&xe->irq.lock);
 
-	synchronize_irq(irq); /* flush irqs */
+	/* flush irqs */
+	if (xe_device_has_msix(xe))
+		xe_irq_msix_synchronize_irq(xe);
+	else
+		synchronize_irq(irq);
 	xe_irq_reset(xe); /* turn irqs off */
 }
 
diff --git a/drivers/gpu/drm/xe/xe_irq_msix.c b/drivers/gpu/drm/xe/xe_irq_msix.c
new file mode 100644
index 000000000000..dac339ba5ed2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_irq_msix.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include "xe_irq_msix.h"
+
+#include "regs/xe_guc_regs.h"
+
+#include "xe_device.h"
+#include "xe_drv.h"
+#include "xe_guc.h"
+#include "xe_memirq.h"
+
+enum xe_irq_msix_static {
+	GUC2HOST_MSIX = 0,
+	DEFAULT_MSIX,
+	/* Must be last */
+	NUM_OF_STATIC_MSIX,
+};
+
+void xe_irq_msix_init(struct xe_device *xe, int nvec)
+{
+	xe->irq.msix.enabled = true;
+	xe->irq.msix.num_of_interrupts = nvec;
+	xe->irq.msix.default_msix = DEFAULT_MSIX;
+}
+
+static irqreturn_t guc2host_irq_handler(int irq, void *arg)
+{
+	struct xe_device *xe = arg;
+	struct xe_tile *tile;
+	u8 id;
+
+	for_each_tile(tile, xe, id)
+		xe_guc_irq_handler(&tile->primary_gt->uc.guc,
+				   GUC_INTR_GUC2HOST);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t xe_irq_msix_default_hwe_handler(int irq, void *arg)
+{
+	unsigned int tile_id, gt_id;
+	struct xe_device *xe = arg;
+	struct xe_memirq *memirq;
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	struct xe_tile *tile;
+	struct xe_gt *gt;
+
+	for_each_tile(tile, xe, tile_id) {
+		memirq = &tile->memirq;
+		if (!memirq->bo)
+			continue;
+
+		for_each_gt(gt, xe, gt_id) {
+			if (gt->tile != tile)
+				continue;
+
+			for_each_hw_engine(hwe, gt, id)
+				xe_memirq_hwe_handler(memirq, hwe);
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int xe_irq_msix_request_irq(struct xe_device *xe, irq_handler_t handler,
+				   const char *name, u16 msix)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	int ret, irq;
+
+	irq = pci_irq_vector(pdev, msix);
+	if (irq < 0)
+		return irq;
+
+	ret = request_irq(irq, handler, IRQF_SHARED, name, xe);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static void xe_irq_msix_free_irq(struct xe_device *xe, u16 msix)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	int irq;
+
+	irq = pci_irq_vector(pdev, msix);
+	if (irq < 0) {
+		drm_err(&xe->drm, "MSI-X %u can't be released, there is no matching IRQ\n", msix);
+		return;
+	}
+
+	free_irq(irq, xe);
+}
+
+int xe_irq_msix_request(struct xe_device *xe)
+{
+	int err;
+
+	err = xe_irq_msix_request_irq(xe, guc2host_irq_handler,
+				      DRIVER_NAME "-guc2host", GUC2HOST_MSIX);
+	if (err) {
+		drm_err(&xe->drm, "Failed to request MSI-X IRQ %d: %d\n", GUC2HOST_MSIX, err);
+		return err;
+	}
+
+	err = xe_irq_msix_request_irq(xe, xe_irq_msix_default_hwe_handler,
+				      DRIVER_NAME "-default-msix", DEFAULT_MSIX);
+	if (err) {
+		drm_err(&xe->drm, "Failed to request MSI-X IRQ %d: %d\n", DEFAULT_MSIX, err);
+		xe_irq_msix_free_irq(xe, GUC2HOST_MSIX);
+		return err;
+	}
+
+	return 0;
+}
+
+void xe_irq_msix_free(struct xe_device *xe)
+{
+	xe_irq_msix_free_irq(xe, GUC2HOST_MSIX);
+	xe_irq_msix_free_irq(xe, DEFAULT_MSIX);
+}
+
+void xe_irq_msix_synchronize_irq(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+
+	synchronize_irq(pci_irq_vector(pdev, GUC2HOST_MSIX));
+	synchronize_irq(pci_irq_vector(pdev, DEFAULT_MSIX));
+}
diff --git a/drivers/gpu/drm/xe/xe_irq_msix.h b/drivers/gpu/drm/xe/xe_irq_msix.h
new file mode 100644
index 000000000000..9c36d11f05fc
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_irq_msix.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_IRQ_MSIX_H_
+#define _XE_IRQ_MSIX_H_
+
+struct xe_device;
+
+void xe_irq_msix_init(struct xe_device *xe, int nvec);
+void xe_irq_msix_free(struct xe_device *xe);
+int xe_irq_msix_request(struct xe_device *xe);
+void xe_irq_msix_synchronize_irq(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 4b65da77c6e0..ca27c3be3b8a 100644
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
+		       struct xe_vm *vm, u32 ring_size, u16 msix)
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
+		xe_lrc_write_ctx_reg(lrc, CTX_CS_INT_VEC_DATA, msix << 16 | msix);
+	}
+
 	if (xe_gt_has_indirect_ring_state(gt)) {
 		xe_lrc_write_ctx_reg(lrc, CTX_INDIRECT_RING_STATE,
 				     __xe_lrc_indirect_ring_ggtt_addr(lrc));
@@ -1005,6 +1020,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * @hwe: Hardware Engine
  * @vm: The VM (address space)
  * @ring_size: LRC ring size
+ * @msix: MSI-X interrupt vector (for platforms that support it)
  *
  * Allocate and initialize the Logical Ring Context (LRC).
  *
@@ -1012,7 +1028,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
  * upon failure.
  */
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size)
+			     u32 ring_size, u16 msix)
 {
 	struct xe_lrc *lrc;
 	int err;
@@ -1021,7 +1037,7 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 	if (!lrc)
 		return ERR_PTR(-ENOMEM);
 
-	err = xe_lrc_init(lrc, hwe, vm, ring_size);
+	err = xe_lrc_init(lrc, hwe, vm, ring_size, msix);
 	if (err) {
 		kfree(lrc);
 		return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 40d8f6906d3e..6d1c2f6c0559 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -40,7 +40,7 @@ struct xe_lrc_snapshot {
 #define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
 
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
-			     u32 ring_size);
+			     u32 ring_size, u16 msix);
 void xe_lrc_destroy(struct kref *ref);
 
 /**
-- 
2.43.2

