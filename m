Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E60C64EC7
	for <intel-xe@archiver.kernel.org>; Sat, 25 Feb 2023 20:10:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C61110E28B;
	Sat, 25 Feb 2023 20:10:58 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7606F10E28B
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Feb 2023 20:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677355857; x=1708891857;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TRZMnThs0LmG8AuE5oilOIo4MGfEpSm8r3+jM1bmHxo=;
 b=WDvwG2pOysa8xXLFJJlxjxqVdJ4DUqW6gbmE60nZmTQeIk5yuCk6wRRq
 t51jfbHXPTDTC5Rz/sjw9y64n2qt6zHzl4/v3PjuMy8rg0Mnn27I1WBro
 OoEeYhQ3bIttbBKnSLy1suK9mvTS0yu83QKPZYtxTdTyLoe24uI1Icdm8
 WJg7akGqEYKV8k6wui1V1L5MfLRTelka3NKPpFV123cGhElN5wxRzorx6
 Rnzci77LN01QarYM4yqHlxf5G0qKSRH80zFDEPhTs4rrmgvGGOAsvgADM
 c0KB95xRxt4ybu/eOeMCtZHdnasFKZB7vXGb4UmfpCHKhlIX+hB0EzLC3 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="335937866"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; d="scan'208";a="335937866"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2023 12:10:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="816130006"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; d="scan'208";a="816130006"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2023 12:10:56 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sat, 25 Feb 2023 12:10:39 -0800
Message-Id: <20230225201039.2232172-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Do not spread i915_reg_defs.h include
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Reduce the use of i915_reg_defs.h so it can be encapsulated in a single
place.

1) If it was being included by mistake, remove
2) If it was included for FIELD_GET()/FIELD_PREP()/GENMASK() and the
   like, just include <linux/bitfield.h>
3) If it was included to be able to define additional registers, move
   the registers to the relavant headers (regs/xe_regs.h or
   regs/xe_gt_regs.h)

v2:
  - Squash commit fixing i915_reg_defs.h include and with the one
    introducing regs/xe_reg_defs.h
  - Remove more cases of i915_reg_defs.h being used when all it was
    needed was linux/bitfield.h  (Matt Roper)
  - Move some  registers to the corresponding regs/*.h file (Matt Roper)

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

This is the leftover change from
https://lore.kernel.org/intel-xe/20230225001548.1743820-1-lucas.demarchi@intel.com
The resst has been applied.

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  2 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  8 +++++++-
 drivers/gpu/drm/xe/regs/xe_reg_defs.h    | 11 +++++++++++
 drivers/gpu/drm/xe/regs/xe_regs.h        |  4 +++-
 drivers/gpu/drm/xe/xe_device.c           |  3 +--
 drivers/gpu/drm/xe/xe_gt_mcr.h           |  2 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c     |  1 +
 drivers/gpu/drm/xe/xe_gt_topology.c      | 15 +++++----------
 drivers/gpu/drm/xe/xe_guc.c              |  8 --------
 drivers/gpu/drm/xe/xe_guc_reg.h          |  6 +++++-
 drivers/gpu/drm/xe/xe_migrate.c          |  1 +
 drivers/gpu/drm/xe/xe_pcode_api.h        |  2 ++
 drivers/gpu/drm/xe/xe_reg_sr_types.h     |  2 --
 drivers/gpu/drm/xe/xe_rtp.h              |  2 --
 drivers/gpu/drm/xe/xe_rtp_types.h        |  2 --
 drivers/gpu/drm/xe/xe_step.c             |  2 ++
 16 files changed, 40 insertions(+), 31 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_reg_defs.h

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 6dfa3cf2fd43..2aa67d001c34 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -8,7 +8,7 @@
 
 #include <asm/page.h>
 
-#include "i915_reg_defs.h"
+#include "regs/xe_reg_defs.h"
 
 #define RING_TAIL(base)				_MMIO((base) + 0x30)
 
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 9290505d6596..4d0f09cd447c 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -6,7 +6,7 @@
 #ifndef _XE_GT_REGS_H_
 #define _XE_GT_REGS_H_
 
-#include "i915_reg_defs.h"
+#include "regs/xe_reg_defs.h"
 
 /* RPM unit config (Gen8+) */
 #define RPM_CONFIG0				_MMIO(0xd00)
@@ -108,6 +108,12 @@
 #define   GEN11_GT_VEBOX_DISABLE_SHIFT		16
 #define   GEN11_GT_VEBOX_DISABLE_MASK		(0x0f << GEN11_GT_VEBOX_DISABLE_SHIFT)
 
