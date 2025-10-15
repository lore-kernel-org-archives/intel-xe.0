Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217F3CCD197
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 07:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F67710E73B;
	Wed, 15 Oct 2025 07:47:35 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8058510E71E
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 07:47:26 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v7 05/12] drm/xe: Do not dereference ggtt_node in xe_bo.c
Date: Wed, 15 Oct 2025 09:47:14 +0200
Message-ID: <20251015074708.1654014-19-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015074708.1654014-14-dev@lankhorst.se>
References: <20251015074708.1654014-14-dev@lankhorst.se>
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

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_bo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7b65020818738..c895214a7a570 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1700,7 +1700,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
 
 	for_each_tile(tile, xe, id)
-		if (bo->ggtt_node[id] && bo->ggtt_node[id]->base.size)
+		if (bo->ggtt_node[id])
 			xe_ggtt_remove_bo(tile->mem.ggtt, bo);
 
 #ifdef CONFIG_PROC_FS
@@ -3581,8 +3581,8 @@ void xe_bo_put(struct xe_bo *bo)
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

