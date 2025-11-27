Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF10DD116E6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 01:45:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBD810E748;
	Thu, 27 Nov 2025 01:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BAPc0qUQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B36810E720
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 01:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764207931; x=1795743931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SpsmML2/mQngBR9pMnQ9XvT6QCnD5OYzjUAXdeB+4Lg=;
 b=BAPc0qUQ1XvxB6tcGcxEZCN6SF3qagx1YzSNiqmiXMsapzPBXLwLWb3P
 3CpMiIj3dT3aUrArKVmzjkZZaFIyFNzEBRRzppozk3JCH6W4HkHD3jxya
 BEFLAlZn0abRNV83I5hEvwS7zURykvFXnD3HleBc0TGFdxNf/BpZVXNqs
 UzHYFGAK09KrDxttvX5naVVgRp89zMXx9qROyZ0uHoNj8ejT+4HCuz3ZI
 ZEo+yPhu/6pVkMdaBMUavv4aL+qLyV81yrqAn/TzzB1eOWh0cWs13lOtp
 1q2Y88iwCR+4ICPJXXLSThE146LAmW51Ve0791jmc2cmW9WVzZQ8ZsgW0 Q==;
X-CSE-ConnectionGUID: eB1Pt0CCTx2p1rkpPsS5tw==
X-CSE-MsgGUID: GSXTG1XITZCvDlQeuBvoAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70114857"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="70114857"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 17:45:26 -0800
X-CSE-ConnectionGUID: g9MndIlPSNW9sjbtHxQ8QA==
X-CSE-MsgGUID: 4yc7ynW/Rkub9AprUAjmuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="192753395"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 17:45:24 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 06/10] drm/xe/sriov: Add debugfs with scheduler groups
 information
Date: Wed, 26 Nov 2025 17:45:12 -0800
Message-ID: <20251127014507.2323746-18-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
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

When schedulers groups are enabled, we dynamically create new debugfs
folders under the GT folder for the PF and each VF. The aim is to have
all the info for each VF under the sched_groups folder, with individual
folders per-group under it. Right now the only info is the engine list,
but follow up patches will add execution quantum and preemption timeout
as well (which are configurable per-group-per-VF).

Note that the engine lists are not configurable per-VF and therefore not
strictly needed in the VF folders. However, it is still useful to have
them there because an admin might want to check the engine list while
configuring the EQ/PT values for a specific VF.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 140 +++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h   |   4 +
 2 files changed, 143 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 2953ef21a5ad..947e2b92d58a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -5,6 +5,7 @@
 
 #include <linux/debugfs.h>
 
+#include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 #include <drm/drm_debugfs.h>
 
@@ -21,6 +22,7 @@
 #include "xe_gt_sriov_pf_monitor.h"
 #include "xe_gt_sriov_pf_policy.h"
 #include "xe_gt_sriov_pf_service.h"
+#include "xe_guc.h"
 #include "xe_pm.h"
 #include "xe_sriov_pf.h"
 #include "xe_sriov_pf_provision.h"
@@ -162,8 +164,127 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
  *          :   ├── tile0
  *              :   ├── gt0
  *                  :   ├── sched_groups_mode
+ *                      ├── sched_groups
+ *                      :   ├── group0
+ *                          :   └── engines
+ *                          :
+ *                          └── groupN
+ *          :                   └── engines
+ *          ├── vf1
+ *          :   ├── tile0
+ *              :   ├── gt0
+ *                  :   ├── sched_groups
+ *                      :   ├── group0
+ *                          :   └── engines
  */
 
