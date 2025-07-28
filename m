Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45D4C87FCE
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 09:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6752D10E4A2;
	Mon, 28 Jul 2025 09:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K2FK1+Iy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E486910E0F9
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 09:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753694290; x=1785230290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WaGq2bSpq5m9DkuwOn4cNVwWVkhgAnouNX7umc8JIzc=;
 b=K2FK1+IyZCpnL1PFeVASJRDK+Uv/oE9Gi1x5bE+P2P5dby7AIQiiJzEH
 pC9AZ9neXD7rFN9JWzyQIc+yB+8f/mcLBo07OHjZmMkVh19W7Jc8rIPMR
 uIdrk85wCtu1PdNijy84PIbVVa60liAss9mXDy6BjosSl07BzTTjIoiiA
 0ATxXLTTNySl+0dWdCb+fjBKRxL3bKu0KFkTIv+JcjDCd5JWdbluTliYb
 ekikrmeEyykC9HPur4uBm5fCWf13kcZkp7x0r8XktPUniG58gGwVH6vz+
 pdamINZeUwtxZIW0fD+SwXlab1Cuk0doX3dipgmRHJAZ1Bjvnu2hYhZOb g==;
X-CSE-ConnectionGUID: A2Yc0U6LTmGvjulHeonxzQ==
X-CSE-MsgGUID: wu7ixHisQUmOX3ZZLKkyeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="59756208"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="59756208"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 02:18:10 -0700
X-CSE-ConnectionGUID: d4Z4Qk2ORMW4t8cUXfxK1A==
X-CSE-MsgGUID: HXPtS1U4SeShJoiw+0NQ1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162241366"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa006.fm.intel.com with ESMTP; 28 Jul 2025 02:18:07 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH 3/3] Revert "drm/xe/vf: Create contexts for CCS read write"
Date: Mon, 28 Jul 2025 15:04:47 +0530
Message-ID: <20250728093447.27961-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728093447.27961-1-satyanarayana.k.v.p@intel.com>
References: <20250728093447.27961-1-satyanarayana.k.v.p@intel.com>
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

