Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED58EC71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 12:42:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD5410E1E3;
	Fri, 13 Jun 2025 12:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="od81XBIt";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00E910E1F3
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 12:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4oyeutMxUse0zaj1Pyb6LePdg2X3Bb790glj2ohuLpQ=; b=od81XBItG4kZfUFWwxFzb2ORFJ
 Uwu2ui3LOy5eaWoNE62mRWqCJFHNauqUDcnAL0x4oeJYbdungDD3VpXRB343KpVnc2GPiMesBIHRE
 iOKWj/GEg7Y/HQEcG1NYCmPj7I+xwdxyDUVSgZHZ6eIy+kMh6xtBPBs7qB1Fgdd2fKfODC+yJeQ/h
 thLAlKPCv9sOt5O3iPV5WLAHfLZTRoEWU/ro9U5muH3AJT+I3Vj21Jx+j2g8hY4dEGkJxcRPTvHDA
 KM1Ngtvo3ExSG5luf3RiLIPx8YLeK2fZVf7YRcCkcolsIMGcFdiNzK5jBSz+NL8V+xdNfFCPMn6Wl
 CGBQoJfA==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uQ3jU-0030zE-PH; Fri, 13 Jun 2025 14:42:08 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 2/8] drm/xe: Generalize wa bb emission code
Date: Fri, 13 Jun 2025 13:41:53 +0100
Message-ID: <20250613124159.65636-3-tvrtko.ursulin@igalia.com>
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

Generalize the wa bb emission by splitting it into three phases - setup,
emit and finish, and extract setup and finish steps into helpers.

This will enable using the same infrastructure for emitting the indirect
context workarounds.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 70 ++++++++++++++++++++++++++-----------
 1 file changed, 50 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 9841384cacd5..75dc29d261f9 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -968,32 +968,37 @@ static ssize_t wa_bb_setup_utilization(struct xe_lrc *lrc, struct xe_hw_engine *
 	return cmd - batch;
 }
 
-struct wa_bb_setup {
+struct wa_bo_setup {
 	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 			 u32 *batch, size_t max_size);
 };
 
-static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
+static u32 *
+setup_wa_bo(struct xe_lrc *lrc,
+	    struct xe_hw_engine *hwe,
+	    struct xe_bo *bo,
+	    const struct wa_bo_setup *funcs,
+	    unsigned int num_funcs,
+	    u32 **free)
 {
-	const size_t max_size = lrc->bb_per_ctx_bo->size;
-	static const struct wa_bb_setup funcs[] = {
-		{ .setup = wa_bb_setup_utilization },
-	};
+	const size_t max_size = bo->size;
+	u32 *cmd, *buf = NULL;
 	ssize_t remain;
-	u32 *cmd, *buf = NULL;
 
-	if (lrc->bb_per_ctx_bo->vmap.is_iomem) {
+	if (bo->vmap.is_iomem) {
 		buf = kmalloc(max_size, GFP_KERNEL);
 		if (!buf)
-			return -ENOMEM;
+			return ERR_PTR(-ENOMEM);
 		cmd = buf;
+		*free = buf;
 	} else {
-		cmd = lrc->bb_per_ctx_bo->vmap.vaddr;
+		cmd = bo->vmap.vaddr;
+		*free =  NULL;
 	}
 
 	remain = max_size / sizeof(*cmd);
 
-	for (size_t i = 0; i < ARRAY_SIZE(funcs); i++) {
+	for (size_t i = 0; i < num_funcs; i++) {
 		ssize_t len = funcs[i].setup(lrc, hwe, cmd, remain);
 
 		remain -= len;
@@ -1008,22 +1013,47 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 		cmd += len;
 	}
 
+	return cmd;
+
+fail:
+	kfree(buf);
+	return ERR_PTR(-ENOSPC);
+}
+
+static void finish_wa_bo(struct xe_lrc *lrc,
+			 struct xe_hw_engine *hwe,
+			 struct xe_bo *bo,
+			 u32 *cmd,
+			 u32 *free)
+{
+	if (!free)
+		return;
+
+	xe_map_memcpy_to(gt_to_xe(lrc->gt), &bo->vmap, 0, free,
+			 (cmd - free) * sizeof(*cmd));
+	kfree(free);
+}
+
+static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
+{
+	static const struct wa_bo_setup funcs[] = {
+		{ .setup = wa_bb_setup_utilization },
+	};
+	u32 *cmd, *buf = NULL;
+
+	cmd = setup_wa_bo(lrc, hwe, lrc->bb_per_ctx_bo, funcs,
+			  ARRAY_SIZE(funcs), &buf);
+	if (IS_ERR(cmd))
+		return PTR_ERR(cmd);
+
 	*cmd++ = MI_BATCH_BUFFER_END;
 
-	if (buf) {
-		xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bb_per_ctx_bo->vmap, 0,
-				 buf, (cmd - buf) * sizeof(*cmd));
-		kfree(buf);
-	}
+	finish_wa_bo(lrc, hwe, lrc->bb_per_ctx_bo, cmd, buf);
 
 	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
 			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
 
 	return 0;
-
-fail:
-	kfree(buf);
-	return -ENOSPC;
 }
 
 #define PVC_CTX_ASID		(0x2e + 1)
-- 
2.48.0

