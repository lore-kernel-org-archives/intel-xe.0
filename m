Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021D3C001B0
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 19:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECF610E6EE;
	Fri, 11 Aug 2023 19:33:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED6110E6EE
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 19:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691782378; x=1723318378;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sy4lpKHFH5L7CqbdaMgFsErGMRF2Z0+26BTq3sNdDVA=;
 b=ZEOyPkjhT11EXNnMNtLeJFdWExRRaVh1987C3XykujDVZNq+IFk5KjXP
 JwkJKT2Jgp9z4RK7wxY3Dv+CbiQt/vaBQsAIu3gu1bg0xuypO7kNoKLwb
 iKF9Bs/0k9TYt15DpD/tCdShiwr7uWv0y9TEQmGuygSVij5DZ5ZfSBjnD
 FeH+VyuWtcwQmjCohQLnG/DY5XuA0BOERabMDuVrf7rRKAvuHtfYm0iok
 R6BnRo3qX5DnvHxgFgpjXtkZH2uhB6SSFttYxGMrrAPGFv1L4HqBAG5eN
 cHC3d9tmLX4zUgLdFSkeD1dR9o5CseNSQC2U2ooEEMljeWpJpWP128Xqi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="374515723"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="374515723"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 12:32:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="682641029"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="682641029"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 12:32:57 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 11 Aug 2023 15:39:22 -0400
Message-Id: <20230811193923.132091-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Make xe_mem_region struct
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

Make a xe_mem_region structure which will be used in the
coming patches. The new structure is used in both xe device
level (xe->mem.vram) and xe_tile level (tile->vram).

Make the definition of xe_mem_region.dpa_base to be the DPA
base of this memory region and change codes according to
this new definition.

v1:
  - rename xe_mem_region.base to dpa_base per conversation with Mike
    Ruhl

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h | 94 ++++++++++++----------------
 drivers/gpu/drm/xe/xe_migrate.c      |  2 +-
 drivers/gpu/drm/xe/xe_mmio.c         |  9 +--
 4 files changed, 47 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6a7dc14feab0..1ab682d61e3c 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1459,7 +1459,7 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res)
 	if (res->mem_type == XE_PL_STOLEN)
 		return xe_ttm_stolen_gpu_offset(xe);
 
-	return xe->mem.vram.base + tile->mem.vram.base;
+	return tile->mem.vram.dpa_base;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index bfedcc7571b0..8e45724f3d2f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -56,6 +56,44 @@ struct xe_ggtt;
 		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
 		 struct xe_tile * : (tile__)->xe)
 
+/**
+ * struct xe_mem_region - memory region structure
+ * This is used to describe a memory region in xe
+ * device, such as HBM memory or CXL extension memory.
+ */
+struct xe_mem_region {
+	/** @io_start: IO start address of this VRAM instance */
+	resource_size_t io_start;
+	/**
+	 * @io_size: IO size of this VRAM instance
+	 *
+	 * This represents how much of this VRAM we can access
+	 * via the CPU through the VRAM BAR. This can be smaller
+	 * than @usable_size, in which case only part of VRAM is CPU
+	 * accessible (typically the first 256M). This
+	 * configuration is known as small-bar.
+	 */
+	resource_size_t io_size;
+	/** @base: This memory regions's DPA (device physical address) base */
+	resource_size_t dpa_base;
+	/**
+	 * @usable_size: usable size of VRAM
+	 *
+	 * Usable size of VRAM excluding reserved portions
+	 * (e.g stolen mem)
+	 */
+	resource_size_t usable_size;
+	/**
+	 * @actual_physical_size: Actual VRAM size
+	 *
+	 * Actual VRAM size including reserved portions
+	 * (e.g stolen mem)
+	 */
+	resource_size_t actual_physical_size;
+	/** @mapping: pointer to VRAM mappable space */
+	void *__iomem mapping;
+};
+
 /**
  * struct xe_tile - hardware tile structure
  *
@@ -113,38 +151,7 @@ struct xe_tile {
 		 * Although VRAM is associated with a specific tile, it can
 		 * still be accessed by all tiles' GTs.
 		 */
