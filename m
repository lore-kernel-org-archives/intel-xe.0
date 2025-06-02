Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BB6C5AD49
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 11:20:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9361D10E4FF;
	Mon,  2 Jun 2025 11:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="m+1qnrDR";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE8B10E4F7
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 11:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/HPZdpFLl4tNBJ82L+QSgJa1b6JHoJg8qjhrLP4wHk8=; b=m+1qnrDRBaFVPjYae5aN7oSgSr
 yi+bh0XRujfnc84BDoYQ4Ox4VDDHU1KRW8yNzXhvWWVVCfWmkMetLwRAGMRFTViIn5Yrceje2Q8Qn
 5n2YpNEFdkPhhkUa2AHRfpAmbFXSv+THgjYik5yQEGhCo3jZqD976YPveWYRV/PDpHh16I27hdKgc
 enWYjnDwuN5J4Ks/BvC2rd2PcIbdgJD4diqtAkVTlyxDbQKOW7ZLdwx7HcfBsWlygv3Dv/a9yVOhP
 85vY66e2aRGq+3hK1q/TRLWfQ4HoptM90Tm8wLrqx+SsU2VP0r/++qiksAMV2jo60GNjf/AYQJhea
 wwo81d6w==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uM3DD-00GFqn-OW; Mon, 02 Jun 2025 13:20:15 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 3/6] drm/xe: Prepare workaround batch buffer setup for more
 users
Date: Mon,  2 Jun 2025 12:19:53 +0100
Message-ID: <20250602111956.14854-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250602111956.14854-1-tvrtko.ursulin@igalia.com>
References: <20250602111956.14854-1-tvrtko.ursulin@igalia.com>
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

We need to emit some more workarounds from the workaround batch buffer so
lets introduce a new top level function and move the existing context
utilisation workaround to be separate.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index ca7ffc7bbdc8..a627e4503518 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -941,7 +941,10 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
  * store it in the PPHSWP.
  */
 #define CONTEXT_ACTIVE 1ULL
-static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
+static unsigned int
+xe_lrc_setup_utilization(struct xe_lrc *lrc,
+			 struct iosys_map *map,
+			 unsigned int offset)
 {
 	struct xe_device *xe = lrc_to_xe(lrc);
 	unsigned int num_dw;
@@ -965,13 +968,24 @@ static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
 		*cmd++ = upper_32_bits(CONTEXT_ACTIVE);
 	}
 
-	*cmd++ = MI_BATCH_BUFFER_END;
-
 	num_dw = cmd - batch;
-	xe_map_memcpy_to(xe, &lrc->bb_per_ctx_bo->vmap, 0, batch,
-			 num_dw * sizeof(u32));
+	xe_map_memcpy_to(xe, map, 0, batch, num_dw * sizeof(u32));
+	iosys_map_incr(map, num_dw * sizeof(u32));
 
-	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
+	return offset + num_dw;
+}
+
+static void xe_lrc_setup_wa_bb(struct xe_lrc *lrc)
+{
+	struct iosys_map map = lrc->bb_per_ctx_bo->vmap;
+	unsigned int offset = 0;
+
+	offset = xe_lrc_setup_utilization(lrc, &map, offset);
+
+	xe_map_write32(lrc_to_xe(lrc), &map, MI_BATCH_BUFFER_END);
+
+	xe_lrc_write_ctx_reg(lrc,
+			     CTX_BB_PER_CTX_PTR,
 			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
 }
 
@@ -1126,7 +1140,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	map = __xe_lrc_start_seqno_map(lrc);
 	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
 
-	xe_lrc_setup_utilization(lrc);
+	xe_lrc_setup_wa_bb(lrc);
 
 	return 0;
 
-- 
2.48.0

