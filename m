Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BCBC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 20:35:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA5710F5EF;
	Thu, 18 Apr 2024 20:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZfEeoCF0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED35B113FC4
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 20:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713472501; x=1745008501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6tz5tVXdw7bftdQ6U2f95CSzTozNt79Bs3iYooLTBAE=;
 b=ZfEeoCF05qlOlpIQWol0aqqmpbgwSilXaQ64xNMYxkYsdTN6FnuKTj+L
 gCtPTuemu8zwk6ckA8F86o9gxqBOICXLnW27NrhcrcfWB74YSVKR06CHS
 yfSLk+9rr4lFvBMS3Ab+112QGFKGcYzgTi7xAUexQZjUQT69ComgyA75p
 FrX72ToydqIWpSKU3XM+6KKwXL9K1Cc3YTVZBJo3PQj7BWNpwZ8jE+vDL
 2180vTRbDCQZDEEoG4cbnQk35qerML0WBgUGZBHuQy/qlP2xbgz2UYxQa
 p5tNTkeX3IOfxSc/VXcf/TeqReMFJECKEptU/OjzWCr1Dr1HhYzHxLs6O g==;
X-CSE-ConnectionGUID: Ry3njIRFTLGHFY+pVt6+Bw==
X-CSE-MsgGUID: fADDhX2RQxyO7ax2AYLNBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="11992059"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="11992059"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 13:35:01 -0700
X-CSE-ConnectionGUID: V4q4dLqhSqyTH9p01Qonaw==
X-CSE-MsgGUID: 5Eq1LGKUScu17942v5O06Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="22969867"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.62.251])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 13:35:00 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/3] drm/xe/pf: Expose SR-IOV policy settings over debugfs
Date: Thu, 18 Apr 2024 22:34:42 +0200
Message-Id: <20240418203442.226-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240418203442.226-1-michal.wajdeczko@intel.com>
References: <20240418203442.226-1-michal.wajdeczko@intel.com>
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

We already have functions to configure SR-IOV policies.
Allow to tweak those policy settings over debugfs.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 50 +++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index 8909bb950a8b..3a83af7aa039 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -17,6 +17,7 @@
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_debugfs.h"
 #include "xe_gt_sriov_pf_helpers.h"
+#include "xe_gt_sriov_pf_policy.h"
 #include "xe_pm.h"
 
 /*
@@ -76,6 +77,54 @@ static const struct drm_info_list pf_info[] = {
 	},
 };
 
+/*
+ *      /sys/kernel/debug/dri/0/
+ *      ├── gt0
+ *      │   ├── pf
+ *      │   │   ├── reset_engine
+ *      │   │   ├── sample_period
+ *      │   │   ├── sched_if_idle
+ */
+
+#define DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(POLICY, TYPE, FORMAT)		\
+										\
+static int POLICY##_set(void *data, u64 val)					\
+{										\
+	struct xe_gt *gt = extract_gt(data);					\
+	struct xe_device *xe = gt_to_xe(gt);					\
+	int err;								\
+										\
+	xe_pm_runtime_get(xe);							\
+	err = xe_gt_sriov_pf_policy_set_##POLICY(gt, val);			\
+	xe_pm_runtime_put(xe);							\
+										\
+	return err;								\
+}										\
+										\
+static int POLICY##_get(void *data, u64 *val)					\
+{										\
+	struct xe_gt *gt = extract_gt(data);					\
+										\
+	*val = xe_gt_sriov_pf_policy_get_##POLICY(gt);				\
+	return 0;								\
+}										\
+										\
+DEFINE_DEBUGFS_ATTRIBUTE(POLICY##_fops, POLICY##_get, POLICY##_set, FORMAT)
+
+DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(reset_engine, bool, "%llu\n");
+DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(sched_if_idle, bool, "%llu\n");
+DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(sample_period, u32, "%llu\n");
+
+static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
+{
+	xe_gt_assert(gt, gt == extract_gt(parent));
+	xe_gt_assert(gt, PFID == extract_vfid(parent));
+
+	debugfs_create_file_unsafe("reset_engine", 0644, parent, parent, &reset_engine_fops);
+	debugfs_create_file_unsafe("sched_if_idle", 0644, parent, parent, &sched_if_idle_fops);
+	debugfs_create_file_unsafe("sample_period_ms", 0644, parent, parent, &sample_period_fops);
+}
+
 /*
  *      /sys/kernel/debug/dri/0/
  *      ├── gt0
@@ -261,6 +310,7 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
 	pfdentry->d_inode->i_private = gt;
 
 	drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), pfdentry, minor);
+	pf_add_policy_attrs(gt, pfdentry);
 	pf_add_config_attrs(gt, pfdentry, PFID);
 
 	for (n = 1; n <= totalvfs; n++) {
-- 
2.43.0

