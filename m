Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD484C7EE23
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 11:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A017B10E075;
	Thu,  4 May 2023 11:15:28 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2474410E05F
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 11:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683198925; x=1714734925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yloq5zn4ST5D+CuEbJ+9t/2/kp93fj5ZIDHZUian8qQ=;
 b=arLQ+xDpNXctllFEaIyLln7hYLtO51cSV3p+3N7ZAfSv6pqm7sldTPRh
 UdrBRtfVMHTmdhwpuC5LnL8FMJf311A6bVOEke9rNUkFCmePIa/V9qlFp
 w4BiJQaodcSHSGf0RoPKffGi4wjWbyh9XkZEClrDc0pklqByMvmxM1DC+
 66ywnJf63rMfAY+l+SFSR/CC8g0jmQYjtvyX+rNWnYxCTIjur2SdSTJrL
 mQL4ty0x5iI8SqXWap41jLyS4zJo2pA6ia0Jvk1+zzHJu3s5tT+u/BhzP
 WYyNheiwtCPmgBcsy/W8wkDJc4rIoQdeCJTjJLekXRoIfPtOS++x9zhcU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="333282439"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="333282439"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 04:15:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="943297253"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="943297253"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga006.fm.intel.com with ESMTP; 04 May 2023 04:15:22 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  4 May 2023 16:50:18 +0530
Message-Id: <20230504112020.300498-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230504112020.300498-1-tejas.upadhyay@intel.com>
References: <20230504112020.300498-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe: Rework multi tile device memory
 initialization
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
Cc: "Michael J . Ruhl" <michael.j.ruhl@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The vram initialization path does not take into account
each tile's actual memory size.

While updating this, simplify the rebar algorithm and clarify
some helper functions.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h   |   2 +-
 drivers/gpu/drm/xe/xe_bo.c             |   8 +-
 drivers/gpu/drm/xe/xe_bo.h             |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h   |  18 +-
 drivers/gpu/drm/xe/xe_gt_types.h       |  14 +-
 drivers/gpu/drm/xe/xe_migrate.c        |   6 +-
 drivers/gpu/drm/xe/xe_mmio.c           | 278 ++++++++++++++-----------
 drivers/gpu/drm/xe/xe_mmio.h           |   4 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  30 +--
 9 files changed, 205 insertions(+), 157 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 68e89d71cd1c..780edd4dc1bd 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -74,7 +74,7 @@
 #define VE1_AUX_NV				XE_REG(0x42b8)
 #define   AUX_INV				REG_BIT(0)
 
-#define XEHP_TILE0_ADDR_RANGE			XE_REG_MCR(0x4900)
+#define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900 + (_idx) * 4)
 #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
 
 #define CHICKEN_RASTER_1			XE_REG_MCR(0x6204, XE_REG_OPTION_MASKED)
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3ab404e33fae..7ee5a135b065 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1335,7 +1335,7 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_gt *gt,
  * XXX: This is in the VM bind data path, likely should calculate this once and
  * store, with a recalculation if the BO is moved.
  */
-uint64_t vram_region_io_offset(struct ttm_resource *res)
+uint64_t vram_region_gpu_offset(struct ttm_resource *res)
 {
 	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
 	struct xe_gt *gt = mem_type_to_gt(xe, res->mem_type);
@@ -1343,7 +1343,7 @@ uint64_t vram_region_io_offset(struct ttm_resource *res)
 	if (res->mem_type == XE_PL_STOLEN)
 		return xe_ttm_stolen_gpu_offset(xe);
 
-	return gt->mem.vram.io_start - xe->mem.vram.io_start;
+	return gt->mem.vram.base;
 }
 
 /**
@@ -1427,7 +1427,7 @@ int xe_bo_pin(struct xe_bo *bo)
 			XE_BUG_ON(!(place->flags & TTM_PL_FLAG_CONTIGUOUS));
 
 			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE, &vram) -
-				       vram_region_io_offset(bo->ttm.resource)) >> PAGE_SHIFT;
+				       vram_region_gpu_offset(bo->ttm.resource)) >> PAGE_SHIFT;
 			place->lpfn = place->fpfn + (bo->size >> PAGE_SHIFT);
 
 			spin_lock(&xe->pinned.lock);
@@ -1571,7 +1571,7 @@ dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset,
 
 		xe_res_first(bo->ttm.resource, page << PAGE_SHIFT,
 			     page_size, &cur);
-		return cur.start + offset + vram_region_io_offset(bo->ttm.resource);
+		return cur.start + offset + vram_region_gpu_offset(bo->ttm.resource);
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 8354d05ccdf3..161d5e9f09cf 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -224,7 +224,7 @@ void xe_bo_vunmap(struct xe_bo *bo);
 bool mem_type_is_vram(u32 mem_type);
 bool xe_bo_is_vram(struct xe_bo *bo);
 bool xe_bo_is_stolen(struct xe_bo *bo);
-uint64_t vram_region_io_offset(struct ttm_resource *res);
+uint64_t vram_region_gpu_offset(struct ttm_resource *res);
 
 bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 1cb404e48aaa..8898aea4bc2b 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: MIT */
 /*
- * Copyright © 2022 Intel Corporation
+ * Copyright © 2022-2023 Intel Corporation
  */
 
 #ifndef _XE_DEVICE_TYPES_H_
