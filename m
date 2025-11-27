Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F2DD116E7
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 01:45:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA26510E735;
	Thu, 27 Nov 2025 01:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rfn/YZ+G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9076B10E720
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 01:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764207930; x=1795743930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jecyKG70fkqV6Xqphg8f6P9Ja8leER1odwOaxmJhsY4=;
 b=Rfn/YZ+GxscbbgmCezSy0BKugE4iRA9o5S+Cf3PN1SLx5otA+azFBNmM
 fF+YyUC/MXbTZi4/7KS4+UbMzFnv35FGHOay+iJhKtQAcc/YinuvF2snP
 E5kxt5TpiRu0EGG8ehib90bJd9Tcj3cKcWKQzxcr1hnoRu5c4IKejhfsG
 t+ZInT77jkMu2rxKQhnoPQhnvKs6iXwaf1HfO5Tby7QLJnvZR+k8DwzBP
 tkPoXDFZ7tgKNR1z1oyYQWSP9Yx1b9iMMbJXLjLpL9P1eWTsDh4AIRcz+
 Carg0Jp+zNMcz4ywUvHiGEH0+IobJFRT62UUT0rmkBCLMxbFVnkjtHgat g==;
X-CSE-ConnectionGUID: LWuu2K+bRz+GSqC0AchrLQ==
X-CSE-MsgGUID: bH8b26fjSx+199gBkT3ZLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70114858"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="70114858"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 17:45:26 -0800
X-CSE-ConnectionGUID: jQpIdnL+SmmclYXClKSXPA==
X-CSE-MsgGUID: 2v+tQyNtREyZvSgyIeQV/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="192753393"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 17:45:23 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 05/10] drm/xe/sriov: Add debugfs to enable scheduler groups
Date: Wed, 26 Nov 2025 17:45:11 -0800
Message-ID: <20251127014507.2323746-17-daniele.ceraolospurio@intel.com>
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

Reading the debugfs file lists the available configurations by name.
Writing the name of a configuration to the file will enable it.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 116 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c  |  10 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h  |   2 +
 3 files changed, 123 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 0fd863609848..2953ef21a5ad 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -155,6 +155,121 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
 	debugfs_create_file_unsafe("sample_period_ms", 0644, parent, parent, &sample_period_fops);
 }
 
