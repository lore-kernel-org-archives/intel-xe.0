Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4469BC27C7B
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 01:53:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C901310E201;
	Wed, 12 Jun 2024 01:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eN6E8VBS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815FB10E201
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 01:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718157190; x=1749693190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2SNqrSvcs1XzNqx+K5Mvk49yzwvKXyxtxQHjJwmk7FE=;
 b=eN6E8VBSZ0tU96YjomndoS0Qn/nkKp49nDR/dxKoj7V9lQ/g868fGfzQ
 1hgTUd/VXEcwSpx37zR5OwFdXd8alLfqmcT1cToWaM93aeQduXOO902CT
 UzCHApBsrA+s/GkrJWMEwj2MZP3c4JgUaYbd8CnTqp4/p+Ey2Yqw7qa6i
 9Pfyx39X0XSSXR4Bs61ab3RmuYfjYMIWCmUmfpX2ysh8LTf26bRFHpkUo
 2IN1TLVvSTkEm2W2Hp99owYSHBMrQZLSE4Qdm244ROTpGLGGZv8uCP0Ym
 ElBgUsg3UuUaw8mdAYpaoo+UNVsAv/vwcVjOPLk91gMYkvaaUxgPPfEAh w==;
X-CSE-ConnectionGUID: oJ4qtRwmRNKn4La+Fv2XUA==
X-CSE-MsgGUID: lxOoFQ8wQqComwSKl986PA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="18733164"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="18733164"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 18:53:08 -0700
X-CSE-ConnectionGUID: 26rNfXxlROiFxcuDopKiUA==
X-CSE-MsgGUID: QM76sgBkQR6QJbaPFoemaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="70424849"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 18:53:08 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/1] drm/xe/oa: Combined diff of changes between v16 and v17
Date: Tue, 11 Jun 2024 18:53:03 -0700
Message-ID: <20240612015303.2658884-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240612015303.2658884-1-ashutosh.dixit@intel.com>
References: <20240612015303.2658884-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Because Xe OA changes between successive revisions are distributed across
multiple patches, provide a combined diff of all changes in a single patch
to help with code review.

These changes pertain to: https://patchwork.freedesktop.org/series/121084/

This patch will not compile, it's purpose is to just provide the diff.

In this version:

* Address review comments from Michal Wajdeczko on v16
  * Add kernel doc for non-static functions
  * Other small fixes

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |  2 -
 drivers/gpu/drm/xe/regs/xe_oa_regs.h          |  5 +-
 drivers/gpu/drm/xe/xe_device.c                |  2 -
 drivers/gpu/drm/xe/xe_guc_pc.c                |  8 +-
 drivers/gpu/drm/xe/xe_guc_pc.h                |  2 +-
 drivers/gpu/drm/xe/xe_module.c                |  1 -
 drivers/gpu/drm/xe/xe_oa.c                    | 95 +++++++++++++++----
 drivers/gpu/drm/xe/xe_oa.h                    |  2 +-
 drivers/gpu/drm/xe/xe_oa_types.h              | 23 +++--
 drivers/gpu/drm/xe/xe_perf.c                  | 27 +++++-
 drivers/gpu/drm/xe/xe_perf.h                  |  4 +-
 include/uapi/drm/xe_drm.h                     | 22 ++++-
 12 files changed, 142 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index 48d4c759c688..ba4db8913098 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -45,8 +45,6 @@
 #define   MI_LRI_MMIO_REMAP_EN		REG_BIT(17)
 #define   MI_LRI_NUM_REGS(x)		XE_INSTR_NUM_DW(2 * (x) + 1)
 #define   MI_LRI_FORCE_POSTED		REG_BIT(12)
-#define   IS_MI_LRI_CMD(x)		(REG_FIELD_GET(MI_OPCODE, (x)) == \
-					 REG_FIELD_GET(MI_OPCODE, MI_LOAD_REGISTER_IMM))
 #define   MI_LRI_LEN(x)			(((x) & 0xff) + 1)
 
 #define MI_FLUSH_DW			__MI_INSTR(0x26)
diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
index d9fcb08f500d..1189f5a540a8 100644
--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
@@ -6,9 +6,6 @@
 #ifndef __XE_OA_REGS__
 #define __XE_OA_REGS__
 
-#define REG_EQUAL(reg, xe_reg) ((reg) == (xe_reg.addr))
-#define REG_EQUAL_MCR(reg, xe_reg) ((reg) == (xe_reg.__reg.addr))
-
 #define RPM_CONFIG1			XE_REG(0xd04)
 #define   GT_NOA_ENABLE			REG_BIT(9)
 
@@ -100,4 +97,4 @@
 #define OAM_STATUS(base)			XE_REG((base) + OAM_STATUS_OFFSET)
 #define OAM_MMIO_TRG(base)			XE_REG((base) + OAM_MMIO_TRG_OFFSET)
 
-#endif /* __XE_OA_REGS__ */
+#endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d29d8689d4ec..4c8ce3f18cb7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -41,7 +41,6 @@
 #include "xe_memirq.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
-#include "xe_oa.h"
 #include "xe_pat.h"
 #include "xe_pcode.h"
 #include "xe_perf.h"
@@ -709,7 +708,6 @@ static void xe_device_remove_display(struct xe_device *xe)
 
 void xe_device_remove(struct xe_device *xe)
 {
-
 	struct xe_gt *gt;
 	u8 id;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index ba0e6e7fd5c6..2b45a9cd3ec0 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -193,21 +193,21 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
 
 static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
 {
-	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
-	int ret;
 	u32 action[] = {
 		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
 		SLPC_EVENT(SLPC_EVENT_PARAMETER_UNSET, 1),
 		id,
 	};
+	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
+	int ret;
 
 	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
 		return -EAGAIN;
 
 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
 	if (ret)
-		drm_err(&pc_to_xe(pc)->drm, "GuC PC unset param failed: %pe",
-			ERR_PTR(ret));
+		xe_gt_err(pc_to_gt(pc), "GuC PC unset param failed: %pe",
+			  ERR_PTR(ret));
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index eb5bba9f0736..8a7b91ce1b3e 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -9,7 +9,7 @@
 #include <linux/types.h>
 
 struct xe_guc_pc;
-#include "abi/guc_actions_slpc_abi.h"
+enum slpc_gucrc_mode;
 
 int xe_guc_pc_init(struct xe_guc_pc *pc);
 int xe_guc_pc_start(struct xe_guc_pc *pc);
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 4e9f31f11920..893858a2eea0 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -10,7 +10,6 @@
 
 #include "xe_drv.h"
 #include "xe_hw_fence.h"
-#include "xe_oa.h"
 #include "xe_pci.h"
 #include "xe_perf.h"
 #include "xe_sched_job.h"
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index d0a46485571a..a1dbece4b848 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright © 2023 Intel Corporation
+ * Copyright © 2023-2024 Intel Corporation
  */
 
 #include <linux/anon_inodes.h>
@@ -9,8 +9,10 @@
 #include <linux/poll.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_managed.h>
 #include <drm/xe_drm.h>
 
+#include "abi/guc_actions_slpc_abi.h"
 #include "instructions/xe_mi_commands.h"
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
@@ -24,6 +26,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
+#include "xe_gt_printk.h"
 #include "xe_guc_pc.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
@@ -829,7 +832,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 
 	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
 	if (stream->override_gucrc)
-		XE_WARN_ON(xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
+		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
 
 	xe_oa_free_configs(stream);
 }
@@ -1236,6 +1239,9 @@ static bool xe_oa_find_reg_in_lri(u32 *state, u32 reg, u32 *offset, u32 end)
 	return found;
 }
 
+#define IS_MI_LRI_CMD(x) (REG_FIELD_GET(MI_OPCODE, (x)) == \
+			  REG_FIELD_GET(MI_OPCODE, MI_LOAD_REGISTER_IMM))
+
 static u32 xe_oa_context_image_offset(struct xe_oa_stream *stream, u32 reg)
 {
 	struct xe_lrc *lrc = stream->exec_q->lrc[0];
@@ -1393,7 +1399,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_pm_runtime_put(stream->oa->xe);
 	if (stream->override_gucrc)
-		XE_WARN_ON(xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
+		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
 err_free_configs:
 	xe_oa_free_configs(stream);
 exit:
@@ -1446,7 +1452,10 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
 	return ret;
 }
 
-/*
+/**
+ * xe_oa_timestamp_frequency - Return OA timestamp frequency
+ * @gt: @xe_gt
+ *
  * OA timestamp frequency = CS timestamp frequency in most platforms. On some
  * platforms OA unit ignores the CTC_SHIFT and the 2 timestamps differ. In such
  * cases, return the adjusted CS timestamp frequency to the user.
@@ -1505,7 +1514,7 @@ static int decode_oa_format(struct xe_oa *oa, u64 fmt, enum xe_oa_format_name *n
 	u32 type = FIELD_GET(DRM_XE_OA_FORMAT_MASK_FMT_TYPE, fmt);
 	int idx;
 
-	for_each_set_bit(idx, oa->format_mask, XE_OA_FORMAT_MAX) {
+	for_each_set_bit(idx, oa->format_mask, __XE_OA_FORMAT_MAX) {
 		const struct xe_oa_format *f = &oa->oa_formats[idx];
 
 		if (counter_size == f->counter_size && bc_report == f->bc_report &&
@@ -1518,6 +1527,12 @@ static int decode_oa_format(struct xe_oa *oa, u64 fmt, enum xe_oa_format_name *n
 	return -EINVAL;
 }
 
+/**
+ * xe_oa_unit_id - Return OA unit ID for a hardware engine
+ * @hwe: @xe_hw_engine
+ *
+ * Return OA unit ID for a hardware engine when available
+ */
 u16 xe_oa_unit_id(struct xe_hw_engine *hwe)
 {
 	return hwe->oa_unit && hwe->oa_unit->num_engines ?
@@ -1698,6 +1713,16 @@ static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number
 	return 0;
 }
 
+/**
+ * xe_oa_stream_open_ioctl - Opens an OA stream
+ * @dev: @drm_device
+ * @data: pointer to struct @drm_xe_oa_config
+ * @file: @drm_file
+ *
+ * The functions opens an OA stream. An OA stream, opened with specified
+ * properties, enables perf counter samples to be collected, either
+ * periodically (time based sampling), or on request (using perf queries)
+ */
 int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
 {
 	struct xe_oa *oa = &to_xe_device(dev)->oa;
@@ -1942,7 +1967,7 @@ static ssize_t show_dynamic_id(struct kobject *kobj,
 	struct xe_oa_config *oa_config =
 		container_of(attr, typeof(*oa_config), sysfs_metric_id);
 
-	return sprintf(buf, "%d\n", oa_config->id);
+	return sysfs_emit(buf, "%d\n", oa_config->id);
 }
 
 static int create_dynamic_oa_sysfs_entry(struct xe_oa *oa,
@@ -1963,6 +1988,16 @@ static int create_dynamic_oa_sysfs_entry(struct xe_oa *oa,
 	return sysfs_create_group(oa->metrics_kobj, &oa_config->sysfs_metric);
 }
 
+/**
+ * xe_oa_add_config_ioctl - Adds one OA config
+ * @dev: @drm_device
+ * @data: pointer to struct @drm_xe_oa_config
+ * @file: @drm_file
+ *
+ * The functions adds an OA config to the set of OA configs maintained in
+ * the kernel. The config determines which OA metrics are collected for an
+ * OA stream.
+ */
 int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
 {
 	struct xe_oa *oa = &to_xe_device(dev)->oa;
@@ -2058,6 +2093,12 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
 	return err;
 }
 
+/**
+ * xe_oa_remove_config_ioctl - Removes one OA config
+ * @dev: @drm_device
+ * @data: pointer to struct @drm_xe_perf_param
+ * @file: @drm_file
+ */
 int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
 {
 	struct xe_oa *oa = &to_xe_device(dev)->oa;
@@ -2108,6 +2149,12 @@ int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file
 	return ret;
 }
 
+/**
+ * xe_oa_register - Xe OA registration
+ * @xe: @xe_device
+ *
+ * Exposes the metrics sysfs directory upon completion of module initialization
+ */
 void xe_oa_register(struct xe_device *xe)
 {
 	struct xe_oa *oa = &xe->oa;
@@ -2119,6 +2166,10 @@ void xe_oa_register(struct xe_device *xe)
 						  &xe->drm.primary->kdev->kobj);
 }
 
+/**
+ * xe_oa_unregister - Xe OA de-registration
+ * @xe: @xe_device
+ */
 void xe_oa_unregister(struct xe_device *xe)
 {
 	struct xe_oa *oa = &xe->oa;
@@ -2142,8 +2193,7 @@ static u32 __hwe_oam_unit(struct xe_hw_engine *hwe)
 		 * There's 1 SAMEDIA gt and 1 OAM per SAMEDIA gt. All media slices
 		 * within the gt use the same OAM. All MTL/LNL SKUs list 1 SA MEDIA
 		 */
-		drm_WARN_ON(&gt_to_xe(hwe->gt)->drm,
-			    hwe->gt->info.type != XE_GT_TYPE_MEDIA);
+		xe_gt_WARN_ON(hwe->gt, hwe->gt->info.type != XE_GT_TYPE_MEDIA);
 
 		return 0;
 	}
@@ -2229,7 +2279,7 @@ static int xe_oa_init_gt(struct xe_gt *gt)
 	enum xe_hw_engine_id id;
 	struct xe_oa_unit *u;
 
-	u = kcalloc(num_oa_units, sizeof(*u), GFP_KERNEL);
+	u = drmm_kcalloc(&gt_to_xe(gt)->drm, num_oa_units, sizeof(*u), GFP_KERNEL);
 	if (!u)
 		return -ENOMEM;
 
@@ -2252,6 +2302,8 @@ static int xe_oa_init_gt(struct xe_gt *gt)
 
 	__xe_oa_init_oa_units(gt);
 
+	drmm_mutex_init(&gt_to_xe(gt)->drm, &gt->oa.gt_lock);
+
 	return 0;
 }
 
@@ -2313,11 +2365,16 @@ static void xe_oa_init_supported_formats(struct xe_oa *oa)
 	}
 }
 