@@ -193,15 +193,17 @@ struct xe_device {
 			/**
 			 * @io_size: IO size of VRAM.
 			 *
-			 * This represents how much of VRAM we can access via
-			 * the CPU through the VRAM BAR. This can be smaller
-			 * than @size, in which case only part of VRAM is CPU
-			 * accessible (typically the first 256M). This
-			 * configuration is known as small-bar.
+			 * This represents how much of VRAM the CPU can access
+			 * via the VRAM BAR.
+			 * On systems that do not support large BAR IO space,
+			 * this can be smaller than the actual memory size, in
+			 * which case only part of VRAM is CPU accessible
+			 * (typically the first 256M).  This configuration is
+			 * known as small-bar.
 			 */
 			resource_size_t io_size;
-			/** @size: Total size of VRAM */
-			resource_size_t size;
+			/** @base: Offset to apply for Device Physical Address control */
+			resource_size_t base;
 			/** @mapping: pointer to VRAM mappable space */
 			void *__iomem mapping;
 		} vram;
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 7c47d67aa8be..47f059bb8c6d 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: MIT */
 /*
- * Copyright © 2022 Intel Corporation
+ * Copyright © 2022-2023 Intel Corporation
  */
 
 #ifndef _XE_GT_TYPES_H_
@@ -148,13 +148,15 @@ struct xe_gt {
 			/**
 			 * @io_size: IO size of this VRAM instance
 			 *
-			 * This represents how much of this VRAM we can access
-			 * via the CPU through the VRAM BAR. This can be smaller
-			 * than @size, in which case only part of VRAM is CPU
-			 * accessible (typically the first 256M). This
-			 * configuration is known as small-bar.
+			 * This represents how much of the VRAM the CPU can access
+			 * via the VRAM BAR.
+			 * This can be smaller than the actual @size, in which
+			 * case only part of VRAM is CPU accessible (typically
+			 * the first 256M). This configuration is known as small-bar.
 			 */
 			resource_size_t io_size;
+			/** @base: offset of VRAM starting base */
+			resource_size_t base;
 			/** @size: size of VRAM. */
 			resource_size_t size;
 			/** @mapping: pointer to VRAM mappable space */
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index f40f47ccb76f..c79561035b1b 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -270,7 +270,7 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
 		 * Use 1GB pages, it shouldn't matter the physical amount of
 		 * vram is less, when we don't access it.
 		 */
-		for (pos = 0; pos < xe->mem.vram.size; pos += SZ_1G, ofs += 8)
+		for (pos = 0; pos < xe->mem.vram.io_size; pos += SZ_1G, ofs += 8)
 			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
 	}
 
@@ -419,7 +419,7 @@ static u32 pte_update_size(struct xe_migrate *m,
 	} else {
 		/* Offset into identity map. */
 		*L0_ofs = xe_migrate_vram_ofs(cur->start +
-					      vram_region_io_offset(res));
+					      vram_region_gpu_offset(res));
 		cmds += cmd_size;
 	}
 
@@ -469,7 +469,7 @@ static void emit_pte(struct xe_migrate *m,
 					addr |= XE_PTE_PS64;
 				}
 
