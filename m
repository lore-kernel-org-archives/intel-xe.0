Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41C9C6FA9E
	for <intel-xe@archiver.kernel.org>; Tue, 21 Feb 2023 19:41:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B9F10E656;
	Tue, 21 Feb 2023 19:41:23 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0591810E357
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Feb 2023 19:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677008479; x=1708544479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KkmVIHbMwD/FrFBZmrTx44FXNsjEw6Qc61QqYG6JNtI=;
 b=kWIJtECAMdgiaDij3vH8+sTvP0AvGVFC/j/fq/70WRBaQ00AUlj8vom9
 rfuIE5W8jB3TrlJxCsEPq7iJNy6mVtdcxslzKAC7fpz09B6Cc1kD8gsCw
 ZLcY6GLnaqUriG3NNY5Nb5U3U4EZUry9IRAh+rg2dlAZQ8mT3DLMDzmHW
 ZUZucT6hJ6/MQ/Pf+24TuQ4Jg4ERWBLGFAvIpPhYFth0y8Enrio03oG8X
 6/b7d+7RcrvjhOEwMFkeGX0mSR94MLaSksS5bNiwB5U7CyvujkuPzrrdg
 gXr4/gguQMruZGLIDAENt6KXfs9M6AFVwPXL1G0/iAkIka/oI5D+8EHFt w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="332735702"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="332735702"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 11:41:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="621622208"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="621622208"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 11:41:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Feb 2023 11:39:56 -0800
Message-Id: <20230221194002.819026-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230221194002.819026-1-lucas.demarchi@intel.com>
References: <20230221194002.819026-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 07/13] drm/xe: Remove dependency on
 intel_gpu_commands.h
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
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Copy the macros used by xe in intel_gpu_commands.h to
regs/xe_gpu_commands.h.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 96 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_bb.c                |  3 +-
 drivers/gpu/drm/xe/xe_device.h            |  3 +-
 drivers/gpu/drm/xe/xe_execlist.c          |  2 +-
 drivers/gpu/drm/xe/xe_lrc.c               |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c           |  3 +-
 drivers/gpu/drm/xe/xe_ring_ops.c          |  2 +-
 7 files changed, 102 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_gpu_commands.h

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
new file mode 100644
index 000000000000..bf6dc1c8563d
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GPU_COMMANDS_H_
+#define _XE_GPU_COMMANDS_H_
+
+#define INSTR_CLIENT_SHIFT      29
+#define   INSTR_MI_CLIENT       0x0
+#define __INSTR(client) ((client) << INSTR_CLIENT_SHIFT)
+
+#define MI_INSTR(opcode, flags) \
+	(__INSTR(INSTR_MI_CLIENT) | (opcode) << 23 | (flags))
+
+#define MI_NOOP			MI_INSTR(0, 0)
+#define MI_USER_INTERRUPT	MI_INSTR(0x02, 0)
+
+#define MI_ARB_ON_OFF		MI_INSTR(0x08, 0)
+#define   MI_ARB_ENABLE			(1<<0)
+#define   MI_ARB_DISABLE		(0<<0)
+
+#define MI_BATCH_BUFFER_END	MI_INSTR(0x0a, 0)
+#define MI_STORE_DATA_IMM	MI_INSTR(0x20, 0)
+
+#define MI_LOAD_REGISTER_IMM(x)	MI_INSTR(0x22, 2*(x)-1)
+#define   MI_LRI_LRM_CS_MMIO		REG_BIT(19)
+#define   MI_LRI_MMIO_REMAP_EN		REG_BIT(17)
+#define   MI_LRI_FORCE_POSTED		(1<<12)
+
+#define MI_FLUSH_DW		MI_INSTR(0x26, 1)
+#define   MI_FLUSH_DW_STORE_INDEX	(1<<21)
+#define   MI_INVALIDATE_TLB		(1<<18)
+#define   MI_FLUSH_DW_CCS		(1<<16)
+#define   MI_FLUSH_DW_OP_STOREDW	(1<<14)
+#define   MI_FLUSH_DW_USE_GTT		(1<<2)
+
+#define MI_BATCH_BUFFER_START_GEN8	MI_INSTR(0x31, 1)
+
+#define XY_CTRL_SURF_COPY_BLT		((2 << 29) | (0x48 << 22) | 3)
+#define   SRC_ACCESS_TYPE_SHIFT		21
+#define   DST_ACCESS_TYPE_SHIFT		20
+#define   CCS_SIZE_MASK			0x3FF
+#define   CCS_SIZE_SHIFT		8
+#define   XY_CTRL_SURF_MOCS_MASK	GENMASK(31, 25)
+#define   NUM_CCS_BYTES_PER_BLOCK	256
+#define   NUM_BYTES_PER_CCS_BYTE	256
+#define   NUM_CCS_BLKS_PER_XFER		1024
+
+#define XY_FAST_COLOR_BLT_CMD		(2 << 29 | 0x44 << 22)
+#define   XY_FAST_COLOR_BLT_DEPTH_32	(2 << 19)
+#define   XY_FAST_COLOR_BLT_DW		16
+#define   XY_FAST_COLOR_BLT_MOCS_MASK	GENMASK(27, 21)
+#define   XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT 31
+
+#define GEN9_XY_FAST_COPY_BLT_CMD	(2 << 29 | 0x42 << 22)
+#define   BLT_DEPTH_32			(3<<24)
+
+#define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
+#define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28)
+#define   PIPE_CONTROL_AMFS_FLUSH			(1<<25)
+#define   PIPE_CONTROL_GLOBAL_GTT_IVB			(1<<24)
+#define   PIPE_CONTROL_CS_STALL				(1<<20)
+#define   PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET		(1<<19)
+#define   PIPE_CONTROL_PSD_SYNC				(1<<17)
+#define   PIPE_CONTROL_QW_WRITE				(1<<14)
+#define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
+#define   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH	(1<<12)
+#define   PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE		(1<<10)
+#define   PIPE_CONTROL_INDIRECT_STATE_DISABLE		(1<<9)
+#define   PIPE_CONTROL_FLUSH_ENABLE			(1<<7)
+#define   PIPE_CONTROL_DC_FLUSH_ENABLE			(1<<5)
+#define   PIPE_CONTROL_VF_CACHE_INVALIDATE		(1<<4)
+#define   PIPE_CONTROL_STALL_AT_SCOREBOARD		(1<<1)
+#define   PIPE_CONTROL_DEPTH_CACHE_FLUSH		(1<<0)
+
+#define PIPE_CONTROL_3D_ENGINE_FLAGS (\
+		PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH | \
+		PIPE_CONTROL_DEPTH_CACHE_FLUSH | \
+		PIPE_CONTROL_TILE_CACHE_FLUSH | \
+		PIPE_CONTROL_DEPTH_STALL | \
+		PIPE_CONTROL_STALL_AT_SCOREBOARD | \
+		PIPE_CONTROL_PSD_SYNC | \
+		PIPE_CONTROL_AMFS_FLUSH | \
+		PIPE_CONTROL_VF_CACHE_INVALIDATE | \
+		PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET)
+#define PIPE_CONTROL_3D_ARCH_FLAGS ( \
+		PIPE_CONTROL_3D_ENGINE_FLAGS | \
+		PIPE_CONTROL_INDIRECT_STATE_DISABLE | \
+		PIPE_CONTROL_FLUSH_ENABLE | \
+		PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE | \
+		PIPE_CONTROL_DC_FLUSH_ENABLE)
+
+#define MI_ARB_CHECK            MI_INSTR(0x05, 0)
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index d10448d1b4d7..5b24018e2a80 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -5,6 +5,7 @@
 
 #include "xe_bb.h"
 