The VF CCS save/restore series (patchwork #149108) has a dependency
on the migration framework. A recent migration update in commit
d65ff1ec8535 ("drm/xe: Split xe_migrate allocation from initialization")
caused a VM crash during XE driver release for iGPU devices.

This reverts commit f3009272ff2ec0498426001e4dd2a12c50234e08.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/Makefile                |   1 -
 drivers/gpu/drm/xe/xe_device.c             |   4 -
 drivers/gpu/drm/xe/xe_device_types.h       |   4 -
 drivers/gpu/drm/xe/xe_gt_debugfs.c         |  39 ----
 drivers/gpu/drm/xe/xe_sriov.c              |  19 --
 drivers/gpu/drm/xe/xe_sriov.h              |   1 -
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 208 ---------------------
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  13 --
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  45 -----
 drivers/gpu/drm/xe/xe_sriov_vf_types.h     |   6 -
 10 files changed, 340 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
 delete mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
 delete mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 8e0c3412a757..47feda225086 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -152,7 +152,6 @@ xe-y += \
 	xe_memirq.o \
 	xe_sriov.o \
 	xe_sriov_vf.o \
-	xe_sriov_vf_ccs.o \
 	xe_tile_sriov_vf.o
 
 xe-$(CONFIG_PCI_IOV) += \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d04a0ae018e6..08f45777f797 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -940,10 +940,6 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_vsec_init(xe);
 
-	err = xe_sriov_late_init(xe);
-	if (err)
-		goto err_unregister_display;
-
 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_unregister_display:
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 38c8329b4d2c..eb6105523f23 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -23,7 +23,6 @@
 #include "xe_sriov_pf_types.h"
 #include "xe_sriov_types.h"
 #include "xe_sriov_vf_types.h"
-#include "xe_sriov_vf_ccs_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
 
@@ -183,9 +182,6 @@ struct xe_tile {
 		struct {
 			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
 			struct xe_ggtt_node *ggtt_balloon[2];
-
-			/** @sriov.vf.ccs: CCS read and write contexts for VF. */
-			struct xe_tile_vf_ccs ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
 		} vf;
 	} sriov;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 8d4b66ca38b7..061a81f82e76 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -134,33 +134,6 @@ static int sa_info(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
-static int sa_info_vf_ccs(struct xe_gt *gt, struct drm_printer *p)
-{
-	struct xe_tile *tile = gt_to_tile(gt);
-	struct xe_sa_manager *bb_pool;
-	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
-
-	if (!IS_VF_CCS_READY(gt_to_xe(gt)))
-		return 0;
-
-	xe_pm_runtime_get(gt_to_xe(gt));
-
-	for_each_ccs_rw_ctx(ctx_id) {
-		bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
-		if (!bb_pool)
-			break;
-
-		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");
-		drm_printf(p, "-------------------------\n");
-		drm_suballoc_dump_debug_info(&bb_pool->base, p, bb_pool->gpu_addr);
-		drm_puts(p, "\n");
-	}
-
-	xe_pm_runtime_put(gt_to_xe(gt));
-
-	return 0;
-}
-
 static int topology(struct xe_gt *gt, struct drm_printer *p)
 {
 	xe_pm_runtime_get(gt_to_xe(gt));
@@ -330,13 +303,6 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
 	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
 };
 
-/*
- * only for GT debugfs files which are valid on VF. Not valid on PF.
- */
-static const struct drm_info_list vf_only_debugfs_list[] = {
-	{"sa_info_vf_ccs", .show = xe_gt_debugfs_simple_show, .data = sa_info_vf_ccs},
-};
-
 /* everything else should be added here */
 static const struct drm_info_list pf_only_debugfs_list[] = {
 	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
@@ -458,11 +424,6 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 		drm_debugfs_create_files(pf_only_debugfs_list,
 					 ARRAY_SIZE(pf_only_debugfs_list),
 					 root, minor);
-	else
-		drm_debugfs_create_files(vf_only_debugfs_list,
-					 ARRAY_SIZE(vf_only_debugfs_list),
-					 root, minor);
-
 
 	xe_uc_debugfs_register(&gt->uc, root);
 
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index 87911fb4eea7..a0eab44c0e76 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -15,7 +15,6 @@
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
 #include "xe_sriov_vf.h"
-#include "xe_sriov_vf_ccs.h"
 
 /**
  * xe_sriov_mode_to_string - Convert enum value to string.
@@ -158,21 +157,3 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
 		strscpy(buf, "PF", size);
 	return buf;
 }
-
-/**
- * xe_sriov_late_init() - SR-IOV late initialization functions.
- * @xe: the &xe_device to initialize
- *
- * On VF this function will initialize code for CCS migration.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int xe_sriov_late_init(struct xe_device *xe)
-{
-	int err = 0;
-
-	if (IS_VF_CCS_INIT_NEEDED(xe))
-		err = xe_sriov_vf_ccs_init(xe);
-
-	return err;
-}
diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
index 0e0c1abf2d14..688fbabf08f1 100644
--- a/drivers/gpu/drm/xe/xe_sriov.h
+++ b/drivers/gpu/drm/xe/xe_sriov.h
@@ -18,7 +18,6 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
 void xe_sriov_probe_early(struct xe_device *xe);
 void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
 int xe_sriov_init(struct xe_device *xe);
-int xe_sriov_late_init(struct xe_device *xe);
 
 static inline enum xe_sriov_mode xe_device_sriov_mode(const struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
deleted file mode 100644
index 697eea46659a..000000000000
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ /dev/null
@@ -1,208 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2025 Intel Corporation
- */
-
-#include "instructions/xe_mi_commands.h"
-#include "instructions/xe_gpu_commands.h"
-#include "xe_bo.h"
-#include "xe_device.h"
-#include "xe_migrate.h"
-#include "xe_sa.h"
-#include "xe_sriov_printk.h"
-#include "xe_sriov_vf_ccs.h"
-#include "xe_sriov_vf_ccs_types.h"
-
-/**
- * DOC: VF save/restore of compression Meta Data
- *
- * VF KMD registers two special contexts/LRCAs.
- *
- * Save Context/LRCA: contain necessary cmds+page table to trigger Meta data /
- * compression control surface (Aka CCS) save in regular System memory in VM.
- *
- * Restore Context/LRCA: contain necessary cmds+page table to trigger Meta data /
- * compression control surface (Aka CCS) Restore from regular System memory in
- * VM to corresponding CCS pool.
- *
- * Below diagram explain steps needed for VF save/Restore of compression Meta Data::
- *
- *    CCS Save    CCS Restore          VF KMD                          Guc       BCS
- *     LRCA        LRCA
- *      |           |                     |                              |         |
- *      |           |                     |                              |         |
- *      |     Create Save LRCA            |                              |         |
- *     [ ]<----------------------------- [ ]                             |         |
- *      |           |                     |                              |         |
- *      |           |                     |                              |         |
- *      |           |                     |       Register save LRCA     |         |
- *      |           |                     |           with Guc           |         |
- *      |           |                    [ ]--------------------------->[ ]        |
- *      |           |                     |                              |         |
- *      |           | Create restore LRCA |                              |         |
- *      |          [ ]<------------------[ ]                             |         |
- *      |           |                     |                              |         |
- *      |           |                     |       Register restore LRCA  |         |
- *      |           |                     |           with Guc           |         |
- *      |           |                    [ ]--------------------------->[ ]        |
- *      |           |                     |                              |         |
- *      |           |                     |                              |         |
- *      |           |                    [ ]-------------------------    |         |
- *      |           |                    [ ]  Allocate main memory.  |   |         |
- *      |           |                    [ ]  Allocate CCS memory.   |   |         |
- *      |           |                    [ ]  Update Main memory &   |   |         |
- *     [ ]<------------------------------[ ]  CCS pages PPGTT + BB   |   |         |
- *      |          [ ]<------------------[ ]  cmds to save & restore.|   |         |
- *      |           |                    [ ]<------------------------    |         |
- *      |           |                     |                              |         |
- *      |           |                     |                              |         |
- *      |           |                     |                              |         |
- *      :           :                     :                              :         :
- *      ---------------------------- VF Paused -------------------------------------
- *      |           |                     |                              |         |
- *      |           |                     |                              |         |
- *      |           |                     |                              |Schedule |
- *      |           |                     |                              |CCS Save |
- *      |           |                     |                              | LRCA    |
- *      |           |                     |                             [ ]------>[ ]
- *      |           |                     |                              |         |
- *      |           |                     |                              |         |
- *      |           |                     |                              |CCS save |
- *      |           |                     |                              |completed|
- *      |           |                     |                             [ ]<------[ ]
- *      |           |                     |                              |         |
- *      :           :                     :                              :         :
- *      ---------------------------- VM Migrated -----------------------------------
- *      |           |                     |                              |         |
- *      |           |                     |                              |         |
- *      :           :                     :                              :         :
- *      ---------------------------- VF Resumed ------------------------------------
- *      |           |                     |                              |         |
- *      |           |                     |                              |         |
- *      |           |                    [ ]--------------               |         |
- *      |           |                    [ ] Fix up GGTT  |              |         |
- *      |           |                    [ ]<-------------               |         |
- *      |           |                     |                              |         |
- *      |           |                     |                              |         |
- *      |           |                     |  Notify VF_RESFIX_DONE       |         |
- *      |           |                    [ ]--------------------------->[ ]        |
- *      |           |                     |                              |         |
- *      |           |                     |                              |Schedule |
- *      |           |                     |                              |CCS      |
- *      |           |                     |                              |Restore  |
- *      |           |                     |                              |LRCA     |
- *      |           |                     |                             [ ]------>[ ]
- *      |           |                     |                              |         |
- *      |           |                     |                              |         |
- *      |           |                     |                              |CCS      |
- *      |           |                     |                              |restore  |
- *      |           |                     |                              |completed|
- *      |           |                     |                             [ ]<------[ ]
- *      |           |                     |                              |         |
- *      |           |                     |                              |         |
- *      |           |                     |  VF_RESFIX_DONE complete     |         |
- *      |           |                     |       notification           |         |
- *      |           |                    [ ]<---------------------------[ ]        |
- *      |           |                     |                              |         |
- *      |           |                     |                              |         |
- *      :           :                     :                              :         :
- *      ------------------------- Continue VM restore ------------------------------
- */
-
-static u64 get_ccs_bb_pool_size(struct xe_device *xe)
-{
-	u64 sys_mem_size, ccs_mem_size, ptes, bb_pool_size;
-	struct sysinfo si;
-
-	si_meminfo(&si);
-	sys_mem_size = si.totalram * si.mem_unit;
-	ccs_mem_size = div64_u64(sys_mem_size, NUM_BYTES_PER_CCS_BYTE(xe));
-	ptes = DIV_ROUND_UP_ULL(sys_mem_size + ccs_mem_size, XE_PAGE_SIZE);
-
-	/**
-	 * We need below BB size to hold PTE mappings and some DWs for copy
-	 * command. In reality, we need space for many copy commands. So, let
-	 * us allocate double the calculated size which is enough to holds GPU
-	 * instructions for the whole region.
-	 */
-	bb_pool_size = ptes * sizeof(u32);
-
-	return round_up(bb_pool_size * 2, SZ_1M);
-}
-
-static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
-{
-	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_sa_manager *sa_manager;
-	u64 bb_pool_size;
-	int offset, err;
-
-	bb_pool_size = get_ccs_bb_pool_size(xe);
-	xe_sriov_info(xe, "Allocating %s CCS BB pool size = %lldMB\n",
-		      ctx->ctx_id ? "Restore" : "Save", bb_pool_size / SZ_1M);
-
-	sa_manager = xe_sa_bo_manager_init(tile, bb_pool_size, SZ_16);
-
-	if (IS_ERR(sa_manager)) {
-		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
-			     sa_manager);
-		err = PTR_ERR(sa_manager);
-		return err;
-	}
-
-	offset = 0;
-	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
-		      bb_pool_size);
-
-	offset = bb_pool_size - sizeof(u32);
-	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
-
-	ctx->mem.ccs_bb_pool = sa_manager;
-
-	return 0;
-}
-
-/**
- * xe_sriov_vf_ccs_init - Setup LRCA for save & restore.
- * @xe: the &xe_device to start recovery on
- *
- * This function shall be called only by VF. It initializes
- * LRCA and suballocator needed for CCS save & restore.
- *
- * Return: 0 on success. Negative error code on failure.
- */
-int xe_sriov_vf_ccs_init(struct xe_device *xe)
-{
-	struct xe_tile *tile = xe_device_get_root_tile(xe);
-	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
-	struct xe_migrate *migrate;
-	struct xe_tile_vf_ccs *ctx;
-	int err;
-
-	xe_assert(xe, IS_SRIOV_VF(xe));
-	xe_assert(xe, !IS_DGFX(xe));
-	xe_assert(xe, xe_device_has_flat_ccs(xe));
-
-	for_each_ccs_rw_ctx(ctx_id) {
-		ctx = &tile->sriov.vf.ccs[ctx_id];
-		ctx->ctx_id = ctx_id;
-
-		migrate = xe_migrate_init(tile);
-		if (IS_ERR(migrate)) {
-			err = PTR_ERR(migrate);
-			goto err_ret;
-		}
-		ctx->migrate = migrate;
-
-		err = alloc_bb_pool(tile, ctx);
-		if (err)
-			goto err_ret;
-	}
-
-	xe->sriov.vf.ccs.initialized = 1;
-
-	return 0;
-
-err_ret:
-	return err;
-}
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
deleted file mode 100644
index 5df9ba028d14..000000000000
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2025 Intel Corporation
- */
-
-#ifndef _XE_SRIOV_VF_CCS_H_
-#define _XE_SRIOV_VF_CCS_H_
-
-struct xe_device;
-
-int xe_sriov_vf_ccs_init(struct xe_device *xe);
-
-#endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
deleted file mode 100644
index 6dc279d206ec..000000000000
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
+++ /dev/null
@@ -1,45 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2025 Intel Corporation
- */
-
-#ifndef _XE_SRIOV_VF_CCS_TYPES_H_
-#define _XE_SRIOV_VF_CCS_TYPES_H_
-
-#define for_each_ccs_rw_ctx(id__) \
-	for ((id__) = 0; (id__) < XE_SRIOV_VF_CCS_CTX_COUNT; (id__)++)
-
-#define IS_VF_CCS_READY(xe) ({ \
-		struct xe_device *___xe = (xe); \
-		xe_assert(___xe, IS_SRIOV_VF(___xe)); \
-		___xe->sriov.vf.ccs.initialized; \
-		})
-
-#define IS_VF_CCS_INIT_NEEDED(xe) ({\
-		struct xe_device *___xe = (xe); \
-		IS_SRIOV_VF(___xe) && !IS_DGFX(___xe) && \
-		xe_device_has_flat_ccs(___xe) && GRAPHICS_VER(___xe) >= 20; \
-		})
-
-enum xe_sriov_vf_ccs_rw_ctxs {
-	XE_SRIOV_VF_CCS_READ_CTX,
-	XE_SRIOV_VF_CCS_WRITE_CTX,
-	XE_SRIOV_VF_CCS_CTX_COUNT
-};
-
-struct xe_migrate;
-struct xe_sa_manager;
-
-struct xe_tile_vf_ccs {
-	/** @id: Id to which context it belongs to */
-	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
-	/** @migrate: Migration helper for save/restore of CCS data */
-	struct xe_migrate *migrate;
-
-	struct {
-		/** @ccs_rw_bb_pool: Pool from which batch buffers are allocated. */
-		struct xe_sa_manager *ccs_bb_pool;
-	} mem;
-};
-
-#endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
index 24a873c50c49..8300416a6226 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
@@ -36,12 +36,6 @@ struct xe_device_vf {
 		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
 		unsigned long gt_flags;
 	} migration;
-
-	/** @ccs: VF CCS state data */
-	struct {
-		/** @ccs.initialized: Initilalization of VF CCS is completed or not */
-		bool initialized;
-	} ccs;
 };
 
 #endif
-- 
2.43.0

