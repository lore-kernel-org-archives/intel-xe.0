Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BEAD116E4
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 01:45:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A936A10E723;
	Thu, 27 Nov 2025 01:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gM7PHWyx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD67C10E720
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 01:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764207931; x=1795743931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GIeoAhUWdhjUvKFyhyyLjiYFHJx42xy1n7m5UZfqG04=;
 b=gM7PHWyx46+80mJg06uwko+gDiLRzgeg+05THXpaO8mTRv7I0L+Ug2/Y
 2/uGXsHmIY1RLSM1jK04dSmRIF0IVxp4fR1uA41HS1WAtHSpWeYDMwxXx
 OH4WlLyFfKE0ZS0VcwtBENal0Byh9NJ0IVzUpoueNIhY2n1dVUVcm55Ou
 NdnoWhnfqj0VCDo4LCPAjdLMN49nGOntCRo45Bbj29HnOnMHrcHTNtHIO
 97KqscHGe+Zh3TFKK2IhsFnEWQ3BEaUXICelaA03uLlEM8gsTy7yfVbW/
 2HxBT49QlTIKEfOHq++FcUBmow0nIttjVPN+1F+PB3Y5dUuFRXzY7qkO7 Q==;
X-CSE-ConnectionGUID: k3XOzXatRtStF5qifIBwlw==
X-CSE-MsgGUID: HtOPawK0RiirLnA0l+aF9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70114856"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="70114856"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 17:45:26 -0800
X-CSE-ConnectionGUID: BUMNCVoESFmRTs4kYXp1jQ==
X-CSE-MsgGUID: fyHZd/GbRnO9SlijCrDNjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="192753389"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 17:45:22 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 04/10] drm/xe/sriov: Scheduler groups are incompatible with
 multi-lrc
Date: Wed, 26 Nov 2025 17:45:10 -0800
Message-ID: <20251127014507.2323746-16-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
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

1) if a mlrc context is registered when we enable scheduler groups, the
   GuC will silently ignore the configuration
2) if a mlrc context is registered after scheduler groups are enabled,
   the GuC will disable the groups and generate an adverse event.

We therefore need to block mlrc context creation when scheduler groups
are enabled.
An adverse event threshold is available for the new adverse event.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         | 14 +++++
 drivers/gpu/drm/xe/xe_exec_queue.c            | 19 ++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 30 ++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 59 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h           |  3 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  2 +
 .../drm/xe/xe_guc_klv_thresholds_set_types.h  |  1 +
 8 files changed, 129 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 274f1b1ec37f..a6dce9da339f 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -46,11 +46,18 @@
  *      Refers to 32 bit architecture version as reported by the HW IP.
  *      This key is supported on MTL+ platforms only.
  *      Requires GuC ABI 1.2+.
+ *
+ * _`GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE` : 0x3001
+ *      Tells the driver whether scheduler groups are enabled or not.
+ *      Requres GuC ABI 1.26+
  */
 
 #define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY			0x3000u
 #define GUC_KLV_GLOBAL_CFG_GMD_ID_LEN			1u
 
+#define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY	0x3001u
+#define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_LEN	1u
+
 /**
  * DOC: GuC Self Config KLVs
  *
@@ -369,6 +376,10 @@ enum  {
  *      :1: NORMAL = schedule VF always, irrespective of whether it has work or not
  *      :2: HIGH = schedule VF in the next time-slice after current active
  *          time-slice completes if it has active work
+ *
+ * _`GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT` : 0x8A0D
+ *      This config sets the threshold for LRCA context registration when SRIOV
+ *      scheduler groups are enabled.
  */
 
 #define GUC_KLV_VF_CFG_GGTT_START_KEY		0x0001
@@ -427,6 +438,9 @@ enum  {
 #define   GUC_SCHED_PRIORITY_NORMAL		1u
 #define   GUC_SCHED_PRIORITY_HIGH		2u
 
+#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_KEY	0x8a0d
+#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_LEN	1u
+
 /*
  * Workaround keys:
  */
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 8724f8de67e2..e59c41c913b4 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -16,6 +16,7 @@
 #include "xe_dep_scheduler.h"
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_gt_sriov_pf_policy.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_hw_engine_class_sysfs.h"
 #include "xe_hw_engine_group.h"
@@ -698,6 +699,17 @@ static u32 calc_validate_logical_mask(struct xe_device *xe,
 	return return_mask;
 }
 
+static bool has_sched_groups(struct xe_gt *gt)
+{
+	if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_sriov_pf_policy_sched_groups_enabled(gt))
+		return true;
+
+	if (IS_SRIOV_VF(gt_to_xe(gt)) && xe_gt_sriov_vf_sched_groups_enabled(gt))
+		return true;
+
+	return false;
+}
+
 int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			       struct drm_file *file)
 {
@@ -790,6 +802,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
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
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index 48f250ae0d0d..c7f1ea8eb9c5 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -8,6 +8,7 @@
 #include <drm/drm_managed.h>
 
 #include "xe_bo.h"
+#include "xe_exec_queue_types.h"
 #include "xe_gt.h"
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_policy.h"
@@ -527,6 +528,24 @@ static int __pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
 				      masks, num_masks);
 }
 
