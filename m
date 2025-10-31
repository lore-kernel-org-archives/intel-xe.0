Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C78CCF9EB
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 08:05:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC1410EAC2;
	Fri, 31 Oct 2025 08:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MYih4ytN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81D310EABD
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 08:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761897951; x=1793433951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I9EwAvTqVa5w5PqKUMawfvkOG6RQHzM2i317bqfiG/4=;
 b=MYih4ytNB/FpFsPX5qqlWfb332iZNXodCEAQi3hRkXF7ZkV+3dz0crui
 lbU/weDogU/STpzrWqXxoPN8ZfaaCMISC6Q251Z+T56o9XHsjdF8sYFfD
 ct6q2kuKMF4LD/EpR6u5hUVNM/3euPNow2FIvaleSnEvp/mHsPxFItJIr
 OMXk32kV/+g/074QtvH9thfkAILOnaxX3Q/LHjNRJOBPHXcBzVM74DACs
 DLzyH1s3jy64Njndk+C6dznFXW76V2ZEk8TaA2uVhr77y7Mlv7Gx7S+92
 J+fqsTYRVlqbl1VgRLptDtCKGy8lZwxdqIrS3YL2xoWnaTQCJhOyS5sh3 A==;
X-CSE-ConnectionGUID: 7P340wekRBWJPuNa4CUzXg==
X-CSE-MsgGUID: BL3n7YBqRByYPyn7NbsmkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75503190"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="75503190"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 01:05:51 -0700
X-CSE-ConnectionGUID: m9z8I4H+SC2xZl/y9nN9TA==
X-CSE-MsgGUID: 6E83gGK2RbCwqnfssGAOuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="186631624"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 01:05:49 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, piotr.piorkowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH v2 3/4] drm/xe/pf: Add TLB invalidation support for MERT
Date: Fri, 31 Oct 2025 09:05:00 +0100
Message-Id: <20251031080501.844-4-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251031080501.844-1-lukasz.laguna@intel.com>
References: <20251031080501.844-1-lukasz.laguna@intel.com>
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

Add support for triggering and handling MERT TLB invalidation. After
LMTT updates, the MERT TLB invalidation is initiated to ensure memory
translations remain coherent.

Completion of the invalidation is signaled via MERT interrupt (bit 13 in
the GFX master interrupt register). Detect and handle this interrupt to
properly synchronize the invalidation flow.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
v2:
 - squash commits (Matt Roper),
 - fix locking (Matt Brost, Lucas),
 - move the implementation to xe_mert.c (Michal Wajdeczko).
---
 drivers/gpu/drm/xe/Makefile            |  1 +
 drivers/gpu/drm/xe/regs/xe_irq_regs.h  |  1 +
 drivers/gpu/drm/xe/regs/xe_mert_regs.h |  3 ++
 drivers/gpu/drm/xe/xe_device_types.h   |  4 ++
 drivers/gpu/drm/xe/xe_irq.c            |  2 +
 drivers/gpu/drm/xe/xe_lmtt.c           | 15 +++++-
 drivers/gpu/drm/xe/xe_mert.c           | 71 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mert.h           | 32 ++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf.c       |  4 ++
 9 files changed, 131 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_mert.c
 create mode 100644 drivers/gpu/drm/xe/xe_mert.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index bfc72f3dd61b..e2a7e460c2d9 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -172,6 +172,7 @@ xe-$(CONFIG_PCI_IOV) += \
 	xe_lmtt.o \
 	xe_lmtt_2l.o \
 	xe_lmtt_ml.o \
+	xe_mert.o \
 	xe_pci_sriov.o \
 	xe_sriov_pf.o \
 	xe_sriov_pf_control.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
index 2f97662d958d..9d74f454d3ff 100644
--- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
@@ -20,6 +20,7 @@
 #define   GU_MISC_IRQ				REG_BIT(29)
 #define   ERROR_IRQ(x)				REG_BIT(26 + (x))
 #define   DISPLAY_IRQ				REG_BIT(16)
+#define   SOC_H2DMEMINT_IRQ			REG_BIT(13)
 #define   I2C_IRQ				REG_BIT(12)
 #define   GT_DW_IRQ(x)				REG_BIT(x)
 
