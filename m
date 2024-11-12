Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0394E6781D
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 20:05:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C13E910E646;
	Tue, 12 Nov 2024 20:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YEYd9g7p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446B310E646
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 20:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731441938; x=1762977938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7+lEGaIsNyd369e2798GJkYvxAtOINwqWJY2Jllabqg=;
 b=YEYd9g7pcmiDUX/wR1KJu7ukYub1mw+NBFc/QEGvOhDvi4uQUQ1fYoWl
 ATQYFLDLNvqC+ubMzdZy9Ecid0t1ijKEUPFkygoysEPCrHbiZS11uFr5l
 t/48SJn2JS/5WCrBru5vpZkqiAhJ6n1OCyzpRoCRcUDRI0kLp8zuJN9L9
 n7fydZDL5uUnCHYAcNMWxF/nG8r1r9M4QCQsdGJRkohH4cPeKNaedCwQT
 bASwhy2eynTsqmWycA9u/H61ncsS0u4BQRWG95oNE9fQ302qawQhdSXp7
 8KMB+4uxl4opY/zYOIqLMfbSE9p2ny9WZ9QlgIC9rguBGW7FzjH1F+vOp Q==;
X-CSE-ConnectionGUID: I0evKnExTzO3y6sN1hsXCA==
X-CSE-MsgGUID: dLcyCkg4R1q4uMciCt2j8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31394390"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="31394390"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 12:05:38 -0800
X-CSE-ConnectionGUID: JxnTW/RnToqHkDV5toXF2g==
X-CSE-MsgGUID: ZSCRj6U7T3KIj4Q9TW2b3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="92710391"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.85.128])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 12:05:36 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v2 4/4] drm/xe/pf: Expose access to the VF GGTT PTEs over
 debugfs
Date: Tue, 12 Nov 2024 21:04:54 +0100
Message-Id: <20241112200454.2211-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241112200454.2211-1-michal.wajdeczko@intel.com>
References: <20241112200454.2211-1-michal.wajdeczko@intel.com>
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

For feature enabling and testing purposes, allow to capture and
replace VF's GGTT PTEs data using debugfs blob file.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 62 +++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index b2521dd6ec42..79ba85efc5e6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -11,6 +11,7 @@
 #include "xe_bo.h"
 #include "xe_debugfs.h"
 #include "xe_device.h"
+#include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_gt_debugfs.h"
 #include "xe_gt_sriov_pf_config.h"
@@ -502,6 +503,64 @@ static const struct file_operations config_blob_ops = {
 	.llseek		= default_llseek,
 };
 
+/*
+ *      /sys/kernel/debug/dri/0/
+ *      ├── gt0
+ *      │   ├── vf1
+ *      │   │   ├── ggtt_raw
+ */
+
+static ssize_t ggtt_raw_read(struct file *file, char __user *buf,
+			     size_t count, loff_t *pos)
+{
+	struct dentry *dent = file_dentry(file);
+	struct dentry *parent = dent->d_parent;
+	unsigned int vfid = extract_vfid(parent);
+	struct xe_gt *gt = extract_gt(parent);
+	struct xe_device *xe = gt_to_xe(gt);
+	ssize_t ret;
+
+	xe_pm_runtime_get(xe);
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+
+	ret = xe_ggtt_node_read(gt->sriov.pf.vfs[vfid].config.ggtt_region,
+				buf, count, pos);
+
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+	xe_pm_runtime_put(xe);
+
+	return ret;
+}
+
+static ssize_t ggtt_raw_write(struct file *file, const char __user *buf,
+			      size_t count, loff_t *pos)
+{
+	struct dentry *dent = file_dentry(file);
+	struct dentry *parent = dent->d_parent;
+	unsigned int vfid = extract_vfid(parent);
+	struct xe_gt *gt = extract_gt(parent);
+	struct xe_device *xe = gt_to_xe(gt);
+	ssize_t ret;
+
+	xe_pm_runtime_get(xe);
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+
+	ret = xe_ggtt_node_write(gt->sriov.pf.vfs[vfid].config.ggtt_region,
+				 buf, count, pos);
+
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+	xe_pm_runtime_put(xe);
+
+	return ret;
+}
+
+static const struct file_operations ggtt_raw_ops = {
+	.owner		= THIS_MODULE,
+	.read		= ggtt_raw_read,
+	.write		= ggtt_raw_write,
+	.llseek		= default_llseek,
+};
+
 /**
  * xe_gt_sriov_pf_debugfs_register - Register SR-IOV PF specific entries in GT debugfs.
  * @gt: the &xe_gt to register
@@ -559,6 +618,9 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
 			debugfs_create_file("config_blob",
 					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
 					    vfdentry, NULL, &config_blob_ops);
+			debugfs_create_file("ggtt_raw",
+					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
+					    vfdentry, NULL, &ggtt_raw_ops);
 		}
 	}
 }
-- 
2.43.0