+static bool guc_has_mlrc_queue(struct xe_guc *guc)
+{
+	struct xe_exec_queue *q;
+	unsigned long index;
+	bool found = false;
+
+	mutex_lock(&guc->submission_state.lock);
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
+		if (q->width > 1) {
+			found = true;
+			break;
+		}
+	}
+	mutex_unlock(&guc->submission_state.lock);
+
+	return found;
+}
+
 static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
 {
 	int err;
@@ -548,6 +567,12 @@ static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
 	if (xe_sriov_pf_num_vfs(gt_to_xe(gt)))
 		return -EPERM;
 
+	/* The GuC silently ignores the setting if any mlrc contexts are registered */
+	if ((mode != XE_SRIOV_SCHED_GROUPS_NONE) && guc_has_mlrc_queue(&gt->uc.guc)) {
+		xe_gt_sriov_notice(gt, "can't enable sched groups with active mlrc queues\n");
+		return -EPERM;
+	}
+
 	err = __pf_provision_sched_groups(gt, mode);
 	if (err)
 		return err;
@@ -600,6 +625,11 @@ int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value)
 	return err;
 }
 
+bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt)
+{
+	return gt->sriov.pf.policy.guc.sched_groups.current_mode != XE_SRIOV_SCHED_GROUPS_NONE;
+}
+
 static void pf_sanitize_guc_policies(struct xe_gt *gt)
 {
 	pf_sanitize_sched_if_idle(gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
index 36680996f2bd..89aa3af6cc7d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
@@ -18,6 +18,7 @@ bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
 int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
 u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
 int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);
+bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt);
 
 int xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
 void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 4c73a077d314..7a180c947032 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -438,6 +438,30 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
 	return value;
 }
 
+static int query_vf_sched_groups(struct xe_gt *gt)
+{
+	struct xe_guc *guc = &gt->uc.guc;
+	u32 value = 0;
+	int err;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	if (MAKE_GUC_VER_STRUCT(gt->sriov.vf.guc_version) < MAKE_GUC_VER(1, 26, 0))
+		return 0;
+
+	err = guc_action_query_single_klv32(guc,
+					    GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY,
+					    &value);
+	if (unlikely(err)) {
+		xe_gt_sriov_err(gt, "Failed to obtain sched groups status (%pe)\n",
+				ERR_PTR(err));
+		return err;
+	}
+
+	xe_gt_sriov_dbg(gt, "sched groups %s\n", value ? "enabled" : "disabled");
+	return value;
+}
+
 static int vf_get_ggtt_info(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -564,6 +588,21 @@ static void vf_cache_gmdid(struct xe_gt *gt)
 	gt->sriov.vf.runtime.gmdid = xe_gt_sriov_vf_gmdid(gt);
 }
 
+static int vf_cache_sched_groups_status(struct xe_gt *gt)
+{
+	int ret;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	ret = query_vf_sched_groups(gt);
+	if (ret < 0)
+		return ret;
+
+	gt->sriov.vf.runtime.uses_sched_groups = ret;
+
+	return 0;
+}
+
 /**
  * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
  * @gt: the &xe_gt
@@ -593,12 +632,32 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
 	if (unlikely(err))
 		return err;
 
+	err = vf_cache_sched_groups_status(gt);
+	if (unlikely(err))
+		return err;
+
 	if (has_gmdid(xe))
 		vf_cache_gmdid(gt);
 
 	return 0;
 }
 
+/**
+ * xe_gt_sriov_vf_sched_groups_enabled - Check if PF has enabled sched groups
+ * @gt: the &xe_gt
+ *
+ * This function is for VF use only.
+ *
+ * Return: true if shed groups were enabled, false otherwise.
+ */
+bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
+
+	return gt->sriov.vf.runtime.uses_sched_groups;
+}
+
 /**
  * xe_gt_sriov_vf_guc_ids - VF GuC context IDs configuration.
  * @gt: the &xe_gt
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index af40276790fa..2e1d34c0397f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -23,11 +23,14 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt);
 int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
 void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
 
+bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt);
+
 int xe_gt_sriov_vf_init_early(struct xe_gt *gt);
 int xe_gt_sriov_vf_init(struct xe_gt *gt);
 bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
 
 u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
+u32 xe_gt_sriov_vf_sched_groups(struct xe_gt *gt);
 u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
 u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 420b0e6089de..5267c097ecd0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -27,6 +27,8 @@ struct xe_gt_sriov_vf_selfconfig {
 struct xe_gt_sriov_vf_runtime {
 	/** @gmdid: cached value of the GDMID register. */
 	u32 gmdid;
+	/** @uses_sched_groups: whether PF enabled sched groups or not. */
+	bool uses_sched_groups;
 	/** @regs_size: size of runtime register array. */
 	u32 regs_size;
 	/** @num_regs: number of runtime registers in the array. */
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
index 0a028c94756d..3e55d9302855 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
@@ -32,6 +32,7 @@
 	define(H2G_STORM, guc_time_us)			\
 	define(IRQ_STORM, irq_time_us)			\
 	define(DOORBELL_STORM, doorbell_time_us)	\
+	define(MULTI_LRC_COUNT, multi_lrc_count)	\
 	/* end */
 
 /**
-- 
2.43.0

