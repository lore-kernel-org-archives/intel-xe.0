Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17091C3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 05:22:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E11B10E924;
	Wed, 17 Jul 2024 05:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PkgY8Sdm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0ED10E924
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 05:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721193719; x=1752729719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aUMU9Drah4a52saBfEfkr6aXzGUmdYmWtA8roGZtDYw=;
 b=PkgY8Sdm0F2ARX3vmiSL62KKE06GTG48HC7f0fNUh0HlcM1U4pi4SjAP
 oD5y8sRHECxzph3HRigqHUOos3p3s50awUS3cX+riY34GgSabkhtztalm
 CheSP0zPWcCLb4yi1la0E5WLtzd6Pl1QeeYYlqnuwaYxNAnCt8ZN6dVgS
 59qUoMARdr3kLObJb49wp7rwz8jjNICJ6RStENAFuPXlRnKsF/P2tswNx
 cclT7ypfdsPef6Rif1jXddK25QGapdnyMDmbqNv13KfdRsod3Ehku91GE
 7b75MTAFEl7wnEOVBizClC0m3Asr85TWfFxdzwoYnsHxQeWB+pJ0hs7xr A==;
X-CSE-ConnectionGUID: hMTnE8e4RjqTIbKrsj+lVg==
X-CSE-MsgGUID: wapv6n7iRQaluLQjk2i+sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="29281200"
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; d="scan'208";a="29281200"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 22:21:59 -0700
X-CSE-ConnectionGUID: EwEFTOuaRoq/W8Ca4LITPA==
X-CSE-MsgGUID: 2u4qUzO+RA2OXyj0UxqnHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; d="scan'208";a="55124959"
Received: from dut1107bmgfrd.igk.intel.com ([10.211.177.88])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 22:21:56 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com, matthew.brost@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v6 8/8] drm/xe/migrate: Parameterize ccs and bo data clear in
 xe_migrate_clear()
Date: Wed, 17 Jul 2024 05:21:33 +0000
Message-Id: <2d4fb2f3bbbd38180b878f00775c9df5a5017b2a.1721193361.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721193361.git.akshata.jahagirdar@intel.com>
References: <cover.1721193361.git.akshata.jahagirdar@intel.com>
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

