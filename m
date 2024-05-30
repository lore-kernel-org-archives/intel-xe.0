Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF712C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 13:35:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4270911B6AA;
	Thu, 30 May 2024 13:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FtsaTyKW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21500113C14
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 13:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717076143; x=1748612143;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xr42Ad9JepSHXE7wZRg5mLZaavdgznwTnl7JYVWaRUY=;
 b=FtsaTyKWmTlwlcfu7mTAqdTBibD1i3LNsyM5oVtD4NnROX38avuWudJr
 AL7DEJenhEW3u2xHDry6o/4cZOi1UB1XWkGui+yCb70NUNdM4wLQxivTD
 JyNlkWapRVZtRJoq1XoOIB8fOlYwab7IQD/dVWux8JitFzPsdyjVRHAR6
 608ee+SpaQ/RVTTy9vwTl/dJu89xe94B9kBe+tDCgTLw9DPtzuAwvAGVz
 KujMFI1dROnqXrBU7taZn37/QXNu8NhFj2TPVIrXYxu8p6zAdllw0/b9/
 eAgRNt5rwXcMCjCUz3G1cv0jsjevLSnJt1eS+7KkW/6ZMPLt/dV7/vF7L g==;
X-CSE-ConnectionGUID: b2Q2dSNoSOGpPk0NDcuAfg==
X-CSE-MsgGUID: UqCme5utSECEZtss4AviIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24681360"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24681360"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:35:43 -0700
X-CSE-ConnectionGUID: i6V/21GtS/qOFuL+FdUe1g==
X-CSE-MsgGUID: a6XKP/kXTxeb7u5OQ/xLsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="40733758"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:35:42 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 4/5] drm/xe: Promote VRAM initialization function to own
 file
Date: Thu, 30 May 2024 15:35:26 +0200
Message-Id: <20240530133527.1328-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240530133527.1328-1-michal.wajdeczko@intel.com>
References: <20240530133527.1328-1-michal.wajdeczko@intel.com>
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

There is no point in mixing register access and VRAM code in the
same file. Move and rename the VRAM probe function to a new file
(there are no other changes other then new simple kernel-doc).

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
v2: rebase + s/MMIO/register access/ in commit message (Matt)
---
 drivers/gpu/drm/xe/Makefile    |   1 +
 drivers/gpu/drm/xe/xe_device.c |   3 +-
 drivers/gpu/drm/xe/xe_mmio.c   | 333 +------------------------------
 drivers/gpu/drm/xe/xe_vram.c   | 350 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vram.h   |  13 ++
 5 files changed, 368 insertions(+), 332 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vram.c
 create mode 100644 drivers/gpu/drm/xe/xe_vram.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index d5b137e762ed..74bd64d9e8ab 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -143,6 +143,7 @@ xe-y += xe_bb.o \
 	xe_uc_debugfs.o \
 	xe_uc_fw.o \
 	xe_vm.o \
+	xe_vram.o \
 	xe_vram_freq.o \
 	xe_wait_user_fence.o \
 	xe_wa.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ab96c50c6af4..1530ba308481 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -51,6 +51,7 @@
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
+#include "xe_vram.h"
 #include "xe_wait_user_fence.h"
 
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
@@ -619,7 +620,7 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_irq_shutdown;
 
-	err = xe_mmio_probe_vram(xe);
+	err = xe_vram_probe(xe);
 	if (err)
 		goto err_irq_shutdown;
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 6e57632b44a1..7962eeb9adb7 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -8,348 +8,19 @@
 #include <linux/delay.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/minmax.h>
+#include <linux/pci.h>
 
 #include <drm/drm_managed.h>
-#include <drm/xe_drm.h>
+#include <drm/drm_print.h>
 
 #include "regs/xe_bars.h"
-#include "regs/xe_engine_regs.h"
-#include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
-#include "xe_bo.h"
 #include "xe_device.h"
