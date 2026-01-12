Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D26C9EC93
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 14:21:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8284710E3E6;
	Mon, 12 Jan 2026 14:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="ZbK/c57G";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2321810E3E6
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 14:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1768227687;
 bh=YQgrRCjeQWqPxMLJVVBYF62iG+fEC0v7NYdGvIA8Z78=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZbK/c57GIl7VG3RW7qRt6QAA+FtI+9OnfA85sNogiwbaqY6GOtfrItg50cAsfyx21
 2jy+LxL9/V9M6uDqUkE5YV91PY0CTa6JG8ZDIp0OlL+aM9ZD71fiK+8HrWxlDvaTzV
 HzuFe5pXa7Ev0Rc3pBJos0aDqmS1fFgZcb65i9Cmue2+YiFLJPXiHSbCHoaZrej5Ra
 SYPAAhypmgu9WzHHMRbO7oruWHicSgxfjZm1imt8ydYfB5LE4KIWW+mVNgNxwMhU69
 9ZmwYcTbYA8xlP636nvRgkrjM/+7HaJAbsUc5IrODhaHGyUGE46DXnSxaXoeRg5NuQ
 kouuLrxGAM1Mw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR-CI-DO-NOT-REVIEW-v4 05/12] drm/xe: Do not dereference ggtt_node
 in xe_bo.c
Date: Mon, 12 Jan 2026 15:21:14 +0100
Message-ID: <20260112142121.1153027-6-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260112142121.1153027-1-dev@lankhorst.se>
References: <20260112142121.1153027-1-dev@lankhorst.se>
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

Additionally, the size of the GGTT is never bigger than 4 GB,
so adding a check at that level is incorrect.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_bo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 408c74216fdf2..917e50c276ac9 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1715,7 +1715,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
 
 	for_each_tile(tile, xe, id)
-		if (bo->ggtt_node[id] && bo->ggtt_node[id]->base.size)
+		if (bo->ggtt_node[id])
 			xe_ggtt_remove_bo(tile->mem.ggtt, bo);
 
 #ifdef CONFIG_PROC_FS
@@ -3609,8 +3609,8 @@ void xe_bo_put(struct xe_bo *bo)
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

