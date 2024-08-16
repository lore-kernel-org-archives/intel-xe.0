Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B322C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 19:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2770610E829;
	Fri, 16 Aug 2024 19:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="erHEt/ZO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7009A10E828
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 19:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723834845; x=1755370845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kLM86aGBykKOkFO5qn22n8IVixrbYt43e2L/rqq+D5A=;
 b=erHEt/ZOwXVrEebpoxiKAqFw45iTwl41d3WtKNW6WKykXlhEYPifixJW
 n6I+/XCZGTapBbsq7zfYNF12IgMMHw9wCR8Lpu2WHHzpSbTXCRuyL1Mg0
 xOMKzU5H6OZxi6RC/qGYZfW0hQJx4DSYB2fP0B3tGV8jb4tXeMlWvr05o
 HMCVo6Su6/aXSDn/neSePYpvqgvv3c80H85nHeBd5/33BmY9aFL+SkUeD
 QHj+M+Tm1y9K/MfxlYQuEreAPHpLOovaC2a3WHfPS7982Wpt0RVMYP5TK
 o/Ovio2vRXZtMhuJ1SgjbDh1LRNKO0HTPN6OAFiqnXbeVNQ+yRvwAGfp/ w==;
X-CSE-ConnectionGUID: Q4fey2ExR7+IZHTr1/xhiw==
X-CSE-MsgGUID: wBX6vyVuTfmjTOMLw38Spg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21772448"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="21772448"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 12:00:44 -0700
X-CSE-ConnectionGUID: Yi+vOPxNTIq4vTTDz+ypLg==
X-CSE-MsgGUID: TqkCCIPWTzm9mOno7ilS8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="59767949"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 12:00:44 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 03/12] drm/xe/pxp: Add VCS inline termination support
Date: Fri, 16 Aug 2024 12:00:12 -0700
Message-ID: <20240816190024.2176976-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
References: <20240816190024.2176976-1-daniele.ceraolospurio@intel.com>
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

The key termination is done with a specific submission to the VCS
engine.

Note that this patch is meant to be squashed with the follow-up patches
that implement the other pieces of the termination flow. It is separate
for now for ease of review.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 .../gpu/drm/xe/instructions/xe_instr_defs.h   |   1 +
 .../gpu/drm/xe/instructions/xe_mfx_commands.h |  29 +++++
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   5 +
 drivers/gpu/drm/xe/xe_lrc.h                   |   3 +-
 drivers/gpu/drm/xe/xe_pxp_submit.c            | 108 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_pxp_submit.h            |   2 +
 drivers/gpu/drm/xe/xe_ring_ops.c              |   4 +-
 7 files changed, 149 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/instructions/xe_mfx_commands.h

diff --git a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
index fd2ce7ace510..e559969468c4 100644
--- a/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
+++ b/drivers/gpu/drm/xe/instructions/xe_instr_defs.h
@@ -16,6 +16,7 @@
 #define XE_INSTR_CMD_TYPE		GENMASK(31, 29)
 #define   XE_INSTR_MI			REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x0)
 #define   XE_INSTR_GSC			REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x2)
+#define   XE_INSTR_VIDEOPIPE		REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x3)
 #define   XE_INSTR_GFXPIPE		REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x3)
 #define   XE_INSTR_GFX_STATE		REG_FIELD_PREP(XE_INSTR_CMD_TYPE, 0x4)
 
