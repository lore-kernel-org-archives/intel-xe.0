Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44FBC87FCE
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 20:04:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDB010EA13;
	Fri, 25 Jul 2025 20:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gEDH8gYV";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E99A10EA0F
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 20:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xu7vTmcPDoL8Hk1ZEI/Sz/PlSJBRwFJikGes4o2sbFk=; b=gEDH8gYV/5MvkSLqW4AN6SvL6I
 Q9y2+XCk8FSvdlANAAwC1Up1TpgFJ8zo44mim/0rJ3Yuy5aRjxCQFUSuyLUuNhMpUf/UFZ2isKrmg
 MJbr26E+Nl1F3qFO1Dq7/zEuO66P3gqTzjw3nA+cRflS2CnX5xX0oDtELF4qoJA7Jzv53D8xkFOuZ
 RGSIRp9EYkKpfD01tjjlmNvjQe5HTWN53qTxTsGlDgGk0RhtAN42AIvijeMpKWf+vCuFkoBLyt7rd
 9hEFJdxsHOAyE2GlBWADQv19uV21v8Oit9yf4MkOiO9VkDoFBsE225GEhOZKgWE8QC0FgdBy01Cf0
 cVTyqrqA==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ufOe4-003rhO-TJ; Fri, 25 Jul 2025 22:03:56 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v9 04/12] drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
Date: Fri, 25 Jul 2025 21:03:38 +0100
Message-ID: <20250725200349.99038-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250725200349.99038-1-tvrtko.ursulin@igalia.com>
References: <20250725200349.99038-1-tvrtko.ursulin@igalia.com>
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
index 1f2f3da90fe0..dc031e085f08 100644
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

