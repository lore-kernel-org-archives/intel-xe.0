Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D70C7EE31
	for <intel-xe@archiver.kernel.org>; Sat, 25 Feb 2023 00:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA25C10E5EE;
	Sat, 25 Feb 2023 00:16:31 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE46D10E127
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Feb 2023 00:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677284188; x=1708820188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VuS9sGRYs9IkLDqJS4mbjyb2epWYAIQl8b/2pRVzw08=;
 b=Q/D1X19SUxJCa8Unr8nksK/1yd5E8dObOqvu+Ri0Ck32yu71uZIpA9ab
 RLus2wiv7c7bDKb9ZP6kTXRMoZKR7ncePvx9xO22o1fLqqlb+B7KWdJEb
 gsaFpMb2OrJQBqllIrub72yYWMzdUC9xVFmasdy8GrvcQQdYbYEyEZ7mn
 Xf9A4Kq7jfR2NzSS+PWW4daWcmGIR0zhH10noxL5olOCSOTKFPXCmmgCf
 AQ0ir0FKMfyFUghqxQOsa1P2vvRVDnwH4lgvCqmFEw/cx5KyJfYzkV3ts
 LESZgliDdgLvTDyqpubEqeRHO+FZ0MBJ51x1PYu1rIblS4nwqJJ12iw0N Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="332297349"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="332297349"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:16:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="761956588"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; d="scan'208";a="761956588"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 16:16:21 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Feb 2023 16:15:43 -0800
Message-Id: <20230225001548.1743820-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230225001548.1743820-1-lucas.demarchi@intel.com>
References: <20230225001548.1743820-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 07/12] drm/xe: Remove dependency on i915_reg.h
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
 Matt Roper <matthew.d.roper@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Copy the macros used by xe in i915_reg.h to regs/xe_regs.h. A minimal
cleanup is done while copying so they adhere minimally to the coding
style.  Further reordering and cleaning is left for later.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_regs.h      | 111 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_execlist.c       |   3 +-
 drivers/gpu/drm/xe/xe_ggtt.c           |   3 +-
 drivers/gpu/drm/xe/xe_gt_clock.c       |   3 +-
 drivers/gpu/drm/xe/xe_guc_pc.c         |   3 +-
 drivers/gpu/drm/xe/xe_hw_engine.c      |   3 +-
 drivers/gpu/drm/xe/xe_irq.c            |   3 +-
 drivers/gpu/drm/xe/xe_lrc.c            |   3 +-
 drivers/gpu/drm/xe/xe_mmio.c           |   3 +-
 drivers/gpu/drm/xe/xe_pci.c            |   3 +-
 drivers/gpu/drm/xe/xe_ring_ops.c       |   4 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |   3 +-
 drivers/gpu/drm/xe/xe_wa.c             |   3 +-
 13 files changed, 123 insertions(+), 25 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_regs.h

diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
new file mode 100644
index 000000000000..53f1ed54fb1c
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -0,0 +1,111 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#ifndef _XE_REGS_H_
+#define _XE_REGS_H_
+
+#include "i915_reg_defs.h"
+
+#define GU_CNTL					_MMIO(0x101010)
+#define   LMEM_INIT				REG_BIT(7)
+
+#define RENDER_RING_BASE			0x02000
+#define BSD_RING_BASE				0x04000
+#define GEN6_BSD_RING_BASE			0x12000
+#define GEN8_BSD2_RING_BASE			0x1c000
+#define GEN11_BSD_RING_BASE			0x1c0000
+#define GEN11_BSD2_RING_BASE			0x1c4000
+#define GEN11_BSD3_RING_BASE			0x1d0000
+#define GEN11_BSD4_RING_BASE			0x1d4000
+#define XEHP_BSD5_RING_BASE			0x1e0000
+#define XEHP_BSD6_RING_BASE			0x1e4000
+#define XEHP_BSD7_RING_BASE			0x1f0000
+#define XEHP_BSD8_RING_BASE			0x1f4000
+#define VEBOX_RING_BASE				0x1a000
+#define GEN11_VEBOX_RING_BASE			0x1c8000
+#define GEN11_VEBOX2_RING_BASE			0x1d8000
+#define XEHP_VEBOX3_RING_BASE			0x1e8000
+#define XEHP_VEBOX4_RING_BASE			0x1f8000
+#define GEN12_COMPUTE0_RING_BASE		0x1a000
+#define GEN12_COMPUTE1_RING_BASE		0x1c000
+#define GEN12_COMPUTE2_RING_BASE		0x1e000
+#define GEN12_COMPUTE3_RING_BASE		0x26000
+#define BLT_RING_BASE				0x22000
+#define XEHPC_BCS1_RING_BASE			0x3e0000
+#define XEHPC_BCS2_RING_BASE			0x3e2000
+#define XEHPC_BCS3_RING_BASE			0x3e4000
+#define XEHPC_BCS4_RING_BASE			0x3e6000
+#define XEHPC_BCS5_RING_BASE			0x3e8000
+#define XEHPC_BCS6_RING_BASE			0x3ea000
+#define XEHPC_BCS7_RING_BASE			0x3ec000
+#define XEHPC_BCS8_RING_BASE			0x3ee000
+#define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
+#define   GT_CONTEXT_SWITCH_INTERRUPT		(1 <<  8)
+#define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	(1 <<  4)
+#define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
+#define   GT_RENDER_USER_INTERRUPT		(1 <<  0)
+
+#define GEN7_FF_THREAD_MODE			_MMIO(0x20a0)
+#define   GEN12_FF_TESSELATION_DOP_GATE_DISABLE BIT(19)
+
+#define PVC_RP_STATE_CAP			_MMIO(0x281014)
+#define MTL_RP_STATE_CAP			_MMIO(0x138000)
+
+#define MTL_MEDIAP_STATE_CAP			_MMIO(0x138020)
+#define   MTL_RP0_CAP_MASK			REG_GENMASK(8, 0)
+#define   MTL_RPN_CAP_MASK			REG_GENMASK(24, 16)
+
+#define MTL_GT_RPE_FREQUENCY			_MMIO(0x13800c)
+#define MTL_MPE_FREQUENCY			_MMIO(0x13802c)
+#define   MTL_RPE_MASK				REG_GENMASK(8, 0)
+
+#define TRANSCODER_A_OFFSET			0x60000
+#define TRANSCODER_B_OFFSET			0x61000
+#define TRANSCODER_C_OFFSET			0x62000
+#define TRANSCODER_D_OFFSET			0x63000
+#define TRANSCODER_DSI0_OFFSET			0x6b000
+#define TRANSCODER_DSI1_OFFSET			0x6b800
+#define PIPE_A_OFFSET				0x70000
+#define PIPE_B_OFFSET				0x71000
+#define PIPE_C_OFFSET				0x72000
+#define PIPE_D_OFFSET				0x73000
+#define PIPE_DSI0_OFFSET			0x7b000
+#define PIPE_DSI1_OFFSET			0x7b800
+
+#define GEN8_PCU_ISR				_MMIO(0x444e0)
+#define GEN8_PCU_IMR				_MMIO(0x444e4)
+#define GEN8_PCU_IIR				_MMIO(0x444e8)
+#define GEN8_PCU_IER				_MMIO(0x444ec)
+
+#define GEN11_GU_MISC_ISR			_MMIO(0x444f0)
+#define GEN11_GU_MISC_IMR			_MMIO(0x444f4)
+#define GEN11_GU_MISC_IIR			_MMIO(0x444f8)
+#define GEN11_GU_MISC_IER			_MMIO(0x444fc)
+#define   GEN11_GU_MISC_GSE			(1 << 27)
+
+#define GEN11_GFX_MSTR_IRQ			_MMIO(0x190010)
+#define   GEN11_MASTER_IRQ			(1 << 31)
+#define   GEN11_GU_MISC_IRQ			(1 << 29)
+#define   GEN11_DISPLAY_IRQ			(1 << 16)
+#define   GEN11_GT_DW_IRQ(x)			(1 << (x))
+
+#define DG1_MSTR_TILE_INTR			_MMIO(0x190008)
+#define   DG1_MSTR_IRQ				REG_BIT(31)
+#define   DG1_MSTR_TILE(t)			REG_BIT(t)
+
+#define GEN9_TIMESTAMP_OVERRIDE					_MMIO(0x44074)
+#define   GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_SHIFT	0
+#define   GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK	0x3ff
+#define   GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_SHIFT	12
+#define   GEN9_TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	(0xf << 12)
+
+#define GGC					_MMIO(0x108040)
+#define   GMS_MASK				REG_GENMASK(15, 8)
+#define   GGMS_MASK				REG_GENMASK(7, 6)
+
+#define GEN12_GSMBASE				_MMIO(0x108100)
+#define GEN12_DSMBASE				_MMIO(0x1080C0)
+#define   GEN12_BDSM_MASK			REG_GENMASK64(63, 20)
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 59cfbeec09d1..be0a3741eff8 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -11,6 +11,7 @@
 #include "regs/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_lrc_layout.h"
+#include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_engine.h"
@@ -23,8 +24,6 @@
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 
-#include "i915_reg.h"
-
 #define XE_EXECLIST_HANG_LIMIT 1
 
 #define GEN11_SW_CTX_ID_SHIFT 37
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 09637f0845a7..a0d672b6afb2 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -11,6 +11,7 @@
 #include <drm/i915_drm.h>
 
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt.h"
@@ -19,8 +20,6 @@
 #include "xe_mmio.h"
 #include "xe_wopcm.h"
 