+/**
+ * xe_oa_init - OA initialization during device probe
+ * @xe: @xe_device
+ *
+ * Return: 0 on success or a negative error code on failure
+ */
 int xe_oa_init(struct xe_device *xe)
 {
 	struct xe_oa *oa = &xe->oa;
-	struct xe_gt *gt;
-	int i, ret;
+	int ret;
 
 	/* Support OA only with GuC submission and Gen12+ */
 	if (XE_WARN_ON(!xe_device_uc_enabled(xe)) || XE_WARN_ON(GRAPHICS_VER(xe) < 12))
@@ -2326,15 +2383,12 @@ int xe_oa_init(struct xe_device *xe)
 	oa->xe = xe;
 	oa->oa_formats = oa_formats;
 
-	for_each_gt(gt, xe, i)
-		mutex_init(&gt->oa.gt_lock);
-
-	mutex_init(&oa->metrics_lock);
+	drmm_mutex_init(&oa->xe->drm, &oa->metrics_lock);
 	idr_init_base(&oa->metrics_idr, 1);
 
 	ret = xe_oa_init_oa_units(oa);
 	if (ret) {
-		drm_err(&xe->drm, "OA initialization failed %d\n", ret);
+		drm_err(&xe->drm, "OA initialization failed (%pe)\n", ERR_PTR(ret));
 		goto exit;
 	}
 
@@ -2351,18 +2405,17 @@ static int destroy_config(int id, void *p, void *data)
 	return 0;
 }
 
