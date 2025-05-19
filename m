Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9050C3ABD8
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 12:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F44D10E0AB;
	Mon, 19 May 2025 12:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WpnhuxzL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEA310E0AB
 for <intel-xe@lists.freedesktop.org>; Mon, 19 May 2025 12:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747658203; x=1779194203;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8k8vB6WKJYLqzzpEINV5srm5NvRE5TLrAw5nZZZR0Oc=;
 b=WpnhuxzLQAKIZzy1N7ZgMOybNGYtq3Mdbe5RQpAjGEq/K9Qx+FWRkL6C
 TKBMbkRVZeP16s319wbml2GTqFbrppxm63QXt/pi2BkzPNGV7YXG99r9r
 eX7aV4/YahU0pB2DVS1uITM9/a6KphgzvV87pzAN9c/t/C7ot0sbxmtKM
 bqXwzmDRHzhsHCoX/ARfMZ9YLxXWorhDSWkppRZNwD827KR/4Tu/bw7MP
 xR6jPd3/C64V4sXoHSfCLOadhyutZ44SOrPHT+tnIlo47zkD/v2nXYNQg
 Jqqq9pfjGt4Ig5AE5wOlt3ABAjb+p6PzqCXrrS2HasD8imTq00Yj9He3T g==;
X-CSE-ConnectionGUID: ScuzuKGBR3e9YmwYc7IvUg==
X-CSE-MsgGUID: Tpml6vgOSlyHoP+9w/9kEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="52188128"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="52188128"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 05:36:43 -0700
X-CSE-ConnectionGUID: UUnaEqNuQ9GXJxLZ0y7KnA==
X-CSE-MsgGUID: dvs+fOW1TE26yc+o/dEJ5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="139870564"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa007.jf.intel.com with ESMTP; 19 May 2025 05:36:40 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [RFC 1/3] drm/xe/vf: Create contexts for CCS read write
Date: Mon, 19 May 2025 18:22:55 +0530
Message-ID: <20250519125257.10070-2-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250519125257.10070-1-satyanarayana.k.v.p@intel.com>
References: <20250519125257.10070-1-satyanarayana.k.v.p@intel.com>
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
---
 drivers/gpu/drm/xe/Makefile                |   3 +-
 drivers/gpu/drm/xe/xe_device.c             |   4 +
 drivers/gpu/drm/xe/xe_device_types.h       |   4 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c         |  35 +++++
 drivers/gpu/drm/xe/xe_sriov.c              |  20 +++
 drivers/gpu/drm/xe/xe_sriov.h              |   1 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 158 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  13 ++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  26 ++++
 9 files changed, 263 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e4bf484d4121..ad2fb025463a 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -139,7 +139,8 @@ xe-y += \
 	xe_guc_relay.o \
 	xe_memirq.o \
 	xe_sriov.o \
-	xe_sriov_vf.o
+	xe_sriov_vf.o \
+	xe_sriov_vf_ccs.o
 
 xe-$(CONFIG_PCI_IOV) += \
 	xe_gt_sriov_pf.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d4b6e623aa48..56ade9b7c564 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -929,6 +929,10 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_vsec_init(xe);
 
