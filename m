Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF3ECA0FF0
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 20:11:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7622910EC38;
	Fri, 29 Aug 2025 20:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TAx5AiNW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F86210EC38
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 20:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756498279; x=1788034279;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RQVQVjslAjIRkGJdKDHYUI+4dyBtrtY4Ge0OY8wv5PU=;
 b=TAx5AiNWh2tqmU12k7swKS/vWy1Gz4kzTdbfA6KrW0j03+Sq0xDQXOmt
 f2boOyHid3W3okorUn9+RT0cE3IjJjNTUJYoHvpnN2fRlVygrzaIf3+hU
 /SS7w3b2gMW0nuTXpeaiqaBV3OZCq0WWsCvGC+mrmrrmmeug4/kiwpRRs
 4/tlSeG/U7wnEQnTlQWSeRSCaJpA0CqABf4gZOmWTJ8qnxT75J/h3dgWB
 uCOe4hsSRW6lhHIext512UKPdbZac6LOzbHjWUWDTwWmJf0FyMAF6oeF/
 Wx+Iyf1WTUZeXNaoZeKAkto1OUGd2ghO1C286iEoLp9d248Qu1YDC2Snv A==;
X-CSE-ConnectionGUID: 2kwlLnAnS5KdJU99ec++bA==
X-CSE-MsgGUID: Oj1hG4OWRYOt5xooe95bwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="84198433"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="84198433"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 13:11:19 -0700
X-CSE-ConnectionGUID: 7VSTWzISSceauJdyNtOMqQ==
X-CSE-MsgGUID: 8r9NosEGQOyUEcWeufVU/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170850922"
Received: from ruymanre-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 13:11:18 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe/debugfs: Move sa_info from gt to tile directory
Date: Fri, 29 Aug 2025 22:11:03 +0200
Message-ID: <20250829201106.1263-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

Our drm-based suballocator is implemented per-tile so it is better
to show its debug information also per-tile debugfs directory, not
under per-gt directory as it is done today.

To allow adding more per-tile attributes, prepare necessary helper
functions, like we already did for per-gt or per-uc attributes.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |   1 +
 drivers/gpu/drm/xe/xe_debugfs.c      |  20 +---
 drivers/gpu/drm/xe/xe_gt_debugfs.c   |  13 ---
 drivers/gpu/drm/xe/xe_tile_debugfs.c | 135 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile_debugfs.h |  13 +++
 5 files changed, 151 insertions(+), 31 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_tile_debugfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_tile_debugfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 987e4fe10538..95c0f0a9b403 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -325,6 +325,7 @@ ifeq ($(CONFIG_DEBUG_FS),y)
 		xe_gt_stats.o \
 		xe_guc_debugfs.o \
 		xe_huc_debugfs.o \
+		xe_tile_debugfs.o \
 		xe_uc_debugfs.o
 
 	xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 8d6df6bd885e..4b71570529a6 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -25,6 +25,7 @@
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
 #include "xe_step.h"
+#include "xe_tile_debugfs.h"
 #include "xe_wa.h"
 #include "xe_vsec.h"
 
@@ -329,23 +330,6 @@ static const struct file_operations atomic_svm_timeslice_ms_fops = {
 	.write = atomic_svm_timeslice_ms_set,
 };
 
