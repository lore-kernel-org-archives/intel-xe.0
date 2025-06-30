Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB0BC8302F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 12:47:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7392910E43D;
	Mon, 30 Jun 2025 12:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bDjRXbls";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C26D10E43C
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 12:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RzYYHQ/v+qOiawb3ciIEj04BNKDNT1DYgDvfKRK5QbM=; b=bDjRXblsSLgMx9KYbIOdRVSbVV
 NVvuYZrsTfHO48hj+QoVt/7c/pqHHa3pO0eLHw3zS67+wZwq/yunGSAxe0XYhLHg5vF1QifR5qNCt
 A8XtM+VjN2gPexf6K7hASyr3rCUPD1Rk6TTBCyRSpAgvLzQlpBtKMHheI5hie9Hl3EJob8/JOAOHD
 3epOPqn1QXvJGjzs9ZV0F9KKxzLIvbKzpYt12iu+YVlGAURf6gHgV86o8fomCT5fdlkvKt+D77EY9
 9bwn8ELB27lmkQjaI5m0PLhBhXUPb2GXxHllkr22LBXdFh3MhjN9Xj319H6jFZ0yz9VKgt6vgMNB1
 58EFiLhQ==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uWDum-00ATeh-TC; Mon, 30 Jun 2025 14:47:16 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v8 04/24] drm/xe: Return number of written dwords from
 workaround batch buffer emission
Date: Mon, 30 Jun 2025 13:46:50 +0100
Message-ID: <20250630124711.8209-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250630124711.8209-1-tvrtko.ursulin@igalia.com>
References: <20250630124711.8209-1-tvrtko.ursulin@igalia.com>
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
index 7c7f6dae158c..5709c0c679af 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -985,7 +985,8 @@ setup_wa_bo(struct xe_lrc *lrc,
 	    unsigned int offset,
 	    const struct wa_bo_setup *funcs,
 	    unsigned int num_funcs,
-	    u32 **free)
+	    u32 **free,
+	    unsigned int *written)
 {
 	u32 *cmd, *buf = NULL;
 	ssize_t remain;
@@ -1016,6 +1017,8 @@ setup_wa_bo(struct xe_lrc *lrc,
 			goto fail;
 
 		cmd += len;
+		if (written)
+			*written += len;
 	}
 
 	return cmd;
@@ -1027,14 +1030,14 @@ setup_wa_bo(struct xe_lrc *lrc,
 
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
 
@@ -1044,16 +1047,18 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 		{ .setup = setup_utilization_wa },
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

