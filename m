Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C46D6406C
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 01:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB9C10E9BD;
	Wed, 17 Dec 2025 01:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XN8LpL7q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC75810E80A
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 01:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765934799; x=1797470799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JjKvmLNXBy/O4fJ3KuL70fY6dMbM9VWmnfhFs9ExyqE=;
 b=XN8LpL7qtOLNZ5ce3sOt+KZ9A52LX6enH5sh3+Fo7RhoipGSiVgj0sJp
 H99oCTI2iRdU6El7fxDFlHcPhYGnse20LYr/Ms3X0bOfZ4iuToPC3ST74
 NgYyR8Q4ql8+lyidf4ULbxakrqcXC7KasmGp09p/0hSFy30eoJ62tocxN
 C73s8qxJRnrVMEUUllQzc2gf1UONoMSMXaqPZUpyC/V/PXTeOOACeoAsq
 w5C0/rGLGfgv1yLKV5tOjeN8u2Ys45VL5ETt0sfZHbjpFrsRaB6SS3/Rq
 SQuHfsPSogtyuKphmR94mzCuf4uEhDYf/pO5OQgC7i/GFHILQdyHO4XQs g==;
X-CSE-ConnectionGUID: I+uoePrPTQSi++3LHR8blA==
X-CSE-MsgGUID: rZfO8JkMTxWFQXheL7JaYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67903839"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="67903839"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 17:26:39 -0800
X-CSE-ConnectionGUID: mqkD1rsvRFutH5u3d32y1A==
X-CSE-MsgGUID: YUDC1r/BQVKmKNi2/IfuDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="202360619"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 17:26:38 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 05/13] drm/xe/sriov: Add support for enabling scheduler
 groups
Date: Tue, 16 Dec 2025 17:26:25 -0800
Message-ID: <20251217012620.758252-20-daniele.ceraolospurio@intel.com>
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

Scheduler groups are enabled by sending a specific policy configuration
KLV to the GuC. We don't allow changing this policy if there are VF
active, since the expectation is that the VF will only check if the
feature is enabled during driver initialization.

While the GuC interface supports a maximum of 8 groups, the actual
number of groups that can be enabled can be lower than that and
can be different on different devices. For now, all devices support up
to 2 groups, so we check that we do not have more groups than that.

The functions added by this patch will be used by sysfs/debugfs, coming
in follow up patches.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com> #v3
---
v2: code improvements, add GUC_MAX_SCHED_GROUPS define, don't add
    XE_SRIOV_SCHED_GROUPS_NONE to supported_modes (Michal)
v3: fix enum/integer mismatch, use GUC_MAX_SCHED_GROUPS to define the
    max KLV length and not the other way around
v4: add min and max len defines for the KLV, use the enum type instead
    of u32 where possible.
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  22 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 153 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |   7 +
 .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |   6 +
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c       |   2 +
 5 files changed, 190 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 89a4f8c504e6..ac10cf3adbc1 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -8,6 +8,8 @@
 
 #include <linux/types.h>
 
