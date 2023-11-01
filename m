Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D806C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  1 Nov 2023 23:57:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2643610E7F4;
	Wed,  1 Nov 2023 23:57:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7C610E7F5
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Nov 2023 23:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698883074; x=1730419074;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xs7smbo3VbZmt2j36P0G/3u+Pbk5SxLQp/ZXP21JTNA=;
 b=QCMMG8lh6qdzWcOPkm9bE+UAIvwMPCstB4RzEHfEOKXw8FAfTWuAxh2C
 pykUJ2wyhpzm8i8/NZoKJrhq9MOaBqoGI1CCp9GuVr9DpUvEds5sVDGwJ
 Ipuj7sjJWwoPFJAL1+QcFVRmqOL5wyLR66gCwemkZq0/pSsgmNXr0M9Rm
 Cxl/M+dNn2QqIX11x7Yf1mpmgGM6gLKn7nWeaZqI2htE21eYGBYKy44GZ
 abMn4G4A35DHCoaycwJDy7uJyhjJe56XhCATU+0B23tLzTiivmRjyvfOn
 zZMB+8CzWXMYELQJnM0XG/9YH3EO9De4xzEZRO6qb3uIvYI8nSlMBClib A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="378996969"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; d="scan'208";a="378996969"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 16:57:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008276012"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; d="scan'208";a="1008276012"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 16:57:53 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  1 Nov 2023 16:57:48 -0700
Message-Id: <20231101235749.4720-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20231101235749.4720-1-niranjana.vishwanathapura@intel.com>
References: <20231101235749.4720-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC v2 1/2] drm/xe: Enable Fixed CCS mode setting
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

Disable dynamic HW load balancing of compute resource assignment
to engines and instead enabled fixed mode of mapping compute
resources to engines.

Allow user to configure this CCS mode setting through a 'ccs_mode'
sysfs entry.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 14 +++++
 drivers/gpu/drm/xe/xe_gt.c           | 27 ++++++++--
 drivers/gpu/drm/xe/xe_gt.h           |  2 +
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 79 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h  | 22 ++++++++
 drivers/gpu/drm/xe/xe_gt_types.h     | 16 ++++++
 drivers/gpu/drm/xe/xe_guc_ads.c      |  3 ++
 drivers/gpu/drm/xe/xe_hw_engine.c    | 14 +++++
 drivers/gpu/drm/xe/xe_tile_sysfs.c   | 54 +++++++++++++++++++
 10 files changed, 227 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 776c31e73f29..a335d8762741 100644
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
index 7a6407e38265..b15aca465fc9 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -388,8 +388,22 @@
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
index d380f67b3365..5f3e2d3d63c3 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -22,6 +22,7 @@
 #include "xe_force_wake.h"
 #include "xe_ggtt.h"
 #include "xe_gt_clock.h"
+#include "xe_gt_ccs_mode.h"
 #include "xe_gt_idle_sysfs.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_pagefault.h"
@@ -78,6 +79,7 @@ static void gt_fini(struct drm_device *drm, void *arg)
 	int i;
 
 	destroy_workqueue(gt->ordered_wq);
+	mutex_destroy(&gt->ccs.mutex);
 
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
@@ -447,6 +449,12 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
+	/* Configure default CCS mode of 1 engine with all resources */
+	if (xe_gt_needs_ccs_mode(gt)) {
+		gt->ccs.num_engines = 1;
+		xe_gt_apply_ccs_mode(gt);
+	}
+
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	XE_WARN_ON(err);
 	xe_device_mem_access_put(gt_to_xe(gt));
@@ -468,6 +476,7 @@ int xe_gt_init(struct xe_gt *gt)
 	int err;
 	int i;
 
+	mutex_init(&gt->ccs.mutex);
 	INIT_WORK(&gt->reset.worker, gt_reset_worker);
 
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i) {
@@ -477,11 +486,11 @@ int xe_gt_init(struct xe_gt *gt)
 
 	err = xe_gt_tlb_invalidation_init(gt);
 	if (err)
-		return err;
+		goto err_ccs_mode;
 
 	err = xe_gt_pagefault_init(gt);
 	if (err)
-		return err;
+		goto err_ccs_mode;
 
 	xe_mocs_init_early(gt);
 
@@ -489,19 +498,24 @@ int xe_gt_init(struct xe_gt *gt)
 
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
+	mutex_destroy(&gt->ccs.mutex);
+
+	return err;
 }
 
 static int do_gt_reset(struct xe_gt *gt)
@@ -549,6 +563,9 @@ static int do_gt_restart(struct xe_gt *gt)
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
index 000000000000..cec552e823b6
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -0,0 +1,79 @@
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
+	xe_mmio_write32(gt, CCS_MODE, mode);
+
+	drm_info(&xe->drm,
+		 "tile-%d CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
+		 gt_to_tile(gt)->id, mode, config, num_engines, num_slices);
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
index 000000000000..793f3bbb4937
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
@@ -0,0 +1,22 @@
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
+void xe_gt_apply_ccs_mode(struct xe_gt *gt);
+
+static inline bool xe_gt_needs_ccs_mode(const struct xe_gt *gt)
+{
+	return GRAPHICS_VERx100(gt_to_xe(gt)) == 1260 && CCS_MASK(gt);
+}
+
+#endif
+
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index d3f2793684e2..5342aff9dd68 100644
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
index 88789826e781..74b550be0e36 100644
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
index b5b084590888..0058bbf8fd06 100644
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
@@ -307,6 +315,12 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
 				 blit_cctl_val,
 				 XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 		},
+		/* Use Fixed slice CCS mode */
+		{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
+		  XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),
+		  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
+					   RCU_MODE_FIXED_SLICE_CCS_MODE))
+		},
 		{}
 	};
 
diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index 16376607c68f..a0162744ce24 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -7,8 +7,12 @@
 #include <linux/sysfs.h>
 #include <drm/drm_managed.h>
 
+#include "xe_gt.h"
+#include "xe_gt_ccs_mode.h"
+#include "xe_mmio.h"
 #include "xe_tile.h"
 #include "xe_tile_sysfs.h"
+#include "regs/xe_gt_regs.h"
 
 static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
 {
@@ -34,6 +38,51 @@ static DEVICE_ATTR_RO(physical_vram_size_bytes);
 static const struct attribute *physical_memsize_attr =
 	&dev_attr_physical_vram_size_bytes.attr;
 
+static ssize_t
+ccs_mode_show(struct device *kdev,
+	      struct device_attribute *attr, char *buf)
+{
+	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
+
+	return sysfs_emit(buf, "%d\n", tile->primary_gt->ccs.num_engines);
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
+		drm_dbg(&xe->drm, "Invalid compute config for tile %d, %d engines %d slices\n",
+			tile->id, num_engines, num_slices);
+		return -EINVAL;
+	}
+
+	if (gt->ccs.num_engines != num_engines) {
+		drm_info(&xe->drm, "tile-%d: setting compute mode to %d\n", tile->id, num_engines);
+		gt->ccs.num_engines = num_engines;
+		xe_gt_reset_async(gt);
+	}
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(ccs_mode);
+
 static void tile_sysfs_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_tile *tile = arg;
@@ -69,6 +118,11 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
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

