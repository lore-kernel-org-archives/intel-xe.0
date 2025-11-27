Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C8CD116E6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 01:45:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A17510E0A5;
	Thu, 27 Nov 2025 01:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BzHcV8Se";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310CA10E723
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 01:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764207930; x=1795743930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QezSfO6lVhotHSnytak36CSYMaiD/1J6zH9TnObisdw=;
 b=BzHcV8Se6ndTAptIoPjkAXOi5AIFFkwtvKIt3ZsLTGZfBW1X5r5zvZ6A
 SeT2gf8ZyuLPy1GOc2XaxCRcGtzR4HuP6/FVro0SRqmJkQCkHfrcLVTt+
 vhWf5U4k1hJaQxK7mupGHUTW3s75jmWYLWHVTXrxopttLtT5PEwd9ei2F
 v66Bp5T/rNsGQaZxWkFvPSqkvRKupUFcG/oamk/pxNkzn/o6x41c/G+ua
 uz02OCVzCNO5nlGxBqJlH4C8yIScjXmlfiCWM75aGwoYEyPkXz8VaN5k3
 ZrDueOAzx7IYH2xtBBeTjfpUeSdPdbDqLqFIyu2dw46zkjskru/vqjhdO w==;
X-CSE-ConnectionGUID: ETl+rIOpRDyJuHjHQ5d8Jg==
X-CSE-MsgGUID: TchOSO3vRZykLIS6d2Nj4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70114854"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="70114854"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 17:45:26 -0800
X-CSE-ConnectionGUID: dCqBKtPiScOoB0yVJXn/Nw==
X-CSE-MsgGUID: ddXOzkC9Sy2p4mZ5ykib9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="192753365"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 17:45:21 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 03/10] drm/xe/sriov: Add support for enabling scheduler groups
Date: Wed, 26 Nov 2025 17:45:09 -0800
Message-ID: <20251127014507.2323746-15-daniele.ceraolospurio@intel.com>
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

Schedler groups are enabled by sending a specific policy configuration
KLV to the GuC. We don't allow changing this policy if there are VF
active, since the expectation is that the VF will only check if the
feature is enabled during driver initialization.

The functions added by this patch will be used by sysfs/debugfs, coming
in follow up patches.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  17 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 129 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |   1 +
 .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |   1 +
 4 files changed, 148 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 265a135e7061..274f1b1ec37f 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -200,6 +200,20 @@ enum  {
  *      :0: adverse events are not counted (default)
  *      :n: sample period in milliseconds
  *
+ * _`GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG` : 0x8004
+ *      Ths config allows the PF to split the engines across scheduling groups.
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
+#define GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT	8
+
 #define GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY	0x8D00
 #define GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_LEN	1u
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index 9b878578ea90..48f250ae0d0d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -97,6 +97,25 @@ static int pf_push_policy_u32(struct xe_gt *gt, u16 key, u32 value)
 	return pf_push_policy_klvs(gt, 1, klv, ARRAY_SIZE(klv));
 }
 
+static int pf_push_policy_payload(struct xe_gt *gt, u16 key, u32 *payload, u32 num_dwords)
+{
+	u32 *klv;
+	int err;
+
+	klv = kzalloc((num_dwords + 1) * sizeof(u32), GFP_KERNEL);
+	if (!klv)
+		return -ENOMEM;
+
+	klv[0] = PREP_GUC_KLV(key, num_dwords);
+	if (num_dwords)
+		memcpy(&klv[1], payload, num_dwords * sizeof(u32));
+
+	err = pf_push_policy_klvs(gt, 1, klv, num_dwords + 1);
+
+	kfree(klv);
+	return err;
+}
+
 static int pf_update_policy_bool(struct xe_gt *gt, u16 key, bool *policy, bool value)
 {
 	int err;
@@ -444,6 +463,7 @@ static int pf_init_sched_groups(struct xe_gt *gt)
 	for (m = 0; m < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; m++) {
 		u32 *masks = NULL;
 		u32 num_masks = 0;
+		u32 num_groups = 0;
 
 		switch (m) {
 		case XE_SRIOV_SCHED_GROUPS_NONE:
@@ -463,6 +483,13 @@ static int pf_init_sched_groups(struct xe_gt *gt)
 
 		xe_gt_assert(gt, (num_masks % GUC_MAX_ENGINE_CLASSES) == 0);
 
+		num_groups = num_masks / GUC_MAX_ENGINE_CLASSES;
+		if (num_groups > GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT) {
+			xe_gt_sriov_err(gt, "too many groups (%u) for sched group mode %u\n",
+					num_groups, m);
+			return -EINVAL;
+		}
+
 		if ((m == XE_SRIOV_SCHED_GROUPS_NONE) || num_masks)
 			gt->sriov.pf.policy.guc.sched_groups.supported_modes |= BIT(m);
 
@@ -473,11 +500,112 @@ static int pf_init_sched_groups(struct xe_gt *gt)
 	return 0;
 }
 
+static bool
+pf_policy_has_sched_group_modes(struct xe_gt *gt, unsigned long mask)
+{
+	return gt->sriov.pf.policy.guc.sched_groups.supported_modes & mask;
+}
+
+static bool pf_policy_has_valid_sched_group_modes(struct xe_gt *gt)
+{
+	return pf_policy_has_sched_group_modes(gt, ~BIT(XE_SRIOV_SCHED_GROUPS_NONE));
+}
+
+static bool pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode)
+{
+	return pf_policy_has_sched_group_modes(gt, BIT(mode));
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
+	if (!pf_policy_has_sched_group_mode(gt, mode))
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
+		return -EPERM;
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
+	if (!pf_policy_has_valid_sched_group_modes(gt))
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
+ * xe_gt_sriov_pf_policy_set_sched_groups_mode - Control the 'sched_groups' policy.
+ * @gt: the &xe_gt where to apply the policy
+ * @value: the sched_group mode to be activated (see enum xe_sriov_sched_group_modes)
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value)
+{
+	int err;
+
+	if (!(pf_policy_has_valid_sched_group_modes(gt)))
+		return -ENODEV;
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	err = pf_provision_sched_groups(gt, value);
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return err;
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
@@ -516,6 +644,7 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
 	err |= pf_reprovision_sched_if_idle(gt);
 	err |= pf_reprovision_reset_engine(gt);
 	err |= pf_reprovision_sample_period(gt);
+	err |= pf_reprovision_sched_groups(gt);
 	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
 	xe_pm_runtime_put(gt_to_xe(gt));
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
index c9c04d1b7f50..36680996f2bd 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
@@ -17,6 +17,7 @@ int xe_gt_sriov_pf_policy_set_reset_engine(struct xe_gt *gt, bool enable);
 bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
 int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
 u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
+int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);
 
 int xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
 void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
index 3b915801c01b..5d44d23a5ed4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
@@ -27,6 +27,7 @@ struct xe_gt_sriov_guc_policies {
 	u32 sample_period;
 	struct {
 		u32 supported_modes;
+		enum xe_sriov_sched_group_modes current_mode;
 		struct {
 			u32 *masks;
 			u32 num_masks;
-- 
2.43.0