+/*
+ *      /sys/kernel/debug/dri/BDF/
+ *      ├── sriov
+ *      :   ├── pf
+ *          :   ├── tile0
+ *              :   ├── gt0
+ *                  :   ├── sched_groups_mode
+ */
+
+static const char *sched_group_mode_to_string(enum xe_sriov_sched_group_modes mode)
+{
+	switch (mode) {
+	case XE_SRIOV_SCHED_GROUPS_NONE:
+		return "disabled";
+	case XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES:
+		return "media_slices";
+	default:
+		return "unknown";
+	}
+}
+
+static int sched_groups_info(struct seq_file *m, void *data)
+{
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct xe_gt *gt = extract_gt(m->private);
+	u32 current_mode = gt->sriov.pf.policy.guc.sched_groups.current_mode;
+	int mode = 0;
+
+	if (!xe_sriov_gt_pf_policy_has_valid_sched_group_modes(gt)) {
+		drm_printf(&p, "no groups available\n");
+		return 0;
+	}
+
+	for (mode = 0; mode < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; mode++) {
+		if (!xe_sriov_gt_pf_policy_has_sched_group_mode(gt, mode))
+			continue;
+
+		if (mode)
+			drm_printf(&p, " ");
+
+		if (mode == current_mode)
+			drm_printf(&p, "[");
+
+		drm_printf(&p, "%s", sched_group_mode_to_string(mode));
+
+		if (mode == current_mode)
+			drm_printf(&p, "]");
+	}
+
+	drm_printf(&p, "\n");
+
+	return 0;
+}
+
+static int sched_groups_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, sched_groups_info, inode->i_private);
+}
+
+static ssize_t sched_groups_write(struct file *file, const char __user *ubuf,
+				  size_t size, loff_t *pos)
+{
+	struct xe_gt *gt = extract_gt(file_inode(file)->i_private);
+	char name[32];
+	int ret;
+	int m;
+
+	if (*pos)
+		return -ESPIPE;
+
+	if (!size)
+		return -ENODATA;
+
+	if (!xe_sriov_gt_pf_policy_has_valid_sched_group_modes(gt))
+		return -ENODEV;
+
+	if (size > sizeof(name) - 1)
+		return -EINVAL;
+
+	ret = simple_write_to_buffer(name, sizeof(name) - 1, pos, ubuf, size);
+	if (ret < 0)
+		return ret;
+	name[ret] = '\0';
+
+	for (m = 0; m < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; m++)
+		if (sysfs_streq(name, sched_group_mode_to_string(m)))
+			break;
+
+	if (m == XE_SRIOV_SCHED_GROUPS_MODES_COUNT)
+		return -EINVAL;
+
+	xe_pm_runtime_get(gt_to_xe(gt));
+	ret = xe_gt_sriov_pf_policy_set_sched_groups_mode(gt, m);
+	xe_pm_runtime_put(gt_to_xe(gt));
+
+	return (ret < 0) ? ret : size;
+}
+
+static const struct file_operations sched_groups_fops = {
+	.owner = THIS_MODULE,
+	.open = sched_groups_open,
+	.read = seq_read,
+	.write = sched_groups_write,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent)
+{
+	xe_gt_assert(gt, gt == extract_gt(parent));
+	xe_gt_assert(gt, PFID == extract_vfid(parent));
+
+	debugfs_create_file("sched_groups_mode", 0644, parent, parent, &sched_groups_fops);
+}
+
 /*
  *      /sys/kernel/debug/dri/BDF/
  *      ├── sriov
@@ -528,6 +643,7 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
 	} else {
 		pf_add_config_attrs(gt, dent, PFID);
 		pf_add_policy_attrs(gt, dent);
+		pf_add_sched_groups(gt, dent);
 
 		drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), dent, minor);
 	}
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index c7f1ea8eb9c5..3c5fc1b5f281 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -507,12 +507,12 @@ pf_policy_has_sched_group_modes(struct xe_gt *gt, unsigned long mask)
 	return gt->sriov.pf.policy.guc.sched_groups.supported_modes & mask;
 }
 
-static bool pf_policy_has_valid_sched_group_modes(struct xe_gt *gt)
+bool xe_sriov_gt_pf_policy_has_valid_sched_group_modes(struct xe_gt *gt)
 {
 	return pf_policy_has_sched_group_modes(gt, ~BIT(XE_SRIOV_SCHED_GROUPS_NONE));
 }
 
-static bool pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode)
+bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode)
 {
 	return pf_policy_has_sched_group_modes(gt, BIT(mode));
 }
@@ -553,7 +553,7 @@ static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
-	if (!pf_policy_has_sched_group_mode(gt, mode))
+	if (!xe_sriov_gt_pf_policy_has_sched_group_mode(gt, mode))
 		return -EINVAL;
 
 	/* already in the desired mode */
@@ -588,7 +588,7 @@ static int pf_reprovision_sched_groups(struct xe_gt *gt)
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
 	/* We only have something to provision if we have possible groups */
-	if (!pf_policy_has_valid_sched_group_modes(gt))
+	if (!xe_sriov_gt_pf_policy_has_valid_sched_group_modes(gt))
 		return 0;
 
 	return __pf_provision_sched_groups(gt, gt->sriov.pf.policy.guc.sched_groups.current_mode);
@@ -615,7 +615,7 @@ int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value)
 {
 	int err;
 
-	if (!(pf_policy_has_valid_sched_group_modes(gt)))
+	if (!(xe_sriov_gt_pf_policy_has_valid_sched_group_modes(gt)))
 		return -ENODEV;
 
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
index 89aa3af6cc7d..13550cff7c00 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
@@ -17,6 +17,8 @@ int xe_gt_sriov_pf_policy_set_reset_engine(struct xe_gt *gt, bool enable);
 bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
 int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
 u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
+bool xe_sriov_gt_pf_policy_has_valid_sched_group_modes(struct xe_gt *gt);
+bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode);
 int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);
 bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt);
 
-- 
2.43.0

