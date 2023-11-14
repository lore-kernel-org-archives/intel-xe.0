Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA5DC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 00:46:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F4910E43C;
	Tue, 14 Nov 2023 00:46:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2272A10E43C
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 00:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699922771; x=1731458771;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=0gfQjojbRRmwwR3Pzo98AiZpxN3a23Q5DU4pvBZXlNM=;
 b=cWjNKcDS78Bi3ZmruMCGQD9EsH0XrMBjpQCtrdBZSodo2L8mG6MAwPoX
 i4HlXxAqtkceFXGf2xb68gfggqYb9xl7ppUcfBsLZ6I8gjJCqMwJQLZV2
 2m68wCwSUUXbVMhwIfPNAPNOUGjma4ZPo3KXcYprq0G2lOKWRbTwAkzYT
 TBnmf49ZVuO9Z+0nAwFwxTVKKdrRPleI1tvsrqgzQgeyaXK/IX5+f1syv
 scJX4+9+8BZLxgyWl1fZvYWT8jav21jQ/cvM5glabVY7pFaUZv160ICvF
 qbZMGnszN16QoQwumPDwkzHDOqLw22PFD+ik2RoqYm8bfL9YeLtb/jFI4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3621912"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="3621912"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 16:46:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="740923719"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="740923719"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 16:46:10 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Nov 2023 16:46:03 -0800
Message-Id: <20231114004604.4439-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20231114004604.4439-1-niranjana.vishwanathapura@intel.com>
References: <20231114004604.4439-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC v3 1/2] drm/xe: Enable Fixed CCS mode setting
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

By default enable only one CCS engine with all compute slices
assigned to it. This seems to be the desired configuration for
common workloads.

Allow user to configure this CCS mode setting through a 'ccs_mode'
sysfs entry.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 14 ++++++
 drivers/gpu/drm/xe/xe_gt.c           | 10 ++++
 drivers/gpu/drm/xe/xe_gt.h           |  2 +
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 73 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h  | 22 +++++++++
 drivers/gpu/drm/xe/xe_gt_sysfs.c     | 53 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h     | 14 ++++++
 drivers/gpu/drm/xe/xe_guc_ads.c      |  3 ++
 drivers/gpu/drm/xe/xe_hw_engine.c    | 20 ++++++++
 10 files changed, 212 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a1a8847e2ba3..dab5c9a8ad44 100644
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
index cc27fe8fc363..576b72000ae9 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -395,8 +395,22 @@
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
index 6c885dde5d59..1f9b678fc530 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -21,6 +21,7 @@
 #include "xe_execlist.h"
 #include "xe_force_wake.h"
 #include "xe_ggtt.h"
+#include "xe_gt_ccs_mode.h"
 #include "xe_gt_clock.h"
 #include "xe_gt_idle_sysfs.h"
 #include "xe_gt_mcr.h"
@@ -451,6 +452,12 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
+	/* Configure default CCS mode of 1 engine with all resources */
+	if (xe_gt_ccs_mode_enabled(gt)) {
+		gt->ccs.num_engines = 1;
+		xe_gt_apply_ccs_mode(gt);
+	}
+
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	XE_WARN_ON(err);
 	xe_device_mem_access_put(gt_to_xe(gt));
