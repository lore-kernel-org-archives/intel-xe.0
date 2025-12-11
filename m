Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE28D3B9AB
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 01:57:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5402410E6C8;
	Thu, 11 Dec 2025 01:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZvJ/fkgs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180EF10E0D0
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 01:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765418250; x=1796954250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XnVmhJOssknd4xnzlLM3sBYxkTRUQxgXOZFPKH0O+o4=;
 b=ZvJ/fkgsf0Rhnxc8VurhKhLaw1ecY0jTihgrEKAnTp23bfRx7UI/+R1j
 h1wSlYypVkeKh2Okpw7S+6ojUKtyhc/xwFuvCPkq1ptCkoISK6/LgP5CT
 22+sZpdREzD05SrptaHUIvJOr029hB1oYFfYC0bjjxsXLpjO926WNO/IB
 M6hRGJMbD+UHxWK8zcO1ctEps5jkfTsxZRHWQgqRHdDvtRDKHKNL7oMAy
 9e72dZxkyZYqpe6VLZ94A7UAxpHtDs5TmLEPlqq6GkJe+6cmCJzxfQ5mv
 GZImjiKlWnMSdbB2sXllOU6+SKhwmyt6JHbFWn/vzpL34bUh6gUSon+OI A==;
X-CSE-ConnectionGUID: HxKSMh8dSruN7NtMEauDsg==
X-CSE-MsgGUID: sN4fsXByT9OoBm2/0ZMClw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71244502"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="71244502"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:57:30 -0800
X-CSE-ConnectionGUID: 5GuqLqRmRjedwL3ewfc8Vg==
X-CSE-MsgGUID: RgOdcmRPSFOI+XtwRDySHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="196676815"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:57:30 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 12/12] drm/xe/sriov: Add debugfs to set EQ and PT for
 scheduler groups
Date: Wed, 10 Dec 2025 17:57:11 -0800
Message-ID: <20251211015700.34266-26-daniele.ceraolospurio@intel.com>
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

Debugfs files are added to allow a user to provide a comma-separated list
of values to assign to each group for each VF.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: drop files for individual groups, check input length (Michal)
v3: add an extra space when to separate the dumped values (Michal)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 128 +++++++++++++++++++-
 1 file changed, 124 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index c09a89c69fad..7bf17649affb 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -163,10 +163,18 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
  *          :   ├── tile0
  *              :   ├── gt0
  *                  :   ├── sched_groups_mode
+ *                      ├── sched_groups_exec_quantums_ms
+ *                      ├── sched_groups_preempt_timeout_us
  *                      ├── sched_groups
  *                      :   ├── group0
  *                          :
- *                          └── groupN
+ *          :               └── groupN
+ *          ├── vf1
+ *          :   ├── tile0
+ *              :   ├── gt0
+ *                  :   ├── sched_groups_exec_quantums_ms
+ *                      ├── sched_groups_preempt_timeout_us
+ *                      :
  */
 
 static const char *sched_group_mode_to_string(enum xe_sriov_sched_group_modes mode)
@@ -258,6 +266,109 @@ static const struct file_operations sched_groups_fops = {
 	.release = single_release,
 };
 
