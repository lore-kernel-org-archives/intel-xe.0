Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69676C83F3C
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 21:52:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB3E10E8BD;
	Thu, 17 Jul 2025 21:52:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DPMn7kaA";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33BC10E337
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 21:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ea8DYv4IDsIN2ucC5evNC5SkeTVxtS4mOmF8TT0T9u4=; b=DPMn7kaAsKYMsZqb9hzVWWoQYo
 w+x7wlksilS7yphhzFFm6EklgSePtNjRLenkIw8JNaCozLEJEBWXhNoQu6yiU31vjcWda7061OM/q
 cBUj9e5iYKpkZ3d8vUZE55UzmcSUQbC3+o3ldIgA/98yZ0fBJLJ8nQlZjEFg6M5I6i6waWKx+K3DN
 bDiQaquw80YqZeOFVieJQ1JjCUg0a+wjuFmdNCWrbXBiFAbhwh6oui5Sxsm8vr1PZ+LrhXWy6Nv6U
 7eh1mZm/58Lf87to1LLs06/K0ZtJlNnlLN7bDerqbzuvYLCEmkWLvOd/ws8g1i3JAUWj8n9y7VPLY
 Rj63Kh5w==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ucWWk-000Jqk-Na
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 23:52:30 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 01/17] drm/xe: Use emit_flush_imm_ggtt helper instead of open
 coding
Date: Thu, 17 Jul 2025 22:52:11 +0100
Message-ID: <20250717215229.88140-2-tvrtko.ursulin@igalia.com>
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

Helper is already there so lets just use it.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 7b50c7c1ee21..e8f22ec5f9af 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -415,11 +415,9 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 
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

