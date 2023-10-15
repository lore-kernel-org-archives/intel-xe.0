Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4873FCDB47E
	for <intel-xe@archiver.kernel.org>; Sun, 15 Oct 2023 05:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E2B10E070;
	Sun, 15 Oct 2023 05:31:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773E310E070
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Oct 2023 05:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697347885; x=1728883885;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wp9qJ4swxquaMwrAeyW61g15fjEVISegdXT1yy/c+kM=;
 b=hOVyCRzskcyo4Badk1NIvGJhNAq949NmedEreDgsCCOlK0UxZizVzVR+
 a3RZVdP+8nFt/iDaIC+u3XZjC70OvBcTKv8FzHMikESQP+Gl/0Qltt9xs
 lp++5CACl/C62LCu6r4NatdYEcx07DLBu1xe7VhEeNWuixvhdbVjyIFps
 p+DIiWUrLwFlz0wfiOoj0Lb4OJH3u+W7xUQ3RKhCvm/MTaQpHqhjLaHWl
 //deTWKTqKCSeuzkowgLUN9A2nEScOWG9tYuoSAZWFKLZlFhmnRwTq88V
 EgvIyd/T5KbpnnD6X3lmZXyiRS9gbxSEfFryOBiHy5y1/ZVjLBpRoQ04O w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="385205346"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; d="scan'208";a="385205346"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2023 22:31:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="871654015"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; d="scan'208";a="871654015"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2023 22:31:25 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sat, 14 Oct 2023 22:31:19 -0700
Message-Id: <20231015053119.6271-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC] drm/xe/pvc: Enable fixed CCS mode
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

Allow static assignment of compute slices to a user selected
number of compute engines. Add a per-tile 'ccs_mode' sysfs
interface for user selection. By default assign all compute
resources to the first available compute engine. User must
ensure the tile is idle while changing the ccs mode as this
causes a tile reset.

Support this mode for PVC which can be extended to other
platforms in future.

IGT: https://patchwork.freedesktop.org/series/125147/

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 14 +++++
 drivers/gpu/drm/xe/xe_gt.c           | 27 +++++++--
 drivers/gpu/drm/xe/xe_gt.h           |  2 +
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 89 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h  | 35 +++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h     | 16 +++++
 drivers/gpu/drm/xe/xe_guc_ads.c      |  3 +
 drivers/gpu/drm/xe/xe_hw_engine.c    | 13 ++++
 drivers/gpu/drm/xe/xe_tile_sysfs.c   | 55 +++++++++++++++++
 10 files changed, 250 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 175a357366d9..5660cf45df2f 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -58,6 +58,7 @@ xe-y += xe_bb.o \
 	xe_force_wake.o \
 	xe_ggtt.o \
 	xe_gt.o \
+	xe_gt_ccs_mode.o \
 	xe_gt_clock.o \
 	xe_gt_debugfs.o \
 	xe_gt_idle_sysfs.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index cd1821d96a5d..5b5163be7d40 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -359,8 +359,22 @@
 #define   COMP_CKN_IN				REG_GENMASK(30, 29)
 
 #define RCU_MODE				XE_REG(0x14800, XE_REG_OPTION_MASKED)
+#define   RCU_MODE_FIXED_SLICE_CCS_MODE		REG_BIT(1)
 #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
 
+/*
+ * Total of 4 cslices, where each cslice is in the form:
+ *   [0-3]     CCS ID
+ *   [4-6]     RSVD
+ *   [7]       Disabled
+ */
+#define CCS_MODE				XE_REG(0x14804)
+#define   CCS_MODE_CSLICE_0_3_MASK		REG_GENMASK(11, 0) /* 3 bits per cslice */
+#define   CCS_MODE_CSLICE_MASK			0x7 /* CCS0-3 + rsvd */
+#define   CCS_MODE_CSLICE_WIDTH			ilog2(CCS_MODE_CSLICE_MASK + 1)
+#define   CCS_MODE_CSLICE(cslice, ccs) \
+	(ccs << (cslice * CCS_MODE_CSLICE_WIDTH))
+
 #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
 #define   FORCEWAKE_KERNEL			BIT(0)
 #define   FORCEWAKE_USER			BIT(1)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index c63e2e4750b1..159620fdcc15 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -20,6 +20,7 @@
 #include "xe_force_wake.h"
 #include "xe_ggtt.h"
 #include "xe_gt_clock.h"
