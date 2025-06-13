Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA4CC71135
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 12:42:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68BB10E1EF;
	Fri, 13 Jun 2025 12:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="CMCfiY6R";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A3310E24E
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 12:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c/yX2JR7TSorRhXgulHJyGo9pd8tvREaRaOswLa0utM=; b=CMCfiY6RJgfShBECItoAK0TTU6
 wh+BxFddAwdBV3pXh+ngwvUEFsIIo0sfTAjpq1/Dv/MEXIKDo499unQFFrd0jWxzz+3JAXw9hEd3k
 bFEPYXhU9orpmre4uVit/3T5Nhny4YwOPE00bVz7TxdxWu8KgcayYuofr7A7TSOcC6L/dmadLBXrR
 ppFMRDzycBjlgH4ibkamWDCVFfX519L6FPIxEqXpxos/K8rgn6TSF0zX+8397EV+EOMVJ2+SiBjhq
 hTpKbum1CGRMd9M8Kdz8FWov0xWz5L0W5yXbFaMqS5x94UCtFoMstIA7LU+dM+j64WzSImR/vH/WS
 sPJLRiig==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uQ3jW-0030zX-61; Fri, 13 Jun 2025 14:42:10 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 4/8] drm/xe: Return number of written dwords from
 workaround batch buffer emission
Date: Fri, 13 Jun 2025 13:41:55 +0100
Message-ID: <20250613124159.65636-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250613124159.65636-1-tvrtko.ursulin@igalia.com>
References: <20250613124159.65636-1-tvrtko.ursulin@igalia.com>
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

Indirect context setup will need to get to the number of written dwords.
Lets add it as an output parameter so it can be accessed from the caller
regardless of whether code is writing directly or via an shadow buffer.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 37d4e2a3f5f0..dbeba7419cb0 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -980,7 +980,8 @@ setup_wa_bo(struct xe_lrc *lrc,
 	    unsigned int offset,
 	    const struct wa_bo_setup *funcs,
 	    unsigned int num_funcs,
-	    u32 **free)
+	    u32 **free,
+	    unsigned int *written)
 {
 	const size_t max_size = bo->size;
 	u32 *cmd, *buf = NULL;
@@ -1004,6 +1005,8 @@ setup_wa_bo(struct xe_lrc *lrc,
 		ssize_t len = funcs[i].setup(lrc, hwe, cmd, remain);
 
 		remain -= len;
+		if (written)
+			*written += len;
 
 		/*
 		 * There should always be at least 1 additional dword for
@@ -1026,14 +1029,14 @@ static void finish_wa_bo(struct xe_lrc *lrc,
 			 struct xe_hw_engine *hwe,
 			 struct xe_bo *bo,
 			 unsigned int offset,
-			 u32 *cmd,
+			 unsigned int written,
 			 u32 *free)
 {
 	if (!free)
 		return;
 
 	xe_map_memcpy_to(gt_to_xe(lrc->gt), &bo->vmap, offset, free,
-			 (cmd - free) * sizeof(*cmd));
+			 written * sizeof(u32));
 	kfree(free);
 }
 
@@ -1042,16 +1045,18 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	static const struct wa_bo_setup funcs[] = {
 		{ .setup = wa_bb_setup_utilization },
 	};
+	unsigned int written = 0;
 	u32 *cmd, *buf = NULL;
 
 	cmd = setup_wa_bo(lrc, hwe, lrc->bb_per_ctx_bo, 0, funcs,
-			  ARRAY_SIZE(funcs), &buf);
+			  ARRAY_SIZE(funcs), &buf, &written);
 	if (IS_ERR(cmd))
 		return PTR_ERR(cmd);
 
 	*cmd++ = MI_BATCH_BUFFER_END;
+	written++;
 
-	finish_wa_bo(lrc, hwe, lrc->bb_per_ctx_bo, 0, cmd, buf);
+	finish_wa_bo(lrc, hwe, lrc->bb_per_ctx_bo, 0, written, buf);
 
 	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
 			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
-- 
2.48.0