-#include "xe_force_wake.h"
-#include "xe_ggtt.h"
 #include "xe_gt.h"
-#include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_macros.h"
-#include "xe_module.h"
 #include "xe_sriov.h"
-#include "xe_tile.h"
-
-#define BAR_SIZE_SHIFT 20
-
-static void
-_resize_bar(struct xe_device *xe, int resno, resource_size_t size)
-{
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	int bar_size = pci_rebar_bytes_to_size(size);
-	int ret;
-
-	if (pci_resource_len(pdev, resno))
-		pci_release_resource(pdev, resno);
-
-	ret = pci_resize_resource(pdev, resno, bar_size);
-	if (ret) {
-		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
-			 resno, 1 << bar_size, ERR_PTR(ret));
-		return;
-	}
-
-	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
-}
-
-/*
- * if force_vram_bar_size is set, attempt to set to the requested size
- * else set to maximum possible size
- */
-static void resize_vram_bar(struct xe_device *xe)
-{
-	u64 force_vram_bar_size = xe_modparam.force_vram_bar_size;
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	struct pci_bus *root = pdev->bus;
-	resource_size_t current_size;
-	resource_size_t rebar_size;
-	struct resource *root_res;
-	u32 bar_size_mask;
-	u32 pci_cmd;
-	int i;
-
-	/* gather some relevant info */
-	current_size = pci_resource_len(pdev, LMEM_BAR);
-	bar_size_mask = pci_rebar_get_possible_sizes(pdev, LMEM_BAR);
-
-	if (!bar_size_mask)
-		return;
-
-	/* set to a specific size? */
-	if (force_vram_bar_size) {
-		u32 bar_size_bit;
-
-		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
-
-		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
-
-		if (!bar_size_bit) {
-			drm_info(&xe->drm,
-				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
-				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
-			return;
-		}
-
-		rebar_size = 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
-
-		if (rebar_size == current_size)
-			return;
-	} else {
-		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
-
-		/* only resize if larger than current */
-		if (rebar_size <= current_size)
-			return;
-	}
-
-	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
-		 (u64)current_size >> 20, (u64)rebar_size >> 20);
-
-	while (root->parent)
-		root = root->parent;
-
-	pci_bus_for_each_resource(root, root_res, i) {
-		if (root_res && root_res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
-		    (u64)root_res->start > 0x100000000ul)
-			break;
-	}
-
-	if (!root_res) {
-		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
-		return;
-	}
-
-	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
-	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
-
-	_resize_bar(xe, LMEM_BAR, rebar_size);
-
-	pci_assign_unassigned_bus_resources(pdev->bus);
-	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
-}
-
-static bool resource_is_valid(struct pci_dev *pdev, int bar)
-{
-	if (!pci_resource_flags(pdev, bar))
-		return false;
-
-	if (pci_resource_flags(pdev, bar) & IORESOURCE_UNSET)
-		return false;
-
-	if (!pci_resource_len(pdev, bar))
-		return false;
-
-	return true;
-}
-
-static int determine_lmem_bar_size(struct xe_device *xe)
-{
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-
-	if (!resource_is_valid(pdev, LMEM_BAR)) {
-		drm_err(&xe->drm, "pci resource is not valid\n");
-		return -ENXIO;
-	}
-
-	resize_vram_bar(xe);
-
-	xe->mem.vram.io_start = pci_resource_start(pdev, LMEM_BAR);
-	xe->mem.vram.io_size = pci_resource_len(pdev, LMEM_BAR);
-	if (!xe->mem.vram.io_size)
-		return -EIO;
-
-	/* XXX: Need to change when xe link code is ready */
-	xe->mem.vram.dpa_base = 0;
-
-	/* set up a map to the total memory area. */
-	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
-
-	return 0;
-}
-
-static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-	u64 offset;
-	u32 reg;
-
-	if (GRAPHICS_VER(xe) >= 20) {
-		u64 ccs_size = tile_size / 512;
-		u64 offset_hi, offset_lo;
-		u32 nodes, num_enabled;
-
-		reg = xe_mmio_read32(gt, MIRROR_FUSE3);
-		nodes = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, reg);
-		num_enabled = hweight32(nodes); /* Number of enabled l3 nodes */
-
-		reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_LOWER);
-		offset_lo = REG_FIELD_GET(XE2_FLAT_CCS_BASE_LOWER_ADDR_MASK, reg);
-
-		reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_UPPER);
-		offset_hi = REG_FIELD_GET(XE2_FLAT_CCS_BASE_UPPER_ADDR_MASK, reg);
-
-		offset = offset_hi << 32; /* HW view bits 39:32 */
-		offset |= offset_lo << 6; /* HW view bits 31:6 */
-		offset *= num_enabled; /* convert to SW view */
-
-		/* We don't expect any holes */
-		xe_assert_msg(xe, offset == (xe_mmio_read64_2x32(gt, GSMBASE) - ccs_size),
-			      "Hole between CCS and GSM.\n");
-	} else {
-		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
-		offset = (u64)REG_FIELD_GET(XEHP_FLAT_CCS_PTR, reg) * SZ_64K;
-	}
-
-	return offset;
-}
-
-/*
- * tile_vram_size() - Collect vram size and offset information
- * @tile: tile to get info for
- * @vram_size: available vram (size - device reserved portions)
- * @tile_size: actual vram size
- * @tile_offset: physical start point in the vram address space
- *
- * There are 4 places for size information:
- * - io size (from pci_resource_len of LMEM bar) (only used for small bar and DG1)
- * - TILEx size (actual vram size)
- * - GSMBASE offset (TILEx - "stolen")
- * - CSSBASE offset (TILEx - CSS space necessary)
- *
- * CSSBASE is always a lower/smaller offset then GSMBASE.
- *
- * The actual available size of memory is to the CCS or GSM base.
- * NOTE: multi-tile bases will include the tile offset.
- *
- */
-static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
-			  u64 *tile_size, u64 *tile_offset)
-{
-	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_gt *gt = tile->primary_gt;
-	u64 offset;
-	int err;
-	u32 reg;
-
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
-		return err;
-
-	/* actual size */
-	if (unlikely(xe->info.platform == XE_DG1)) {
-		*tile_size = pci_resource_len(to_pci_dev(xe->drm.dev), LMEM_BAR);
-		*tile_offset = 0;
-	} else {
-		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_TILE_ADDR_RANGE(gt->info.id));
-		*tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
-		*tile_offset = (u64)REG_FIELD_GET(GENMASK(7, 1), reg) * SZ_1G;
-	}
-
-	/* minus device usage */
-	if (xe->info.has_flat_ccs) {
-		offset = get_flat_ccs_offset(gt, *tile_size);
-	} else {
-		offset = xe_mmio_read64_2x32(gt, GSMBASE);
-	}
-
-	/* remove the tile offset so we have just the available size */
-	*vram_size = offset - *tile_offset;
-
-	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-}
-
-static void vram_fini(void *arg)
-{
-	struct xe_device *xe = arg;
-	struct xe_tile *tile;
-	int id;
-
-	if (xe->mem.vram.mapping)
-		iounmap(xe->mem.vram.mapping);
-
-	xe->mem.vram.mapping = NULL;
-
-	for_each_tile(tile, xe, id)
-		tile->mem.vram.mapping = NULL;
-}
-
-int xe_mmio_probe_vram(struct xe_device *xe)
-{
-	struct xe_tile *tile;
-	resource_size_t io_size;
-	u64 available_size = 0;
-	u64 total_size = 0;
-	u64 tile_offset;
-	u64 tile_size;
-	u64 vram_size;
-	int err;
-	u8 id;
-
-	if (!IS_DGFX(xe))
-		return 0;
-
-	/* Get the size of the root tile's vram for later accessibility comparison */
-	tile = xe_device_get_root_tile(xe);
-	err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
-	if (err)
-		return err;
-
-	err = determine_lmem_bar_size(xe);
-	if (err)
-		return err;
-
-	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
-		 &xe->mem.vram.io_size);
-
-	io_size = xe->mem.vram.io_size;
-
-	/* tile specific ranges */
-	for_each_tile(tile, xe, id) {
-		err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
-		if (err)
-			return err;
-
-		tile->mem.vram.actual_physical_size = tile_size;
-		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
-		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
-
-		if (!tile->mem.vram.io_size) {
-			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
-			return -ENODEV;
-		}
-
-		tile->mem.vram.dpa_base = xe->mem.vram.dpa_base + tile_offset;
-		tile->mem.vram.usable_size = vram_size;
-		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
-
-		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
-			drm_info(&xe->drm, "Small BAR device\n");
-		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
-			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
-		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
-			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,
-			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);
-
-		/* calculate total size using tile size to get the correct HW sizing */
-		total_size += tile_size;
-		available_size += vram_size;
-
-		if (total_size > xe->mem.vram.io_size) {
-			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
-				 &total_size, &xe->mem.vram.io_size);
-		}
-
-		io_size -= min_t(u64, tile_size, io_size);
-	}
-
-	xe->mem.vram.actual_physical_size = total_size;
-
-	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
-		 &xe->mem.vram.actual_physical_size);
-	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
-		 &available_size);
-
-	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
-}
 
 static void tiles_fini(void *arg)
 {
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
new file mode 100644
index 000000000000..6fa150643242
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -0,0 +1,350 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021-2024 Intel Corporation
+ */
+
+#include <linux/pci.h>
+
+#include <drm/drm_managed.h>
+#include <drm/drm_print.h>
+
+#include "regs/xe_bars.h"
+#include "regs/xe_gt_regs.h"
+#include "regs/xe_regs.h"
+#include "xe_assert.h"
+#include "xe_device.h"
+#include "xe_force_wake.h"
+#include "xe_gt_mcr.h"
+#include "xe_mmio.h"
+#include "xe_module.h"
+#include "xe_vram.h"
+
+#define BAR_SIZE_SHIFT 20
+
+static void
+_resize_bar(struct xe_device *xe, int resno, resource_size_t size)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	int bar_size = pci_rebar_bytes_to_size(size);
+	int ret;
+
+	if (pci_resource_len(pdev, resno))
+		pci_release_resource(pdev, resno);
+
+	ret = pci_resize_resource(pdev, resno, bar_size);
+	if (ret) {
+		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
+			 resno, 1 << bar_size, ERR_PTR(ret));
+		return;
+	}
+
+	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
+}
+
+/*
+ * if force_vram_bar_size is set, attempt to set to the requested size
+ * else set to maximum possible size
+ */
+static void resize_vram_bar(struct xe_device *xe)
+{
+	u64 force_vram_bar_size = xe_modparam.force_vram_bar_size;
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct pci_bus *root = pdev->bus;
+	resource_size_t current_size;
+	resource_size_t rebar_size;
+	struct resource *root_res;
+	u32 bar_size_mask;
+	u32 pci_cmd;
+	int i;
+
+	/* gather some relevant info */
+	current_size = pci_resource_len(pdev, LMEM_BAR);
+	bar_size_mask = pci_rebar_get_possible_sizes(pdev, LMEM_BAR);
+
+	if (!bar_size_mask)
+		return;
+
+	/* set to a specific size? */
+	if (force_vram_bar_size) {
+		u32 bar_size_bit;
+
+		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
+
+		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
+
+		if (!bar_size_bit) {
+			drm_info(&xe->drm,
+				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
+				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
+			return;
+		}
+
+		rebar_size = 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
+
+		if (rebar_size == current_size)
+			return;
+	} else {
+		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
+
+		/* only resize if larger than current */
+		if (rebar_size <= current_size)
+			return;
+	}
+
+	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
+		 (u64)current_size >> 20, (u64)rebar_size >> 20);
+
+	while (root->parent)
+		root = root->parent;
+
+	pci_bus_for_each_resource(root, root_res, i) {
+		if (root_res && root_res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
+		    (u64)root_res->start > 0x100000000ul)
+			break;
+	}
+
+	if (!root_res) {
+		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
+		return;
+	}
+
+	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
+	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
+
+	_resize_bar(xe, LMEM_BAR, rebar_size);
+
+	pci_assign_unassigned_bus_resources(pdev->bus);
+	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
+}
+
+static bool resource_is_valid(struct pci_dev *pdev, int bar)
+{
+	if (!pci_resource_flags(pdev, bar))
+		return false;
+
+	if (pci_resource_flags(pdev, bar) & IORESOURCE_UNSET)
+		return false;
+
+	if (!pci_resource_len(pdev, bar))
+		return false;
+
+	return true;
+}
+
+static int determine_lmem_bar_size(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+
+	if (!resource_is_valid(pdev, LMEM_BAR)) {
+		drm_err(&xe->drm, "pci resource is not valid\n");
+		return -ENXIO;
+	}
+
+	resize_vram_bar(xe);
+
+	xe->mem.vram.io_start = pci_resource_start(pdev, LMEM_BAR);
+	xe->mem.vram.io_size = pci_resource_len(pdev, LMEM_BAR);
+	if (!xe->mem.vram.io_size)
+		return -EIO;
+
+	/* XXX: Need to change when xe link code is ready */
+	xe->mem.vram.dpa_base = 0;
+
+	/* set up a map to the total memory area. */
+	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
+
+	return 0;
+}
+
+static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	u64 offset;
+	u32 reg;
+
+	if (GRAPHICS_VER(xe) >= 20) {
+		u64 ccs_size = tile_size / 512;
+		u64 offset_hi, offset_lo;
+		u32 nodes, num_enabled;
+
+		reg = xe_mmio_read32(gt, MIRROR_FUSE3);
+		nodes = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, reg);
+		num_enabled = hweight32(nodes); /* Number of enabled l3 nodes */
+
+		reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_LOWER);
+		offset_lo = REG_FIELD_GET(XE2_FLAT_CCS_BASE_LOWER_ADDR_MASK, reg);
+
+		reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_UPPER);
+		offset_hi = REG_FIELD_GET(XE2_FLAT_CCS_BASE_UPPER_ADDR_MASK, reg);
+
+		offset = offset_hi << 32; /* HW view bits 39:32 */
+		offset |= offset_lo << 6; /* HW view bits 31:6 */
+		offset *= num_enabled; /* convert to SW view */
+
+		/* We don't expect any holes */
+		xe_assert_msg(xe, offset == (xe_mmio_read64_2x32(gt, GSMBASE) - ccs_size),
+			      "Hole between CCS and GSM.\n");
+	} else {
+		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
+		offset = (u64)REG_FIELD_GET(XEHP_FLAT_CCS_PTR, reg) * SZ_64K;
+	}
+
+	return offset;
+}
+
+/*
+ * tile_vram_size() - Collect vram size and offset information
+ * @tile: tile to get info for
+ * @vram_size: available vram (size - device reserved portions)
+ * @tile_size: actual vram size
+ * @tile_offset: physical start point in the vram address space
+ *
+ * There are 4 places for size information:
+ * - io size (from pci_resource_len of LMEM bar) (only used for small bar and DG1)
+ * - TILEx size (actual vram size)
+ * - GSMBASE offset (TILEx - "stolen")
+ * - CSSBASE offset (TILEx - CSS space necessary)
+ *
+ * CSSBASE is always a lower/smaller offset then GSMBASE.
+ *
+ * The actual available size of memory is to the CCS or GSM base.
+ * NOTE: multi-tile bases will include the tile offset.
+ *
+ */
+static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
+			  u64 *tile_size, u64 *tile_offset)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_gt *gt = tile->primary_gt;
+	u64 offset;
+	int err;
+	u32 reg;
+
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (err)
+		return err;
+
+	/* actual size */
+	if (unlikely(xe->info.platform == XE_DG1)) {
+		*tile_size = pci_resource_len(to_pci_dev(xe->drm.dev), LMEM_BAR);
+		*tile_offset = 0;
+	} else {
+		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_TILE_ADDR_RANGE(gt->info.id));
+		*tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
+		*tile_offset = (u64)REG_FIELD_GET(GENMASK(7, 1), reg) * SZ_1G;
+	}
+
+	/* minus device usage */
+	if (xe->info.has_flat_ccs) {
+		offset = get_flat_ccs_offset(gt, *tile_size);
+	} else {
+		offset = xe_mmio_read64_2x32(gt, GSMBASE);
+	}
+
+	/* remove the tile offset so we have just the available size */
+	*vram_size = offset - *tile_offset;
+
+	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+}
+
+static void vram_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+	struct xe_tile *tile;
+	int id;
+
+	if (xe->mem.vram.mapping)
+		iounmap(xe->mem.vram.mapping);
+
+	xe->mem.vram.mapping = NULL;
+
+	for_each_tile(tile, xe, id)
+		tile->mem.vram.mapping = NULL;
+}
+
+/**
+ * xe_vram_probe() - Probe VRAM configuration
+ * @xe: the &xe_device
+ *
+ * Collect VRAM size and offset information for all tiles.
+ *
+ * Return: 0 on success, error code on failure
+ */
+int xe_vram_probe(struct xe_device *xe)
+{
+	struct xe_tile *tile;
+	resource_size_t io_size;
+	u64 available_size = 0;
+	u64 total_size = 0;
+	u64 tile_offset;
+	u64 tile_size;
+	u64 vram_size;
+	int err;
+	u8 id;
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	/* Get the size of the root tile's vram for later accessibility comparison */
+	tile = xe_device_get_root_tile(xe);
+	err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
+	if (err)
+		return err;
+
+	err = determine_lmem_bar_size(xe);
+	if (err)
+		return err;
+
+	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
+		 &xe->mem.vram.io_size);
+
+	io_size = xe->mem.vram.io_size;
+
+	/* tile specific ranges */
+	for_each_tile(tile, xe, id) {
+		err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
+		if (err)
+			return err;
+
+		tile->mem.vram.actual_physical_size = tile_size;
+		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
+		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
+
+		if (!tile->mem.vram.io_size) {
+			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+			return -ENODEV;
+		}
+
+		tile->mem.vram.dpa_base = xe->mem.vram.dpa_base + tile_offset;
+		tile->mem.vram.usable_size = vram_size;
+		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
+
+		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
+			drm_info(&xe->drm, "Small BAR device\n");
+		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
+			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
+		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
+			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,
+			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);
+
+		/* calculate total size using tile size to get the correct HW sizing */
+		total_size += tile_size;
+		available_size += vram_size;
+
+		if (total_size > xe->mem.vram.io_size) {
+			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
+				 &total_size, &xe->mem.vram.io_size);
+		}
+
+		io_size -= min_t(u64, tile_size, io_size);
+	}
+
+	xe->mem.vram.actual_physical_size = total_size;
+
+	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
+		 &xe->mem.vram.actual_physical_size);
+	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
+		 &available_size);
+
+	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
+}
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
new file mode 100644
index 000000000000..e31cc04ec0db
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_VRAM_H_
+#define _XE_VRAM_H_
+
+struct xe_device;
+
+int xe_vram_probe(struct xe_device *xe);
+
+#endif
-- 
2.43.0