@@ -553,6 +560,9 @@ static int do_gt_restart(struct xe_gt *gt)
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
index 000000000000..fcbdc13df46e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "regs/xe_gt_regs.h"
+#include "xe_assert.h"
+#include "xe_gt.h"
+#include "xe_gt_ccs_mode.h"
+#include "xe_mmio.h"
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
+	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
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
+	xe_gt_info(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
+		   mode, config, num_engines, num_slices);
+}
+
+void xe_gt_apply_ccs_mode(struct xe_gt *gt)
+{
+	if (gt->ccs.num_engines)
+		__xe_gt_apply_ccs_mode(gt, gt->ccs.num_engines);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
new file mode 100644
index 000000000000..2f3352173e7b
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
+static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
+{
+	return GRAPHICS_VERx100(gt_to_xe(gt)) == 1260 && CCS_MASK(gt);
+}
+
+#endif
+
diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index c69d2e8a0fe1..e53221c2894f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -10,7 +10,11 @@
 
 #include <drm/drm_managed.h>
 
+#include "regs/xe_gt_regs.h"
 #include "xe_gt.h"
+#include "xe_gt_ccs_mode.h"
+#include "xe_gt_printk.h"
+#include "xe_mmio.h"
 
 static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
 {
@@ -29,6 +33,50 @@ static void gt_sysfs_fini(struct drm_device *drm, void *arg)
 	kobject_put(gt->sysfs);
 }
 
+static ssize_t
+ccs_mode_show(struct device *kdev,
+	      struct device_attribute *attr, char *buf)
+{
+	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
+
+	return sysfs_emit(buf, "Enabled compute engines %d; Number of compute slices %d\n",
+			  gt->ccs.num_engines, hweight32(CCS_MASK(gt)));
+}
+
+static ssize_t
+ccs_mode_store(struct device *kdev, struct device_attribute *attr,
+	       const char *buff, size_t count)
+{
+	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
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
+		xe_gt_dbg(gt, "Invalid compute config, %d engines %d slices\n",
+			  num_engines, num_slices);
+		return -EINVAL;
+	}
+
+	if (gt->ccs.num_engines != num_engines) {
+		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
+		gt->ccs.num_engines = num_engines;
+		xe_gt_reset_async(gt);
+	}
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(ccs_mode);
+
 void xe_gt_sysfs_init(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -52,6 +100,11 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
 
 	gt->sysfs = &kg->base;
 
+	if (GRAPHICS_VERx100(xe) == 1260 &&
+	    sysfs_create_file(gt->sysfs, &dev_attr_ccs_mode.attr))
+		drm_warn(&xe->drm,
+			 "Sysfs creation for ccs_mode setting failed\n");
+
 	err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
 	if (err) {
 		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index d3f2793684e2..ab1740005600 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -185,6 +185,20 @@ struct xe_gt {
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
+		/** @num_engines: Number of CCS engines enabled */
+		u32 num_engines;
+	} ccs;
+
 	/** @usm: unified shared memory state */
 	struct {
 		/**
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 88789826e781..b6be7a7ad76a 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -12,6 +12,7 @@
 #include "regs/xe_guc_regs.h"
 #include "xe_bo.h"
 #include "xe_gt.h"
+#include "xe_gt_ccs_mode.h"
 #include "xe_guc.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
@@ -454,6 +455,8 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
 		{ .reg = RING_HWS_PGA(hwe->mmio_base),			},
 		{ .reg = RING_IMR(hwe->mmio_base),			},
 		{ .reg = RCU_MODE, .skip = hwe != hwe_rcs_reset_domain	},
+		{ .reg = CCS_MODE,
+		  .skip = hwe != hwe_rcs_reset_domain || !xe_gt_ccs_mode_enabled(hwe->gt) },
 	};
 	u32 i;
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index e831e63c5e48..4f41699f95ec 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -16,6 +16,7 @@
 #include "xe_execlist.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
+#include "xe_gt_ccs_mode.h"
 #include "xe_gt_topology.h"
 #include "xe_hw_fence.h"
 #include "xe_irq.h"
@@ -283,6 +284,13 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 	hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
 }
 
+static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_gt *gt,
+						 const struct xe_hw_engine *hwe)
+{
+	return xe_gt_ccs_mode_enabled(gt) &&
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
 
@@ -841,6 +855,12 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
 	if (hwe->class == XE_ENGINE_CLASS_OTHER)
 		return true;
 
+	/* Check for engines disabled by ccs_mode setting */
+	if (xe_gt_ccs_mode_enabled(gt) &&
+	    hwe->class == XE_ENGINE_CLASS_COMPUTE &&
+	    hwe->logical_instance >= gt->ccs.num_engines)
+		return true;
+
 	return xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
 		hwe->instance == gt->usm.reserved_bcs_instance;
 }
-- 
2.21.0.rc0.32.g243a4c7e27

