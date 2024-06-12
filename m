Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7606C2BA16
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 02:16:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546C610E780;
	Wed, 12 Jun 2024 02:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hD/qlrOD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA8A10E775
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 02:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718158540; x=1749694540;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VeSn+0VTnM/OVg+Ii5E+ElU7tb+wPoIibDYDnKIK9gI=;
 b=hD/qlrODy+wvgQ/CMUnDEoAe8F+UGmROnQIfxn+3qkYGTVc5dva1MwHi
 2CVhPbexAuiBw7xqI7jM1vZjTomftJawUy7X/HTdOyb4sm0A4km9Bm2xR
 HOOnc749nZ7m8N4hpSakr4tED0JJwTjAyvcyYhwUOVOtAwoEERIaNLEGK
 U2alCMBLoeaRfK0kwsEun7+ddX5DmXn62GQC7Fbeeh49onrHKgRmOXg9x
 TvOSwtlNMeApZDtcE2F+qS1zgco3Wu4wggprxOiZ/qYjrC301e7HEd3zH
 KEoHeSAezFbBVaoEGEKw6O3r0VxqDxk/qkXM1j2avLhvWGm5iWZLGxXwo g==;
X-CSE-ConnectionGUID: ZxqpRSuTQfGTm0giuSzT1Q==
X-CSE-MsgGUID: LA4mUr4XTbSZwcVFRAQSPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="37427807"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="37427807"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
X-CSE-ConnectionGUID: 0dZFEwZuTyOSFGNi5dAApA==
X-CSE-MsgGUID: nbB4xpqWT4qU3IErmmYB/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="44763643"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 25/43] drm/xe: Use drm_mem_region for xe
Date: Tue, 11 Jun 2024 22:25:47 -0400
Message-Id: <20240612022605.385062-25-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240612022605.385062-1-oak.zeng@intel.com>
References: <20240612022605.385062-1-oak.zeng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

drm_mem_region was introduced to move some memory management
codes to drm layer so it can be shared b/t different vendor
drivers. This patch apply drm_mem_region concept to xekmd
driver.

drm_mem_region is the parent class of xe_mem_region. Some
xe_mem_region member such as dpa_base is deleted as it
is already in the parent class.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  2 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 +-
 drivers/gpu/drm/xe/xe_bo.c                    |  6 +++---
 drivers/gpu/drm/xe/xe_device_types.h          | 11 ++---------
 drivers/gpu/drm/xe/xe_migrate.c               |  8 ++++----
 drivers/gpu/drm/xe/xe_query.c                 |  2 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  2 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  2 +-
 drivers/gpu/drm/xe/xe_vram.c                  | 12 ++++++------
 9 files changed, 20 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index a2f417209124..5c4590c62c08 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -272,7 +272,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 		 * accessible.  This is important on small-bar systems where
 		 * only some subset of VRAM is CPU accessible.
 		 */
