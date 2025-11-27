Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF60D116E4
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 01:45:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D18010E0A5;
	Thu, 27 Nov 2025 01:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cKE03aXI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7444610E0A5
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 01:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764207930; x=1795743930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6sWMQfL84Jc84XnpTLeWgJ7P6l4gVakClClRCTnB+Ac=;
 b=cKE03aXIMAV9r6z1SYObQS+oTeaW1thCmQLM2GJqeu9WuGkBiCNO5q7b
 lQdEwpSi3+mADpATHuevLGDcl51j2atVG7IGJx5DQZ4Y4p1IMqVk8bJdy
 p0Kpo7DBRAeLyWhDrNSSv/e56RGcHEfUay16SlNozIHkQLo3btr28ftS6
 vLr4fGHJSoReCHo8hsQMt3OLSPAx3KUIQZDDybTh9AO8PKP2B7LZ0sQJ+
 seD+pnqkaRvFYO4Pm5rzlOf6rARmIhRiyMNmu8wd9gws9Lq4qPV1zupGI
 faaPbdQCmo8XrYJVIw1w0Eg8kvQBKKa+yRsTEXT+zjnDk46nRvb0qIl0V A==;
X-CSE-ConnectionGUID: nfzvLEdqTqWrH0aP2qnD0A==
X-CSE-MsgGUID: 11f7sYNiRDGgGqk2si05Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70114865"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="70114865"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 17:45:28 -0800
X-CSE-ConnectionGUID: RWjr47HTRP+e+CS5t55n5w==
X-CSE-MsgGUID: bIdxResVSSCV0nGFIE9iRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="192753433"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 17:45:28 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 10/10] drm/xe/sriov: Add debugfs to set EQ and PT for
 scheduler groups
Date: Wed, 26 Nov 2025 17:45:16 -0800
Message-ID: <20251127014507.2323746-22-daniele.ceraolospurio@intel.com>
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

A top-level debugfs file is added that allows a user to provide a
comma-separated list of values to assign to each group. Per-group files
are also added to allow individual tuning of a specific group.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 173 +++++++++++++++++++-
 1 file changed, 168 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 947e2b92d58a..052510736017 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -165,24 +165,169 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
  *              :   ├── gt0
  *                  :   ├── sched_groups_mode
  *                      ├── sched_groups
- *                      :   ├── group0
- *                          :   └── engines
+ *                      :   ├── exec_quantums_ms
+ *                          ├── preempt_timeouts_us
+ *                          ├── group0
+ *                          :   ├── engines
+ *                              ├── exec_quantum_ms
+ *                              └── preempt_timeout_us
  *                          :
  *                          └── groupN
- *          :                   └── engines
+ *                              ├── engines
+ *                              ├── exec_quantum_ms
+ *          :                   └── preempt_timeout_us
  *          ├── vf1
  *          :   ├── tile0
  *              :   ├── gt0
  *                  :   ├── sched_groups
- *                      :   ├── group0
- *                          :   └── engines
+ *                      :   ├── exec_quantums_ms
+ *                          ├── preempt_timeouts_us
+ *                          ├── group0
+ *                          :   ├── engines
+ *                              ├── exec_quantum_ms
+ *                              └── preempt_timeout_us
  */
 
 struct sched_group_info {
 	struct xe_gt *gt;
+	unsigned int vfid;
+	u8 group_id;
 	u32 *masks;
 };
 
