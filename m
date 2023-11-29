Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80418C07CA9
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 02:57:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5681810E5EA;
	Wed, 29 Nov 2023 02:57:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A5210E1E9
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 02:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701226640; x=1732762640;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VrV1GjLyZM2n+z7MenLAs9wlY5PaGLsO2T+koSUCRPs=;
 b=aVWjPB6DW4Hx3xdz9qwRlDatTXdxWd40KN3Ah5LXejPf18BUHsXaOLxT
 0uWzjy8XQ/pnZOabSUN72lITGkQmFW4gW2HzuXSAzjToKt4ik1nHCObVS
 QCXGA33G+UJjOrTMnqmuBCITgP3jJNZAB4bQRfGJXyHWLVbxf1HE1E+Wk
 INlXb65q552BHyksg7SeOUsXNor09oS5YXk9kXaFoNE5CpISISUcYHj+P
 hhmxjBMX+irF17uM+2hpo4WriUvd/yhlB465dl7VoWjwfi3bZ7yLjZc66
 wdBev3N3ixvaNGGYkOiAxGnCjtsReJ9Au9CvBi9w6RCEXeFa6o63aRce6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="373265513"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="373265513"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 18:57:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="762140431"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="762140431"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 18:57:19 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 18:57:14 -0800
Message-Id: <20231129025716.9094-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20231129025716.9094-1-niranjana.vishwanathapura@intel.com>
References: <20231129025716.9094-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/3] drm/xe: Enable Fixed CCS mode setting
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
resources to engines on all platforms with more than one compute
engine.

By default enable only one CCS engine with all compute slices
assigned to it. This is the desired configuration for common
workloads.

PVC platform supports only the fixed CCS mode (workaround 16016805146).

v2: Rebase, make it platform agnostic

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 14 ++++++
 drivers/gpu/drm/xe/xe_gt.c           | 10 ++++
 drivers/gpu/drm/xe/xe_gt.h           |  2 +
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 73 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h  | 23 +++++++++
 drivers/gpu/drm/xe/xe_gt_types.h     | 14 ++++++
 drivers/gpu/drm/xe/xe_guc_ads.c      |  3 ++
 drivers/gpu/drm/xe/xe_hw_engine.c    | 20 ++++++++
 9 files changed, 160 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 99c1d2a67ae1..01b754dd4497 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -70,6 +70,7 @@ xe-y += xe_bb.o \
 	xe_gsc.o \
 	xe_gsc_submit.o \
 	xe_gt.o \
+	xe_gt_ccs_mode.o \
 	xe_gt_clock.o \
 	xe_gt_debugfs.o \
 	xe_gt_idle_sysfs.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 18b13224480d..45fa11ac9c7a 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -397,8 +397,22 @@
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
+	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
+
 #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
 #define   FORCEWAKE_KERNEL			BIT(0)
 #define   FORCEWAKE_USER			BIT(1)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 00193b02a7e5..1e534dd7e2a8 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -22,6 +22,7 @@
 #include "xe_force_wake.h"
 #include "xe_ggtt.h"
 #include "xe_gsc.h"
+#include "xe_gt_ccs_mode.h"
 #include "xe_gt_clock.h"
 #include "xe_gt_idle_sysfs.h"
 #include "xe_gt_mcr.h"
@@ -452,6 +453,12 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
+	/* Configure default CCS mode of 1 engine with all resources */
+	if (xe_gt_ccs_mode_enabled(gt)) {
+		gt->ccs_mode.num_engines = 1;
+		xe_gt_apply_ccs_mode(gt);
+	}
+
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	XE_WARN_ON(err);
 	xe_device_mem_access_put(gt_to_xe(gt));
@@ -558,6 +565,9 @@ static int do_gt_restart(struct xe_gt *gt)
 		xe_reg_sr_apply_whitelist(hwe);
 	}
 
+	/* Get CCS mode in sync between sw/hw */
+	xe_gt_apply_ccs_mode(gt);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index caded203a8a0..a818cc9c8fd0 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -17,6 +17,8 @@
 		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
 			  xe_hw_engine_is_valid((hwe__)))
 
+#define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
+
 #ifdef CONFIG_FAULT_INJECTION
 extern struct fault_attr gt_reset_failure;
 static inline bool xe_fault_inject_gt_reset(void)
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
new file mode 100644
index 000000000000..8441316bb35c
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
+	if (gt->ccs_mode.num_engines)
+		__xe_gt_apply_ccs_mode(gt, gt->ccs_mode.num_engines);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
new file mode 100644
index 000000000000..9aa6223ca83b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
@@ -0,0 +1,23 @@
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
+	/* Enable CCS mode interface on all platforms with more than one CCS engine */
+	return hweight32(CCS_MASK(gt)) > 1;
+}
+
+#endif
+
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index d3f2793684e2..9fc6717f5c2e 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -185,6 +185,20 @@ struct xe_gt {
 		spinlock_t lock;
 	} tlb_invalidation;
 
+	/**
+	 * @ccs_mode: Fixed mapping between CCS engines and compute slices.
+	 * Through the per-gt 'ccs_mode' sysfs interface, the user can specify a
+	 * fixed number of compute hardware engines to which the available compute
+	 * slices are to be allocated. By default all compute slices are allocated
+	 * to the first available compute engine instance. This user configuration
+	 * change triggers a gt reset and it is expected that there are no open
+	 * drm clients while doing so.
+	 */
+	struct {
+		/** @num_engines: Number of CCS engines enabled */
+		u32 num_engines;
+	} ccs_mode;
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
index c52c26c395a7..00ca871d54c6 100644
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
@@ -284,6 +285,13 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
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
@@ -308,6 +316,12 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
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
 
@@ -861,6 +875,12 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
 	if (hwe->class == XE_ENGINE_CLASS_OTHER)
 		return true;
 
+	/* Check for engines disabled by ccs_mode setting */
+	if (xe_gt_ccs_mode_enabled(gt) &&
+	    hwe->class == XE_ENGINE_CLASS_COMPUTE &&
+	    hwe->logical_instance >= gt->ccs_mode.num_engines)
+		return true;
+
 	return xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
 		hwe->instance == gt->usm.reserved_bcs_instance;
 }
-- 
2.21.0.rc0.32.g243a4c7e27

