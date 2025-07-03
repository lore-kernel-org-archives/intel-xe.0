Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD99C83F0B
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 08:21:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDB810E7EE;
	Thu,  3 Jul 2025 08:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rS0m3qRU";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE0D10E7EB
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 08:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hHzN43gAiiADy9GmqjdbIgdC+PuqZuCXHxbm0JsAKq4=; b=rS0m3qRUP/iFbpTU+GbLJd8e/9
 sNg7NPIVASv0Ef68SRH6sN961FNQDHudk6uDvTK6DOCMLjc//6WcrpW/++aoKSc3lnW/2S+tb8SQ7
 1JMAZ9+Slpe4tX24G7D6GV6DUOmOXT/rwcgrJ5hE6Z4A2aqhtRj7g7dX8DHr+T0ooMzvBruirpfAu
 aMbhWXLCSeobuUQcSQ9/dKHxJ9D3kGRD7UGjtEYWRXfTiwXXlcWhRlxFwZd/qwRcwvIbbm+jvylZq
 0L7qp5mZ84JIqTTRlwL4WxTQRazfbIJviQgVOGILFTp+6evlBnTC8abBDadcCYvwGM+Ij/B8eHq/j
 fgNzQ8qQ==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uXFBp-00BoeX-1j; Thu, 03 Jul 2025 10:21:05 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v8 4/7] drm/xe: Allow specifying number of extra dwords at the
 end of wa bb emission
Date: Thu,  3 Jul 2025 09:20:56 +0100
Message-ID: <20250703082059.61597-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250703082059.61597-1-tvrtko.ursulin@igalia.com>
References: <20250703082059.61597-1-tvrtko.ursulin@igalia.com>
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
index 7f8911a10cc9..e278c12a41f9 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -982,6 +982,7 @@ static u32 *
 setup_bo(struct xe_lrc *lrc,
 	 struct xe_hw_engine *hwe,
 	 const size_t max_size,
+	 unsigned int reserve_dw,
 	 unsigned int offset,
 	 const struct bo_setup *funcs,
 	 unsigned int num_funcs,
@@ -1010,10 +1011,9 @@ setup_bo(struct xe_lrc *lrc,
 		remain -= len;
 
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
 
-	cmd = setup_bo(lrc, hwe, LRC_WA_BB_SIZE, offset, funcs,
+	cmd = setup_bo(lrc, hwe, LRC_WA_BB_SIZE, 1, offset, funcs,
 		       ARRAY_SIZE(funcs), &buf, &written);
 	if (IS_ERR(cmd))
 		return PTR_ERR(cmd);
-- 
2.48.0

