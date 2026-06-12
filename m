Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D99CD98D8
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 14:11:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8635F10F545;
	Fri, 12 Jun 2026 14:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="GzGKTM7o";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8E810F58F
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 14:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1781273472;
 bh=7mQbEe95OczlZ+fIQGQh187m+A9VddpOeGzcm0Hpjc8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GzGKTM7oknykNFIAJL4AEyfsPBb/B4uhFSy9vWJ4+OYKKUu1s0LPjqZKYgEM5kncq
 xYjb8Y/urIZTL0Ql3oMQoQWOx6Lsa7QVg0T+ygBGVgXtYX68fRjTtzjZWTOeKKEC+z
 OhfMfFCznWr4y21HX5MMp2FklmaJOSLuteI4whGEdoMJ/go1P8qkxT0fOOQ8+QIzPX
 iJ1DKNVijEfEYu8ZtS+4uJ/bjvVzyEingmm/AFrVojhZNBnFWUmOEUn+jN0c35ARj/
 f21i5RjWEp+xyjBr84FUDgUmlq+PwhNoFfWiDHZN4cwTSMpoIELwsVm6VuoorsWtWf
 EMu4cXV4jAF4Q==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 1/2] drm/xe/bo: Add xe_bo_addr_iter.
Date: Fri, 12 Jun 2026 16:11:20 +0200
Message-ID: <20260612141122.17959-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612141122.17959-1-dev@lankhorst.se>
References: <20260612141122.17959-1-dev@lankhorst.se>
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

For display we iterate often over the pinned VRAM/system memory BO.
Add some code to speed up DPT/GGTT programming.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_bo.c | 45 ++++++++++++++++++++++----------------
 drivers/gpu/drm/xe/xe_bo.h |  3 +++
 2 files changed, 29 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5275badb024cd..38223bb8b74c6 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -3143,6 +3143,30 @@ bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo)
 	return false;
 }
 
+void xe_bo_addr_iter_first(struct xe_bo *bo, struct xe_res_cursor *cur, u64 offset, u64 size)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+
+	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
+		xe_assert(xe, bo->ttm.ttm);
+
+		xe_res_first_sg(xe_bo_sg(bo), offset, size, cur);
+	} else {
+		xe_res_first(bo->ttm.resource, offset, size, cur);
+
+		xe_assert(xe, !cur->dma_addr);
+		cur->dma_start = vram_region_gpu_offset(bo->ttm.resource);
+	}
+}
+
+dma_addr_t xe_bo_addr_iter_addr(struct xe_res_cursor *cur)
+{
+	if (cur->mem_type == XE_PL_TT)
+		return xe_res_dma(cur);
+
+	return cur->start + cur->dma_start;
+}
+
 /*
  * Resolve a BO address. There is no assert to check if the proper lock is held
  * so it should only be used in cases where it is not fatal to get the wrong
@@ -3151,27 +3175,10 @@ bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo)
  */
 dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size)
 {
-	struct xe_device *xe = xe_bo_device(bo);
 	struct xe_res_cursor cur;
-	u64 page;
-
-	xe_assert(xe, page_size <= PAGE_SIZE);
-	page = offset >> PAGE_SHIFT;
-	offset &= (PAGE_SIZE - 1);
 
-	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
-		xe_assert(xe, bo->ttm.ttm);
-
-		xe_res_first_sg(xe_bo_sg(bo), page << PAGE_SHIFT,
-				page_size, &cur);
-		return xe_res_dma(&cur) + offset;
-	} else {
-		struct xe_res_cursor cur;
-
-		xe_res_first(bo->ttm.resource, page << PAGE_SHIFT,
-			     page_size, &cur);
-		return cur.start + offset + vram_region_gpu_offset(bo->ttm.resource);
-	}
+	xe_bo_addr_iter_first(bo, &cur, offset, page_size);
+	return xe_bo_addr_iter_addr(&cur);
 }
 
 dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size)
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 4128dbf7fe695..9155e424f081c 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -111,6 +111,7 @@ enum xe_madv_purgeable_state {
 };
 
 struct sg_table;
+struct xe_res_cursor;
 
 struct xe_bo *xe_bo_alloc(void);
 void xe_bo_free(struct xe_bo *bo);
@@ -370,6 +371,8 @@ static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
 }
 
 bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo);
+void xe_bo_addr_iter_first(struct xe_bo *bo, struct xe_res_cursor *cur, u64 offset, u64 size);
+dma_addr_t xe_bo_addr_iter_addr(struct xe_res_cursor *cur);
 dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size);
 dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size);
 
-- 
2.53.0