+static int sched_groups_config_show(struct seq_file *m, void *data,
+				    void (*get)(struct xe_gt *, unsigned int, u32 *, u32))
+{
+	u32 values[GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT];
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct sched_group_info *groups = m->private;
+	struct xe_gt *gt = groups[0].gt;
+	unsigned int vfid = groups[0].vfid;
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
+#define MAX_EGS_ARRAY_SIZE (GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT * sizeof(u32))
+static ssize_t sched_groups_config_write(struct file *file, const char __user *ubuf,
+					 size_t size, loff_t *pos,
+					 int (*set)(struct xe_gt *, unsigned int, u32 *, u32))
+{
+	struct sched_group_info *groups = file_inode(file)->i_private;
+	u32 values[GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT];
+	struct xe_gt *gt = groups[0].gt;
+	unsigned int vfid = groups[0].vfid;
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
+	ret = parse_int_array_user(ubuf, min(size, MAX_EGS_ARRAY_SIZE), &input);
+	if (ret)
+		return ret;
+
+	count = input[0];
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
+#define DEFINE_SRIOV_GT_GRP_CFG_DEBUGFS_ATTRIBUTE(CONFIG, TYPE, FORMAT)		\
+static int sched_groups_##CONFIG##s_show(struct seq_file *m,			\
+						  void *data)			\
+{										\
+	return sched_groups_config_show(m, data,				\
+					xe_gt_sriov_pf_config_get_groups_##CONFIG##s); \
+}										\
+										\
+static int sched_groups_##CONFIG##s_open(struct inode *inode, struct file *file)\
+{										\
+	return single_open(file, sched_groups_##CONFIG##s_show,			\
+			   inode->i_private);					\
+}										\
+										\
+static ssize_t sched_groups_##CONFIG##s_write(struct file *file,		\
+					      const char __user *ubuf,		\
+					      size_t size, loff_t *pos)		\
+{										\
+	return sched_groups_config_write(file, ubuf, size, pos,			\
+					 xe_gt_sriov_pf_config_set_groups_##CONFIG##s); \
+}										\
+										\
+static const struct file_operations sched_groups_##CONFIG##s_fops = {		\
+	.owner = THIS_MODULE,							\
+	.open = sched_groups_##CONFIG##s_open,					\
+	.read = seq_read,							\
+	.llseek = seq_lseek,							\
+	.write = sched_groups_##CONFIG##s_write,				\
+	.release = single_release,						\
+};										\
+										\
+static int group_##CONFIG##_set(void *data, u64 val)				\
+{										\
+	struct sched_group_info *gi = data;					\
+	struct xe_device *xe = gt_to_xe(gi->gt);				\
+	int err;								\
+										\
+	if (val > (TYPE)~0ull)							\
+		return -EOVERFLOW;						\
+										\
+	xe_pm_runtime_get(xe);							\
+	err = xe_sriov_pf_wait_ready(xe) ?:					\
+	      xe_gt_sriov_pf_config_set_group_##CONFIG(gi->gt, gi->vfid,	\
+						       gi->group_id, val);	\
+	if (!err)								\
+		xe_sriov_pf_provision_set_custom_mode(xe);			\
+	xe_pm_runtime_put(xe);							\
+										\
+	return err;								\
+}										\
+										\
+static int group_##CONFIG##_get(void *data, u64 *val)				\
+{										\
+	struct sched_group_info *gi = data;					\
+										\
+	*val = xe_gt_sriov_pf_config_get_group_##CONFIG(gi->gt, gi->vfid,	\
+							gi->group_id);		\
+	return 0;								\
+}										\
+										\
+DEFINE_DEBUGFS_ATTRIBUTE(group_##CONFIG##_fops, group_##CONFIG##_get,		\
+			 group_##CONFIG##_set, FORMAT)
+
+DEFINE_SRIOV_GT_GRP_CFG_DEBUGFS_ATTRIBUTE(exec_quantum, u32, "%llu\n");
+DEFINE_SRIOV_GT_GRP_CFG_DEBUGFS_ATTRIBUTE(preempt_timeout, u32, "%llu\n");
+
 static int sched_group_engines_info(struct seq_file *m, void *data)
 {
 	struct drm_printer p = drm_seq_file_printer(m);
@@ -261,6 +406,18 @@ static void sched_group_info_register(struct xe_gt *gt, unsigned int vfid)
 		goto out_err;
 	parent->d_inode->i_private = infos;
 
+	/*
+	 * assign group 0 gt and VF id values early as they're used by the
+	 * exec_quantums debugfs to set quantums for all groups
+	 */
+	infos[0].gt = gt;
+	infos[0].vfid = vfid;
+
+	debugfs_create_file("exec_quantums_ms", 0644, parent, infos,
+			    &sched_groups_exec_quantums_fops);
+	debugfs_create_file("preempt_timeouts_us", 0644, parent, infos,
+			    &sched_groups_preempt_timeouts_fops);
+
 	for (g = 0; g < num_groups; g++) {
 		struct sched_group_info *info = &infos[g];
 		u32 base = g * GUC_MAX_ENGINE_CLASSES;
@@ -273,10 +430,16 @@ static void sched_group_info_register(struct xe_gt *gt, unsigned int vfid)
 			goto out_err;
 
 		info->gt = gt;
+		info->vfid = vfid;
+		info->group_id = g;
 		info->masks = &policy->guc.sched_groups.modes[mode].masks[base];
 
 		dent->d_inode->i_private = info;
 		debugfs_create_file("engines", 0644, dent, info, &sched_group_engines_fops);
+		debugfs_create_file("exec_quantum_ms", 0644, dent, info,
+				    &group_exec_quantum_fops);
+		debugfs_create_file("preempt_timeout_us", 0644, dent, info,
+				    &group_preempt_timeout_fops);
 	}
 
 	return;
-- 
2.43.0