+#include "xe_gt_ccs_mode.h"
 #include "xe_gt_idle_sysfs.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_pagefault.h"
@@ -76,6 +77,7 @@ static void gt_fini(struct drm_device *drm, void *arg)
 	int i;
 
 	destroy_workqueue(gt->ordered_wq);
+	xe_gt_fini_ccs_mode(gt);
 
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
@@ -437,6 +439,12 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
+	/* Configure default CCS mode of 1 engine with all resources */
+	if (xe_gt_needs_ccs_mode(gt)) {
+		xe_gt_set_ccs_mode(gt, 1);
+		xe_gt_apply_ccs_mode(gt);
+	}
+
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	XE_WARN_ON(err);
 	xe_device_mem_access_put(gt_to_xe(gt));
@@ -458,6 +466,7 @@ int xe_gt_init(struct xe_gt *gt)
 	int err;
 	int i;
 
+	xe_gt_init_ccs_mode(gt);
 	INIT_WORK(&gt->reset.worker, gt_reset_worker);
 
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
@@ -467,11 +476,11 @@ int xe_gt_init(struct xe_gt *gt)
 
 	err = xe_gt_tlb_invalidation_init(gt);
 	if (err)
-		return err;
+		goto err_ccs_mode;
 
 	err = xe_gt_pagefault_init(gt);
 	if (err)
-		return err;
+		goto err_ccs_mode;
 
 	xe_mocs_init_early(gt);
 
@@ -479,19 +488,24 @@ int xe_gt_init(struct xe_gt *gt)
 
 	err = gt_fw_domain_init(gt);
 	if (err)
-		return err;
+		goto err_ccs_mode;
 
 	xe_force_wake_init_engines(gt, gt_to_fw(gt));
 
 	err = all_fw_domain_init(gt);
 	if (err)
-		return err;
+		goto err_ccs_mode;
 
 	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
 	if (err)
-		return err;
+		goto err_ccs_mode;
 
 	return 0;
+
+err_ccs_mode:
+	xe_gt_fini_ccs_mode(gt);
+
+	return err;
 }
 
 static int do_gt_reset(struct xe_gt *gt)
@@ -539,6 +553,9 @@ static int do_gt_restart(struct xe_gt *gt)
 		xe_reg_sr_apply_whitelist(hwe);
 	}
 
+	/* Get CCS mode in sync between sw/hw */
+	xe_gt_apply_ccs_mode(gt);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index caded203a8a0..1c2a1d35a2c1 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -17,6 +17,8 @@
 		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
 			  xe_hw_engine_is_valid((hwe__)))
 
