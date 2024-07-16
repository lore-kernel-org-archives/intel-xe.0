Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20495C3DA4B
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 01:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E839D10E4CE;
	Tue, 16 Jul 2024 01:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBltFZzH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBCA10E4CE
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 01:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721091693; x=1752627693;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tcmBuNn27WzSZQ25PNWZIzf5bmaUz7p5/NXtqAIUxtE=;
 b=BBltFZzHJ0ICF9cfiCt8Zmcm6prBKzh/h/RlhG6OEhC8I2jmMohIi4OH
 1ixrJ/VSZgADUe6AmiYO/pLyW3jv0OGOpTVcLqBV/Rc1Z1JJ0dvrXEApl
 xoJ0PSS/8KWXCQJLhEcPbS0ir8agKxWGJtNfFGYwHtaglwme0D+iBghU7
 EqbR4ePxNJMpFB4ioULrgkk1h5vIvJB7x7AlcWYN7nYq80/CcSDkHbQjx
 xUz+tSUKqPdZMmoKNEWu3xIuk/lCPL++UId3mKqW5o0eo+C+BbGPB+eXg
 OvfAo4I8E4TBsh1vIGxgw2WyozKtVtLEgbzEyolfK88T4OlnbLm66TUsz w==;
X-CSE-ConnectionGUID: xHbbyNHBS+SK1AxTjx0Rtw==
X-CSE-MsgGUID: /b+3nSM7RSWCquMcVzBjyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18618362"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="18618362"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 18:01:33 -0700
X-CSE-ConnectionGUID: TePPOfrjSJKANov1kDo9eQ==
X-CSE-MsgGUID: 2rEdcZ0lSjadnv8JEZWPRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="49874300"
Received: from dut1103bmgfrd.igk.intel.com ([10.211.177.128])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 18:01:32 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v4 7/7] drm/xe/migrate: Parameterize ccs and bo data clear in
 xe_migrate_clear()
Date: Tue, 16 Jul 2024 01:01:11 +0000
Message-Id: <3148ab4b02400ee5e296af9968f0cde9b0a7aaa2.1721091282.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721091282.git.akshata.jahagirdar@intel.com>
References: <cover.1721091282.git.akshata.jahagirdar@intel.com>
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

