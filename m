Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690F9EEE25C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 20:38:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1843210EC4F;
	Thu, 12 Sep 2024 20:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FrjEReaH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9822D10EC4F
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 20:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726173520; x=1757709520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O0vbQ1KHogTcKc4GC2Gr3Wd+EkTbdV6qh6A+MxFeNmw=;
 b=FrjEReaHEAEqBSlRc3wM256uIJVRpnMKtSbMCyVpwMTc8qBL9X0mlFP5
 nvktcDyRqvJBXgEYtdzCgRbAXSs2uGRG1UGbuK+QRSE68Ll/zNuJ7mZqv
 JKpw2w6zPkGxLnhNSOu1AJP1Bgd70u3YLxyYK1ma9bZ9Ks4ZSmvo81xDM
 WPYio1279xolx9ml/nbQ8ApPJaETB0bYRBCbwrQn353/ugOaupScbkuiQ
 6EJyl1zZqUd5K8DBToiMgcwwMC+XNYkPmbaeQ1uzAHDOn/GXEcKvZycaC
 a94zcWsPzaqm/ZtmL3zpHHiPtaxtyDDRNT6pzOnxNr07Vv+Beqr4JwNPv Q==;
X-CSE-ConnectionGUID: 3mSqo2yBSpeRIQP60MWJ1A==
X-CSE-MsgGUID: 5x1vkduhRRGSEWv4yuo9nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35725122"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="35725122"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 13:38:40 -0700
X-CSE-ConnectionGUID: u7r617tDSlCXxC/DkEmcQQ==
X-CSE-MsgGUID: 5hDpJYgQQm+xQtZIr9PTog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="68126843"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.117])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 13:38:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH 5/6] drm/xe/pf: Allow to view and replace VF GuC state over
 debugfs
Date: Thu, 12 Sep 2024 22:38:16 +0200
Message-Id: <20240912203817.1880-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240912203817.1880-1-michal.wajdeczko@intel.com>
References: <20240912203817.1880-1-michal.wajdeczko@intel.com>
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

For feature enabling and testing purposes, allow to view saved VF
GuC state and to replace it, but only under strict debug config.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   | 46 ++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 85 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  7 ++
 3 files changed, 138 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 2290ddaf9594..e990a63ec998 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -17,6 +17,7 @@
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_debugfs.h"
 #include "xe_gt_sriov_pf_helpers.h"
+#include "xe_gt_sriov_pf_migration.h"
 #include "xe_gt_sriov_pf_monitor.h"
 #include "xe_gt_sriov_pf_policy.h"
 #include "xe_gt_sriov_pf_service.h"
@@ -375,6 +376,44 @@ static const struct file_operations control_ops = {
 	.llseek		= default_llseek,
 };
 
+/*
+ *      /sys/kernel/debug/dri/0/
+ *      ├── gt0
+ *      │   ├── vf1
+ *      │   │   ├── guc_state
+ */
+static ssize_t guc_state_read(struct file *file, char __user *buf,
+			      size_t count, loff_t *pos)
+{
+	struct dentry *dent = file_dentry(file);
+	struct dentry *parent = dent->d_parent;
+	struct xe_gt *gt = extract_gt(parent);
+	unsigned int vfid = extract_vfid(parent);
+
+	return xe_gt_sriov_pf_migration_read_guc_state(gt, vfid, buf, count, pos);
+}
+
+static ssize_t guc_state_write(struct file *file, const char __user *buf,
+			       size_t count, loff_t *pos)
+{
+	struct dentry *dent = file_dentry(file);
+	struct dentry *parent = dent->d_parent;
+	struct xe_gt *gt = extract_gt(parent);
+	unsigned int vfid = extract_vfid(parent);
+
+	if (*pos)
+		return -EINVAL;
+
+	return xe_gt_sriov_pf_migration_write_guc_state(gt, vfid, buf, count);
+}
+
+static const struct file_operations guc_state_ops = {
+	.owner		= THIS_MODULE,
+	.read		= guc_state_read,
+	.write		= guc_state_write,
+	.llseek		= default_llseek,
+};
+
 /**
  * xe_gt_sriov_pf_debugfs_register - Register SR-IOV PF specific entries in GT debugfs.
  * @gt: the &xe_gt to register
@@ -423,5 +462,12 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
 
 		pf_add_config_attrs(gt, vfdentry, VFID(n));
 		debugfs_create_file("control", 0600, vfdentry, NULL, &control_ops);
+
+		/* for testing/debugging purposes only! */
+		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
+			debugfs_create_file("guc_state",
+					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
+					    vfdentry, NULL, &guc_state_ops);
+		}
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 8815fbde00cc..6a6eb396680e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -297,6 +297,91 @@ int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vf
 	return ret;
 }
 
