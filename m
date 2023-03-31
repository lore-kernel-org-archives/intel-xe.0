Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E584FC77B60
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 08:47:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C9E10F13E;
	Fri, 31 Mar 2023 08:47:02 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2273110F141
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 08:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680252414; x=1711788414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KSGz+CYsw1QYozwkUGY7ZO3ej75O8IRT1zZ9R2mj0SM=;
 b=dQZMKC/7cX2OjSJwxxx28EeRfi0skw2TNOn1eZDc8Iqb05LlCyrgSH3V
 hh1iaxTj2/s2bAtiGS1FK+L27iW0XPnFb2nwES86WPZKINWJ5Adn0PWGd
 WYaZYEVyIjmD1Nau3afa9LjyFLaOhaFgQrz9wQPGDxz6Jv4kYDyrgK8Mq
 VwBX8P3imf3GqZVBs0DybRn0SrU++fgHswPsHfUUW/HwWz0ZDoJrYKz2h
 1x9cFsu7QbinoaVn8LGqH7GneKa7eEuhXnUqv7cw/kZ4RfUdDoAk0J7d4
 zp6kQmdBN5Hrb7UEg4M4SrUfeHYs45NDmCPmIbMRQr7BxNqOx6+zkRIJc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="325364356"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="325364356"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 01:46:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="678544914"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="678544914"
Received: from kuhnbrex-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.81])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 01:46:51 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 09:46:26 +0100
Message-Id: <20230331084628.421814-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331084628.421814-1-matthew.auld@intel.com>
References: <20230331084628.421814-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 3/5] drm/xe/bo: support tiered vram allocation
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
 drivers/gpu/drm/xe/xe_bo.c            | 48 +++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_bo.h            |  1 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c  |  4 +++
 4 files changed, 41 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 17829f878757..de101c3a6406 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -108,7 +108,8 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 	struct xe_bo *sysmem = xe_bo_create_locked(xe, m->gt, NULL,
 						   bo->size,
 						   ttm_bo_type_kernel,
-						   XE_BO_CREATE_SYSTEM_BIT);
+						   XE_BO_CREATE_SYSTEM_BIT |
+						   XE_BO_NEEDS_CPU_ACCESS);
 	if (IS_ERR(sysmem)) {
 		KUNIT_FAIL(test, "Failed to allocate sysmem bo for %s: %li\n",
 			   str, PTR_ERR(sysmem));
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index e4d079b61d52..2f2b6a89851e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -109,20 +109,29 @@ static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
 static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
 {
+	struct ttm_place place = { .mem_type = mem_type };
 	struct xe_gt *gt = mem_type_to_gt(xe, mem_type);
+	u64 io_size = gt->mem.vram.io_size;
 
 	XE_BUG_ON(!gt->mem.vram.size);
 
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
+	if (io_size < gt->mem.vram.size) {
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
@@ -356,15 +365,22 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 				 struct ttm_resource *mem)
 {
 	struct xe_device *xe = ttm_to_xe_device(bdev);
-	struct xe_gt *gt;
 
 	switch (mem->mem_type) {
 	case XE_PL_SYSTEM:
 	case XE_PL_TT:
 		return 0;
 	case XE_PL_VRAM0:
-	case XE_PL_VRAM1:
+	case XE_PL_VRAM1: {
+		struct xe_ttm_vram_mgr_resource *vres =
+			to_xe_ttm_vram_mgr_resource(mem);
+		struct xe_gt *gt;
+
+		if (vres->used_visible_size < mem->size)
+			return -EINVAL;
+
 		gt = mem_type_to_gt(xe, mem->mem_type);
+
 		mem->bus.offset = mem->start << PAGE_SHIFT;
 
 		if (gt->mem.vram.mapping &&
@@ -379,7 +395,7 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 		mem->bus.caching = ttm_write_combined;
 #endif
 		return 0;
-	case XE_PL_STOLEN:
+	} case XE_PL_STOLEN:
 		return xe_ttm_stolen_io_mem_reserve(xe, mem);
 	default:
 		return -EINVAL;
@@ -1157,7 +1173,8 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_gt *gt,
 	    xe_ttm_stolen_cpu_access_needs_ggtt(xe))
 		flags |= XE_BO_CREATE_GGTT_BIT;
 
-	bo = xe_bo_create_locked_range(xe, gt, vm, size, start, end, type, flags);
+	bo = xe_bo_create_locked_range(xe, gt, vm, size, start, end, type,
+				       flags | XE_BO_NEEDS_CPU_ACCESS);
 	if (IS_ERR(bo))
 		return bo;
 
@@ -1455,6 +1472,9 @@ int xe_bo_vmap(struct xe_bo *bo)
 
 	xe_bo_assert_held(bo);
 
+	if (!(bo->flags & XE_BO_NEEDS_CPU_ACCESS))
+		return -EINVAL;
+
 	if (!iosys_map_is_null(&bo->vmap))
 		return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 9b26049521de..988a4929d49b 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -30,6 +30,7 @@
 #define XE_BO_DEFER_BACKING		BIT(8)
 #define XE_BO_SCANOUT_BIT		BIT(9)
 #define XE_BO_FIXED_PLACEMENT_BIT	BIT(10)
+#define XE_BO_NEEDS_CPU_ACCESS		BIT(11)
 /* this one is trigger internally only */
 #define XE_BO_INTERNAL_TEST		BIT(30)
 #define XE_BO_INTERNAL_64K		BIT(31)
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 73836b9b7fed..cf081e4aedf6 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -373,12 +373,16 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 			      enum dma_data_direction dir,
 			      struct sg_table **sgt)
 {
+	struct xe_ttm_vram_mgr_resource *vres = to_xe_ttm_vram_mgr_resource(res);
 	struct xe_gt *gt = xe_device_get_gt(xe, res->mem_type - XE_PL_VRAM0);
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
2.39.2