+#include "abi/guc_scheduler_abi.h"
+
 /**
  * DOC: GuC KLV
  *
@@ -200,6 +202,20 @@ enum  {
  *      :0: adverse events are not counted (default)
  *      :n: sample period in milliseconds
  *
+ * _`GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG` : 0x8004
+ *      This config allows the PF to split the engines across scheduling groups.
+ *      Each group is independently timesliced across VFs, allowing different
+ *      VFs to be active on the HW at the same time. When enabling this feature,
+ *      all engines must be assigned to a group (and only one group), or they
+ *      will be excluded from scheduling after this KLV is sent. To enable
+ *      the groups, the driver must provide a masks array with
+ *      GUC_MAX_ENGINE_CLASSES entries for each group, with each mask indicating
+ *      which logical instances of that class belong to the group. Therefore,
+ *      the length of this KLV when enabling groups is
+ *      num_groups * GUC_MAX_ENGINE_CLASSES. To disable the groups, the driver
+ *      must send the KLV without any payload (i.e. len = 0). The maximum
+ *      number of groups is 8.
+ *
  * _`GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH` : 0x8D00
  *      This enum is to reset utilized HW engine after VF Switch (i.e to clean
  *      up Stale HW register left behind by previous VF)
@@ -214,6 +230,12 @@ enum  {
 #define GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY	0x8002
 #define GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_LEN	1u
 
+#define GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_KEY	0x8004
+#define GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT	GUC_MAX_SCHED_GROUPS
+#define GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_MIN_LEN 0
+#define GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_MAX_LEN \
+	(GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT * GUC_MAX_ENGINE_CLASSES)
+
 #define GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY	0x8D00
 #define GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_LEN	1u
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index fc60e7a01434..1b8d14da93d2 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -97,6 +97,23 @@ static int pf_push_policy_u32(struct xe_gt *gt, u16 key, u32 value)
 	return pf_push_policy_klvs(gt, 1, klv, ARRAY_SIZE(klv));
 }
 
+static int pf_push_policy_payload(struct xe_gt *gt, u16 key, void *payload, u32 num_dwords)
+{
+	CLASS(xe_guc_buf, buf)(&gt->uc.guc.buf, GUC_KLV_LEN_MIN + num_dwords);
+	u32 *klv;
+
+	if (!xe_guc_buf_is_valid(buf))
+		return -ENOBUFS;
+
+	klv = xe_guc_buf_cpu_ptr(buf);
+
+	klv[0] = PREP_GUC_KLV(key, num_dwords);
+	if (num_dwords)
+		memcpy(&klv[1], payload, num_dwords * sizeof(u32));
+
+	return pf_push_policy_buf_klvs(gt, 1, buf, GUC_KLV_LEN_MIN + num_dwords);
+}
+
 static int pf_update_policy_bool(struct xe_gt *gt, u16 key, bool *policy, bool value)
 {
 	int err;
@@ -397,6 +414,17 @@ static void pf_sched_group_media_slices(struct xe_gt *gt, struct guc_sched_group
 	if (group < 2)
 		return;
 
+	/*
+	 * If we have more groups than the GuC can support then we don't want to
+	 * expose this specific mode, because the GuC will return an error if we
+	 * try to enable it.
+	 */
+	if (group > gt->sriov.pf.policy.guc.sched_groups.max_groups) {
+		xe_gt_sriov_notice(gt, "media_slice mode has too many groups: %u vs %u\n",
+				   group, gt->sriov.pf.policy.guc.sched_groups.max_groups);
+		return;
+	}
+
 	/* The GuC expects an array with a guc_sched_group entry for each group */
 	values = drmm_kcalloc(&gt_to_xe(gt)->drm, group, sizeof(struct guc_sched_group),
 			      GFP_KERNEL);
@@ -459,6 +487,15 @@ static void pf_init_sched_groups(struct xe_gt *gt)
 	if (!xe_sriov_gt_pf_policy_has_sched_groups_support(gt))
 		return;
 
+	/*
+	 * The GuC interface supports up to 8 groups. However, the GuC only
+	 * fully allocates resources for a subset of groups, based on the number
+	 * of engines and expected usage. The plan is for this to become
+	 * queryable via H2G, but for now GuC FW for all devices supports a
+	 * maximum of 2 groups so we can just hardcode that.
+	 */
+	gt->sriov.pf.policy.guc.sched_groups.max_groups = 2;
+
 	for (m = XE_SRIOV_SCHED_GROUPS_DISABLED + 1; m < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; m++) {
 		u32 *num_groups = &gt->sriov.pf.policy.guc.sched_groups.modes[m].num_groups;
 		struct guc_sched_group **groups =
@@ -484,14 +521,129 @@ static void pf_init_sched_groups(struct xe_gt *gt)
 		}
 
 		xe_gt_assert(gt, *num_groups < GUC_MAX_SCHED_GROUPS);
+
+		if (*num_groups)
+			gt->sriov.pf.policy.guc.sched_groups.supported_modes |= BIT(m);
 	}
 }
 
