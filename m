Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391F0C61DC2
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 15:24:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C335810E2C8;
	Wed, 26 Aug 2026 15:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G9NxeAPe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D66710E2B8
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 15:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787757887; x=1819293887;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r3K1Dx2GqzMegZ3J7GyDwgMY2k009ipgDD90va3bHOs=;
 b=G9NxeAPeMuUxUFa9RXBetAhcF/6OzUPwWI4mu4Oc9MmU4B9dzjAlLJZb
 enFeIGy3X/GHPaEfnyVGn+/fLGBJiBT1wAzTQiHCyMVIi0qXO4VBnfdA2
 YAHIJeMmlJna7HnJge+As3fV4Mnf5S37Fun2VzwghU25am0GTyEH5abyc
 GjHbK5KqJpF0Z4vGGQGgoc3N8yOvHB+7QwqGJv5b4HDHZREo4gGeIqUJz
 p9vLhNc2xskyxbpurxuNeWEavfPoCr3ZPTFCrF5u/rZUEtrmPU6MN/Lp/
 jWKJhsFuMCm4zi8fLQ/BHusZyENj7HD5QMTRS1c1sYKBgRV6x55WdcMdj g==;
X-CSE-ConnectionGUID: 3BCXRV94SF+TOCOcR3AUqQ==
X-CSE-MsgGUID: BVUtGi6PSt6QtekibGjv1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88297520"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88297520"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 08:24:47 -0700
X-CSE-ConnectionGUID: YBjn5h8eQnSil7+Kspyjvw==
X-CSE-MsgGUID: sgLPWyBqQWG9Muu6fbNJww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="265006117"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.242])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 08:24:45 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2] drm/xe/vram: Add early VRAM health check
Date: Wed, 26 Aug 2026 16:24:26 +0100
Message-ID: <20260826152431.406715-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
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

DO NOT REVIEW.

Use the last page as a canary for BAR sizing, CCS sizing, identity map
setup. If something is wrong the last page is where we will find it. Hit
it with everything we have. Test here should be non-destructive and fast.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c     |  15 ++-
 drivers/gpu/drm/xe/xe_migrate.c    |  68 ++++++++++
 drivers/gpu/drm/xe/xe_migrate.h    |   6 +
 drivers/gpu/drm/xe/xe_tile_types.h |   4 +
 drivers/gpu/drm/xe/xe_vram.c       | 208 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vram.h       |  10 ++
 6 files changed, 308 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 74d566693dfd..0a5021f85d90 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1051,22 +1051,28 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe_vram_reserve_memtest_bo(xe);
+
 	for_each_tile(tile, xe, id) {
 		err = xe_tile_init(tile);
 		if (err)
-			return err;
+			goto err_free_memtest;
 	}
 
 	err = xe_irq_install(xe);
 	if (err)
-		return err;
+		goto err_free_memtest;
 
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_init(gt);
 		if (err)
-			return err;
+			goto err_free_memtest;
 	}
 
+	err = xe_vram_memtest(xe);
+	if (err)
+		return err;
+
 	err = xe_pagefault_init(xe);
 	if (err)
 		return err;
@@ -1169,6 +1175,9 @@ int xe_device_probe(struct xe_device *xe)
 	xe_display_unregister(xe);
 	drm_dev_unregister(&xe->drm);
 