diff --git a/drivers/gpu/drm/xe/regs/xe_mert_regs.h b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
index 5b7c15e08747..aef66c04901d 100644
--- a/drivers/gpu/drm/xe/regs/xe_mert_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
@@ -10,4 +10,7 @@
 
 #define MERT_LMEM_CFG				XE_REG(0x1448b0)
 
+#define MERT_TLB_INV_DESC_A			XE_REG(0x14cf7c)
+#define   MERT_TLB_INV_DESC_A_VALID		REG_BIT(0)
+
 #endif /* _XE_MERT_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 0b95d6539bc0..38623def6f30 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -17,6 +17,7 @@
 #include "xe_late_bind_fw_types.h"
 #include "xe_lmtt_types.h"
 #include "xe_memirq_types.h"
+#include "xe_mert.h"
 #include "xe_oa_types.h"
 #include "xe_platform_types.h"
 #include "xe_pmu_types.h"
@@ -219,6 +220,9 @@ struct xe_tile {
 
 	/** @debugfs: debugfs directory associated with this tile */
 	struct dentry *debugfs;
+
+	/** @mert: MERT-related data */
+	struct xe_mert mert;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index e5ed0242f7b1..919ef19149be 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -21,6 +21,7 @@
 #include "xe_hw_error.h"
 #include "xe_i2c.h"
 #include "xe_memirq.h"
+#include "xe_mert.h"
 #include "xe_mmio.h"
 #include "xe_pxp.h"
 #include "xe_sriov.h"
@@ -525,6 +526,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 				xe_heci_csc_irq_handler(xe, master_ctl);
 			xe_display_irq_handler(xe, master_ctl);
 			xe_i2c_irq_handler(xe, master_ctl);
+			xe_mert_irq_handler(xe, master_ctl);
 			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
 		}
 	}
diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index f50c5a4b9edf..3059ea6525bc 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -15,6 +15,7 @@
 #include "xe_tlb_inval.h"
 #include "xe_lmtt.h"
 #include "xe_map.h"
+#include "xe_mert.h"
 #include "xe_mmio.h"
 #include "xe_res_cursor.h"
 #include "xe_sriov.h"
@@ -270,19 +271,29 @@ static int lmtt_invalidate_hw(struct xe_lmtt *lmtt)
  * @lmtt: the &xe_lmtt to invalidate
  *
  * Send requests to all GuCs on this tile to invalidate all TLBs.
