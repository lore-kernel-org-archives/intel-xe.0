Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84641D609D5
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 01:26:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4888C10E80A;
	Wed, 17 Dec 2025 01:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bfnQ6hPw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAAE10E80A
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 01:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765934799; x=1797470799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+eNkCrpWlHax+ECsbrflsfQR/3mv9dMQf8EKucxrxoI=;
 b=bfnQ6hPwy7nA7UuS+uyj98W7k4vT64JKLaB55ywh92AB5xC5i61tC7gJ
 UUSk+mu/sI57zEaRb+tmJt9sHTsoDD66XVzHyi0nhBL6iwnRfJjBbCzhb
 Ihl4QljwCK7R+FglMW3OaH2vpMNn8uRUkp9O1+kdG+AF/dHDIhuSm+adI
 yyM+Vsrcfy+twCa8vNNLBertlV5i+jTT39nsKyZ0y9FmUN42fNz0RRkoQ
 Y8jDU3baKPGQDVlVcdeu4CnrL9sxzyROEdgdDy//RpihG9WIpbrLG84Zf
 sRuOFE7FEpWzD3cjD8dSV464VKvQ/QwUq34qQU0DNuJ2gVI9veYn6dXLZ A==;
X-CSE-ConnectionGUID: cgLcHq+nS0CP+UZVmGTFyw==
X-CSE-MsgGUID: aVxq4ZcRTBq8i1Z7QvWKRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67903838"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="67903838"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 17:26:38 -0800
X-CSE-ConnectionGUID: ud9BKTw9T5CziHoboQOcTQ==
X-CSE-MsgGUID: gHab4PEYTZinngA8yrD8/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="202360615"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 17:26:37 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 04/13] drm/xe/sriov: Initialize scheduler groups
Date: Tue, 16 Dec 2025 17:26:24 -0800
Message-ID: <20251217012620.758252-19-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217012620.758252-15-daniele.ceraolospurio@intel.com>
References: <20251217012620.758252-15-daniele.ceraolospurio@intel.com>
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
gets its own group. Since upcoming products have a different number of
video engines per-slice, for now we limit the media_slices mode to BMG,
but we expect to add support for newer HW soon.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com> #v3
---
v2: Use asserts for coding errors, code cleanups, better docs (Michal),
    limit groups to 2, limit to BMG and newer, bump required GuC to
    70.55.1.
v3: Use a struct sched_groups array instead of an array of u32 masks,
    move the max_group check to the next patch, rename NONE to
    DISABLED (Michal), limit the media_slices mode to BMG.
v4: Rework switch case to have the compiler flag the missing cases,
    fix enum docs, use GUC_FIRMWARE_VER_AT_LEAST
---
 drivers/gpu/drm/xe/abi/guc_scheduler_abi.h    |   9 ++
 drivers/gpu/drm/xe/xe_gt.h                    |   3 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |   3 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 148 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |   2 +
 .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |  33 ++++
 6 files changed, 198 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h b/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
index db9c171f8b64..513b22a87428 100644
--- a/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_scheduler_abi.h
@@ -6,6 +6,8 @@
 #ifndef _ABI_GUC_SCHEDULER_ABI_H
 #define _ABI_GUC_SCHEDULER_ABI_H
 
+#include <linux/types.h>
+
 /**
  * Generic defines required for registration with and submissions to the GuC
  * scheduler. Includes engine class/instance defines and context attributes
@@ -45,4 +47,11 @@
 #define GUC_CONTEXT_DISABLE		0
 #define GUC_CONTEXT_ENABLE		1
 
+/* scheduler groups */
+#define GUC_MAX_SCHED_GROUPS		8
+
+struct guc_sched_group {
+	u32 engines[GUC_MAX_ENGINE_CLASSES];
+} __packed;
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index a2ba80c954a6..de7e47763411 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -29,6 +29,9 @@
 #define CCS_INSTANCES(gt) XE_ENGINE_INSTANCES_FROM_MASK(gt, CCS)
 #define GSCCS_INSTANCES(gt) XE_ENGINE_INSTANCES_FROM_MASK(gt, GSCCS)
 
+/* Our devices have up to 4 media slices */
+#define MAX_MEDIA_SLICES 4
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
index 4445f660e6d1..fc60e7a01434 100644
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
@@ -351,6 +354,139 @@ u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt)
 	return value;
 }
 