+/**
+ * xe_sriov_gt_pf_policy_has_multi_group_modes() - check whether the GT supports
+ * any scheduler modes that have multiple groups
+ * @gt: the &xe_gt to check
+ *
+ * This function can only be called on PF.
+ *
+ * Return: true if the GT supports modes with multiple groups, false otherwise.
+ */
+bool xe_sriov_gt_pf_policy_has_multi_group_modes(struct xe_gt *gt)
+{
+	return gt->sriov.pf.policy.guc.sched_groups.supported_modes;
+}
+
+/**
+ * xe_sriov_gt_pf_policy_has_sched_group_mode() - check whether the GT supports
+ * a specific scheduler group mode
+ * @gt: the &xe_gt to check
+ * @mode: the mode to check
+ *
+ * This function can only be called on PF.
+ *
+ * Return: true if the GT supports the specified mode, false otherwise.
+ */
+bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt,
+						enum xe_sriov_sched_group_modes mode)
+{
+	if (mode == XE_SRIOV_SCHED_GROUPS_DISABLED)
+		return true;
+
+	return gt->sriov.pf.policy.guc.sched_groups.supported_modes & BIT(mode);
+}
+
+static int __pf_provision_sched_groups(struct xe_gt *gt, enum xe_sriov_sched_group_modes mode)
+{
+	struct guc_sched_group *groups = gt->sriov.pf.policy.guc.sched_groups.modes[mode].groups;
+	u32 num_groups = gt->sriov.pf.policy.guc.sched_groups.modes[mode].num_groups;
+
+	return pf_push_policy_payload(gt, GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_KEY,
+				      groups, num_groups * GUC_MAX_ENGINE_CLASSES);
+}
+
+static int pf_provision_sched_groups(struct xe_gt *gt, enum xe_sriov_sched_group_modes mode)
+{
+	int err;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
+	if (!xe_sriov_gt_pf_policy_has_sched_group_mode(gt, mode))
+		return -EINVAL;
+
+	/* already in the desired mode */
+	if (gt->sriov.pf.policy.guc.sched_groups.current_mode == mode)
+		return 0;
+
+	/*
+	 * We don't allow changing this with VFs active since it is hard for
+	 * VFs to check.
+	 */
+	if (xe_sriov_pf_num_vfs(gt_to_xe(gt)))
+		return -EBUSY;
+
+	err = __pf_provision_sched_groups(gt, mode);
+	if (err)
+		return err;
+
+	gt->sriov.pf.policy.guc.sched_groups.current_mode = mode;
+
+	return 0;
+}
+
+static int pf_reprovision_sched_groups(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
+	/* We only have something to provision if we have possible groups */
+	if (!xe_sriov_gt_pf_policy_has_multi_group_modes(gt))
+		return 0;
+
+	return __pf_provision_sched_groups(gt, gt->sriov.pf.policy.guc.sched_groups.current_mode);
+}
+
+static void pf_sanitize_sched_groups(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
+	gt->sriov.pf.policy.guc.sched_groups.current_mode = XE_SRIOV_SCHED_GROUPS_DISABLED;
+}
+
+/**
+ * xe_gt_sriov_pf_policy_set_sched_groups_mode() - Control the 'sched_groups' policy.
+ * @gt: the &xe_gt where to apply the policy
+ * @value: the sched_group mode to be activated
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt,
+						enum xe_sriov_sched_group_modes mode)
+{
+	if (!xe_sriov_gt_pf_policy_has_multi_group_modes(gt))
+		return -ENODEV;
+
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+	return pf_provision_sched_groups(gt, mode);
+}
+
 static void pf_sanitize_guc_policies(struct xe_gt *gt)
 {
 	pf_sanitize_sched_if_idle(gt);
 	pf_sanitize_reset_engine(gt);
 	pf_sanitize_sample_period(gt);
+	pf_sanitize_sched_groups(gt);
 }
 
 /**
@@ -530,6 +682,7 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
 	err |= pf_reprovision_sched_if_idle(gt);
 	err |= pf_reprovision_reset_engine(gt);
 	err |= pf_reprovision_sample_period(gt);
+	err |= pf_reprovision_sched_groups(gt);
 	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
 	xe_pm_runtime_put(gt_to_xe(gt));
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
index f5e3b2595063..d6e96302ff68 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
@@ -8,6 +8,8 @@
 
 #include <linux/types.h>
 
+#include "xe_gt_sriov_pf_policy_types.h"
+
 struct drm_printer;
 struct xe_gt;
 
@@ -18,6 +20,11 @@ bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
 int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
 u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
 bool xe_sriov_gt_pf_policy_has_sched_groups_support(struct xe_gt *gt);
+bool xe_sriov_gt_pf_policy_has_multi_group_modes(struct xe_gt *gt);
+bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt,
+						enum xe_sriov_sched_group_modes mode);
+int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt,
+						enum xe_sriov_sched_group_modes mode);
 
 void xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
 void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
index 11527ab1db7a..97d278190521 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
@@ -24,6 +24,9 @@ enum xe_sriov_sched_group_modes {
 
 /**
  * struct xe_gt_sriov_scheduler_groups - Scheduler groups policy info
+ * @max_groups: max number of groups supported by the GuC for the platform
+ * @supported_modes: mask of supported modes
+ * @current_mode: active scheduler groups mode
  * @modes: array of masks and their number for each mode
  * @modes.groups: array of engine instance groups in given mode, with each group
  *                consisting of GUC_MAX_ENGINE_CLASSES engine instances masks. A
@@ -33,6 +36,9 @@ enum xe_sriov_sched_group_modes {
  *                    are in the same group.
  */
 struct xe_gt_sriov_scheduler_groups {
+	u8 max_groups;
+	u32 supported_modes;
+	enum xe_sriov_sched_group_modes current_mode;
 	struct {
 		struct guc_sched_group *groups;
 		u32 num_groups;
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
index 146a6eda9e06..1b08b443606e 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -26,6 +26,8 @@ const char *xe_guc_klv_key_to_string(u16 key)
 		return "sched_if_idle";
 	case GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY:
 		return "sample_period";
+	case GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_KEY:
+		return "engine_group_config";
 	case GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY:
 		return "reset_engine";
 	/* VF CFG keys */
-- 
2.43.0

