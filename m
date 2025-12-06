Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0D4D3B7E1
	for <intel-xe@archiver.kernel.org>; Sat,  6 Dec 2025 23:04:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA06310E315;
	Sat,  6 Dec 2025 23:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="natRhJg3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E338A10E313
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Dec 2025 23:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765062256; x=1796598256;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eMKpPMVVYjfMND0sN+XKjhohI7/fmjm3Um+KYuNWl0s=;
 b=natRhJg3U/16tUcTezdeAKtyIi0FPwIpbfUR3e1tL3WEHrFh3toUsAIY
 hR34+ADWm4izsjgoTMuuGEKqpHEqHW3e8N/6mceRsPcQZn/wS9uatXMbH
 YAKIiUHf6+JmMZrGLgb3T5gJj8yS9bd2iUXZqifYsQ5SdxIvuQtZveh3o
 PSVTwiToLuOWpSL3LbTWml8UU/XCNMN0XyyWAIxnVckVLavC8PMBR+Ddo
 94iMq0h350300eQrkvLtm+GvNuyYNYaJEwqu3uHnbty+/M4+VbZdnNknG
 VU0SXOvq/KepizqFgX1C1X2TdF+AnAK8RIkz2VpgDQxBPOxOOa0LrlOQt w==;
X-CSE-ConnectionGUID: ntcVLw2uRWixgNRaMzBJwA==
X-CSE-MsgGUID: FwNGpfG2S6mgSFMM2W/33g==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="78411690"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; d="scan'208";a="78411690"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2025 15:04:16 -0800
X-CSE-ConnectionGUID: 3lkH+b4oRTy3/8YxDVg9+A==
X-CSE-MsgGUID: jmhnbMcTQieKzgm+IyD9pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; d="scan'208";a="200045531"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2025 15:04:16 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 07/11] drm/xe/sriov: Add debugfs with scheduler groups
 information
Date: Sat,  6 Dec 2025 15:04:03 -0800
Message-ID: <20251206230356.3600292-20-daniele.ceraolospurio@intel.com>
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

Under a new subfolder, an entry is created for each group to list the
engines assigned to them. We create enough entries for each possible
group, with the disabled groups just returning an empty list.

v2: drop subfolders, always register debugfs for all groups (Michal)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 70 +++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 1be23809e624..15f5f3a40471 100644
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
@@ -260,8 +264,60 @@ static const struct file_operations sched_groups_fops = {
 	.release = single_release,
 };
 
+static ssize_t sched_group_engines_read(struct file *file, char __user *buf,
+					size_t count, loff_t *ppos)
+{
+	struct dentry *dent = file_dentry(file);
+	struct xe_gt *gt = extract_gt(dent->d_parent);
+	struct xe_gt_sriov_scheduler_groups *groups = &gt->sriov.pf.policy.guc.sched_groups;
+	u32 num_masks = groups->modes[groups->current_mode].num_masks;
+	u32 *masks = groups->modes[groups->current_mode].masks;
+	unsigned int group = GUC_MAX_SCHED_GROUPS;
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	char engines[128];
+	int ret;
+
+	ret = sscanf(dent->d_name.name, "group%u", &group);
+	xe_gt_assert(gt, ret == 1 && group < GUC_MAX_SCHED_GROUPS);
+
+	engines[0] = '\0';
+
+	/* If there are no masks it means that all the engines are in group 0 */
+	if (num_masks >= (group + 1) * GUC_MAX_ENGINE_CLASSES) {
+		for_each_hw_engine(hwe, gt, id) {
+			u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
+			u32 mask = masks[group * GUC_MAX_ENGINE_CLASSES + guc_class];
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
+	u8 g;
+
 	xe_gt_assert(gt, gt == extract_gt(parent));
 	xe_gt_assert(gt, PFID == extract_vfid(parent));
 
@@ -274,11 +330,25 @@ static void pf_add_sched_groups(struct xe_gt *gt, struct dentry *parent)
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
+	groups->d_inode->i_private = gt;
+
+	for (g = 0; g < GUC_MAX_SCHED_GROUPS; g++) {
+		char name[10];
+
+		snprintf(name, sizeof(name), "group%u", g);
+		debugfs_create_file(name, 0644, groups, parent, &sched_group_engines_fops);
+	}
 }
 
 /*
-- 
2.43.0

