Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94402C61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 15:14:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32EFE10F3F3;
	Fri, 28 Aug 2026 15:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VwhtFqFk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384FE10F3EF
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 15:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787930072; x=1819466072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3yJhlr4/R8lr/6TM1HO3tILgh8la07iP403M+6ebn4s=;
 b=VwhtFqFkUJA0KxoCZrpN9nfM4lW+i6K6yR6ndE3TuSEu7GNZC5ZuP+p5
 cdE+TzNU615XsyfMtHnY+vwvW2XXLlrvWj7R8j9axsczUL5Bs9pptFp2e
 2fHgB6BFSYZJkwHM9wtLH3uV2uMyWRqgrEwvHernnauoNIs6+CkBM05MU
 NLJNHSq3jih3jnMBMh3RkTJD5C9Qdk8qNKEZyhIDEbekZGJ8vRoQkB0Oa
 WiclAwaE77JPqNVmCgDxLVzVVZES4jfXhp3cb/54pLQh7mtePF/rdGmFx
 J3KPMgJZvCghixdiX+eiwiC4zL36gblf/nKqYryQO97VnCYgtQ+yraVFb w==;
X-CSE-ConnectionGUID: dqso/YxcSai1c68PXlQDQw==
X-CSE-MsgGUID: rYJSWtWyQwOCsG4FpF080A==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="92252205"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="92252205"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:14:32 -0700
X-CSE-ConnectionGUID: a8ZbBQw6QUWRJR+LnNkbvg==
X-CSE-MsgGUID: zfy6aVyjS5ey8hDhfelKUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="268746431"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.86])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:14:30 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 5/5] drm/xe/vram: add early VRAM health check
Date: Fri, 28 Aug 2026 16:14:11 +0100
Message-ID: <20260828151405.662533-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828151405.662533-7-matthew.auld@intel.com>
References: <20260828151405.662533-7-matthew.auld@intel.com>
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

During early probe, use the last page as a canary for BAR sizing, CCS
sizing, identity map setup etc. If something is wrong the last page is
where we will likely find it. Hit it with everything we have. For now
this is gated behind a debug config option, so shouldn't trigger on
production.

Main motivation is around CCS sizing where on some BMG cards the CCS
offset is programmed misaligned, for whatever reason, and our handling
of that was busted, as found by Linus, leading to some amount of CCS
storage getting pulled into the allocator as normal VRAM.

Nothing in our CI farm has such a misaligned offset it would seem,
however I did get this to pop on my b570, which does also have the
misaligned CCS offset:

  Tile 0: Running VRAM memtest...
  Tile 0: VRAM bounds overlap CCS region! VRAM sizing is incorrect.

With the fix from Linus, this goes away:

  Tile 0: Running VRAM memtest...
  Tile 0: VRAM memtest completed.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c     |   8 +
 drivers/gpu/drm/xe/xe_migrate.c    |  64 ++++++++
 drivers/gpu/drm/xe/xe_migrate.h    |   6 +
 drivers/gpu/drm/xe/xe_tile_types.h |   4 +
 drivers/gpu/drm/xe/xe_vram.c       | 241 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vram.h       |  10 ++
 6 files changed, 333 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 82e0a555fa69..80008bf5776c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1051,6 +1051,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_vram_reserve_memtest_bo(xe);
+	if (err)
+		return err;
+
 	for_each_tile(tile, xe, id) {
 		err = xe_tile_init(tile);
 		if (err)
@@ -1067,6 +1071,10 @@ int xe_device_probe(struct xe_device *xe)
 			return err;
 	}
 
