Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDAEC001DC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 14:48:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE5C10E8B2;
	Fri, 14 Jul 2023 14:48:36 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E3910E8B0
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 14:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689346113; x=1720882113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tJA/4enTuGI+nVEHB9Bnx+GEU8K58EY9c1/UfsRnrJg=;
 b=cBUH9vm/y95zli4opctT7CEmAHvkggwIeclVWI+i9wsNmkPO+ylf0C4F
 gcMcaTTY7wGLDTXcR1hmxExF9a23E453F/EXOHMomfLOJNsa0C21s+/FL
 BcBYhTj+c/P9QL+sTpCZ+vTPBo06HapIo/sAZbyyjLRHF4+D8LxAjlIi/
 XpOJUBAXJfoNDEn+hYKa6PJI1EAa1V/mCmvHG0i3QNKuhT1xYkPB7YVjO
 sinhEZR18pzGF2wTTYmg6XSkm1gWn4GFNPDjuWpf/e5zSdn8vqX0Z3PHd
 5yfV86YsxBy5wQuOrxsDV+/fX1vLOITD75xZmFWqt0uDORc/hl6NpeOgk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="345086766"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="345086766"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 07:48:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="752064291"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; d="scan'208";a="752064291"
Received: from joejardi-mobl3.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.242])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 07:48:31 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 14 Jul 2023 15:48:16 +0100
Message-ID: <20230714144814.574873-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714144814.574873-5-matthew.auld@intel.com>
References: <20230714144814.574873-5-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v7 1/3] drm/xe/bo: support tiered vram allocation
 for small-bar
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add the new flag XE_BO_NEEDS_CPU_ACCESS, to force allocating in the
mappable part of vram. If no flag is specified we do a topdown
allocation, to limit the chances of stealing the precious mappable part,
if we don't need it. If this is a full-bar system, then this all gets
nooped.

For kernel users, it looks like xe_bo_create_pin_map() is the central
place which users should call if they want CPU access to the object, so
add the flag there.

