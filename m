Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131A2FD45EE
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 20:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F7110E82A;
	Wed, 25 Feb 2026 20:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RAm4kZDs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B414A10E82C
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 20:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772050836; x=1803586836;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r7/5GbUl4awlyHH9k/6DY9ayWfU4aQsUx/iejtQ+dcA=;
 b=RAm4kZDsJStpXj3iUsV6ifdwD6ymVfLIRK7QFH2lWw3YFEsx/6Fr/RMZ
 PMtRsjZKspNN1GyH53VefH2mgSzAKoZvgJazIuhh5KclYzqaxzJy45j1C
 1V1ECLCvDV8JgM4VwQfcHmSFhFZdBTpJfvjXNVu7V990fnJRmXNjmmuhq
 j6n+tQ+QEHqxfSsHRUjUIZhwFMUFgqE5XcQ+1wSsCtiysYdyZbnhIUYHm
 /sSAruTFJy0fN/+KsHWCjf505fz3BcV5H+guWoRFudz/jBB3ca6XowNYe
 8AH/U5TUwvjcCWyxUHBSno5VXPOYS3SI4lPnf9rlIpQUeYI7FOMkZg808 Q==;
X-CSE-ConnectionGUID: zYp8ykSMQRmqy8WdCEtlAw==
X-CSE-MsgGUID: vp+FOXJgSiy36Tbj8xdbwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73010163"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="73010163"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 12:20:36 -0800
X-CSE-ConnectionGUID: t/lTMmNqQMiPydntVJCevw==
X-CSE-MsgGUID: TRC+qe+fRDuQzdaA1n4sXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="246891627"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 12:20:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH] drm/xe: Add unsafe GAM port backend for TLB inval + PF ack
 profiling
Date: Wed, 25 Feb 2026 12:20:29 -0800
Message-Id: <20260225202029.2722574-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Wire up a new GAM port MMIO mailbox and a GAM-backed TLB
invalidation/page fault ack path, selectable via the module_param_unsafe
gam_tlb_inval_mode. GAM TLB invalidations can be disabled or issued
immediately.

This is intended for profiling/experimentation to compare GuC-mediated
TLB invalidations and page fault responses against the direct GAM port
path and measure the latency/throughput differences. Enabling this is
unsafe (bypasses the normal firmware-mediated flow) and is therefore
disabled by default and incompatible with SR-IOV / ctx TLB inval
configurations.

Bspec: 59311

Assisted-by: Chat-GPT # Documentation
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Makefile                 |   2 +
 drivers/gpu/drm/xe/xe_defaults.h            |   1 +
 drivers/gpu/drm/xe/xe_device.c              |  16 +-
 drivers/gpu/drm/xe/xe_device_types.h        |   3 +
 drivers/gpu/drm/xe/xe_gam_port.c            | 308 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gam_port.h            |  33 +++
 drivers/gpu/drm/xe/xe_gam_port_types.h      |  21 ++
 drivers/gpu/drm/xe/xe_gam_tlb_inval.c       | 175 +++++++++++
 drivers/gpu/drm/xe/xe_gam_tlb_inval.h       |  17 ++
 drivers/gpu/drm/xe/xe_gam_tlb_inval_types.h |  22 ++
 drivers/gpu/drm/xe/xe_gt.c                  |  11 +-
 drivers/gpu/drm/xe/xe_gt.h                  |  15 +-
 drivers/gpu/drm/xe/xe_gt_types.h            |   4 +
 drivers/gpu/drm/xe/xe_guc_pagefault.c       |  33 ++-
 drivers/gpu/drm/xe/xe_module.c              |   7 +
 drivers/gpu/drm/xe/xe_module.h              |   1 +
 drivers/gpu/drm/xe/xe_pci.c                 |  10 +-
 drivers/gpu/drm/xe/xe_tlb_inval.c           |   7 +-
 18 files changed, 674 insertions(+), 12 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gam_port.c
 create mode 100644 drivers/gpu/drm/xe/xe_gam_port.h
 create mode 100644 drivers/gpu/drm/xe/xe_gam_port_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_gam_tlb_inval.c
 create mode 100644 drivers/gpu/drm/xe/xe_gam_tlb_inval.h
 create mode 100644 drivers/gpu/drm/xe/xe_gam_tlb_inval_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 41ec698b3cc1..3a6acc42d017 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -46,6 +46,8 @@ xe-y += xe_bb.o \
 	xe_exec_queue.o \
 	xe_execlist.o \
 	xe_force_wake.o \
+	xe_gam_port.o \
+	xe_gam_tlb_inval.o \
 	xe_ggtt.o \
 	xe_gpu_scheduler.o \
 	xe_gsc.o \
diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
index 5d5d41d067c5..cfe965538460 100644
--- a/drivers/gpu/drm/xe/xe_defaults.h
+++ b/drivers/gpu/drm/xe/xe_defaults.h
@@ -14,6 +14,7 @@
 #endif
 
 #define XE_DEFAULT_PROBE_DISPLAY		true
+#define XE_DEFAULT_GAM_TLB_INVAL_MODE		XE_GAM_TLB_INVAL_MODE_DISABLED
 #define XE_DEFAULT_VRAM_BAR_SIZE		0
 #define XE_DEFAULT_FORCE_PROBE			CONFIG_DRM_XE_FORCE_PROBE
 #define XE_DEFAULT_MAX_VFS			~0
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3462645ca13c..b8bb1e92ee64 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -436,6 +436,17 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	ttm_device_fini(&xe->ttm);
 }
 
