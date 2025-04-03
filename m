Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96EFC3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 19:03:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842C710EA43;
	Thu,  3 Apr 2025 19:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="HSlJFrfL";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5043710EA43
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ULtAqI5otjxUYD5bd1W91oLLLrOCwe+eDxFgsSYZ25M=; b=HSlJFrfLvEhiyVFURFpEWhE3BH
 KF5zE8sx+VBafTliPdc0ApRMFNwggyfGvK0TEEV9dzq3TNL3pQDLHIbzp7ybQW3Y1DUAeMJOfM2Fp
 9LD/s9gZLt/HY0+e1Hjs3kEXgTD+PeICN1QtDhiAxwAcSw5DVTlAq0zgxDtkwRb2CNH62sztMJA6u
 ZG3HAlCtcyBby5OYfzTJv5BMXU24O0jD7gr9MqZklldJd3EYz06BHbROPScJUPDmEsOcAGJrtWC+i
 lcNX/qyWq0MvLQFwjL9yKDCH8wDES1o8pJrYifC+J7pnppYkntF87n17L6r16yTC5lfuxWDTHhJQU
 oS9pINyA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u0PqU-00Axlm-Av; Thu, 03 Apr 2025 21:03:22 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v5 02/16] drm/xe: Use emit_flush_imm_ggtt helper instead of
 open coding
Date: Thu,  3 Apr 2025 20:03:02 +0100
Message-ID: <20250403190317.6064-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250403190317.6064-1-tvrtko.ursulin@igalia.com>
References: <20250403190317.6064-1-tvrtko.ursulin@igalia.com>
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

Helper is already there so lets just use it.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index a7582b097ae6..a5bdf7752755 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -420,11 +420,9 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 
 	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
 
-	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | job->migrate_flush_flags |
-		MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW;
-	dw[i++] = xe_lrc_seqno_ggtt_addr(lrc) | MI_FLUSH_DW_USE_GTT;
-	dw[i++] = 0;
-	dw[i++] = seqno; /* value */
+	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno,
+				MI_INVALIDATE_TLB | job->migrate_flush_flags,
+				dw, i);
 
 	i = emit_user_interrupt(dw, i);
 
-- 
2.48.0

