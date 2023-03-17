Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA15C74A5B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 15:36:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B7C10E118;
	Fri, 17 Mar 2023 15:36:11 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F3E10E118
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 15:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679067370; x=1710603370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NyammDUnyrt0uUS9HmbVoKneSt+1wbM1hFzmtAqqXV8=;
 b=a8iLCPtw1d2l2gZChnXGYWuYKsgEsoYsxzD44YhShl6/sAGpBUTRcfgt
 mS2jJHJ7+nkULGVtoHGLtQ27yw8er1/uw7d0gXsULirbYK4HHwcD1yvYV
 jdoAZ0RXFP0p0dF9fr3DsAHuIWrcKOz+qfSEEdNr9TrZycO403x43PKJr
 FRasuRoJrNdUtV75Nwaz0gAbZVENqf4TbSB/XHXOioZPRmGACs7iwtLl3
 chLrvSzQtD6qizhROk1NVdcYVXecgvpvLtciEULPWS9eMfBF7/ij0tIMk
 dgcr69hmu0WzvuT7qbaEQokpGdJC+UqsNzduzYu6b0RrYbn9uZ9/nvObA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="424557347"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="424557347"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 08:35:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="926187017"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="926187017"
Received: from ambatirx-mobl2.gar.corp.intel.com (HELO
 bvivekan-mobl.fritz.box) ([10.215.117.35])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 08:35:50 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 17 Mar 2023 21:05:30 +0530
Message-Id: <20230317153531.1011865-2-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230317153531.1011865-1-balasubramani.vivekanandan@intel.com>
References: <20230317153531.1011865-1-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 1/2] drm/xe: Stop accepting value in
 xe_migrate_clear
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Although xe_migrate_clear() has a value agrument, currently the driver
is only passing 0 at all the places this function is invoked with the
exception the kunit tests are using the parameter to validate this
function with different values.
xe_migrate_clear() is failing on platforms with link copy engines
because xe_migrate_clear() via emit_clear() is using the blitter
instruction XY_FAST_COLOR_BLT to clear the memory. But this instruction
is not supported by link copy engine.
So the solution is to use the alternate instruction MEM_SET when
platform contains link copy engine. But MEM_SET instruction accepts only
8-bit value for setting whereas the value agrument of xe_migrate_clear()
is 32-bit.
So instead of spreading this limitation around all invocations of
xe_migrate_clear() and causing more confusion, it was decided to not
accept any value itself as driver does not really need this currently.

All the kunit tests are adapted as per the new function prototype.

