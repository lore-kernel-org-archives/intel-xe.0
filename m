Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB942D6406B
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 01:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6042B10E9BA;
	Wed, 17 Dec 2025 01:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ek+En4f9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E25A10E80A
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 01:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765934799; x=1797470799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AjpkGKya7x03U2EE4Z5W0GjeH4DY4i40eTtpBgCNZvU=;
 b=Ek+En4f9Jp1pIH2YsuNFVOksGbuE3W8MuO4myhMRZbEyEZrO92N7sxfH
 nLT28oNm8D8l+ufZoV33QbmyQ3FqZzuQCet4Lidl2AHAFeEJyBQD3jCHI
 scc5VeYp3YybvnKqgxKO5HNrf3ioZT3FBjC5+Fnnbv3mSpcvM88DSsOVu
 heheDn5xMxFGHsQ/DqKMK0oRJ+E2qSJJQTmv28iMFGuzLZSn8iF1ULpRI
 1IdRH31x7oiMMhT3cASiJuxGBXkN5MRHJP6IShN49gb0AUmHiVQFPqflN
 +DWjg91FmupRP5eZe7rpRaoe1dI9WiiEe16AIJctkxKZRoOy7cfeQgATw w==;
X-CSE-ConnectionGUID: qQ/xAC+SRJ+aao1GPbipxw==
X-CSE-MsgGUID: 5SNbJaHmSC+iKlJiB4nKGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67903841"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="67903841"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 17:26:39 -0800
X-CSE-ConnectionGUID: m+VGWbH+T4migtDXX8IH/w==
X-CSE-MsgGUID: 0foRtak9QjylGWiZxE43Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="202360623"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 17:26:39 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 06/13] drm/xe/pf: Scheduler groups are incompatible with
 multi-lrc
Date: Tue, 16 Dec 2025 17:26:26 -0800
Message-ID: <20251217012620.758252-21-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217012620.758252-15-daniele.ceraolospurio@intel.com>
References: <20251217012620.758252-15-daniele.ceraolospurio@intel.com>
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

Since engines in the same class can be divided across multiple groups,
the GuC does not allow scheduler groups to be active if there are
multi-lrc contexts. This means that:

1) if a MLRC context is registered when we enable scheduler groups, the
   GuC will silently ignore the configuration
2) if a MLRC context is registered after scheduler groups are enabled,
   the GuC will disable the groups and generate an adverse event.

The expectation is that the admin will ensure that all apps that use
MLRC on PF have been terminated before scheduler groups are created. A
check is added anyway to make sure we don't still have contexts waiting
to be cleaned up laying around. A check is also added at queue creation
time to block MLRC queue creation if scheduler groups have been enabled.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: move threshold handling to its own patch, move MLRC check to
    guc_submit.c, hide SRIOV interals from exec_queue creation code,
    better comments/docs (Michal)
v3: s/query_vf/vf_query/ and move the function closer to the
    caller (Michal)
v4: split VF code to separate patch (Michal)
---
 drivers/gpu/drm/xe/xe_exec_queue.c         | 16 +++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c        | 17 +++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h        |  8 +++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 28 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c         | 21 ++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h         |  2 ++
 7 files changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 41023a464480..c336dcd19020 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -17,6 +17,7 @@
 #include "xe_dep_scheduler.h"
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_gt_sriov_pf.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_hw_engine_class_sysfs.h"
 #include "xe_hw_engine_group.h"
@@ -1108,6 +1109,14 @@ static u32 calc_validate_logical_mask(struct xe_device *xe,
 	return return_mask;
 }
 
+static bool has_sched_groups(struct xe_gt *gt)
+{
+	if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_sriov_pf_sched_groups_enabled(gt))
+		return true;
+
+	return false;
+}
+
 int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			       struct drm_file *file)
 {
@@ -1200,6 +1209,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			return -ENOENT;
 		}
 
+		/* SRIOV sched groups are not compatible with multi-lrc */
+		if (XE_IOCTL_DBG(xe, args->width > 1 && has_sched_groups(hwe->gt))) {
+			up_read(&vm->lock);
+			xe_vm_put(vm);
+			return -EINVAL;
+		}
+
 		q = xe_exec_queue_create(xe, vm, logical_mask,
 					 args->width, hwe, flags,
 					 args->extensions);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index 0d97a823e702..fb5c9101e275 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -284,3 +284,20 @@ int xe_gt_sriov_pf_wait_ready(struct xe_gt *gt)
 	pf_flush_restart(gt);
 	return 0;
 }
