Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B849C77B7E
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 06:27:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE26910EDC5;
	Thu, 25 May 2023 06:27:45 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C7510EDC5
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 06:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684996064; x=1716532064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QdU0+cjVjJrg2kwgZTZFMhcF6q4iysyGJTNpmMzNnG4=;
 b=OjaDPPzS2Lzjqh/6dknSx8TsBAsRhMId0w2iQS5XN64lFWl50YOzryNZ
 w251BjjsntjYCa5Kkd/vcE9zaB6Ckhf5HdFRGpnjJgMNU0AYh9mwkUFqd
 nwKLgqDCGnRwt6LTOHQB3Z7ZupDbpeIgq/L6lTGR2d1oirSnrn6t6v7BA
 AdsRd/w78htGqXtepGDFRsULpXPiBuKOPfHPH+ZZ90zyK5Hf6AdDyUx/L
 XKkDRqkYOLROnPI/9SSjQnm9Hr+lEIjMdoVByjLPSmKWRP8h7N/Lt+cY4
 ugMPqM0YX9k6QfOS4SeXvb97gVz0gJaOZW3vj60GBx5WsfFeRTLH35M+n Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="351308667"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="351308667"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 23:27:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="774541904"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="774541904"
Received: from lsilistr-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.226])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 23:27:43 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 08:27:24 +0200
Message-Id: <20230525062724.176084-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525062724.176084-1-thomas.hellstrom@linux.intel.com>
References: <20230525062724.176084-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Support copying of data between
 system memory bos
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

Modify the xe_migrate_copy() function somewhat to explicitly allow
copying of data between two buffer objects including system memory
buffer objects. Update the migrate test accordingly.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 16 +++++-------
 drivers/gpu/drm/xe/xe_bo.c            |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c       | 37 +++++++++++++++++----------
 drivers/gpu/drm/xe/xe_migrate.h       |  3 ++-
 4 files changed, 32 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index f8ee9b9fca99..4a3ca2960fd5 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -150,7 +150,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 	xe_map_memset(xe, &bo->vmap, 0, 0xd0, bo->size);
 
 	expected = 0xc0c0c0c0c0c0c0c0;
