Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAADDC83F22
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 16:02:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDD810EA6F;
	Fri, 11 Jul 2025 16:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="flkhJ5dB";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DA910E3A5
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 16:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yDk4iNt8vH44oMYGCySdgYnHlK1Qx7bwxB/IohkV0LA=; b=flkhJ5dBN2GkXVccLEMV0iJ2SV
 yo8vkv38fOupv6YdA7hIYzjpDrKCyu7BuLIML8V6Q2g0DHYEj4JCfsjl0f1VSVvkGIbLawl4kZ6M+
 NwYkYzxNQVDxBxWlgA4xoq8Ds7PTXTdLIVWvjlSJwT5JOcVwHr+1bJ7KfXXWaC2DdXE+d8CJseMwM
 UJWOjCFBsycvCtgSN+p1jaO/TR8V/X2TXJsYM0RjHQIkf3LRyUm2DX9EXogmCDwPf6nl3VjNRLmKP
 n/ZaD/mnCe7MAin9Z9nAAs4h1IrgR6BVsv/jI2agFNym06JHL2TxbjkF5BJ4ouxlxkTBpSuRYuz5I
 ZV/zdkQg==;
Received: from [84.65.48.237] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uaGCC-00FR5t-FR; Fri, 11 Jul 2025 18:01:56 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v10 2/8] drm/xe: Pass wa bb setup arguments in a struct
Date: Fri, 11 Jul 2025 17:01:47 +0100
Message-ID: <20250711160153.49833-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250711160153.49833-1-tvrtko.ursulin@igalia.com>
References: <20250711160153.49833-1-tvrtko.ursulin@igalia.com>
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

Group the function arguments in a struct for more readable code and easier
extending.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 91 +++++++++++++++++++++----------------
 1 file changed, 52 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 2385e22437b3..578bef1e8140 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -977,32 +977,39 @@ struct bo_setup {
 			 u32 *batch, size_t max_size);
 };
 
-static u32 *setup_bo(struct xe_lrc *lrc,
-		     struct xe_hw_engine *hwe,
-		     const size_t max_size,
-		     unsigned int offset,
-		     const struct bo_setup *funcs,
-		     unsigned int num_funcs,
-		     u32 **free)
+struct bo_setup_state {
+	/* Input: */
+	struct xe_lrc 		*lrc;
+	struct xe_hw_engine	*hwe;
+	size_t			max_size;
+	unsigned		offset;
+	const struct bo_setup	*funcs;
+	unsigned		num_funcs;
+
+	/* State: */
+	u32			*buffer;
+	u32			*ptr;
+};
+
+static int setup_bo(struct bo_setup_state *state)
 {
-	u32 *cmd, *buf = NULL;
 	ssize_t remain;
 
-	if (lrc->bo->vmap.is_iomem) {
-		buf = kmalloc(max_size, GFP_KERNEL);
-		if (!buf)
-			return ERR_PTR(-ENOMEM);
-		cmd = buf;
-		*free = buf;
+	if (state->lrc->bo->vmap.is_iomem) {
+		state->buffer = kmalloc(state->max_size, GFP_KERNEL);
+		if (!state->buffer)
+			return -ENOMEM;
+		state->ptr = state->buffer;
 	} else {
-		cmd = lrc->bo->vmap.vaddr + offset;
-		*free = NULL;
+		state->ptr = state->lrc->bo->vmap.vaddr + state->offset;
+		state->buffer = NULL;
 	}
 
-	remain = max_size / sizeof(*cmd);
+	remain = state->max_size / sizeof(u32);
 
-	for (size_t i = 0; i < num_funcs; i++) {
-		ssize_t len = funcs[i].setup(lrc, hwe, cmd, remain);
+	for (size_t i = 0; i < state->num_funcs; i++) {
+		ssize_t len = state->funcs[i].setup(state->lrc, state->hwe,
+						    state->ptr, remain);
 
 		remain -= len;
 
@@ -1010,28 +1017,28 @@ static u32 *setup_bo(struct xe_lrc *lrc,
 		 * There should always be at least 1 additional dword for
 		 * the end marker
 		 */
-		if (len < 0 || xe_gt_WARN_ON(lrc->gt, remain < 1))
+		if (len < 0 || xe_gt_WARN_ON(state->lrc->gt, remain < 1))
 			goto fail;
 
-		cmd += len;
+		state->ptr += len;
 	}
 
-	return cmd;
+	return 0;
 
 fail:
-	kfree(buf);
-	return ERR_PTR(-ENOSPC);
+	kfree(state->buffer);
+	return -ENOSPC;
 }
 
-static void finish_bo(struct xe_lrc *lrc, unsigned int offset, u32 *cmd,
-		      u32 *free)
+static void finish_bo(struct bo_setup_state *state)
 {
-	if (!free)
+	if (!state->buffer)
 		return;
 
-	xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bo->vmap, offset, free,
-			 (cmd - free) * sizeof(*cmd));
-	kfree(free);
+	xe_map_memcpy_to(gt_to_xe(state->lrc->gt), &state->lrc->bo->vmap,
+			 state->offset, state->buffer,
+			 (state->ptr - state->buffer) * sizeof(u32));
+	kfree(state->buffer);
 }
 
 static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
@@ -1039,20 +1046,26 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	static const struct bo_setup funcs[] = {
 		{ .setup = wa_bb_setup_utilization },
 	};
-	unsigned int offset = __xe_lrc_wa_bb_offset(lrc);
-	u32 *cmd, *buf = NULL;
+	struct bo_setup_state state = {
+		.lrc = lrc,
+		.hwe = hwe,
+		.max_size = LRC_WA_BB_SIZE,
+		.offset = __xe_lrc_wa_bb_offset(lrc),
+		.funcs = funcs,
+		.num_funcs = ARRAY_SIZE(funcs),
+	};
+	int ret;
 
-	cmd = setup_bo(lrc, hwe, LRC_WA_BB_SIZE, offset, funcs,
-		       ARRAY_SIZE(funcs), &buf);
-	if (IS_ERR(cmd))
-		return PTR_ERR(cmd);
+	ret = setup_bo(&state);
+	if (ret)
+		return ret;
 
-	*cmd++ = MI_BATCH_BUFFER_END;
+	*state.ptr++ = MI_BATCH_BUFFER_END;
 
-	finish_bo(lrc, offset, cmd, buf);
+	finish_bo(&state);
 
 	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
-			     xe_bo_ggtt_addr(lrc->bo) + offset + 1);
+			     xe_bo_ggtt_addr(lrc->bo) + state.offset + 1);
 
 	return 0;
 }
-- 
2.48.0