+#define CCS_MASK(gt) ((gt->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
+
 #ifdef CONFIG_FAULT_INJECTION
 extern struct fault_attr gt_reset_failure;
 static inline bool xe_fault_inject_gt_reset(void)
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
new file mode 100644
index 000000000000..0379ea551b32
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "xe_assert.h"
+#include "xe_gt.h"
+#include "xe_mmio.h"
+#include "xe_gt_ccs_mode.h"
+#include "regs/xe_gt_regs.h"
+
+void xe_gt_init_ccs_mode(struct xe_gt *gt)
+{
+	mutex_init(&gt->ccs.mutex);
+}
+
+void xe_gt_fini_ccs_mode(struct xe_gt *gt)
+{
+	mutex_destroy(&gt->ccs.mutex);
+}
+
+static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
+{
+	u32 mode = CCS_MODE_CSLICE_0_3_MASK; /* disable all by default */
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_hw_engine *hwe;
+	int num_slices = hweight32(CCS_MASK(gt));
+	int width, cslice;
+	enum xe_hw_engine_id id;
+	u32 config = 0;
+
+	lockdep_assert_held(&gt->ccs.mutex);
+	xe_assert(xe, GRAPHICS_VERx100(gt_to_xe(gt)) <= 1260);
+
+	xe_assert(xe, num_engines && num_engines <= num_slices);
+	xe_assert(xe, !(num_slices % num_engines));
+
+	/*
+	 * Loop over all available slices and assign each a user engine.
+	 *
+	 * With 1 engine (ccs0):
+	 *   slice 0, 1, 2, 3: ccs0
+	 *
+	 * With 2 engines (ccs0, ccs1):
+	 *   slice 0, 2: ccs0
+	 *   slice 1, 3: ccs1
+	 *
+	 * With 4 engines (ccs0, ccs1, ccs2, ccs3):
+	 *   slice 0: ccs0
+	 *   slice 1: ccs1
+	 *   slice 2: ccs2
+	 *   slice 3: ccs3
+	 */
+	for (width = num_slices / num_engines, cslice = 0; width--;) {
+		for_each_hw_engine(hwe, gt, id) {
+			if (hwe->class != XE_ENGINE_CLASS_COMPUTE)
+				continue;
+
+			if (hwe->logical_instance >= num_engines)
+				break;
+
+			config |= BIT(hwe->instance) << XE_HW_ENGINE_CCS0;
+
+			/* If a slice is fused off, leave disabled */
+			while ((CCS_MASK(gt) & BIT(cslice)) == 0)
+				cslice++;
+
+			mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_MASK);
+			mode |= CCS_MODE_CSLICE(cslice, hwe->instance);
+			cslice++;
+		}
+	}
+
+	drm_info(&xe->drm,
+		 "CCS_MODE=%x for config:%08x, num_engines:%d, num_slices:%d\n",
+		 mode, config, num_engines, num_slices);
+
+	xe_mmio_write32(gt, CCS_MODE, mode);
+}
+
+void xe_gt_apply_ccs_mode(struct xe_gt *gt)
+{
+	mutex_lock(&gt->ccs.mutex);
+
+	if (gt->ccs.num_engines)
+		__xe_gt_apply_ccs_mode(gt, gt->ccs.num_engines);
+
+	mutex_unlock(&gt->ccs.mutex);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
new file mode 100644
index 000000000000..0040ac78c3e5
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GT_CCS_MODE_H_
+#define _XE_GT_CCS_MODE_H_
+
+#include "xe_device_types.h"
+#include "xe_gt.h"
+#include "xe_gt_types.h"
+#include "xe_platform_types.h"
+
+void xe_gt_init_ccs_mode(struct xe_gt *gt);
+void xe_gt_fini_ccs_mode(struct xe_gt *gt);
+
+void xe_gt_apply_ccs_mode(struct xe_gt *gt);
+
+static inline bool xe_gt_needs_ccs_mode(const struct xe_gt *gt)
+{
+	return GRAPHICS_VERx100(gt_to_xe(gt)) == 1260 && CCS_MASK(gt);
+}
+
+static inline void xe_gt_set_ccs_mode(struct xe_gt *gt, u32 num_engines)
+{
+	gt->ccs.num_engines = num_engines;
+}
+
+static inline u32 xe_gt_get_ccs_mode(struct xe_gt *gt)
+{
+	return gt->ccs.num_engines;
+}
+
+#endif
+
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index d4310be3e1e7..baf7aa9ab2af 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -185,6 +185,22 @@ struct xe_gt {
 		spinlock_t lock;
 	} tlb_invalidation;
 
+	/**
+	 * @ccs: Fixed mapping between CCS engines and compute slices.
+	 * Through the per-tile 'ccs_mode' sysfs interface, the user can specify a
+	 * fixed number of compute hardware engines to which the available compute
+	 * slices are to be allocated. By default all compute slices are allocated
+	 * to the first available compute engine instance. This user configuration
+	 * change triggers a tile reset and it is expected that user will ensure
+	 * the tile is idle while doing so.
+	 */
+	struct {
+		/** @mutex: Serialize CCS mode access */
+		struct mutex mutex;
+		/** @num_engines: Number of CCS engines enabled */
+		u32 num_engines;
+	} ccs;
+
 	/** @usm: unified shared memory state */
 	struct {
 		/**
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index efa4d25424b8..64a8a9bf0802 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -8,6 +8,7 @@
 #include <drm/drm_managed.h>
 
 #include "regs/xe_engine_regs.h"
+#include "xe_gt_ccs_mode.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_guc_regs.h"
 #include "xe_bo.h"
@@ -454,6 +455,8 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 		{ .reg = RING_HWS_PGA(hwe->mmio_base),			},
 		{ .reg = RING_IMR(hwe->mmio_base),			},
 		{ .reg = RCU_MODE, .skip = hwe != hwe_rcs_reset_domain	},
+		{ .reg = CCS_MODE,
+		  .skip = hwe != hwe_rcs_reset_domain || !xe_gt_needs_ccs_mode(hwe->gt)	},
 	};
 	u32 i;
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index b5b084590888..78ca123bd6ed 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -8,6 +8,7 @@
 #include <drm/drm_managed.h>
 
 #include "regs/xe_engine_regs.h"
+#include "xe_gt_ccs_mode.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_assert.h"
@@ -283,6 +284,13 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 	hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
 }
 
+static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_gt *gt,
+						 const struct xe_hw_engine *hwe)
+{
+	return xe_gt_needs_ccs_mode(gt) &&
+	       xe_rtp_match_first_render_or_compute(gt, hwe);
+}
+
 void
 xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
 {
@@ -307,6 +315,11 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
 				 blit_cctl_val,
 				 XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 		},
+		/* Use Fixed slice CCS mode */
+		{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
+		  XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),
+		  XE_RTP_ACTIONS(SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE))
+		},
 		{}
 	};
 
diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index 16376607c68f..e30c29670cd3 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -7,8 +7,12 @@
 #include <linux/sysfs.h>
 #include <drm/drm_managed.h>
 
+#include "generated/xe_wa_oob.h"
+#include "xe_gt.h"
+#include "xe_gt_ccs_mode.h"
 #include "xe_tile.h"
 #include "xe_tile_sysfs.h"
+#include "xe_wa.h"
 
 static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
 {
@@ -34,6 +38,52 @@ static DEVICE_ATTR_RO(physical_vram_size_bytes);
 static const struct attribute *physical_memsize_attr =
 	&dev_attr_physical_vram_size_bytes.attr;
 
+static ssize_t
+ccs_mode_show(struct device *kdev,
+	      struct device_attribute *attr, char *buf)
+{
+	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
+
+	return sysfs_emit(buf, "%d\n", xe_gt_get_ccs_mode(tile->primary_gt));
+}
+
+static ssize_t
+ccs_mode_store(struct device *kdev, struct device_attribute *attr,
+	       const char *buff, size_t count)
+{
+	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_gt *gt = tile->primary_gt;
+	u32 num_engines, num_slices;
+	int ret;
+
+	ret = kstrtou32(buff, 0, &num_engines);
+	if (ret)
+		return ret;
+
+	/*
+	 * Ensure number of engines specified is valid and there is an
+	 * exact multiple of engines for slices.
+	 */
+	num_slices = hweight32(CCS_MASK(gt));
+	if (!num_engines || num_engines > num_slices || num_slices % num_engines) {
+		drm_err(&xe->drm, "Invalid compute config, %d engines %d slices\n",
+			num_engines, num_slices);
+		return -EINVAL;
+	}
+
+	if (xe_gt_get_ccs_mode(gt) == num_engines)
+		return count;
+
+	drm_info(&xe->drm, "Setting compute mode to %d\n", num_engines);
+	xe_gt_set_ccs_mode(gt, num_engines);
+	xe_gt_reset_async(gt);
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(ccs_mode);
+
 static void tile_sysfs_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_tile *tile = arg;
@@ -69,6 +119,11 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
 		drm_warn(&xe->drm,
 			 "Sysfs creation to read addr_range per tile failed\n");
 
+	if (GRAPHICS_VERx100(xe) == 1260 &&
+	    sysfs_create_file(tile->sysfs, &dev_attr_ccs_mode.attr))
+		drm_warn(&xe->drm,
+			 "Sysfs creation to set ccs_mode failed\n");
+
 	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
 	if (err) {
 		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
-- 
2.21.0.rc0.32.g243a4c7e27

