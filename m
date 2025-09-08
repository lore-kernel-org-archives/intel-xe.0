Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC40ECAC581
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 12:30:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B72410E50D;
	Mon,  8 Sep 2025 12:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T1N5pAkg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9538310E50D
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 12:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757334649; x=1788870649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e6cGjfKUmi05ex2GSjx3obQCY35n+h1ZdVmp/PnGGXs=;
 b=T1N5pAkgagh5+HizgAw23OIFnBd93Vj9GBVJKBUSl6cVshzy+vDPoDlH
 xz3DLhVsT/9N1NYeRZyWxevgkRF+u5iQ/L1QKJitzJu2W2ysJsdPL2gL2
 l/6zxOj8gZrYxU+MI4O/GmkOSZYF/oi52hcpD297qB9Q2GxU77YAPFfdx
 cEQzHuYqTmWhZLIoe8g7VRS9hBVWnQMf4/RzNUirmBZvvWqfBTXirSeo8
 WH9J11a3qPL2z5uxA/GUdpKc7pwNFeYyYfvUj/MS4XKJ5tH62zVwmn3WS
 waUbBae8lnNGIQSNihmdaK4oKgcBRptDIBonR7FHHnqiCR04NkQ8xTzeZ Q==;
X-CSE-ConnectionGUID: 2TvtTvWvRpqww5wlEFm7TQ==
X-CSE-MsgGUID: g/zUTAYcRw2sdFGb2cmCMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="59526311"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="59526311"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:30:48 -0700
X-CSE-ConnectionGUID: 6Wd7mtrMTky1929358m3Aw==
X-CSE-MsgGUID: EbMrioSyQ5uGUQ2aVngTIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="172656456"
Received: from abaranow-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.83.253])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:30:47 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v2 7/7] drm/xe/vf: Move VF CCS debugfs attribute
Date: Mon,  8 Sep 2025 14:30:24 +0200
Message-ID: <20250908123025.747-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908123025.747-1-michal.wajdeczko@intel.com>
References: <20250908123025.747-1-michal.wajdeczko@intel.com>
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

The VF CCS handling is per-device so its debugfs file should not
be exposed on per-GT basis. Move it up to the device level.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      |  3 +++
 drivers/gpu/drm/xe/xe_gt_debugfs.c   | 39 ----------------------------
 drivers/gpu/drm/xe/xe_sriov_vf.c     | 28 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf.h     |  2 ++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 32 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  2 ++
 6 files changed, 67 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 4b71570529a6..544d7d8460d9 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -24,6 +24,7 @@
 #include "xe_pxp_debugfs.h"
 #include "xe_sriov.h"
 #include "xe_sriov_pf.h"
+#include "xe_sriov_vf.h"
 #include "xe_step.h"
 #include "xe_tile_debugfs.h"
 #include "xe_wa.h"
@@ -395,4 +396,6 @@ void xe_debugfs_register(struct xe_device *xe)
 
 	if (IS_SRIOV_PF(xe))
 		xe_sriov_pf_debugfs_register(xe, root);
+	else if (IS_SRIOV_VF(xe))
+		xe_sriov_vf_debugfs_register(xe, root);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index a9d960de0e5e..f253e2df4907 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -124,33 +124,6 @@ static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
 	return ret;
 }
 