diff --git a/drivers/gpu/drm/xe/instructions/xe_mfx_commands.h b/drivers/gpu/drm/xe/instructions/xe_mfx_commands.h
new file mode 100644
index 000000000000..686ca3b1d9e8
--- /dev/null
+++ b/drivers/gpu/drm/xe/instructions/xe_mfx_commands.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_MFX_COMMANDS_H_
+#define _XE_MFX_COMMANDS_H_
+
+#include "instructions/xe_instr_defs.h"
+
+#define MFX_CMD_SUBTYPE		REG_GENMASK(28, 27) /* A.K.A cmd pipe */
+#define MFX_CMD_OPCODE		REG_GENMASK(26, 24)
+#define MFX_CMD_SUB_OPCODE	REG_GENMASK(23, 16)
+#define MFX_FLAGS_AND_LEN	REG_GENMASK(15, 0)
+
+#define XE_MFX_INSTR(subtype, op, sub_op, flags) \
+	(XE_INSTR_VIDEOPIPE | \
+	 REG_FIELD_PREP(MFX_CMD_SUBTYPE, subtype) | \
+	 REG_FIELD_PREP(MFX_CMD_OPCODE, op) | \
+	 REG_FIELD_PREP(MFX_CMD_SUB_OPCODE, sub_op) | \
+	 REG_FIELD_PREP(MFX_FLAGS_AND_LEN, flags))
+
+#define MFX_WAIT				XE_MFX_INSTR(1, 0, 0, 0)
+#define MFX_WAIT_DW0_PXP_SYNC_CONTROL_FLAG	REG_BIT(9)
+#define MFX_WAIT_DW0_MFX_SYNC_CONTROL_FLAG	REG_BIT(8)
+
+#define CRYPTO_KEY_EXCHANGE			XE_MFX_INSTR(2, 6, 9, 0)
+
+#endif
diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
index 10ec2920d31b..167fb0f742de 100644
--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
@@ -48,6 +48,7 @@
 #define   MI_LRI_LEN(x)			(((x) & 0xff) + 1)
 
 #define MI_FLUSH_DW			__MI_INSTR(0x26)
+#define   MI_FLUSH_DW_PROTECTED_MEM_EN	REG_BIT(22)
 #define   MI_FLUSH_DW_STORE_INDEX	REG_BIT(21)
 #define   MI_INVALIDATE_TLB		REG_BIT(18)
 #define   MI_FLUSH_DW_CCS		REG_BIT(16)
@@ -66,4 +67,8 @@
 
 #define MI_BATCH_BUFFER_START		__MI_INSTR(0x31)
 
+#define MI_SET_APPID			__MI_INSTR(0x0e)
+#define MI_SET_APPID_SESSION_ID_MASK	REG_GENMASK(6, 0)
+#define MI_SET_APPID_SESSION_ID(x)	REG_FIELD_PREP(MI_SET_APPID_SESSION_ID_MASK, x)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index c24542e89318..d411c3fbcbc6 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -20,7 +20,8 @@ struct xe_lrc;
 struct xe_lrc_snapshot;
 struct xe_vm;
 
-#define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
+#define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
+#define LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR (0x40 * 4)
 
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 			     u32 ring_size);
diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
index b777b0765c8a..3b69dcc0a00f 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.c
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
@@ -6,14 +6,20 @@
 #include "xe_pxp_submit.h"
 
 #include <drm/xe_drm.h>
+#include <linux/delay.h>
 
 #include "xe_device_types.h"
+#include "xe_bb.h"
 #include "xe_bo.h"
 #include "xe_exec_queue.h"
 #include "xe_gsc_submit.h"
 #include "xe_gt.h"
+#include "xe_lrc.h"
 #include "xe_pxp_types.h"
+#include "xe_sched_job.h"
 #include "xe_vm.h"
