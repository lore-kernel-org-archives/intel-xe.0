Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF2FCAC5BB
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 22:05:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2C210E9C1;
	Thu, 25 Sep 2025 22:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MjO7/x5k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5989D10E9BF
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 22:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758837903; x=1790373903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nN1+CPkI6mW99dWKpKpD3QRAqxyJYO+HmPQfxy9kQiM=;
 b=MjO7/x5kGFusFLvsq9I0mUG1bswB+8wfb31QFf5yrIXjYEgrgUotZSWP
 HczQGObveOsnyNOvCLMWb5MS/Zwo0lX5FZxUZ+vkfD/XfXYnZQ55qA76J
 cut0DeOPfEjDdW+kp20b1pUl/HMyq6SotWIigp9lgYTSORxVXDhF8bxBY
 kpZc4Wjn8K6Z7R9rqbZAry9HjiONWAYfDKRCYwPjHG7GeHOXwbXumz3uQ
 x3NmDC88ev6/RyCN+E/cPyK2vaJmF95d+2r8+94T6kFlmlT5iXZkzbl9y
 DK26ED93ykSrt55ofJZ+qEIOhb/Hxl9249sx0VZnHatplaYpoAMszoC9O A==;
X-CSE-ConnectionGUID: jn63jP7IRBCgl/bdZ88jtQ==
X-CSE-MsgGUID: aEQXEARnTMKvL0R5exzaPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61222141"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="61222141"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 15:05:03 -0700
X-CSE-ConnectionGUID: nxZDDJ+cQ4W9uHvhBu3X5w==
X-CSE-MsgGUID: dHgaxiQTROeiICtmZssM8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="201129478"
Received: from krychlik-mobl2.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.173])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 15:04:53 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 6/6] drm/xe/pf: Make GGTT/LMEM debugfs files per-tile
Date: Fri, 26 Sep 2025 00:04:23 +0200
Message-ID: <20250925220425.196860-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250925220425.196860-1-michal.wajdeczko@intel.com>
References: <20250925220425.196860-1-michal.wajdeczko@intel.com>
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

Due to initial design of the Xe debugfs, the GGTT and LMEM files
were defined on the primary GT, instead of being per-tile.

While PF provisioning code is now still maintaining GGTT and LMEM
also on the per primary-GT level, this will be refactored soon,
but we can fix debugfs layout now, as part of the new SR-IOV tree.

For backward compatibility we will provide some symlinks that can
be removed once our tools will be fully converted.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  92 ++++--------
 drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c | 136 ++++++++++++++++++
 2 files changed, 163 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 21065394e1b5..dd66d47bd987 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -100,46 +100,6 @@ static const struct drm_info_list pf_info[] = {
 	},
 };
 
