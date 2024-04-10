Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32836CD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 12:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D0310F888;
	Wed, 10 Apr 2024 12:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fQlKlFzd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE4010F888
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 12:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712752303; x=1744288303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JK/xrfQGT03gXFJ/SE8xRJlAKJ4Er4OYLIxeS0ybHKQ=;
 b=fQlKlFzdsdZA4CZ0MuifvPMWK8DrkjG3iPs1CPjSxKHDqu8uCjlcGL+h
 8a3s9Ktz+8LA91zftplq0BsDKoaS2HPPtqqR0nD5Q1TEfnfEEnu5S2epF
 m9DC/dVPrNQl8x2m5DV8yjCijdXpX1Y8QM9StmreOoaLGf/SZmM8ATlvH
 nNBBCCQ1JxoBLPqWRzwShW2m8sL19d0Iw6pDhEHFP+ZHPsM6hi3kOeP8q
 650rNTrG7PJ8gbV1yjNlwR1HdhrOg+96dllvg1YP4m1qM8HH6HDEeqO9n
 Q6cH5nkBNsbP+D6HE09cFYWop1ljDPDbSAw77MlKhUOHFc5UYXGZYFdvz Q==;
X-CSE-ConnectionGUID: P4yDBCK/Sq+OQbClBqu0MQ==
X-CSE-MsgGUID: LFWJIlJwSiaHj5sK1n/t0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8212419"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8212419"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 05:31:43 -0700
X-CSE-ConnectionGUID: mZyaIjkKTISFQwjAM2RlYg==
X-CSE-MsgGUID: EOwEHPp3QNm6o8CoSFYdGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="57986376"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.42.161])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 05:31:42 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 5/5] drm/xe/pf: Add support to configure GuC SR-IOV policies
Date: Wed, 10 Apr 2024 14:31:25 +0200
Message-Id: <20240410123125.1155-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240410123125.1155-1-michal.wajdeczko@intel.com>
References: <20240410123125.1155-1-michal.wajdeczko@intel.com>
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

There are few knobs inside GuC firmware to control VFs scheduling.
Add basic functions to support their reconfigurations.
We will start using them shortly once we prepare debugfs.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 417 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |  25 ++
 .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |  31 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |  21 +
 drivers/gpu/drm/xe/xe_gt_types.h              |   7 +
 6 files changed, 502 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index ad238f48cf51..3efec3315044 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -158,6 +158,7 @@ xe-y += \
 
 xe-$(CONFIG_PCI_IOV) += \
 	xe_gt_sriov_pf_control.o \
