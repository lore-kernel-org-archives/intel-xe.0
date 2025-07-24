Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70BBC87FC5
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 12:04:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC7B10E944;
	Thu, 24 Jul 2025 12:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Ylgy6m/I";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116A310E941
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 12:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1HYXlbiuzcmWEmES+mNzddDxuy3LkTfoYV7WRetov6g=; b=Ylgy6m/IjmyTLGnvzs4yLDDivJ
 dexgMXY/ppY41I/li6ouhDLfhSUWRBB+I4FvtO1sNapIDuQqIXhYL8IZuq5qZYgnG0OORtB8ixtbE
 86oi4vHfB+KO1aGLlHxq7l9kVuNbULcpxnjImp8AEDSmoGb0AbL+5ALIHk/prdSO8q1dYWRiKsra1
 nIuK6E4cgsB/i6SJcjOc3HVrlXlJm7wPJRgco5zKtD/n3iFIV8gPoTrgJl0HL5BbnrwCJaoMPgS/+
 NnRdoRWqAJfjFvh3L3O4GVMVeyRhIPPxahEy+pWIuyrveGXhzRjMP2Z/50wEmHEqg5OyTfOcIOO2P
 YMDvgF6g==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ueugI-003AgD-CP
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 14:04:14 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 10/13] drm/xe: Handle DPT in system memory
Date: Thu, 24 Jul 2025 13:03:58 +0100
Message-ID: <20250724120405.72946-11-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250724120405.72946-1-tvrtko.ursulin@igalia.com>
References: <20250724120405.72946-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

If DPT is allocated from system memory it will be created in the default
write-back cached mode. This means we need to flush it after populating
otherwise nothing works.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 6d680ab3d944..e683e2dc7e00 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -3,6 +3,7 @@
  * Copyright © 2021 Intel Corporation
  */
 
+#include <drm/drm_cache.h>
 #include <drm/ttm/ttm_bo.h>
 
 #include "i915_vma.h"
@@ -206,6 +207,8 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 
 	if (dpt->vmap.is_iomem && !xe_bo_is_vram(bo))
 		ggtt_flush_writes(tile0->mem.ggtt);
+	else if (!xe_bo_is_vram(dpt) && !xe_bo_is_stolen(dpt))
+		drm_clflush_virt_range(dpt->vmap.vaddr, dpt_size);
 
 	vma->dpt = dpt;
 	vma->node = dpt->ggtt_node[tile0->id];
-- 
2.48.0