-		if (tile->mem.vram.io_size < tile->mem.vram.usable_size) {
+		if (tile->mem.vram.io_size < tile->mem.vram.drm_mr.usable_size) {
 			ret = -EINVAL;
 			goto err;
 		}
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index e135b20962d9..c2c079a2b133 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -86,7 +86,7 @@ initial_plane_bo(struct xe_device *xe,
 		 * We don't currently expect this to ever be placed in the
 		 * stolen portion.
 		 */
-		if (phys_base >= tile0->mem.vram.usable_size) {
+		if (phys_base >= tile0->mem.vram.drm_mr.usable_size) {
 			drm_err(&xe->drm,
 				"Initial plane programming using invalid range, phys_base=%pa\n",
 				&phys_base);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d2763448ebaa..17afc18e413e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -173,7 +173,7 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
 
 	vram = to_xe_ttm_vram_mgr(ttm_manager_type(&xe->ttm, mem_type))->vram;
-	xe_assert(xe, vram && vram->usable_size);
+	xe_assert(xe, vram && vram->drm_mr.usable_size);
 	io_size = vram->io_size;
 
 	/*
@@ -184,7 +184,7 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 			XE_BO_FLAG_GGTT))
 		place.flags |= TTM_PL_FLAG_CONTIGUOUS;
 
-	if (io_size < vram->usable_size) {
+	if (io_size < vram->drm_mr.usable_size) {
 		if (bo_flags & XE_BO_FLAG_NEEDS_CPU_ACCESS) {
 			place.fpfn = 0;
 			place.lpfn = io_size >> PAGE_SHIFT;
@@ -1638,7 +1638,7 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res)
 	if (res->mem_type == XE_PL_STOLEN)
 		return xe_ttm_stolen_gpu_offset(xe);
 
-	return res_to_mem_region(res)->dpa_base;
+	return res_to_mem_region(res)->drm_mr.dpa_base;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f1c09824b145..cf61b52e6d84 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -11,6 +11,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
 #include <drm/ttm/ttm_device.h>
+#include <drm/drm_svm.h>
 
 #include "xe_devcoredump_types.h"
 #include "xe_heci_gsc.h"
@@ -69,6 +70,7 @@ struct xe_pat_ops;
  * device, such as HBM memory or CXL extension memory.
  */
 struct xe_mem_region {
+	struct drm_mem_region drm_mr;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -81,15 +83,6 @@ struct xe_mem_region {
 	 * configuration is known as small-bar.
 	 */
 	resource_size_t io_size;
-	/** @dpa_base: This memory regions's DPA (device physical address) base */
-	resource_size_t dpa_base;
-	/**
-	 * @usable_size: usable size of VRAM
-	 *
-	 * Usable size of VRAM excluding reserved portions
-	 * (e.g stolen mem)
-	 */
-	resource_size_t usable_size;
 	/**
 	 * @actual_physical_size: Actual VRAM size
 	 *
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 0457693315e6..cc8455daa2bb 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -126,7 +126,7 @@ static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr)
 	 * Remove the DPA to get a correct offset into identity table for the
 	 * migrate offset
 	 */
-	addr -= xe->mem.vram.dpa_base;
+	addr -= xe->mem.vram.drm_mr.dpa_base;
 	return addr + (256ULL << xe_pt_shift(2));
 }
 
@@ -256,21 +256,21 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		u64 pos, ofs, flags;
 		/* XXX: Unclear if this should be usable_size? */
 		u64 vram_limit =  xe->mem.vram.actual_physical_size +
-			xe->mem.vram.dpa_base;
+			xe->mem.vram.drm_mr.dpa_base;
 
 		level = 2;
 		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
 		flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
 						    true, 0);
 
-		xe_assert(xe, IS_ALIGNED(xe->mem.vram.usable_size, SZ_2M));
+		xe_assert(xe, IS_ALIGNED(xe->mem.vram.drm_mr.usable_size, SZ_2M));
 
 		/*
 		 * Use 1GB pages when possible, last chunk always use 2M
 		 * pages as mixing reserved memory (stolen, WOCPM) with a single
 		 * mapping is not allowed on certain platforms.
 		 */
-		for (pos = xe->mem.vram.dpa_base; pos < vram_limit;
+		for (pos = xe->mem.vram.drm_mr.dpa_base; pos < vram_limit;
 		     pos += SZ_1G, ofs += 8) {
 			if (pos + SZ_1G >= vram_limit) {
 				u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 995effcb904b..8b3d63420cef 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -334,7 +334,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->num_params = num_params;
 	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
 		xe->info.devid | (xe->info.revid << 16);
-	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
+	if (xe_device_get_root_tile(xe)->mem.vram.drm_mr.usable_size)
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
 	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 15ea0a942f67..109f3118e821 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -132,7 +132,7 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 	struct xe_device *xe = tile_to_xe(tile);
 	int err;
 
-	if (tile->mem.vram.usable_size) {
+	if (tile->mem.vram.drm_mr.usable_size) {
 		err = xe_ttm_vram_mgr_init(tile, tile->mem.vram_mgr);
 		if (err)
 			return err;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index fe3779fdba2c..dd31b24fb07d 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -364,7 +364,7 @@ int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
 
 	mgr->vram = vram;
 	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
-				      vram->usable_size, vram->io_size,
+				      vram->drm_mr.usable_size, vram->io_size,
 				      PAGE_SIZE);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 5bcd59190353..fff18517a9f9 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -150,7 +150,7 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 		return -EIO;
 
 	/* XXX: Need to change when xe link code is ready */
-	xe->mem.vram.dpa_base = 0;
+	xe->mem.vram.drm_mr.dpa_base = 0;
 
 	/* set up a map to the total memory area. */
 	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
@@ -333,16 +333,16 @@ int xe_vram_probe(struct xe_device *xe)
 			return -ENODEV;
 		}
 
-		tile->mem.vram.dpa_base = xe->mem.vram.dpa_base + tile_offset;
-		tile->mem.vram.usable_size = vram_size;
+		tile->mem.vram.drm_mr.dpa_base = xe->mem.vram.drm_mr.dpa_base + tile_offset;
+		tile->mem.vram.drm_mr.usable_size = vram_size;
 		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
 
-		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
+		if (tile->mem.vram.io_size < tile->mem.vram.drm_mr.usable_size)
 			drm_info(&xe->drm, "Small BAR device\n");
 		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
-			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
+			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.drm_mr.usable_size, &tile->mem.vram.io_size);
 		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
-			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,
+			 &tile->mem.vram.drm_mr.dpa_base, tile->mem.vram.drm_mr.dpa_base + (u64)tile->mem.vram.actual_physical_size,
 			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);
 
 		/* calculate total size using tile size to get the correct HW sizing */
-- 
2.26.3