+	xe_gt_sriov_pf_policy.o \
 	xe_lmtt.o \
 	xe_lmtt_2l.o \
 	xe_lmtt_ml.o \
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
new file mode 100644
index 000000000000..5d38358e6882
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -0,0 +1,417 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#include "abi/guc_actions_sriov_abi.h"
+
+#include "xe_bo.h"
+#include "xe_gt.h"
+#include "xe_gt_sriov_pf_helpers.h"
+#include "xe_gt_sriov_pf_policy.h"
+#include "xe_gt_sriov_printk.h"
+#include "xe_guc_ct.h"
+#include "xe_guc_klv_helpers.h"
+
+/*
+ * Return: number of KLVs that were successfully parsed and saved,
+ *         negative error code on failure.
+ */
+static int guc_action_update_vgt_policy(struct xe_guc *guc, u64 addr, u32 size)
+{
+	u32 request[] = {
+		GUC_ACTION_PF2GUC_UPDATE_VGT_POLICY,
+		lower_32_bits(addr),
+		upper_32_bits(addr),
+		size,
+	};
+
+	return xe_guc_ct_send_block(&guc->ct, request, ARRAY_SIZE(request));
+}
+
+/*
+ * Return: number of KLVs that were successfully parsed and saved,
+ *         negative error code on failure.
+ */
+static int pf_send_policy_klvs(struct xe_gt *gt, const u32 *klvs, u32 num_dwords)
+{
+	const u32 bytes = num_dwords * sizeof(u32);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_guc *guc = &gt->uc.guc;
+	struct xe_bo *bo;
+	int ret;
+
+	bo = xe_bo_create_pin_map(xe, tile, NULL,
+				  ALIGN(bytes, PAGE_SIZE),
+				  ttm_bo_type_kernel,
+				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+				  XE_BO_FLAG_GGTT);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
+
+	iosys_map_memcpy_to(&bo->vmap, 0, klvs, bytes);
+
+	ret = guc_action_update_vgt_policy(guc, xe_bo_ggtt_addr(bo), num_dwords);
+
+	xe_bo_unpin_map_no_vm(bo);
+
+	return ret;
+}
+
+/*
+ * Return: 0 on success, -ENOKEY if some KLVs were not updated, -EPROTO if reply was malformed,
+ *         negative error code on failure.
+ */
+static int pf_push_policy_klvs(struct xe_gt *gt, u32 num_klvs,
+			       const u32 *klvs, u32 num_dwords)
+{
+	int ret;
+
+	xe_gt_assert(gt, num_klvs == xe_guc_klv_count(klvs, num_dwords));
+
+	ret = pf_send_policy_klvs(gt, klvs, num_dwords);
+
+	if (ret != num_klvs) {
+		int err = ret < 0 ? ret : ret < num_klvs ? -ENOKEY : -EPROTO;
+		struct drm_printer p = xe_gt_info_printer(gt);
+
+		xe_gt_sriov_notice(gt, "Failed to push %u policy KLV%s (%pe)\n",
+				   num_klvs, str_plural(num_klvs), ERR_PTR(err));
+		xe_guc_klv_print(klvs, num_dwords, &p);
+		return err;
+	}
+
+	return 0;
+}
+
+static int pf_push_policy_u32(struct xe_gt *gt, u16 key, u32 value)
+{
+	u32 klv[] = {
+		PREP_GUC_KLV(key, 1),
+		value,
+	};
+
+	return pf_push_policy_klvs(gt, 1, klv, ARRAY_SIZE(klv));
+}
+
+static int pf_update_policy_bool(struct xe_gt *gt, u16 key, bool *policy, bool value)
+{
+	int err;
+
+	err = pf_push_policy_u32(gt, key, value);
+	if (unlikely(err)) {
+		xe_gt_sriov_notice(gt, "Failed to update policy %#x '%s' to '%s' (%pe)\n",
+				   key, xe_guc_klv_key_to_string(key),
+				   str_enabled_disabled(value), ERR_PTR(err));
+		return err;
+	}
+
+	xe_gt_sriov_dbg(gt, "policy key %#x '%s' updated to '%s'\n",
+			key, xe_guc_klv_key_to_string(key),
+			str_enabled_disabled(value));
+
+	*policy = value;
+	return 0;
+}
+
+static int pf_update_policy_u32(struct xe_gt *gt, u16 key, u32 *policy, u32 value)
+{
+	int err;
+
+	err = pf_push_policy_u32(gt, key, value);
+	if (unlikely(err)) {
+		xe_gt_sriov_notice(gt, "Failed to update policy %#x '%s' to '%s' (%pe)\n",
+				   key, xe_guc_klv_key_to_string(key),
+				   str_enabled_disabled(value), ERR_PTR(err));
+		return err;
+	}
+
+	xe_gt_sriov_dbg(gt, "policy key %#x '%s' updated to %u\n",
+			key, xe_guc_klv_key_to_string(key), value);
+
+	*policy = value;
+	return 0;
+}
+
+static int pf_provision_sched_if_idle(struct xe_gt *gt, bool enable)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
+	return pf_update_policy_bool(gt, GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY,
+				     &gt->sriov.pf.policy.guc.sched_if_idle,
+				     enable);
+}
+
+static int pf_reprovision_sched_if_idle(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
+	return pf_provision_sched_if_idle(gt, gt->sriov.pf.policy.guc.sched_if_idle);
+}
+
+static void pf_sanitize_sched_if_idle(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
+	gt->sriov.pf.policy.guc.sched_if_idle = false;
+}
+
+/**
+ * xe_gt_sriov_pf_policy_set_sched_if_idle - Control the 'sched_if_idle' policy.
+ * @gt: the &xe_gt where to apply the policy
+ * @enable: the value of the 'sched_if_idle' policy
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_policy_set_sched_if_idle(struct xe_gt *gt, bool enable)
+{
+	int err;
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	err = pf_provision_sched_if_idle(gt, enable);
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return err;
+}
+
+/**
+ * xe_gt_sriov_pf_policy_get_sched_if_idle - Retrieve value of 'sched_if_idle' policy.
+ * @gt: the &xe_gt where to read the policy from
+ *
+ * This function can only be called on PF.
+ *
+ * Return: value of 'sched_if_idle' policy.
+ */
+bool xe_gt_sriov_pf_policy_get_sched_if_idle(struct xe_gt *gt)
+{
+	bool enable;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	enable = gt->sriov.pf.policy.guc.sched_if_idle;
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return enable;
+}
+
+static int pf_provision_reset_engine(struct xe_gt *gt, bool enable)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
+	return pf_update_policy_bool(gt, GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY,
+				     &gt->sriov.pf.policy.guc.reset_engine, enable);
+}
+
+static int pf_reprovision_reset_engine(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
+	return pf_provision_reset_engine(gt, gt->sriov.pf.policy.guc.reset_engine);
+}
+
+static void pf_sanitize_reset_engine(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
+	gt->sriov.pf.policy.guc.reset_engine = false;
+}
+
+/**
+ * xe_gt_sriov_pf_policy_set_reset_engine - Control the 'reset_engine' policy.
+ * @gt: the &xe_gt where to apply the policy
+ * @enable: the value of the 'reset_engine' policy
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_policy_set_reset_engine(struct xe_gt *gt, bool enable)
+{
+	int err;
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	err = pf_provision_reset_engine(gt, enable);
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return err;
+}
+
+/**
+ * xe_gt_sriov_pf_policy_get_reset_engine - Retrieve value of 'reset_engine' policy.
+ * @gt: the &xe_gt where to read the policy from
+ *
+ * This function can only be called on PF.
+ *
+ * Return: value of 'reset_engine' policy.
+ */
+bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt)
+{
+	bool enable;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	enable = gt->sriov.pf.policy.guc.reset_engine;
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return enable;
+}
+
+static int pf_provision_sample_period(struct xe_gt *gt, u32 value)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
+	return pf_update_policy_u32(gt, GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY,
+				    &gt->sriov.pf.policy.guc.sample_period, value);
+}
+
+static int pf_reprovision_sample_period(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
+	return pf_provision_sample_period(gt, gt->sriov.pf.policy.guc.sample_period);
+}
+
+static void pf_sanitize_sample_period(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
+
+	gt->sriov.pf.policy.guc.sample_period = 0;
+}
+
+/**
+ * xe_gt_sriov_pf_policy_set_sample_period - Control the 'sample_period' policy.
+ * @gt: the &xe_gt where to apply the policy
+ * @value: the value of the 'sample_period' policy
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value)
+{
+	int err;
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	err = pf_provision_sample_period(gt, value);
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return err;
+}
+
+/**
+ * xe_gt_sriov_pf_policy_get_sample_period - Retrieve value of 'sample_period' policy.
+ * @gt: the &xe_gt where to read the policy from
+ *
+ * This function can only be called on PF.
+ *
+ * Return: value of 'sample_period' policy.
+ */
+u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt)
+{
+	u32 value;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	value = gt->sriov.pf.policy.guc.sample_period;
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return value;
+}
+
+static void pf_sanitize_guc_policies(struct xe_gt *gt)
+{
+	pf_sanitize_sched_if_idle(gt);
+	pf_sanitize_reset_engine(gt);
+	pf_sanitize_sample_period(gt);
+}
+
+/**
+ * xe_gt_sriov_pf_policy_sanitize - Reset policy settings.
+ * @gt: the &xe_gt
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt)
+{
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	pf_sanitize_guc_policies(gt);
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+}
+
+/**
+ * xe_gt_sriov_pf_policy_reprovision - Reprovision (and optionally reset) policy settings.
+ * @gt: the &xe_gt
+ * @reset: if true will reprovision using default values instead of latest
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
+{
+	int err = 0;
+
+	xe_device_mem_access_get(gt_to_xe(gt));
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	if (reset)
+		pf_sanitize_guc_policies(gt);
+	err |= pf_reprovision_sched_if_idle(gt);
+	err |= pf_reprovision_reset_engine(gt);
+	err |= pf_reprovision_sample_period(gt);
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	xe_device_mem_access_get(gt_to_xe(gt));
+
+	return err ? -ENXIO : 0;
+}
+
+static void print_guc_policies(struct drm_printer *p, struct xe_gt_sriov_guc_policies *policy)
+{
+	drm_printf(p, "%s:\t%s\n",
+		   xe_guc_klv_key_to_string(GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY),
+		   str_enabled_disabled(policy->sched_if_idle));
+	drm_printf(p, "%s:\t%s\n",
+		   xe_guc_klv_key_to_string(GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY),
+		   str_enabled_disabled(policy->reset_engine));
+	drm_printf(p, "%s:\t%u %s\n",
+		   xe_guc_klv_key_to_string(GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY),
+		   policy->sample_period, policy->sample_period ? "ms" : "(disabled)");
+}
+
+/**
+ * xe_gt_sriov_pf_policy_print - Dump actual policy values.
+ * @gt: the &xe_gt where to read the policy from
+ * @p: the &drm_printer
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_policy_print(struct xe_gt *gt, struct drm_printer *p)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+
+	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	print_guc_policies(p, &gt->sriov.pf.policy.guc);
+	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
new file mode 100644
index 000000000000..2a5dc33dc6d7
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#ifndef _XE_GT_SRIOV_PF_POLICY_H_
+#define _XE_GT_SRIOV_PF_POLICY_H_
+
+#include <linux/types.h>
+
+struct drm_printer;
+struct xe_gt;
+
+int xe_gt_sriov_pf_policy_set_sched_if_idle(struct xe_gt *gt, bool enable);
+bool xe_gt_sriov_pf_policy_get_sched_if_idle(struct xe_gt *gt);
+int xe_gt_sriov_pf_policy_set_reset_engine(struct xe_gt *gt, bool enable);
+bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
+int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
+u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
+
+void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
+int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset);
+int xe_gt_sriov_pf_policy_print(struct xe_gt *gt, struct drm_printer *p);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
new file mode 100644
index 000000000000..4de532af135e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#ifndef _XE_GT_SRIOV_PF_POLICY_TYPES_H_
+#define _XE_GT_SRIOV_PF_POLICY_TYPES_H_
+
+#include <linux/types.h>
+
+/**
+ * struct xe_gt_sriov_guc_policies - GuC SR-IOV policies.
+ * @sched_if_idle: controls strict scheduling policy.
+ * @reset_engine: controls engines reset on VF switch policy.
+ * @sample_period: adverse events sampling period (in milliseconds).
+ */
+struct xe_gt_sriov_guc_policies {
+	bool sched_if_idle;
+	bool reset_engine;
+	u32 sample_period;
+};
+
+/**
+ * struct xe_gt_sriov_pf_policy - PF policy data.
+ * @guc: GuC scheduling policies.
+ */
+struct xe_gt_sriov_pf_policy {
+	struct xe_gt_sriov_guc_policies guc;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
new file mode 100644
index 000000000000..768277b8bc95
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023-2024 Intel Corporation
+ */
+
+#ifndef _XE_GT_SRIOV_PF_TYPES_H_
+#define _XE_GT_SRIOV_PF_TYPES_H_
+
+#include <linux/types.h>
+
+#include "xe_gt_sriov_pf_policy_types.h"
+
+/**
+ * struct xe_gt_sriov_pf - GT level PF virtualization data.
+ * @policy: policy data.
+ */
+struct xe_gt_sriov_pf {
+	struct xe_gt_sriov_pf_policy policy;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 2143dffcaf11..882953d9b87d 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -8,6 +8,7 @@
 
 #include "xe_force_wake_types.h"
 #include "xe_gt_idle_types.h"
+#include "xe_gt_sriov_pf_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_hw_fence_types.h"
 #include "xe_reg_sr_types.h"
@@ -140,6 +141,12 @@ struct xe_gt {
 		u32 adj_offset;
 	} mmio;
 
+	/** @sriov: virtualization data related to GT */
+	union {
+		/** @sriov.pf: PF data. Valid only if driver is running as PF */
+		struct xe_gt_sriov_pf pf;
+	} sriov;
+
 	/**
 	 * @reg_sr: table with registers to be restored on GT init/resume/reset
 	 */
-- 
2.43.0

