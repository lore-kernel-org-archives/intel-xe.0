Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7067CD1284
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 16:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DFF1124DC;
	Thu, 28 Mar 2024 16:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cbewgaSc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B3E1124D7
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 16:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711643305; x=1743179305;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=W+xhh2yYBf4071YIT9wfEXl9tflZ5yWiDjaim5H3IfY=;
 b=cbewgaSctUFisxGTm9KWjJdo5HXCAE++pCGdF1kZICQ4pWZwSDx4JgkO
 VPiNtBd1AwX23szCJcmOim3sOsQodk4L9V5ATKooHdLE/tZUO0XEMDzn7
 1oKfVeyuzMQbH+gh9TL+6EDverfrbrcnmgQ+TxuXGFA10m2ISlglm3mQy
 4xYtvq8SJ+YS7y3ukku3LIbWw7VgaGnx4pFk8S7bV3wUHBEXJsEKduiIa
 glm56XmTwPny7ZIqheA31emlXoOLp2WH76AKx3i2B0RtRSyl2vBeh+PMD
 BF2HS5EDl/a0x577jec17JsBsQuK5VM3UYOqtGCcLhCKYMsJ9Sbxa0bjG A==;
X-CSE-ConnectionGUID: VJCy56ySS1maa+buX0hBOQ==
X-CSE-MsgGUID: Bw6iKJ5XSBq7MJDTa7ASUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6742963"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6742963"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 09:28:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16579264"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.157.82])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 09:28:25 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 3/3] drm/xe: Refactor GT debugfs
Date: Thu, 28 Mar 2024 17:28:08 +0100
Message-Id: <20240328162808.451-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240328162808.451-1-michal.wajdeczko@intel.com>
References: <20240328162808.451-1-michal.wajdeczko@intel.com>
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

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Link: https://lore.kernel.org/r/20240214115756.1525-4-michal.wajdeczko@intel.com
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: rebased
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 162 +++++++++--------------------
 1 file changed, 51 insertions(+), 111 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 97c3c2437b9a..ee4285d42a18 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -76,16 +76,9 @@ int xe_gt_debugfs_simple_show(struct seq_file *m, void *data)
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
@@ -98,7 +91,7 @@ static int hw_engines(struct seq_file *m, void *data)
 	}
 
 	for_each_hw_engine(hwe, gt, id)
-		xe_hw_engine_print(hwe, &p);
+		xe_hw_engine_print(hwe, p);
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	xe_pm_runtime_put(xe);
@@ -108,10 +101,8 @@ static int hw_engines(struct seq_file *m, void *data)
 	return 0;
 }
 
-static int force_reset(struct seq_file *m, void *data)
+static int force_reset(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_gt *gt = node_to_gt(m->private);
-
 	xe_pm_runtime_get(gt_to_xe(gt));
 	xe_gt_reset_async(gt);
 	xe_pm_runtime_put(gt_to_xe(gt));
@@ -119,187 +110,154 @@ static int force_reset(struct seq_file *m, void *data)
 	return 0;
 }
 
-static int sa_info(struct seq_file *m, void *data)
+static int sa_info(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_gt *gt = node_to_gt(m->private);
 	struct xe_tile *tile = gt_to_tile(gt);
-	struct drm_printer p = drm_seq_file_printer(m);
 
 	xe_pm_runtime_get(gt_to_xe(gt));
-	drm_suballoc_dump_debug_info(&tile->mem.kernel_bb_pool->base, &p,
+	drm_suballoc_dump_debug_info(&tile->mem.kernel_bb_pool->base, p,
 				     tile->mem.kernel_bb_pool->gpu_addr);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
 }
 
-static int topology(struct seq_file *m, void *data)
+static int topology(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_gt *gt = node_to_gt(m->private);
-	struct drm_printer p = drm_seq_file_printer(m);
-
 	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_gt_topology_dump(gt, &p);
+	xe_gt_topology_dump(gt, p);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
 }
 
-static int steering(struct seq_file *m, void *data)
+static int steering(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_gt *gt = node_to_gt(m->private);
-	struct drm_printer p = drm_seq_file_printer(m);
-
 	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_gt_mcr_steering_dump(gt, &p);
+	xe_gt_mcr_steering_dump(gt, p);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
 }
 
-static int ggtt(struct seq_file *m, void *data)
+static int ggtt(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_gt *gt = node_to_gt(m->private);
-	struct drm_printer p = drm_seq_file_printer(m);
 	int ret;
 
 	xe_pm_runtime_get(gt_to_xe(gt));
-	ret = xe_ggtt_dump(gt_to_tile(gt)->mem.ggtt, &p);
+	ret = xe_ggtt_dump(gt_to_tile(gt)->mem.ggtt, p);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return ret;
 }
 
-static int register_save_restore(struct seq_file *m, void *data)
+static int register_save_restore(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_gt *gt = node_to_gt(m->private);
-	struct drm_printer p = drm_seq_file_printer(m);
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 
 	xe_pm_runtime_get(gt_to_xe(gt));
 
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
 
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
 }
 
-static int workarounds(struct seq_file *m, void *data)
+static int workarounds(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_gt *gt = node_to_gt(m->private);
-	struct drm_printer p = drm_seq_file_printer(m);
-
 	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_wa_dump(gt, &p);
+	xe_wa_dump(gt, p);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
 }
 
-static int pat(struct seq_file *m, void *data)
+static int pat(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_gt *gt = node_to_gt(m->private);
-	struct drm_printer p = drm_seq_file_printer(m);
-
 	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_pat_dump(gt, &p);
+	xe_pat_dump(gt, p);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
 }
 
-static int rcs_default_lrc(struct seq_file *m, void *data)
+static int rcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_gt *gt = node_to_gt(m->private);
-	struct drm_printer p = drm_seq_file_printer(m);
-
 	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_RENDER);
+	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_RENDER);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
 }
 
-static int ccs_default_lrc(struct seq_file *m, void *data)
+static int ccs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_gt *gt = node_to_gt(m->private);
-	struct drm_printer p = drm_seq_file_printer(m);
-
 	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_COMPUTE);
+	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_COMPUTE);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
 }
 
-static int bcs_default_lrc(struct seq_file *m, void *data)
+static int bcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_gt *gt = node_to_gt(m->private);
-	struct drm_printer p = drm_seq_file_printer(m);
-
 	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_COPY);
+	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_COPY);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
 }
 
-static int vcs_default_lrc(struct seq_file *m, void *data)
+static int vcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_gt *gt = node_to_gt(m->private);
-	struct drm_printer p = drm_seq_file_printer(m);
-
 	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_VIDEO_DECODE);
+	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_VIDEO_DECODE);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
 	return 0;
 }
 
-static int vecs_default_lrc(struct seq_file *m, void *data)
+static int vecs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
 {
-	struct xe_gt *gt = node_to_gt(m->private);
-	struct drm_printer p = drm_seq_file_printer(m);
-
 	xe_pm_runtime_get(gt_to_xe(gt));
-	xe_lrc_dump_default(&p, node_to_gt(m->private), XE_ENGINE_CLASS_VIDEO_ENHANCE);
+	xe_lrc_dump_default(p, gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
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
@@ -307,9 +265,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 	struct xe_device *xe = gt_to_xe(gt);
 	struct drm_minor *minor = gt_to_xe(gt)->drm.primary;
 	struct dentry *root;
-	struct drm_info_list *local;
 	char name[8];
-	int i;
 
 	xe_gt_assert(gt, minor->debugfs_root);
 
@@ -327,23 +283,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 	 */
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

