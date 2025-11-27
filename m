Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E7ED116EA
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 01:45:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35ED10E716;
	Thu, 27 Nov 2025 01:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVEx4cU3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B8110E720
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 01:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764207930; x=1795743930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TK/GaW+F9lOMqa1b5S2CigY4VqlZ0/goOb0z8wzcKoM=;
 b=DVEx4cU3xodNViN13GhmGB0klItcW2jn0lZTcVTf7LcjQPVQ+HvD8sIs
 TTUrTvY4LKgwA9uYlL7rEByzHFA6jtYhQBSNZ+y66eK1EwB+P5YsYH7Vr
 T0iWe/n5pc521FrGhO9Eg2DfyhyKStjW4sMQlwBNG6BD2ye/6wlNYTDdx
 yExiej0wlQQhpi1TR1+k89qdT2ZTkhvP+2obKebVFv2oXW2rDe+re9eBQ
 3vwJaslxj/SFykPwBYmyabzQpYcZSvbqHy336fBvxL6/xFw7iToyiJncd
 gr9xEUKpBLC/zv8RFyBOOScymJRiEaBcWpx4fxb4cMmtYrs/NrJ8CjTCH Q==;
X-CSE-ConnectionGUID: i7TUBIGKRZ6lNrwHgdfF9A==
X-CSE-MsgGUID: gXeqafTIS+SqJlofj1lFcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70114850"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="70114850"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 17:45:26 -0800
X-CSE-ConnectionGUID: AVefZ0zhS7u+xorCvWp0dg==
X-CSE-MsgGUID: QPih/FZ8T4O1uPlhAMDJxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="192753353"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 17:45:20 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 02/10] drm/xe/sriov: Initialize scheduler groups
Date: Wed, 26 Nov 2025 17:45:08 -0800
Message-ID: <20251127014507.2323746-14-daniele.ceraolospurio@intel.com>
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

Scheduler groups (a.k.a. Engine Groups Scheduling, or EGS) is a GuC
feature that allows the driver to define groups of engines that are
independently scheduled across VFs, which allows different VFs to be
active on the HW at the same time on different groups.

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

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |   5 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 135 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |   1 +
 .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |  14 ++
 4 files changed, 155 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
index 0714c758b9c1..62dda1c24e77 100644
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
@@ -123,6 +124,10 @@ int xe_gt_sriov_pf_init(struct xe_gt *gt)
 	if (err)
 		return err;
 
+	err = xe_gt_sriov_pf_policy_init(gt);
+	if (err)
+		return err;
+
 	err = xe_gt_sriov_pf_migration_init(gt);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
index 4445f660e6d1..9b878578ea90 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
@@ -5,11 +5,14 @@
 
 #include "abi/guc_actions_sriov_abi.h"
 
+#include <drm/drm_managed.h>
+
 #include "xe_bo.h"
 #include "xe_gt.h"
 #include "xe_gt_sriov_pf_helpers.h"
 #include "xe_gt_sriov_pf_policy.h"
 #include "xe_gt_sriov_printk.h"
+#include "xe_guc.h"
 #include "xe_guc_buf.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_klv_helpers.h"
@@ -351,6 +354,125 @@ u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt)
 	return value;
 }
 
