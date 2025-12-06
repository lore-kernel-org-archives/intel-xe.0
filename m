Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4AAD3B7E1
	for <intel-xe@archiver.kernel.org>; Sat,  6 Dec 2025 23:04:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E437510E310;
	Sat,  6 Dec 2025 23:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MqwmqWK+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3130010E30F
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Dec 2025 23:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765062250; x=1796598250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HnEwCb18TyY/LE4oGjFnb0NRtfhj1dqus/vquTMDpYQ=;
 b=MqwmqWK+fVSXuoqFSM20a3oPtkAPNslRRj6F7rXlBfhwl1v1ZamXUhjM
 V4wiLfjD+aIf2KysWu3sWk5ULWz/BUaPwdxtkRF5w+eNiVTqtqHBg7HZ9
 bJw/9sKgiXlXyvNmAy2wKs4vgEWMNQkbvgm0P8ehd51KxLESWoHq4f+8S
 0zmqz9z7OTDG4Janknm/uGf3aR7fRUAYp9OwtP2YcuUuROjzstY+uaPNP
 DXpEYL6Nb9OdrZhIAugekQHr768yQDDWPpr8sHpue9JVylBSKtndcQWPH
 fm6Nx7ovW4QgMfvDOS4iZY1vSjL9J8cyZY3SHGSruqLbrN6Tb8GZY6t6o A==;
X-CSE-ConnectionGUID: 7cT7BMwlSa2jM1NsGUMkOQ==
X-CSE-MsgGUID: pJDDoRzjR4CD4E3SUOwR7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="78411680"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; d="scan'208";a="78411680"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2025 15:04:10 -0800
X-CSE-ConnectionGUID: wwLD6yRcRvuCVgOaBIbz9g==
X-CSE-MsgGUID: w+VkJ4ZfR4O8wo45v9nmcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; d="scan'208";a="200045498"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2025 15:04:10 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 02/11] drm/xe/sriov: Initialize scheduler groups
Date: Sat,  6 Dec 2025 15:03:58 -0800
Message-ID: <20251206230356.3600292-15-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
References: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
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

Scheduler groups (a.k.a. Engine Groups Scheduling, or EGS) is a GuC
feature that allows the driver to define groups of engines that are
independently scheduled across VFs, which allows different VFs to be
active on the HW at the same time on different groups. The feature is
available for BMG and newer HW starting on GuC 70.53.0, but some
required fixes have been added to GuC 70.55.1.

This is intended for specific scenarios where the admin knows that the
VFs are not going to fully utilize the HW and therefore assigning all of
it to a single VF would lead to part of it being permanently idle.
We do not allow the admin to decide how to divide the engines across
groups, but we instead support specific configurations that are designed
for specific use-cases. During PF initialization we detect which
configurations are possible on a given GT and create the relevant
groups. Since the GuC expect a mask for each class for each group, that
is what we save when we init the configs.

Right now we only have one use-case on the media GT. If the VFs are
running a frame render + encoding at a not-too-high resolution (e.g.
1080@30fps) the render can produce frames faster than the video engine
can encode them, which means that the maximum number of parallel VFs is
limited by the VCS bandwidth. Since our products can have multiple VCS
engines, allowing multiple VFs to be active on the different VCS engines
at the same time allows us to run more parallel VFs on the same HW.
Given that engines in the same media slice share some resources (e.g.
SFC), we assign each media slice to a different scheduling group. We
refer to this configuration as "media_slices", given that each slice
gets its own group.

Note that while the GuC interface supports a maximum of 8 groups, the
actual number of groups that can be enabled can be lower than that and
can be different on different devices. For now, all devices support up
to 2 groups.

v2: Use asserts for coding errors, code cleanups, better docs (Michal),
    limit groups to 2, limit to BMG and newer, bump required GuC to
    70.55.1.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.h                    |   6 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |   3 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 142 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |   1 +
 .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |  29 ++++
 5 files changed, 181 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 2eeeeeb6b912..0a34e862406e 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -29,6 +29,12 @@
 #define CCS_INSTANCES(gt) __ENGINE_INSTANCES_MASK(gt, CCS)
 #define GSCCS_INSTANCES(gt) __ENGINE_INSTANCES_MASK(gt, GSCCS)
 