+#define XELP_EU_ENABLE				_MMIO(0x9134)	/* "_DISABLE" on Xe_LP */
+#define   XELP_EU_MASK				REG_GENMASK(7, 0)
+#define XELP_GT_GEOMETRY_DSS_ENABLE		_MMIO(0x913c)
+#define XEHP_GT_COMPUTE_DSS_ENABLE		_MMIO(0x9144)
+#define XEHPC_GT_COMPUTE_DSS_ENABLE_EXT		_MMIO(0x9148)
+
 #define GEN6_GDRST				_MMIO(0x941c)
 #define   GEN11_GRDOM_GUC			REG_BIT(3)
 #define   GEN6_GRDOM_FULL			(1 << 0)
diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
new file mode 100644
index 000000000000..5f6735697d9c
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_REG_DEFS_H_
+#define _XE_REG_DEFS_H_
+
+#include "../../i915/i915_reg_defs.h"
+
+#endif
diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index a697162e1a77..2e7fbdedb5eb 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -5,7 +5,7 @@
 #ifndef _XE_REGS_H_
 #define _XE_REGS_H_
 
-#include "i915_reg_defs.h"
+#include "regs/xe_reg_defs.h"
 
 #define GU_CNTL					_MMIO(0x101010)
 #define   LMEM_INIT				REG_BIT(7)
@@ -70,6 +70,8 @@
 #define PIPE_DSI0_OFFSET			0x7b000
 #define PIPE_DSI1_OFFSET			0x7b800
 
+#define SOFTWARE_FLAGS_SPR33			_MMIO(0x4f084)
+
 #define GEN8_PCU_ISR				_MMIO(0x444e0)
 #define GEN8_PCU_IMR				_MMIO(0x444e4)
 #define GEN8_PCU_IIR				_MMIO(0x444e8)
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 45e3c740fda2..4eb6786b11f0 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -12,6 +12,7 @@
 #include <drm/drm_managed.h>
 #include <drm/xe_drm.h>
 
+#include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_debugfs.h"
 #include "xe_display.h"
@@ -405,8 +406,6 @@ static void device_kill_persitent_engines(struct xe_device *xe,
 	mutex_unlock(&xe->persitent_engines.lock);
 }
 
-#define SOFTWARE_FLAGS_SPR33         _MMIO(0x4F084)
-
 void xe_device_wmb(struct xe_device *xe)
 {
 	struct xe_gt *gt = xe_device_get_gt(xe, 0);
diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
index c31987d2177c..2a6cd38c8cb7 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.h
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
@@ -6,7 +6,7 @@
 #ifndef _XE_GT_MCR_H_
 #define _XE_GT_MCR_H_
 
-#include "i915_reg_defs.h"
+#include "regs/xe_reg_defs.h"
 
 struct drm_printer;
 struct xe_gt;
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 0e7047b89a83..1677640e1075 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -5,6 +5,7 @@
 
 #include "xe_gt_pagefault.h"
 
+#include <linux/bitfield.h>
 #include <linux/circ_buf.h>
 
 #include <drm/drm_managed.h>
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index c76aaea1887c..2123f84be336 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -7,18 +7,13 @@
 
 #include <linux/bitmap.h>
 
+#include "regs/xe_gt_regs.h"
 #include "xe_gt.h"
 #include "xe_mmio.h"
 
 #define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
 #define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
 
-#define XELP_EU_ENABLE				0x9134	/* "_DISABLE" on Xe_LP */
-#define   XELP_EU_MASK				REG_GENMASK(7, 0)
-#define XELP_GT_GEOMETRY_DSS_ENABLE		0x913c
-#define XEHP_GT_COMPUTE_DSS_ENABLE		0x9144
-#define XEHPC_GT_COMPUTE_DSS_ENABLE_EXT		0x9148
-
 static void
 load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
 {
@@ -41,7 +36,7 @@ static void
 load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	u32 reg = xe_mmio_read32(gt, XELP_EU_ENABLE);
+	u32 reg = xe_mmio_read32(gt, XELP_EU_ENABLE.reg);
 	u32 val = 0;
 	int i;
 
@@ -86,10 +81,10 @@ xe_gt_topology_init(struct xe_gt *gt)
 	}
 
 	load_dss_mask(gt, gt->fuse_topo.g_dss_mask, num_geometry_regs,
-		      XELP_GT_GEOMETRY_DSS_ENABLE);
+		      XELP_GT_GEOMETRY_DSS_ENABLE.reg);
 	load_dss_mask(gt, gt->fuse_topo.c_dss_mask, num_compute_regs,
-		      XEHP_GT_COMPUTE_DSS_ENABLE,
-		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT);
+		      XEHP_GT_COMPUTE_DSS_ENABLE.reg,
+		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT.reg);
 	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
 
 	xe_gt_topology_dump(gt, &p);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 661effa9830f..58b9841616e4 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -22,14 +22,6 @@
 #include "xe_uc_fw.h"
 #include "xe_wopcm.h"
 
