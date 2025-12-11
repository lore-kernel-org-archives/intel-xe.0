Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8007CD3B9AB
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 01:57:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCCE10E6CC;
	Thu, 11 Dec 2025 01:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eBaohCKf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F2E10E6CC
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 01:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765418243; x=1796954243;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kpik7Uk10QeAj4PIW0touxjbrBy8AoS+COVcCCpNxYs=;
 b=eBaohCKfPooYMrz4kHqyvp/OrZL/bgtFgb+2YzuajSpza+UkYumcYIB2
 ntcXRgtfofKZf8S5MPzFrZb27LAYXyyLGfelNwiMqOAW0dyAtLsjlyZ2s
 9A6XU7QUyfzfU8VuXIMl7GAgLOxnKqDg4gkStaALxt/3ZjJIPTfoDR1qg
 9PKtxI9uM70elhnOEUQmU/okA29G3NFzgrYX7H1v4NU8Uo3m0V+bEIfFa
 BsHimMYfQV8UyP0YJUl41fGe1gJexVO+ajcULap/CZieW80oFcHTRk5FI
 4znxb3y6Aq/I4sBoNcbz5Gde3fBtEgTFETeEQnGtm2Var3spmFYo4fNEx A==;
X-CSE-ConnectionGUID: BKafnRN0TpW/gfqmSdeGwA==
X-CSE-MsgGUID: bcW5jR74TE+NVwcqkel8lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71244485"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="71244485"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:57:23 -0800
X-CSE-ConnectionGUID: Yg18A0F6TD2EI5PzsibEhw==
X-CSE-MsgGUID: yEFt4ELgRsmBo9gvbTTXlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="196676769"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 17:57:23 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 05/12] drm/xe/sriov: Scheduler groups are incompatible with
 multi-lrc
Date: Wed, 10 Dec 2025 17:57:04 -0800
Message-ID: <20251211015700.34266-19-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
References: <20251211015700.34266-14-daniele.ceraolospurio@intel.com>
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
check on PF is added anyway to make sure we don't still have contexts
waiting to be cleaned up laying around.
On both PF and VF we block creation of new MLRC queues once scheduler
groups have been enabled.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: move threshold handling to its own patch, move MLRC check to
    guc_submit.c, hide SRIOV interals from exec_queue creation code,
    better comments/docs (Michal)
v3: s/query_vf/vf_query/ and move the function closer to the
    caller (Michal)
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h      |  7 +++
 drivers/gpu/drm/xe/xe_exec_queue.c         | 19 +++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c        | 17 ++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.h        |  8 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 28 ++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c        | 61 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h        |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h  |  2 +
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c    |  3 ++
 drivers/gpu/drm/xe/xe_guc_submit.c         | 21 ++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h         |  2 +
 12 files changed, 170 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index f0a87a1cb12f..5f791237d0ab 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -48,11 +48,18 @@
  *      Refers to 32 bit architecture version as reported by the HW IP.
  *      This key is supported on MTL+ platforms only.
  *      Requires GuC ABI 1.2+.
+ *
+ * _`GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE` : 0x3001
+ *      Tells the driver whether scheduler groups are enabled or not.
+ *      Requires GuC ABI 1.26+
  */
 
 #define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY			0x3000u
 #define GUC_KLV_GLOBAL_CFG_GMD_ID_LEN			1u
 
+#define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY	0x3001u
+#define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_LEN	1u
+
 /**
  * DOC: GuC Self Config KLVs
  *
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 226d07a3d852..df01c0664965 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -16,6 +16,7 @@
 #include "xe_dep_scheduler.h"
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_gt_sriov_pf.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_hw_engine_class_sysfs.h"
 #include "xe_hw_engine_group.h"
@@ -718,6 +719,17 @@ static u32 calc_validate_logical_mask(struct xe_device *xe,
 	return return_mask;
 }
 
+static bool has_sched_groups(struct xe_gt *gt)
+{
+	if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_sriov_pf_sched_groups_enabled(gt))
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
@@ -810,6 +822,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
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
index 7738d515ea9e..7f8dc2b56719 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -16,6 +16,7 @@
 #include "xe_guc_buf.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_klv_helpers.h"
+#include "xe_guc_submit.h"
 #include "xe_pm.h"
 
 /*
@@ -583,6 +584,19 @@ static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
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
@@ -630,6 +644,20 @@ int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value)
 	return pf_provision_sched_groups(gt, value);
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
index d1b1fa9f0a09..f5ea44dcaf82 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
@@ -21,6 +21,7 @@ bool xe_sriov_gt_pf_policy_has_sched_groups_support(struct xe_gt *gt);
 bool xe_sriov_gt_pf_policy_has_multi_group_modes(struct xe_gt *gt);
 bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode);
 int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);
+bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt);
 
 void xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
 void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 3c806c8e5f3e..e0ab1a7a76c4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -612,6 +612,46 @@ static void vf_cache_gmdid(struct xe_gt *gt)
 	gt->sriov.vf.runtime.gmdid = xe_gt_sriov_vf_gmdid(gt);
 }
 
+static int vf_query_sched_groups(struct xe_gt *gt)
+{
+	struct xe_guc *guc = &gt->uc.guc;
+	struct xe_uc_fw_version guc_version;
+	u32 value = 0;
+	int err;
+
+	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
+
+	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 26, 0))
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
+	xe_gt_sriov_dbg(gt, "sched groups %s\n", str_enabled_disabled(value));
+	return value;
+}
+
+static int vf_cache_sched_groups_status(struct xe_gt *gt)
+{
+	int ret;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	ret = vf_query_sched_groups(gt);
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
@@ -641,12 +681,33 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
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
+ * xe_gt_sriov_vf_sched_groups_enabled() - Check if PF has enabled multiple
+ * scheduler groups
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
index af40276790fa..7d97189c2d3d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -30,6 +30,7 @@ bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
 u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
 u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
 u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
+bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt);
 
 u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
 void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 510c33116fbd..9a6b5672d569 100644
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
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
index 1b08b443606e..dd504b77cb17 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -21,6 +21,9 @@
 const char *xe_guc_klv_key_to_string(u16 key)
 {
 	switch (key) {
+	/* GuC Global Config KLVs */
+	case GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY:
+		return "group_scheduling_available";
 	/* VGT POLICY keys */
 	case GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY:
 		return "sched_if_idle";
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0fd08d59b644..b983f5a7056f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -3001,6 +3001,27 @@ void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
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
index 100a7891b918..49e608500a4e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -49,6 +49,8 @@ xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapsh
 void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
 void xe_guc_register_vf_exec_queue(struct xe_exec_queue *q, int ctx_type);
 
+bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc);
+
 int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch);
 
 #endif
-- 
2.43.0

