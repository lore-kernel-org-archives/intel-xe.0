Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C69C83F38
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 21:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6955B10E323;
	Thu, 17 Jul 2025 21:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="T4GUnCiz";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7646010E8B2
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 21:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ooTs4iAde34jY7DylRq7tXgHvdKWTvDosHyB9LW100A=; b=T4GUnCiz04DgnxHyNrF0+M0an9
 YZBrOyYLYBG6+Jg93B6zhOEboZncraWstASNCuGUdl9HpaskiNmpGMZZYzZekZwE6aCX5h5cEnT5o
 crOOFFWFpmhqJGybBDA6BXUMk8uoxH9IpM3lluHIjF9WEpOMd4fPj2FyeKEByIPzjGYL+RRHv+1kB
 6h0vNGyZP5KsYVpQE+DmbB+O3PS4gnTi1Aku7g5qVTZSmFZkmR6seHOVm0Q6f6k/1GsMKfBAk/lbk
 zYd3Qzm6q/ONodBjzMokGkyo5pKkytvUTWzMDi9Y5l1kuuuHAYG1sLSV+yg9qLk1NQwuGbNN4/0LU
 6YGP/NKg==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ucWWp-000Jr5-PW
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 23:52:35 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 08/17] drm/xe/xelp: Add AuxCCS invalidation to the buffer
 migration path
Date: Thu, 17 Jul 2025 22:52:18 +0100
Message-ID: <20250717215229.88140-9-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250717215229.88140-1-tvrtko.ursulin@igalia.com>
References: <20250717215229.88140-1-tvrtko.ursulin@igalia.com>
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

Buffer migration path has to handle the AuxCCS invalidation too.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index db94b475cd32..6d41cea86b0f 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -404,11 +404,28 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 				     struct xe_lrc *lrc, u32 seqno)
 {
 	u32 saddr = xe_lrc_start_seqno_ggtt_addr(lrc);
+	struct xe_gt *gt = job->q->gt;
+	struct xe_device *xe = gt_to_xe(gt);
+	const bool aux_ccs = has_aux_ccs(xe);
+	const bool invalidate_tlb = aux_ccs || job->ring_ops_flush_tlb;
 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
 
 	i = emit_copy_timestamp(lrc, dw, i);
 
-	i = emit_store_imm_ggtt(saddr, seqno, dw, i);
+	if (invalidate_tlb) {
+		dw[i++] = preparser_disable(true);
+		i = emit_flush_imm_ggtt(saddr, seqno,
+					MI_INVALIDATE_TLB |
+					(aux_ccs ? MI_FLUSH_DW_CCS : 0) |
+					job->migrate_flush_flags,
+					dw, i);
+		/* hsdes: 1809175790 */
+		if (aux_ccs)
+			i = emit_aux_table_inv(gt, BCS_AUX_INV, dw, i);
+		dw[i++] = preparser_disable(false);
+	} else {
+		i = emit_store_imm_ggtt(saddr, seqno, dw, i);
+	}
 
 	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE; /* Enabled again below */
 
@@ -416,12 +433,16 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 
 	dw[i++] = preparser_disable(true);
 	i = emit_flush_invalidate(saddr, seqno, dw, i);
+	if (aux_ccs)
+		i = emit_aux_table_inv(gt, BCS_AUX_INV, dw, i);
 	dw[i++] = preparser_disable(false);
 
 	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
 
 	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno,
-				MI_INVALIDATE_TLB | job->migrate_flush_flags,
+				MI_INVALIDATE_TLB |
+				(aux_ccs ? MI_FLUSH_DW_CCS : 0) |
+				job->migrate_flush_flags,
 				dw, i);
 
 	i = emit_user_interrupt(dw, i);
-- 
2.48.0

