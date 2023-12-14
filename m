Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D65C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 19:02:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F4710E98F;
	Thu, 14 Dec 2023 19:02:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB2310E977
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 19:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702580451; x=1734116451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dWF35imafkIKeQYHzLUmdAKq41lyoJlXAmurXfgdWYc=;
 b=KFjLR+8HdC1v+6a4DkX+iqSZ07BFduTv+pyeY1lwj4dlO2Rkfh8eoTWE
 dSScxXJeCVLjbK9Os4eSARgdANTRMmpTcr2ivdMykHqGtkaWAvDFG2LlV
 ZQVy+6CaleUK4X6b6iIGVudNpdYFtqrsxGJJ9xWcK3jezAodc0ovhwfAz
 8zT/c9lOwFcg35JVaAGZFXQODnOkZGaMwuUGhHw2pLulvXxW3lfUna9mk
 PUeO/BE6xMOXA2vgIs6LjVjpm97j0J9D3hEI7nu23BmWAd68sbqS6DwAm
 OYaxqTQiBm/jMU774a+ABuhEI0wauCcwnok4NVCyGlwYi8WNLOD0Zufih A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="399006410"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="399006410"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 11:00:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="15964800"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.128.198])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 11:00:25 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 07/10] drm/xe/vf: Introduce Memory Based Interrupts Handler
Date: Thu, 14 Dec 2023 19:59:52 +0100
Message-Id: <20231214185955.1791-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231214185955.1791-1-michal.wajdeczko@intel.com>
References: <20231214185955.1791-1-michal.wajdeczko@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The register based interrupts infrastructure does not scale
efficiently to allow delivering interrupts to a large number
of virtual machines. Memory based interrupt reporting provides
an efficient and scalable infrastructure.

Define handler to read and dispatch memory based interrupts.
We will use this handler in upcoming patch.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
v2: force UC, use GRAPHICS_VERx100 instead flag (Matt)
---
 drivers/gpu/drm/xe/Makefile          |   4 +-
 drivers/gpu/drm/xe/xe_device.c       |   7 +
 drivers/gpu/drm/xe/xe_device.h       |   5 +
 drivers/gpu/drm/xe/xe_device_types.h |   5 +
 drivers/gpu/drm/xe/xe_memirq.c       | 430 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_memirq.h       |  26 ++
 drivers/gpu/drm/xe/xe_memirq_types.h |  37 +++
 7 files changed, 513 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_memirq.c
 create mode 100644 drivers/gpu/drm/xe/xe_memirq.h
 create mode 100644 drivers/gpu/drm/xe/xe_memirq_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index f4ae063a7005..3be7ed101d7b 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -137,7 +137,9 @@ xe-y += xe_bb.o \
 xe-$(CONFIG_HWMON) += xe_hwmon.o
 
 # graphics virtualization (SR-IOV) support
-xe-y += xe_sriov.o
+xe-y += \
+	xe_memirq.o \
+	xe_sriov.o
 
 xe-$(CONFIG_PCI_IOV) += \
 	xe_lmtt.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 221e87584352..746074066e08 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -29,12 +29,14 @@
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_irq.h"
+#include "xe_memirq.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_pat.h"
 #include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_query.h"
+#include "xe_sriov.h"
 #include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
@@ -456,6 +458,11 @@ int xe_device_probe(struct xe_device *xe)
 		err = xe_ggtt_init_early(tile->mem.ggtt);
 		if (err)
 			return err;
+		if (IS_SRIOV_VF(xe)) {
+			err = xe_memirq_init(&tile->sriov.vf.memirq);
+			if (err)
+				return err;
+		}
 	}
 
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 3da83b233206..af8ac2e9e270 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -168,6 +168,11 @@ static inline bool xe_device_has_sriov(struct xe_device *xe)
 	return xe->info.has_sriov;
 }
 
+static inline bool xe_device_has_memirq(struct xe_device *xe)
+{
+	return GRAPHICS_VERx100(xe) >= 1250;
+}
+
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index d1a48456e9a3..404999eac4f6 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -16,6 +16,7 @@
 #include "xe_heci_gsc.h"
 #include "xe_gt_types.h"
 #include "xe_lmtt_types.h"
+#include "xe_memirq_types.h"
 #include "xe_platform_types.h"
 #include "xe_pt_types.h"
 #include "xe_pmu.h"
@@ -193,6 +194,10 @@ struct xe_tile {
 			/** @sriov.pf.lmtt: Local Memory Translation Table. */
 			struct xe_lmtt lmtt;
 		} pf;