-		struct {
-			/** @io_start: IO start address of this VRAM instance */
-			resource_size_t io_start;
-			/**
-			 * @io_size: IO size of this VRAM instance
-			 *
-			 * This represents how much of this VRAM we can access
-			 * via the CPU through the VRAM BAR. This can be smaller
-			 * than @size, in which case only part of VRAM is CPU
-			 * accessible (typically the first 256M). This
-			 * configuration is known as small-bar.
-			 */
-			resource_size_t io_size;
-			/** @base: offset of VRAM starting base */
-			resource_size_t base;
-			/**
-			 * @usable_size: usable size of VRAM
-			 *
-			 * Usable size of VRAM excluding reserved portions
-			 * (e.g stolen mem)
-			 */
-			resource_size_t usable_size;
-			/**
-			 * @actual_physical_size: Actual VRAM size
-			 *
-			 * Actual VRAM size including reserved portions
-			 * (e.g stolen mem)
-			 */
-			resource_size_t actual_physical_size;
-			/** @mapping: pointer to VRAM mappable space */
-			void *__iomem mapping;
-		} vram;
+		struct xe_mem_region vram;
 
 		/** @vram_mgr: VRAM TTM manager */
 		struct xe_ttm_vram_mgr *vram_mgr;
@@ -263,28 +270,7 @@ struct xe_device {
 	/** @mem: memory info for device */
 	struct {
 		/** @vram: VRAM info for device */
-		struct {
-			/** @io_start: IO start address of VRAM */
-			resource_size_t io_start;
-			/**
-			 * @io_size: IO size of VRAM.
-			 *
-			 * This represents how much of VRAM the CPU can access
-			 * via the VRAM BAR.
-			 * On systems that do not support large BAR IO space,
-			 * this can be smaller than the actual memory size, in
-			 * which case only part of VRAM is CPU accessible
-			 * (typically the first 256M).  This configuration is
-			 * known as small-bar.
-			 */
-			resource_size_t io_size;
-			/** @size: Total size of VRAM */
-			resource_size_t size;
-			/** @base: Offset to apply for Device Physical Address control */
-			resource_size_t base;
-			/** @mapping: pointer to VRAM mappable space */
-			void *__iomem mapping;
-		} vram;
+		struct xe_mem_region vram;
 		/** @sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
 	} mem;
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 18c94022930f..956a96b38346 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -264,7 +264,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		 * Use 1GB pages, it shouldn't matter the physical amount of
 		 * vram is less, when we don't access it.
 		 */
-		for (pos = 0; pos < xe->mem.vram.size; pos += SZ_1G, ofs += 8)
+		for (pos = 0; pos < xe->mem.vram.actual_physical_size; pos += SZ_1G, ofs += 8)
 			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index aa9c573b1243..41ee89247ddb 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -173,7 +173,8 @@ static int xe_determine_lmem_bar_size(struct xe_device *xe)
 	if (!xe->mem.vram.io_size)
 		return -EIO;
 
-	xe->mem.vram.base = 0; /* DPA offset */
+	/* XXX: Need to change when xe link code is ready */
+	xe->mem.vram.dpa_base = 0;
 
 	/* set up a map to the total memory area. */
 	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
@@ -281,7 +282,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 			return -ENODEV;
 		}
 
-		tile->mem.vram.base = tile_offset;
+		tile->mem.vram.dpa_base = xe->mem.vram.dpa_base + tile_offset;
 		tile->mem.vram.usable_size = vram_size;
 		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
 
@@ -304,10 +305,10 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		io_size -= min_t(u64, tile_size, io_size);
 	}
 
-	xe->mem.vram.size = total_size;
+	xe->mem.vram.actual_physical_size = total_size;
 
 	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
-		 &xe->mem.vram.size);
+		 &xe->mem.vram.actual_physical_size);
 	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
 		 &available_size);
 
-- 
2.26.3