Parameterize clearing ccs and bo data in xe_migrate_clear() which  higher
layers can utilize. This patch will be used later on when doing bo data
clear for igfx as well.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c      |  3 ++-
 drivers/gpu/drm/xe/tests/xe_migrate.c |  8 ++++----
 drivers/gpu/drm/xe/xe_bo.c            | 10 ++++++++--
 drivers/gpu/drm/xe/xe_migrate.c       | 23 +++++++++++++++--------
 drivers/gpu/drm/xe/xe_migrate.h       |  4 +++-
 5 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index e2e0ea24757a..750759be4d4d 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -35,7 +35,8 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
 
 	/* Optionally clear bo *and* CCS data in VRAM. */
 	if (clear) {
-		fence = xe_migrate_clear(tile->migrate, bo, bo->ttm.resource);
+		fence = xe_migrate_clear(tile->migrate, bo, bo->ttm.resource,
+					 true, true);
 		if (IS_ERR(fence)) {
 			KUNIT_FAIL(test, "Failed to submit bo clear.\n");
 			return PTR_ERR(fence);
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 93fff3f515eb..1dd144e96bd6 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -104,7 +104,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 	}
 
 	xe_map_memset(xe, &remote->vmap, 0, 0xd0, remote->size);
-	fence = xe_migrate_clear(m, remote, remote->ttm.resource);
+	fence = xe_migrate_clear(m, remote, remote->ttm.resource, true, true);
 	if (!sanity_fence_failed(xe, fence, big ? "Clearing remote big bo" :
 				 "Clearing remote small bo", test)) {
 		retval = xe_map_rd(xe, &remote->vmap, 0, u64);
@@ -278,7 +278,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	kunit_info(test, "Clearing small buffer object\n");
 	xe_map_memset(xe, &tiny->vmap, 0, 0x22, tiny->size);
 	expected = 0;
-	fence = xe_migrate_clear(m, tiny, tiny->ttm.resource);
+	fence = xe_migrate_clear(m, tiny, tiny->ttm.resource, true, true);
 	if (sanity_fence_failed(xe, fence, "Clearing small bo", test))
 		goto out;
 
@@ -299,7 +299,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	kunit_info(test, "Clearing big buffer object\n");
 	xe_map_memset(xe, &big->vmap, 0, 0x11, big->size);
 	expected = 0;
-	fence = xe_migrate_clear(m, big, big->ttm.resource);
+	fence = xe_migrate_clear(m, big, big->ttm.resource, true, true);
 	if (sanity_fence_failed(xe, fence, "Clearing big bo", test))
 		goto out;
 
@@ -595,7 +595,7 @@ static void test_clear(struct xe_device *xe, struct xe_tile *tile,
 
 	kunit_info(test, "Clear vram buffer object\n");
 	expected = 0x0000000000000000;
-	fence = xe_migrate_clear(tile->migrate, vram_bo, vram_bo->ttm.resource);
+	fence = xe_migrate_clear(tile->migrate, vram_bo, vram_bo->ttm.resource, true, true);
 	if (sanity_fence_failed(xe, fence, "Clear vram_bo", test))
 		return;
 	dma_fence_put(fence);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 31192d983d9e..2a298f5e3e6e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -793,8 +793,14 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 			}
 		}
 	} else {
-		if (move_lacks_source)
-			fence = xe_migrate_clear(migrate, bo, new_mem);
+		if (move_lacks_source) {
+			bool clear_ccs = mem_type_is_vram(new_mem->mem_type) ||
+					 handle_system_ccs;
+			bool clear_bo_data = mem_type_is_vram(new_mem->mem_type);
+
+			fence = xe_migrate_clear(migrate, bo, new_mem,
+						 clear_bo_data, clear_ccs);
+		}
 		else
 			fence = xe_migrate_copy(migrate, bo, bo, old_mem,
 						new_mem, handle_system_ccs);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 2cb10437f289..b30ed7a3abfc 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1017,9 +1017,12 @@ static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
  * @m: The migration context.
  * @bo: The buffer object @dst is currently bound to.
  * @dst: The dst TTM resource to be cleared.
+ * @clear_bo_data: clear bo data
+ * @clear_ccs: clear ccs metadata
  *
- * Clear the contents of @dst to zero. On flat CCS devices,
- * the CCS metadata is cleared to zero as well on VRAM destinations.
+ * Clear the contents of @dst to zero when @clear_bo_data is set.
+ * On flat CCS devices, the CCS metadata is cleared to zero with @clear_ccs.
+ * Set both, @clear_bo_data and  @clear_ccs to clear bo as well as CCS metadata
  * TODO: Eliminate the @bo argument.
  *
  * Return: Pointer to a dma_fence representing the last clear batch, or
@@ -1028,18 +1031,22 @@ static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
  */
 struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 				   struct xe_bo *bo,
-				   struct ttm_resource *dst)
+				   struct ttm_resource *dst,
+				   bool clear_bo_data,
+				   bool clear_ccs)
 {
 	bool clear_vram = mem_type_is_vram(dst->mem_type);
 	struct xe_gt *gt = m->tile->primary_gt;
 	struct xe_device *xe = gt_to_xe(gt);
-	bool clear_system_ccs = (xe_bo_needs_ccs_pages(bo) && !IS_DGFX(xe)) ? true : false;
 	struct dma_fence *fence = NULL;
 	u64 size = bo->size;
 	struct xe_res_cursor src_it;
 	struct ttm_resource *src = dst;
 	int err;
 
+	if (WARN_ON(!clear_bo_data && !clear_ccs))
+		return NULL;
+
 	if (!clear_vram)
 		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
 	else
@@ -1063,7 +1070,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		batch_size = 2 +
 			pte_update_size(m, clear_vram, false, src, &src_it,
 					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
-					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
+					clear_bo_data ? emit_clear_cmd_len(gt) : 0, 0,
 					avail_pts);
 
 		if (xe_migrate_needs_ccs_emit(xe))
@@ -1084,13 +1091,13 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it))
 			xe_res_next(&src_it, clear_L0);
 		else
-			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_system_ccs,
+			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_ccs,
 				 &src_it, clear_L0, dst);
 
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 		update_idx = bb->len;
 
-		if (!clear_system_ccs)
+		if (clear_bo_data)
 			emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, clear_vram);
 
 		if (xe_migrate_needs_ccs_emit(xe)) {
@@ -1149,7 +1156,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		return ERR_PTR(err);
 	}
 
-	if (clear_system_ccs)
+	if (clear_ccs)
 		bo->ccs_cleared = true;
 
 	return fence;
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 453e0ecf5034..45f6c180148f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -104,7 +104,9 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 				   struct xe_bo *bo,
-				   struct ttm_resource *dst);
+				   struct ttm_resource *dst,
+				   bool clear_bo_data,
+				   bool clear_ccs);
 
 struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
 
-- 
2.34.1

