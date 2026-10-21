Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CE6606A328
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 15:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=bcKo39mD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7629B10E31F;
	Wed, 21 Oct 2026 15:00:54 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FEB10F343
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 15:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1792594846;
 bh=BgEZm6D4ubQtnuiR4qMaH8BgBgQLO99dq6huQn9Q56Q=;
 h=From:To:Cc:Subject:Date:From;
 b=bcKo39mDTo9ALK50aUafEjNvc2OSzN9KELJs/W6F2uAIBRge4o/jUWqVOHGA7XCGD
 yEqqsLBpnYBU2EU3gyeZxQfIUwkpag0VZTAXOKqQ+kQUYV5kn2kLI51R9W2e+thyjz
 Sw++97ULb0lS4WLvYNr9bXEeCJJz5xdrTyQtD1mqY/imSBWw9FpaoATgxxmQhzqCW5
 GeG8IZ+CpWqUbFxB9msGDyskROxZGrmZsyCv5flLnBOuXbQS6kyYTVbBmz3gJNuDe1
 GJC8KJcEJOpJemZNLUJql/NIiOrKMO3pkoF6hkiybAYlNqnkTwa9jj9QPKeDOCHCiM
 XzJoQ782VR70g==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 1/2] drm/xe/bo: Add xe_bo_addr_iter.
Date: Wed, 21 Oct 2026 17:01:17 +0200
Message-ID: <20261021150116.516131-3-dev@lankhorst.se>
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
 drivers/gpu/drm/xe/xe_bo.c | 45 ++++++++++++++++++++++----------------
 drivers/gpu/drm/xe/xe_bo.h |  3 +++
 2 files changed, 29 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 12e523c61c1f3..5e48669732fdd 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -3434,6 +3434,30 @@ bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo)
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
@@ -3442,27 +3466,10 @@ bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo)
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