-				addr += vram_region_io_offset(bo->ttm.resource);
+				addr += vram_region_gpu_offset(bo->ttm.resource);
 				addr |= XE_PPGTT_PTE_LM;
 			}
 			addr |= PPAT_CACHED | XE_PAGE_PRESENT | XE_PAGE_RW;
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 3b719c774efa..2c35a1b79be7 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright © 2021 Intel Corporation
+ * Copyright © 2021-2023 Intel Corporation
  */
 
+#include <linux/minmax.h>
+
 #include "xe_mmio.h"
 
 #include <drm/drm_managed.h>
@@ -21,6 +23,8 @@
 #define TILE_COUNT		REG_GENMASK(15, 8)
 #define GEN12_LMEM_BAR		2
 
+#define BAR_SIZE_SHIFT 20
+
 static int xe_set_dma_info(struct xe_device *xe)
 {
 	unsigned int mask_size = xe->info.dma_mask_size;
@@ -61,50 +65,65 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
 	if (ret) {
 		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
 			 resno, 1 << bar_size, ERR_PTR(ret));
-		return -1;
+		return ret;
 	}
 
 	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
-	return 1;
+	return ret;
 }
 
-static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t vram_size)
+/*
+ * if force_vram_bar_size is set, attempt to set to the requested size
+ * else set to maximum possible size
+ */
+static int xe_resize_vram_bar(struct xe_device *xe)
 {
+	u64 force_vram_bar_size = xe_force_vram_bar_size;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct pci_bus *root = pdev->bus;
-	struct resource *root_res;
-	resource_size_t rebar_size;
 	resource_size_t current_size;
+	resource_size_t rebar_size;
+	struct resource *root_res;
+	u32 bar_size_mask;
 	u32 pci_cmd;
 	int i;
 	int ret;
-	u64 force_vram_bar_size = xe_force_vram_bar_size;
 
-	current_size = roundup_pow_of_two(pci_resource_len(pdev, GEN12_LMEM_BAR));
+	/* gather some relevant info */
+	current_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
+	bar_size_mask = pci_rebar_get_possible_sizes(pdev, GEN12_LMEM_BAR);
 
+	if (!bar_size_mask)
+		return 0;
+
+	/* set to a specific size? */
 	if (force_vram_bar_size) {
-		u32 bar_sizes;
+		u32 bar_size_bit;
 
 		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
-		bar_sizes = pci_rebar_get_possible_sizes(pdev, GEN12_LMEM_BAR);
 
-		if (rebar_size == current_size)
-			return 0;
+		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
 
-		if (!(bar_sizes & BIT(pci_rebar_bytes_to_size(rebar_size))) ||
-		    rebar_size >= roundup_pow_of_two(vram_size)) {
-			rebar_size = vram_size;
+		if (!bar_size_bit) {
 			drm_info(&xe->drm,
-				 "Given bar size is not within supported size, setting it to default: %lluMiB\n",
-				 (u64)vram_size >> 20);
+				 "Requested size: 0x%llx is not supported by rebar sizes: 0x%x. Leaving default: 0x%llx\n",
+				 (u64)rebar_size >> 2, bar_size_mask, (u64)current_size >> 20);
+			return 0;
 		}
+
+		rebar_size = 1ULL << (bar_size_bit + BAR_SIZE_SHIFT);
+
+		if (rebar_size == current_size)
+			return 0;
 	} else {
-		rebar_size = current_size;
+		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
 
-		if (rebar_size != roundup_pow_of_two(vram_size))
-			rebar_size = vram_size;
-		else
+		/* only resize if larger than current */
+		if (rebar_size <= current_size) {
+			drm_info(&xe->drm, "Rebar size: 0x%llx vs. actual size: 0x%llx\n",
+				 rebar_size, current_size);
 			return 0;
+		}
 	}
 
 	drm_info(&xe->drm, "Resizing bar from %lluMiB -> %lluMiB\n",
@@ -148,143 +167,169 @@ static bool xe_pci_resource_valid(struct pci_dev *pdev, int bar)
 	return true;
 }
 
-int xe_mmio_total_vram_size(struct xe_device *xe, u64 *vram_size, u64 *usable_size)
+static int xe_determine_lmem_bar_size(struct xe_device *xe)
 {
-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	int err;
-	u32 reg;
 
-	if (!xe->info.has_flat_ccs)  {
-		*vram_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
-		if (usable_size)
-			*usable_size = min(*vram_size,
-					   xe_mmio_read64(gt, GSMBASE.reg));
-		return 0;
+	if (!xe_pci_resource_valid(pdev, GEN12_LMEM_BAR)) {
+		drm_err(&xe->drm, "pci resource is not valid\n");
+		return -ENXIO;
 	}
 
+	err = xe_resize_vram_bar(xe);
+	if (err)
+		return err;
+
+	xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
+	xe->mem.vram.io_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
+	if (!xe->mem.vram.io_size)
+		return -EIO;
+
+	xe->mem.vram.base = 0; /* DPA offset */
+
+	/* set up a map to the total memory area. */
+	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
+
+	return 0;
+}
+
+/**
+ * xe_mmio_tile_vram_size - Collect vram size and off set information
+ * @gt: tile to get info for
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
+ * NOTE: CSSBASE is always a lower/smaller offset then GSMBASE.
+ *
+ * The actual available size of memory is to the CCS or GSM base.
+ * NOTE: multi-tile bases will include the tile offset.
+ *
+ */
+int xe_mmio_tile_vram_size(struct xe_gt *gt, u64 *vram_size, u64 *tile_size, u64 *tile_offset)
+{
+	u64 offset;
+	int err;
+	u32 reg;
+
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		return err;
 
-	reg = xe_gt_mcr_unicast_read_any(gt, XEHP_TILE0_ADDR_RANGE);
-	*vram_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
-	if (usable_size) {
+	/* actual size */
+	if (unlikely(gt->xe->info.platform == XE_DG1)) {
+		*tile_size = pci_resource_len(to_pci_dev(gt->xe->drm.dev), GEN12_LMEM_BAR);
+		*tile_offset = 0;
+	} else {
+		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_TILE_ADDR_RANGE(gt->info.id));
+		*tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
+		*tile_offset = (u64)REG_FIELD_GET(GENMASK(7, 1), reg) * SZ_1G;
+	}
+
+	/* minus device usage */
+	if (gt->xe->info.has_flat_ccs) {
 		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
-		*usable_size = (u64)REG_FIELD_GET(GENMASK(31, 8), reg) * SZ_64K;
-		drm_info(&xe->drm, "vram_size: 0x%llx usable_size: 0x%llx\n",
-			 *vram_size, *usable_size);
+		offset = (u64)REG_FIELD_GET(GENMASK(31, 8), reg) * SZ_64K;
+	} else {
+		offset = xe_mmio_read64(gt, GSMBASE.reg);
 	}
 
+	/* remove the tile offset so we have just the available size */
+	*vram_size = offset - *tile_offset;
+
 	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 }
 
 int xe_mmio_probe_vram(struct xe_device *xe)
 {
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	resource_size_t io_size;
+	u64 available_size = 0;
+	u64 total_size = 0;
 	struct xe_gt *gt;
-	u8 id;
+	u64 tile_offset;
+	u64 tile_size;
 	u64 vram_size;
-	u64 original_size;
-	u64 usable_size;
 	int err;
+	u8 id;
 
-	if (!IS_DGFX(xe)) {
-		xe->mem.vram.mapping = 0;
-		xe->mem.vram.size = 0;
-		xe->mem.vram.io_start = 0;
-		xe->mem.vram.io_size = 0;
-
-		for_each_gt(gt, xe, id) {
-			gt->mem.vram.mapping = 0;
-			gt->mem.vram.size = 0;
-			gt->mem.vram.io_start = 0;
-			gt->mem.vram.io_size = 0;
-		}
+	if (!IS_DGFX(xe))
 		return 0;
-	}
-
-	if (!xe_pci_resource_valid(pdev, GEN12_LMEM_BAR)) {
-		drm_err(&xe->drm, "pci resource is not valid\n");
-		return -ENXIO;
-	}
 
+	/* Get the size of the gt0 vram for later accessibility comparison */
 	gt = xe_device_get_gt(xe, 0);
-	original_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
+	err = xe_mmio_tile_vram_size(gt, &vram_size, &tile_size, &tile_offset);
+	if (err)
+		return err;
 
-	err = xe_mmio_total_vram_size(xe, &vram_size, &usable_size);
+	err = xe_determine_lmem_bar_size(xe);
 	if (err)
 		return err;
 
-	xe_resize_vram_bar(xe, vram_size);
-	xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
-	xe->mem.vram.io_size = min(usable_size,
-				   pci_resource_len(pdev, GEN12_LMEM_BAR));
-	xe->mem.vram.size = xe->mem.vram.io_size;
+	/* small bar issues will only cover gt0 sizes */
+	if (xe->mem.vram.io_size < vram_size)
+		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
+			 vram_size, (u64)xe->mem.vram.io_size);
 
-	if (!xe->mem.vram.size)
-		return -EIO;
+	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
+		 &xe->mem.vram.io_size);
 
-	if (usable_size > xe->mem.vram.io_size)
-		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (%lluMiB->%lluMiB)\n",
-			 (u64)usable_size >> 20, (u64)xe->mem.vram.io_size >> 20);
+	/* small bar issues will only cover gt0 sizes */
+	if (xe->mem.vram.io_size < vram_size)
+		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (0x%llx->0x%llx)\n",
+			 vram_size, (u64)xe->mem.vram.io_size);
 
