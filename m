Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09435C83F34
	for <intel-xe@archiver.kernel.org>; Sat, 19 Jul 2025 07:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C003E10E1E7;
	Sat, 19 Jul 2025 07:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Npuw4ODN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A5810E1E7
 for <intel-xe@lists.freedesktop.org>; Sat, 19 Jul 2025 07:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752910674; x=1784446674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9HDNK0yYDzlj1yDMwqAfJEBQPLyJMWtmKc44nKaq8z8=;
 b=Npuw4ODNEthI0QUyHrp1cPnkhrnpAG9Wh02c9nE/M7g4nM349A46nkpZ
 IGjwsjjfir0FBeqF65an5YYh2TBPCd7kNA0zz35Z24S+0bL/J+wK2NVAq
 WxiEb/TMeO1fckoW/KQU8FU7LLJegVVIKBWrJdRAbx1sjch5FQVvJCSEG
 EoBrzEiV4nhC5fc7NUDxbaM6ipGsVNbxPYdDIplhr4GL8SMkwAwetvYJG
 zCVggVVOwPLFdRPpCzlhoWxWj/5jhHpvJaTEVxO2GHeGcPS53z/7pjJNx
 j34JW09fA5AzdGpDeiP0FZ1sW38EIwcSEgp9lgiIycVG46ur30E7EI/zO Q==;
X-CSE-ConnectionGUID: zuFLFbH+T/eRT2D+fMaGKQ==
X-CSE-MsgGUID: 4v1+Dm96Si2eV8N/JM0Fqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="55159710"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; d="scan'208";a="55159710"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2025 00:37:54 -0700
X-CSE-ConnectionGUID: uuB/GI65QeqQrBdlRcfiuA==
X-CSE-MsgGUID: iwWI3nLGT9eHiEVlBizq9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; d="scan'208";a="158844453"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa008.jf.intel.com with ESMTP; 19 Jul 2025 00:37:51 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v7 8/9] drm/xe/vf: Refresh utilization buffer during migration
 recovery
Date: Sat, 19 Jul 2025 09:37:44 +0200
Message-Id: <20250719073745.74251-9-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250719073745.74251-1-tomasz.lis@intel.com>
References: <20250719073745.74251-1-tomasz.lis@intel.com>
MIME-Version: 1.0
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

The WA buffer we use to capture context utilization contains GGTT
references. This means its instructions have to be either fixed or
re-emitted during VF post-migration recovery.

This patch adds re-emitting content of the utilization WA BB during
the recovery.

The way we write to vram requires scratch buffer to be used before
the whole block is memcopied. We are re-using a scratch buffer
introduced in earlier part of the recovery.

