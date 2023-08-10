Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756E7C001B0
	for <intel-xe@archiver.kernel.org>; Thu, 10 Aug 2023 16:03:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C4410E1A9;
	Thu, 10 Aug 2023 16:03:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CE710E1A9
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Aug 2023 16:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691683393; x=1723219393;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J1WVV2e/Fe64oyVooP+I3N9i65o4RuvSKZweAtE9+Xg=;
 b=arZVaEtv0c49ZkPQR/90MnvCzL5jujJKYaN2mr50JmixYwrWOfmNF+9Z
 IR3KJ172XRIbNDpXITcgJ7NtijexoP5VR+Y1M1EDoy/2jAv1X4nVogbTt
 hcoCqeGOR/dQPQKPsQrLoqB2sVF0JiCdcyasHruviBOcrPVT3NPYfsMic
 qByFV2TPH/wF9nJGylXKLesXQyYABT1N6q9qiECQ8D2mA/fFiN5nOD/D1
 LunI31OgM59WWld0Ah+mGSkklz4xPJoaP748XPAbtkrCe08b9U+tLyp2y
 JHtmoIwQNlmwtFkhTQYszRYh3xdKjyJul75yq6MRSPT8eLMTvbHzoTbjh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="368920666"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="368920666"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 09:02:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="761836603"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="761836603"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 09:01:52 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 10 Aug 2023 12:08:14 -0400
Message-Id: <20230810160815.41423-1-oak.zeng@intel.com>
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
---
 drivers/gpu/drm/xe/xe_bo.c           |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h | 94 ++++++++++++----------------
 drivers/gpu/drm/xe/xe_migrate.c      |  2 +-
 drivers/gpu/drm/xe/xe_mmio.c         |  9 +--
 4 files changed, 47 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 284c86107a5f..480f4e59f891 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1457,7 +1457,7 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res)
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