+static void pf_sched_group_media_slices(struct xe_gt *gt, struct guc_sched_group **groups,
+					u32 *num_groups)
+{
+	u8 slice_to_group[MAX_MEDIA_SLICES];
+	u32 vecs_mask = VECS_INSTANCES(gt);
+	u32 gsc_mask = GSCCS_INSTANCES(gt);
+	u32 vcs_mask = VCS_INSTANCES(gt);
+	struct guc_sched_group *values;
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+	int group = 0;
+	int slice;
+
+	xe_gt_assert(gt, xe_gt_is_media_type(gt));
+
+	/*
+	 * Post-BMG the matching of video engines to slices changes, so for now
+	 * we don't allow this mode on those platforms.
+	 */
+	if (gt_to_xe(gt)->info.platform > XE_BATTLEMAGE)
+		return;
+
+	/*
+	 * On BMG and older platforms a media slice has 2 VCS and a VECS. We
+	 * bundle the GSC with the first slice.
+	 */
+	for (slice = 0; slice < MAX_MEDIA_SLICES; slice++) {
+		if ((vcs_mask & 0x3) || (vecs_mask & 0x1) || (gsc_mask & 0x1))
+			slice_to_group[slice] = group++;
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
+	if (group < 2)
+		return;
+
+	/* The GuC expects an array with a guc_sched_group entry for each group */
+	values = drmm_kcalloc(&gt_to_xe(gt)->drm, group, sizeof(struct guc_sched_group),
+			      GFP_KERNEL);
+	if (!values)
+		return;
+
+	for_each_hw_engine(hwe, gt, id) {
+		u8 guc_class = xe_engine_class_to_guc_class(hwe->class);
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
+			slice = 0;
+		}
+
+		values[slice_to_group[slice]].engines[guc_class] |= BIT(hwe->logical_instance);
+	}
+
+	*groups = values;
+	*num_groups = group;
+}
+
+/**
+ * xe_sriov_gt_pf_policy_has_sched_groups_support() - Checks whether scheduler
+ * groups are supported.
+ * @gt: the &xe_gt
+ *
+ * This function can only be called on PF.
+ *
+ * Return: true if scheduler groups are supported, false otherwise.
+ */
+bool xe_sriov_gt_pf_policy_has_sched_groups_support(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+
+	/*
+	 * The GuC supports scheduler groups from v70.53.0, but a fix for it has
+	 * been merged in v70.55.1, so we require the latter. The feature is
+	 * also only enabled on BMG and newer FW.
+	 */
+	return GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 55, 1) &&
+	       gt_to_xe(gt)->info.platform >= XE_BATTLEMAGE;
+}
+
+static void pf_init_sched_groups(struct xe_gt *gt)
+{
+	enum xe_sriov_sched_group_modes m;
+
+	if (!xe_sriov_gt_pf_policy_has_sched_groups_support(gt))
+		return;
+
+	for (m = XE_SRIOV_SCHED_GROUPS_DISABLED + 1; m < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; m++) {
+		u32 *num_groups = &gt->sriov.pf.policy.guc.sched_groups.modes[m].num_groups;
+		struct guc_sched_group **groups =
+			&gt->sriov.pf.policy.guc.sched_groups.modes[m].groups;
+
+		switch (m) {
+		case XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES:
+			/* this mode only has groups on the media GT */
+			if (xe_gt_is_media_type(gt))
+				pf_sched_group_media_slices(gt, groups, num_groups);
+			break;
+		case XE_SRIOV_SCHED_GROUPS_DISABLED:
+		case XE_SRIOV_SCHED_GROUPS_MODES_COUNT:
+			/*
+			 * By defining m of type enum xe_sriov_sched_group_modes
+			 * we can get the compiler to automatically flag
+			 * missing cases if new enum entries are added. However,
+			 * to keep the compiler happy we also need to add the
+			 * cases that are excluded from the loop.
+			 */
+			xe_gt_assert(gt, false);
+			break;
+		}
+
+		xe_gt_assert(gt, *num_groups < GUC_MAX_SCHED_GROUPS);
+	}
+}
+
 static void pf_sanitize_guc_policies(struct xe_gt *gt)
 {
 	pf_sanitize_sched_if_idle(gt);
@@ -401,6 +537,18 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
 	return err ? -ENXIO : 0;
 }
 
+/**
+ * xe_gt_sriov_pf_policy_init() - Initializes the SW state of the PF policies.
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
index 2a5dc33dc6d7..f5e3b2595063 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
@@ -17,7 +17,9 @@ int xe_gt_sriov_pf_policy_set_reset_engine(struct xe_gt *gt, bool enable);
 bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
 int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
 u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
+bool xe_sriov_gt_pf_policy_has_sched_groups_support(struct xe_gt *gt);
 
+void xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
 void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
 int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset);
 int xe_gt_sriov_pf_policy_print(struct xe_gt *gt, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
index 4de532af135e..11527ab1db7a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
@@ -8,16 +8,49 @@
 
 #include <linux/types.h>
 
+#include "abi/guc_scheduler_abi.h"
+
+/**
+ * enum xe_sriov_sched_group_modes - list of possible scheduler group modes
+ * @XE_SRIOV_SCHED_GROUPS_DISABLED: no separate groups (i.e., all engines in group 0)
+ * @XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES: separate groups for each media slice
+ * @XE_SRIOV_SCHED_GROUPS_MODES_COUNT: number of valid modes
+ */
+enum xe_sriov_sched_group_modes {
+	XE_SRIOV_SCHED_GROUPS_DISABLED = 0,
+	XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES,
+	XE_SRIOV_SCHED_GROUPS_MODES_COUNT /* must be last */
+};
+
+/**
+ * struct xe_gt_sriov_scheduler_groups - Scheduler groups policy info
+ * @modes: array of masks and their number for each mode
+ * @modes.groups: array of engine instance groups in given mode, with each group
+ *                consisting of GUC_MAX_ENGINE_CLASSES engine instances masks. A
+ *                A NULL value indicates that all the engines are in the same
+ *                group for this mode on this GT.
+ * @modes.num_groups: number of groups in given mode, zero if all the engines
+ *                    are in the same group.
+ */
+struct xe_gt_sriov_scheduler_groups {
+	struct {
+		struct guc_sched_group *groups;
+		u32 num_groups;
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