v2: Notable rebase after "Prepare WA BB setup for more users" patch

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  1 +
 drivers/gpu/drm/xe/xe_lrc.c        | 39 ++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_lrc.h        |  4 +++
 drivers/gpu/drm/xe/xe_sriov_vf.c   |  2 +-
 4 files changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index bd8de62cb228..ca8132c09efb 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1042,6 +1042,7 @@ void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
 	for (i = 0; i < q->width; ++i) {
 		xe_lrc_update_memirq_regs_with_address(q->lrc[i], q->hwe, scratch);
 		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
+		xe_lrc_setup_wa_bb_with_scratch(q->lrc[i], q->hwe, scratch);
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 3b6d9d1dc93d..e260c5823797 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -41,7 +41,6 @@
 #define LRC_PPHWSP_SIZE				SZ_4K
 #define LRC_INDIRECT_CTX_BO_SIZE		SZ_4K
 #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
-#define LRC_WA_BB_SIZE				SZ_4K
 
 /*
  * Layout of the LRC and associated data allocated as
@@ -1087,13 +1086,11 @@ static int setup_bo(struct bo_setup_state *state)
 	ssize_t remain;
 
 	if (state->lrc->bo->vmap.is_iomem) {
-		state->buffer = kmalloc(state->max_size, GFP_KERNEL);
 		if (!state->buffer)
 			return -ENOMEM;
 		state->ptr = state->buffer;
 	} else {
 		state->ptr = state->lrc->bo->vmap.vaddr + state->offset;
-		state->buffer = NULL;
 	}
 
 	remain = state->max_size / sizeof(u32);
@@ -1118,7 +1115,6 @@ static int setup_bo(struct bo_setup_state *state)
 	return 0;
 
 fail:
-	kfree(state->buffer);
 	return -ENOSPC;
 }
 
@@ -1130,10 +1126,16 @@ static void finish_bo(struct bo_setup_state *state)
 	xe_map_memcpy_to(gt_to_xe(state->lrc->gt), &state->lrc->bo->vmap,
 			 state->offset, state->buffer,
 			 state->written * sizeof(u32));
-	kfree(state->buffer);
 }
 
-static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
+/**
+ * xe_lrc_setup_wa_bb_with_scratch - Execute all wa bb setup callbacks.
+ * @lrc: the &xe_lrc struct instance
+ * @hwe: the &xe_hw_engine struct instance
+ * @scratch: preallocated scratch buffer for temporary storage
+ * Return: 0 on success, negative error code on failure
+ */
+int xe_lrc_setup_wa_bb_with_scratch(struct xe_lrc *lrc, struct xe_hw_engine *hwe, u32 *scratch)
 {
 	static const struct bo_setup funcs[] = {
 		{ .setup = setup_utilization_wa },
@@ -1142,6 +1144,7 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 		.lrc = lrc,
 		.hwe = hwe,
 		.max_size = LRC_WA_BB_SIZE,
+		.buffer = scratch,
 		.reserve_dw = 1,
 		.offset = __xe_lrc_wa_bb_offset(lrc),
 		.funcs = funcs,
@@ -1164,6 +1167,21 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	return 0;
 }
 
+static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
+{
+	u32 *buf = NULL;
+	int ret;
+
+	if (lrc->bo->vmap.is_iomem)
+		buf = kmalloc(LRC_WA_BB_SIZE, GFP_KERNEL);
+
+	ret = xe_lrc_setup_wa_bb_with_scratch(lrc, hwe, buf);
+
+	kfree(buf);
+
+	return ret;
+}
+
 static int
 setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 {
@@ -1173,6 +1191,7 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 		.lrc = lrc,
 		.hwe = hwe,
 		.max_size = (63 * 64) /* max 63 cachelines */,
+		.buffer = NULL,
 		.offset = __xe_lrc_indirect_ctx_offset(lrc),
 	};
 	int ret;
@@ -1189,9 +1208,14 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	if (xe_gt_WARN_ON(lrc->gt, !state.funcs))
 		return 0;
 
+	if (lrc->bo->vmap.is_iomem)
+		state.buffer = kmalloc(state.max_size, GFP_KERNEL);
+
 	ret = setup_bo(&state);
-	if (ret)
+	if (ret) {
+		kfree(state.buffer);
 		return ret;
+	}
 
 	/*
 	 * Align to 64B cacheline so there's no garbage at the end for CS to
@@ -1203,6 +1227,7 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	}
 
 	finish_bo(&state);
+	kfree(state.buffer);
 
 	xe_lrc_write_ctx_reg(lrc,
 			     CTX_CS_INDIRECT_CTX,
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index eceeeee6c021..188565465779 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -42,6 +42,8 @@ struct xe_lrc_snapshot {
 #define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
 #define LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR (0x40 * 4)
 
+#define LRC_WA_BB_SIZE SZ_4K
+
 #define XE_LRC_CREATE_RUNALONE 0x1
 #define XE_LRC_CREATE_PXP 0x2
 struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
@@ -129,6 +131,8 @@ u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc);
 u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc);
 u32 xe_lrc_ctx_job_timestamp_ggtt_addr(struct xe_lrc *lrc);
 u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc);
+int xe_lrc_setup_wa_bb_with_scratch(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
+				    u32 *scratch);
 
 /**
  * xe_lrc_update_timestamp - readout LRC timestamp and update cached value
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index a219395c15de..a4927b0792b5 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -247,7 +247,7 @@ static int vf_get_next_migrated_gt_id(struct xe_device *xe)
 
 static size_t post_migration_scratch_size(struct xe_device *xe)
 {
-	return xe_lrc_reg_size(xe);
+	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
 }
 
 /**
-- 
2.25.1

