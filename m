Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36A7C71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 15:36:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F7110EA21;
	Fri, 13 Jun 2025 15:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="iPeQVE3h";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D44C10EA14
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 15:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eUs63r8M/4zPg7c2m+4BvC2/gF6x4AxT4DqfokLQSD8=; b=iPeQVE3hhvOkKw0KBFwuU6mfZI
 6eAu6VD3UxZ9uNv/h21YQxw8E6rKNUgjyUylLw+4rPdoK0T4wegn+x/95QQ1k73Q3RlxS9xJjzq+H
 Z3oFZcegXhg4thqv9xAhPTDXtoSXL3ZlKN3YkJ3XmP0rDyh+tsLC4V5rK+ct0tFBReyAH8K+JhdPR
 ZCaZGdckQ+AnuONLt17QU3fAkpMY1kPvvYtS8GWTBpNhmdbwm59+HJCL5CD1vZjQMwguHf4/0i+xe
 ys5bD7NMCxDJCvkjUxlGG/0g3J+J44NQYpPHgN1MMMEKYQ4YhyBUsbYOpri7Eoc4JORuFCLJ63mDU
 86IOf7eg==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uQ6Rm-0034pF-PP; Fri, 13 Jun 2025 17:36:02 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 3/7] drm/xe: Return number of written dwords from
 workaround batch buffer emission
Date: Fri, 13 Jun 2025 16:35:54 +0100
Message-ID: <20250613153558.68350-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250613153558.68350-1-tvrtko.ursulin@igalia.com>
References: <20250613153558.68350-1-tvrtko.ursulin@igalia.com>
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
index 7eaa34ce3a23..0a90b7eeaf4e 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -984,7 +984,8 @@ setup_wa_bo(struct xe_lrc *lrc,
 	    unsigned int offset,
 	    const struct wa_bo_setup *funcs,
 	    unsigned int num_funcs,
-	    u32 **free)
+	    u32 **free,
+	    unsigned int *written)
 {
 	u32 *cmd, *buf = NULL;
 	ssize_t remain;
@@ -1006,6 +1007,8 @@ setup_wa_bo(struct xe_lrc *lrc,
 		ssize_t len = funcs[i].setup(lrc, hwe, cmd, remain);
 
 		remain -= len;
+		if (written)
+			*written += len;
 
 		/*
 		 * There should always be at least 1 additional dword for
@@ -1026,14 +1029,14 @@ setup_wa_bo(struct xe_lrc *lrc,
 
 static void finish_wa_bo(struct xe_lrc *lrc,
 			 unsigned int offset,
-			 u32 *cmd,
+			 unsigned int written,
 			 u32 *free)
 {
 	if (!free)
 		return;
 
 	xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bo->vmap, offset, free,
-			 (cmd - free) * sizeof(*cmd));
+			 written * sizeof(u32));
 	kfree(free);
 }
 
@@ -1043,16 +1046,18 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 		{ .setup = wa_bb_setup_utilization },
 	};
 	unsigned int offset = __xe_lrc_wa_bb_offset(lrc);
+	unsigned int written = 0;
 	u32 *cmd, *buf = NULL;
 
 	cmd = setup_wa_bo(lrc, hwe, LRC_WA_BB_SIZE, offset, funcs,
-			  ARRAY_SIZE(funcs), &buf);
+			  ARRAY_SIZE(funcs), &buf, &written);
 	if (IS_ERR(cmd))
 		return PTR_ERR(cmd);
 
 	*cmd++ = MI_BATCH_BUFFER_END;
+	written++;
 
-	finish_wa_bo(lrc, offset, cmd, buf);
+	finish_wa_bo(lrc, offset, written, buf);
 
 	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
 			     xe_bo_ggtt_addr(lrc->bo) + offset + 1);
-- 
2.48.0

