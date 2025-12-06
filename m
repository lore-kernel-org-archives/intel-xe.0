Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13735D3B7E5
	for <intel-xe@archiver.kernel.org>; Sat,  6 Dec 2025 23:04:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5AC10E30F;
	Sat,  6 Dec 2025 23:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bAsP5Jsd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBD610E319
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Dec 2025 23:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765062259; x=1796598259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SCXppHu454zpMhrRYskkZHzgPDwUigWBRn8Ob9FFxaI=;
 b=bAsP5JsdklYPps5lqTAdy39wEVQTgH/n4Kbf5sCvJKs+uPtFC3NrjUs9
 TBzK67bdp9FrsCxCW5blsshl/CbSRSIc7zAGF9+mk2mXT19AzCL4U9J4Q
 gaDVZM2yE993GsEhe3wREKhFMLKssgnFhAurDrwYCfLPMkPxe7MJaT1Ri
 +Hd/pSb1P9PBoxRrcFIhsM4PLxv2NYbUJ/aJPOry5hQPDIYjYkbcN5v/d
 SjzkFXpwIdY6zZw0LP6vTgoeDMEuoFfX3rGY5cjYBKvpXi8okf7nPLBh6
 hZonblUAXhT5N73IsIpVfCqywRful8bRFD2Uq0vmdw1ynrGiLGBj72+Dy A==;
X-CSE-ConnectionGUID: 0Graud4uQfG3bDwwN1DSWw==
X-CSE-MsgGUID: UeN8mFQnT3OotWRQH7/BPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="78411696"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; d="scan'208";a="78411696"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2025 15:04:19 -0800
X-CSE-ConnectionGUID: uf+mjXWgT5WvRozE82ouvw==
X-CSE-MsgGUID: VlVDF6/4RqSART6Gt6TXbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; d="scan'208";a="200045555"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2025 15:04:19 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 11/11] drm/xe/sriov: Add debugfs to set EQ and PT for
 scheduler groups
Date: Sat,  6 Dec 2025 15:04:07 -0800
Message-ID: <20251206230356.3600292-24-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
References: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
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

v2: drop files for individual groups, check input length (Michal)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 128 +++++++++++++++++++-
 1 file changed, 124 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 15f5f3a40471..014dcdc233bd 100644
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
@@ -264,6 +272,109 @@ static const struct file_operations sched_groups_fops = {
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
+	u8 g;
+
+	get(gt, vfid, values, ARRAY_SIZE(values));
+
+	for (g = 0; g < ARRAY_SIZE(values); g++) {
+		drm_printf(&p, "%s%u", first ? "" : ",", values[g]);
+
+		first = false;
+	}
+
+	drm_printf(&p, "\n");
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
+	return (ret < 0) ? ret : size;
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
@@ -313,13 +424,13 @@ static const struct file_operations sched_group_engines_fops = {
 	.llseek = default_llseek,
 };
 
-static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent)
+static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent, unsigned int vfid)
 {
 	struct dentry *groups;
 	u8 g;
 
 	xe_gt_assert(gt, gt == extract_gt(parent));
-	xe_gt_assert(gt, PFID == extract_vfid(parent));
+	xe_gt_assert(gt, vfid == extract_vfid(parent));
 
 	/*
 	 * TODO: we currently call this function before we initialize scheduler
@@ -336,6 +447,14 @@ static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent)
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
@@ -713,6 +832,7 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
 
 	if (vfid) {
 		pf_add_config_attrs(gt, dent, vfid);
+		pf_add_sched_groups(gt, dent, vfid);
 
 		debugfs_create_file("control", 0600, dent, NULL, &control_ops);
 
@@ -726,7 +846,7 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
 	} else {
 		pf_add_config_attrs(gt, dent, PFID);
 		pf_add_policy_attrs(gt, dent);
-		pf_add_sched_groups(gt, dent);
+		pf_add_sched_groups(gt, dent, PFID);
 
 		drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), dent, minor);
 	}
-- 
2.43.0