+#ifdef CONFIG_DEBUG_FS
+/**
+ * xe_gt_sriov_pf_migration_read_guc_state() - Read a GuC VF state.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ * @buf: the user space buffer to read to
+ * @count: the maximum number of bytes to read
+ * @pos: the current position in the buffer
+ *
+ * This function is for PF only.
+ *
+ * This function reads up to @count bytes from the saved VF GuC state buffer
+ * at offset @pos into the user space address starting at @buf.
+ *
+ * Return: the number of bytes read or a negative error code on failure.
+ */
+ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
+						char __user *buf, size_t count, loff_t *pos)
+{
+	struct xe_gt_sriov_state_snapshot *snapshot;
+	ssize_t ret;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	if (!pf_migration_supported(gt))
+		return -ENOPKG;
+
+	mutex_lock(pf_migration_mutex(gt));
+	snapshot = pf_pick_vf_snapshot(gt, vfid);
+	if (snapshot->guc.size)
+		ret = simple_read_from_buffer(buf, count, pos, snapshot->guc.buff,
+					      snapshot->guc.size);
+	else
+		ret = -ENODATA;
+	mutex_unlock(pf_migration_mutex(gt));
+
+	return ret;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_write_guc_state() - Write a GuC VF state.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier
+ * @buf: the user space buffer with GuC VF state
+ * @size: the size of GuC VF state (in bytes)
+ *
+ * This function is for PF only.
+ *
+ * This function reads @size bytes of the VF GuC state stored at user space
+ * address @buf and writes it into a internal VF state buffer.
+ *
+ * Return: the number of bytes used or a negative error code on failure.
+ */
+ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int vfid,
+						 const char __user *buf, size_t size)
+{
+	struct xe_gt_sriov_state_snapshot *snapshot;
+	loff_t pos = 0;
+	ssize_t ret;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	if (!pf_migration_supported(gt))
+		return -ENOPKG;
+
+	mutex_lock(pf_migration_mutex(gt));
+	snapshot = pf_pick_vf_snapshot(gt, vfid);
+	ret = pf_alloc_guc_state(gt, snapshot, size);
+	if (!ret) {
+		ret = simple_write_to_buffer(snapshot->guc.buff, size, &pos, buf, size);
+		if (ret < 0)
+			pf_free_guc_state(gt, snapshot);
+		else
+			pf_dump_guc_state(gt, snapshot);
+	}
+	mutex_unlock(pf_migration_mutex(gt));
+
+	return ret;
+}
+#endif /* CONFIG_DEBUG_FS */
+
 static bool pf_check_migration_support(struct xe_gt *gt)
 {
 	/* GuC 70.25 with save/restore v2 is required */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 6643d730a9ab..09faeae00ddb 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -14,4 +14,11 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
 int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
 
+#ifdef CONFIG_DEBUG_FS
+ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
+						char __user *buf, size_t count, loff_t *pos);
+ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int vfid,
+						 const char __user *buf, size_t count);
+#endif
+
 #endif
-- 
2.43.0