+/**
+ * xe_oa_fini - OA de-initialization during device remove
+ * @xe: @xe_device
+ */
 void xe_oa_fini(struct xe_device *xe)
 {
 	struct xe_oa *oa = &xe->oa;
-	struct xe_gt *gt;
-	int i;
 
 	if (!oa->xe)
 		return;
 
-	for_each_gt(gt, xe, i)
-		kfree(gt->oa.oa_unit);
-
 	idr_for_each(&oa->metrics_idr, destroy_config, oa);
 	idr_destroy(&oa->metrics_idr);
 
diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
index d2f50c3accf3..87a38820c317 100644
--- a/drivers/gpu/drm/xe/xe_oa.h
+++ b/drivers/gpu/drm/xe/xe_oa.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: MIT */
 /*
- * Copyright © 2023 Intel Corporation
+ * Copyright © 2023-2024 Intel Corporation
  */
 
 #ifndef _XE_OA_H_
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index c62811482934..706d45577dae 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -1,15 +1,15 @@
 /* SPDX-License-Identifier: MIT */
 /*
- * Copyright © 2023 Intel Corporation
+ * Copyright © 2023-2024 Intel Corporation
  */
 
 #ifndef _XE_OA_TYPES_H_
 #define _XE_OA_TYPES_H_
 
+#include <linux/bitops.h>
 #include <linux/idr.h>
-#include <linux/math.h>
-#include <linux/types.h>
 #include <linux/mutex.h>
+#include <linux/types.h>
 
 #include <drm/xe_drm.h>
 #include "regs/xe_reg_defs.h"
@@ -53,16 +53,25 @@ enum xe_oa_format_name {
 	XE_OA_FORMAT_PEC36u64_G1_32_G2_4,
 	XE_OA_FORMAT_PEC36u64_G1_4_G2_32,
 
-	XE_OA_FORMAT_MAX,
+	__XE_OA_FORMAT_MAX,
 };
 
-/** struct xe_oa_format - Format fields for supported OA formats */
+/**
+ * struct xe_oa_format - Format fields for supported OA formats. OA format
+ * properties are specified in PRM/Bspec 52198 and 60942
+ */
 struct xe_oa_format {
+	/** @counter_select: counter select value (see Bspec 52198/60942) */
 	u32 counter_select;
+	/** @size: record size as written by HW (multiple of 64 byte cachelines) */
 	int size;
+	/** @type: of enum @drm_xe_oa_format_type */
 	int type;
+	/** @header: 32 or 64 bit report headers */
 	enum xe_oa_report_header header;
+	/** @counter_size: counter size value (see Bspec 60942) */
 	u16 counter_size;
+	/** @bc_report: BC report value (see Bspec 60942) */
 	u16 bc_report;
 };
 
@@ -135,10 +144,8 @@ struct xe_oa {
 	/** @oa_formats: tracks all OA formats across platforms */
 	const struct xe_oa_format *oa_formats;
 
-#define FORMAT_MASK_SIZE DIV_ROUND_UP(XE_OA_FORMAT_MAX - 1, BITS_PER_LONG)
-
 	/** @format_mask: tracks valid OA formats for a platform */
-	unsigned long format_mask[FORMAT_MASK_SIZE];
+	unsigned long format_mask[BITS_TO_LONGS(__XE_OA_FORMAT_MAX)];
 
 	/** @oa_unit_ids: tracks oa unit ids assigned across gt's */
 	u16 oa_unit_ids;
diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
index 06739787d0e7..d6cd74cadf34 100644
--- a/drivers/gpu/drm/xe/xe_perf.c
+++ b/drivers/gpu/drm/xe/xe_perf.c
@@ -1,11 +1,13 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright © 2023 Intel Corporation
+ * Copyright © 2023-2024 Intel Corporation
  */
 
 #include <linux/errno.h>
 #include <linux/sysctl.h>
 
+#include <drm/xe_drm.h>
+
 #include "xe_oa.h"
 #include "xe_perf.h"
 
@@ -27,6 +29,17 @@ static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_perf_param *arg,
 	}
 }
 
