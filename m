Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1867C83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 16:01:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987CF10EA67;
	Fri, 11 Jul 2025 16:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nG21nund";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7512010EA67
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 16:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e/GPFhwnFnAUPDNtrH3ihZmDxb3y+bCDW1jahNJ0a9g=; b=nG21nundmodfCXYSmbfujL861k
 ufmDmJ9ToPNVPKfGkeFj+3vv3IzRp3YdBq1ixPE+OAVhBVMNP4+e3Up/tyPciy6dqnPN4FNoTewms
 3LlTwZ0kPxMjESjUHoULiRa12aQeBGsZybT90UVfmE7Br36KD7lkIhXAUKl/83BLo7I7qgvtjl0K+
 QZwHbUU3oTNX5x+6PS+fQzKSv6/tOwDMuIM5IXBJ802of1JO/yZG9L25fMVK2qWQMN6I9T8zpwBCG
 oZxEHzsdIqgSdN6O0hE4To9UvtOPAMQFaIYuuqZ9cdXGKgOwaYocdLVtqWKgMkEbSuFaxob6dbLQh
 1MFADg+A==;
Received: from [84.65.48.237] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uaGCB-00FR5l-O0; Fri, 11 Jul 2025 18:01:55 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v10 1/8] drm/xe: Generalize wa bb emission code
Date: Fri, 11 Jul 2025 17:01:46 +0100
Message-ID: <20250711160153.49833-2-tvrtko.ursulin@igalia.com>
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

Generalize the wa bb emission by splitting it into three phases - setup,
emit and finish, and extract setup and finish steps into helpers.

This will enable using the same infrastructure for emitting the indirect
context workarounds.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 74 +++++++++++++++++++++++++------------
 1 file changed, 50 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index d2ad8fe737eb..2385e22437b3 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -972,32 +972,36 @@ static ssize_t wa_bb_setup_utilization(struct xe_lrc *lrc, struct xe_hw_engine *
 	return cmd - batch;
 }
 
-struct wa_bb_setup {
+struct bo_setup {
 	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 			 u32 *batch, size_t max_size);
 };
 
-static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
+static u32 *setup_bo(struct xe_lrc *lrc,
+		     struct xe_hw_engine *hwe,
+		     const size_t max_size,
+		     unsigned int offset,
+		     const struct bo_setup *funcs,
+		     unsigned int num_funcs,
+		     u32 **free)
 {
-	const size_t max_size = LRC_WA_BB_SIZE;
-	static const struct wa_bb_setup funcs[] = {
-		{ .setup = wa_bb_setup_utilization },
-	};
+	u32 *cmd, *buf = NULL;
 	ssize_t remain;
-	u32 *cmd, *buf = NULL;
 
 	if (lrc->bo->vmap.is_iomem) {
 		buf = kmalloc(max_size, GFP_KERNEL);
 		if (!buf)
-			return -ENOMEM;
+			return ERR_PTR(-ENOMEM);
 		cmd = buf;
+		*free = buf;
 	} else {
-		cmd = lrc->bo->vmap.vaddr + __xe_lrc_wa_bb_offset(lrc);
+		cmd = lrc->bo->vmap.vaddr + offset;
+		*free = NULL;
 	}
 
 	remain = max_size / sizeof(*cmd);
 
-	for (size_t i = 0; i < ARRAY_SIZE(funcs); i++) {
+	for (size_t i = 0; i < num_funcs; i++) {
 		ssize_t len = funcs[i].setup(lrc, hwe, cmd, remain);
 
 		remain -= len;
@@ -1012,23 +1016,45 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 		cmd += len;
 	}
 
-	*cmd++ = MI_BATCH_BUFFER_END;
-
-	if (buf) {
-		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bo->vmap,
-				 __xe_lrc_wa_bb_offset(lrc), buf,
-				 (cmd - buf) * sizeof(*cmd));
-		kfree(buf);
-	}
-
-	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR, xe_bo_ggtt_addr(lrc->bo) +
-			     __xe_lrc_wa_bb_offset(lrc) + 1);
-
-	return 0;
+	return cmd;
 
 fail:
 	kfree(buf);
-	return -ENOSPC;
+	return ERR_PTR(-ENOSPC);
+}
+
+static void finish_bo(struct xe_lrc *lrc, unsigned int offset, u32 *cmd,
+		      u32 *free)
+{
+	if (!free)
+		return;
+
+	xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bo->vmap, offset, free,
+			 (cmd - free) * sizeof(*cmd));
+	kfree(free);
+}
+
+static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
+{
+	static const struct bo_setup funcs[] = {
+		{ .setup = wa_bb_setup_utilization },
+	};
+	unsigned int offset = __xe_lrc_wa_bb_offset(lrc);
+	u32 *cmd, *buf = NULL;
+
+	cmd = setup_bo(lrc, hwe, LRC_WA_BB_SIZE, offset, funcs,
+		       ARRAY_SIZE(funcs), &buf);
+	if (IS_ERR(cmd))
+		return PTR_ERR(cmd);
+
+	*cmd++ = MI_BATCH_BUFFER_END;
+
+	finish_bo(lrc, offset, cmd, buf);
+
+	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
+			     xe_bo_ggtt_addr(lrc->bo) + offset + 1);
+
+	return 0;
 }
 
 #define PVC_CTX_ASID		(0x2e + 1)
-- 
2.48.0