-	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
-	xe->mem.vram.size = min_t(u64, xe->mem.vram.size, usable_size);
+	io_size = xe->mem.vram.io_size;
 
-	drm_info(&xe->drm, "TOTAL VRAM: %pa, %pa\n", &xe->mem.vram.io_start, &xe->mem.vram.size);
+	/* gt specific ranges */
+	for_each_gt(gt, xe, id) {
+		if (xe_gt_is_media_type(gt))
+			continue;
 
-	/* FIXME: Assuming equally partitioned VRAM, incorrect */
-	if (xe->info.tile_count > 1) {
-		u8 adj_tile_count = xe->info.tile_count;
-		resource_size_t size, io_start, io_size;
+		err = xe_mmio_tile_vram_size(gt, &vram_size, &tile_size, &tile_offset);
+		if (err)
+			return err;
 
-		for_each_gt(gt, xe, id)
-			if (xe_gt_is_media_type(gt))
-				--adj_tile_count;
+		gt->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
+		gt->mem.vram.io_size = min_t(u64, vram_size, io_size);
 
-		XE_BUG_ON(!adj_tile_count);
+		if (!gt->mem.vram.io_size) {
+			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+			return -ENODEV;
+		}
 
-		size = xe->mem.vram.size / adj_tile_count;
-		io_start = xe->mem.vram.io_start;
-		io_size = xe->mem.vram.io_size;
+		gt->mem.vram.base = xe->mem.vram.base + tile_offset;
+		gt->mem.vram.size = vram_size;
+		gt->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
 
-		for_each_gt(gt, xe, id) {
-			if (id && !xe_gt_is_media_type(gt)) {
-				io_size -= min(io_size, size);
-				io_start += io_size;
-			}
+		drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n", id, gt->info.vram_id,
+			 &gt->mem.vram.io_start, &gt->mem.vram.size);
 
-			gt->mem.vram.size = size;
-
-			/*
-			 * XXX: multi-tile small-bar might be wild. Hopefully
-			 * full tile without any mappable vram is not something
-			 * we care about.
-			 */
-
-			gt->mem.vram.io_size = min(size, io_size);
-			if (io_size) {
-				gt->mem.vram.io_start = io_start;
-				gt->mem.vram.mapping = xe->mem.vram.mapping +
-					(io_start - xe->mem.vram.io_start);
-			} else {
-				drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
-				return -ENODEV;
-			}
+		if (gt->mem.vram.io_size < gt->mem.vram.size)
+			drm_info(&xe->drm, "VRAM[%u, %u]: CPU access limited to %pa\n", id,
+				 gt->info.vram_id, &gt->mem.vram.io_size);
+
+		/* calculate total size using tile size to get the correct HW sizing */
+		total_size += tile_size;
+		available_size += vram_size;
 
-			drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n",
-				 id, gt->info.vram_id, &gt->mem.vram.io_start,
-				 &gt->mem.vram.size);
+		if (total_size > xe->mem.vram.io_size) {
+			drm_warn(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
+				 &total_size, &xe->mem.vram.io_size);
 		}
-	} else {
-		gt->mem.vram.size = xe->mem.vram.size;
-		gt->mem.vram.io_start = xe->mem.vram.io_start;
-		gt->mem.vram.io_size = xe->mem.vram.io_size;
-		gt->mem.vram.mapping = xe->mem.vram.mapping;
 
-		drm_info(&xe->drm, "VRAM: %pa\n", &gt->mem.vram.size);
+		io_size -= min_t(u64, tile_size, io_size);
 	}
