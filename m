Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B71E67A9E
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 10:22:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0617D10E175;
	Tue,  3 Mar 2026 10:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P0ThpKLU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F0810E175
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 10:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772533329; x=1804069329;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V7I0D9yQJkVBJT0ChrGpX2EMxRMd0l+s29S4Z73CXsc=;
 b=P0ThpKLUqddT9CfIYcPx9PHUqKOZ6AyLPfkrkQPWGU0vTg0+GjZWeQWa
 nczrfFLCFK+I+tXN8NPONQB+poz/CtB5tHpqA0RRi8iLGWnI/AE1CpDwR
 lLjZJo9KN6o9Bqh6vecmKNxNCmO6wlgSlDjJqzrd+niryD+92abyvH2YL
 g8brphkmu9Kw6yfUCjogx+9jSEZ9WxjaWyDSWZ5s6Os96VFZEBeCM+TOS
 kbx8lVkxTksyLHmFe3xa5JhVUtmf0oOseXNuIIPY0OcXcx9/I32YNsNMq
 yGWpwjLHzwWW/IgRp0DAIVLVSWONSk1G/HGdSoaM8Js2uEaOiwBqOD5Dd Q==;
X-CSE-ConnectionGUID: h7onZRlfQn69mafEB8Jb4w==
X-CSE-MsgGUID: sK77HLjSSqKsovFjmZo4xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84275747"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="84275747"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 02:22:09 -0800
X-CSE-ConnectionGUID: mOTuUlRxQ++MiRVv892wjQ==
X-CSE-MsgGUID: WAfRNYdqTo2dluakBd6H3A==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 03 Mar 2026 02:22:06 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 matthew.auld@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/migrate: Refactor xe_migrate_prepare_vm()
Date: Tue,  3 Mar 2026 15:49:13 +0530
Message-ID: <20260303101913.3576481-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

Currently xe_migrate_prepare_vm() does three things.

1. Allocates pt_bo for migrate context.
2. Initializes pt_bo with actual pte details.
3. Initializes sa_manager for migrate context.

Split these implementations in their own functions for better
maintainability.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 53 +++++++++++++++++++++++----------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 333af7b57ae9..283d55fef6b8 100644
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
-- 
2.43.0

