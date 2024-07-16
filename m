Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D9EC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 22:54:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C7110E911;
	Tue, 16 Jul 2024 22:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mxU0zX5i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D46310E8F8
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 22:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721170470; x=1752706470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iJZpN/YfmsL69kUFyN7R7H+5Nbeysrsrzg4S5qKXwaw=;
 b=mxU0zX5ifFanlBLdR729qz8JJP8BFX9qRZNZ+2VJXAR2+9MgKDsWF6n1
 o8Rb+85fkuLw4bDtObAodZW57gSE+pL477lFnTaVIMgL91VQYzkHyEB0T
 qFUb16K+uHd7qhlTjSHGDVB07jcY8Pv3Ifawk5rZm/gp6xGTSUorYhocX
 oBQrzxwEkGilp8JWKEBCbuN7Tri8ZzCL4Zy/GRN+y0r1KyjVzAg8MDf8e
 Cq3fdRO7FhgGya46imY7PbYMcSoCEiUtab/Equvp6oOoQ+q9fWzqGRdI6
 mX4QWBj6y1a/HGZ4S6nhazrrIJkfb9YPbOKRuUCV8O9zg8r6no7x7TR8V w==;
X-CSE-ConnectionGUID: VADIx9vqTx2x6KwNtgnNGQ==
X-CSE-MsgGUID: DYYvXv5lR3qnMxGdsKrguA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="22457162"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="22457162"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 15:54:30 -0700
X-CSE-ConnectionGUID: dm+77avITwm0/hAYaUSJAQ==
X-CSE-MsgGUID: O2ZQBIcITCqYhM/ExaVLLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="50765895"
Received: from unknown (HELO DUT1107BMGFRD.igk.intel.com) ([10.211.177.88])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 15:54:28 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v5 8/8] drm/xe/migrate: Parameterize ccs and bo data clear in
 xe_migrate_clear()
Date: Tue, 16 Jul 2024 22:54:09 +0000
Message-Id: <17bc0b9bf710c178e749029d5dfede725ec29b44.1721170212.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721170212.git.akshata.jahagirdar@intel.com>
References: <cover.1721170212.git.akshata.jahagirdar@intel.com>
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
index c20d747fa438..928653d09678 100644
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
index b28724caec10..0b5ae923c1de 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1024,9 +1024,12 @@ static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
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
@@ -1035,18 +1038,22 @@ static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
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
@@ -1070,7 +1077,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		batch_size = 2 +
 			pte_update_size(m, clear_vram, false, src, &src_it,
 					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
-					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
+					clear_bo_data ? emit_clear_cmd_len(gt) : 0, 0,
 					avail_pts);
 
 		if (xe_migrate_needs_ccs_emit(xe))
@@ -1092,13 +1099,13 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
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
@@ -1157,7 +1164,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
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