-/*
- *      /sys/kernel/debug/dri/BDF/
- *      ├── sriov
- *      :   ├── pf
- *          :   ├── tile0
- *              :   ├── gt0
- *                  :   ├── ggtt_available
- *                      ├── ggtt_provisioned
- */
-
-static const struct drm_info_list pf_ggtt_info[] = {
-	{
-		"ggtt_available",
-		.show = xe_gt_debugfs_simple_show,
-		.data = xe_gt_sriov_pf_config_print_available_ggtt,
-	},
-	{
-		"ggtt_provisioned",
-		.show = xe_gt_debugfs_simple_show,
-		.data = xe_gt_sriov_pf_config_print_ggtt,
-	},
-};
-
-/*
- *      /sys/kernel/debug/dri/BDF/
- *      ├── sriov
- *      :   ├── pf
- *          :   ├── tile0
- *              :   ├── gt0
- *                  :   ├── lmem_provisioned
- */
-
-static const struct drm_info_list pf_lmem_info[] = {
-	{
-		"lmem_provisioned",
-		.show = xe_gt_debugfs_simple_show,
-		.data = xe_gt_sriov_pf_config_print_lmem,
-	},
-};
-
 /*
  *      /sys/kernel/debug/dri/BDF/
  *      ├── sriov
@@ -199,9 +159,7 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
  *      :   ├── pf
  *          │   ├── tile0
  *          │   :   ├── gt0
- *          │       :   ├── ggtt_spare
- *          │           ├── lmem_spare
- *          │           ├── doorbells_spare
+ *          │       :   ├── doorbells_spare
  *          │           ├── contexts_spare
  *          │           ├── exec_quantum_ms
  *          │           ├── preempt_timeout_us
@@ -209,9 +167,7 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
  *          ├── vf1
  *          :   ├── tile0
  *              :   ├── gt0
- *                  :   ├── ggtt_quota
- *                      ├── lmem_quota
- *                      ├── doorbells_quota
+ *                  :   ├── doorbells_quota
  *                      ├── contexts_quota
  *                      ├── exec_quantum_ms
  *                      ├── preempt_timeout_us
@@ -249,8 +205,6 @@ static int CONFIG##_get(void *data, u64 *val)					\
 										\
 DEFINE_DEBUGFS_ATTRIBUTE(CONFIG##_fops, CONFIG##_get, CONFIG##_set, FORMAT)
 
-DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(ggtt, u64, "%llu\n");
-DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(lmem, u64, "%llu\n");
 DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(ctxs, u32, "%llu\n");
 DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(dbs, u32, "%llu\n");
 DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(exec_quantum, u32, "%llu\n");
@@ -331,13 +285,6 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
 	xe_gt_assert(gt, gt == extract_gt(parent));
 	xe_gt_assert(gt, vfid == extract_vfid(parent));
 
-	if (xe_gt_is_main_type(gt)) {
-		debugfs_create_file_unsafe(vfid ? "ggtt_quota" : "ggtt_spare",
-					   0644, parent, parent, &ggtt_fops);
-		if (xe_device_has_lmtt(gt_to_xe(gt)))
-			debugfs_create_file_unsafe(vfid ? "lmem_quota" : "lmem_spare",
-						   0644, parent, parent, &lmem_fops);
-	}
 	debugfs_create_file_unsafe(vfid ? "doorbells_quota" : "doorbells_spare",
 				   0644, parent, parent, &dbs_fops);
 	debugfs_create_file_unsafe(vfid ? "contexts_quota" : "contexts_spare",
@@ -558,6 +505,28 @@ static const struct file_operations config_blob_ops = {
 	.llseek		= default_llseek,
 };
 
+static void pf_add_deprecated_attrs(struct xe_gt *gt, struct dentry *dent, unsigned int vfid)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (!xe_gt_is_main_type(gt))
+		return;
+
+	if (vfid) {
+		debugfs_create_symlink("ggtt_quota", dent, "../ggtt_quota");
+		if (xe_device_has_lmtt(xe))
+			debugfs_create_symlink("lmem_quota", dent, "../lmem_quota");
+	} else {
+		debugfs_create_symlink("ggtt_spare", dent, "../ggtt_spare");
+		debugfs_create_symlink("ggtt_available", dent, "../ggtt_available");
+		debugfs_create_symlink("ggtt_provisioned", dent, "../ggtt_provisioned");
+		if (xe_device_has_lmtt(xe)) {
+			debugfs_create_symlink("lmem_spare", dent, "../lmem_spare");
+			debugfs_create_symlink("lmem_provisioned", dent, "../lmem_provisioned");
+		}
+	}
+}
+
 static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int vfid)
 {
 	struct xe_device *xe = gt_to_xe(gt);
@@ -583,17 +552,10 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
 		pf_add_policy_attrs(gt, dent);
 
 		drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), dent, minor);
-
-		if (xe_gt_is_main_type(gt)) {
-			drm_debugfs_create_files(pf_ggtt_info,
-						 ARRAY_SIZE(pf_ggtt_info),
-						 dent, minor);
-			if (xe_device_has_lmtt(xe))
-				drm_debugfs_create_files(pf_lmem_info,
-							 ARRAY_SIZE(pf_lmem_info),
-							 dent, minor);
-		}
 	}
+
+	/* for backward compatibility only */
+	pf_add_deprecated_attrs(gt, dent, vfid);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
index 8517563f2812..98142669d105 100644
--- a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
@@ -8,9 +8,13 @@
 
 #include "xe_device.h"
 #include "xe_device_types.h"
+#include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_debugfs.h"
+#include "xe_pm.h"
+#include "xe_tile_debugfs.h"
 #include "xe_tile_sriov_pf_debugfs.h"
 #include "xe_sriov.h"
