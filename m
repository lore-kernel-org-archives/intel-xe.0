Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C795C28B26
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 11:14:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F344510E10D;
	Fri,  7 Mar 2025 11:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PsBKARGx";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4587210EB54
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 11:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hY5ZpFW4+y6+kpoHPA6KiTc1L13wRnSNZQNXgq3zIPo=; b=PsBKARGxBNET4f9uKdW9iHgFlP
 9YrI9cSI8rc05NKt66eFiWH2iGCEOyrWb8tNtzt5wLE2jqdvtnDPAqKaYYV6WrG45Bxg0ELpTsBos
 cDEWoN8+ITCXkoZbgtzy9zCwJtkmkcam9z/K3p+FqO6yTDCtNODu48ZeP90JGO+AQGs4JT7s1Xy2M
 llpBuTH9oFuG+cdPj7FjDvcfJ4esxMFkoaD0SLBVzp9XRE8Yl0H12quqlolp+9PjHhgpKYoKbJFfj
 4M0yZfhfJERzi8Ru0MpHv+SEkH+tTkiYWVCqunknyMxPdQYqYFPpNOBWPAfQoro130gL3Za2Pqvzo
 Ycypun8w==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tqVeT-005JiE-EF; Fri, 07 Mar 2025 12:14:07 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 3/4] drm/xe: Pass flags directly to emit_flush_imm_ggtt
Date: Fri,  7 Mar 2025 11:14:01 +0000
Message-ID: <20250307111402.26577-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250307111402.26577-1-tvrtko.ursulin@igalia.com>
References: <20250307111402.26577-1-tvrtko.ursulin@igalia.com>
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
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 3d1b4d3d788f..917fc16de866 100644
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
@@ -254,7 +253,7 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
 	if (job->ring_ops_flush_tlb) {
 		dw[i++] = preparser_disable(true);
 		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
-					seqno, true, dw, i);
+					seqno, MI_INVALIDATE_TLB, dw, i);
 		dw[i++] = preparser_disable(false);
 	} else {
 		i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
@@ -270,7 +269,7 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
 						dw, i);
 	}
 
-	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
+	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, 0, dw, i);
 
 	i = emit_user_interrupt(dw, i);
 
@@ -316,7 +315,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 
 	if (job->ring_ops_flush_tlb)
 		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
-					seqno, true, dw, i);
+					seqno, MI_INVALIDATE_TLB, dw, i);
 
 	dw[i++] = preparser_disable(false);
 
@@ -333,7 +332,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 						dw, i);
 	}
 
-	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, false, dw, i);
+	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno, 0, dw, i);
 
 	i = emit_user_interrupt(dw, i);
 
-- 
2.48.0

