Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E936CA0EDC
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 09:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96B710E6B2;
	Wed, 20 Aug 2025 09:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Lqc6Cw7K";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0A310E386
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 09:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OIA24mClJoDIGSLhO33lpsu8LAwAaUnwnnJaw2afEgA=; b=Lqc6Cw7KAscuKpzZYQXJ8Jzi2/
 kn9aeDRwSU8mQ1bKCbEVHPa5S1g5JMTM48KIBOx76wrfV80omVafJRmToBaBNzVJVH5O5JbR+ypSg
 /dWqIWoEgnqjGSTl/OB905Z+D8yXDVefXUTE/XNPure3eIfkxKMpNSuYlamJ+gHV4j2qRPezVczfI
 LsoBgE6W/LJBVbFUhwA5ZHA93M15Ld6YlnfVv+CqbVNZVTuCq2XXYf1MvOMgac09olad4fnufWRFn
 HTCrY/sZ0dAut7Eya9wPjaSxFnzh9Shp3Ie/X2/j09b/NblbEqOlOPVakjPRdGcYoKsv84QPVeBrV
 DkCPM3xw==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uoeyT-00GhX0-Lb
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 11:19:17 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 04/13] drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
Date: Wed, 20 Aug 2025 10:19:03 +0100
Message-ID: <20250820091913.18588-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250820091913.18588-1-tvrtko.ursulin@igalia.com>
References: <20250820091913.18588-1-tvrtko.ursulin@igalia.com>
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

Emit MI_FLUSH_DW_CCS when invalidating on auxccs platforms.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index e7c23fd04011..752dea0a9234 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -275,15 +275,16 @@ static void __emit_job_gen12_xcs(struct xe_sched_job *job, struct xe_lrc *lrc,
 			      class == XE_ENGINE_CLASS_VIDEO_DECODE ||
 			      class == XE_ENGINE_CLASS_VIDEO_ENHANCE);
 	const bool invalidate_tlb = aux_ccs || job->ring_ops_flush_tlb;
+	const u32 flags = aux_ccs && class == XE_ENGINE_CLASS_COPY ?
+			  MI_FLUSH_DW_CCS : 0;
 
 	i = emit_copy_timestamp(lrc, dw, i);
 
 	if (invalidate_tlb) {
 		dw[i++] = preparser_disable(true);
 		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
-					seqno,
-					MI_INVALIDATE_TLB,
-					dw, i);
+					seqno, MI_INVALIDATE_TLB | flags, dw,
+					i);
 		/* hsdes: 1809175790 */
 		if (aux_ccs) {
 			struct xe_reg reg;
-- 
2.48.0

