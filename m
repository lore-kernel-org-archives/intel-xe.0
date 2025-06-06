Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFC2C61CE8
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 12:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85CBC10EA8F;
	Fri,  6 Jun 2025 12:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQCj/F1q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FEA10E37F
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 12:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749212981; x=1780748981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nJaE8EMjjnPT98hqDTY0udKmzfEhTMhBpgLYOqqDIyU=;
 b=eQCj/F1q1X9zpIrC+m0dZNrYwH4efo4UbM1mviBt/5baC51XZqJxvrv4
 dqUDLYU03L+1ZR6taDpVYhIyUcXIoyUwvsYqVb9RxusNv/E2Pf4H8Jcl6
 as5Nos1KPVt1nv43H7G49HVL3t1+0Jr3u/rvnqTEuChbL9gc4Lbg1VJ9K
 o7QcLTcpUUixsBqsfPIybUfUrAw8UhiPwuDIJwG0q0f/C4DN0FCx8941a
 QYiqg9v1SHSdx5vrch9KNOQ4akYIW44PBJ4DPq9RXmdHOCFOm9kCHOXhn
 HOlfPiEb8rn33cNrfQg49X3DKNrl26uveh/ml3TIqgIvw4Ujx+xH8TMS+ g==;
X-CSE-ConnectionGUID: Jr9k7ruyQhq35W+nha9emw==
X-CSE-MsgGUID: mClC1wnrThOox4oSoXq3tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51063969"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51063969"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 05:29:41 -0700
X-CSE-ConnectionGUID: 31wNDQElTjG36nRJL4t35w==
X-CSE-MsgGUID: A7/qtN/fT0SBhbJXLGUi7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="146167511"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa008.fm.intel.com with ESMTP; 06 Jun 2025 05:29:37 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v6 1/3] drm/xe/vf: Create contexts for CCS read write
Date: Fri,  6 Jun 2025 18:15:56 +0530
Message-ID: <20250606124558.30966-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606124558.30966-1-satyanarayana.k.v.p@intel.com>
References: <20250606124558.30966-1-satyanarayana.k.v.p@intel.com>
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

Create two LRCs to handle CCS meta data read / write from CCS pool in the
VM. Read context is used to hold GPU instructions to be executed at save
time and write context is used to hold GPU instructions to be executed at
the restore time.

Allocate batch buffer pool using suballocator for both read and write
contexts.

Migration framework is reused to create LRCAs for read and write.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>

V5 -> V6:
- Added id field in the xe_tile_vf_ccs structure for self identification.

V4 -> V5:
- Modified read/write contexts to enums from #defines (Matthew Brost).
- The CCS BB pool size is calculated based on the system memory size (Michal
  Wajdeczko & Matthew Brost).

V3 -> V4:
- Fixed issues reported by patchworks.

V2 -> V3:
- Added new variable which denotes the initialization of contexts.

V1 -> V2:
- Fixed review comments.
---
 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/xe_device.c             |   4 +
 drivers/gpu/drm/xe/xe_device_types.h       |   4 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c         |  36 ++++
 drivers/gpu/drm/xe/xe_sriov.c              |  19 +++
 drivers/gpu/drm/xe/xe_sriov.h              |   1 +
 drivers/gpu/drm/xe/xe_sriov_types.h        |   5 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 186 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  13 ++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  46 +++++
 10 files changed, 315 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index f5f5775acdc0..3b5241937742 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -140,6 +140,7 @@ xe-y += \
 	xe_memirq.o \
 	xe_sriov.o \
 	xe_sriov_vf.o \
+	xe_sriov_vf_ccs.o \
 	xe_tile_sriov_vf.o
 
 xe-$(CONFIG_PCI_IOV) += \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 660b0c5126dc..bf96045770c7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -925,6 +925,10 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_vsec_init(xe);
 
+	err = xe_sriov_late_init(xe);
+	if (err)
+		goto err_unregister_display;
+
 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_unregister_display:
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index ac27389ccb8b..caf3bb1ef048 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -22,6 +22,7 @@
 #include "xe_pmu_types.h"
 #include "xe_pt_types.h"
 #include "xe_sriov_types.h"
