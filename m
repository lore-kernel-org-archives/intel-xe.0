Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E176D6406D
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 01:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FAD10E9C4;
	Wed, 17 Dec 2025 01:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MRBAbM0E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689A010E9BA
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 01:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765934805; x=1797470805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ack8lnET32luB0m2bm7vtC6cGNjkqQy64nJ72wEzbfo=;
 b=MRBAbM0EfQ5X7SJQZRYiekVJyin4Hn6Qi+0OT/sbQoPCjIG2jAPohcQh
 1GPt9lQohUbcBJrkZJvtgSgAOMPhrxRQQsoLDx6ne2Fye/yCM1My6IkYS
 qEFkjNJeTkQwGZ58OgYPNJea4oIr0CocQLYdJbIHI4/TDL0C3Kdn1vv1k
 71aEiJ8pbIG8Dc5urYnnR9LgcPDgkKpsQwX+T3VJNu35BLHrrc2Xc0Kot
 Vp51z7Bq3KcmIzKURNcy0jKUYXJEYJ7YOdlJghhca6+lUM0DvvLXm6OqK
 prMXIXcFuvQlazkYU0Rzy+qhyx68FnbFV61V2b44uyKSiGkfq62375Uk8 w==;
X-CSE-ConnectionGUID: 1SVq0EDlRamEn2ee9u+xXQ==
X-CSE-MsgGUID: fTFDomxVTOWuSmKnKEvjUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67903853"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="67903853"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 17:26:44 -0800
X-CSE-ConnectionGUID: 3/QagzfFQUivyKywnfKuQg==
X-CSE-MsgGUID: skWwGpn2R22D+Ai9jKrfwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="202360652"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 17:26:44 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 13/13] drm/xe/sriov: Add debugfs to set EQ and PT for
 scheduler groups
Date: Tue, 16 Dec 2025 17:26:33 -0800
Message-ID: <20251217012620.758252-28-daniele.ceraolospurio@intel.com>
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

Debugfs files are added to allow a user to provide a comma-separated list
of values to assign to each group for each VF.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: drop files for individual groups, check input length (Michal)
v3: add an extra space when to separate the dumped values (Michal)
v4: remove the extra space (Michal)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 118 +++++++++++++++++++-
 1 file changed, 117 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index e3e6d2d9beff..8ddffe728673 100644
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
@@ -261,6 +269,108 @@ static const struct file_operations sched_groups_fops = {
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
+		drm_printf(&p, "%s%u", first ? "" : ",", values[group]);
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
+	guard(xe_pm_runtime)(gt_to_xe(gt));
+	ret = set(gt, vfid, values, count);
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
@@ -322,6 +432,11 @@ static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent, unsigne
 	if (!xe_sriov_gt_pf_policy_has_sched_groups_support(gt))
 		return;
 
+	debugfs_create_file("sched_groups_exec_quantums_ms", 0644, parent, parent,
+			    &sched_groups_exec_quantums_fops);
+	debugfs_create_file("sched_groups_preempt_timeouts_us", 0644, parent, parent,
+			    &sched_groups_preempt_timeouts_fops);
+
 	if (vfid != PFID)
 		return;
 
@@ -702,6 +817,7 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
 
 	if (vfid) {
 		pf_add_config_attrs(gt, dent, vfid);
+		pf_add_sched_groups(gt, dent, vfid);
 
 		debugfs_create_file("control", 0600, dent, NULL, &control_ops);
 
-- 
2.43.0