+struct sched_group_info {
+	struct xe_gt *gt;
+	u32 *masks;
+};
+
+static int sched_group_engines_info(struct seq_file *m, void *data)
+{
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct sched_group_info *gi = m->private;
+	struct xe_gt *gt = gi->gt;
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	bool first = true;
+
+	for_each_hw_engine(hwe, gt, id) {
+		u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
+		u32 mask = gi->masks[guc_class];
+
+		if (mask & BIT(hwe->logical_instance)) {
+			drm_printf(&p, "%s%s", first ? "" : " ", hwe->name);
+
+			first = false;
+		}
+	}
+
+	drm_printf(&p, "\n");
+
+	return 0;
+}
+
+static int sched_group_engines_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, sched_group_engines_info, inode->i_private);
+}
+
+static const struct file_operations sched_group_engines_fops = {
+	.owner = THIS_MODULE,
+	.open = sched_group_engines_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+static void __sched_group_info_cleanup(struct xe_gt *gt, struct dentry *dent)
+{
+	if (dent->d_inode->i_private)
+		drmm_kfree(&gt_to_xe(gt)->drm, dent->d_inode->i_private);
+
+	debugfs_remove_recursive(dent);
+}
+
+#define GROUP_INFO_ROOT "sched_groups"
+static void sched_group_info_register(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_gt_sriov_pf_policy *policy = &gt->sriov.pf.policy;
+	u32 mode = policy->guc.sched_groups.current_mode;
+	u8 num_groups = policy->guc.sched_groups.modes[mode].num_masks / GUC_MAX_ENGINE_CLASSES;
+	struct sched_group_info *infos;
+	struct dentry *parent;
+	struct dentry *old;
+	u8 g;
+
+	if (!gt->sriov.pf.debugfs_roots)
+		return;
+
+	/* remove existing debugfs entries for old groups */
+	old = debugfs_lookup(GROUP_INFO_ROOT, gt->sriov.pf.debugfs_roots[vfid]);
+	if (old)
+		__sched_group_info_cleanup(gt, old);
+
+	/* re-create debugfs for new groups (if any)*/
+	if (!num_groups)
+		return;
+
+	parent = debugfs_create_dir(GROUP_INFO_ROOT, gt->sriov.pf.debugfs_roots[vfid]);
+	if (IS_ERR(parent))
+		return;
+
+	infos = drmm_kzalloc(&gt_to_xe(gt)->drm, sizeof(*infos) * num_groups, GFP_KERNEL);
+	if (!infos)
+		goto out_err;
+	parent->d_inode->i_private = infos;
+
+	for (g = 0; g < num_groups; g++) {
+		struct sched_group_info *info = &infos[g];
+		u32 base = g * GUC_MAX_ENGINE_CLASSES;
+		struct dentry *dent;
+		char name[10];
+
+		snprintf(name, sizeof(name), "group%u", g);
+		dent = debugfs_create_dir(name, parent);
+		if (IS_ERR(dent))
+			goto out_err;
+
+		info->gt = gt;
+		info->masks = &policy->guc.sched_groups.modes[mode].masks[base];
+
+		dent->d_inode->i_private = info;
+		debugfs_create_file("engines", 0644, dent, info, &sched_group_engines_fops);
+	}
+
+	return;
+
+out_err:
+	__sched_group_info_cleanup(gt, parent);
+}
+
 static const char *sched_group_mode_to_string(enum xe_sriov_sched_group_modes mode)
 {
 	switch (mode) {
@@ -220,7 +341,7 @@ static ssize_t sched_groups_write(struct file *file, const char __user *ubuf,
 	struct xe_gt *gt = extract_gt(file_inode(file)->i_private);
 	char name[32];
 	int ret;
-	int m;
+	int m, i;
 
 	if (*pos)
 		return -ESPIPE;
@@ -250,6 +371,10 @@ static ssize_t sched_groups_write(struct file *file, const char __user *ubuf,
 	ret = xe_gt_sriov_pf_policy_set_sched_groups_mode(gt, m);
 	xe_pm_runtime_put(gt_to_xe(gt));
 
+	if (!ret)
+		for (i = 0; i <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)); i++)
+			sched_group_info_register(gt, i);
+
 	return (ret < 0) ? ret : size;
 }
 
@@ -693,6 +818,19 @@ void xe_gt_sriov_pf_debugfs_populate(struct xe_gt *gt, struct dentry *parent, un
 		return;
 	dent->d_inode->i_private = gt;
 
+	/*
+	 * we allocate an array to store the GT-level dentries for PF and all
+	 * VFs when creating the PF folder. Failing to create this allocation
+	 * is not fatal.
+	 */
+	if (vfid == 0)
+		gt->sriov.pf.debugfs_roots =
+			drmm_kcalloc(&gt_to_xe(gt)->drm,
+				     1 + xe_sriov_pf_get_totalvfs(gt_to_xe(gt)),
+				     sizeof(struct dentry *), GFP_KERNEL);
+	if (gt->sriov.pf.debugfs_roots)
+		gt->sriov.pf.debugfs_roots[vfid] = dent;
+
 	xe_gt_assert(gt, extract_gt(dent) == gt);
 	xe_gt_assert(gt, extract_vfid(dent) == vfid);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
index 667b8310478d..747ec5dae652 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
@@ -15,6 +15,8 @@
 #include "xe_gt_sriov_pf_policy_types.h"
 #include "xe_gt_sriov_pf_service_types.h"
 
+struct dentry;
+
 /**
  * struct xe_gt_sriov_metadata - GT level per-VF metadata.
  */
@@ -52,6 +54,7 @@ struct xe_gt_sriov_pf_workers {
  * @migration: migration data.
  * @spare: PF-only provisioning configuration.
  * @vfs: metadata for all VFs.
+ * @debugfs_root: GT debugfs root for all VFs.
  */
 struct xe_gt_sriov_pf {
 	struct xe_gt_sriov_pf_workers workers;
@@ -60,6 +63,7 @@ struct xe_gt_sriov_pf {
 	struct xe_gt_sriov_pf_policy policy;
 	struct xe_gt_sriov_spare_config spare;
 	struct xe_gt_sriov_metadata *vfs;
+	struct dentry **debugfs_roots;
 };
 
 #endif
-- 
2.43.0