+#include "xe_sriov_vf_ccs_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
 #include "xe_ttm_vram_mgr_types.h"
@@ -234,6 +235,9 @@ struct xe_tile {
 		struct {
 			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
 			struct xe_ggtt_node *ggtt_balloon[2];
+
+			/** @sriov.vf.ccs: CCS read and write contexts for VF. */
+			struct xe_tile_vf_ccs ccs[XE_SRIOV_VF_CCS_RW_MAX_CTXS];
 		} vf;
 	} sriov;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 848618acdca8..2c6d757db810 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -134,6 +134,30 @@ static int sa_info(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
+static int sa_info_vf_ccs(struct xe_gt *gt, struct drm_printer *p)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_sa_manager *bb_pool;
+	int ctx_id;
+
+	if (!IS_VF_CCS_READY(gt_to_xe(gt)))
+		return 0;
+
+	xe_pm_runtime_get(gt_to_xe(gt));
+
+	for_each_ccs_rw_ctx(ctx_id) {
+		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");
+		drm_printf(p, "-------------------------\n");
+		bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
+		drm_suballoc_dump_debug_info(&bb_pool->base, p, bb_pool->gpu_addr);
+		drm_puts(p, "\n");
+	}
+
+	xe_pm_runtime_put(gt_to_xe(gt));
+
+	return 0;
+}
+
 static int topology(struct xe_gt *gt, struct drm_printer *p)
 {
 	xe_pm_runtime_get(gt_to_xe(gt));
@@ -303,6 +327,13 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
 	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
 };
 
