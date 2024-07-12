Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C60C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 21:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFDF10E834;
	Fri, 12 Jul 2024 21:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hFMxHXrn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE64510E834
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 21:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720819764; x=1752355764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nf4fLSDjW9zYslj8FSWaho8nhv+ZhB1pOU2Mh3y0MDA=;
 b=hFMxHXrnRSKbUmWyLBGcaZldOzGJkLoOTnBu7s3KVri7vtce4W9JCUds
 6QPgOmjKfJaRT9taGnRpUnY9wvKa/PycqyRnRH+e3HCloFcZVqaB3gcCy
 A1VNinLnXp57U0kKfPiW1wivVtwJmS/WKNA1HYN/BrbbYeGBqWRRLC1oy
 /5dyuRGGCo4x8f4e544LX1lEgoHlmPnJzgtarvsfObhpOoGTozQoeFoRf
 xHDDQ6TFEBFUooyXvfZEVvo0D3jDcJAfCXNR8LWhRwwnrqNznexdj/E/l
 LnSdOmuxz1XXSGXtrDPJWyc3yfxf0c8wUFJArQb+OJmWnI4LxqUNwaU+X A==;
X-CSE-ConnectionGUID: vOBdbpb0RliKLvdy2XaYUA==
X-CSE-MsgGUID: vBM8l29FSFihZI6DoOLkCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="17990158"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="17990158"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 14:29:23 -0700
X-CSE-ConnectionGUID: 9H8OonRARHWhjOy6CZcSJA==
X-CSE-MsgGUID: wCiZwDlZS22lH9txnU4doQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="53864581"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 14:29:24 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [RFC 04/14] drm/xe/pxp: Add VCS inline termination support
Date: Fri, 12 Jul 2024 14:28:48 -0700
Message-ID: <20240712212901.2684239-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
References: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
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
 drivers/gpu/drm/xe/xe_pxp_submit.c            | 100 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_pxp_submit.h            |   2 +
 drivers/gpu/drm/xe/xe_ring_ops.c              |   4 +-
 7 files changed, 141 insertions(+), 3 deletions(-)
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
index 000000000000..a95fc96e49e3
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
+       (XE_INSTR_VIDEOPIPE | \
+	REG_FIELD_PREP(MFX_CMD_SUBTYPE, subtype) | \
+	REG_FIELD_PREP(MFX_CMD_OPCODE, op) | \
+	REG_FIELD_PREP(MFX_CMD_SUB_OPCODE, sub_op) | \
+	REG_FIELD_PREP(MFX_FLAGS_AND_LEN, flags))
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
index 4fc3c7c58101..88200315a882 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.c
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
@@ -6,14 +6,19 @@
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
 #include "xe_vm.h"
+#include "instructions/xe_mfx_commands.h"
+#include "instructions/xe_mi_commands.h"
 #include "regs/xe_gt_regs.h"
 
 static int create_vcs_context(struct xe_pxp *pxp)
@@ -186,3 +191,98 @@ void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp)
 	destroy_gsc_execution_resources(pxp);
 	destroy_vcs_context(pxp);
 }
+
+/* stall until prior PXP and MFX/HCP/HUC objects are cmopleted */
+#define MFX_WAIT_PXP (MFX_WAIT | \
+		      MFX_WAIT_DW0_PXP_SYNC_CONTROL_FLAG | \
+		      MFX_WAIT_DW0_MFX_SYNC_CONTROL_FLAG)
+
+static void pxp_emit_wait(struct xe_bb *bb)
+{
+	/* wait for cmds to go through */
+	bb->cs[bb->len++] = MFX_WAIT_PXP;
+	bb->cs[bb->len++] = 0;
+}
+
+static void pxp_emit_session_selection(struct xe_bb *bb, u32 idx)
+{
+	pxp_emit_wait(bb);
+
+	/* pxp off */
+	bb->cs[bb->len++] = MI_FLUSH_DW | MI_FLUSH_IMM_DW;
+	bb->cs[bb->len++] = 0;
+	bb->cs[bb->len++] = 0;
+	bb->cs[bb->len++] = 0;
+
+	/* select session */
+	bb->cs[bb->len++] = MI_SET_APPID | MI_SET_APPID_SESSION_ID(idx);
+
+	bb->cs[bb->len++] = MFX_WAIT_PXP;
+
+	/* pxp on */
+	bb->cs[bb->len++] = MI_FLUSH_DW | MI_FLUSH_DW_PROTECTED_MEM_EN |
+			    MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_DW_STORE_INDEX |
+			    MI_FLUSH_IMM_DW;
+	bb->cs[bb->len++] = LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR | MI_FLUSH_DW_USE_GTT;
+	bb->cs[bb->len++] = 0;
+	bb->cs[bb->len++] = 0;
+
+	pxp_emit_wait(bb);
+}
+
+static void pxp_emit_inline_termination(struct xe_bb *bb)
+{
+	/* session inline termination */
+	bb->cs[bb->len++] = CRYPTO_KEY_EXCHANGE;
+	bb->cs[bb->len++] = 0;
+}
+
+static void pxp_emit_session_termination(struct xe_bb *bb, u32 idx)
+{
+	pxp_emit_session_selection(bb, idx);
+	pxp_emit_inline_termination(bb);
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
+	struct xe_gt *gt = pxp->gt;
+	struct xe_sched_job *job;
+	struct xe_bb *bb;
+	struct dma_fence *fence;
+	long timeout;
+
+	bb = xe_bb_new(gt, SZ_4K, false);
+	if (IS_ERR(bb))
+		return PTR_ERR(bb);
+
+	pxp_emit_session_termination(bb, id);
+	pxp_emit_wait(bb);
+
+	job = xe_bb_create_job(pxp->vcs_queue, bb);
+	if (IS_ERR(job)) {
+		xe_bb_free(bb, NULL);
+		return PTR_ERR(job);
+	}
+
+	xe_sched_job_arm(job);
+	fence = dma_fence_get(&job->drm.s_fence->finished);
+	xe_sched_job_push(job);
+
+	timeout = dma_fence_wait_timeout(fence, false, HZ);
+
+	dma_fence_put(fence);
+	xe_bb_free(bb, NULL);
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