-#include "i915_reg_defs.h"
-
-/* TODO: move to common file */
-#define GUC_PVC_MOCS_INDEX_MASK		REG_GENMASK(25, 24)
-#define PVC_MOCS_UC_INDEX		1
-#define PVC_GUC_MOCS_INDEX(index)	REG_FIELD_PREP(GUC_PVC_MOCS_INDEX_MASK,\
-						       index)
-
 static struct xe_gt *
 guc_to_gt(struct xe_guc *guc)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_reg.h b/drivers/gpu/drm/xe/xe_guc_reg.h
index 513a7e0c8a5a..efd60c186bbc 100644
--- a/drivers/gpu/drm/xe/xe_guc_reg.h
+++ b/drivers/gpu/drm/xe/xe_guc_reg.h
@@ -9,7 +9,7 @@
 #include <linux/compiler.h>
 #include <linux/types.h>
 
-#include "i915_reg_defs.h"
+#include "regs/xe_reg_defs.h"
 
 /* Definitions of GuC H/W registers, bits, etc */
 
@@ -93,6 +93,10 @@
 #define   GUC_ENABLE_READ_CACHE_FOR_WOPCM_DATA	(1<<10)
 #define   GUC_ENABLE_MIA_CLOCK_GATING		(1<<15)
 #define   GUC_GEN10_SHIM_WC_ENABLE		(1<<21)
+#define   PVC_GUC_MOCS_INDEX_MASK		REG_GENMASK(25, 24)
+#define   PVC_MOCS_UC_INDEX			1
+#define   PVC_GUC_MOCS_INDEX(index)		REG_FIELD_PREP(PVC_GUC_MOCS_INDEX_MASK,\
+							       index)
 
 #define GUC_SEND_INTERRUPT		_MMIO(0xc4c8)
 #define   GUC_SEND_TRIGGER		  (1<<0)
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 6c0033cb238f..bc69ec17d5ad 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -5,6 +5,7 @@
 
 #include "xe_migrate.h"
 
+#include <linux/bitfield.h>
 #include <linux/sizes.h>
 
 #include <drm/drm_managed.h>
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 0762c8a912c7..4e689cd4b23b 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -5,6 +5,8 @@
 
 /* Internal to xe_pcode */
 
+#include "regs/xe_reg_defs.h"
+
 #define PCODE_MAILBOX			_MMIO(0x138124)
 #define   PCODE_READY			REG_BIT(31)
 #define   PCODE_MB_PARAM2		REG_GENMASK(23, 16)
diff --git a/drivers/gpu/drm/xe/xe_reg_sr_types.h b/drivers/gpu/drm/xe/xe_reg_sr_types.h
index b234a8673e54..0e6d542ff1b4 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr_types.h
+++ b/drivers/gpu/drm/xe/xe_reg_sr_types.h
@@ -9,8 +9,6 @@
 #include <linux/types.h>
 #include <linux/xarray.h>
 
-#include "i915_reg_defs.h"
-
 struct xe_reg_sr_entry {
 	u32		clr_bits;
 	u32		set_bits;
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index d6ba0b7e5042..bd44fd8bbe05 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -11,8 +11,6 @@
 
 #include "xe_rtp_types.h"
 
-#include "i915_reg_defs.h"
-
 /*
  * Register table poke infrastructure
  */
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index fac0bd6d5b1e..e87f1b280d96 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -8,8 +8,6 @@
 
 #include <linux/types.h>
 
-#include "i915_reg_defs.h"
-
 struct xe_hw_engine;
 struct xe_gt;
 
diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index ca77d0971529..14f482f29ae4 100644
--- a/drivers/gpu/drm/xe/xe_step.c
+++ b/drivers/gpu/drm/xe/xe_step.c
@@ -5,6 +5,8 @@
 
 #include "xe_step.h"
 
+#include <linux/bitfield.h>
+
 #include "xe_device.h"
 #include "xe_platform_types.h"
 
-- 
2.39.0