+/*
+ * Each media slice has 1x VECS, so the max number of VECS instances gives us
+ * the max number of slices that a GT can have.
+ */
+#define MAX_MEDIA_SLICES hweight32(XE_HW_ENGINE_VECS_MASK)
+
 #define GT_VER(gt) ({ \
 	typeof(gt) gt_ = (gt); \
 	struct xe_device *xe = gt_to_xe(gt_); \
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index 0714c758b9c1..0d97a823e702 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
@@ -14,6 +14,7 @@
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_migration.h"
+#include "xe_gt_sriov_pf_policy.h"
 #include "xe_gt_sriov_pf_service.h"
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc_submit.h"
@@ -123,6 +124,8 @@ int xe_gt_sriov_pf_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	xe_gt_sriov_pf_policy_init(gt);
+
 	err = xe_gt_sriov_pf_migration_init(gt);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index 4445f660e6d1..158d68aff4b7 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -3,6 +3,8 @@
  * Copyright © 2023-2024 Intel Corporation
  */
 
+#include <drm/drm_managed.h>
+
 #include "abi/guc_actions_sriov_abi.h"
 
 #include "xe_bo.h"
@@ -10,6 +12,7 @@
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_policy.h"
 #include "xe_gt_sriov_printk.h"
+#include "xe_guc.h"
 #include "xe_guc_buf.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_klv_helpers.h"
@@ -351,6 +354,133 @@ u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt)
 	return value;
 }
 
+static void pf_sched_group_media_slices(struct xe_gt *gt, u32 **masks, u32 *num_masks)
+{
+	u8 slice_to_group[MAX_MEDIA_SLICES];
+	u32 vecs_mask = VECS_INSTANCES(gt);
+	u32 gsc_mask = GSCCS_INSTANCES(gt);
+	u32 vcs_mask = VCS_INSTANCES(gt);
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	int groups = 0;
+	u32 *values;
+	int slice;
+
+	xe_gt_assert(gt, xe_gt_is_media_type(gt));
+
+	/* A media slice has 2 VCS and a VECS. We bundle the GSC with the first slice */
+	for (slice = 0; slice < MAX_MEDIA_SLICES; slice++) {
+		if ((vcs_mask & 0x3) || (vecs_mask & 0x1) || (gsc_mask & 0x1))
+			slice_to_group[slice] = groups++;
+
+		vcs_mask >>= 2;
+		vecs_mask >>= 1;
+		gsc_mask >>= 1;
+	}
+
+	xe_gt_assert(gt, !vcs_mask);
+	xe_gt_assert(gt, !vecs_mask);
+	xe_gt_assert(gt, !gsc_mask);
+
+	/* We need at least 2 slices to split them up */
+	if (groups < 2)
+		return;
+
+	if (groups > gt->sriov.pf.policy.guc.sched_groups.max_num_of_groups) {
+		xe_gt_sriov_notice(gt, "media_slice mode has too many groups: %u vs %u\n",
+				   groups,
+				   gt->sriov.pf.policy.guc.sched_groups.max_num_of_groups);
+		return;
+	}
+
+	/*
+	 * The GuC expects an array with GUC_MAX_ENGINE_CLASSES entries for
+	 * each group.
+	 */
+	values = drmm_kzalloc(&gt_to_xe(gt)->drm,
+			      GUC_MAX_ENGINE_CLASSES * groups * sizeof(u32),
+			      GFP_KERNEL);
+	if (!values)
+		return;
+
+	for_each_hw_engine(hwe, gt, id) {
+		u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
+		u8 entry;
+
+		switch (hwe->class) {
+		case XE_ENGINE_CLASS_VIDEO_DECODE:
+			slice = hwe->instance / 2;
+			break;
+		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
+			slice = hwe->instance;
+			break;
+		case XE_ENGINE_CLASS_OTHER:
+			slice = 0;
+			break;
+		default:
+			xe_gt_assert_msg(gt, false,
+					 "unknown media gt class %u (%s) during EGS setup\n",
+					 hwe->class, hwe->name);
+			drmm_kfree(&gt_to_xe(gt)->drm, values);
+			return;
+		}
+
+		entry = slice_to_group[slice] * GUC_MAX_ENGINE_CLASSES + guc_class;
+		values[entry] |= BIT(hwe->logical_instance);
+	}
+
+	*masks = values;
+	*num_masks = GUC_MAX_ENGINE_CLASSES * groups;
+}
+
+static void pf_init_sched_groups(struct xe_gt *gt)
+{
+	int m;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+
+	/*
+	 * The GuC supports scheduler groups from v70.53.0, but a fix for it has
+	 * been merged in v70.55.1, so we require the latter. The feature is
+	 * also only enabled on BMG and newer FW.
+	 */
+	if (GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(70, 55, 1) ||
+	    gt_to_xe(gt)->info.platform < XE_BATTLEMAGE)
+		return;
+
+	/*
+	 * The GuC interface supports up to 8 groups. However, the GuC only
+	 * fully allocates resources for a subset of groups, based on the number
+	 * of engines and expected usage. The plan is for this to become
+	 * queryable via H2G, but for now GuC FW for all devices supports a
+	 * maximum of 2 groups so we can just hardcode that.
+	 */
+	gt->sriov.pf.policy.guc.sched_groups.max_num_of_groups = 2;
+
+	for (m = 0; m < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; m++) {
+		u32 *masks = NULL;
+		u32 num_masks = 0;
+
+		switch (m) {
+		case XE_SRIOV_SCHED_GROUPS_NONE:
+			break;
+		case XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES:
+			/* this mode only has groups on the media GT */
+			if (xe_gt_is_media_type(gt))
+				pf_sched_group_media_slices(gt, &masks, &num_masks);
+			break;
+		default:
+			xe_gt_assert_msg(gt, false, "unknown sched group mode %u\n", m);
+			return;
+		}
+
+		xe_gt_assert(gt, (num_masks % GUC_MAX_ENGINE_CLASSES) == 0);
+
+		gt->sriov.pf.policy.guc.sched_groups.modes[m].masks = masks;
+		gt->sriov.pf.policy.guc.sched_groups.modes[m].num_masks = num_masks;
+	}
+}
+
 static void pf_sanitize_guc_policies(struct xe_gt *gt)
 {
 	pf_sanitize_sched_if_idle(gt);
@@ -401,6 +531,18 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
 	return err ? -ENXIO : 0;
 }
 
