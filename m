Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E9CC021B5
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 10:17:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF72010E1F8;
	Fri, 21 Feb 2025 10:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="R+RgVVcJ";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5304E10E255
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 10:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KCO2RtC52bx1q8ElqRGIAvyhvgvbzaFifqTGKSqHjTE=; b=R+RgVVcJJGcUHpXcX86s+6oZz4
 pwDOXdjROeQjWMwvEsMcBuH2IVjbS8g22biA+xnmuL/LUZ09zs2GcpcyTnO3vwxVxP10Yw2Tt+20X
 4YnRDTT2sFCnlbGZuyc9J5OuY63sfWR7DuUqx6Zh370XWahWDNGPdWAtmBwEx08q38jrbcbz5TsTs
 mPHk+4UkfSwo9c+6mRzLTyHE5nk7ZHSHz78C5CdHYOI/UTy1I3gMWPE6MUv7r1L+8JOZrBhxzVUYq
 +A0IIlmIjXz8/MWsaxXWIcXAKvtmBEdhoxTgXnXmJxmByOUby5RRoKxar+aOkI0E9lp5k/Y8jXNZq
 CfEj70uQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tlQ6B-00G2b3-OU; Fri, 21 Feb 2025 11:17:41 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 03/12] drm/xe: Pass flags directly to emit_flush_imm_ggtt
Date: Fri, 21 Feb 2025 10:17:22 +0000
Message-ID: <20250221101736.78986-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
References: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
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

This is more readable than the nameless booleans and will also come handy
later.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index a2d1fb8f0adf..21520ff97599 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -90,11 +90,10 @@ static int emit_flush_dw(u32 *dw, int i)
 	return i;
 }
 
-static int emit_flush_imm_ggtt(u32 addr, u32 value, bool invalidate_tlb,
-			       u32 *dw, int i)
+static int emit_flush_imm_ggtt(u32 addr, u32 value, u32 flags, u32 *dw, int i)
 {
 	dw[i++] = MI_FLUSH_DW | MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW |
-		(invalidate_tlb ? MI_INVALIDATE_TLB : 0);
+		  flags;
 	dw[i++] = addr | MI_FLUSH_DW_USE_GTT;
 	dw[i++] = 0;
 	dw[i++] = value;
@@ -250,7 +249,7 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
 	if (job->ring_ops_flush_tlb) {
 		dw[i++] = preparser_disable(true);
 		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
-					seqno, true, dw, i);
+					seqno, MI_INVALIDATE_TLB, dw, i);
 		dw[i++] = preparser_disable(false);
 	} else {
 		i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
@@ -266,7 +265,7 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
 						dw, i);
 	}
 
-	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
+	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, 0, dw, i);
 
 	i = emit_user_interrupt(dw, i);
 
@@ -312,7 +311,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 
 	if (job->ring_ops_flush_tlb)
 		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
-					seqno, true, dw, i);
+					seqno, MI_INVALIDATE_TLB, dw, i);
 
 	dw[i++] = preparser_disable(false);
 
@@ -329,7 +328,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 						dw, i);
 	}
 
-	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
+	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, 0, dw, i);
 
 	i = emit_user_interrupt(dw, i);
 
-- 
2.48.0