We still need to plumb this through for userspace allocations. Also it
looks like page-tables are using pin_map(), which is less than ideal. If
we can already use the GPU to do page-table management, then maybe we
should just force that for small-bar.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c |  3 +-
 drivers/gpu/drm/xe/xe_bo.c            | 48 ++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_bo.h            |  1 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c  |  4 +++
 4 files changed, 40 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index aedfb3dd559e..2bea1ec34ffd 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -111,7 +111,8 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 	struct xe_bo *sysmem = xe_bo_create_locked(xe, m->tile, NULL,
 						   bo->size,
 						   ttm_bo_type_kernel,
-						   XE_BO_CREATE_SYSTEM_BIT);
+						   XE_BO_CREATE_SYSTEM_BIT |
+						   XE_BO_NEEDS_CPU_ACCESS);
 	if (IS_ERR(sysmem)) {
 		KUNIT_FAIL(test, "Failed to allocate sysmem bo for %s: %li\n",
 			   str, PTR_ERR(sysmem));
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6353afa8d846..175572163875 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -124,19 +124,28 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
 {
 	struct xe_tile *tile = mem_type_to_tile(xe, mem_type);
+	struct ttm_place place = { .mem_type = mem_type };
+	u64 io_size = tile->mem.vram.io_size;
 
 	XE_BUG_ON(!tile->mem.vram.usable_size);
 
-	places[*c] = (struct ttm_place) {
-		.mem_type = mem_type,
-		/*
-		 * For eviction / restore on suspend / resume objects
-		 * pinned in VRAM must be contiguous
-		 */
-		.flags = bo_flags & (XE_BO_CREATE_PINNED_BIT |
-				     XE_BO_CREATE_GGTT_BIT) ?
-			TTM_PL_FLAG_CONTIGUOUS : 0,
-	};
+	/*
+	 * For eviction / restore on suspend / resume objects
+	 * pinned in VRAM must be contiguous
+	 */
+	if (bo_flags & (XE_BO_CREATE_PINNED_BIT |
+			XE_BO_CREATE_GGTT_BIT))
+		place.flags |= TTM_PL_FLAG_CONTIGUOUS;
+
+	if (io_size < tile->mem.vram.usable_size) {
+		if (bo_flags & XE_BO_NEEDS_CPU_ACCESS) {
+			place.fpfn = 0;
+			place.lpfn = io_size >> PAGE_SHIFT;
+		} else {
+			place.flags |= TTM_PL_FLAG_TOPDOWN;
+		}
+	}
+	places[*c] = place;
 	*c += 1;
 
 	if (bo->props.preferred_mem_type == XE_BO_PROPS_INVALID)
@@ -377,15 +386,20 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 				 struct ttm_resource *mem)
 {
 	struct xe_device *xe = ttm_to_xe_device(bdev);
-	struct xe_tile *tile;
 
 	switch (mem->mem_type) {
 	case XE_PL_SYSTEM:
 	case XE_PL_TT:
 		return 0;
 	case XE_PL_VRAM0:
-	case XE_PL_VRAM1:
-		tile = mem_type_to_tile(xe, mem->mem_type);
+	case XE_PL_VRAM1: {
+		struct xe_tile *tile = mem_type_to_tile(xe, mem->mem_type);
+		struct xe_ttm_vram_mgr_resource *vres =
+			to_xe_ttm_vram_mgr_resource(mem);
+
+		if (vres->used_visible_size < mem->size)
+			return -EINVAL;
+
 		mem->bus.offset = mem->start << PAGE_SHIFT;
 
 		if (tile->mem.vram.mapping &&
@@ -400,7 +414,7 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 		mem->bus.caching = ttm_write_combined;
 #endif
 		return 0;
-	case XE_PL_STOLEN:
+	} case XE_PL_STOLEN:
 		return xe_ttm_stolen_io_mem_reserve(xe, mem);
 	default:
 		return -EINVAL;
@@ -1355,7 +1369,8 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile
 	    xe_ttm_stolen_cpu_access_needs_ggtt(xe))
 		flags |= XE_BO_CREATE_GGTT_BIT;
 
-	bo = xe_bo_create_locked_range(xe, tile, vm, size, start, end, type, flags);
+	bo = xe_bo_create_locked_range(xe, tile, vm, size, start, end, type,
+				       flags | XE_BO_NEEDS_CPU_ACCESS);
 	if (IS_ERR(bo))
 		return bo;
 
@@ -1664,6 +1679,9 @@ int xe_bo_vmap(struct xe_bo *bo)
 
 	xe_bo_assert_held(bo);
 
+	if (!(bo->flags & XE_BO_NEEDS_CPU_ACCESS))
+		return -EINVAL;
+
 	if (!iosys_map_is_null(&bo->vmap))
 		return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 08ca1d06bf77..f9c155443de6 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -31,6 +31,7 @@
 #define XE_BO_DEFER_BACKING		BIT(9)
 #define XE_BO_SCANOUT_BIT		BIT(10)
 #define XE_BO_FIXED_PLACEMENT_BIT	BIT(11)
+#define XE_BO_NEEDS_CPU_ACCESS		BIT(12)
 /* this one is trigger internally only */
 #define XE_BO_INTERNAL_TEST		BIT(30)
 #define XE_BO_INTERNAL_64K		BIT(31)
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index a10fd0366da3..27e0d40daca8 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -373,11 +373,15 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 			      struct sg_table **sgt)
 {
 	struct xe_tile *tile = &xe->tiles[res->mem_type - XE_PL_VRAM0];
+	struct xe_ttm_vram_mgr_resource *vres = to_xe_ttm_vram_mgr_resource(res);
 	struct xe_res_cursor cursor;
 	struct scatterlist *sg;
 	int num_entries = 0;
 	int i, r;
 
+	if (vres->used_visible_size < res->size)
+		return -EOPNOTSUPP;
+
 	*sgt = kmalloc(sizeof(**sgt), GFP_KERNEL);
 	if (!*sgt)
 		return -ENOMEM;
-- 
2.41.0