+/**
+ * xe_gt_sriov_pf_policy_init - Initializes the SW state of the PF policies.
+ * @gt: the &xe_gt
+ *
+ * This function can only be called on PF. This function does not touch the HW,
+ * but must be called after the engines have been initialized.
+ */
+void xe_gt_sriov_pf_policy_init(struct xe_gt *gt)
+{
+	pf_init_sched_groups(gt);
+}
+
 static void print_guc_policies(struct drm_printer *p, struct xe_gt_sriov_guc_policies *policy)
 {
 	drm_printf(p, "%s:\t%s\n",
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
index 2a5dc33dc6d7..52312d24d527 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
@@ -18,6 +18,7 @@ bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
 int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
 u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
 
+void xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
 void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
 int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset);
 int xe_gt_sriov_pf_policy_print(struct xe_gt *gt, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
index 4de532af135e..1d4cdc87e069 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
@@ -8,16 +8,45 @@
 
 #include <linux/types.h>
 
+/**
+ * enum xe_sriov_sched_group_modes - list of possible scheduler group modes
+ * @XE_SRIOV_SCHED_GROUPS_NONE - no separate groups (i.e., all engines in group 0)
+ * @XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES - separate groups for each media slice
+ * @XE_SRIOV_SCHED_GROUPS_MODES_COUNT - number of valid modes
+ */
+enum xe_sriov_sched_group_modes {
+	XE_SRIOV_SCHED_GROUPS_NONE = 0,
+	XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES,
+	XE_SRIOV_SCHED_GROUPS_MODES_COUNT
+};
+
+/**
+ * struct xe_gt_sriov_scheduler_groups - Scheduler groups policy info
+ * @max_num_of_groups: number of groups supported by the GuC for the platform
+ * @modes: array of masks and their number for each mode
+ * @modes.masks: array of masks for a given mode
+ * @modes.num_masks: number of masks in the array
+ */
+struct xe_gt_sriov_scheduler_groups {
+	u8 max_num_of_groups;
+	struct {
+		u32 *masks;
+		u32 num_masks;
+	} modes[XE_SRIOV_SCHED_GROUPS_MODES_COUNT];
+};
+
 /**
  * struct xe_gt_sriov_guc_policies - GuC SR-IOV policies.
  * @sched_if_idle: controls strict scheduling policy.
  * @reset_engine: controls engines reset on VF switch policy.
  * @sample_period: adverse events sampling period (in milliseconds).
+ * @sched_groups: available scheduling group configurations.
  */
 struct xe_gt_sriov_guc_policies {
 	bool sched_if_idle;
 	bool reset_engine;
 	u32 sample_period;
+	struct xe_gt_sriov_scheduler_groups sched_groups;
 };
 
 /**
-- 
2.43.0

