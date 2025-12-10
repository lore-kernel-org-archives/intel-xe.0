Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A41D3C92B
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 17:03:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E0B10E787;
	Wed, 10 Dec 2025 17:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aVvI4OBU";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61D910E785
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 17:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7linGS0reBcy1Ai5Z8I6J/YCjkuFLPIq72/+KhAiAtI=; b=aVvI4OBUwdOViH3iqH0Z0mUMpo
 BdFtLLfFP0MJy6Xre39Dat0rL+9o3dGpuHFFenztd+vAJVbUUftjaNes/NsS3K6lrMXjIv6tlBYPh
 VfPvUgI9tEjPWKAhqnlKuzG20eDCs4hwjWpFXTLpLSuQlj9XReThvSswAGezJLbIkSg08FH9bKlgj
 8LaiCQNGdjHN/9Ubmf4mAGmgqC6ZFAHkKyrApdWVHnzzr1qKKAts+bnbdduYWKC0q+JCjlHvF3Qjx
 gnhabYPzAmibVcY7bwwM/Z6jq/GOGY80UwGB4MYV1AsFzzbpWeQJvN5JySzbX2d+CjtzzIcj4tXR9
 zjxz8+OA==;
Received: from [86.33.28.86] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vTNaw-00B3sU-5P
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 18:03:18 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 06/10] drm/xe: Export xe_emit_aux_table_inv
Date: Wed, 10 Dec 2025 18:03:06 +0100
Message-ID: <20251210170310.15114-7-tursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210170310.15114-1-tursulin@igalia.com>
References: <20251210170310.15114-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Export the existing AuxCCS invalidation ring buffer programming helper
which we will need to use to setup the indirect context workaround in the
next patch.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 67 +++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_ring_ops.h |  3 ++
 2 files changed, 48 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index a8d1854dd8e9..953723eaa237 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -14,6 +14,7 @@
 #include "regs/xe_lrc_layout.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_sched_job.h"
@@ -50,22 +51,49 @@ static u32 preparser_disable(bool state)
 	return MI_ARB_CHECK | BIT(8) | state;
 }
 
-static int emit_aux_table_inv(struct xe_gt *gt, struct xe_reg reg,
-			      u32 *dw, int i)
+u32 *xe_emit_aux_table_inv(struct xe_hw_engine *hwe, u32 *cmd)
 {
-	dw[i++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_MMIO_REMAP_EN;
-	dw[i++] = reg.addr + gt->mmio.adj_offset;
-	dw[i++] = AUX_INV;
-	dw[i++] = MI_SEMAPHORE_WAIT_TOKEN |
-		  MI_SEMAPHORE_REGISTER_POLL |
-		  MI_SEMAPHORE_POLL |
-		  MI_SEMAPHORE_SAD_EQ_SDD;
-	dw[i++] = 0;
-	dw[i++] = reg.addr + gt->mmio.adj_offset;
-	dw[i++] = 0;
-	dw[i++] = 0;
+	struct xe_gt *gt = hwe->gt;
+	struct xe_reg reg;
 
-	return i;
+	switch (hwe->class) {
+	case XE_ENGINE_CLASS_RENDER:
+	case XE_ENGINE_CLASS_COMPUTE:
+		reg = CCS_AUX_INV;
+		break;
+	case XE_ENGINE_CLASS_VIDEO_DECODE:
+		reg = VD0_AUX_INV;
+		break;
+	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		reg = VE0_AUX_INV;
+		break;
+	default:
+		xe_gt_err_once(gt, "AuxCCS invalidation not implemented!\n");
+		return cmd;
+	};
+
+	*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) |
+		 MI_LRI_MMIO_REMAP_EN;
+	*cmd++ = reg.addr + gt->mmio.adj_offset;
+	*cmd++ = AUX_INV;
+	*cmd++ = MI_SEMAPHORE_WAIT_TOKEN | MI_SEMAPHORE_REGISTER_POLL |
+		 MI_SEMAPHORE_POLL | MI_SEMAPHORE_SAD_EQ_SDD;
+	*cmd++ = 0;
+	*cmd++ = reg.addr + gt->mmio.adj_offset;
+	*cmd++ = 0;
+	*cmd++ = 0;
+
+	return cmd;
+}
+
+static int emit_aux_table_inv(struct xe_hw_engine *hwe, u32 *dw, int i)
+{
+	u32 *start, *end;
+
+	start = dw + i;
+	end = xe_emit_aux_table_inv(hwe, start);
+
+	return i + (end - start);
 }
 
 static int emit_user_interrupt(u32 *dw, int i)
@@ -311,7 +339,6 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 	u32 ppgtt_flag = get_ppgtt_flag(job);
 	struct xe_gt *gt = job->q->gt;
 	struct xe_device *xe = gt_to_xe(gt);
-	bool decode = job->q->class == XE_ENGINE_CLASS_VIDEO_DECODE;
 
 	*head = lrc->ring.tail;
 
@@ -320,12 +347,8 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 	dw[i++] = preparser_disable(true);
 
 	/* hsdes: 1809175790 */
-	if (has_aux_ccs(xe)) {
-		if (decode)
-			i = emit_aux_table_inv(gt, VD0_AUX_INV, dw, i);
-		else
-			i = emit_aux_table_inv(gt, VE0_AUX_INV, dw, i);
-	}
+	if (has_aux_ccs(xe))
+		i = emit_aux_table_inv(job->q->hwe, dw, i);
 
 	if (job->ring_ops_flush_tlb)
 		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
@@ -390,7 +413,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 
 	/* hsdes: 1809175790 */
 	if (aux_ccs)
-		i = emit_aux_table_inv(gt, CCS_AUX_INV, dw, i);
+		i = emit_aux_table_inv(job->q->hwe, dw, i);
 
 	dw[i++] = preparser_disable(false);
 
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.h b/drivers/gpu/drm/xe/xe_ring_ops.h
index e942735d76a6..5a2d32f9bb25 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.h
+++ b/drivers/gpu/drm/xe/xe_ring_ops.h
@@ -10,8 +10,11 @@
 #include "xe_ring_ops_types.h"
 
 struct xe_gt;
+struct xe_hw_engine;
 
 const struct xe_ring_ops *
 xe_ring_ops_get(struct xe_gt *gt, enum xe_engine_class class);
 
+u32 *xe_emit_aux_table_inv(struct xe_hw_engine *hwe, u32 *cmd);
+
 #endif
-- 
2.52.0

