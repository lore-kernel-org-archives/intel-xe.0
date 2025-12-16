Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95A4D609B1
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 15:38:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4F910E97B;
	Tue, 16 Dec 2025 15:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bTKzCPKU";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DB610E809
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 15:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lOYNOtMW6Vn+jJ/hY7vzDg5NM2aDaurHHrp9zLzpPsA=; b=bTKzCPKUxHoO+mwdcD4BI0zcOo
 9Wg6ccRN/u3+Bcf33foFfpMNM8u0xnW0DReqKaSiCByc9SmDzUwRN5DMJBZFzT+uaY+TzW/ddFOUg
 ErDO+MmNTUTfG/9O4PJegd/OzAOf5uWT3YskoYxBqLuWIyw1tXaLSqZQ/7UNMjABhjOpddcEN7+vq
 aY28JLGY720DNUkjnTPzS3S2n2IPSDB8IJdGDJj+iuYR6ES1oxF0iYeY9CDw7JoUulVEOj0HaYvdF
 NpXUx95XH0ElTE7Q+VAoeLQX+RBZbv7Msm5edJK9YLncYSwFohOxEKrGq2B3UoN+4sZmRAcrgYDac
 zNMzgTgw==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vVX7y-00DRSK-Ug; Tue, 16 Dec 2025 16:38:19 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v16 5/8] drm/xe: Export xe_emit_aux_table_inv
Date: Tue, 16 Dec 2025 15:38:02 +0000
Message-ID: <20251216153805.96056-6-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251216153805.96056-1-tvrtko.ursulin@igalia.com>
References: <20251216153805.96056-1-tvrtko.ursulin@igalia.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 67 +++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_ring_ops.h |  3 ++
 2 files changed, 48 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 5e41f1ce05a4..b43bc4c4c70d 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -14,6 +14,7 @@
 #include "regs/xe_lrc_layout.h"
 #include "xe_exec_queue.h"
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
@@ -313,7 +341,6 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 	u32 ppgtt_flag = get_ppgtt_flag(job);
 	struct xe_gt *gt = job->q->gt;
 	struct xe_device *xe = gt_to_xe(gt);
-	bool decode = job->q->class == XE_ENGINE_CLASS_VIDEO_DECODE;
 
 	*head = lrc->ring.tail;
 
@@ -322,12 +349,8 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
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
@@ -392,7 +415,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 
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
2.51.1

