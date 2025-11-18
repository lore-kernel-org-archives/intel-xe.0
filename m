Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64047CED63B
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 12:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2279B10E49D;
	Tue, 18 Nov 2025 12:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DKkv1+2G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F61910E49D
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 12:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763470069; x=1795006069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bucjq2Ks2D1ot29vXd+1wJNhWgolpIulRrxj3CZ726w=;
 b=DKkv1+2GimBhXAjNumCuhFAvW51gEY/9xS7ZAy5jJGJnCy+h46OntrLr
 b7r3mlQGGBxcQ6z1NlKiuDvv/hjlEay6uIwDdvCkcT9rVGwwgq+0ZWzFl
 oHwCh3Tf5rPaiDWMQ8uZASEUgRIj5IRBa4kIEHegV9BFC35B5a/vDiKJn
 +XPmdZ0hSUT3Jsa8Dwbo71TloC0zqnust+xLP4EZpoQAkj47L3sh/7KJ4
 P/tc2WAE3jhaR7ZowicD7z8VRaNX6ku6GNUU1AMWdW+n4oiARJCorQxiB
 /vGQzRWR1FYpWA7NzQLZmU1SV0hnGaoQPWpPtrbt77f5s9nMgGVmxES9B Q==;
X-CSE-ConnectionGUID: s/YIxUIFRv6O3uh98MkDJQ==
X-CSE-MsgGUID: RDv5nV6HSCCkQ7qOSbavGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65194254"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65194254"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 04:47:49 -0800
X-CSE-ConnectionGUID: o7pmPmTJS+yVCeHLvBe7zw==
X-CSE-MsgGUID: knoH6MaWSk2lKX4/FMuj6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190034360"
Received: from gsd-build.iind.intel.com ([10.190.229.175])
 by orviesa010.jf.intel.com with ESMTP; 18 Nov 2025 04:47:47 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v3 2/2] drm/xe/vf: Fix up GGTT mappings on S4 resume across
 VFs.
Date: Tue, 18 Nov 2025 12:47:41 +0000
Message-ID: <20251118124741.3504754-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118124741.3504754-1-satyanarayana.k.v.p@intel.com>
References: <20251118124741.3504754-1-satyanarayana.k.v.p@intel.com>
MIME-Version: 1.0
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

When SR-IOV is enabled, a VM may suspend on one VF and resume on a
different VF after S4 sleep cycle. Because GGTT space is not virtualized,
this transition can lead to incorrect GGTT references. To address this,
validate the GGTT space during resume and apply necessary fixups if the
VF has changed.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>

---
V2 -> V3:
- Fixed review comments (Michal).
- Added a new function xe_gt_sriov_vf_resume_fixups() which handshakes
with GUC and does GGTT fixups.
- Updated commit message.

V1 -> V2:
- Rebased to latest drm-tip.
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 38 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
 drivers/gpu/drm/xe/xe_pm.c          |  7 ++++++
 drivers/gpu/drm/xe/xe_sriov_vf.c    | 30 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf.h    |  1 +
 5 files changed, 77 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index be7986537aad..87aa1d6576d6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1335,6 +1335,44 @@ int xe_gt_sriov_vf_init(struct xe_gt *gt)
 					vf_migration_fini, gt);
 }
 
+/**
+ * xe_gt_sriov_vf_resume_early() - Resume from S4.
+ * @gt: the &xe_gt.
+ *
+ * This function shall be called only by VF.
+ *
+ * Returns: 0 if the operation completed successfully, or a negative
+ * error code otherwise.
+ */
+int xe_gt_sriov_vf_resume_early(struct xe_gt *gt)
+{
+	u64 start, size;
+	s64 shift;
+	int err;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	err = xe_gt_sriov_vf_bootstrap(gt);
+	if (unlikely(err))
+		goto out;
+
+	err = vf_query_ggtt_info(gt, &start, &size, &shift);
+	if (unlikely(err))
+		goto out;
+
+	if (shift) {
+		err = vf_post_migration_fixups(gt);
+		if (unlikely(err))
+			goto out;
+	}
+
+out:
+	if (unlikely(err))
+		xe_gt_sriov_err(gt, "Fixups during resume failed (%d)\n", err);
+
+	return err;
+}
+
 /**
  * xe_gt_sriov_vf_recovery_pending() - VF post migration recovery pending
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index af40276790fa..68026b561d7d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -25,6 +25,7 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
 
 int xe_gt_sriov_vf_init_early(struct xe_gt *gt);
 int xe_gt_sriov_vf_init(struct xe_gt *gt);
+int xe_gt_sriov_vf_resume_early(struct xe_gt *gt);
 bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
 
 u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 4f8688fd3f00..a6fcddc47d62 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -24,6 +24,7 @@
 #include "xe_late_bind_fw.h"
 #include "xe_pcode.h"
 #include "xe_pxp.h"
+#include "xe_sriov_vf.h"
 #include "xe_sriov_vf_ccs.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
@@ -248,6 +249,12 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_display_pm_resume_early(xe);
 
+	if (IS_SRIOV_VF(xe)) {
+		err = xe_sriov_vf_resume_early(xe);
+		if (unlikely(err))
+			goto err;
+	}
+
 	/*
 	 * This only restores pinned memory which is the memory required for the
 	 * GT(s) to resume.
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 39c829daa97c..a33f86b7986d 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -191,6 +191,36 @@ int xe_sriov_vf_init_late(struct xe_device *xe)
 	return xe_sriov_vf_ccs_init(xe);
 }
 
+/**
+ * xe_sriov_vf_resume_early() - Early resume operations for SR-IOV Virtual
+ * Function.
+ * @xe: the &xe_device to resume
+ *
+ * This function shall be called only by VF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_vf_resume_early(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	int err = 0;
+	u8 id;
+
+	xe_assert(xe, IS_SRIOV_VF(xe));
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_vf_resume_early(gt);
+		if (unlikely(err))
+			goto out;
+	}
+
+out:
+	if (unlikely(err))
+		xe_sriov_err(xe, "VF resume early failed with (%d)\n", err);
+
+	return err;
+}
+
 static int sa_info_vf_ccs(struct seq_file *m, void *data)
 {
 	struct drm_info_node *node = m->private;
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
index e967d4166a43..54fe6eedeff6 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
@@ -13,6 +13,7 @@ struct xe_device;
 
 void xe_sriov_vf_init_early(struct xe_device *xe);
 int xe_sriov_vf_init_late(struct xe_device *xe);
+int xe_sriov_vf_resume_early(struct xe_device *xe);
 bool xe_sriov_vf_migration_supported(struct xe_device *xe);
 void xe_sriov_vf_migration_disable(struct xe_device *xe, const char *fmt, ...);
 void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root);
-- 
2.51.0