-	fence = xe_migrate_copy(m, sysmem, sysmem->ttm.resource,
+	fence = xe_migrate_copy(m, sysmem, bo, sysmem->ttm.resource,
 				bo->ttm.resource);
 	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo sysmem -> vram" :
 				 "Copying small bo sysmem -> vram", test)) {
@@ -167,7 +167,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 	xe_map_memset(xe, &sysmem->vmap, 0, 0xd0, sysmem->size);
 	xe_map_memset(xe, &bo->vmap, 0, 0xc0, bo->size);
 
-	fence = xe_migrate_copy(m, sysmem, bo->ttm.resource,
+	fence = xe_migrate_copy(m, bo, sysmem, bo->ttm.resource,
 				sysmem->ttm.resource);
 	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo vram -> sysmem" :
 				 "Copying small bo vram -> sysmem", test)) {
@@ -347,10 +347,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	retval = xe_map_rd(xe, &tiny->vmap, tiny->size - 4, u32);
 	check(retval, expected, "Command clear small last value", test);
 
-	if (IS_DGFX(xe)) {
-		kunit_info(test, "Copying small buffer object to system\n");
-		test_copy(m, tiny, test);
-	}
+	kunit_info(test, "Copying small buffer object to system\n");
+	test_copy(m, tiny, test);
 
 	/* Clear a big bo */
 	kunit_info(test, "Clearing big buffer object\n");
@@ -366,10 +364,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	retval = xe_map_rd(xe, &big->vmap, big->size - 4, u32);
 	check(retval, expected, "Command clear big last value", test);
 
-	if (IS_DGFX(xe)) {
-		kunit_info(test, "Copying big buffer object to system\n");
-		test_copy(m, big, test);
-	}
+	kunit_info(test, "Copying big buffer object to system\n");
+	test_copy(m, big, test);
 
 	kunit_info(test, "Testing page table update using CPU if GPU idle.\n");
 	test_pt_update(m, pt, test, false);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c82e995df779..d6d7823aab5a 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -677,7 +677,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		if (move_lacks_source)
 			fence = xe_migrate_clear(gt->migrate, bo, new_mem);
 		else
-			fence = xe_migrate_copy(gt->migrate, bo, old_mem, new_mem);
+			fence = xe_migrate_copy(gt->migrate, bo, bo, old_mem, new_mem);
 		if (IS_ERR(fence)) {
 			ret = PTR_ERR(fence);
 			xe_device_mem_access_put(xe);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index f40f47ccb76f..bcbb87a28eb6 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -582,30 +582,31 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 /**
  * xe_migrate_copy() - Copy content of TTM resources.
  * @m: The migration context.
- * @bo: The buffer object @src is currently bound to.
+ * @src_bo: The buffer object @src is currently bound to.
+ * @dst_bo: If copying between resources created for the same bo, set this to
+ * the same value as @src_bo. If copying between buffer objects, set it to
+ * the buffer object @dst is currently bound to.
  * @src: The source TTM resource.
  * @dst: The dst TTM resource.
  *
  * Copies the contents of @src to @dst: On flat CCS devices,
  * the CCS metadata is copied as well if needed, or if not present,
  * the CCS metadata of @dst is cleared for security reasons.
- * It's currently not possible to copy between two system resources,
- * since that would require two TTM page-vectors.
- * TODO: Eliminate the @bo argument and supply two TTM page-vectors.
  *
  * Return: Pointer to a dma_fence representing the last copy batch, or
  * an error pointer on failure. If there is a failure, any copy operation
  * started by the function call has been synced.
  */
 struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
-				  struct xe_bo *bo,
+				  struct xe_bo *src_bo,
+				  struct xe_bo *dst_bo,
 				  struct ttm_resource *src,
 				  struct ttm_resource *dst)
 {
 	struct xe_gt *gt = m->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	struct dma_fence *fence = NULL;
-	u64 size = bo->size;
+	u64 size = src_bo->size;
 	struct xe_res_cursor src_it, dst_it, ccs_it;
 	u64 src_L0_ofs, dst_L0_ofs;
 	u32 src_L0_pt, dst_L0_pt;
@@ -614,20 +615,25 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	int err;
 	bool src_is_vram = mem_type_is_vram(src->mem_type);
 	bool dst_is_vram = mem_type_is_vram(dst->mem_type);
-	bool copy_ccs = xe_device_has_flat_ccs(xe) && xe_bo_needs_ccs_pages(bo);
+	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
+		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
 	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
 
+	/* Copying CCS between two different BOs is not supported yet. */
+	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
+		return ERR_PTR(-EINVAL);
+
 	if (!src_is_vram)
-		xe_res_first_sg(xe_bo_get_sg(bo), 0, size, &src_it);
+		xe_res_first_sg(xe_bo_get_sg(src_bo), 0, size, &src_it);
 	else
 		xe_res_first(src, 0, size, &src_it);
 	if (!dst_is_vram)
-		xe_res_first_sg(xe_bo_get_sg(bo), 0, size, &dst_it);
+		xe_res_first_sg(xe_bo_get_sg(dst_bo), 0, size, &dst_it);
 	else
 		xe_res_first(dst, 0, size, &dst_it);
 
 	if (copy_system_ccs)
-		xe_res_first_sg(xe_bo_get_sg(bo), xe_bo_ccs_pages_start(bo),
+		xe_res_first_sg(xe_bo_get_sg(src_bo), xe_bo_ccs_pages_start(src_bo),
 				PAGE_ALIGN(xe_device_ccs_bytes(xe, size)),
 				&ccs_it);
 
@@ -681,18 +687,18 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		if (!src_is_vram)
 			emit_pte(m, bb, src_L0_pt, src_is_vram, &src_it, src_L0,
-				 bo);
+				 src_bo);
 		else
 			xe_res_next(&src_it, src_L0);
 
 		if (!dst_is_vram)
 			emit_pte(m, bb, dst_L0_pt, dst_is_vram, &dst_it, src_L0,
-				 bo);
+				 dst_bo);
 		else
 			xe_res_next(&dst_it, src_L0);
 
 		if (copy_system_ccs)
-			emit_pte(m, bb, ccs_pt, false, &ccs_it, ccs_size, bo);
+			emit_pte(m, bb, ccs_pt, false, &ccs_it, ccs_size, src_bo);
 
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 		update_idx = bb->len;
@@ -714,8 +720,11 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		xe_sched_job_add_migrate_flush(job, flush_flags);
 		if (!fence) {
-			err = job_add_deps(job, bo->ttm.base.resv,
+			err = job_add_deps(job, src_bo->ttm.base.resv,
 					   DMA_RESV_USAGE_BOOKKEEP);
+			if (!err && src_bo != dst_bo)
+				err = job_add_deps(job, dst_bo->ttm.base.resv,
+						   DMA_RESV_USAGE_BOOKKEEP);
 			if (err)
 				goto err_job;
 		}
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 1ff6e0a90de5..c283b626c21c 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -73,7 +73,8 @@ struct xe_migrate_pt_update {
 struct xe_migrate *xe_migrate_init(struct xe_gt *gt);
 
 struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
-				  struct xe_bo *bo,
+				  struct xe_bo *src_bo,
+				  struct xe_bo *dst_bo,
 				  struct ttm_resource *src,
 				  struct ttm_resource *dst);
 
-- 
2.39.2