+err_free_memtest:
+	xe_vram_free_memtest_bos(xe);
+
 	return err;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 75b83687f1b5..d46bc1490291 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2633,3 +2633,71 @@ void xe_migrate_job_lock_assert(struct xe_exec_queue *q)
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_migrate.c"
 #endif
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
+void xe_migrate_debug_ccs_overlap(struct xe_migrate *m,
+				  struct xe_bo *last_page_bo,
+				  struct xe_bo *scratch_bo)
+{
+	struct xe_device *xe = tile_to_xe(m->tile);
+	struct xe_gt *gt = m->tile->primary_gt;
+	struct dma_fence *fence;
+	struct xe_bb *bb;
+	struct xe_sched_job *job;
+	u64 first_page_dpa, clear_L0_ofs, scratch_dpa, scratch_L0_ofs, ccs_size;
+	int num_loops;
+
+	if (!xe_device_has_flat_ccs(xe))
+		return;
+
+	ccs_size = m->tile->mem.vram->usable_size / 256;
+	if (ccs_size > SZ_1M)
+		ccs_size = SZ_1M;
+
+	num_loops = DIV_ROUND_UP_ULL(ccs_size, 256 * 1024);
+
+	first_page_dpa = xe_vram_region_dpa_base(m->tile->mem.vram);
+	clear_L0_ofs = xe_migrate_vram_ofs(xe, first_page_dpa, true);
+
+	scratch_dpa = xe_bo_addr(scratch_bo, 0, XE_PAGE_SIZE);
+	scratch_L0_ofs = xe_migrate_vram_ofs(xe, scratch_dpa, false);
+
+	for (int j = 0; j < num_loops; j++) {
+		bb = xe_bb_new(gt, 256, xe->info.has_usm);
+		if (IS_ERR(bb)) {
+			drm_warn(&xe->drm, "Failed to create bb for VRAM overlap check\n");
+			return;
+		}
+
+		for (int i = 0; i < 16; i++) {
+			int idx = (j * 16) + i;
+			/* 4MB payload = 16KB CCS metadata */
+			emit_copy_ccs(gt, bb, scratch_L0_ofs + (idx * 16384), false,
+				      clear_L0_ofs + (idx * SZ_4M), true, SZ_4M);
+		}
+
+		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
+
+		job = xe_bb_create_migration_job(m->q, bb,
+						 xe_migrate_batch_base(m, xe->info.has_usm),
+						 0);
+		if (!IS_ERR(job)) {
+			xe_sched_job_add_migrate_flush(job, MI_FLUSH_DW_CCS);
+
+			mutex_lock(&m->job_mutex);
+			xe_sched_job_arm(job);
+
+			fence = dma_fence_get(&job->drm.s_fence->finished);
+			xe_sched_job_push(job);
+			mutex_unlock(&m->job_mutex);
+
+			dma_fence_wait(fence, false);
+			dma_fence_put(fence);
+		} else {
+			drm_warn(&xe->drm, "Failed to create job for VRAM overlap check\n");
+		}
+
+		xe_bb_free(bb, NULL);
+	}
+}
+#endif
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index c3a268b01768..a5ca5d6d1698 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -182,4 +182,10 @@ static inline void xe_migrate_job_lock_assert(struct xe_exec_queue *q)
 void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue *q);
 void xe_migrate_job_unlock(struct xe_migrate *m, struct xe_exec_queue *q);
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
+void xe_migrate_debug_ccs_overlap(struct xe_migrate *m,
+				  struct xe_bo *last_page_bo,
+				  struct xe_bo *scratch_bo);
+#endif
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_tile_types.h b/drivers/gpu/drm/xe/xe_tile_types.h
index 0048100ccb72..e1368c04846a 100644
--- a/drivers/gpu/drm/xe/xe_tile_types.h
+++ b/drivers/gpu/drm/xe/xe_tile_types.h
@@ -97,6 +97,10 @@ struct xe_tile {
 		 * Only main GT has page reclaim list allocations.
 		 */
 		struct xe_sa_manager *reclaim_pool;
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
+		/** @mem.memtest_bo: VRAM overlap check BO */
+		struct xe_bo *memtest_bo;
+#endif
 	} mem;
 
 	/** @sriov: tile level virtualization data */
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 23eb7edbdd57..afe3e77af1c2 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -3,6 +3,8 @@
  * Copyright © 2021-2024 Intel Corporation
  */
 
+#include "linux/sizes.h"
+#include "vdso/align.h"
 #include <kunit/visibility.h>
 #include <linux/pci.h>
 
@@ -17,8 +19,11 @@
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt_mcr.h"
+#include "xe_map.h"
+#include "xe_migrate.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
+#include "xe_tile.h"
 #include "xe_tile_sriov_vf.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vram.h"
@@ -89,6 +94,11 @@ static int get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size, u64 *poffset)
 		offset = offset_hi << 32; /* HW view bits 39:32 */
 		offset |= offset_lo << 6; /* HW view bits 31:6 */
 		offset *= num_enabled; /* convert to SW view */
+
+		if (!IS_ALIGNED(offset, SZ_128K))
+			drm_info(&xe->drm, "CCS base misaligned: %llx\n",
+				 offset);
+
 		offset = round_up(offset, SZ_128K); /* SW must round up to nearest 128K */
 
 		/* We don't expect any holes */