v2: Moved 2 bool arguments to a flag argument

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c      |  3 ++-
 drivers/gpu/drm/xe/tests/xe_migrate.c |  8 +++----
 drivers/gpu/drm/xe/xe_bo.c            | 10 +++++++--
 drivers/gpu/drm/xe/xe_migrate.c       | 32 ++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_migrate.h       |  3 ++-
 5 files changed, 37 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index e2e0ea24757a..c6db62a07276 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -35,7 +35,8 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
 
 	/* Optionally clear bo *and* CCS data in VRAM. */
 	if (clear) {
-		fence = xe_migrate_clear(tile->migrate, bo, bo->ttm.resource);
+		fence = xe_migrate_clear(tile->migrate, bo, bo->ttm.resource,
+					 BIT(2) | BIT(3));
 		if (IS_ERR(fence)) {
 			KUNIT_FAIL(test, "Failed to submit bo clear.\n");
 			return PTR_ERR(fence);
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 4929af88e75c..ac52bc4d2c51 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -104,7 +104,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 	}
 
 	xe_map_memset(xe, &remote->vmap, 0, 0xd0, remote->size);
-	fence = xe_migrate_clear(m, remote, remote->ttm.resource);
+	fence = xe_migrate_clear(m, remote, remote->ttm.resource, BIT(2) | BIT(3));
 	if (!sanity_fence_failed(xe, fence, big ? "Clearing remote big bo" :
 				 "Clearing remote small bo", test)) {
 		retval = xe_map_rd(xe, &remote->vmap, 0, u64);
@@ -278,7 +278,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	kunit_info(test, "Clearing small buffer object\n");
 	xe_map_memset(xe, &tiny->vmap, 0, 0x22, tiny->size);
 	expected = 0;
-	fence = xe_migrate_clear(m, tiny, tiny->ttm.resource);
+	fence = xe_migrate_clear(m, tiny, tiny->ttm.resource, BIT(2) | BIT(3));
 	if (sanity_fence_failed(xe, fence, "Clearing small bo", test))
 		goto out;
 
@@ -299,7 +299,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	kunit_info(test, "Clearing big buffer object\n");
 	xe_map_memset(xe, &big->vmap, 0, 0x11, big->size);
 	expected = 0;
-	fence = xe_migrate_clear(m, big, big->ttm.resource);
+	fence = xe_migrate_clear(m, big, big->ttm.resource, BIT(2) | BIT(3));
 	if (sanity_fence_failed(xe, fence, "Clearing big bo", test))
 		goto out;
 
@@ -598,7 +598,7 @@ static void test_clear(struct xe_device *xe, struct xe_tile *tile,
 
 	kunit_info(test, "Clear vram buffer object\n");
 	expected = 0x0000000000000000;
-	fence = xe_migrate_clear(tile->migrate, vram_bo, vram_bo->ttm.resource);
+	fence = xe_migrate_clear(tile->migrate, vram_bo, vram_bo->ttm.resource, BIT(2) | BIT(3));
 	if (sanity_fence_failed(xe, fence, "Clear vram_bo", test))
 		return;
 	dma_fence_put(fence);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 31192d983d9e..22b16a0006c5 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -793,8 +793,14 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 			}
 		}
 	} else {
-		if (move_lacks_source)
-			fence = xe_migrate_clear(migrate, bo, new_mem);
+		if (move_lacks_source) {
+			u32 clear_flags = mem_type_is_vram(new_mem->mem_type) ?
+						BIT(2) : 0;
+			clear_flags |= mem_type_is_vram(new_mem->mem_type) || handle_system_ccs ?
+						BIT(3) : 0;
+			fence = xe_migrate_clear(migrate, bo, new_mem,
+						 clear_flags);
+		}
 		else
 			fence = xe_migrate_copy(migrate, bo, bo, old_mem,
 						new_mem, handle_system_ccs);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index efd64af4f8cd..da06b434b9eb 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -518,15 +518,15 @@ static bool xe_migrate_allow_identity(u64 size, const struct xe_res_cursor *cur)
 #define PTE_UPDATE_FLAG_IS_COMP_PTE	BIT(1)
 
 static u32 pte_update_size(struct xe_migrate *m,
-			   u32 flags,
+			   u32 pte_flags,
 			   struct ttm_resource *res,
 			   struct xe_res_cursor *cur,
 			   u64 *L0, u64 *L0_ofs, u32 *L0_pt,
 			   u32 cmd_size, u32 pt_ofs, u32 avail_pts)
 {
 	u32 cmds = 0;
-	bool is_vram = PTE_UPDATE_FLAG_IS_VRAM & flags;
-	bool is_comp_pte = PTE_UPDATE_FLAG_IS_COMP_PTE & flags;
+	bool is_vram = PTE_UPDATE_FLAG_IS_VRAM & pte_flags;
+	bool is_comp_pte = PTE_UPDATE_FLAG_IS_COMP_PTE & pte_flags;
 
 	*L0_pt = pt_ofs;
 	if (is_vram && xe_migrate_allow_identity(*L0, cur)) {
@@ -1032,14 +1032,19 @@ static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 				     is_vram);
 }
 
+#define CLEAR_BO_DATA_FLAG	BIT(2)
+#define CLEAR_CCS_DATA_FLAG	BIT(3)
+
 /**
  * xe_migrate_clear() - Copy content of TTM resources.
  * @m: The migration context.
  * @bo: The buffer object @dst is currently bound to.
  * @dst: The dst TTM resource to be cleared.
+ * @flags: flags to clear_bo_data and ccs metadata
  *
- * Clear the contents of @dst to zero. On flat CCS devices,
- * the CCS metadata is cleared to zero as well on VRAM destinations.
+ * Clear the contents of @dst to zero when clear_bo_data_flag is set.
+ * On flat CCS devices, the CCS metadata is cleared to zero with clear_ccs_flag.
+ * Set both, clear_bo_data_flag and clear_ccs_flag to clear bo as well as CCS metadata
  * TODO: Eliminate the @bo argument.
  *
  * Return: Pointer to a dma_fence representing the last clear batch, or
@@ -1048,18 +1053,23 @@ static void emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
  */
 struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 				   struct xe_bo *bo,
-				   struct ttm_resource *dst)
+				   struct ttm_resource *dst,
+				   u32 clear_flags)
 {
 	bool clear_vram = mem_type_is_vram(dst->mem_type);
+	bool clear_bo_data = CLEAR_BO_DATA_FLAG & clear_flags;
+	bool clear_ccs = CLEAR_CCS_DATA_FLAG & clear_flags;
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
@@ -1085,7 +1095,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		batch_size = 2 +
 			pte_update_size(m, pte_flags, src, &src_it,
 					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
-					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
+					clear_bo_data ? emit_clear_cmd_len(gt) : 0, 0,
 					avail_pts);
 
 		if (xe_migrate_needs_ccs_emit(xe))
@@ -1107,13 +1117,13 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
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
@@ -1172,7 +1182,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		return ERR_PTR(err);
 	}
 
-	if (clear_system_ccs)
+	if (clear_ccs)
 		bo->ccs_cleared = true;
 
 	return fence;
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 453e0ecf5034..0d19bfe02a23 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -104,7 +104,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 				   struct xe_bo *bo,
-				   struct ttm_resource *dst);
+				   struct ttm_resource *dst,
+				   u32 clear_flags);
 
 struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
 
-- 
2.34.1