+ * If the platform has a standalone MERT, also invalidate MERT's TLB.
  *
  * This function should be called only when running as a PF driver.
  */
 void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
 {
+	struct xe_tile *tile = lmtt_to_tile(lmtt);
+	struct xe_device *xe = lmtt_to_xe(lmtt);
 	int err;
 
-	lmtt_assert(lmtt, IS_SRIOV_PF(lmtt_to_xe(lmtt)));
+	lmtt_assert(lmtt, IS_SRIOV_PF(xe));
 
 	err = lmtt_invalidate_hw(lmtt);
 	if (err)
-		xe_tile_sriov_err(lmtt_to_tile(lmtt), "LMTT invalidation failed (%pe)",
+		xe_tile_sriov_err(tile, "LMTT invalidation failed (%pe)",
 				  ERR_PTR(err));
+
+	if (xe_device_has_mert(xe) && xe_tile_is_root(tile)) {
+		err = xe_mert_invalidate_lmtt(tile);
+		if (err)
+			xe_tile_sriov_err(tile, "MERT LMTT invalidation failed (%pe)",
+					  ERR_PTR(err));
+	}
 }
 
 static void lmtt_write_pte(struct xe_lmtt *lmtt, struct xe_lmtt_pt *pt,
diff --git a/drivers/gpu/drm/xe/xe_mert.c b/drivers/gpu/drm/xe/xe_mert.c
new file mode 100644
index 000000000000..304cc8421999
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_mert.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2025, Intel Corporation. All rights reserved.
+ */
+
+#include "regs/xe_irq_regs.h"
+#include "regs/xe_mert_regs.h"
+
+#include "xe_device.h"
+#include "xe_mert.h"
+#include "xe_mmio.h"
+#include "xe_tile.h"
+
+/**
+ * xe_mert_invalidate_lmtt - Invalidate MERT LMTT
+ * @tile: the &xe_tile
+ *
+ * Trigger invalidation of the MERT LMTT and wait for completion.
+ *
+ * Return: 0 on success or -ETIMEDOUT in case of a timeout.
+ */
+int xe_mert_invalidate_lmtt(struct xe_tile *tile)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_mert *mert = &tile->mert;
+	const long timeout = HZ / 4;
+	unsigned long flags;
+
+	xe_assert(xe, xe_device_has_mert(xe));
+	xe_assert(xe, xe_tile_is_root(tile));
+
+	spin_lock_irqsave(&mert->lock, flags);
+	if (!mert->tlb_inv_triggered) {
+		mert->tlb_inv_triggered = true;
+		reinit_completion(&mert->tlb_inv_done);
+		xe_mmio_write32(&tile->mmio, MERT_TLB_INV_DESC_A, MERT_TLB_INV_DESC_A_VALID);
+	}
+	spin_unlock_irqrestore(&mert->lock, flags);
+
+	if (!wait_for_completion_timeout(&mert->tlb_inv_done, timeout))
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+/**
+ * xe_mert_irq_handler - Handler for MERT interrupts
+ * @xe: the &xe_device
+ * @master_ctl: interrupt register
+ *
+ * Handle interrupts generated by MERT.
+ */
+void xe_mert_irq_handler(struct xe_device *xe, u32 master_ctl)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	unsigned long flags;
+	u32 reg_val;
+
+	if (!(master_ctl & SOC_H2DMEMINT_IRQ))
+		return;
+
+	spin_lock_irqsave(&tile->mert.lock, flags);
+	if (tile->mert.tlb_inv_triggered) {
+		reg_val = xe_mmio_read32(&tile->mmio, MERT_TLB_INV_DESC_A);
+		if (!(reg_val & MERT_TLB_INV_DESC_A_VALID)) {
+			tile->mert.tlb_inv_triggered = false;
+			complete_all(&tile->mert.tlb_inv_done);
+		}
+	}
+	spin_unlock_irqrestore(&tile->mert.lock, flags);
+}
diff --git a/drivers/gpu/drm/xe/xe_mert.h b/drivers/gpu/drm/xe/xe_mert.h
new file mode 100644
index 000000000000..2e14c5dec008
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_mert.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2025, Intel Corporation. All rights reserved.
+ */
+
+#ifndef __XE_MERT_H__
+#define __XE_MERT_H__
+
+#include <linux/completion.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+struct xe_device;
+struct xe_tile;
+
+struct xe_mert {
+	/** @lock: protects the TLB invalidation status */
+	spinlock_t lock;
+	/** @tlb_inv_triggered: indicates if TLB invalidation was triggered */
+	bool tlb_inv_triggered;
+	/** @mert.tlb_inv_done: completion of TLB invalidation */
+	struct completion tlb_inv_done;
+};
+
+#ifdef CONFIG_PCI_IOV
+int xe_mert_invalidate_lmtt(struct xe_tile *tile);
+void xe_mert_irq_handler(struct xe_device *xe, u32 master_ctl);
+#else
+static inline void xe_mert_irq_handler(struct xe_device *xe, u32 master_ctl) { }
+#endif
+
+#endif /* __XE_MERT_H__ */
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
index bc1ab9ee31d9..00e80f6d0634 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
@@ -88,6 +88,7 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
  */
 int xe_sriov_pf_init_early(struct xe_device *xe)
 {
+	struct xe_mert *mert = &xe_device_get_root_tile(xe)->mert;
 	int err;
 
 	xe_assert(xe, IS_SRIOV_PF(xe));
@@ -103,6 +104,9 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
 
 	xe_sriov_pf_service_init(xe);
 
+	spin_lock_init(&mert->lock);
+	init_completion(&mert->tlb_inv_done);
+
 	return 0;
 }
 
-- 
2.40.0

