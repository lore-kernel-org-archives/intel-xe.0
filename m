Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C34FC27C44
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 00:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4AC510E257;
	Thu, 30 May 2024 00:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A+S3iIwX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1EEB10ED68
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 00:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717029212; x=1748565212;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=RrLylQ/tYoezVZ+ns5lJZ42QDEtog6umORjjP81r7BU=;
 b=A+S3iIwXkCcHYlTkJiNR3U4WmfHiVCCiwCXC7ZXGgoJHB/bBpWfVX8Ts
 vURxvmkKtb8lhM0CoLM/JwTfHVfMArbjRdCovNZ1m/PVGqGYVIZ3Xnt4G
 WAg9Dy7W65APjg6dXna9CE42pDVM2rrbzHWNztn2EDVaL9P7Qk6V72xtf
 6Cp1lFF2JKTib6p0+rVEH1lkJkESz/UC+RtmMcYFmrr2ZBgvXUv4gecL8
 QtxH4h87LZVUhASSYfnzntNF3CdzNhfTdld6S5n/Adi9gx/qrwvM8HqMj
 oTDkrsuVRpHyPqx7NQ4jY2kFL2ecWt6cO8djEwsGR93yRrYSxwBNPe5fy Q==;
X-CSE-ConnectionGUID: qPOnT9XQRXO8uWGWTTt4Xw==
X-CSE-MsgGUID: OS8GZGUSTxavMDZzkh/Mog==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="30975401"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="30975401"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 17:33:24 -0700
X-CSE-ConnectionGUID: kyra2U6zQmC1mRwv+0AI6A==
X-CSE-MsgGUID: b2668nkwThqlTnuWzVmWfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40088758"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 17:33:23 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 25/26] drm/xe: Use drm_mem_region for xe
Date: Wed, 29 May 2024 20:47:31 -0400
Message-Id: <20240530004732.84898-25-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240530004732.84898-1-oak.zeng@intel.com>
References: <20240530004732.84898-1-oak.zeng@intel.com>
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

drm_mem_region was introduced to move some memory management
codes to drm layer so it can be shared b/t different vendor
drivers. This patch apply drm_mem_region concept to xekmd
driver.

drm_mem_region is the parent class of xe_mem_region. Some
xe_mem_region member such as dpa_base is deleted as it
is already in the parent class.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  2 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 +-
 drivers/gpu/drm/xe/xe_bo.c                    |  6 +++---
 drivers/gpu/drm/xe/xe_device_types.h          | 11 ++---------
 drivers/gpu/drm/xe/xe_migrate.c               |  6 +++---
 drivers/gpu/drm/xe/xe_mmio.c                  | 12 ++++++------
 drivers/gpu/drm/xe/xe_query.c                 |  2 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  2 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  2 +-
 9 files changed, 19 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 36e15c4961c1..7abf10ec2690 100644
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
index 9eaa29e733e1..2612b78d69cf 100644
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
index d9caf2071a88..a7857d2c562f 100644
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
 
@@ -261,8 +261,8 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		 * Use 1GB pages, it shouldn't matter the physical amount of
 		 * vram is less, when we don't access it.
 		 */
-		for (pos = xe->mem.vram.dpa_base;
-		     pos < xe->mem.vram.actual_physical_size + xe->mem.vram.dpa_base;
+		for (pos = xe->mem.vram.drm_mr.dpa_base;
+		     pos < xe->mem.vram.actual_physical_size + xe->mem.vram.drm_mr.dpa_base;
 		     pos += SZ_1G, ofs += 8)
 			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
 	}
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 248e93ec6df7..c842df946438 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -160,7 +160,7 @@ static int xe_determine_lmem_bar_size(struct xe_device *xe)
 		return -EIO;
 
 	/* XXX: Need to change when xe link code is ready */
-	xe->mem.vram.dpa_base = 0;
+	xe->mem.vram.drm_mr.dpa_base = 0;
 
 	/* set up a map to the total memory area. */
 	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
@@ -319,16 +319,16 @@ int xe_mmio_probe_vram(struct xe_device *xe)
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
 
-- 
2.26.3

