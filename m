Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAC8C7EE33
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 11:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDD210E03E;
	Thu, 26 Jun 2025 11:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="pXtXbU0y";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCD110E89A
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 11:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DsQ5DN1dfLRVao3Pdc2yvZ+DIBRP2oGUPalP6dqsOkw=; b=pXtXbU0yAM5PlspP5rwfOvUNXB
 KdqD1y0xAWb4GvJzk4CO+reAIjl1mbpRn7T4NKZaO6Rlrm4YYnWlKZQnR+KYsZLkkXD3DAkRdX8Bz
 v5gol897L+h4z7gvP8ZPgby40Kf534y+yvCo4pcqnky/2B3fOo1eJI5AGfBTal9Ws5NPFdSMsSExD
 1cOB5jmEu3HavgzkkSdqp44Lvc5vB87Hfx1ni4euVR6RkDezG2arwqCQzdm9KA6Vu49qskeNx5ccy
 MyknubgJWZBTkInijfyUf4o3r2eQUJd5qlksKIVcZoTnKCWrt5xGKoae+8G8NW2K8I+1h9TbpP33U
 OKHnBiRw==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uUkSK-008x2v-8g
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 13:07:48 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 4/5] drm/xe: Allow specifying number of extra dwords at the end
 of wa bb emission
Date: Thu, 26 Jun 2025 12:07:43 +0100
Message-ID: <20250626110744.34745-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250626110744.34745-1-tvrtko.ursulin@igalia.com>
References: <20250626110744.34745-1-tvrtko.ursulin@igalia.com>
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

Indirect context setup will need more than one.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index a45181219de4..df66387fa991 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -981,6 +981,7 @@ static u32 *
 setup_wa_bo(struct xe_lrc *lrc,
 	    struct xe_hw_engine *hwe,
 	    const size_t max_size,
+	    unsigned int reserve_dw,
 	    unsigned int offset,
 	    const struct wa_bo_setup *funcs,
 	    unsigned int num_funcs,
@@ -1011,10 +1012,9 @@ setup_wa_bo(struct xe_lrc *lrc,
 			*written += len;
 
 		/*
-		 * There should always be at least 1 additional dword for
-		 * the end marker
+		 * Caller has asked for at least reserve_dw to remain unused.
 		 */
-		if (len < 0 || xe_gt_WARN_ON(lrc->gt, remain < 1))
+		if (len < 0 || xe_gt_WARN_ON(lrc->gt, remain < reserve_dw))
 			goto fail;
 
 		cmd += len;
@@ -1049,7 +1049,7 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	unsigned int written = 0;
 	u32 *cmd, *buf = NULL;
 
-	cmd = setup_wa_bo(lrc, hwe, LRC_WA_BB_SIZE, offset, funcs,
+	cmd = setup_wa_bo(lrc, hwe, LRC_WA_BB_SIZE, 1, offset, funcs,
 			  ARRAY_SIZE(funcs), &buf, &written);
 	if (IS_ERR(cmd))
 		return PTR_ERR(cmd);
-- 
2.48.0

