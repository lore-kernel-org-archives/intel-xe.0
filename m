Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB42DD743F3
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 23:44:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC4710E183;
	Wed, 20 Nov 2024 23:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8b6eoLM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C938A10E183
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Nov 2024 23:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732146246; x=1763682246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YhHjTakGBFyIXadnw/z/s6rmJx1KMB5n2515p70wLOc=;
 b=Q8b6eoLMGP/SLEpCGQ9akThINdU6JcD4DbGGrJBsPNOY/HUSCbOLiJQj
 b3zBMnUdwWrN2RE1JIXO5+c4bIwZB4KAtyYaaC8Y1CXDANx9/md39CGHk
 fS2b3oIeBVwcBZRH2ikmOylhO9lhgwg4VqfIVIzC12aDYYtcHbzPfqZ39
 7lqs8j4raRuZ7JPywNU03XSMTN/gxsqOrPiELl4sYyC3fUyjreZ+AWmPS
 bIOWo4Q66MlLt4BuquDJjqlf1UCqk6EbnAhcSRckKGvMc5s+lOduNHK8G
 QACSJanUPxOvPJx9LaM8VHnubha3ZWzG3TcfoAtaVfFcupV4ndO7Hm1xz Q==;
X-CSE-ConnectionGUID: WyQ8QR9ERlWCMD8tvUVRCw==
X-CSE-MsgGUID: CIGLrl4uTnexqASKAkI9ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="54733277"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="54733277"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 15:44:05 -0800
X-CSE-ConnectionGUID: a6isr6c7Qg2i+1RGIvNcPA==
X-CSE-MsgGUID: uL0jp34HQe2y/GZ6d/gzZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="90453633"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 15:44:05 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 03/12] drm/xe/pxp: Add VCS inline termination support
Date: Wed, 20 Nov 2024 15:43:43 -0800
Message-ID: <20241120234353.1037180-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
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

v2: clean up defines and command emission code. (John)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/xe/instructions/xe_instr_defs.h   |   1 +
 .../gpu/drm/xe/instructions/xe_mfx_commands.h |  28 +++++
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   5 +
 drivers/gpu/drm/xe/xe_lrc.h                   |   3 +-
 drivers/gpu/drm/xe/xe_pxp_submit.c            | 113 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_pxp_submit.h            |   4 +
 drivers/gpu/drm/xe/xe_ring_ops.c              |   4 +-
 7 files changed, 155 insertions(+), 3 deletions(-)
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
index 000000000000..3c0c97f78e90
--- /dev/null
+++ b/drivers/gpu/drm/xe/instructions/xe_mfx_commands.h
@@ -0,0 +1,28 @@
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
+#define XE_MFX_INSTR(subtype, op, sub_op) \
+	(XE_INSTR_VIDEOPIPE | \
+	 REG_FIELD_PREP(MFX_CMD_SUBTYPE, subtype) | \
+	 REG_FIELD_PREP(MFX_CMD_OPCODE, op) | \
+	 REG_FIELD_PREP(MFX_CMD_SUB_OPCODE, sub_op))
+
+#define MFX_WAIT				XE_MFX_INSTR(1, 0, 0)
+#define MFX_WAIT_DW0_PXP_SYNC_CONTROL_FLAG	REG_BIT(9)
+#define MFX_WAIT_DW0_MFX_SYNC_CONTROL_FLAG	REG_BIT(8)
+
+#define CRYPTO_KEY_EXCHANGE			XE_MFX_INSTR(2, 6, 9)
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
index b459dcab8787..9bc86c1fc16f 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -39,7 +39,8 @@ struct xe_lrc_snapshot {
 	u32 ctx_job_timestamp;
 };
 
-#define LRC_PPHWSP_SCRATCH_ADDR (0x34 * 4)
+#define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
+#define LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR (0x40 * 4)
 
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
 			     u32 ring_size);
diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
index 196c0e5bbb17..326baea679a3 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.c
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
@@ -5,15 +5,21 @@
 
 #include "xe_pxp_submit.h"
 
+#include <linux/delay.h>
 #include <uapi/drm/xe_drm.h>
 
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
 
 /*
  * The VCS is used for kernel-owned GGTT submissions to issue key termination.
@@ -198,3 +204,110 @@ void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp)
 	destroy_vcs_execution_resources(pxp);
 }
 
+#define emit_cmd(xe_, map_, offset_, val_) \
+	xe_map_wr(xe_, map_, (offset_) * sizeof(u32), u32, val_)
+
+/* stall until prior PXP and MFX/HCP/HUC objects are completed */
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
+	emit_cmd(xe, batch, offset++, 0);
+
+	offset = pxp_emit_wait(xe, batch, offset);
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
+	job = xe_sched_job_create(pxp->vcs_exec.q, &addr);
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
+
+	if (!timeout)
+		return -ETIMEDOUT;
+	else if (timeout < 0)
+		return timeout;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.h b/drivers/gpu/drm/xe/xe_pxp_submit.h
index fd21ac935be1..4ee8c0acfed9 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.h
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.h
@@ -6,9 +6,13 @@
 #ifndef __XE_PXP_SUBMIT_H__
 #define __XE_PXP_SUBMIT_H__
 
+#include <linux/types.h>
+
 struct xe_pxp;
 
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

