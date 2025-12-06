Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6AFD3B7E1
	for <intel-xe@archiver.kernel.org>; Sat,  6 Dec 2025 23:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9D610E312;
	Sat,  6 Dec 2025 23:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qj9FpIlN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA88F10E312
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Dec 2025 23:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765062255; x=1796598255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yAky1tLSgT1p+5VS0dPFa6riszPvbi/Rk6pz/jhxna0=;
 b=Qj9FpIlNf10Lv+SUtgd/Z7dQTTZbt3NIt3/3YkbU9bsm+5wc2LRjB0qu
 Z44sfPlYxokcuvCn1gbXKjY8gLfx37kFGmLYxOuNj4Jnxjm+GI0FmVSQL
 5Nrsd9718ctnNWsDQWzwwGMnfAPDJOaZnjJ0iofmZsWEOmit4MLWf+Jtn
 M3Ui4vcgQwbH4deRmlpiJ6aFG2sSH135bdNTyWiN/9ETKhJ+JCK48B572
 efIk8uC71Tn3YcYbXTg1XxvLs+tXuxucqRYQII2jIxkavVQ3uUztas1qK
 CpKzTZpD64ZVwdDUc1+cyLL+CII5FV+JWax8QYb60YVjzfS+ZLgG3WYzz g==;
X-CSE-ConnectionGUID: nA9LU7PWRyCowrGSVJQe0A==
X-CSE-MsgGUID: K1pszWzrRLSNBDY/pWanew==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="78411684"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; d="scan'208";a="78411684"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2025 15:04:15 -0800
X-CSE-ConnectionGUID: qY4UybueSLSzXmGuV9qAIg==
X-CSE-MsgGUID: mw+nn5MJT5uqR/zZwyzG6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; d="scan'208";a="200045502"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2025 15:04:12 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 03/11] drm/xe/sriov: Add support for enabling scheduler
 groups
Date: Sat,  6 Dec 2025 15:03:59 -0800
Message-ID: <20251206230356.3600292-16-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
References: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
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

The functions added by this patch will be used by sysfs/debugfs, coming
in follow up patches.

v2: code improvements, add GUC_MAX_SCHED_GROUPS define, don't add
    XE_SRIOV_SCHED_GROUPS_NONE to supported_modes (Michal)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  17 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 136 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |   3 +
 .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |   4 +
 drivers/gpu/drm/xe/xe_guc_fwif.h              |   2 +
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c       |   2 +
 6 files changed, 164 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 265a135e7061..45733a87183a 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -200,6 +200,20 @@ enum  {
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
@@ -214,6 +228,9 @@ enum  {
 #define GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY	0x8002
 #define GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_LEN	1u
 
+#define GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_KEY	0x8004
+#define GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT	8u
+
 #define GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY	0x8D00
 #define GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_LEN	1u
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index 158d68aff4b7..1109fec99fc3 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -97,6 +97,23 @@ static int pf_push_policy_u32(struct xe_gt *gt, u16 key, u32 value)
 	return pf_push_policy_klvs(gt, 1, klv, ARRAY_SIZE(klv));
 }
 
+static int pf_push_policy_payload(struct xe_gt *gt, u16 key, u32 *payload, u32 num_dwords)
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
@@ -476,16 +493,134 @@ static void pf_init_sched_groups(struct xe_gt *gt)
 
 		xe_gt_assert(gt, (num_masks % GUC_MAX_ENGINE_CLASSES) == 0);
 
+		xe_gt_assert(gt, num_masks / GUC_MAX_ENGINE_CLASSES < GUC_MAX_SCHED_GROUPS);
+
+		if (num_masks)
+			gt->sriov.pf.policy.guc.sched_groups.supported_modes |= BIT(m);
+
 		gt->sriov.pf.policy.guc.sched_groups.modes[m].masks = masks;
 		gt->sriov.pf.policy.guc.sched_groups.modes[m].num_masks = num_masks;
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
+bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode)
+{
+	if (mode == XE_SRIOV_SCHED_GROUPS_NONE)
+		return true;
+
+	return gt->sriov.pf.policy.guc.sched_groups.supported_modes & BIT(mode);
+}
+
+static int __pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
+{
+	u32 *masks = gt->sriov.pf.policy.guc.sched_groups.modes[mode].masks;
+	u32 num_masks = gt->sriov.pf.policy.guc.sched_groups.modes[mode].num_masks;
+
+	xe_gt_assert(gt, (num_masks % GUC_MAX_ENGINE_CLASSES) == 0);
+
+	return pf_push_policy_payload(gt, GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_KEY,
+				      masks, num_masks);
+}
+
+static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
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
+	gt->sriov.pf.policy.guc.sched_groups.current_mode = XE_SRIOV_SCHED_GROUPS_NONE;
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
+						enum xe_sriov_sched_group_modes value)
+{
+	if (!xe_sriov_gt_pf_policy_has_multi_group_modes(gt))
+		return -ENODEV;
+
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+	return pf_provision_sched_groups(gt, value);
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
@@ -524,6 +659,7 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
 	err |= pf_reprovision_sched_if_idle(gt);
 	err |= pf_reprovision_reset_engine(gt);
 	err |= pf_reprovision_sample_period(gt);
+	err |= pf_reprovision_sched_groups(gt);
 	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
 	xe_pm_runtime_put(gt_to_xe(gt));
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
index 52312d24d527..6b3e294bc934 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
@@ -17,6 +17,9 @@ int xe_gt_sriov_pf_policy_set_reset_engine(struct xe_gt *gt, bool enable);
 bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
 int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
 u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
+bool xe_sriov_gt_pf_policy_has_multi_group_modes(struct xe_gt *gt);
+bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode);
+int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);
 
 void xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
 void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
index 1d4cdc87e069..d9928c200d72 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
@@ -23,12 +23,16 @@ enum xe_sriov_sched_group_modes {
 /**
  * struct xe_gt_sriov_scheduler_groups - Scheduler groups policy info
  * @max_num_of_groups: number of groups supported by the GuC for the platform
+ * @supported_modes: mask of supported modes
+ * @current_mode: active scheduler groups mode
  * @modes: array of masks and their number for each mode
  * @modes.masks: array of masks for a given mode
  * @modes.num_masks: number of masks in the array
  */
 struct xe_gt_sriov_scheduler_groups {
 	u8 max_num_of_groups;
+	u32 supported_modes;
+	enum xe_sriov_sched_group_modes current_mode;
 	struct {
 		u32 *masks;
 		u32 num_masks;
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 7d93c2749485..c2e0a2dae586 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -46,6 +46,8 @@
 #define GUC_MAX_ENGINE_CLASSES		16
 #define GUC_MAX_INSTANCES_PER_CLASS	32
 
+#define GUC_MAX_SCHED_GROUPS GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT
+
 #define GUC_CONTEXT_NORMAL			0
 #define GUC_CONTEXT_COMPRESSION_SAVE		1
 #define GUC_CONTEXT_COMPRESSION_RESTORE	2
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

