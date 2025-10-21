Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43B1CCD1AA
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 12:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A2610E5DD;
	Tue, 21 Oct 2025 12:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="TF+Kb/Kw";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABED610E5DB
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 12:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1761049109;
 bh=pp2ZYaoqtD/U8WfB0tDxM4p/wiaUe+xc5+WGkdnShdE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TF+Kb/KwQ0wE/Litv/MPec83M/r+FTpZ1lqi4gnGtn+a2fvN8zz8h2zF0XMeqzSnO
 JnZ4czmuW2VYgmaBG6kWe9twgP4wDjh6tUdmdfS1NSgLSME3Sc713aD7vrlAxAoGCU
 y7aIVqaR9NkEbH/w+DtjSqLTWrTmkhAGBaM4qnmNmUfj3e7UvtE62tGoeBTGM9z7mQ
 R1ZAJ/RYCwuRg4sm1pSsi/LTf9Re/ioqU/z2ILQtMbtiPBAPeBi1t9V13wXHwj+Y4L
 JJfPCj+HhPsVcJhVHNi5mdJVuWQ8W5nz6JLlUfIYOKzWwM8Ogdgy8w/EW4gvMxluHJ
 ozQOvYh9K2cIQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 5/7] drm/xe: Do not dereference ggtt_node in xe_bo.c
Date: Tue, 21 Oct 2025 14:18:19 +0200
Message-ID: <20251021121814.2193153-14-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021121814.2193153-9-dev@lankhorst.se>
References: <20251021121814.2193153-9-dev@lankhorst.se>
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

A careful inspection of __xe_ggtt_insert_bo_at() shows that
the ggtt_node can always be seen as inserted from xe_bo.c
due to the way error handling is performed.

The checks are also a little bit too paranoid, since we
never create a bo with ggtt_node[id] initialised but not
inserted into the GGTT, which can be seen by looking at
__xe_ggtt_insert_bo_at()

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_bo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index cbc3ee1572188..451a772f68648 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1717,7 +1717,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
 
 	for_each_tile(tile, xe, id)
-		if (bo->ggtt_node[id] && bo->ggtt_node[id]->base.size)
+		if (bo->ggtt_node[id])
 			xe_ggtt_remove_bo(tile->mem.ggtt, bo);
 
 #ifdef CONFIG_PROC_FS
@@ -3598,8 +3598,8 @@ void xe_bo_put(struct xe_bo *bo)
 			might_lock(&bo->client->bos_lock);
 #endif
 		for_each_tile(tile, xe_bo_device(bo), id)
-			if (bo->ggtt_node[id] && bo->ggtt_node[id]->ggtt)
-				xe_ggtt_might_lock(bo->ggtt_node[id]->ggtt);
+			if (bo->ggtt_node[id])
+				xe_ggtt_might_lock(tile->mem.ggtt);
 		drm_gem_object_put(&bo->ttm.base);
 	}
 }
-- 
2.51.0

