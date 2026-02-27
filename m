Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B95AFEFB6D
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 17:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C765C10EBDC;
	Fri, 27 Feb 2026 17:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jk1lGM6X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B127B10EBD7
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 17:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772211822; x=1803747822;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KxUvOuxiLBIPwqi9T/wZmgRvQy6B+4PTVCRgKmVKYZs=;
 b=Jk1lGM6XAkm4WW2iItPKOWpN4mWyig/1NRXuqtwX7+oY8uh7sjGHtbQP
 1zb+pDOOzNd7Fjy8qH8piz6Gzdvbrce69YiDBp9vpyO13ah7Mvm2BPh8T
 XuX0nUSlbNDOjE18Lx57FEGaN++FkkXXs1F+yRji04od+4YRE1O73VFtf
 GjjZtcgtNYLcVsR471gpHyphVUTuIdI/FPvUhqkQaFFWt0CQj9oiG9fbN
 nfVMpoOlddEu+9/lRY/fwG5sASNkA95qfheLLJn3yV3ZKm9MEIyOcr5xz
 5gT8BpK9eDIlfJ8d1zLB02we9AADhth88p1CDK8OSGqNMHeV2t+XFiFgm Q==;
X-CSE-ConnectionGUID: Hccy5sPITi+vuyGJvWFreQ==
X-CSE-MsgGUID: tgYYy04jTMiEDzbj6mAHqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73169931"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="73169931"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 09:03:42 -0800
X-CSE-ConnectionGUID: cCCdMbV4Ro259a+wGBYb+w==
X-CSE-MsgGUID: PSH3WkFCTPaxoclRLj4cAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="216964847"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 27 Feb 2026 09:03:38 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, maarten@lankhorst.se,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 8/9] drm/xe/migrate: Introduce xe_migrate_reinit()
Date: Fri, 27 Feb 2026 22:30:48 +0530
Message-ID: <20260227170049.3418863-9-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227170049.3418863-1-raag.jadav@intel.com>
References: <20260227170049.3418863-1-raag.jadav@intel.com>
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

In preparation of usecases which require re-initializing migrate context
after PCIe FLR, introduce xe_migrate_reinit() helper. Migrate exec queue
and pt_bo already exist in migrate structure but since their contents live
on VRAM, they are lost on PCIe FLR and need re-initialization.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
v2: Re-initialize migrate context (Matthew Brost)
---
 drivers/gpu/drm/xe/xe_gt.c      | 10 +++++
 drivers/gpu/drm/xe/xe_migrate.c | 65 +++++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_migrate.h |  1 +
 3 files changed, 61 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index ff4a4e769fb1..ab34312830e3 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -966,6 +966,16 @@ void xe_gt_flr_prepare(struct xe_gt *gt)
  */
 int xe_gt_flr_done(struct xe_gt *gt)
 {
+	int err;
+
+	if (xe_gt_is_main_type(gt)) {
+		struct xe_tile *tile = gt_to_tile(gt);
+
+		err = xe_migrate_reinit(tile->migrate);
+		if (err)
+			return err;
+	}
+
 	return xe_uc_flr_done(&gt->uc);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 333af7b57ae9..f4a2ad3ce601 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -184,19 +184,11 @@ static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm,
 	xe_assert(xe, pos == vram_limit);
 }
 
-static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
-				 struct xe_vm *vm, struct drm_exec *exec)
+static int xe_migrate_pt_bo_alloc(struct xe_tile *tile, struct xe_migrate *m,
+				  struct xe_vm *vm, struct drm_exec *exec)
 {
-	struct xe_device *xe = tile_to_xe(tile);
-	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
-	u8 id = tile->id;
-	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
-#define VRAM_IDENTITY_MAP_COUNT	2
-	u32 num_setup = num_level + VRAM_IDENTITY_MAP_COUNT;
-#undef VRAM_IDENTITY_MAP_COUNT
-	u32 map_ofs, level, i;
 	struct xe_bo *bo, *batch = tile->mem.kernel_bb_pool->bo;
-	u64 entry, pt29_ofs;
+	u32 num_entries = NUM_PT_SLOTS;
 
 	/* Can't bump NUM_PT_SLOTS too high */
 	BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE);
@@ -216,6 +208,24 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
+	m->pt_bo = bo;
+	return 0;
+}
+
+static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
+				  struct xe_vm *vm, u32 *ofs)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
+	u8 id = tile->id;
+	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
+#define VRAM_IDENTITY_MAP_COUNT	2
+	u32 num_setup = num_level + VRAM_IDENTITY_MAP_COUNT;
+#undef VRAM_IDENTITY_MAP_COUNT
+	u32 map_ofs, level, i;
+	struct xe_bo *bo = m->pt_bo, *batch = tile->mem.kernel_bb_pool->bo;
+	u64 entry, pt29_ofs;
+
 	/* PT30 & PT31 reserved for 2M identity map */
 	pt29_ofs = xe_bo_size(bo) - 3 * XE_PAGE_SIZE;
 	entry = vm->pt_ops->pde_encode_bo(bo, pt29_ofs);
@@ -338,6 +348,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		}
 	}
 
+	if (ofs)
+		*ofs = map_ofs;
+}
+
+static void xe_migrate_suballoc_manager_init(struct xe_migrate *m, u32 map_ofs)
+{
 	/*
 	 * Example layout created above, with root level = 3:
 	 * [PT0...PT7]: kernel PT's for copy/clear; 64 or 4KiB PTE's
@@ -363,9 +379,6 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	drm_suballoc_manager_init(&m->vm_update_sa,
 				  (size_t)(map_ofs / XE_PAGE_SIZE - NUM_KERNEL_PDE) *
 				  NUM_VMUSA_UNIT_PER_PAGE, 0);
-
-	m->pt_bo = bo;
-	return 0;
 }
 
 /*
@@ -416,12 +429,22 @@ static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
+	u32 map_ofs;
 	int err = 0;
 
 	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
 		err = xe_vm_drm_exec_lock(vm, &exec);
+		if (err)
+			return err;
+
 		drm_exec_retry_on_contention(&exec);
-		err = xe_migrate_prepare_vm(tile, m, vm, &exec);
+
+		err = xe_migrate_pt_bo_alloc(tile, m, vm, &exec);
+		if (err)
+			return err;
+
+		xe_migrate_prepare_vm(tile, m, vm, &map_ofs);
+		xe_migrate_suballoc_manager_init(m, map_ofs);
 		drm_exec_retry_on_contention(&exec);
 		xe_validation_retry_on_oom(&ctx, &err);
 	}
@@ -429,6 +452,18 @@ static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m
 	return err;
 }
 
+/**
+ * xe_migrate_reinit() - Re-initialize a migrate context
+ * @m: The migration context
+ *
+ * Returns: 0 on success, negative error code otherwise.
+ */
+int xe_migrate_reinit(struct xe_migrate *m)
+{
+	xe_migrate_prepare_vm(m->tile, m, m->q->vm, NULL);
+	return xe_exec_queue_reinit(m->q);
+}
+
 /**
  * xe_migrate_init() - Initialize a migrate context
  * @m: The migration context
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 1522afb37dcf..fffbcab8b2e3 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -112,6 +112,7 @@ struct xe_migrate_pt_update {
 
 struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
 int xe_migrate_init(struct xe_migrate *m);
+int xe_migrate_reinit(struct xe_migrate *m);
 
 struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
 				     unsigned long npages,
-- 
2.43.0

