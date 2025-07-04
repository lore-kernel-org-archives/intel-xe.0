Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973E8C8303D
	for <intel-xe@archiver.kernel.org>; Fri,  4 Jul 2025 21:02:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCEA10E37E;
	Fri,  4 Jul 2025 21:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Umnn5OeC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3D310E37A
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Jul 2025 21:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751662969; x=1783198969;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SSJwRxMWfWcNonWwt1f4/7pYJGLP+7oNpGienF99XK4=;
 b=Umnn5OeC9sc9wKYJQmv0y5raF612BN5JCp0j4LEhR1nK1JfUiZkAHl8s
 q346TN4ba1jGoq1Y43CvHA4FUtcUeCrfDXmgAK7a+jaZNlzY/33B4zPqO
 vUaeKqEpmPWSDAFcQABpULRI2Y5fXkCr0ArpmNzaevmmJXbqR3cGwURu1
 ijDJEfKe0TjDIQI3xvH23i2bWQfJv6SQP6HAqpcK4E3RIDx4qCqTOQIO3
 Mkil3aF5de2cjpt5qPj8RQzq6QyR+070XLcLIAeM78/WXnEURYFrtWdvd
 vKGSUuN6u/WqnhQew5e9eWOl5B9Xz5N48DRvKoVtGIUAvmRLQKDyydF+h g==;
X-CSE-ConnectionGUID: DtCRRdINTCivPuhaf4x7yg==
X-CSE-MsgGUID: Y+vCBvm7QbyRXheb0thkYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="54111453"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; d="scan'208";a="54111453"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 14:02:49 -0700
X-CSE-ConnectionGUID: Ag2AQJspTyqxVQwUytq02w==
X-CSE-MsgGUID: f4tA8CZ2T5assst46axzQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; d="scan'208";a="154840061"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa007.jf.intel.com with ESMTP; 04 Jul 2025 14:02:47 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v6 8/9] drm/xe/vf: Refresh utilization buffer during migration
 recovery
Date: Fri,  4 Jul 2025 23:02:27 +0200
Message-Id: <20250704210228.825843-9-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250704210228.825843-1-tomasz.lis@intel.com>
References: <20250704210228.825843-1-tomasz.lis@intel.com>
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
---
 drivers/gpu/drm/xe/xe_exec_queue.c |  1 +
 drivers/gpu/drm/xe/xe_lrc.c        | 54 ++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_lrc.h        |  4 +++
 drivers/gpu/drm/xe/xe_sriov_vf.c   |  2 +-
 4 files changed, 42 insertions(+), 19 deletions(-)

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
index 8d6cecca1e86..ca7541eba92a 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -40,7 +40,6 @@
 
 #define LRC_PPHWSP_SIZE				SZ_4K
 #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
-#define LRC_WA_BB_SIZE				SZ_4K
 
 static struct xe_device *
 lrc_to_xe(struct xe_lrc *lrc)
@@ -1025,25 +1024,27 @@ struct wa_bb_setup {
 			 u32 *batch, size_t max_size);
 };
 
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
-	const size_t max_size = LRC_WA_BB_SIZE;
 	static const struct wa_bb_setup funcs[] = {
 		{ .setup = wa_bb_setup_utilization },
 	};
 	ssize_t remain;
-	u32 *cmd, *buf = NULL;
+	u32 *cmd;
 
-	if (lrc->bo->vmap.is_iomem) {
-		buf = kmalloc(max_size, GFP_KERNEL);
-		if (!buf)
-			return -ENOMEM;
-		cmd = buf;
-	} else {
+	if (lrc->bo->vmap.is_iomem)
+		cmd = scratch;
+	else
 		cmd = lrc->bo->vmap.vaddr + __xe_lrc_wa_bb_offset(lrc);
-	}
 
-	remain = max_size / sizeof(*cmd);
+	remain = LRC_WA_BB_SIZE / sizeof(*cmd);
 
 	for (size_t i = 0; i < ARRAY_SIZE(funcs); i++) {
 		ssize_t len = funcs[i].setup(lrc, hwe, cmd, remain);
@@ -1062,12 +1063,10 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 
 	*cmd++ = MI_BATCH_BUFFER_END;
 
-	if (buf) {
+	if (lrc->bo->vmap.is_iomem)
 		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bo->vmap,
-				 __xe_lrc_wa_bb_offset(lrc), buf,
-				 (cmd - buf) * sizeof(*cmd));
-		kfree(buf);
-	}
+				 __xe_lrc_wa_bb_offset(lrc), scratch,
+				 (cmd - scratch) * sizeof(*cmd));
 
 	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR, xe_bo_ggtt_addr(lrc->bo) +
 			     __xe_lrc_wa_bb_offset(lrc) + 1);
@@ -1075,10 +1074,29 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	return 0;
 
 fail:
-	kfree(buf);
 	return -ENOSPC;
 }
 
+static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
+{
+	const size_t max_size = LRC_WA_BB_SIZE;
+	u32 *buf = NULL;
+	int ret;
+
+	if (lrc->bo->vmap.is_iomem) {
+		buf = kmalloc(max_size, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+	}
+
+	ret = xe_lrc_setup_wa_bb_with_scratch(lrc, hwe, buf);
+
+	if (lrc->bo->vmap.is_iomem)
+		kfree(buf);
+
+	return ret;
+}
+
 #define PVC_CTX_ASID		(0x2e + 1)
 #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
 
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index a6205077f024..04e222e23d8d 100644
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