+
+	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
+		 &available_size);
+
 	return 0;
 }
 
@@ -304,9 +349,6 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
 	if (xe->info.media_verx100 >= 1300)
 		xe->info.tile_count *= 2;
 
-	drm_info(&xe->drm, "tile_count: %d, adj_tile_count %d\n",
-		 xe->info.tile_count, adj_tile_count);
-
 	if (xe->info.tile_count > 1) {
 		const int mmio_bar = 0;
 		size_t size;
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 1a32e0f52261..d284f84a2e60 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: MIT */
 /*
- * Copyright © 2021 Intel Corporation
+ * Copyright © 2021-2023 Intel Corporation
  */
 
 #ifndef _XE_MMIO_H_
@@ -120,6 +120,6 @@ static inline bool xe_mmio_in_range(const struct xe_mmio_range *range, u32 reg)
 }
 
 int xe_mmio_probe_vram(struct xe_device *xe);
-int xe_mmio_total_vram_size(struct xe_device *xe, u64 *vram_size, u64 *flat_ccs_base);
+int xe_mmio_tile_vram_size(struct xe_gt *gt, u64 *vram_size, u64 *tile_size, u64 *tile_base);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 9ce0a0585539..72e0a65b1d71 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -12,9 +12,11 @@
 #include <drm/ttm/ttm_range_manager.h>
 
 #include "regs/xe_regs.h"
