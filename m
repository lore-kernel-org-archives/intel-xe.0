Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821C9C48BEE
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 11:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B675610E80C;
	Wed, 14 Feb 2024 11:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQjtuKFE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8398510E7E6
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Feb 2024 11:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707911892; x=1739447892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zBUfyzGZ0ksYU0Q/YNb/Jaf/fREst/G7w6zEmv1PrWE=;
 b=GQjtuKFELUTqpivj31iGIvMFbWEXHMXWtIf2lA8DhqwvawoLo9uC5RRW
 3s0VNN5OEwkM8wd5Yok0Zfmz++VReJY8JWcStHpW/91jNL94l/TQz+g3B
 rMNFvpvlJhDZoNPNP/cOttjvZsYFL8AKbi/Buhz3PyUEcDTjUUeHzFPIf
 9OxugrjHyWBeJi1vpU4gFcocgzPrxvYpImdyv+9HtfEj3w6l40kycC//a
 bEb2QjQFOLGyPUVOYTrUdj4YlsE3lBOxPbpO/Tg1sWLd+qDMW+lCLHLXl
 bifgLVxdyV38D6WETHFZMCogzVLYWjPWWhz075NdtDspdaADzN8+sEWMG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2090356"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="2090356"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 03:58:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3529187"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.138.241])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 03:58:12 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/3] drm/xe: Refactor GT debugfs
Date: Wed, 14 Feb 2024 12:57:56 +0100
Message-Id: <20240214115756.1525-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240214115756.1525-1-michal.wajdeczko@intel.com>
References: <20240214115756.1525-1-michal.wajdeczko@intel.com>
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

We are abusing struct drm_info_list.data by storing there pointer
to the xe_gt, while it shouldn't be used for any device specific
data.  Use recently introduced xe_gt_debugfs_simple_show() that
hides all details how to obtain the xe_gt pointer.  This will also
remove the need for making copies of the struct drm_info_list
to get GT specific definitions.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 159 ++++++++++-------------------
 1 file changed, 52 insertions(+), 107 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 69a7e77d8305..de492702aab1 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -75,16 +75,9 @@ int xe_gt_debugfs_simple_show(struct seq_file *m, void *data)
 	return print(gt, &p);
 }
 
-static struct xe_gt *node_to_gt(struct drm_info_node *node)
+static int hw_engines(struct xe_gt *gt, struct drm_printer *p)
 {
-	return node->info_ent->data;
-}
-
-static int hw_engines(struct seq_file *m, void *data)
-{
-	struct xe_gt *gt = node_to_gt(m->private);
 	struct xe_device *xe = gt_to_xe(gt);
-	struct drm_printer p = drm_seq_file_printer(m);
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 	int err;
@@ -97,7 +90,7 @@ static int hw_engines(struct seq_file *m, void *data)
 	}
 
 	for_each_hw_engine(hwe, gt, id)
-		xe_hw_engine_print(hwe, &p);
+		xe_hw_engine_print(hwe, p);
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	xe_device_mem_access_put(xe);
@@ -107,156 +100,126 @@ static int hw_engines(struct seq_file *m, void *data)
 	return 0;
 }
 
-static int force_reset(struct seq_file *m, void *data)
+static int force_reset(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_gt *gt = node_to_gt(m->private);
-
 	xe_gt_reset_async(gt);
 
 	return 0;
 }
 
