Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806BAD3B9AB
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 01:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4414710E08A;
	Thu, 11 Dec 2025 01:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CN4sLrV0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645EE10E6D4
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 01:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765418246; x=1796954246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PuJtEVust7bkUf/vTzGm5GTjABrs0gP8s/IUDYtHuXc=;
 b=CN4sLrV0UljjWey+VGckwcrXa1j74zD7BA8+VomWi+Ubqi/a4wfO6T3x
 sbLorDpWke/1YIzUvmA96Z18Qvbxv9qppNth/8XzypK08Dv1sz4bmbPjD
 t3HuPAwMaxxM4Afpg4qz4XceR0muMSaDgT0z7gUCpG623TjE3fLaBrt6S
 lRBbN4CwuK1fq63gGdSR/WAaqvww4O41IbYWQghgdEUKhI+WPngEycK/w
 otWjhJL8g5glO8Xw9R+I33XGynMHxo6lr2WgU6OWiyRi8hs5O/sA9qLIa
 wHmIQAVRUmaGzbQ1TgvPNr7VGNV+F3mgOA5Nv8m4HILQc1RcKVfeUtpuC A==;
X-CSE-ConnectionGUID: bGktGJeFTb2FONFZpzHZnA==
X-CSE-MsgGUID: 4wF9vLVkRVWUEg3D4V17Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71244490"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="71244490"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:57:25 -0800
X-CSE-ConnectionGUID: 953hxIDQT6u846PfH/Ai1A==
X-CSE-MsgGUID: 9KS5nmsMQRqcH7dmdFhOgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="196676783"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:57:25 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 07/12] drm/xe/sriov: Add debugfs to enable scheduler groups
Date: Wed, 10 Dec 2025 17:57:06 -0800
Message-ID: <20251211015700.34266-21-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
References: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
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
v2: don't print anything if the feature is unsupported (Michal), add
    TODO for reworking init order to know if there are valid groups
    when we register debugfs, check for basic feature support.
v3: use drm_puts, list modes even if we only support the disabled
    one (Michal)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 120 ++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 7833a7118039..8ac5e0e01e36 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -156,6 +156,125 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
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
+	case XE_SRIOV_SCHED_GROUPS_DISABLED:
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
+	for (mode = 0; mode < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; mode++) {
+		if (!xe_sriov_gt_pf_policy_has_sched_group_mode(gt, mode))
+			continue;
+
+		if (mode)
+			drm_puts(&p, " ");
+
+		if (mode == current_mode)
+			drm_puts(&p, "[");
+
+		drm_printf(&p, "%s", sched_group_mode_to_string(mode));
+
+		if (mode == current_mode)
+			drm_puts(&p, "]");
+	}
+
+	drm_puts(&p, "\n");
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
+	guard(xe_pm_runtime)(gt_to_xe(gt));
+	ret = xe_gt_sriov_pf_policy_set_sched_groups_mode(gt, m);
+
+	return ret < 0 ? ret : size;
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
+	/*
+	 * TODO: we currently call this function before we initialize scheduler
+	 * groups, so at this point in time we don't know if there are any
+	 * valid groups on the GT and we can't selectively register the debugfs
+	 * only if there are any. Therefore, we always register the debugfs
+	 * files if we're on a platform that has support for groups.
+	 * We should rework the flow so that debugfs is registered after the
+	 * policy init, so that we check if there are valid groups before
+	 * adding the debugfs files.
+	 */
+	if (!xe_sriov_gt_pf_policy_has_sched_groups_support(gt))
+		return;
+
+	debugfs_create_file("sched_groups_mode", 0644, parent, parent, &sched_groups_fops);
+}
+
 /*
  *      /sys/kernel/debug/dri/BDF/
  *      ├── sriov
@@ -531,6 +650,7 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
 	} else {
 		pf_add_config_attrs(gt, dent, PFID);
 		pf_add_policy_attrs(gt, dent);
+		pf_add_sched_groups(gt, dent);
 
 		drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), dent, minor);
 	}
-- 
2.43.0