+static int sched_groups_config_show(struct seq_file *m, void *data,
+				    void (*get)(struct xe_gt *, unsigned int, u32 *, u32))
+{
+	struct drm_printer p = drm_seq_file_printer(m);
+	unsigned int vfid = extract_vfid(m->private);
+	struct xe_gt *gt = extract_gt(m->private);
+	u32 values[GUC_MAX_SCHED_GROUPS];
+	bool first = true;
+	u8 group;
+
+	get(gt, vfid, values, ARRAY_SIZE(values));
+
+	for (group = 0; group < ARRAY_SIZE(values); group++) {
+		drm_printf(&p, "%s%u", first ? "" : ", ", values[group]);
+
+		first = false;
+	}
+
+	drm_puts(&p, "\n");
+
+	return 0;
+}
+
+static ssize_t sched_groups_config_write(struct file *file, const char __user *ubuf,
+					 size_t size, loff_t *pos,
+					 int (*set)(struct xe_gt *, unsigned int, u32 *, u32))
+{
+	struct dentry *parent = file_inode(file)->i_private;
+	unsigned int vfid = extract_vfid(parent);
+	struct xe_gt *gt = extract_gt(parent);
+	u32 values[GUC_MAX_SCHED_GROUPS];
+	int *input;
+	u32 count;
+	int ret;
+	int i;
+
+	if (*pos)
+		return -ESPIPE;
+
+	if (!size)
+		return -ENODATA;
+
+	ret = parse_int_array_user(ubuf, min(size, GUC_MAX_SCHED_GROUPS * sizeof(u32)), &input);
+	if (ret)
+		return ret;
+
+	count = input[0];
+	if (count > GUC_MAX_SCHED_GROUPS) {
+		ret = -E2BIG;
+		goto out;
+	}
+
+	for (i = 0; i < count; i++) {
+		if (input[i + 1] < 0 || input[i + 1] > S32_MAX) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		values[i] = input[i + 1];
+	}
+
+	xe_pm_runtime_get(gt_to_xe(gt));
+	ret = set(gt, vfid, values, count);
+	xe_pm_runtime_put(gt_to_xe(gt));
+
+out:
+	kfree(input);
+	return ret < 0 ? ret : size;
+}
+
+#define DEFINE_SRIOV_GT_GRP_CFG_DEBUGFS_ATTRIBUTE(CONFIG)			\
+static int sched_groups_##CONFIG##_show(struct seq_file *m, void *data)		\
+{										\
+	return sched_groups_config_show(m, data,				\
+					xe_gt_sriov_pf_config_get_groups_##CONFIG); \
+}										\
+										\
+static int sched_groups_##CONFIG##_open(struct inode *inode, struct file *file)	\
+{										\
+	return single_open(file, sched_groups_##CONFIG##_show,			\
+			   inode->i_private);					\
+}										\
+										\
+static ssize_t sched_groups_##CONFIG##_write(struct file *file,			\
+					      const char __user *ubuf,		\
+					      size_t size, loff_t *pos)		\
+{										\
+	return sched_groups_config_write(file, ubuf, size, pos,			\
+					 xe_gt_sriov_pf_config_set_groups_##CONFIG); \
+}										\
+										\
+static const struct file_operations sched_groups_##CONFIG##_fops = {		\
+	.owner = THIS_MODULE,							\
+	.open = sched_groups_##CONFIG##_open,					\
+	.read = seq_read,							\
+	.llseek = seq_lseek,							\
+	.write = sched_groups_##CONFIG##_write,					\
+	.release = single_release,						\
+}
+
+DEFINE_SRIOV_GT_GRP_CFG_DEBUGFS_ATTRIBUTE(exec_quantums);
+DEFINE_SRIOV_GT_GRP_CFG_DEBUGFS_ATTRIBUTE(preempt_timeouts);
+
 static ssize_t sched_group_engines_read(struct file *file, char __user *buf,
 					size_t count, loff_t *ppos)
 {
@@ -303,13 +414,13 @@ static const struct file_operations sched_group_engines_fops = {
 	.llseek = default_llseek,
 };
 
-static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent)
+static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent, unsigned int vfid)
 {
 	struct dentry *groups;
 	u8 group;
 
 	xe_gt_assert(gt, gt == extract_gt(parent));
-	xe_gt_assert(gt, PFID == extract_vfid(parent));
+	xe_gt_assert(gt, vfid == extract_vfid(parent));
 
 	/*
 	 * TODO: we currently call this function before we initialize scheduler
@@ -326,6 +437,14 @@ static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent)
 	if (!xe_sriov_gt_pf_policy_has_sched_groups_support(gt))
 		return;
 
+	debugfs_create_file("sched_groups_exec_quantums_ms", 0644, parent, parent,
+			    &sched_groups_exec_quantums_fops);
+	debugfs_create_file("sched_groups_preempt_timeouts_us", 0644, parent, parent,
+			    &sched_groups_preempt_timeouts_fops);
+
+	if (vfid != PFID)
+		return;
+
 	debugfs_create_file("sched_groups_mode", 0644, parent, parent, &sched_groups_fops);
 
 	groups = debugfs_create_dir("sched_groups", parent);
@@ -703,6 +822,7 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
 
 	if (vfid) {
 		pf_add_config_attrs(gt, dent, vfid);
+		pf_add_sched_groups(gt, dent, vfid);
 
 		debugfs_create_file("control", 0600, dent, NULL, &control_ops);
 
@@ -716,7 +836,7 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
 	} else {
 		pf_add_config_attrs(gt, dent, PFID);
 		pf_add_policy_attrs(gt, dent);
-		pf_add_sched_groups(gt, dent);
+		pf_add_sched_groups(gt, dent, PFID);
 
 		drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), dent, minor);
 	}
-- 
2.43.0