+#define MAX_MEDIA_SLICES (hweight32(XE_HW_ENGINE_VECS_MASK))
+static int pf_sched_group_media_slices(struct xe_gt *gt, u32 **masks, u32 *num_masks)
+{
+	u8 slice_to_group[MAX_MEDIA_SLICES];
+	struct xe_hw_engine *hwe = NULL;
+	enum xe_hw_engine_id id;
+	u32 vcs_mask = VCS_MASK(gt);
+	u32 vecs_mask = VECS_MASK(gt);
+	u32 gsc_mask = GSCCS_MASK(gt);
+	u32 *values;
+	u8 slice;
+	u8 groups;
+
+	xe_gt_assert(gt, xe_gt_is_media_type(gt));
+
+	/* A media slice has 2 VCS and a VECS. We bundle the GSC with the first slice */
+	for (slice = 0, groups = 0;
+	     gsc_mask || vcs_mask || vecs_mask;
+	     slice++, gsc_mask = 0, vcs_mask >>= 2, vecs_mask >>= 1) {
+		if (unlikely(slice >= MAX_MEDIA_SLICES)) {
+			xe_gt_sriov_err(gt, "Too many media slices (%u) during EGS setup\n",
+					slice);
+			return -EINVAL;
+		}
+
+		if ((vcs_mask & 0x3) || (vecs_mask & 0x1) || (gsc_mask & 0x1))
+			slice_to_group[slice] = groups++;
+	}
+
+	/* We need at least 2 slices to split them up */
+	if (groups < 2) {
+		*masks = NULL;
+		*num_masks = 0;
+		return 0;
+	}
+
+	/*
+	 * The GuC expects and array with GUC_MAX_ENGINE_CLASSES entries for
+	 * each group.
+	 */
+	values = drmm_kzalloc(&gt_to_xe(gt)->drm,
+			      GUC_MAX_ENGINE_CLASSES * groups * sizeof(u32),
+			      GFP_KERNEL);
+	if (!values)
+		return -ENOMEM;
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
+			xe_gt_sriov_err(gt, "unknown media gt class %u (%s) during EGS setup\n",
+					hwe->class, hwe->name);
+			drmm_kfree(&gt_to_xe(gt)->drm, values);
+			return -EINVAL;
+		}
+
+		entry = (slice_to_group[slice] * GUC_MAX_ENGINE_CLASSES) + guc_class;
+		values[entry] |= BIT(hwe->logical_instance);
+	}
+
+	*masks = values;
+	*num_masks = GUC_MAX_ENGINE_CLASSES * groups;
+
+	return 0;
+}
+
+static int pf_init_sched_groups(struct xe_gt *gt)
+{
+	int err;
+	int m;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+
+	if (GUC_SUBMIT_VER(&gt->uc.guc) < MAKE_GUC_VER(1, 26, 0))
+		return 0;
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
+			if (xe_gt_is_media_type(gt)) {
+				err = pf_sched_group_media_slices(gt, &masks, &num_masks);
+				if (err)
+					return err;
+			}
+			break;
+		default:
+			xe_gt_sriov_err(gt, "unknown sched group mode %u\n", m);
+			return -EINVAL;
+		}
+
+		xe_gt_assert(gt, (num_masks % GUC_MAX_ENGINE_CLASSES) == 0);
+
+		if ((m == XE_SRIOV_SCHED_GROUPS_NONE) || num_masks)
+			gt->sriov.pf.policy.guc.sched_groups.supported_modes |= BIT(m);
+
+		gt->sriov.pf.policy.guc.sched_groups.modes[m].masks = masks;
+		gt->sriov.pf.policy.guc.sched_groups.modes[m].num_masks = num_masks;
+	}
+
+	return 0;
+}
+
 static void pf_sanitize_guc_policies(struct xe_gt *gt)
 {
 	pf_sanitize_sched_if_idle(gt);
@@ -401,6 +523,19 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
 	return err ? -ENXIO : 0;
 }
 
+/**
+ * xe_gt_sriov_pf_policy_init - Initializes the SW state of the PF policies.
+ * @gt: the &xe_gt
+ *
+ * This function can only be called on PF. This function does not touch the HW.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_policy_init(struct xe_gt *gt)
+{
+	return pf_init_sched_groups(gt);
+}
+
 static void print_guc_policies(struct drm_printer *p, struct xe_gt_sriov_guc_policies *policy)
 {
 	drm_printf(p, "%s:\t%s\n",
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
index 2a5dc33dc6d7..c9c04d1b7f50 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
@@ -18,6 +18,7 @@ bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
 int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
 u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
 
+int xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
 void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
 int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset);
 int xe_gt_sriov_pf_policy_print(struct xe_gt *gt, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
index 4de532af135e..3b915801c01b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
@@ -8,16 +8,30 @@
 
 #include <linux/types.h>
 
+enum xe_sriov_sched_group_modes {
+	XE_SRIOV_SCHED_GROUPS_NONE = 0, /* disabled */
+	XE_SRIOV_SCHED_GROUPS_MEDIA_SLICES, /* separate groups for each media slice */
+	XE_SRIOV_SCHED_GROUPS_MODES_COUNT
+};
+
 /**
  * struct xe_gt_sriov_guc_policies - GuC SR-IOV policies.
  * @sched_if_idle: controls strict scheduling policy.
  * @reset_engine: controls engines reset on VF switch policy.
  * @sample_period: adverse events sampling period (in milliseconds).
+ * @sched_groups: available scheduling group configurations and current mode.
  */
 struct xe_gt_sriov_guc_policies {
 	bool sched_if_idle;
 	bool reset_engine;
 	u32 sample_period;
+	struct {
+		u32 supported_modes;
+		struct {
+			u32 *masks;
+			u32 num_masks;
+		} modes[XE_SRIOV_SCHED_GROUPS_MODES_COUNT];
+	} sched_groups;
 };
 
 /**
-- 
2.43.0

