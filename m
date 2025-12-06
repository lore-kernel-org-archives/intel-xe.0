Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C030D3B7E8
	for <intel-xe@archiver.kernel.org>; Sat,  6 Dec 2025 23:04:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD32510E316;
	Sat,  6 Dec 2025 23:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8mjfoaM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2C410E312
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Dec 2025 23:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765062255; x=1796598255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DEQOyrxBvxPxBigR7TZz7T0MZBaKeeVdGfPPJA4RUbc=;
 b=l8mjfoaMb3WOx4Qe2uXIHjFpFSGzQNVztQmBJKop0DjPAlslaEHKmP/O
 FOT9+E1oT9Uw7ilxLZjP3PjBmCn8xq26Q5F4WRtp9MwpklCXFv4zbdGlk
 QS+elAdU3gOgwaK8SIjxtfqO5uaXzeXHe4VL8qySyp/qTY+pfMLPQsm3i
 h9LPD0yQ0OnCbJU2+e4F7avT5vRX5hjvsbCNRP9NwKlWrZZXx06suaRhG
 DtB35WQJgfmcIJDn09FJq4oHu/XSYD/lEZY7yOu/S5pgQgpmXNq1Tc2hg
 P1G1xPJN25OXIyNov0E+P+avGYlOXd6a9ptmJhwzzWENdOyIERz0Br4oe A==;
X-CSE-ConnectionGUID: DrM5PW8uRomFLEIVXxwAXg==
X-CSE-MsgGUID: g5QCnP+cQB+m0WI3Fx0RWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="78411689"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; d="scan'208";a="78411689"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2025 15:04:15 -0800
X-CSE-ConnectionGUID: hy3duAd0TRW4IJ23YmmHzQ==
X-CSE-MsgGUID: KLzngV2WQa6iCh1IDu9yQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; d="scan'208";a="200045516"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2025 15:04:15 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 06/11] drm/xe/sriov: Add debugfs to enable scheduler groups
Date: Sat,  6 Dec 2025 15:04:02 -0800
Message-ID: <20251206230356.3600292-19-daniele.ceraolospurio@intel.com>
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

Reading the debugfs file lists the available configurations by name.
Writing the name of a configuration to the file will enable it.

v2: don't print anything if the feature is unsupported (Michal), add
    TODO for reworking init order to know if there are valid groups
    when we register debugfs, check for basic feature support.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 126 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c  |  19 +--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h  |   1 +
 3 files changed, 139 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 5123ff1fb116..1be23809e624 100644
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
+	if (!xe_sriov_gt_pf_policy_has_multi_group_modes(gt))
+		return 0;
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
+	if (!xe_sriov_gt_pf_policy_has_multi_group_modes(gt))
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
+	guard(xe_pm_runtime)(gt_to_xe(gt));
+	ret = xe_gt_sriov_pf_policy_set_sched_groups_mode(gt, m);
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
@@ -531,6 +656,7 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
 	} else {
 		pf_add_config_attrs(gt, dent, PFID);
 		pf_add_policy_attrs(gt, dent);
+		pf_add_sched_groups(gt, dent);
 
 		drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), dent, minor);
 	}
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index 6a682d788b02..2cafacac5d8e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -451,19 +451,24 @@ static void pf_sched_group_media_slices(struct xe_gt *gt, u32 **masks, u32 *num_
 	*num_masks = GUC_MAX_ENGINE_CLASSES * groups;
 }
 
-static void pf_init_sched_groups(struct xe_gt *gt)
+bool xe_sriov_gt_pf_policy_has_sched_groups_support(struct xe_gt *gt)
 {
-	int m;
-
-	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
-
 	/*
 	 * The GuC supports scheduler groups from v70.53.0, but a fix for it has
 	 * been merged in v70.55.1, so we require the latter. The feature is
 	 * also only enabled on BMG and newer FW.
 	 */
-	if (GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(70, 55, 1) ||
-	    gt_to_xe(gt)->info.platform < XE_BATTLEMAGE)
+	return GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 55, 1) &&
+	       gt_to_xe(gt)->info.platform >= XE_BATTLEMAGE;
+}
+
+static void pf_init_sched_groups(struct xe_gt *gt)
+{
+	int m;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+
+	if (!xe_sriov_gt_pf_policy_has_sched_groups_support(gt))
 		return;
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
index ceaf797ca21b..f5ea44dcaf82 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
@@ -17,6 +17,7 @@ int xe_gt_sriov_pf_policy_set_reset_engine(struct xe_gt *gt, bool enable);
 bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
 int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
 u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
+bool xe_sriov_gt_pf_policy_has_sched_groups_support(struct xe_gt *gt);
 bool xe_sriov_gt_pf_policy_has_multi_group_modes(struct xe_gt *gt);
 bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode);
 int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);
-- 
2.43.0

