Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6BED3E783
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 01:57:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E79610E6C2;
	Thu, 11 Dec 2025 01:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hKmpzcK9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E75310E08A
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 01:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765418247; x=1796954247;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D3E75HSxT08tuzndF7+s4I58xoDW8ZqdUBQB1Wv5Mzg=;
 b=hKmpzcK99LtEm0GM500PqBmVZ1wx67fXEq9o4CEyUeWPO8dSdlrc0Bz8
 L+zgbytRgEP26ME/geGb/RyH3m74lj9U52xOsZC+t19+x3Au5A35wMAiW
 xKoTJiaYKiHaFmxv9pX44EfesZV/irZeOkIDKvFOwqhyEqLkB1BE8Lrzq
 i7bKKIi5/lUquxC+1F5G33jbOtWDb5TcRDqEml7W/HuCV56Y/RokQm0Qt
 mTBIxidB6F9LJ9UuOycO4SU0t8oTyLZ5JPpy28aA2mAyfSnWQq48ypKDM
 yR7pv72aMsoF6H7Oi/EtMafmxp3ROz45UlyKhse+uJP6TqgUBqYbNd1ZH Q==;
X-CSE-ConnectionGUID: 5AVJswaxTA2/OVL/IyArww==
X-CSE-MsgGUID: WRMlwIKtQZGHrkk1c0LaNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71244493"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="71244493"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:57:26 -0800
X-CSE-ConnectionGUID: 4SMppdFCR8OevKaKRiavYg==
X-CSE-MsgGUID: 6lCUwI5dTyyWqDK23JwULQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="196676790"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:57:26 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 08/12] drm/xe/sriov: Add debugfs with scheduler groups
 information
Date: Wed, 10 Dec 2025 17:57:07 -0800
Message-ID: <20251211015700.34266-22-daniele.ceraolospurio@intel.com>
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

Under a new subfolder, an entry is created for each group to list the
engines assigned to them. We create enough entries for each possible
group, with the disabled groups just returning an empty list.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: drop subfolders, always register debugfs for all groups (Michal)
v3: store the group id as uintptr_t (Michal)
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 66 +++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 8ac5e0e01e36..c09a89c69fad 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -163,6 +163,10 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
  *          :   ├── tile0
  *              :   ├── gt0
  *                  :   ├── sched_groups_mode
+ *                      ├── sched_groups
+ *                      :   ├── group0
+ *                          :
+ *                          └── groupN
  */
 
 static const char *sched_group_mode_to_string(enum xe_sriov_sched_group_modes mode)
@@ -254,8 +258,56 @@ static const struct file_operations sched_groups_fops = {
 	.release = single_release,
 };
 
+static ssize_t sched_group_engines_read(struct file *file, char __user *buf,
+					size_t count, loff_t *ppos)
+{
+	struct dentry *dent = file_dentry(file);
+	struct xe_gt *gt = extract_gt(dent->d_parent->d_parent);
+	struct xe_gt_sriov_scheduler_groups *info = &gt->sriov.pf.policy.guc.sched_groups;
+	struct guc_sched_group *groups = info->modes[info->current_mode].groups;
+	u32 num_groups = info->modes[info->current_mode].num_groups;
+	unsigned int group = (uintptr_t)extract_priv(dent);
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	char engines[128];
+
+	engines[0] = '\0';
+
+	/* If there are no groups it means that all the engines are in group 0 */
+	if (group < num_groups) {
+		for_each_hw_engine(hwe, gt, id) {
+			u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
+			u32 mask = groups[group].engines[guc_class];
+
+			if (mask & BIT(hwe->logical_instance)) {
+				strlcat(engines, hwe->name, sizeof(engines));
+				strlcat(engines, " ", sizeof(engines));
+			}
+		}
+		strlcat(engines, "\n", sizeof(engines));
+	} else if (group == 0) {
+		for_each_hw_engine(hwe, gt, id) {
+			strlcat(engines, hwe->name, sizeof(engines));
+			strlcat(engines, " ", sizeof(engines));
+		}
+		strlcat(engines, "\n", sizeof(engines));
+	}
+
+	return simple_read_from_buffer(buf, count, ppos, engines, strlen(engines));
+}
+
+static const struct file_operations sched_group_engines_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.read = sched_group_engines_read,
+	.llseek = default_llseek,
+};
+
 static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent)
 {
+	struct dentry *groups;
+	u8 group;
+
 	xe_gt_assert(gt, gt == extract_gt(parent));
 	xe_gt_assert(gt, PFID == extract_vfid(parent));
 
@@ -268,11 +320,25 @@ static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent)
 	 * We should rework the flow so that debugfs is registered after the
 	 * policy init, so that we check if there are valid groups before
 	 * adding the debugfs files.
+	 * Similarly, instead of using GUC_MAX_SCHED_GROUPS we could use
+	 * gt->sriov.pf.policy.guc.sched_groups.max_number_of_groups.
 	 */
 	if (!xe_sriov_gt_pf_policy_has_sched_groups_support(gt))
 		return;
 
 	debugfs_create_file("sched_groups_mode", 0644, parent, parent, &sched_groups_fops);
+
+	groups = debugfs_create_dir("sched_groups", parent);
+	if (IS_ERR(groups))
+		return;
+
+	for (group = 0; group < GUC_MAX_SCHED_GROUPS; group++) {
+		char name[10];
+
+		snprintf(name, sizeof(name), "group%u", group);
+		debugfs_create_file(name, 0644, groups, (void *)(uintptr_t)group,
+				    &sched_group_engines_fops);
+	}
 }
 
 /*
-- 
2.43.0