+#include "regs/xe_gt_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_gt_mcr.h"
 #include "xe_mmio.h"
 #include "xe_res_cursor.h"
 #include "xe_ttm_stolen_mgr.h"
@@ -51,27 +53,27 @@ bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe)
 	return GRAPHICS_VERx100(xe) < 1270 && !IS_DGFX(xe);
 }
 
-static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
+static s64 detect_bar2_dgfx(struct xe_gt *gt, struct xe_ttm_stolen_mgr *mgr)
 {
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	struct xe_gt *gt = to_gt(xe);
-	u64 vram_size, stolen_size;
-	int err;
+	u64 stolen_size;
+	u64 tile_offset;
+	u64 tile_size;
+	u64 vram_size;
 
-	err = xe_mmio_total_vram_size(xe, &vram_size, NULL);
-	if (err) {
-		drm_info(&xe->drm, "Querying total vram size failed\n");
+	if (xe_mmio_tile_vram_size(gt, &vram_size, &tile_size, &tile_offset)) {
+		drm_info(&gt->xe->drm, "Querying total vram size failed\n");
 		return 0;
 	}
 
 	/* Use DSM base address instead for stolen memory */
-	mgr->stolen_base = xe_mmio_read64(gt, DSMBASE.reg) & BDSM_MASK;
-	if (drm_WARN_ON(&xe->drm, vram_size < mgr->stolen_base))
+	mgr->stolen_base = (xe_mmio_read64(gt, DSMBASE.reg) & BDSM_MASK) - tile_offset;
+	if (drm_WARN_ON(&gt->xe->drm, tile_size < mgr->stolen_base))
 		return 0;
 
-	stolen_size = vram_size - mgr->stolen_base;
-	if (mgr->stolen_base + stolen_size <= pci_resource_len(pdev, 2))
-		mgr->io_base = pci_resource_start(pdev, 2) + mgr->stolen_base;
+	stolen_size = tile_size - mgr->stolen_base;
+
+	if (mgr->stolen_base + stolen_size <= tile_size)
+		mgr->io_base = gt->mem.vram.io_start + mgr->stolen_base;
 
 	/*
 	 * There may be few KB of platform dependent reserved memory at the end
@@ -139,7 +141,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 	int err;
 
 	if (IS_DGFX(xe))
-		stolen_size = detect_bar2_dgfx(xe, mgr);
+		stolen_size = detect_bar2_dgfx(to_gt(xe), mgr);
 	else if (GRAPHICS_VERx100(xe) >= 1270)
 		stolen_size = detect_bar2_integrated(xe, mgr);
 	else
-- 
2.25.1

