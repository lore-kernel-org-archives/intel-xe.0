Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B25CCD1A4
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 07:58:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2E210E2A8;
	Mon, 20 Oct 2025 07:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="h19cq2Ou";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C055B10E2A8
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 07:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YLEpOt5k8Sbg/TdsE05LiTGU3yeJ5acZyQvLaa2w2U4=; b=h19cq2OuYfQUbd4Wxj99fHWmXG
 88dN+bdJCfGCXbV2WRAAnkXLzL/TstwovURFaihps1/DNi+9BCPS10PjYYGt6JZfv5geTCZjnrPgV
 ONN9rlwxFZXxwRVmzlBPKhpYpibZxDMERdnxvSnUGqH1X40tWlh9nhSTL3sYrdzNx7eohC/Gf8WEj
 mIFvEjxW2tH9HfNxO82i/l79jd93gd8BKTtrIJGQuWI5lB/dBnWRboaAGg/guFpTrh3kqWMfMpBz7
 zpshKuyT/9Rgihx2DXq368erhXW9yNe2RXd2Tnw6liTjAMIB8fDp4KQJC4ytMZtVrfjyX5ESut35v
 k0oNKnaw==;
Received: from [90.242.12.242] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vAkms-00C0xC-1p; Mon, 20 Oct 2025 09:58:38 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v13 05/12] drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
Date: Mon, 20 Oct 2025 08:58:23 +0100
Message-ID: <20251020075831.32818-6-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251020075831.32818-1-tvrtko.ursulin@igalia.com>
References: <20251020075831.32818-1-tvrtko.ursulin@igalia.com>
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
 drivers/gpu/drm/xe/xe_ring_ops.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 87e467972070..d226d3228199 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -272,6 +272,8 @@ static void __emit_job_gen12_xcs(struct xe_sched_job *job, struct xe_lrc *lrc,
 			      class == XE_ENGINE_CLASS_VIDEO_DECODE ||
 			      class == XE_ENGINE_CLASS_VIDEO_ENHANCE);
 	const bool invalidate_tlb = aux_ccs || job->ring_ops_flush_tlb;
+	const u32 flags = aux_ccs && class == XE_ENGINE_CLASS_COPY ?
+			  MI_FLUSH_DW_CCS : 0;
 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
 
 	*head = lrc->ring.tail;
@@ -281,9 +283,8 @@ static void __emit_job_gen12_xcs(struct xe_sched_job *job, struct xe_lrc *lrc,
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