-static int sa_info(struct seq_file *m, void *data)
+static int sa_info(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_tile *tile = gt_to_tile(node_to_gt(m->private));
-	struct drm_printer p = drm_seq_file_printer(m);
+	struct xe_tile *tile = gt_to_tile(gt);
 
-	drm_suballoc_dump_debug_info(&tile->mem.kernel_bb_pool->base, &p,
+	drm_suballoc_dump_debug_info(&tile->mem.kernel_bb_pool->base, p,
 				     tile->mem.kernel_bb_pool->gpu_addr);
 
 	return 0;
 }
 
-static int topology(struct seq_file *m, void *data)
+static int topology(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_gt *gt = node_to_gt(m->private);
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	xe_gt_topology_dump(gt, &p);
+	xe_gt_topology_dump(gt, p);
 
 	return 0;
 }
 
-static int steering(struct seq_file *m, void *data)
+static int steering(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_gt *gt = node_to_gt(m->private);
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	xe_gt_mcr_steering_dump(gt, &p);
+	xe_gt_mcr_steering_dump(gt, p);
 
 	return 0;
 }
 
-static int ggtt(struct seq_file *m, void *data)
+static int ggtt(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_gt *gt = node_to_gt(m->private);
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	return xe_ggtt_dump(gt_to_tile(gt)->mem.ggtt, &p);
+	return xe_ggtt_dump(gt_to_tile(gt)->mem.ggtt, p);
 }
 
-static int register_save_restore(struct seq_file *m, void *data)
+static int register_save_restore(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_gt *gt = node_to_gt(m->private);
-	struct drm_printer p = drm_seq_file_printer(m);
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 
-	xe_reg_sr_dump(&gt->reg_sr, &p);
-	drm_printf(&p, "\n");
+	xe_reg_sr_dump(&gt->reg_sr, p);
+	drm_printf(p, "\n");
 
-	drm_printf(&p, "Engine\n");
+	drm_printf(p, "Engine\n");
 	for_each_hw_engine(hwe, gt, id)
-		xe_reg_sr_dump(&hwe->reg_sr, &p);
-	drm_printf(&p, "\n");
+		xe_reg_sr_dump(&hwe->reg_sr, p);
+	drm_printf(p, "\n");
 
-	drm_printf(&p, "LRC\n");
+	drm_printf(p, "LRC\n");
 	for_each_hw_engine(hwe, gt, id)
-		xe_reg_sr_dump(&hwe->reg_lrc, &p);
-	drm_printf(&p, "\n");
+		xe_reg_sr_dump(&hwe->reg_lrc, p);
+	drm_printf(p, "\n");
 
-	drm_printf(&p, "Whitelist\n");
+	drm_printf(p, "Whitelist\n");
 	for_each_hw_engine(hwe, gt, id)
-		xe_reg_whitelist_dump(&hwe->reg_whitelist, &p);
+		xe_reg_whitelist_dump(&hwe->reg_whitelist, p);
 
 	return 0;
 }
 
-static int workarounds(struct seq_file *m, void *data)
+static int workarounds(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_gt *gt = node_to_gt(m->private);
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	xe_wa_dump(gt, &p);
+	xe_wa_dump(gt, p);
 
 	return 0;
 }
 
-static int pat(struct seq_file *m, void *data)
+static int pat(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_gt *gt = node_to_gt(m->private);
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	xe_pat_dump(gt, &p);
+	xe_pat_dump(gt, p);
 
 	return 0;
 }
 
-static int rcs_default_lrc(struct seq_file *m, void *data)
+static int rcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_RENDER);
+	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_RENDER);
 	return 0;
 }
 
-static int ccs_default_lrc(struct seq_file *m, void *data)
+static int ccs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_COMPUTE);
+	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_COMPUTE);
 	return 0;
 }
 
-static int bcs_default_lrc(struct seq_file *m, void *data)
+static int bcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_COPY);
+	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_COPY);
 	return 0;
 }
 
-static int vcs_default_lrc(struct seq_file *m, void *data)
+static int vcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_VIDEO_DECODE);
+	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_VIDEO_DECODE);
 	return 0;
 }
 
-static int vecs_default_lrc(struct seq_file *m, void *data)
+static int vecs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_VIDEO_ENHANCE);
+	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
 	return 0;
 }
 
 static const struct drm_info_list debugfs_list[] = {
-	{"hw_engines", hw_engines, 0},
-	{"force_reset", force_reset, 0},
-	{"sa_info", sa_info, 0},
-	{"topology", topology, 0},
-	{"steering", steering, 0},
-	{"ggtt", ggtt, 0},
-	{"register-save-restore", register_save_restore, 0},
-	{"workarounds", workarounds, 0},
-	{"pat", pat, 0},
-	{"default_lrc_rcs", rcs_default_lrc},
-	{"default_lrc_ccs", ccs_default_lrc},
-	{"default_lrc_bcs", bcs_default_lrc},
-	{"default_lrc_vcs", vcs_default_lrc},
-	{"default_lrc_vecs", vecs_default_lrc},
+	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
+	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
+	{"sa_info", .show = xe_gt_debugfs_simple_show, .data = sa_info},
+	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
+	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
+	{"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
+	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
+	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
+	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
+	{"default_lrc_rcs", .show = xe_gt_debugfs_simple_show, .data = rcs_default_lrc},
+	{"default_lrc_ccs", .show = xe_gt_debugfs_simple_show, .data = ccs_default_lrc},
+	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
+	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
+	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
 };
 
 void xe_gt_debugfs_register(struct xe_gt *gt)
@@ -264,9 +227,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	struct drm_minor *minor = gt_to_xe(gt)->drm.primary;
 	struct dentry *root;
-	struct drm_info_list *local;
 	char name[8];
-	int i;
 
 	xe_gt_assert(gt, minor->debugfs_root);
 
@@ -280,23 +241,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 	/* other attributes may use parent->d_inode->i_private */
 	root->d_inode->i_private = gt;
 
-	/*
-	 * Allocate local copy as we need to pass in the GT to the debugfs
-	 * entry and drm_debugfs_create_files just references the drm_info_list
-	 * passed in (e.g. can't define this on the stack).
-	 */
-#define DEBUGFS_SIZE	(ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list))
-	local = drmm_kmalloc(&xe->drm, DEBUGFS_SIZE, GFP_KERNEL);
-	if (!local)
-		return;
-
-	memcpy(local, debugfs_list, DEBUGFS_SIZE);
-#undef DEBUGFS_SIZE
-
-	for (i = 0; i < ARRAY_SIZE(debugfs_list); ++i)
-		local[i].data = gt;
-
-	drm_debugfs_create_files(local,
+	drm_debugfs_create_files(debugfs_list,
 				 ARRAY_SIZE(debugfs_list),
 				 root, minor);
 
-- 
2.43.0