-static int sa_info_vf_ccs(struct xe_gt *gt, struct drm_printer *p)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_sa_manager *bb_pool;
-	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
-
-	if (!IS_VF_CCS_READY(gt_to_xe(gt)))
-		return 0;
-
-	xe_pm_runtime_get(gt_to_xe(gt));
-
-	for_each_ccs_rw_ctx(ctx_id) {
-		bb_pool = xe->sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
-		if (!bb_pool)
-			break;
-
-		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");
-		drm_printf(p, "-------------------------\n");
-		drm_suballoc_dump_debug_info(&bb_pool->base, p, xe_sa_manager_gpu_addr(bb_pool));
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
@@ -318,13 +291,6 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
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
@@ -465,11 +431,6 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 		drm_debugfs_create_files(pf_only_debugfs_list,
 					 ARRAY_SIZE(pf_only_debugfs_list),
 					 root, minor);
-	else
-		drm_debugfs_create_files(vf_only_debugfs_list,
-					 ARRAY_SIZE(vf_only_debugfs_list),
-					 root, minor);
-
 
 	xe_uc_debugfs_register(&gt->uc, root);
 
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index cb062328551a..cdd9f8e78b2a 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -3,6 +3,7 @@
  * Copyright © 2023-2024 Intel Corporation
  */
 
+#include <drm/drm_debugfs.h>
 #include <drm/drm_managed.h>
 
 #include "xe_assert.h"
@@ -445,3 +446,30 @@ int xe_sriov_vf_init_late(struct xe_device *xe)
 
 	return err;
 }
+
+static int sa_info_vf_ccs(struct seq_file *m, void *data)
+{
+	struct drm_info_node *node = m->private;
+	struct xe_device *xe = to_xe_device(node->minor->dev);
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	xe_sriov_vf_ccs_print(xe, &p);
+	return 0;
+}
+
+static const struct drm_info_list debugfs_list[] = {
+	{ .name = "sa_info_vf_ccs", .show = sa_info_vf_ccs },
+};
+
+/**
+ * xe_sriov_vf_debugfs_register - Register VF debugfs attributes.
+ * @xe: the &xe_device
+ * @root: the root &dentry
+ *
+ * Prepare debugfs attributes exposed by the VF.
+ */
+void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root)
+{
+	drm_debugfs_create_files(debugfs_list, ARRAY_SIZE(debugfs_list),
+				 root, xe->drm.primary);
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
index 3bf3364799ad..9e752105ec2a 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
@@ -8,11 +8,13 @@
 
 #include <linux/types.h>
 
+struct dentry;
 struct xe_device;
 
 void xe_sriov_vf_init_early(struct xe_device *xe);
 int xe_sriov_vf_init_late(struct xe_device *xe);
 void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
 bool xe_sriov_vf_migration_supported(struct xe_device *xe);
+void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index c5c60f05073d..8dec616c37c9 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -13,6 +13,7 @@
 #include "xe_guc_submit.h"
 #include "xe_lrc.h"
 #include "xe_migrate.h"
+#include "xe_pm.h"
 #include "xe_sa.h"
 #include "xe_sriov_printk.h"
 #include "xe_sriov_vf.h"
@@ -376,3 +377,34 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
 	}
 	return 0;
 }
+
+/**
+ * xe_sriov_vf_ccs_print - Print VF CCS details.
+ * @xe: the &xe_device
+ * @p: the &drm_printer
+ *
+ * This function is for VF use only.
+ */
+void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p)
+{
+	struct xe_sa_manager *bb_pool;
+	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
+
+	if (!IS_VF_CCS_READY(xe))
+		return;
+
+	xe_pm_runtime_get(xe);
+
+	for_each_ccs_rw_ctx(ctx_id) {
+		bb_pool = xe->sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
+		if (!bb_pool)
+			break;
+
+		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");
+		drm_printf(p, "-------------------------\n");
+		drm_suballoc_dump_debug_info(&bb_pool->base, p, xe_sa_manager_gpu_addr(bb_pool));
+		drm_puts(p, "\n");
+	}
+
+	xe_pm_runtime_put(xe);
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
index f0e1189b417a..0745c0ff0228 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
@@ -10,6 +10,7 @@
 #include "xe_sriov.h"
 #include "xe_sriov_vf_ccs_types.h"
 
+struct drm_printer;
 struct xe_device;
 struct xe_bo;
 
@@ -17,6 +18,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe);
 int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
 int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
 int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
+void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p);
 
 static inline bool xe_sriov_vf_ccs_ready(struct xe_device *xe)
 {
-- 
2.47.1

