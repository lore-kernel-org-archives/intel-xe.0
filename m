Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6897C606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 18:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=DnB5xzCm
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E48810E440;
	Tue, 27 Oct 2026 18:03:22 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7862310E440
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 18:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1793124190;
 bh=AI07cY2fihMffbpl2UKU/UMJr12px5hHexAA2pcH9SE=;
 h=From:To:Cc:Subject:Date:From;
 b=DnB5xzCmM2kwzBoDd26BJs5tYEtOysdIDPVYZWHYQ1SNE7NUqo9yJumtGF87MgJTO
 ZnBaw0GRKtSZ2i/3Y9Q/BhY9ZeppKg3/HyGs1rmXYjIiq5B0EbWRtPm55vimnD3yBQ
 wzC5zhb7sVplCbsg0CrpvjhkLJ9pufQBP4nH4C8CSQjEI3q7HLuZUVUm1usndAFUyL
 PckWTG0GAO0MxhNimP4G+frl3Ir7cvZGGt9nTnt/H9IMP2frQIjMdVCM9W67Cv9xvS
 yU5tL2OFdkaj4zTcW0Xj4iavLmukSTKBIIP+0O05eD7AIPA9eRWjrs1I5ePUlYoQN/
 d/EPxV7hmP1aA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v3 1/2] drm/xe/bo: Add xe_bo_addr_iter.
Date: Tue, 27 Oct 2026 19:03:55 +0100
Message-ID: <20261027180354.340849-3-dev@lankhorst.se>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For display we iterate often over the pinned VRAM/system memory BO.
Add some code to speed up DPT/GGTT programming.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
Changes since v1:
- Add documentation.
---
 drivers/gpu/drm/xe/xe_bo.c | 64 +++++++++++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_bo.h |  3 ++
 2 files changed, 48 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 42a6aa1a2e4a0..0202028d38e5d 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -3478,37 +3478,63 @@ bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo)
 	return false;
 }
 
-/*
- * Resolve a BO address. There is no assert to check if the proper lock is held
- * so it should only be used in cases where it is not fatal to get the wrong
- * address, such as printing debug information, but not in cases where memory is
- * written based on this result.
+/**
+ * xe_bo_addr_iter_first - Iterate over a bo
+ * @bo: The BO
+ * @cur: Pointer to a &xe_res_cursor for iteration
+ * @offset: Offset into BO.
+ * @size: Size of iteration.
+ *
+ * Initializes @cur for iteration over all GPU addresses in the range
+ * [@offset...@offset+@size).
+ *
+ * This is useful for getting the GPU address for a range of pages,
+ * rather than calling xe_bo_addr separately for each page.
  */
-dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size)
+void xe_bo_addr_iter_first(struct xe_bo *bo, struct xe_res_cursor *cur, u64 offset, u64 size)
 {
 	struct xe_device *xe = xe_bo_device(bo);
-	struct xe_res_cursor cur;
-	u64 page;
-
-	xe_assert(xe, page_size <= PAGE_SIZE);
-	page = offset >> PAGE_SHIFT;
-	offset &= (PAGE_SIZE - 1);
 
 	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
 		xe_assert(xe, bo->ttm.ttm);
 
-		xe_res_first_sg(xe_bo_sg(bo), page << PAGE_SHIFT,
-				page_size, &cur);
-		return xe_res_dma(&cur) + offset;
+		xe_res_first_sg(xe_bo_sg(bo), offset, size, cur);
 	} else {
-		struct xe_res_cursor cur;
+		xe_res_first(bo->ttm.resource, offset, size, cur);
 
-		xe_res_first(bo->ttm.resource, page << PAGE_SHIFT,
-			     page_size, &cur);
-		return cur.start + offset + vram_region_gpu_offset(bo->ttm.resource);
+		xe_assert(xe, !cur->dma_addr);
+		cur->dma_start = vram_region_gpu_offset(bo->ttm.resource);
 	}
 }
 
+/**
+ * xe_bo_addr_iter_addr - Get the BO's GPU address at current cursor.
+ * @cur: Pointer to a &xe_res_cursor initialized by xe_bo_addr_iter_first()
+ *
+ * Returns: a 64-bits DMA address for usage on the device.
+ */
+dma_addr_t xe_bo_addr_iter_addr(struct xe_res_cursor *cur)
+{
+	if (cur->mem_type == XE_PL_TT)
+		return xe_res_dma(cur);
+
+	return cur->start + cur->dma_start;
+}
+
+/*
+ * Resolve a BO address. There is no assert to check if the proper lock is held
+ * so it should only be used in cases where it is not fatal to get the wrong
+ * address, such as printing debug information, but not in cases where memory is
+ * written based on this result.
+ */
+dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size)
+{
+	struct xe_res_cursor cur;
+
+	xe_bo_addr_iter_first(bo, &cur, offset, page_size);
+	return xe_bo_addr_iter_addr(&cur);
+}
+
 dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size)
 {
 	if (!READ_ONCE(bo->ttm.pin_count))
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 77b3a02e9b8eb..286f52225bc79 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -113,6 +113,7 @@ enum xe_madv_purgeable_state {
 };
 
 struct sg_table;
+struct xe_res_cursor;
 
 struct xe_bo *xe_bo_alloc(void);
 void xe_bo_free(struct xe_bo *bo);
@@ -375,6 +376,8 @@ static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
 }
 
 bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo);
+void xe_bo_addr_iter_first(struct xe_bo *bo, struct xe_res_cursor *cur, u64 offset, u64 size);
+dma_addr_t xe_bo_addr_iter_addr(struct xe_res_cursor *cur);
 dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size);
 dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size);
 
-- 
2.55.0