+/**
+ * xe_perf_ioctl - The top level perf layer ioctl
+ * @dev: @drm_device
+ * @data: pointer to struct @drm_xe_perf_param
+ * @file: @drm_file
+ *
+ * The function is called for different perf streams types and allows execution
+ * of different operations supported by those perf stream types.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct drm_xe_perf_param *arg = data;
@@ -55,12 +68,24 @@ static struct ctl_table perf_ctl_table[] = {
 	{}
 };
 
+/**
+ * xe_perf_sysctl_register - Register "perf_stream_paranoid" sysctl
+ *
+ * Normally only superuser/root can access perf counter data. However,
+ * superuser can set perf_stream_paranoid sysctl to 0 to allow non-privileged
+ * users to also access perf data.
+ *
+ * Return: always returns 0
+ */
 int xe_perf_sysctl_register(void)
 {
 	sysctl_header = register_sysctl("dev/xe", perf_ctl_table);
 	return 0;
 }
 
+/**
+ * xe_perf_sysctl_unregister - Unregister "perf_stream_paranoid" sysctl
+ */
 void xe_perf_sysctl_unregister(void)
 {
 	unregister_sysctl_table(sysctl_header);
diff --git a/drivers/gpu/drm/xe/xe_perf.h b/drivers/gpu/drm/xe/xe_perf.h
index 1ff0a07ebab3..53a8377a1bb1 100644
--- a/drivers/gpu/drm/xe/xe_perf.h
+++ b/drivers/gpu/drm/xe/xe_perf.h
@@ -1,12 +1,12 @@
 /* SPDX-License-Identifier: MIT */
 /*
- * Copyright © 2023 Intel Corporation
+ * Copyright © 2023-2024 Intel Corporation
  */
 
 #ifndef _XE_PERF_H_
 #define _XE_PERF_H_
 
-#include <drm/xe_drm.h>
+#include <linux/types.h>
 
 struct drm_device;
 struct drm_file;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 8378e5a51d37..93e00be44b2d 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -80,6 +80,7 @@ extern "C" {
  *  - &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
  *  - &DRM_IOCTL_XE_EXEC
  *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
+ *  - &DRM_IOCTL_XE_PERF
  */
 
 /*
@@ -1374,10 +1375,12 @@ struct drm_xe_wait_user_fence {
 	__u64 reserved[2];
 };
 
-/** enum drm_xe_perf_type - Perf stream types */
+/**
+ * enum drm_xe_perf_type - Perf stream types
+ */
 enum drm_xe_perf_type {
 	DRM_XE_PERF_TYPE_OA,
-	DRM_XE_PERF_TYPE_MAX,
+	__DRM_XE_PERF_TYPE_MAX, /* non-ABI */
 };
 
 /**
@@ -1435,7 +1438,9 @@ enum drm_xe_perf_ioctls {
 	DRM_XE_PERF_IOCTL_INFO = _IO('i', 0x4),
 };
 
-/** enum drm_xe_oa_unit_type - OA unit types */
+/**
+ * enum drm_xe_oa_unit_type - OA unit types
+ */
 enum drm_xe_oa_unit_type {
 	/**
 	 * @DRM_XE_OA_UNIT_TYPE_OAG: OAG OA unit. OAR/OAC are considered
@@ -1516,13 +1521,22 @@ struct drm_xe_query_oa_units {
 	__u64 oa_units[];
 };
 
-/** enum drm_xe_oa_format_type - OA format types */
+/**
+ * enum drm_xe_oa_format_type - OA format types as specified in PRM/Bspec
+ * 52198/60942
+ */
 enum drm_xe_oa_format_type {
+	/** @DRM_XE_OA_FMT_TYPE_OAG: OAG report format */
 	DRM_XE_OA_FMT_TYPE_OAG,
+	/** @DRM_XE_OA_FMT_TYPE_OAR: OAR report format */
 	DRM_XE_OA_FMT_TYPE_OAR,
+	/** @DRM_XE_OA_FMT_TYPE_OAM: OAM report format */
 	DRM_XE_OA_FMT_TYPE_OAM,
+	/** @DRM_XE_OA_FMT_TYPE_OAC: OAC report format */
 	DRM_XE_OA_FMT_TYPE_OAC,
+	/** @DRM_XE_OA_FMT_TYPE_OAM_MPEC: OAM SAMEDIA or OAM MPEC report format */
 	DRM_XE_OA_FMT_TYPE_OAM_MPEC,
+	/** @DRM_XE_OA_FMT_TYPE_PEC: PEC report format */
 	DRM_XE_OA_FMT_TYPE_PEC,
 };
 
-- 
2.41.0