+		struct {
+			/** @sriov.vf.memirq: Memory Based Interrupts. */
+			struct xe_memirq memirq;
+		} vf;
 	} sriov;
 
 	/** @migrate: Migration helper for vram blits and clearing */
diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
new file mode 100644
index 000000000000..76e95535d7f6
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -0,0 +1,430 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+
+#include "regs/xe_gt_regs.h"
+#include "regs/xe_guc_regs.h"
+#include "regs/xe_regs.h"
+
+#include "xe_assert.h"
+#include "xe_bo.h"
+#include "xe_device.h"
+#include "xe_device_types.h"
+#include "xe_gt.h"
+#include "xe_gt_printk.h"
+#include "xe_guc.h"
+#include "xe_hw_engine.h"
+#include "xe_map.h"
+#include "xe_memirq.h"
+#include "xe_sriov.h"
+#include "xe_sriov_printk.h"
+
+#define memirq_assert(m, condition)	xe_tile_assert(memirq_to_tile(m), condition)
+#define memirq_debug(m, msg...)		xe_sriov_dbg_verbose(memirq_to_xe(m), "MEMIRQ: " msg)
+
+static struct xe_tile *memirq_to_tile(struct xe_memirq *memirq)
+{
+	return container_of(memirq, struct xe_tile, sriov.vf.memirq);
+}
+
+static struct xe_device *memirq_to_xe(struct xe_memirq *memirq)
+{
+	return tile_to_xe(memirq_to_tile(memirq));
+}
+
+static const char *guc_name(struct xe_guc *guc)
+{
+	return xe_gt_is_media_type(guc_to_gt(guc)) ? "media GuC" : "GuC";
+}
+
+/**
+ * DOC: Memory Based Interrupts
+ *
+ * MMIO register based interrupts infrastructure used for non-virtualized mode
+ * or SRIOV-8 (which supports 8 Virtual Functions) does not scale efficiently
+ * to allow delivering interrupts to a large number of Virtual machines or
+ * containers. Memory based interrupt status reporting provides an efficient
+ * and scalable infrastructure.
+ *
+ * For memory based interrupt status reporting hardware sequence is:
+ *  * Engine writes the interrupt event to memory
+ *    (Pointer to memory location is provided by SW. This memory surface must
+ *    be mapped to system memory and must be marked as un-cacheable (UC) on
+ *    Graphics IP Caches)
+ *  * Engine triggers an interrupt to host.
+ */
+
+/**
+ * DOC: Memory Based Interrupts Page Layout
+ *
+ * `Memory Based Interrupts`_ requires three different objects, which are
+ * called "page" in the specs, even if they aren't page-sized or aligned.
+ *
+ * To simplify the code we allocate a single page size object and then use
+ * offsets to embedded "pages". The address of those "pages" are then
+ * programmed in the HW via LRI and LRM in the context image.
+ *
+ * - _`Interrupt Status Report Page`: this page contains the interrupt
+ *   status vectors for each unit. Each bit in the interrupt vectors is
+ *   converted to a byte, with the byte being set to 0xFF when an
+ *   interrupt is triggered; interrupt vectors are 16b big so each unit
+ *   gets 16B. One space is reserved for each bit in one of the
+ *   GT_INTR_DWx registers, so this object needs a total of 1024B.
+ *   This object needs to be 4KiB aligned.
+ *
+ * - _`Interrupt Source Report Page`: this is the equivalent of the
+ *   GEN11_GT_INTR_DWx registers, with each bit in those registers being
+ *   mapped to a byte here. The offsets are the same, just bytes instead
+ *   of bits. This object needs to be cacheline aligned.
+ *
+ * - Interrupt Mask: the HW needs a location to fetch the interrupt
+ *   mask vector to be used by the LRM in the context, so we just use
+ *   the next available space in the interrupt page.
+ *
+ * ::
+ *
+ *   0x0000   +===========+  <== Interrupt Status Report Page
+ *            |           |
+ *            |           |     ____ +----+----------------+
+ *            |           |    /     |  0 | USER INTERRUPT |
+ *            +-----------+ __/      |  1 |                |
+ *            |  HWE(n)   | __       |    | CTX SWITCH     |
+ *            +-----------+   \      |    | WAIT SEMAPHORE |
+ *            |           |    \____ | 15 |                |
+ *            |           |          +----+----------------+
+ *            |           |
+ *   0x0400   +===========+  <== Interrupt Source Report Page
+ *            |  HWE(0)   |
+ *            |  HWE(1)   |
+ *            |           |
+ *            |  HWE(x)   |
+ *   0x0440   +===========+  <== Interrupt Enable Mask
+ *            |           |
+ *            |           |
+ *            +-----------+
+ */
+
+static void __release_xe_bo(struct drm_device *drm, void *arg)
+{
+	struct xe_bo *bo = arg;
+
+	xe_bo_unpin_map_no_vm(bo);
+}
+
+static int memirq_alloc_pages(struct xe_memirq *memirq)
+{
+	struct xe_device *xe = memirq_to_xe(memirq);
+	struct xe_tile *tile = memirq_to_tile(memirq);
+	struct xe_bo *bo;
+	int err;
+
+	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_SOURCE_OFFSET, SZ_64));
+	BUILD_BUG_ON(!IS_ALIGNED(XE_MEMIRQ_STATUS_OFFSET, SZ_4K));
+
+	/* XXX: convert to managed bo */
+	bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K,
+				  ttm_bo_type_kernel,
+				  XE_BO_CREATE_SYSTEM_BIT |
+				  XE_BO_CREATE_GGTT_BIT |
+				  XE_BO_NEEDS_UC |
+				  XE_BO_NEEDS_CPU_ACCESS);
+	if (IS_ERR(bo)) {
+		err = PTR_ERR(bo);
+		goto out;
+	}
+
+	memirq_assert(memirq, !xe_bo_is_vram(bo));
+	memirq_assert(memirq, !memirq->bo);
+
+	iosys_map_memset(&bo->vmap, 0, 0, SZ_4K);
+
+	memirq->bo = bo;
+	memirq->source = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_SOURCE_OFFSET);
+	memirq->status = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_STATUS_OFFSET);
+	memirq->mask = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_ENABLE_OFFSET);
+
+	memirq_assert(memirq, !memirq->source.is_iomem);
+	memirq_assert(memirq, !memirq->status.is_iomem);
+	memirq_assert(memirq, !memirq->mask.is_iomem);
+
+	memirq_debug(memirq, "page offsets: source %#x status %#x\n",
+		     xe_memirq_source_ptr(memirq), xe_memirq_status_ptr(memirq));
+
+	return drmm_add_action_or_reset(&xe->drm, __release_xe_bo, memirq->bo);
+
+out:
+	xe_sriov_err(memirq_to_xe(memirq),
+		     "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
+	return err;
+}
+
+static void memirq_set_enable(struct xe_memirq *memirq, bool enable)
+{
+	iosys_map_wr(&memirq->mask, 0, u32, enable ? GENMASK(15, 0) : 0);
+
+	memirq->enabled = enable;
+}
+
+/**
+ * xe_memirq_init - Initialize data used by `Memory Based Interrupts`_.
+ * @memirq: the &xe_memirq to initialize
+ *
+ * Allocate `Interrupt Source Report Page`_ and `Interrupt Status Report Page`_
+ * used by `Memory Based Interrupts`_.
+ *
+ * These allocations are managed and will be implicitly released on unload.
+ *
+ * Note: This function shall be called only by the VF driver.
+ *
+ * If this function fails then VF driver won't be able to operate correctly.
+ * If `Memory Based Interrupts`_ are not used this function will return 0.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_memirq_init(struct xe_memirq *memirq)
+{
+	struct xe_device *xe = memirq_to_xe(memirq);
+	int err;
+
+	memirq_assert(memirq, IS_SRIOV_VF(xe));
+
+	if (!xe_device_has_memirq(xe))
+		return 0;
+
+	err = memirq_alloc_pages(memirq);
+	if (unlikely(err))
+		return err;
+
+	/* we need to start with all irqs enabled */
+	memirq_set_enable(memirq, true);
+
+	return 0;
+}
+
+/**
+ * xe_memirq_source_ptr - Get GGTT's offset of the `Interrupt Source Report Page`_.
+ * @memirq: the &xe_memirq to query
+ *
+ * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
+ * and xe_memirq_init() didn't fail.
+ *
+ * Return: GGTT's offset of the `Interrupt Source Report Page`_.
+ */
+u32 xe_memirq_source_ptr(struct xe_memirq *memirq)
+{
+	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
+	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
+	memirq_assert(memirq, memirq->bo);
+
+	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_SOURCE_OFFSET;
+}
+
+/**
+ * xe_memirq_status_ptr - Get GGTT's offset of the `Interrupt Status Report Page`_.
+ * @memirq: the &xe_memirq to query
+ *
+ * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
+ * and xe_memirq_init() didn't fail.
+ *
+ * Return: GGTT's offset of the `Interrupt Status Report Page`_.
+ */
+u32 xe_memirq_status_ptr(struct xe_memirq *memirq)
+{
+	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
+	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
+	memirq_assert(memirq, memirq->bo);
+
+	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_STATUS_OFFSET;
+}
+
+/**
+ * xe_memirq_enable_ptr - Get GGTT's offset of the Interrupt Enable Mask.
+ * @memirq: the &xe_memirq to query
+ *
+ * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
+ * and xe_memirq_init() didn't fail.
+ *
+ * Return: GGTT's offset of the Interrupt Enable Mask.
+ */
+u32 xe_memirq_enable_ptr(struct xe_memirq *memirq)
+{
+	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
+	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
+	memirq_assert(memirq, memirq->bo);
+
+	return xe_bo_ggtt_addr(memirq->bo) + XE_MEMIRQ_ENABLE_OFFSET;
+}
+
+/**
+ * xe_memirq_init_guc - Prepare GuC for `Memory Based Interrupts`_.
+ * @memirq: the &xe_memirq
+ * @guc: the &xe_guc to setup
+ *
+ * Register `Interrupt Source Report Page`_ and `Interrupt Status Report Page`_
+ * to be used by the GuC when `Memory Based Interrupts`_ are required.
+ *
+ * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
+ * and xe_memirq_init() didn't fail.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
+{
+	bool is_media = xe_gt_is_media_type(guc_to_gt(guc));
+	u32 offset = is_media ? ilog2(INTR_MGUC) : ilog2(INTR_GUC);
+	u32 source, status;
+	int err;
+
+	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
+	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
+	memirq_assert(memirq, memirq->bo);
+
+	source = xe_memirq_source_ptr(memirq) + offset;
+	status = xe_memirq_status_ptr(memirq) + offset * SZ_16;
+
+	err = xe_guc_self_cfg64(guc, GUC_KLV_SELF_CFG_MEMIRQ_SOURCE_ADDR_KEY,
+				source);
+	if (unlikely(err))
+		goto failed;
+
+	err = xe_guc_self_cfg64(guc, GUC_KLV_SELF_CFG_MEMIRQ_STATUS_ADDR_KEY,
+				status);
+	if (unlikely(err))
+		goto failed;
+
+	return 0;
+
+failed:
+	xe_sriov_err(memirq_to_xe(memirq),
+		     "Failed to setup report pages in %s (%pe)\n",
+		     guc_name(guc), ERR_PTR(err));
+	return err;
+}
+
+/**
+ * xe_memirq_reset - Disable processing of `Memory Based Interrupts`_.
+ * @memirq: struct xe_memirq
+ *
+ * This is part of the driver IRQ setup flow.
+ *
+ * This function shall only be used by the VF driver on platforms that use
+ * `Memory Based Interrupts`_.
+ */
+void xe_memirq_reset(struct xe_memirq *memirq)
+{
+	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
+	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
+
+	if (memirq->bo)
+		memirq_set_enable(memirq, false);
+}
+
+/**
+ * xe_memirq_postinstall - Enable processing of `Memory Based Interrupts`_.
+ * @memirq: the &xe_memirq
+ *
+ * This is part of the driver IRQ setup flow.
+ *
+ * This function shall only be used by the VF driver on platforms that use
+ * `Memory Based Interrupts`_.
+ */
+void xe_memirq_postinstall(struct xe_memirq *memirq)
+{
+	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
+	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
+
+	if (memirq->bo)
+		memirq_set_enable(memirq, true);
+}
+
+static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
+			    u16 offset, const char *name)
+{
+	u8 value;
+
+	value = iosys_map_rd(vector, offset, u8);
+	if (value) {
+		if (value != 0xff)
+			xe_sriov_err_ratelimited(memirq_to_xe(memirq),
+						 "Unexpected memirq value %#x from %s at %u\n",
+						 value, name, offset);
+		iosys_map_wr(vector, offset, u8, 0x00);
+	}
+
+	return value;
+}
+
+static void memirq_dispatch_engine(struct xe_memirq *memirq, struct iosys_map *status,
+				   struct xe_hw_engine *hwe)
+{
+	memirq_debug(memirq, "STATUS %s %*ph\n", hwe->name, 16, status->vaddr);
+
+	if (memirq_received(memirq, status, ilog2(GT_RENDER_USER_INTERRUPT), hwe->name))
+		xe_hw_engine_handle_irq(hwe, GT_RENDER_USER_INTERRUPT);
+}
+
+static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *status,
+				struct xe_guc *guc)
+{
+	const char *name = guc_name(guc);
+
+	memirq_debug(memirq, "STATUS %s %*ph\n", name, 16, status->vaddr);
+
+	if (memirq_received(memirq, status, ilog2(GUC_INTR_GUC2HOST), name))
+		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
+}
+
+/**
+ * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
+ * @memirq: the &xe_memirq
+ *
+ * This function reads and dispatches `Memory Based Interrupts`.
+ */
+void xe_memirq_handler(struct xe_memirq *memirq)
+{
+	struct xe_device *xe = memirq_to_xe(memirq);
+	struct xe_tile *tile = memirq_to_tile(memirq);
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	struct iosys_map map;
+	unsigned int gtid;
+	struct xe_gt *gt;
+
+	if (!memirq->bo)
+		return;
+
+	memirq_assert(memirq, !memirq->source.is_iomem);
+	memirq_debug(memirq, "SOURCE %*ph\n", 32, memirq->source.vaddr);
+	memirq_debug(memirq, "SOURCE %*ph\n", 32, memirq->source.vaddr + 32);
+
+	for_each_gt(gt, xe, gtid) {
+		if (gt->tile != tile)
+			continue;
+
+		for_each_hw_engine(hwe, gt, id) {
+			if (memirq_received(memirq, &memirq->source, hwe->irq_offset, "SRC")) {
+				map = IOSYS_MAP_INIT_OFFSET(&memirq->status,
+							    hwe->irq_offset * SZ_16);
+				memirq_dispatch_engine(memirq, &map, hwe);
+			}
+		}
+	}
+
+	/* GuC and media GuC (if present) must be checked separately */
+
+	if (memirq_received(memirq, &memirq->source, ilog2(INTR_GUC), "SRC")) {
+		map = IOSYS_MAP_INIT_OFFSET(&memirq->status, ilog2(INTR_GUC) * SZ_16);
+		memirq_dispatch_guc(memirq, &map, &tile->primary_gt->uc.guc);
+	}
+
+	if (!tile->media_gt)
+		return;
+
+	if (memirq_received(memirq, &memirq->source, ilog2(INTR_MGUC), "SRC")) {
+		map = IOSYS_MAP_INIT_OFFSET(&memirq->status, ilog2(INTR_MGUC) * SZ_16);
+		memirq_dispatch_guc(memirq, &map, &tile->media_gt->uc.guc);
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memirq.h
new file mode 100644
index 000000000000..2d40d03c3095
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_memirq.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_MEMIRQ_H_
+#define _XE_MEMIRQ_H_
+
+#include <linux/types.h>
+
+struct xe_guc;
+struct xe_memirq;
+
+int xe_memirq_init(struct xe_memirq *memirq);
+
+u32 xe_memirq_source_ptr(struct xe_memirq *memirq);
+u32 xe_memirq_status_ptr(struct xe_memirq *memirq);
+u32 xe_memirq_enable_ptr(struct xe_memirq *memirq);
+
+void xe_memirq_reset(struct xe_memirq *memirq);
+void xe_memirq_postinstall(struct xe_memirq *memirq);
+void xe_memirq_handler(struct xe_memirq *memirq);
+
+int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_memirq_types.h b/drivers/gpu/drm/xe/xe_memirq_types.h
new file mode 100644
index 000000000000..625b6b8736cc
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_memirq_types.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_MEMIRQ_TYPES_H_
+#define _XE_MEMIRQ_TYPES_H_
+
+#include <linux/iosys-map.h>
+
+struct xe_bo;
+
+/* ISR */
+#define XE_MEMIRQ_STATUS_OFFSET		0x0
+/* IIR */
+#define XE_MEMIRQ_SOURCE_OFFSET		0x400
+/* IMR */
+#define XE_MEMIRQ_ENABLE_OFFSET		0x440
+
+/**
+ * struct xe_memirq - Data used by the `Memory Based Interrupts`_.
+ *
+ * @bo: buffer object with `Memory Based Interrupts Page Layout`_.
+ * @source: iosys pointer to `Interrupt Source Report Page`_.
+ * @status: iosys pointer to `Interrupt Status Report Page`_.
+ * @mask: iosys pointer to Interrupt Enable Mask.
+ * @enabled: internal flag used to control processing of the interrupts.
+ */
+struct xe_memirq {
+	struct xe_bo *bo;
+	struct iosys_map source;
+	struct iosys_map status;
+	struct iosys_map mask;
+	bool enabled;
+};
+
+#endif
-- 
2.25.1

