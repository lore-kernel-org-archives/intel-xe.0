Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B6BC71155
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 12:42:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A761B10E28E;
	Fri, 13 Jun 2025 12:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="V4QJerFG";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A014010E204
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 12:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=25cQTciQjjAGNeyjKwFNh1sdUU3tb+mlFbl1H/yxXAw=; b=V4QJerFGZ4CM5vU8iU+27TKz5S
 OnIb2gW/YHuZg6FRO/TaTIdsXxMaezy256wmUKoAdDLMekw7H3CpZMaWWD5xCXm0w0a/+YZ60X27v
 qWar5ouSieJCe8La9NyRxfyaJwE4dUx4AS4A3R3eaBuW0t0+YNB/wNr+VmURaJE4GbHIQ/MBc56hs
 enNBXj9XmkXVB9UA854WVsAhC7HZ9BZW8pSy/3pAp4OVw/mRNIQLKRKgIkuJMrqh0GIF9ycLIlxfx
 TGICoSrAr2CGAeWNjxFNHLXbSF9+OWhsZ+5F/A084e1WF2YcZI+u3ROKA2qdO6PeUVcKcmwuZwWlj
 VO9hS8oQ==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uQ3jV-0030zO-Fo; Fri, 13 Jun 2025 14:42:09 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 3/8] drm/xe: Support writing at offset in workaround batch
 buffer emission
Date: Fri, 13 Jun 2025 13:41:54 +0100
Message-ID: <20250613124159.65636-4-tvrtko.ursulin@igalia.com>
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

Indirect context setup will need the ability to write its payload into an
arbitrary offset.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 75dc29d261f9..37d4e2a3f5f0 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -977,6 +977,7 @@ static u32 *
 setup_wa_bo(struct xe_lrc *lrc,
 	    struct xe_hw_engine *hwe,
 	    struct xe_bo *bo,
+	    unsigned int offset,
 	    const struct wa_bo_setup *funcs,
 	    unsigned int num_funcs,
 	    u32 **free)
@@ -993,6 +994,7 @@ setup_wa_bo(struct xe_lrc *lrc,
 		*free = buf;
 	} else {
 		cmd = bo->vmap.vaddr;
+		cmd += offset / sizeof(u32);
 		*free =  NULL;
 	}
 
@@ -1023,13 +1025,14 @@ setup_wa_bo(struct xe_lrc *lrc,
 static void finish_wa_bo(struct xe_lrc *lrc,
 			 struct xe_hw_engine *hwe,
 			 struct xe_bo *bo,
+			 unsigned int offset,
 			 u32 *cmd,
 			 u32 *free)
 {
 	if (!free)
 		return;
 
-	xe_map_memcpy_to(gt_to_xe(lrc->gt), &bo->vmap, 0, free,
+	xe_map_memcpy_to(gt_to_xe(lrc->gt), &bo->vmap, offset, free,
 			 (cmd - free) * sizeof(*cmd));
 	kfree(free);
 }
@@ -1041,14 +1044,14 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	};
 	u32 *cmd, *buf = NULL;
 
-	cmd = setup_wa_bo(lrc, hwe, lrc->bb_per_ctx_bo, funcs,
+	cmd = setup_wa_bo(lrc, hwe, lrc->bb_per_ctx_bo, 0, funcs,
 			  ARRAY_SIZE(funcs), &buf);
 	if (IS_ERR(cmd))
 		return PTR_ERR(cmd);
 
 	*cmd++ = MI_BATCH_BUFFER_END;
 
-	finish_wa_bo(lrc, hwe, lrc->bb_per_ctx_bo, cmd, buf);
+	finish_wa_bo(lrc, hwe, lrc->bb_per_ctx_bo, 0, cmd, buf);
 
 	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
 			     xe_bo_ggtt_addr(lrc->bb_per_ctx_bo) | 1);
-- 
2.48.0