+/*
+ * only for GT debugfs files which are valid on VF. Not valid on PF.
+ */
+static const struct drm_info_list vf_only_debugfs_list[] = {
+	{"sa_info_vf_ccs", .show = xe_gt_debugfs_simple_show, .data = sa_info_vf_ccs},
+};
+
 /* everything else should be added here */
 static const struct drm_info_list pf_only_debugfs_list[] = {
 	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
@@ -419,6 +450,11 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 		drm_debugfs_create_files(pf_only_debugfs_list,
 					 ARRAY_SIZE(pf_only_debugfs_list),
 					 root, minor);
+	else
+		drm_debugfs_create_files(vf_only_debugfs_list,
+					 ARRAY_SIZE(vf_only_debugfs_list),
+					 root, minor);
+
 
 	xe_uc_debugfs_register(&gt->uc, root);
 
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index a0eab44c0e76..87911fb4eea7 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -15,6 +15,7 @@
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
 #include "xe_sriov_vf.h"
+#include "xe_sriov_vf_ccs.h"
 
 /**
  * xe_sriov_mode_to_string - Convert enum value to string.
@@ -157,3 +158,21 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
 		strscpy(buf, "PF", size);
 	return buf;
 }
+
+/**
+ * xe_sriov_late_init() - SR-IOV late initialization functions.
+ * @xe: the &xe_device to initialize
+ *
+ * On VF this function will initialize code for CCS migration.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_late_init(struct xe_device *xe)
+{
+	int err = 0;
+
+	if (IS_VF_CCS_INIT_NEEDED(xe))
+		err = xe_sriov_vf_ccs_init(xe);
+
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
index 688fbabf08f1..0e0c1abf2d14 100644
--- a/drivers/gpu/drm/xe/xe_sriov.h
+++ b/drivers/gpu/drm/xe/xe_sriov.h
@@ -18,6 +18,7 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
 void xe_sriov_probe_early(struct xe_device *xe);
 void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
 int xe_sriov_init(struct xe_device *xe);
+int xe_sriov_late_init(struct xe_device *xe);
 
 static inline enum xe_sriov_mode xe_device_sriov_mode(const struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
index ca94382a721e..8abfdb2c5ead 100644
--- a/drivers/gpu/drm/xe/xe_sriov_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_types.h
@@ -71,6 +71,11 @@ struct xe_device_vf {
 		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
 		unsigned long gt_flags;
 	} migration;
+
+	struct {
+		/** @initialized: Initilalization of vf ccs is completed or not */
+		bool initialized;
+	} ccs;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
new file mode 100644
index 000000000000..41fe1f59e0e9
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "instructions/xe_mi_commands.h"
+#include "instructions/xe_gpu_commands.h"
+#include "xe_bo.h"
+#include "xe_device.h"
+#include "xe_migrate.h"
+#include "xe_sa.h"
+#include "xe_sriov_printk.h"
+#include "xe_sriov_vf_ccs.h"
+#include "xe_sriov_vf_ccs_types.h"
+
+/**
+ * DOC: VF save/restore of compression Meta Data
+ *
+ * VF KMD registers two special contexts/LRCAs.
+ *
+ * Save Context/LRCA: contain necessary cmds+page table to trigger Meta data /
+ * compression control surface (Aka CCS) save in regular System memory in VM.
+ *
+ * Restore Context/LRCA: contain necessary cmds+page table to trigger Meta data /
+ * compression control surface (Aka CCS) Restore from regular System memory in
+ * VM to corresponding CCS pool.
+ *
+ * Below diagram explain steps needed for VF save/Restore of compression Meta
+ * Data::
+ *
+ *    CCS Save    CCS Restore          VF KMD                          Guc       BCS
+ *     LRCA        LRCA
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |         |
+ *      |     Create Save LRCA            |                              |         |
+ *     [ ]<----------------------------- [ ]                             |         |
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |         |
+ *      |           |                     |   Register LRCA with Guc     |         |
+ *      |           |                    [ ]--------------------------->[ ]        |
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |         |
+ *      |           | Create restore LRCA |                              |         |
+ *      |          [ ]<------------------[ ]                             |         |
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |         |
+ *      |           |                    [ ]-----------------------      |         |
+ *      |           |                    [ ]  Allocate main memory |     |         |
+ *      |           |                    [ ]  Allocate CCS memory  |     |         |
+ *      |           |                    [ ]<----------------------      |         |
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |         |
+ *      | Update Main memory & CCS pages  |                              |         |
+ *      |   PPGTT + BB cmds to save       |                              |         |
+ *     [ ]<------------------------------[ ]                             |         |
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |         |
+ *      |           | Update Main memory  |                              |         |
+ *      |           | & CCS pages PPGTT + |                              |         |
+ *      |           | BB cms to restore   |                              |         |
+ *      |          [ ]<------------------[ ]                             |         |
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |         |
+ *      |           |                   VF Pause                         |         |
+ *      |           |                     |                              |Schedule |
+ *      |           |                     |                              |CCS Save |
+ *      |           |                     |                              | LRCA    |
+ *      |           |                     |                             [ ]------>[ ]
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |         |
+ *      |           |                   VF Restore                       |         |
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |         |
+ *      |           |                    [ ]--------------               |         |
+ *      |           |                    [ ] Fix up GGTT  |              |         |
+ *      |           |                    [ ]<-------------               |         |
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |Schedule |
+ *      |           |                     |                              |CCS      |
+ *      |           |                     |                              |Restore  |
+ *      |           |                     |                              |LRCA     |
+ *      |           |                     |                             [ ]------>[ ]
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |         |
+ *
+ */
+
+static u64 get_ccs_bb_pool_size(struct xe_device *xe)
+{
+	u64 sys_mem_size, ccs_mem_size, ptes, bb_pool_size;
+	struct sysinfo si;
+
+	si_meminfo(&si);
+	sys_mem_size = si.totalram * si.mem_unit;
+	ccs_mem_size = sys_mem_size / NUM_BYTES_PER_CCS_BYTE(xe);
+	ptes = DIV_ROUND_UP(sys_mem_size + ccs_mem_size, XE_PAGE_SIZE);
+
+	/**
+	 * We need below BB size to hold PTE mappings and some DWs for copy
+	 * command. In reality, we need space for many copy commands. So, let
+	 * us allocate double the calculated size which is enough to holds GPU
+	 * instructions for the whole region.
+	 */
+	bb_pool_size = ptes * sizeof(u32);
+
+	return round_up(bb_pool_size * 2, SZ_1M);
+}
+
+static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_sa_manager *sa_manager;
+	u64 bb_pool_size;
+	int offset, err;
+
+	bb_pool_size = get_ccs_bb_pool_size(xe);
+	xe_sriov_info(xe, "Allocating %s CCS BB pool size = %lldMB\n",
+		      ctx->id ? "Restore" : "Save", bb_pool_size / SZ_1M);
+
+	sa_manager = xe_sa_bo_manager_init(tile, bb_pool_size, SZ_16);
+
+	if (IS_ERR(sa_manager)) {
+		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
+			     sa_manager);
+		err = PTR_ERR(sa_manager);
+		return err;
+	}
+
+	offset = 0;
+	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
+		      bb_pool_size);
+
+	offset = bb_pool_size - sizeof(u32);
+	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
+
+	ctx->mem.ccs_bb_pool = sa_manager;
+
+	return 0;
+}
+
+/**
+ * xe_sriov_vf_ccs_init - Setup LRCA for save & restore.
+ * @xe: the &xe_device to start recovery on
+ *
+ * This function shall be called only by VF. It initializes
+ * LRCA and suballocator needed for CCS save & restore.
+ *
+ * Return: 0 on success. Negative error code on failure.
+ */
+int xe_sriov_vf_ccs_init(struct xe_device *xe)
+{
+	struct xe_migrate *migrate;
+	struct xe_tile_vf_ccs *ctx;
+	struct xe_tile *tile;
+	int tile_id, ctx_id;
+	int err = 0;
+
+	xe_assert(xe, (IS_SRIOV_VF(xe) || !IS_DGFX(xe) ||
+		       xe_device_has_flat_ccs(xe)));
+
+	for_each_tile(tile, xe, tile_id) {
+		for_each_ccs_rw_ctx(ctx_id) {
+			ctx = &tile->sriov.vf.ccs[ctx_id];
+			ctx->id = ctx_id;
+
+			migrate = xe_migrate_init(tile);
+			if (IS_ERR(migrate)) {
+				err = PTR_ERR(migrate);
+				goto err_ret;
+			}
+			ctx->migrate = migrate;
+
+			err = alloc_bb_pool(tile, ctx);
+			if (err)
+				goto err_ret;
+		}
+	}
+
+	xe->sriov.vf.ccs.initialized = 1;
+
+	return 0;
+
+err_ret:
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
new file mode 100644
index 000000000000..5df9ba028d14
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_VF_CCS_H_
+#define _XE_SRIOV_VF_CCS_H_
+
+struct xe_device;
+
+int xe_sriov_vf_ccs_init(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
new file mode 100644
index 000000000000..f67f002c7a96
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022-2023 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_VF_CCS__TYPES_H_
+#define _XE_SRIOV_VF_CCS__TYPES_H_
+
+#define for_each_ccs_rw_ctx(id__) \
+	for ((id__) = 0; (id__) < XE_SRIOV_VF_CCS_RW_MAX_CTXS; (id__)++)
+
+#define IS_VF_CCS_READY(xe) ({ \
+		struct xe_device *___xe = (xe); \
+		xe_assert(___xe, IS_SRIOV_VF(___xe)); \
+		___xe->sriov.vf.ccs.initialized; \
+		})
+
+#define IS_VF_CCS_INIT_NEEDED(xe) ({\
+		struct xe_device *___xe = (xe); \
+		IS_SRIOV_VF(___xe) && !IS_DGFX(___xe) && \
+		xe_device_has_flat_ccs(___xe) && GRAPHICS_VER(___xe) >= 20; \
+		})
+
+enum xe_sriov_vf_ccs_rw_ctxs {
+	XE_SRIOV_VF_CCS_RW_MIN_CTXS = 0,
+	XE_SRIOV_VF_CCS_READ_CTX = XE_SRIOV_VF_CCS_RW_MIN_CTXS,
+	XE_SRIOV_VF_CCS_WRITE_CTX,
+	XE_SRIOV_VF_CCS_RW_MAX_CTXS
+};
+
+struct xe_migrate;
+struct xe_sa_manager;
+
+struct xe_tile_vf_ccs {
+	/** @id: Id to which context it belongs to */
+	int id;
+	/** @migrate: Migration helper for save/restore of CCS data */
+	struct xe_migrate *migrate;
+
+	struct {
+		/** @ccs_rw_bb_pool: Pool from which batch buffers are allocated. */
+		struct xe_sa_manager *ccs_bb_pool;
+	} mem;
+};
+
+#endif
-- 
2.43.0

