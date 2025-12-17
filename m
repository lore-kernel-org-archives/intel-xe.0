Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C918D6406E
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 01:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1AC10E9C5;
	Wed, 17 Dec 2025 01:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ogh+T/4o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE19710E9BE
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 01:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765934801; x=1797470801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6vp4wviiJk1JHbMboO34SjsRAYzGICvqYjfxo8qLOIw=;
 b=Ogh+T/4o6GkccjUMAXnofEO9r7h7mlWjlRpMFekHWFRLy+RN0nzV0ckC
 u5ujwAEE65PMNeg+ylS1aDR1JjFZtIt9OvwQOZTlXTE2G1KtzUsJyQTgJ
 fOWbci1jZiS8hHSL4+H9Y2jDSAJIeBOgr+T2GJ5t6cBcKygpgwPvcYtlV
 op7AJzo3gp1C0un08pvMwkZFoDDGDyylhtn/xvcyjMYhGG8Rj4DhGSwS6
 x0tS7mavM5IjIiYFKKr2vPJW6CCop3pItl/KZYU3GHDgGHV7r+fpD0lzh
 3/f1eLeWDp343vQYmcl9fe97rbkPodi/75JvNI3WtTJAAkgfj94BQwqKF A==;
X-CSE-ConnectionGUID: NePNboiuTWarnqBLrdU5QA==
X-CSE-MsgGUID: u1XjfNaGQQWiNm+TnNLVWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67903844"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="67903844"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 17:26:41 -0800
X-CSE-ConnectionGUID: xywbNTEOQJuiwXecGUF95g==
X-CSE-MsgGUID: nIK0E9slQEy9OZY1foIaDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="202360632"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 17:26:40 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 08/13] drm/xe/sriov: Add debugfs to enable scheduler groups
Date: Tue, 16 Dec 2025 17:26:28 -0800
Message-ID: <20251217012620.758252-23-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217012620.758252-15-daniele.ceraolospurio@intel.com>
References: <20251217012620.758252-15-daniele.ceraolospurio@intel.com>
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
Note that while this debugfs is PF-only, follow up patches will add some
debugfs files that are applicable to VF as well, so the function accepts
a vfid parameter to be ready for that.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: don't print anything if the feature is unsupported (Michal), add
    TODO for reworking init order to know if there are valid groups
    when we register debugfs, check for basic feature support.
v3: use drm_puts, list modes even if we only support the disabled
    one (Michal)
v4: pass vfid now instead of reworking in future patch, make print
    logic more compact, use the enum type instead of u32 (Michal)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 126 ++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index ece9eed5d7c5..f80664dcbb8f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -156,6 +156,131 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
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
+	case XE_SRIOV_SCHED_GROUPS_MODES_COUNT:
+		/* dummy mode to make the compiler happy */
+		break;
+	}
+
+	return "unknown";
+}
+
+static int sched_groups_info(struct seq_file *m, void *data)
+{
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct xe_gt *gt = extract_gt(m->private);
+	enum xe_sriov_sched_group_modes current_mode =
+		gt->sriov.pf.policy.guc.sched_groups.current_mode;
+	enum xe_sriov_sched_group_modes mode;
+
+	for (mode = XE_SRIOV_SCHED_GROUPS_DISABLED;
+	     mode < XE_SRIOV_SCHED_GROUPS_MODES_COUNT;
+	     mode++) {
+		if (!xe_sriov_gt_pf_policy_has_sched_group_mode(gt, mode))
+			continue;
+
+		drm_printf(&p, "%s%s%s%s",
+			   mode == XE_SRIOV_SCHED_GROUPS_DISABLED ? "" : " ",
+			   mode == current_mode ? "[" : "",
+			   sched_group_mode_to_string(mode),
+			   mode == current_mode ? "]" : "");
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
+	enum xe_sriov_sched_group_modes mode;
+	char name[32];
+	int ret;
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
+	for (mode = XE_SRIOV_SCHED_GROUPS_DISABLED;
+	     mode < XE_SRIOV_SCHED_GROUPS_MODES_COUNT;
+	     mode++)
+		if (sysfs_streq(name, sched_group_mode_to_string(mode)))
+			break;
+
+	if (mode == XE_SRIOV_SCHED_GROUPS_MODES_COUNT)
+		return -EINVAL;
+
+	guard(xe_pm_runtime)(gt_to_xe(gt));
+	ret = xe_gt_sriov_pf_policy_set_sched_groups_mode(gt, mode);
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
+static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent, unsigned int vfid)
+{
+	xe_gt_assert(gt, gt == extract_gt(parent));
+	xe_gt_assert(gt, vfid == extract_vfid(parent));
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
+	if (vfid != PFID)
+		return;
+
+	debugfs_create_file("sched_groups_mode", 0644, parent, parent, &sched_groups_fops);
+}
+
 /*
  *      /sys/kernel/debug/dri/BDF/
  *      ├── sriov
@@ -531,6 +656,7 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
 	} else {
 		pf_add_config_attrs(gt, dent, PFID);
 		pf_add_policy_attrs(gt, dent);
+		pf_add_sched_groups(gt, dent, PFID);
 
 		drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), dent, minor);
 	}
-- 
2.43.0