+	err = xe_vram_memtest(xe);
+	if (err)
+		return err;
+
 	err = xe_pagefault_init(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 0bf000d7c901..ff45c24d8889 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2650,3 +2650,67 @@ void xe_migrate_job_lock_assert(struct xe_exec_queue *q)
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_migrate.c"
 #endif
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
+int xe_migrate_debug_ccs_overlap(struct xe_migrate *m,
+				 struct xe_bo *scratch_bo,
+				 bool write_to_ccs)
+{
+	struct xe_device *xe = tile_to_xe(m->tile);
+	struct xe_gt *gt = m->tile->primary_gt;
+	struct dma_fence *fence;
+	struct xe_bb *bb;
+	struct xe_sched_job *job;
+	u64 first_page_dpa, clear_L0_ofs, scratch_dpa, scratch_L0_ofs;
+
+	if (!xe_device_has_flat_ccs(xe))
+		return -EINVAL;
+
+	first_page_dpa = xe_vram_region_dpa_base(m->tile->mem.vram);
+	clear_L0_ofs = xe_migrate_vram_ofs(xe, first_page_dpa, true);
+
+	scratch_dpa = xe_bo_addr(scratch_bo, 0, XE_PAGE_SIZE);
+	scratch_L0_ofs = xe_migrate_vram_ofs(xe, scratch_dpa, false);
+
+	bb = xe_bb_new(gt, EMIT_COPY_CCS_DW + 1, xe->info.has_usm);
+	if (IS_ERR(bb)) {
+		drm_warn(&xe->drm, "Failed to create bb for VRAM overlap check\n");
+		return PTR_ERR(bb);
+	}
+
+	/* 4MB payload = 8KB CCS metadata */
+	if (write_to_ccs) {
+		emit_copy_ccs(gt, bb, clear_L0_ofs, true,
+			      scratch_L0_ofs, false, SZ_4M);
+	} else {
+		emit_copy_ccs(gt, bb, scratch_L0_ofs, false,
+			      clear_L0_ofs, true, SZ_4M);
+	}
+
+	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
+
+	job = xe_bb_create_migration_job(m->q, bb,
+					 xe_migrate_batch_base(m, xe->info.has_usm),
+					 0);
+	if (!IS_ERR(job)) {
+		xe_sched_job_add_migrate_flush(job, MI_FLUSH_DW_CCS);
+
+		mutex_lock(&m->job_mutex);
+		xe_sched_job_arm(job);
+
+		fence = dma_fence_get(&job->drm.s_fence->finished);
+		xe_sched_job_push(job);
+		mutex_unlock(&m->job_mutex);
+
+		dma_fence_wait(fence, false);
+		dma_fence_put(fence);
+	} else {
+		drm_warn(&xe->drm, "Failed to create job for VRAM overlap check\n");
+		xe_bb_free(bb, NULL);
+		return PTR_ERR(job);
+	}
+
+	xe_bb_free(bb, NULL);
+	return 0;
+}
+#endif
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index c3a268b01768..a9acc62f78f0 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -182,4 +182,10 @@ static inline void xe_migrate_job_lock_assert(struct xe_exec_queue *q)
 void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue *q);
 void xe_migrate_job_unlock(struct xe_migrate *m, struct xe_exec_queue *q);
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
+int xe_migrate_debug_ccs_overlap(struct xe_migrate *m,
+				 struct xe_bo *scratch_bo,
+				 bool write_to_ccs);
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
index 0a2f1ab8416e..4a79580c5315 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -17,8 +17,11 @@
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
@@ -403,3 +406,241 @@ resource_size_t xe_vram_region_actual_physical_size(const struct xe_vram_region
 	return vram ? vram->actual_physical_size : 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_vram_region_actual_physical_size);
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
+static void memtest_bo_cleanup(void *arg)
+{
+	struct xe_device *xe = arg;
+
+	xe_vram_free_memtest_bos(xe);
+}
+
+int xe_vram_reserve_memtest_bo(struct xe_device *xe)
+{
+	struct xe_tile *tile;
+	u8 id;
+
+	if (IS_SRIOV_VF(xe))
+		return 0;
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
+
+	return devm_add_action_or_reset(xe->drm.dev, memtest_bo_cleanup, xe);
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
+	if (IS_SRIOV_VF(xe))
+		return 0;
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
+		/* CPU write and readback first and last byte of the last page */
+		xe_map_wr(xe, &last_page_bo->vmap, 0, u8, 0xA5);
+		xe_map_wr(xe, &last_page_bo->vmap, SZ_64K - 1, u8, 0x5A);
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
+		/* Non-CCS access via GPU on the last page */
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
+		val = xe_map_rd(xe, &last_page_bo->vmap, 0, u8);
+		if (drm_WARN(&xe->drm, val != 0x00,
+			     "Tile %d: GPU memtest clear failed at offset 0 (expected 0x00, got 0x%02x)\n",
+			     id, val)) {
+			err = -EIO;
+			goto unpin;
+		}
+
+		/*
+		 * Check for CCS overlap on the root tile.
+		 *
+		 * TODO: maybe extend if we ever get multi-tile + CCS. Pay
+		 * special attention to the l2 flush below. Currently that is
+		 * hard coded to the root tile.
+		 */
+		if (!id && xe_device_has_flat_ccs(xe) &&
+		    GRAPHICS_VERx100(xe) >= 2000) {
+			struct xe_bo *scratch_bo_before;
+			struct xe_bo *scratch_bo_after;
+
+			scratch_bo_before = xe_bo_create_pin_map_novm(xe, tile, SZ_64K,
+								      ttm_bo_type_kernel,
+								      XE_BO_FLAG_VRAM_IF_DGFX(tile),
+								      false);
+			if (IS_ERR(scratch_bo_before)) {
+				err = PTR_ERR(scratch_bo_before);
+				goto unpin;
+			}
+
+			scratch_bo_after = xe_bo_create_pin_map_novm(xe, tile, SZ_64K,
+								     ttm_bo_type_kernel,
+								     XE_BO_FLAG_VRAM_IF_DGFX(tile),
+								     false);
+			if (IS_ERR(scratch_bo_after)) {
+				xe_bo_unpin_map_no_vm(scratch_bo_before);
+				err = PTR_ERR(scratch_bo_after);
+				goto unpin;
+			}
+
+			/* Save original CCS metadata for PA 0 + */
+			err = xe_migrate_debug_ccs_overlap(tile->migrate, scratch_bo_before, false);
+			if (err) {
+				xe_bo_unpin_map_no_vm(scratch_bo_before);
+				xe_bo_unpin_map_no_vm(scratch_bo_after);
+				goto unpin;
+			}
+
+			/*
+			 * Fill last page. If there is CCS overlap in the last
+			 * page this will snag the raw CCS storage.
+			 */
+			xe_map_memset(xe, &last_page_bo->vmap, 0, 0x5A, SZ_64K);
+			xe_device_wmb(xe);
+
+			/*
+			 * Global invalidation. Some BMG SKUs will cache the BAR
+			 * writes in the GPU side VRAM cache. Make sure above
+			 * writes are fully flushed out to VRAM, so this is
+			 * hopefully more well behaved with the CCS unit, if
+			 * there is indeed CCS overlap with normal VRAM. Since
+			 * there is a separate CCS cache, the CCS unit might not
+			 * respect the GPU VRAM cache for CCS accesses, so opt
+			 * for being super careful here.
+			 */
+			xe_device_l2_flush(xe, true);
+
+			/* Use GPU to clear CCS state for PA 0 */
+			xe_map_memset(xe, &scratch_bo_after->vmap, 0, 0x00, SZ_64K);
+			err = xe_migrate_debug_ccs_overlap(tile->migrate, scratch_bo_after, true);
+			if (err) {
+				xe_bo_unpin_map_no_vm(scratch_bo_before);
+				xe_bo_unpin_map_no_vm(scratch_bo_after);
+				goto unpin;
+			}
+			/*
+			 * Global invalidation. Ensure CCS caches really are
+			 * nuked and the raw CCS data is visible in VRAM, for
+			 * the below access.
+			 */
+			xe_device_l2_flush(xe, true);
+
+			/* Check if last_page_bo was corrupted by the GPU CCS clear */
+			for (i = 0; i < SZ_64K; i += 8) {
+				u64 payload = xe_map_rd(xe, &last_page_bo->vmap, i, u64);
+
+				if (payload != 0x5A5A5A5A5A5A5A5AULL) {
+					overlap = true;
+					break;
+				}
+			}
+
+			/* Restore original CCS metadata for PA 0 + */
+			err = xe_migrate_debug_ccs_overlap(tile->migrate, scratch_bo_before, true);
+			if (err)
+				drm_warn(&xe->drm, "Failed to restore CCS metadata\n");
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
index dd1c8bf17922..38425d81f777 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -23,4 +23,14 @@ resource_size_t xe_vram_region_dpa_base(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_usable_size(const struct xe_vram_region *vram);
 resource_size_t xe_vram_region_actual_physical_size(const struct xe_vram_region *vram);
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
+int xe_vram_reserve_memtest_bo(struct xe_device *xe);
+void xe_vram_free_memtest_bos(struct xe_device *xe);
+int xe_vram_memtest(struct xe_device *xe);
+#else
+static inline int xe_vram_reserve_memtest_bo(struct xe_device *xe) { return 0; }
+static inline void xe_vram_free_memtest_bos(struct xe_device *xe) {}
+static inline int xe_vram_memtest(struct xe_device *xe) { return 0; }
+#endif
+
 #endif
-- 
2.55.0

