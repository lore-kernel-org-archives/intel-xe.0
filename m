Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F69D1A62F
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 13:37:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E29D10E8D6;
	Fri,  9 Jan 2026 13:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="ooM+07if";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F61210E8D3
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 13:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1767965874;
 bh=d/N6FPD2DZrJosYziSAYtvZHNjP/cC25jT0I9oDbkHQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ooM+07ifW6QUTzwaNE2u9/h6y39y677qMqIJnMe5JqnM0q5t6QqxDciwoxdUfnrnx
 jjrYogHkyho4oQ+HrF9o+/CyuXyhACX8jOJuR3mvuTMfOKe+xd3hJ5pcraMQtVqnA7
 wDuKlOUoclA5KEDskY1vGbDJ49aBFMaepiVyNQod4SrgnHxFOdwGXQOPW2aHNNUPqJ
 UG9ps4PjSw8qoqN7TVMqmtT0Sjds6+KAtUi4XCPffTLdiT8ois0ZAmTt+VNBJlMpsh
 1CUepdDAFtQ/i+6M6H+x8X7SSNLJdbRp4Ui7pk356G1u5xAH2i5oBv/Xk/a7IKnIUt
 MUgnDCa4Iz5tw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR-CI-DO-NOT-REVIEW-v3 05/12] drm/xe: Do not dereference ggtt_node
 in xe_bo.c
Date: Fri,  9 Jan 2026 14:37:38 +0100
Message-ID: <20260109133746.739923-6-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260109133746.739923-1-dev@lankhorst.se>
References: <20260109133746.739923-1-dev@lankhorst.se>
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
index 6ab52fa397e3f..1763089f85832 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1714,7 +1714,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
 
 	for_each_tile(tile, xe, id)
-		if (bo->ggtt_node[id] && bo->ggtt_node[id]->base.size)
+		if (bo->ggtt_node[id])
 			xe_ggtt_remove_bo(tile->mem.ggtt, bo);
 
 #ifdef CONFIG_PROC_FS
@@ -3608,8 +3608,8 @@ void xe_bo_put(struct xe_bo *bo)
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