+#include "regs/xe_gpu_commands.h"
 #include "xe_device.h"
 #include "xe_engine_types.h"
 #include "xe_hw_fence.h"
@@ -12,8 +13,6 @@
 #include "xe_sched_job.h"
 #include "xe_vm_types.h"
 
-#include "gt/intel_gpu_commands.h"
-
 struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
 {
 	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 88d55671b068..ee10b6c11e9f 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -11,12 +11,11 @@ struct xe_file;
 
 #include <drm/drm_util.h>
 
+#include "regs/xe_gpu_commands.h"
 #include "xe_device_types.h"
 #include "xe_macros.h"
 #include "xe_force_wake.h"
 
-#include "gt/intel_gpu_commands.h"
-
 static inline struct xe_device *to_xe_device(const struct drm_device *dev)
 {
 	return container_of(dev, struct xe_device, drm);
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 84d3db9c8518..3b6d8a22ecda 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -9,6 +9,7 @@
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_lrc_regs.h"
+#include "regs/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -22,7 +23,6 @@
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 
-#include "gt/intel_gpu_commands.h"
 #include "i915_reg.h"
 
 #define XE_EXECLIST_HANG_LIMIT 1
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index a6b1453ccf9c..4a19a15f26b7 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -7,6 +7,7 @@
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_lrc_regs.h"
+#include "regs/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
@@ -16,7 +17,6 @@
 #include "xe_map.h"
 #include "xe_vm.h"
 
-#include "gt/intel_gpu_commands.h"
 #include "i915_reg.h"
 
 #define GEN8_CTX_VALID				(1 << 0)
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index a3f35fec1b67..6c0033cb238f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -11,6 +11,7 @@
 #include <drm/ttm/ttm_tt.h>
 #include <drm/xe_drm.h>
 
+#include "regs/xe_gpu_commands.h"
 #include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_engine.h"
@@ -27,8 +28,6 @@
 #include "xe_trace.h"
 #include "xe_vm.h"
 
-#include "gt/intel_gpu_commands.h"
-
 /**
  * struct xe_migrate - migrate context.
  */
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 663910712035..43e4390b7cb0 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -6,6 +6,7 @@
 #include "xe_ring_ops.h"
 
 #include "regs/xe_lrc_regs.h"
+#include "regs/xe_gpu_commands.h"
 #include "regs/xe_gt_regs.h"
 #include "xe_engine_types.h"
 #include "xe_gt.h"
@@ -14,7 +15,6 @@
 #include "xe_sched_job.h"
 #include "xe_vm_types.h"
 
-#include "gt/intel_gpu_commands.h"
 #include "i915_reg.h"
 
 static u32 preparser_disable(bool state)
-- 
2.39.0