+#include "xe_sriov_pf.h"
 
 /*
  *      /sys/kernel/debug/dri/BDF/
@@ -53,11 +57,143 @@ static unsigned int extract_vfid(struct dentry *d)
 	return pp == extract_xe(d) ? PFID : (uintptr_t)pp;
 }
 
+/*
+ *      /sys/kernel/debug/dri/BDF/
+ *      ├── sriov
+ *      :   ├── pf
+ *          :   ├── tile0
+ *              :   ├── ggtt_available
+ *                  ├── ggtt_provisioned
+ */
+
+static int pf_config_print_available_ggtt(struct xe_tile *tile, struct drm_printer *p)
+{
+	return xe_gt_sriov_pf_config_print_available_ggtt(tile->primary_gt, p);
+}
+
+static int pf_config_print_ggtt(struct xe_tile *tile, struct drm_printer *p)
+{
+	return xe_gt_sriov_pf_config_print_ggtt(tile->primary_gt, p);
+}
+
+static const struct drm_info_list pf_ggtt_info[] = {
+	{
+		"ggtt_available",
+		.show = xe_tile_debugfs_simple_show,
+		.data = pf_config_print_available_ggtt,
+	},
+	{
+		"ggtt_provisioned",
+		.show = xe_tile_debugfs_simple_show,
+		.data = pf_config_print_ggtt,
+	},
+};
+
+/*
+ *      /sys/kernel/debug/dri/BDF/
+ *      ├── sriov
+ *      :   ├── pf
+ *          :   ├── tile0
+ *              :   ├── lmem_provisioned
+ */
+
+static int pf_config_print_lmem(struct xe_tile *tile, struct drm_printer *p)
+{
+	return xe_gt_sriov_pf_config_print_lmem(tile->primary_gt, p);
+}
+
+static const struct drm_info_list pf_lmem_info[] = {
+	{
+		"lmem_provisioned",
+		.show = xe_tile_debugfs_simple_show,
+		.data = pf_config_print_lmem,
+	},
+};
+
+/*
+ *      /sys/kernel/debug/dri/BDF/
+ *      ├── sriov
+ *      ├   ├── pf
+ *      │   │   ├── tile0
+ *      │   │   │   ├── ggtt_spare
+ *      │   │   │   ├── lmem_spare
+ *      │   │   ├── tile1
+ *      │   │   :   :
+ *      ├   ├── vf1
+ *      │   :   ├── tile0
+ *      │       │   ├── ggtt_quota
+ *      │       │   ├── lmem_quota
+ *      │       ├── tile1
+ *      │       :   :
+ */
+
+#define DEFINE_SRIOV_TILE_CONFIG_DEBUGFS_ATTRIBUTE(CONFIG, TYPE, FORMAT)	\
+										\
+static int CONFIG##_set(void *data, u64 val)					\
+{										\
+	struct xe_tile *tile = extract_tile(data);				\
+	unsigned int vfid = extract_vfid(data);					\
+	struct xe_gt *gt = tile->primary_gt;					\
+	struct xe_device *xe = tile->xe;					\
+	int err;								\
+										\
+	if (val > (TYPE)~0ull)							\
+		return -EOVERFLOW;						\
+										\
+	xe_pm_runtime_get(xe);							\
+	err = xe_sriov_pf_wait_ready(xe) ?:					\
+	      xe_gt_sriov_pf_config_set_##CONFIG(gt, vfid, val);		\
+	xe_pm_runtime_put(xe);							\
+										\
+	return err;								\
+}										\
+										\
+static int CONFIG##_get(void *data, u64 *val)					\
+{										\
+	struct xe_tile *tile = extract_tile(data);				\
+	unsigned int vfid = extract_vfid(data);					\
+	struct xe_gt *gt = tile->primary_gt;					\
+										\
+	*val = xe_gt_sriov_pf_config_get_##CONFIG(gt, vfid);			\
+	return 0;								\
+}										\
+										\
+DEFINE_DEBUGFS_ATTRIBUTE(CONFIG##_fops, CONFIG##_get, CONFIG##_set, FORMAT)
+
+DEFINE_SRIOV_TILE_CONFIG_DEBUGFS_ATTRIBUTE(ggtt, u64, "%llu\n");
+DEFINE_SRIOV_TILE_CONFIG_DEBUGFS_ATTRIBUTE(lmem, u64, "%llu\n");
+
+static void pf_add_config_attrs(struct xe_tile *tile, struct dentry *dent, unsigned int vfid)
+{
+	xe_tile_assert(tile, tile == extract_tile(dent));
+	xe_tile_assert(tile, vfid == extract_vfid(dent));
+
+	debugfs_create_file_unsafe(vfid ? "ggtt_quota" : "ggtt_spare",
+				   0644, dent, dent, &ggtt_fops);
+	if (xe_device_has_lmtt(tile->xe))
+		debugfs_create_file_unsafe(vfid ? "lmem_quota" : "lmem_spare",
+					   0644, dent, dent, &lmem_fops);
+}
+
 static void pf_populate_tile(struct xe_tile *tile, struct dentry *dent, unsigned int vfid)
 {
+	struct xe_device *xe = tile->xe;
+	struct drm_minor *minor = xe->drm.primary;
 	struct xe_gt *gt;
 	unsigned int id;
 
+	pf_add_config_attrs(tile, dent, vfid);
+
+	if (!vfid) {
+		drm_debugfs_create_files(pf_ggtt_info,
+					 ARRAY_SIZE(pf_ggtt_info),
+					 dent, minor);
+		if (xe_device_has_lmtt(xe))
+			drm_debugfs_create_files(pf_lmem_info,
+						 ARRAY_SIZE(pf_lmem_info),
+						 dent, minor);
+	}
+
 	for_each_gt_on_tile(gt, tile, id)
 		xe_gt_sriov_pf_debugfs_populate(gt, dent, vfid);
 }
-- 
2.47.1

