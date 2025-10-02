Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D28DCCD183
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 14:25:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484EA10E7F4;
	Thu,  2 Oct 2025 14:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Ap9d5LRq";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A2910E7F4
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 14:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UMP6LDbAfbpOyGpJTthLWbVeAvrrFanbUgzFlv+wRnU=; b=Ap9d5LRqgQwT7Sm/7lkeBHQjaG
 nWIe14xfo8jnUTpf7gONODibhHQdkrj6xtgmQHwuPZWOxRlIWzKoWgX3oIh0k8Dy5tINvItuQTQ82
 PO1vJd4tvCRlBw2dheD9fP1DOmXwqb438fld8vRRcAi8imIjchT40zmscQdsO7qbFry48IxjpHAdc
 jqR/uESuFGU8ZBZ7VRVbVJBR52LbZNJms/JeLfDz69Zzl3t0KZB3Ea6oQwTkLWn0ooMjm1FjDRZ/8
 qVMmjpt9t7a+v7x68ZlxB17xIIUF27Tfe+vQ8gnFgv0ULzPsTxux2sWdzLfR7jHiOPKXqrSsXjXIG
 wS0WqC5g==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v4KF6-003Q1U-4e
 for <intel-xe@lists.freedesktop.org>; Thu, 02 Oct 2025 16:25:12 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 07/13] drm/xe: Export xe_emit_aux_table_inv
Date: Thu,  2 Oct 2025 15:24:45 +0100
Message-ID: <20251002142453.25574-8-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251002142453.25574-1-tvrtko.ursulin@igalia.com>
References: <20251002142453.25574-1-tvrtko.ursulin@igalia.com>
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

Export the existing AuxCCS invalidation ring buffer programming helper
which we will need to use to setup the indirect context workaround in the
next patch.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 77 +++++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_ring_ops.h |  3 ++
 2 files changed, 49 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index d45aba5a382a..9df99b8d2397 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -50,22 +50,51 @@ static u32 preparser_disable(bool state)
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
+	case XE_ENGINE_CLASS_COPY:
+		reg = BCS_AUX_INV;
+		break;
+	case XE_ENGINE_CLASS_VIDEO_DECODE:
+		reg = VD0_AUX_INV;
+		break;
+	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		reg = VE0_AUX_INV;
+		break;
+	default:
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
@@ -293,22 +322,8 @@ static void __emit_job_gen12_xcs(struct xe_sched_job *job, struct xe_lrc *lrc,
 					seqno, MI_INVALIDATE_TLB | flags, dw,
 					i);
 		/* hsdes: 1809175790 */
-		if (aux_ccs) {
-			struct xe_reg reg;
-
-			switch (job->q->class) {
-			case XE_ENGINE_CLASS_COPY:
-				reg = BCS_AUX_INV;
-				break;
-			case XE_ENGINE_CLASS_VIDEO_DECODE:
-				reg = VD0_AUX_INV;
-				break;
-			default:
-				reg = VE0_AUX_INV;
-			};
-
-			i = emit_aux_table_inv(gt, reg, dw, i);
-		}
+		if (aux_ccs)
+			i = emit_aux_table_inv(job->q->hwe, dw, i);
 		dw[i++] = preparser_disable(false);
 	} else {
 		i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
@@ -365,7 +380,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 
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
2.48.0