+#include "instructions/xe_mfx_commands.h"
+#include "instructions/xe_mi_commands.h"
 #include "regs/xe_gt_regs.h"
 
 /*
@@ -199,3 +205,105 @@ void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp)
 	destroy_vcs_execution_resources(pxp);
 }
 
+#define emit_cmd(xe_, map_, offset_, val_) \
+	xe_map_wr(xe_, map_, (offset_) * sizeof(u32), u32, val_)
+
+/* stall until prior PXP and MFX/HCP/HUC objects are cmopleted */
+#define MFX_WAIT_PXP (MFX_WAIT | \
+		      MFX_WAIT_DW0_PXP_SYNC_CONTROL_FLAG | \
+		      MFX_WAIT_DW0_MFX_SYNC_CONTROL_FLAG)
+static u32 pxp_emit_wait(struct xe_device *xe, struct iosys_map *batch, u32 offset)
+{
+	/* wait for cmds to go through */
+	emit_cmd(xe, batch, offset++, MFX_WAIT_PXP);
+	emit_cmd(xe, batch, offset++, 0);
+
+	return offset;
+}
+
+static u32 pxp_emit_session_selection(struct xe_device *xe, struct iosys_map *batch,
+				      u32 offset, u32 idx)
+{
+	offset = pxp_emit_wait(xe, batch, offset);
+
+	/* pxp off */
+	emit_cmd(xe, batch, offset++, MI_FLUSH_DW | MI_FLUSH_IMM_DW);
+	emit_cmd(xe, batch, offset++, 0);
+	emit_cmd(xe, batch, offset++, 0);
+	emit_cmd(xe, batch, offset++, 0);
+
+	/* select session */
+	emit_cmd(xe, batch, offset++, MI_SET_APPID | MI_SET_APPID_SESSION_ID(idx));
+	emit_cmd(xe, batch, offset++, MFX_WAIT_PXP);
+
+	/* pxp on */
+	emit_cmd(xe, batch, offset++, MI_FLUSH_DW |
+				      MI_FLUSH_DW_PROTECTED_MEM_EN |
+				      MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_DW_STORE_INDEX |
+				      MI_FLUSH_IMM_DW);
+	emit_cmd(xe, batch, offset++, LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR |
+				      MI_FLUSH_DW_USE_GTT);
+	emit_cmd(xe, batch, offset++, 0);
+	emit_cmd(xe, batch, offset++, 0);
+
+	offset = pxp_emit_wait(xe, batch, offset);
+
+	return offset;
+}
+
+static u32 pxp_emit_inline_termination(struct xe_device *xe,
+				       struct iosys_map *batch, u32 offset)
+{
+	/* session inline termination */
+	emit_cmd(xe, batch, offset++, CRYPTO_KEY_EXCHANGE);
+	emit_cmd(xe, batch, offset++, 0);
+
+	return offset;
+}
+
+static u32 pxp_emit_session_termination(struct xe_device *xe, struct iosys_map *batch,
+					u32 offset, u32 idx)
+{
+	offset = pxp_emit_session_selection(xe, batch, offset, idx);
+	offset = pxp_emit_inline_termination(xe, batch, offset);
+
+	return offset;
+}
+
+/**
+ * xe_pxp_submit_session_termination - submits a PXP inline termination
+ * @pxp: the xe_pxp structure
+ * @id: the session to terminate
+ *
+ * Emit an inline termination via the VCS engine to terminate a session.
+ *
+ * Returns 0 if the submission is successful, an errno value otherwise.
+ */
+int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id)
+{
+	struct xe_sched_job *job;
+	struct dma_fence *fence;
+	long timeout;
+	u32 offset = 0;
+	u64 addr = xe_bo_ggtt_addr(pxp->vcs_exec.bo);
+
+	offset = pxp_emit_session_termination(pxp->xe, &pxp->vcs_exec.bo->vmap, offset, id);
+	offset = pxp_emit_wait(pxp->xe, &pxp->vcs_exec.bo->vmap, offset);
+	emit_cmd(pxp->xe, &pxp->vcs_exec.bo->vmap, offset, MI_BATCH_BUFFER_END);
+
+	job =  xe_sched_job_create(pxp->vcs_exec.q, &addr);
+	if (IS_ERR(job))
+		return PTR_ERR(job);
+
+	xe_sched_job_arm(job);
+	fence = dma_fence_get(&job->drm.s_fence->finished);
+	xe_sched_job_push(job);
+
+	timeout = dma_fence_wait_timeout(fence, false, HZ);
+
+	dma_fence_put(fence);
+	if (timeout <= 0)
+		return -EAGAIN;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.h b/drivers/gpu/drm/xe/xe_pxp_submit.h
index 1a971fadc081..4ee8c0acfed9 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.h
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.h
@@ -13,4 +13,6 @@ struct xe_pxp;
 int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp);
 void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp);
 
+int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id);
+
 #endif /* __XE_PXP_SUBMIT_H__ */
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 0be4f489d3e1..a4b5a0f68a32 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -118,7 +118,7 @@ static int emit_flush_invalidate(u32 flag, u32 *dw, int i)
 	dw[i++] |= MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW |
 		MI_FLUSH_DW_STORE_INDEX;
 
-	dw[i++] = LRC_PPHWSP_SCRATCH_ADDR | MI_FLUSH_DW_USE_GTT;
+	dw[i++] = LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR | MI_FLUSH_DW_USE_GTT;
 	dw[i++] = 0;
 	dw[i++] = ~0U;
 
@@ -156,7 +156,7 @@ static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
 
 	flags &= ~mask_flags;
 
-	return emit_pipe_control(dw, i, 0, flags, LRC_PPHWSP_SCRATCH_ADDR, 0);
+	return emit_pipe_control(dw, i, 0, flags, LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
 }
 
 static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
-- 
2.43.0