This will be followed by a patch to add support for link copy engines.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c      |  2 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c | 16 ++++++++--------
 drivers/gpu/drm/xe/xe_bo.c            |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c       | 14 ++++++--------
 drivers/gpu/drm/xe/xe_migrate.h       |  3 +--
 5 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index f03fb907b59a..3c60cbdf516c 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -32,7 +32,7 @@ static int ccs_test_migrate(struct xe_gt *gt, struct xe_bo *bo,
 
 	/* Optionally clear bo *and* CCS data in VRAM. */
 	if (clear) {
-		fence = xe_migrate_clear(gt->migrate, bo, bo->ttm.resource, 0);
+		fence = xe_migrate_clear(gt->migrate, bo, bo->ttm.resource);
 		if (IS_ERR(fence)) {
 			KUNIT_FAIL(test, "Failed to submit bo clear.\n");
 			return PTR_ERR(fence);
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index ac659b94e7f5..2d3d9c44ef4e 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -86,7 +86,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 		      struct kunit *test)
 {
 	struct xe_device *xe = gt_to_xe(m->gt);
-	u64 retval, expected = 0xc0c0c0c0c0c0c0c0ULL;
+	u64 retval, expected = 0;
 	bool big = bo->size >= SZ_2M;
 	struct dma_fence *fence;
 	const char *str = big ? "Copying big bo" : "Copying small bo";
@@ -117,7 +117,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 	}
 
 	xe_map_memset(xe, &sysmem->vmap, 0, 0xd0, sysmem->size);
-	fence = xe_migrate_clear(m, sysmem, sysmem->ttm.resource, 0xc0c0c0c0);
+	fence = xe_migrate_clear(m, sysmem, sysmem->ttm.resource);
 	if (!sanity_fence_failed(xe, fence, big ? "Clearing sysmem big bo" :
 				 "Clearing sysmem small bo", test)) {
 		retval = xe_map_rd(xe, &sysmem->vmap, 0, u64);
@@ -287,10 +287,10 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	bb->len = 0;
 	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 	xe_map_wr(xe, &pt->vmap, 0, u32, 0xdeaddead);
-	expected = 0x12345678U;
+	expected = 0;
 
 	emit_clear(m->gt, bb, xe_migrate_vm_addr(NUM_KERNEL_PDE - 1, 0), 4, 4,
-		   expected, IS_DGFX(xe));
+		   IS_DGFX(xe));
 	run_sanity_job(m, xe, bb, 1, "Writing to our newly mapped pagetable",
 		       test);
 
@@ -302,8 +302,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	/* Clear a small bo */
 	kunit_info(test, "Clearing small buffer object\n");
 	xe_map_memset(xe, &tiny->vmap, 0, 0x22, tiny->size);
-	expected = 0x224488ff;
-	fence = xe_migrate_clear(m, tiny, tiny->ttm.resource, expected);
+	expected = 0;
+	fence = xe_migrate_clear(m, tiny, tiny->ttm.resource);
 	if (sanity_fence_failed(xe, fence, "Clearing small bo", test))
 		goto out;
 
@@ -321,8 +321,8 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	/* Clear a big bo with a fixed value */
 	kunit_info(test, "Clearing big buffer object\n");
 	xe_map_memset(xe, &big->vmap, 0, 0x11, big->size);
-	expected = 0x11223344U;
-	fence = xe_migrate_clear(m, big, big->ttm.resource, expected);
+	expected = 0;
+	fence = xe_migrate_clear(m, big, big->ttm.resource);
 	if (sanity_fence_failed(xe, fence, "Clearing big bo", test))
 		goto out;
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 73a7f2cd4ad8..557d6b89a6ba 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -670,7 +670,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		}
 	} else {
 		if (move_lacks_source)
-			fence = xe_migrate_clear(gt->migrate, bo, new_mem, 0);
+			fence = xe_migrate_clear(gt->migrate, bo, new_mem);
 		else
 			fence = xe_migrate_copy(gt->migrate, bo, old_mem, new_mem);
 		if (IS_ERR(fence)) {
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index c0523d8fe944..fdcbab31a418 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -747,7 +747,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 }
 
 static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
-		      u32 size, u32 pitch, u32 value, bool is_vram)
+		      u32 size, u32 pitch, bool is_vram)
 {
 	u32 *cs = bb->cs + bb->len;
 	u32 len = XY_FAST_COLOR_BLT_DW;
@@ -765,7 +765,7 @@ static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 	*cs++ = lower_32_bits(src_ofs);
 	*cs++ = upper_32_bits(src_ofs);
 	*cs++ = (is_vram ? 0x0 : 0x1) <<  XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT;
-	*cs++ = value;
+	*cs++ = 0;
 	*cs++ = 0;
 	*cs++ = 0;
 	*cs++ = 0;
@@ -789,10 +789,9 @@ static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
  * @m: The migration context.
  * @bo: The buffer object @dst is currently bound to.
  * @dst: The dst TTM resource to be cleared.
- * @value: Clear value.
  *
- * Clear the contents of @dst. On flat CCS devices,
- * the CCS metadata is cleared to zero as well on VRAM destionations.
+ * Clear the contents of @dst to zero. On flat CCS devices,
+ * the CCS metadata is cleared to zero as well on VRAM destinations.
  * TODO: Eliminate the @bo argument.
  *
  * Return: Pointer to a dma_fence representing the last clear batch, or
@@ -801,8 +800,7 @@ static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
  */
 struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 				   struct xe_bo *bo,
-				   struct ttm_resource *dst,
-				   u32 value)
+				   struct ttm_resource *dst)
 {
 	bool clear_vram = mem_type_is_vram(dst->mem_type);
 	struct xe_gt *gt = m->gt;
@@ -867,7 +865,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		update_idx = bb->len;
 
 		emit_clear(gt, bb, clear_L0_ofs, clear_L0, GEN8_PAGE_SIZE,
-			   value, clear_vram);
+			   clear_vram);
 		if (xe_device_has_flat_ccs(xe) && clear_vram) {
 			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
 				      m->cleared_vram_ofs, false, clear_L0);
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index a569851db6f7..1ff6e0a90de5 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -79,8 +79,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 				   struct xe_bo *bo,
-				   struct ttm_resource *dst,
-				   u32 value);
+				   struct ttm_resource *dst);
 
 struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
 
-- 
2.25.1