@@ -387,3 +397,201 @@ resource_size_t xe_vram_region_actual_physical_size(const struct xe_vram_region
 	return vram ? vram->actual_physical_size : 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_vram_region_actual_physical_size);
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
+void xe_vram_reserve_memtest_bo(struct xe_device *xe)
+{
+	struct xe_tile *tile;
+	u8 id;
+
+	for_each_tile(tile, xe, id) {
+		u64 vram_size;
+
+		if (!tile->mem.vram)
+			continue;
+
+		if (tile->mem.vram->io_size < tile->mem.vram->usable_size) {
+			drm_info(&xe->drm,
+				 "Tile %d: Small-BAR system detected, skipping VRAM memtest\n",
+				 id);
+			continue;
+		}
+
+		vram_size = tile->mem.vram->usable_size;
+
+		tile->mem.memtest_bo = xe_bo_create_pin_map_at_novm(xe, tile, SZ_64K,
+								    vram_size - SZ_64K,
+								    ttm_bo_type_kernel,
+								    XE_BO_FLAG_VRAM_IF_DGFX(tile),
+								    0, false);
+		if (IS_ERR(tile->mem.memtest_bo)) {
+			drm_warn(&xe->drm, "Tile %d: Failed to reserve memtest BO\n", id);
+			tile->mem.memtest_bo = NULL;
+			continue;
+		}
+
+		drm_info(&xe->drm, "Tile %d: Reserved memtest BO at offset 0x%llx\n",
+			 id, vram_size - SZ_64K);
+	}
+}
+
+void xe_vram_free_memtest_bos(struct xe_device *xe)
+{
+	struct xe_tile *tile;
+	u8 id;
+
+	for_each_tile(tile, xe, id) {
+		if (tile->mem.memtest_bo) {
+			xe_bo_unpin_map_no_vm(tile->mem.memtest_bo);
+			tile->mem.memtest_bo = NULL;
+		}
+	}
+}
+
+int xe_vram_memtest(struct xe_device *xe)
+{
+	struct xe_tile *tile;
+	u8 id;
+	int err = 0;
+
+	for_each_tile(tile, xe, id) {
+		struct xe_bo *last_page_bo = tile->mem.memtest_bo;
+		struct dma_fence *fence;
+		bool overlap = false;
+		int i;
+		u8 val;
+
+		if (!last_page_bo || !tile->migrate)
+			continue;
+
+		drm_info(&xe->drm, "Tile %d: Running VRAM memtest...\n", id);
+
+		/* 1. CPU write and readback first and last byte of the last page */
+		xe_map_wr(xe, &last_page_bo->vmap, 0, u8, 0xA5);
+		xe_map_wr(xe, &last_page_bo->vmap, SZ_64K - 1, u8, 0x5A);
+
+		/* Ensure CPU writes are flushed before CPU reads/GPU execution */
+		wmb();
+		/* Ensure CPU reads see the flushed memory state */
+		rmb();
+
+		val = xe_map_rd(xe, &last_page_bo->vmap, 0, u8);
+		if (drm_WARN(&xe->drm, val != 0xA5,
+			     "Tile %d: CPU memtest failed at offset 0 (expected 0xA5, got 0x%02x)\n",
+			     id, val)) {
+			err = -EIO;
+			goto unpin;
+		}
+
+		val = xe_map_rd(xe, &last_page_bo->vmap, SZ_64K - 1, u8);
+		if (drm_WARN(&xe->drm, val != 0x5A,
+			     "Tile %d: CPU memtest failed at offset 65535 (expected 0x5A, got 0x%02x)\n",
+			     id, val)) {
+			err = -EIO;
+			goto unpin;
+		}
+
+		/* 2. Non-CCS access via GPU on the last page */
+		xe_bo_lock(last_page_bo, false);
+		fence = xe_migrate_clear(tile->migrate, last_page_bo,
+					 last_page_bo->ttm.resource,
+					 XE_MIGRATE_CLEAR_FLAG_BO_DATA);
+		xe_bo_unlock(last_page_bo);
+
+		if (!IS_ERR(fence)) {
+			dma_fence_wait(fence, false);
+			dma_fence_put(fence);
+		} else {
+			err = PTR_ERR(fence);
+			goto unpin;
+		}
+
+		/* Ensure CPU reads see GPU execution results */
+		rmb();
+
+		val = xe_map_rd(xe, &last_page_bo->vmap, 0, u8);
+		if (drm_WARN(&xe->drm, val != 0x00,
+			     "Tile %d: GPU memtest clear failed at offset 0 (expected 0x00, got 0x%02x)\n",
+			     id, val)) {
+			err = -EIO;
+			goto unpin;
+		}
+
+		if (xe_device_has_flat_ccs(xe)) {
+			struct xe_bo *scratch_bo_before;
+			struct xe_bo *scratch_bo_after;
+
+			scratch_bo_before = xe_bo_create_pin_map_novm(xe, tile, SZ_1M,
+								      ttm_bo_type_kernel,
+								      XE_BO_FLAG_VRAM_IF_DGFX(tile),
+								      false);
+			if (IS_ERR(scratch_bo_before)) {
+				err = PTR_ERR(scratch_bo_before);
+				goto unpin;
+			}
+
+			scratch_bo_after = xe_bo_create_pin_map_novm(xe, tile, SZ_1M,
+								     ttm_bo_type_kernel,
+								     XE_BO_FLAG_VRAM_IF_DGFX(tile),
+								     false);
+			if (IS_ERR(scratch_bo_after)) {
+				xe_bo_unpin_map_no_vm(scratch_bo_before);
+				err = PTR_ERR(scratch_bo_after);
+				goto unpin;
+			}
+
+			/* Step 1: Baseline CCS read */
+			xe_migrate_debug_ccs_overlap(tile->migrate, last_page_bo,
+						     scratch_bo_before);
+
+			/* Step 2: CPU write payload to the last page */
+			xe_map_memset(xe, &last_page_bo->vmap, 0, 0xFF, SZ_64K);
+			/* Ensure CPU writes are flushed before GPU execution */
+			wmb();
+
+			/* Step 3: Second CCS read */
+			xe_migrate_debug_ccs_overlap(tile->migrate, last_page_bo, scratch_bo_after);
+			/* Ensure CPU reads see GPU execution results */
+			rmb();
+
+			/*
+			 * If the bounds are wrong, the CPU's write to last_page_bo
+			 * physically overwrote the CCS metadata of PA 0.
+			 * The CCS metadata will have changed between the two reads.
+			 */
+			u64 ccs_size = tile->mem.vram->usable_size / 256;
+
+			if (ccs_size > SZ_1M)
+				ccs_size = SZ_1M;
+
+			for (i = 0; i < ccs_size; i += 8) {
+				if (xe_map_rd(xe, &scratch_bo_before->vmap, i, u64) !=
+				    xe_map_rd(xe, &scratch_bo_after->vmap, i, u64)) {
+					overlap = true;
+					break;
+				}
+			}
+
+			xe_bo_unpin_map_no_vm(scratch_bo_before);
+			xe_bo_unpin_map_no_vm(scratch_bo_after);
+		}
+
+		if (drm_WARN(&xe->drm, overlap,
+			     "Tile %d: VRAM bounds overlap CCS region! VRAM sizing is incorrect.\n",
+			     id)) {
+			err = -EINVAL;
+			goto unpin;
+		}
+
+		drm_info(&xe->drm, "Tile %d: VRAM memtest completed.\n", id);
+
+unpin:
+		if (err)
+			break;
+	}
+
+	xe_vram_free_memtest_bos(xe);
+
+	return err;
+}
+#endif
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index dd1c8bf17922..0649b21c859a 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -23,4 +23,14 @@ resource_size_t xe_vram_region_dpa_base(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_usable_size(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_actual_physical_size(const struct xe_vram_region *vram);
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
+void xe_vram_reserve_memtest_bo(struct xe_device *xe);
+void xe_vram_free_memtest_bos(struct xe_device *xe);
+int xe_vram_memtest(struct xe_device *xe);
+#else
+static inline void xe_vram_reserve_memtest_bo(struct xe_device *xe) {}
+static inline void xe_vram_free_memtest_bos(struct xe_device *xe) {}
+static inline int xe_vram_memtest(struct xe_device *xe) { return 0; }
+#endif
+
 #endif
-- 
2.55.0