+
+/**
+ * xe_gt_sriov_pf_sched_groups_enabled - Check if multiple scheduler groups are
+ * enabled
+ * @gt: the &xe_gt
+ *
+ * This function is for PF use only.
+ *
+ * Return: true if shed groups were enabled, false otherwise.
+ */
+bool xe_gt_sriov_pf_sched_groups_enabled(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+
+	return xe_gt_sriov_pf_policy_sched_groups_enabled(gt);
+}
+
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
index e7fde3f9937a..1ccfc7137b98 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
@@ -6,6 +6,8 @@
 #ifndef _XE_GT_SRIOV_PF_H_
 #define _XE_GT_SRIOV_PF_H_
 
+#include <linux/types.h>
+
 struct xe_gt;
 
 #ifdef CONFIG_PCI_IOV
@@ -16,6 +18,7 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt);
 void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid);
 void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt);
 void xe_gt_sriov_pf_restart(struct xe_gt *gt);
+bool xe_gt_sriov_pf_sched_groups_enabled(struct xe_gt *gt);
 #else
 static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
 {
@@ -38,6 +41,11 @@ static inline void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt)
 static inline void xe_gt_sriov_pf_restart(struct xe_gt *gt)
 {
 }
+
+static inline bool xe_gt_sriov_pf_sched_groups_enabled(struct xe_gt *gt)
+{
+	return false;
+}
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index 1b8d14da93d2..219e26feea10 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -16,6 +16,7 @@
 #include "xe_guc_buf.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_klv_helpers.h"
+#include "xe_guc_submit.h"
 #include "xe_pm.h"
 
 /*
@@ -590,6 +591,19 @@ static int pf_provision_sched_groups(struct xe_gt *gt, enum xe_sriov_sched_group
 	if (xe_sriov_pf_num_vfs(gt_to_xe(gt)))
 		return -EBUSY;
 
+	/*
+	 * The GuC silently ignores the setting if any MLRC contexts are
+	 * registered. We expect the admin to make sure that all apps that use
+	 * MLRC are terminated before scheduler groups are enabled, so this
+	 * check is just to make sure that the exec_queue destruction has been
+	 * completed.
+	 */
+	if (mode != XE_SRIOV_SCHED_GROUPS_DISABLED &&
+	    xe_guc_has_registered_mlrc_queues(&gt->uc.guc)) {
+		xe_gt_sriov_notice(gt, "can't enable sched groups with active MLRC queues\n");
+		return -EPERM;
+	}
+
 	err = __pf_provision_sched_groups(gt, mode);
 	if (err)
 		return err;
@@ -638,6 +652,20 @@ int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt,
 	return pf_provision_sched_groups(gt, mode);
 }
 
+/**
+ * xe_gt_sriov_pf_policy_sched_groups_enabled() - check whether the GT has
+ * multiple scheduler groups enabled
+ * @gt: the &xe_gt to check
+ *
+ * This function can only be called on PF.
+ *
+ * Return: true if the GT has multiple groups enabled, false otherwise.
+ */
+bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt)
+{
+	return gt->sriov.pf.policy.guc.sched_groups.current_mode != XE_SRIOV_SCHED_GROUPS_DISABLED;
+}
+
 static void pf_sanitize_guc_policies(struct xe_gt *gt)
 {
 	pf_sanitize_sched_if_idle(gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
index d6e96302ff68..bd73aa58f9ca 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
@@ -25,6 +25,7 @@ bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt,
 						enum xe_sriov_sched_group_modes mode);
 int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt,
 						enum xe_sriov_sched_group_modes mode);
+bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt);
 
 void xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
 void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 1777133246e4..8149786747a2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3562,6 +3562,27 @@ void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
 	mutex_unlock(&guc->submission_state.lock);
 }
 
+/**
+ * xe_guc_has_registered_mlrc_queues - check whether there are any MLRC queues
+ * registered with the GuC
+ * @guc: GuC.
+ *
+ * Return: true if any MLRC queue is registered with the GuC, false otherwise.
+ */
+bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc)
+{
+	struct xe_exec_queue *q;
+	unsigned long index;
+
+	guard(mutex)(&guc->submission_state.lock);
+
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
+		if (q->width > 1)
+			return true;
+
+	return false;
+}
+
 /**
  * xe_guc_contexts_hwsp_rebase - Re-compute GGTT references within all
  * exec queues registered to given GuC.
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 4d89b2975fe9..b3839a90c142 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -52,6 +52,8 @@ xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapsh
 void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
 void xe_guc_register_vf_exec_queue(struct xe_exec_queue *q, int ctx_type);
 
+bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc);
+
 int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch);
 
 #endif
-- 
2.43.0