-#include "i915_reg.h"
-
 /* FIXME: Common file, preferably auto-gen */
 #define MTL_GGTT_PTE_PAT0	BIT_ULL(52)
 #define MTL_GGTT_PTE_PAT1	BIT_ULL(53)
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index fd0ca33925cd..60a2966bc1fd 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -6,13 +6,12 @@
 #include "xe_gt_clock.h"
 
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_regs.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
 
-#include "i915_reg.h"
-
 static u32 read_reference_ts_freq(struct xe_gt *gt)
 {
 	u32 ts_override = xe_mmio_read32(gt, GEN9_TIMESTAMP_OVERRIDE.reg);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index f983f47cefb6..acaba5c375e5 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -10,6 +10,7 @@
 #include <drm/drm_managed.h>
 
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt.h"
@@ -20,8 +21,6 @@
 #include "xe_mmio.h"
 #include "xe_pcode.h"
 
-#include "i915_reg.h"
-#include "i915_reg_defs.h"
 #include "intel_mchbar_regs.h"
 
 /* For GEN6_RP_STATE_CAP.reg to be merged when the definition moves to Xe */
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 2cf42afd97d9..ff6ba0d8b9a6 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -9,6 +9,7 @@
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_execlist.h"
@@ -23,8 +24,6 @@
 #include "xe_sched_job.h"
 #include "xe_wa.h"
 
-#include "i915_reg.h"
-
 #define MAX_MMIO_BASES 3
 struct engine_info {
 	const char *name;
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 17e204e74714..ae2f65c00fa6 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -10,6 +10,7 @@
 #include <drm/drm_managed.h>
 
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_regs.h"
 #include "xe_device.h"
 #include "xe_display.h"
 #include "xe_drv.h"
@@ -18,8 +19,6 @@
 #include "xe_hw_engine.h"
 #include "xe_mmio.h"
 
-#include "i915_reg.h"
-
 static void gen3_assert_iir_is_zero(struct xe_gt *gt, i915_reg_t reg)
 {
 	u32 val = xe_mmio_read32(gt, reg.reg);
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 4435ec750489..af4518a82db2 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -9,6 +9,7 @@
 #include "regs/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_lrc_layout.h"
+#include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_engine_types.h"
@@ -17,8 +18,6 @@
 #include "xe_map.h"
 #include "xe_vm.h"
 
-#include "i915_reg.h"
-
 #define GEN8_CTX_VALID				(1 << 0)
 #define GEN8_CTX_L3LLC_COHERENT			(1 << 5)
 #define GEN8_CTX_PRIVILEGE			(1 << 8)
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 5e6ca0d2076a..65b0df9bb579 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -10,14 +10,13 @@
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_regs.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_macros.h"
 #include "xe_module.h"
 
-#include "i915_reg.h"
-
 #define XEHP_MTCFG_ADDR		_MMIO(0x101800)
 #define TILE_COUNT		REG_GENMASK(15, 8)
 #define GEN12_LMEM_BAR		2
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 29270cce7a46..11dc0de66101 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -14,6 +14,7 @@
 #include <drm/drm_drv.h>
 #include <drm/xe_pciids.h>
 
+#include "regs/xe_regs.h"
 #include "xe_device.h"
 #include "xe_drv.h"
 #include "xe_macros.h"
@@ -21,8 +22,6 @@
 #include "xe_pm.h"
 #include "xe_step.h"
 
-#include "i915_reg.h"
-
 #define DEV_INFO_FOR_EACH_FLAG(func) \
 	func(require_force_probe); \
 	func(is_dgfx); \
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 16c56d0a9bb0..4441fe60cd00 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -8,6 +8,7 @@
 #include "regs/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_lrc_layout.h"
+#include "regs/xe_regs.h"
 #include "xe_engine_types.h"
 #include "xe_gt.h"
 #include "xe_lrc.h"
@@ -15,8 +16,6 @@
 #include "xe_sched_job.h"
 #include "xe_vm_types.h"
 
-#include "i915_reg.h"
-
 /*
  * 3D-related flags that can't be set on _engines_ that lack access to the 3D
  * pipeline (i.e., CCS engines).
@@ -40,7 +39,6 @@
 		PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE | \
 		PIPE_CONTROL_DC_FLUSH_ENABLE)
 
-
 static u32 preparser_disable(bool state)
 {
 	return MI_ARB_CHECK | BIT(8) | state;
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index fe0f707ad054..2e8d07ad42ae 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -11,8 +11,7 @@
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_range_manager.h>
 
-#include "../i915/i915_reg.h"
-
+#include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt.h"
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 155cfd1dcc50..df72b15dfeb0 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -9,6 +9,7 @@
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_regs.h"
 #include "xe_device_types.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
@@ -18,8 +19,6 @@
 #include "xe_rtp.h"
 #include "xe_step.h"
 
-#include "i915_reg.h"
-
 /**
  * DOC: Hardware workarounds
  *
-- 
2.39.0