+static void xe_device_parse_modparam(struct xe_device *xe)
+{
+	xe->info.force_execlist = xe_modparam.force_execlist;
+	xe->atomic_svm_timeslice_ms = 5;
+	xe->min_run_period_lr_ms = 5;
+
+	xe->info.gam_tlb_inval_mode = xe_modparam.gam_tlb_inval_mode;
+	if (xe->info.gam_tlb_inval_mode >= XE_GAM_TLB_INVAL_MODE_COUNT)
+		xe->info.gam_tlb_inval_mode = XE_GAM_TLB_INVAL_MODE_DISABLED;
+}
+
 struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent)
 {
@@ -469,9 +480,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
-	xe->info.force_execlist = xe_modparam.force_execlist;
-	xe->atomic_svm_timeslice_ms = 5;
-	xe->min_run_period_lr_ms = 5;
+
+	xe_device_parse_modparam(xe);
 
 	err = xe_irq_init(xe);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8f3ef836541e..fb739c004882 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -14,6 +14,7 @@
 
 #include "xe_devcoredump_types.h"
 #include "xe_heci_gsc.h"
+#include "xe_gam_tlb_inval_types.h"
 #include "xe_late_bind_fw_types.h"
 #include "xe_oa_types.h"
 #include "xe_pagefault_types.h"
@@ -124,6 +125,8 @@ struct xe_device {
 		enum xe_platform platform;
 		/** @info.subplatform: Xe subplatform enum */
 		enum xe_subplatform subplatform;
+		/** @info.gam_tlb_inval_mode: Xe GAM TLB invalidation mode */
+		enum xe_gam_tlb_inval_mode gam_tlb_inval_mode;
 		/** @info.devid: device ID */
 		u16 devid;
 		/** @info.revid: device revision */
diff --git a/drivers/gpu/drm/xe/xe_gam_port.c b/drivers/gpu/drm/xe/xe_gam_port.c
new file mode 100644
index 000000000000..5ed92d97157d
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gam_port.c
@@ -0,0 +1,308 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+
+#include "xe_device_types.h"
+#include "xe_gam_port.h"
+#include "xe_gam_port_types.h"
+#include "xe_mmio.h"
+
+/**
+ * DOC: Xe GAM port
+ *
+ * The GAM port is a simple MMIO mailbox used to send descriptors to the
+ * graphics address management (GAM) block. Descriptors are written into
+ * GAM_PORT_DESC{0,1,2} and then the hardware consumes them and clears the
+ * VALID bit in DESC0 to signal completion.
+ *
+ * This file provides a small, serialized API around the GAM port for:
+ *   - TLB invalidation (global, GGTT, and PPGTT range/page invalidations)
+ *   - Page fault response (PFR) acknowledgements
+ *   - Page reclaim requests
+ *
+ * Concurrency:
+ * All access to the GAM port registers is serialized by @xe_gam_port.mmio_lock,
+ * since the hardware exposes a single set of descriptor registers.
+ *
+ * Completion:
+ * For commands that require completion, the driver polls for DESC0.VALID to
+ * clear via xe_gam_port_poll_completion(). Page fault response acknowledgements
+ * currently do not poll for completion.
+ */
+
+/* Bspec: 59311 for MMIO interface */
+
+#define GAM_PORT_DESC0				XE_REG(0xcf7c)
+#define GAM_PORT_DESC0_VALID			REG_BIT(0)
+#define GAM_PORT_DESC0_PFR_UNSUCCESSFUL		REG_BIT(1)
+#define GAM_PORT_DESC0_PFR_TYPE			REG_GENMASK(4, 2)
+#define GAM_PORT_DESC0_TLB_INVAL_GRANULARITY	REG_GENMASK(2, 1)
+#define GAM_PORT_DESC0_TLB_INVAL_ADDR_MASK	REG_GENMASK(8, 3)
+#define GAM_PORT_DESC0_TLB_INVAL_MODE		REG_BIT(9)
+#define GAM_PORT_DESC0_TYPE			REG_GENMASK(11, 10)
+#define GAM_PORT_DESC0_ASID			REG_GENMASK(31, 12)
+
+enum pfr_type {
+	PFR_TYPE_ACCESS			= 0,
+	PFR_TYPE_ENGINE			= 1,
+	PFR_TYPE_ASID_VF		= 2,
+	PFR_TYPE_VF			= 3,
+	PFR_TYPE_ALL			= 4,
+};
+
+enum tlb_inval_granularity {
+	TLB_INVAL_GRANULARITY_ALL	= 0,
+	TLB_INVAL_GRANULARITY_ASID_VF	= 1,
+	TLB_INVAL_GRANULARITY_VF	= 2,
+	TLB_INVAL_GRANULARITY_PAGE	= 3,
+};
+
+enum tlb_inval_mode {
+	TLB_INVAL_MODE_HEAVY		= 0,
+	TLB_INVAL_MODE_LIGHT		= 1,
+};
+
+enum gam_port_desc_type {
+	GAM_PORT_DESC_TYPE_TLB_INVAL	= 0,
+	GAM_PORT_DESC_TYPE_PFR		= 1,	/* Page fault response */
+	GAM_PORT_DESC_TYPE_PR		= 2,	/* Page reclaim */
+};
+
+#define GAM_PORT_DESC1				XE_REG(0xcf80)
+#define GAM_PORT_DESC1_VFID			REG_GENMASK(5, 0)
+#define GAM_PORT_DESC1_PFR_PREFETCH		BIT(6)
+#define GAM_PORT_DESC1_PFR_ENG_INSTANCE		REG_GENMASK(12, 7)
+#define GAM_PORT_DESC1_PFR_ENG_CLASS		REG_GENMASK(15, 13)
+#define GAM_PORT_DESC1_PFR_PRIVATE_DATA		REG_GENMASK(31, 16)
+#define GAM_PORT_DESC1_TLB_INVAL_GLOBAL_INV	BIT(6)
+#define GAM_PORT_DESC1_TLB_INVAL_CACHE_FLUSH	BIT(7)
+#define GAM_PORT_DESC1_ADDRESS_LOW		REG_GENMASK(31, 12)
+
+#define GAM_PORT_DESC2				XE_REG(0xcf84)
+#define GAM_PORT_DESC2_ADDRESS_HIGH		REG_GENMASK(25, 0)
+
+/**
+ * xe_gam_port_init() - Initialize a GAM port instance
+ * @xe: Xe device
+ * @gp: GAM port instance to initialize
+ * @mmio: MMIO accessor used for register reads/writes
+ *
+ * Stores the MMIO accessor and initializes the internal mutex used to serialize
+ * descriptor programming.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int xe_gam_port_init(struct xe_device *xe, struct xe_gam_port *gp,
+		     struct xe_mmio *mmio)
+{
+	gp->mmio = mmio;
+
+	return drmm_mutex_init(&xe->drm, &gp->mmio_lock);
+}
+
+static int xe_gam_port_poll_completion(struct xe_gam_port *gp)
+{
+	const u32 timeout_us = 500000;
+
+	lockdep_assert(&gp->mmio_lock);
+
+	return xe_mmio_wait32(gp->mmio, GAM_PORT_DESC0, GAM_PORT_DESC0_VALID, 0,
+			      timeout_us, NULL, false);
+}
+
+/**
+ * xe_gam_port_tlb_inval_all() - Invalidate all TLBs
+ * @gp: GAM port
+ *
+ * Issues a heavy, global TLB invalidation at ALL granularity and requests a
+ * cache flush. This is the broadest invalidation supported by the GAM port.
+ *
+ * Return: 0 on success, negative errno on timeout/failure.
+ */
+int xe_gam_port_tlb_inval_all(struct xe_gam_port *gp)
+{
+	guard(mutex)(&gp->mmio_lock);
+
+	xe_mmio_write32(gp->mmio, GAM_PORT_DESC1,
+			GAM_PORT_DESC1_TLB_INVAL_CACHE_FLUSH);
+	xe_mmio_write32(gp->mmio, GAM_PORT_DESC0, GAM_PORT_DESC0_VALID |
+			FIELD_PREP(GAM_PORT_DESC0_TYPE,
+				   GAM_PORT_DESC_TYPE_TLB_INVAL) |
+			FIELD_PREP(GAM_PORT_DESC0_TLB_INVAL_MODE,
+				   TLB_INVAL_MODE_HEAVY) |
+			FIELD_PREP(GAM_PORT_DESC0_TLB_INVAL_GRANULARITY,
+				   TLB_INVAL_GRANULARITY_ALL));
+
+	return xe_gam_port_poll_completion(gp);
+}
+
+/**
+ * xe_gam_port_tlb_inval_ggtt() - Invalidate GGTT translations
+ * @gp: GAM port
+ *
+ * Issues a heavy TLB invalidation targeting global/GGTT mappings.
+ *
+ * Return: 0 on success, negative errno on timeout/failure.
+ */
+int xe_gam_port_tlb_inval_ggtt(struct xe_gam_port *gp)
+{
+	guard(mutex)(&gp->mmio_lock);
+
+	xe_mmio_write32(gp->mmio, GAM_PORT_DESC1,
+			GAM_PORT_DESC1_TLB_INVAL_GLOBAL_INV);
+	xe_mmio_write32(gp->mmio, GAM_PORT_DESC0, GAM_PORT_DESC0_VALID |
+			FIELD_PREP(GAM_PORT_DESC0_TYPE,
+				   GAM_PORT_DESC_TYPE_TLB_INVAL) |
+			FIELD_PREP(GAM_PORT_DESC0_TLB_INVAL_MODE,
+				   TLB_INVAL_MODE_HEAVY));
+
+	return xe_gam_port_poll_completion(gp);
+}
+
+/**
+ * xe_gam_port_tlb_inval_asid() - Invalidate per-ASID TLBs
+ * @gp: GAM port
+ * @asid: Address space ID to invalidate
+ *
+ * Issues a heavy, per-ASID TLB invalidation at ASID_VF granularity and requests
+ * a cache flush.
+ *
+ * Return: 0 on success, negative errno on timeout/failure.
+ */
+int xe_gam_port_tlb_inval_asid(struct xe_gam_port *gp, u32 asid)
+{
+	u32 desc0 = GAM_PORT_DESC0_VALID |
+		FIELD_PREP(GAM_PORT_DESC0_TYPE, GAM_PORT_DESC_TYPE_TLB_INVAL) |
+		FIELD_PREP(GAM_PORT_DESC0_ASID, asid) |
+		FIELD_PREP(GAM_PORT_DESC0_TLB_INVAL_MODE,
+			   TLB_INVAL_MODE_HEAVY) |
+		FIELD_PREP(GAM_PORT_DESC0_TLB_INVAL_GRANULARITY,
+			   TLB_INVAL_GRANULARITY_ASID_VF);
+	u32 desc1 = GAM_PORT_DESC1_TLB_INVAL_CACHE_FLUSH;
+
+	guard(mutex)(&gp->mmio_lock);
+
+	xe_mmio_write32(gp->mmio, GAM_PORT_DESC1, desc1);
+	xe_mmio_write32(gp->mmio, GAM_PORT_DESC0, desc0);
+
+	return xe_gam_port_poll_completion(gp);
+}
+
+/**
+ * xe_gam_port_tlb_inval_ppgtt() - Invalidate PPGTT translations for a range
+ * @gp: GAM port
+ * @start: Starting GPU virtual address of the invalidation (page aligned)
+ * @order: Address mask / range order programmed into the descriptor
+ * @asid: Address space ID to invalidate
+ * @flush_cache: Whether to request a cache flush as part of the invalidation
+ *
+ * Programs a per-ASID heavy TLB invalidation at PAGE granularity. The address
+ * is communicated via DESC1/DESC2 (split into low/high parts) and @order is
+ * programmed as an address mask to describe the range.
+ *
+ * Return: 0 on success, negative errno on timeout/failure.
+ */
+int xe_gam_port_tlb_inval_ppgtt(struct xe_gam_port *gp, u64 start, u32 order,
+				u32 asid, bool flush_cache)
+{
+	u32 desc0 = GAM_PORT_DESC0_VALID |
+		FIELD_PREP(GAM_PORT_DESC0_TYPE, GAM_PORT_DESC_TYPE_TLB_INVAL) |
+		FIELD_PREP(GAM_PORT_DESC0_ASID, asid) |
+		FIELD_PREP(GAM_PORT_DESC0_TLB_INVAL_MODE,
+			   TLB_INVAL_MODE_HEAVY) |
+		FIELD_PREP(GAM_PORT_DESC0_TLB_INVAL_GRANULARITY,
+			   TLB_INVAL_GRANULARITY_PAGE) |
+		FIELD_PREP(GAM_PORT_DESC0_TLB_INVAL_ADDR_MASK, order);
+	u32 desc1 = FIELD_PREP(GAM_PORT_DESC1_ADDRESS_LOW,
+			       lower_32_bits(start) >> 12);
+	u32 desc2 = FIELD_PREP(GAM_PORT_DESC2_ADDRESS_HIGH,
+			       upper_32_bits(start));
+
+	if (flush_cache)
+		desc1 |= GAM_PORT_DESC1_TLB_INVAL_CACHE_FLUSH;
+
+	guard(mutex)(&gp->mmio_lock);
+
+	xe_mmio_write32(gp->mmio, GAM_PORT_DESC2, desc2);
+	xe_mmio_write32(gp->mmio, GAM_PORT_DESC1, desc1);
+	xe_mmio_write32(gp->mmio, GAM_PORT_DESC0, desc0);
+
+	return xe_gam_port_poll_completion(gp);
+}
+
+/**
+ * xe_gam_port_ack_fault() - Send a page fault response acknowledgment (PFR)
+ * @gp: GAM port
+ * @asid: Address space ID of the faulting context
+ * @pdata: Private data cookie associated with the fault
+ * @vfid: VF identifier (SR-IOV) for the faulting requester
+ * @engine_class: Engine class of the requester
+ * @engine_instance: Engine instance of the requester
+ * @unsuccessful: Whether to mark the response as unsuccessful
+ *
+ * Sends a PFR descriptor to acknowledge a page fault. This is currently sent
+ * without waiting for completion.
+ *
+ * Return: 0 on success (descriptor written).
+ */
+int xe_gam_port_ack_fault(struct xe_gam_port *gp, u32 asid, u32 pdata,
+			  u32 vfid, u32 engine_class, u32 engine_instance,
+			  bool unsuccessful)
+{
+	u32 desc0 = GAM_PORT_DESC0_VALID |
+		FIELD_PREP(GAM_PORT_DESC0_TYPE, GAM_PORT_DESC_TYPE_PFR) |
+		FIELD_PREP(GAM_PORT_DESC0_ASID, asid) |
+		FIELD_PREP(GAM_PORT_DESC0_PFR_TYPE, PFR_TYPE_ACCESS);
+	u32 desc1 = FIELD_PREP(GAM_PORT_DESC1_VFID, vfid) |
+		FIELD_PREP(GAM_PORT_DESC1_PFR_ENG_INSTANCE, engine_instance) |
+		FIELD_PREP(GAM_PORT_DESC1_PFR_ENG_CLASS, engine_class) |
+		FIELD_PREP(GAM_PORT_DESC1_PFR_PRIVATE_DATA, pdata);
+
+	if (unsuccessful)
+		desc0 |= GAM_PORT_DESC0_PFR_UNSUCCESSFUL;
+
+	guard(mutex)(&gp->mmio_lock);
+
+	xe_mmio_write32(gp->mmio, GAM_PORT_DESC1, desc1);
+	xe_mmio_write32(gp->mmio, GAM_PORT_DESC0, desc0);
+
+	/*
+	 * XXX: We don’t poll here because an MMIO read would kill performance
+	 * during fault storms, and testing shows that page fault acks work
+	 * without polling (at least on BMG), likely because acks are processed
+	 * faster than the MMIO write throughput.
+	 */
+
+	return 0;
+}
+
+/**
+ * xe_gam_port_page_reclaim() - Submit a page reclaim request
+ * @gp: GAM port
+ * @prl_addr: GPU address of the page reclaim list (PRL)
+ *
+ * Issues a page reclaim (PR) descriptor. The PRL address is programmed via
+ * DESC1/DESC2 (split into low/high parts).
+ *
+ * Return: 0 on success, negative errno on timeout/failure.
+ */
+int xe_gam_port_page_reclaim(struct xe_gam_port *gp, u64 prl_addr)
+{
+	u32 desc0 = GAM_PORT_DESC0_VALID |
+		FIELD_PREP(GAM_PORT_DESC0_TYPE, GAM_PORT_DESC_TYPE_PR);
+	u32 desc1 = FIELD_PREP(GAM_PORT_DESC1_ADDRESS_LOW,
+			       lower_32_bits(prl_addr) >> 12);
+	u32 desc2 = FIELD_PREP(GAM_PORT_DESC2_ADDRESS_HIGH,
+			       upper_32_bits(prl_addr));
+
+	guard(mutex)(&gp->mmio_lock);
+
+	xe_mmio_write32(gp->mmio, GAM_PORT_DESC2, desc2);
+	xe_mmio_write32(gp->mmio, GAM_PORT_DESC1, desc1);
+	xe_mmio_write32(gp->mmio, GAM_PORT_DESC0, desc0);
+
+	return xe_gam_port_poll_completion(gp);
+}
diff --git a/drivers/gpu/drm/xe/xe_gam_port.h b/drivers/gpu/drm/xe/xe_gam_port.h
new file mode 100644
index 000000000000..f10404014e20
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gam_port.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_GAM_PORT_H_
+#define _XE_GAM_PORT_H_
+
+#include <linux/types.h>
+
+struct xe_device;
+struct xe_gam_port;
+struct xe_mmio;
+
+int xe_gam_port_init(struct xe_device *xe, struct xe_gam_port *gp,
+		     struct xe_mmio *mmio);
+
+int xe_gam_port_tlb_inval_all(struct xe_gam_port *gp);
+
+int xe_gam_port_tlb_inval_ggtt(struct xe_gam_port *gp);
+
+int xe_gam_port_tlb_inval_asid(struct xe_gam_port *gp, u32 asid);
+
+int xe_gam_port_tlb_inval_ppgtt(struct xe_gam_port *gp, u64 start, u32 order,
+				u32 asid, bool flush_cache);
+
+int xe_gam_port_ack_fault(struct xe_gam_port *gp, u32 asid, u32 pdata,
+			  u32 vfid, u32 engine_class, u32 engine_instance,
+			  bool unsuccessful);
+
+int xe_gam_port_page_reclaim(struct xe_gam_port *gp, u64 prl_addr);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gam_port_types.h b/drivers/gpu/drm/xe/xe_gam_port_types.h
new file mode 100644
index 000000000000..3aad4525dec3
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gam_port_types.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_GAM_PORT_TYPES_H_
+#define _XE_GAM_PORT_TYPES_H_
+
+#include <linux/mutex.h>
+
+struct xe_mmio;
+
+/* struct xe_gam_port - Xe GAM port */
+struct xe_gam_port {
+	/** @mmio_lock: MMIO lock for GAM port */
+	struct mutex mmio_lock;
+	/** @mmio: MMIO space */
+	struct xe_mmio *mmio;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gam_tlb_inval.c b/drivers/gpu/drm/xe/xe_gam_tlb_inval.c
new file mode 100644
index 000000000000..7954c3fc71a2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gam_tlb_inval.c
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+#include <linux/circ_buf.h>
+
+#include "xe_gam_port.h"
+#include "xe_gam_tlb_inval.h"
+#include "xe_gt.h"
+#include "xe_sa.h"
+#include "xe_tlb_inval.h"
+
+/**
+ * DOC: Xe GAM TLB invalidation backend
+ *
+ * This component provides an alternative Xe TLB invalidation backend that
+ * programs invalidations directly through the GAM port MMIO mailbox
+ * (see xe_gam_port). It plugs into the generic Xe TLB invalidation framework
+ * via struct xe_tlb_inval_ops and is selected during early GT bring-up.
+ *
+ * Motivation
+ * ----------
+ * The primary goal is to provide a low-latency path for profiling and
+ * experimentation, allowing comparison of firmware-mediated invalidations
+ * (e.g. GuC) against direct GAM-port programming.
+ *
+ * Modes (@xe_device.info.gam_tlb_inval_mode)
+ * ------------------------------------------
+ * - XE_GAM_TLB_INVAL_MODE_IMMEDIATE:
+ *     Issue invalidations synchronously in the calling context. The backend
+ *     submits the GAM-port command and returns -ECANCELED on success to signal
+ *     "no async seqno to wait for" to the upper layers.
+ *
+ * Concurrency and ordering
+ * ------------------------
+ * - Immediate mode:
+ *     Caller-side serialization is handled by the GAM port itself
+ *     (xe_gam_port uses an internal mutex).
+ */
+
+static int send_tlb_inval_all(struct xe_tlb_inval *tlb_inval, u32 seqno)
+{
+	struct xe_gam_port *gp = tlb_inval->private;
+	int err;
+
+	lockdep_assert_held(&tlb_inval->seqno_lock);
+
+	err = xe_gam_port_tlb_inval_all(gp);
+	if (err)
+		return err;
+
+	return -ECANCELED;
+}
+
+static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
+{
+	struct xe_gam_port *gp = tlb_inval->private;
+	int err;
+
+	lockdep_assert_held(&tlb_inval->seqno_lock);
+
+	err = xe_gam_port_tlb_inval_ggtt(gp);
+	if (err)
+		return err;
+
+	return -ECANCELED;
+}
+
+static u64 normalize_invalidation_range(u64 *start, u64 *end)
+{
+	u64 orig_start = *start;
+	u64 length = *end - *start;
+	u64 align;
+
+	if (length < SZ_4K)
+		length = SZ_4K;
+
+	align = roundup_pow_of_two(length);
+	*start = ALIGN_DOWN(*start, align);
+	*end = ALIGN(*end, align);
+	length = align;
+	while (*start + length < *end) {
+		length <<= 1;
+		*start = ALIGN_DOWN(orig_start, length);
+	}
+
+	return length;
+}
+
+/*
+ * Ensure that roundup_pow_of_two(length) doesn't overflow.
+ * Note that roundup_pow_of_two() operates on unsigned long,
+ * not on u64.
+ */
+#define MAX_RANGE_TLB_INVALIDATION_LENGTH (rounddown_pow_of_two(ULONG_MAX))
+
+static int send_tlb_inval_asid_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
+				     u64 start, u64 end, u32 asid,
+				     struct drm_suballoc *prl_sa)
+{
+	struct xe_gam_port *gp = tlb_inval->private;
+	u64 len = end - start;
+	u32 order;
+	int err;
+
+	lockdep_assert_held(&tlb_inval->seqno_lock);
+
+	if (len > MAX_RANGE_TLB_INVALIDATION_LENGTH) {
+		err = xe_gam_port_tlb_inval_asid(gp, asid);
+		if (err)
+			return err;
+	} else {
+		len = normalize_invalidation_range(&start, &end);
+		order = ilog2(len) - ilog2(SZ_4K);
+
+		err = xe_gam_port_tlb_inval_ppgtt(gp, start, order, asid,
+						  !prl_sa);
+		if (err)
+			return err;
+	}
+
+	if (prl_sa) {
+		err = xe_gam_port_page_reclaim(gp, xe_sa_bo_gpu_addr(prl_sa));
+		if (err)
+			return err;
+	}
+
+	return -ECANCELED;
+}
+
+static bool tlb_inval_initialized(struct xe_tlb_inval *tlb_inval)
+{
+	return !!tlb_inval->private;
+}
+
+static void tlb_inval_flush(struct xe_tlb_inval *tlb_inval)
+{
+}
+
+static long tlb_inval_timeout_delay(struct xe_tlb_inval *tlb_inval)
+{
+	return HZ;
+}
+
+static const struct xe_tlb_inval_ops gam_tlb_inval_immediate_asid_ops = {
+	.all = send_tlb_inval_all,
+	.ggtt = send_tlb_inval_ggtt,
+	.ppgtt = send_tlb_inval_asid_ppgtt,
+	.initialized = tlb_inval_initialized,
+	.flush = tlb_inval_flush,
+	.timeout_delay = tlb_inval_timeout_delay,
+};
+
+/**
+ * xe_gam_tlb_inval_init_early() - Initialize GAM TLB invalidation backend
+ * @gp: GAM port object
+ * @tlb_inval: TLB invalidation client to attach the backend to
+ *
+ * Initializes backend-private state and installs the appropriate
+ * xe_tlb_inval_ops into @tlb_inval based on @xe_device.info.gam_tlb_inval_mode.
+ */
+void xe_gam_tlb_inval_init_early(struct xe_gam_port *gp,
+				 struct xe_tlb_inval *tlb_inval)
+{
+	struct xe_device *xe = gp_to_xe(gp);
+
+	xe_assert(xe, xe->info.gam_tlb_inval_mode ==
+		  XE_GAM_TLB_INVAL_MODE_IMMEDIATE);
+	xe_assert(xe, !xe->info.has_ctx_tlb_inval);	/* XXX: NIY */
+
+	tlb_inval->ops = &gam_tlb_inval_immediate_asid_ops;
+	tlb_inval->private = gp;
+}
diff --git a/drivers/gpu/drm/xe/xe_gam_tlb_inval.h b/drivers/gpu/drm/xe/xe_gam_tlb_inval.h
new file mode 100644
index 000000000000..96051f77a717
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gam_tlb_inval.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_GAM_TLB_INVAL_H_
+#define _XE_GAM_TLB_INVAL_H_
+
+#include <linux/types.h>
+
+struct xe_gam_port;
+struct xe_tlb_inval;
+
+void xe_gam_tlb_inval_init_early(struct xe_gam_port *gp,
+				 struct xe_tlb_inval *tlb_inval);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gam_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_gam_tlb_inval_types.h
new file mode 100644
index 000000000000..bd43af1318c4
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gam_tlb_inval_types.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_GAM_TLB_INVAL_TYPES_H_
+#define _XE_GAM_TLB_INVAL_TYPES_H_
+
+/**
+ * enum xe_gam_tlb_inval_mode - possible GAM TLB invalidation modes
+ * @XE_GAM_TLB_INVAL_MODE_DISABLED: GAM TLB invalidations are disabled.
+ * @XE_GAM_TLB_INVAL_MODE_IMMEDIATE: GAM TLB invalidations are immediately
+ *	issued.
+ * @XE_GAM_TLB_INVAL_MODE_COUNT: count of GAM TLB invalidations modes.
+ */
+enum xe_gam_tlb_inval_mode {
+	XE_GAM_TLB_INVAL_MODE_DISABLED = 0,
+	XE_GAM_TLB_INVAL_MODE_IMMEDIATE = 1,
+	XE_GAM_TLB_INVAL_MODE_COUNT = 2,
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index b455af1e6072..6b8dad05860b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -23,6 +23,7 @@
 #include "xe_exec_queue.h"
 #include "xe_execlist.h"
 #include "xe_force_wake.h"
+#include "xe_gam_port.h"
 #include "xe_ggtt.h"
 #include "xe_gsc.h"
 #include "xe_gt_ccs_mode.h"
@@ -492,7 +493,9 @@ int xe_gt_init_early(struct xe_gt *gt)
 	 * (including things like communication with the GuC)
 	 * be performed.
 	 */
-	xe_gt_mmio_init(gt);
+	err = xe_gt_mmio_init(gt);
+	if (err)
+		return err;
 
 	err = xe_uc_init_noalloc(&gt->uc);
 	if (err)
@@ -726,8 +729,10 @@ int xe_gt_init(struct xe_gt *gt)
  *
  * Initialize GT's MMIO accessor, which will be used to access registers inside
  * this GT.
+ *
+ * Return: 0 on success, negative error code otherwise.
  */
-void xe_gt_mmio_init(struct xe_gt *gt)
+int xe_gt_mmio_init(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_device *xe = tile_to_xe(tile);
@@ -744,6 +749,8 @@ void xe_gt_mmio_init(struct xe_gt *gt)
 
 	if (IS_SRIOV_VF(xe))
 		gt->mmio.sriov_vf_gt = gt;
+
+	return xe_gam_port_init(gt_to_xe(gt), &gt->gam_port, &gt->mmio);
 }
 
 void xe_gt_record_user_engines(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index de7e47763411..b0ece2d72f7c 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -47,7 +47,7 @@ static inline bool xe_fault_inject_gt_reset(void)
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
 int xe_gt_init_early(struct xe_gt *gt);
 int xe_gt_init(struct xe_gt *gt);
-void xe_gt_mmio_init(struct xe_gt *gt);
+int xe_gt_mmio_init(struct xe_gt *gt);
 void xe_gt_declare_wedged(struct xe_gt *gt);
 int xe_gt_record_default_lrcs(struct xe_gt *gt);
 
@@ -155,4 +155,17 @@ static inline bool xe_gt_recovery_pending(struct xe_gt *gt)
 		xe_gt_sriov_vf_recovery_pending(gt);
 }
 
+/**
+ * gp_to_xe() - GAM port to Xe device
+ * @gp: GAM port object
+ *
+ * Return: Xe device object
+ */
+static inline struct xe_device *gp_to_xe(struct xe_gam_port *gp)
+{
+	struct xe_gt *gt = container_of(gp, typeof(*gt), gam_port);
+
+	return gt_to_xe(gt);
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 8b55cf25a75f..309ae0709b6d 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -8,6 +8,7 @@
 
 #include "xe_device_types.h"
 #include "xe_force_wake_types.h"
+#include "xe_gam_port_types.h"
 #include "xe_gt_idle_types.h"
 #include "xe_gt_sriov_pf_types.h"
 #include "xe_gt_sriov_vf_types.h"
@@ -168,6 +169,9 @@ struct xe_gt {
 	 */
 	struct xe_mmio mmio;
 
+	/** @gam_port: GAM port for GT. */
+	struct xe_gam_port gam_port;
+
 	/**
 	 * @pm: power management info for GT.  The driver uses the GT's
 	 * "force wake" interface to wake up specific parts of the GT hardware
diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
index 607e32392f46..31522505b03f 100644
--- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
@@ -4,6 +4,7 @@
  */
 
 #include "abi/guc_actions_abi.h"
+#include "xe_gam_port.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_pagefault.h"
@@ -44,6 +45,27 @@ static const struct xe_pagefault_ops guc_pagefault_ops = {
 	.ack_fault = guc_ack_fault,
 };
 
+static void gam_ack_fault(struct xe_pagefault *pf, int err)
+{
+	struct xe_gam_port *gp = pf->producer.private;
+	u32 vfid = FIELD_GET(PFD_VFID, pf->producer.msg[2]);
+	u32 engine_instance = FIELD_GET(PFD_ENG_INSTANCE, pf->producer.msg[0]);
+	u32 engine_class = FIELD_GET(PFD_ENG_CLASS, pf->producer.msg[0]);
+	u32 pdata = FIELD_GET(PFD_PDATA_LO, pf->producer.msg[0]) |
+		(FIELD_GET(PFD_PDATA_HI, pf->producer.msg[1]) <<
+		 PFD_PDATA_HI_SHIFT);
+	u32 asid = FIELD_GET(PFD_ASID, pf->producer.msg[1]);
+	int ret;
+
+	ret = xe_gam_port_ack_fault(gp, asid, pdata, vfid, engine_class,
+				    engine_instance, !!err);
+	WARN_ON_ONCE(ret);
+}
+
+static const struct xe_pagefault_ops gam_pagefault_ops = {
+	.ack_fault = gam_ack_fault,
+};
+
 /**
  * xe_guc_pagefault_handler() - G2H page fault handler
  * @guc: GuC object
@@ -92,8 +114,15 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	pf.consumer.engine_class = FIELD_GET(PFD_ENG_CLASS, msg[0]);
 	pf.consumer.engine_instance = FIELD_GET(PFD_ENG_INSTANCE, msg[0]);
 
-	pf.producer.private = guc;
-	pf.producer.ops = &guc_pagefault_ops;
+	if (guc_to_xe(guc)->info.gam_tlb_inval_mode !=
+	    XE_GAM_TLB_INVAL_MODE_DISABLED) {
+		pf.producer.private = &guc_to_gt(guc)->gam_port;
+		pf.producer.ops = &gam_pagefault_ops;
+	} else {
+		pf.producer.private = guc;
+		pf.producer.ops = &guc_pagefault_ops;
+	}
+
 	for (i = 0; i < GUC_PF_MSG_LEN_DW; ++i)
 		pf.producer.msg[i] = msg[i];
 
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 903d3b433421..d1bb24640708 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -29,6 +29,7 @@ struct xe_modparam xe_modparam = {
 #endif
 	.wedged_mode =		XE_DEFAULT_WEDGED_MODE,
 	.svm_notifier_size =	XE_DEFAULT_SVM_NOTIFIER_SIZE,
+	.gam_tlb_inval_mode =	XE_DEFAULT_GAM_TLB_INVAL_MODE,
 	/* the rest are 0 by default */
 };
 
@@ -43,6 +44,12 @@ module_param_named(probe_display, xe_modparam.probe_display, bool, 0444);
 MODULE_PARM_DESC(probe_display, "Probe display HW, otherwise it's left untouched "
 		 "[default=" __stringify(XE_DEFAULT_PROBE_DISPLAY) "])");
 
+module_param_named_unsafe(gam_tlb_inval_mode, xe_modparam.gam_tlb_inval_mode,
+			  uint, 0600);
+MODULE_PARM_DESC(gam_tlb_inval_mode, "GAM TLB invalidations mode (0=disabled "
+		 "1=immediate [default="
+		 __stringify(XE_DEFAULT_GAM_TLB_INVAL_MODE) "])");
+
 module_param_named(vram_bar_size, xe_modparam.force_vram_bar_size, int, 0600);
 MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size in MiB (<0=disable-resize, 0=max-needed-size, >0=force-size "
 		 "[default=" __stringify(XE_DEFAULT_VRAM_BAR_SIZE) "])");
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 79cb9639c0f3..36f20fb318af 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -23,6 +23,7 @@ struct xe_modparam {
 #endif
 	unsigned int wedged_mode;
 	u32 svm_notifier_size;
+	u32 gam_tlb_inval_mode;
 };
 
 extern struct xe_modparam xe_modparam;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e1f569235d8a..0c593b08c683 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -608,7 +608,10 @@ static int read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u
 			gt->info.type = XE_GT_TYPE_MAIN;
 		}
 
-		xe_gt_mmio_init(gt);
+		err = xe_gt_mmio_init(gt);
+		if (err)
+			return err;
+
 		xe_guc_comm_init_early(&gt->uc.guc);
 
 		err = xe_gt_sriov_vf_bootstrap(gt);
@@ -740,7 +743,8 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_soc_remapper_sysctrl = desc->has_soc_remapper_sysctrl;
 	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
-		desc->has_sriov;
+		desc->has_sriov &&
+		xe->info.gam_tlb_inval_mode == XE_GAM_TLB_INVAL_MODE_DISABLED;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
 	xe->info.skip_pcode = desc->skip_pcode;
@@ -931,6 +935,8 @@ static int xe_info_init(struct xe_device *xe,
 
 	xe->info.has_range_tlb_inval = graphics_desc->has_range_tlb_inval;
 	xe->info.has_ctx_tlb_inval = graphics_desc->has_ctx_tlb_inval;
+	if (xe->info.has_ctx_tlb_inval || IS_SRIOV_VF(xe))
+		xe->info.gam_tlb_inval_mode = XE_GAM_TLB_INVAL_MODE_DISABLED;
 	xe->info.has_usm = graphics_desc->has_usm;
 	xe->info.has_64bit_timestamp = graphics_desc->has_64bit_timestamp;
 	xe->info.has_mem_copy_instr = GRAPHICS_VER(xe) >= 20;
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 933f30fb617d..93eaf202f535 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -7,6 +7,7 @@
 
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
+#include "xe_gam_tlb_inval.h"
 #include "xe_gt_stats.h"
 #include "xe_gt_types.h"
 #include "xe_guc_ct.h"
@@ -162,8 +163,10 @@ int xe_gt_tlb_inval_init_early(struct xe_gt *gt)
 	if (IS_ERR(tlb_inval->timeout_wq))
 		return PTR_ERR(tlb_inval->timeout_wq);
 
-	/* XXX: Blindly setting up backend to GuC */
-	xe_guc_tlb_inval_init_early(&gt->uc.guc, tlb_inval);
+	if (xe->info.gam_tlb_inval_mode != XE_GAM_TLB_INVAL_MODE_DISABLED)
+		xe_gam_tlb_inval_init_early(&gt->gam_port, tlb_inval);
+	else
+		xe_guc_tlb_inval_init_early(&gt->uc.guc, tlb_inval);
 
 	return drmm_add_action_or_reset(&xe->drm, tlb_inval_fini, tlb_inval);
 }
-- 
2.34.1