-static void create_tile_debugfs(struct xe_tile *tile, struct dentry *root)
-{
-	char name[8];
-
-	snprintf(name, sizeof(name), "tile%u", tile->id);
-	tile->debugfs = debugfs_create_dir(name, root);
-	if (IS_ERR(tile->debugfs))
-		return;
-
-	/*
-	 * Store the xe_tile pointer as private data of the tile/ directory
-	 * node so other tile specific attributes under that directory may
-	 * refer to it by looking at its parent node private data.
-	 */
-	tile->debugfs->d_inode->i_private = tile;
-}
-
 void xe_debugfs_register(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
@@ -398,7 +382,7 @@ void xe_debugfs_register(struct xe_device *xe)
 		ttm_resource_manager_create_debugfs(man, root, "stolen_mm");
 
 	for_each_tile(tile, xe, tile_id)
-		create_tile_debugfs(tile, root);
+		xe_tile_debugfs_register(tile);
 
 	for_each_gt(gt, xe, id)
 		xe_gt_debugfs_register(gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index bf3a67b5951c..f7a362ac8030 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -123,18 +123,6 @@ static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
 	return ret;
 }
 
-static int sa_info(struct xe_gt *gt, struct drm_printer *p)
-{
-	struct xe_tile *tile = gt_to_tile(gt);
-
-	xe_pm_runtime_get(gt_to_xe(gt));
-	drm_suballoc_dump_debug_info(&tile->mem.kernel_bb_pool->base, p,
-				     xe_sa_manager_gpu_addr(tile->mem.kernel_bb_pool));
-	xe_pm_runtime_put(gt_to_xe(gt));
-
-	return 0;
-}
-
 static int sa_info_vf_ccs(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -316,7 +304,6 @@ static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
  * - without access to the PF specific data
  */
 static const struct drm_info_list vf_safe_debugfs_list[] = {
-	{"sa_info", .show = xe_gt_debugfs_simple_show, .data = sa_info},
 	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
 	{"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
 	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
diff --git a/drivers/gpu/drm/xe/xe_tile_debugfs.c b/drivers/gpu/drm/xe/xe_tile_debugfs.c
new file mode 100644
index 000000000000..5523874cba7b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_tile_debugfs.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/debugfs.h>
+#include <drm/drm_debugfs.h>
+
+#include "xe_pm.h"
+#include "xe_sa.h"
+#include "xe_tile_debugfs.h"
+
+static struct xe_tile *node_to_tile(struct drm_info_node *node)
+{
+	return node->dent->d_parent->d_inode->i_private;
+}
+
+/**
+ * tile_debugfs_simple_show - A show callback for struct drm_info_list
+ * @m: the &seq_file
+ * @data: data used by the drm debugfs helpers
+ *
+ * This callback can be used in struct drm_info_list to describe debugfs
+ * files that are &xe_tile specific.
+ *
+ * It is assumed that those debugfs files will be created on directory entry
+ * which struct dentry d_inode->i_private points to &xe_tile.
+ *
+ *      /sys/kernel/debug/dri/0/
+ *      ├── tile0/		# tile = dentry->d_inode->i_private
+ *      │   │   ├── id		# tile = dentry->d_parent->d_inode->i_private
+ *
+ * This function assumes that &m->private will be set to the &struct
+ * drm_info_node corresponding to the instance of the info on a given &struct
+ * drm_minor (see struct drm_info_list.show for details).
+ *
+ * This function also assumes that struct drm_info_list.data will point to the
+ * function code that will actually print a file content::
+ *
+ *   int (*print)(struct xe_tile *, struct drm_printer *)
+ *
+ * Example::
+ *
+ *    int tile_id(struct xe_tile *tile, struct drm_printer *p)
+ *    {
+ *        drm_printf(p, "%u\n", tile->id);
+ *        return 0;
+ *    }
+ *
+ *    static const struct drm_info_list info[] = {
+ *        { name = "id", .show = tile_debugfs_simple_show, .data = tile_id },
+ *    };
+ *
+ *    dir = debugfs_create_dir("tile0", parent);
+ *    dir->d_inode->i_private = tile;
+ *    drm_debugfs_create_files(info, ARRAY_SIZE(info), dir, minor);
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+static int tile_debugfs_simple_show(struct seq_file *m, void *data)
+{
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct drm_info_node *node = m->private;
+	struct xe_tile *tile = node_to_tile(node);
+	int (*print)(struct xe_tile *, struct drm_printer *) = node->info_ent->data;
+
+	return print(tile, &p);
+}
+
+/**
+ * tile_debugfs_show_with_rpm - A show callback for struct drm_info_list
+ * @m: the &seq_file
+ * @data: data used by the drm debugfs helpers
+ *
+ * Similar to tile_debugfs_simple_show() but implicitly takes a RPM ref.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+static int tile_debugfs_show_with_rpm(struct seq_file *m, void *data)
+{
+	struct drm_info_node *node = m->private;
+	struct xe_tile *tile = node_to_tile(node);
+	struct xe_device *xe = tile_to_xe(tile);
+	int ret;
+
+	xe_pm_runtime_get(xe);
+	ret = tile_debugfs_simple_show(m, data);
+	xe_pm_runtime_put(xe);
+
+	return ret;
+}
+
+static int sa_info(struct xe_tile *tile, struct drm_printer *p)
+{
+	drm_suballoc_dump_debug_info(&tile->mem.kernel_bb_pool->base, p,
+				     xe_sa_manager_gpu_addr(tile->mem.kernel_bb_pool));
+
+	return 0;
+}
+
+/* only for debugfs files which can be safely used on the VF */
+static const struct drm_info_list vf_safe_debugfs_list[] = {
+	{ "sa_info", .show = tile_debugfs_show_with_rpm, .data = sa_info },
+};
+
+/**
+ * xe_tile_debugfs_register - Register tile's debugfs attributes
+ * @tile: the &xe_tile to register
+ *
+ * Create debugfs sub-directory with a name that includes a tile ID and
+ * then creates set of debugfs files (attributes) specific to this tile.
+ */
+void xe_tile_debugfs_register(struct xe_tile *tile)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct drm_minor *minor = xe->drm.primary;
+	struct dentry *root = minor->debugfs_root;
+	char name[8];
+
+	snprintf(name, sizeof(name), "tile%u", tile->id);
+	tile->debugfs = debugfs_create_dir(name, root);
+	if (IS_ERR(tile->debugfs))
+		return;
+
+	/*
+	 * Store the xe_tile pointer as private data of the tile/ directory
+	 * node so other tile specific attributes under that directory may
+	 * refer to it by looking at its parent node private data.
+	 */
+	tile->debugfs->d_inode->i_private = tile;
+
+	drm_debugfs_create_files(vf_safe_debugfs_list,
+				 ARRAY_SIZE(vf_safe_debugfs_list),
+				 tile->debugfs, minor);
+}
diff --git a/drivers/gpu/drm/xe/xe_tile_debugfs.h b/drivers/gpu/drm/xe/xe_tile_debugfs.h
new file mode 100644
index 000000000000..0e5f724de37f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_tile_debugfs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_TILE_DEBUGFS_H_
+#define _XE_TILE_DEBUGFS_H_
+
+struct xe_tile;
+
+void xe_tile_debugfs_register(struct xe_tile *tile);
+
+#endif
-- 
2.47.1

