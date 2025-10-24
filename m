Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E12ECCD1A5
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 10:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526D210E8FF;
	Fri, 24 Oct 2025 10:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="AtrcIzrh";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC1910EA4A
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 10:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zqwg3ph+0ldNvWoqOIgHXFnkdlxhlFBmje3dat+57NQ=; b=AtrcIzrh5lxBOvnCLDJHP7LGpC
 sTFUNky7KTtf3Cw/7ntmSxvyVCVcWbxwnXsc2nWJ9Pgzun6JjJ4kx7mR0l/ZRW1WudiS3bPLZwbNt
 W8AwC24+RlEnTWtXhQCCbooxaE0gIFWoj8ULlkf4qD/WvxkYEC8ZN+5Nnq1xB5gz4Y5Bpyb20blc/
 f/3MMN2nnEZQhxavyhBJ69D1TAJRw4wO/Djah9TcxCXbTkk2FJtUoJLFA++r7fcx5A0yr8355OBX7
 7dnLtSDtWGiUkWp4Qv5KaYiec4xWgknBsCW40cMi1E8YcuhQ0zHBid85Cp6bIEA35CszIHHgaqpuB
 iZlaKmZg==;
Received: from [90.242.12.242] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vCFKX-00Eicp-PB; Fri, 24 Oct 2025 12:47:33 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v14 05/13] drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
Date: Fri, 24 Oct 2025 11:47:18 +0100
Message-ID: <20251024104727.74886-6-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251024104727.74886-1-tvrtko.ursulin@igalia.com>
References: <20251024104727.74886-1-tvrtko.ursulin@igalia.com>
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
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 6071a493635c..4670af7cdf31 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -288,11 +288,13 @@ static void __emit_job_gen12_xcs(struct xe_sched_job *job, struct xe_lrc *lrc,
 	i = emit_copy_timestamp(lrc, dw, i);
 
 	if (invalidate_tlb) {
+		u32 flags = aux_ccs && class == XE_ENGINE_CLASS_COPY ?
+			    MI_INVALIDATE_TLB | MI_FLUSH_DW_CCS :
+			    MI_INVALIDATE_TLB;
+
 		dw[i++] = preparser_disable(true);
 		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
-					seqno,
-					MI_INVALIDATE_TLB,
-					dw, i);
+					seqno, flags, dw, i);
 		/* hsdes: 1809175790 */
 		if (aux_ccs) {
 			struct xe_reg reg;
-- 
2.48.0