+	err = xe_sriov_late_init(xe);
+	if (err)
+		goto err_unregister_display;
+
 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_unregister_display:
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 902b2e30b3b9..5611cedf3f49 100644
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
@@ -237,6 +238,9 @@ struct xe_tile {
 		struct {
 			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
 			struct xe_ggtt_node *ggtt_balloon[2];
+
+			/** @sriov.vf.ccs: CCS read and write contexts for VF. */
+			struct xe_tile_vf_ccs ccs[XE_SRIOV_VF_CCS_RW_MAX_CTXS];
 		} vf;
 	} sriov;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 119a55bb7580..d85638c13967 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -152,6 +152,29 @@ static int sa_info(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
+static int sa_info_vf_ccs(struct xe_gt *gt, struct drm_printer *p)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_sa_manager *bb_pool;
+
+	xe_pm_runtime_get(gt_to_xe(gt));
+
+	drm_printf(p, "ccs read bb suballoc info\n");
+	drm_printf(p, "-------------------------\n");
+	bb_pool = tile->sriov.vf.ccs[0].mem.ccs_bb_pool;
+	drm_suballoc_dump_debug_info(&bb_pool->base, p, bb_pool->gpu_addr);
+
+	drm_puts(p, "\n");
+	drm_printf(p, "ccs write bb suballoc info\n");
+	drm_printf(p, "-------------------------\n");
+	bb_pool = tile->sriov.vf.ccs[1].mem.ccs_bb_pool;
+	drm_suballoc_dump_debug_info(&bb_pool->base, p, bb_pool->gpu_addr);
+
+	xe_pm_runtime_put(gt_to_xe(gt));
+
+	return 0;
+}
+
 static int topology(struct xe_gt *gt, struct drm_printer *p)
 {
 	xe_pm_runtime_get(gt_to_xe(gt));
@@ -323,6 +346,13 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
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
@@ -363,6 +393,11 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 		drm_debugfs_create_files(pf_only_debugfs_list,
 					 ARRAY_SIZE(pf_only_debugfs_list),
 					 root, minor);
+	else
+		drm_debugfs_create_files(vf_only_debugfs_list,
+					 ARRAY_SIZE(pf_only_debugfs_list),
+					 root, minor);
+
 
 	xe_uc_debugfs_register(&gt->uc, root);
 
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index a0eab44c0e76..a773bc4acb6f 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -15,6 +15,7 @@
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
 #include "xe_sriov_vf.h"
+#include "xe_sriov_vf_ccs.h"
 
 /**
  * xe_sriov_mode_to_string - Convert enum value to string.
@@ -157,3 +158,22 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
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
+	if (IS_SRIOV_VF(xe) && !IS_DGFX(xe) && xe_device_has_flat_ccs(xe) &&
+	    GRAPHICS_VER(xe) >= 20)
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
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
new file mode 100644
index 000000000000..7cd79d25a398
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "instructions/xe_mi_commands.h"
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
+#define for_each_ccs_rw_ctx(id__) \
+       for ((id__) = 0; (id__) < XE_SRIOV_VF_CCS_RW_MAX_CTXS; (id__)++)
+
+#define MAX_CCS_RW_BB_POOL_SIZE	(SZ_4K * XE_PAGE_SIZE)
+
+static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_sa_manager *sa_manager;
+	int offset, err;
+
+	sa_manager = xe_sa_bo_manager_init(tile, MAX_CCS_RW_BB_POOL_SIZE, SZ_16);
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
+		      MAX_CCS_RW_BB_POOL_SIZE);
+
+	offset = MAX_CCS_RW_BB_POOL_SIZE - sizeof(u32);
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
+	xe_assert(xe, (IS_SRIOV_VF(xe) || !IS_DGFX(xe)));
+
+	for_each_tile(tile, xe, tile_id) {
+		for_each_ccs_rw_ctx(ctx_id) {
+			ctx = &tile->sriov.vf.ccs[ctx_id];
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
index 000000000000..2dbc752048ee
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022-2023 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_VF_CCS__TYPES_H_
+#define _XE_SRIOV_VF_CCS__TYPES_H_
+
+#define XE_SRIOV_VF_CCS_READ_CTX	0
+#define XE_SRIOV_VF_CCS_WRITE_CTX	1
+#define XE_SRIOV_VF_CCS_RW_MAX_CTXS	(XE_SRIOV_VF_CCS_WRITE_CTX + 1)
+
+struct xe_migrate;
+struct xe_sa_manager;
+
+struct xe_tile_vf_ccs {
+	/** @migrate: Migration helper for save/restore of CCS data */
+	struct xe_migrate *migrate;
+
+	struct {
+		/** @ccs_rw_bb_pool: Pool from which batchbuffers are allocated. */
+		struct xe_sa_manager *ccs_bb_pool;
+	} mem;
+};
+
+#endif
-- 
2.43.0

