Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186C8E77188
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 23:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717E110E072;
	Mon,  6 Jan 2025 23:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xy0IlYku";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9D310E072
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jan 2025 23:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736207001; x=1767743001;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XBWVfIoLq/i1Sho7oHmNrT3hFUChNu/1ICTogKpQwDc=;
 b=Xy0IlYkui+O21sxD2WJUSkwkl6VDUuTz6xLiAeARlv0prbjIFxprPgJN
 Iq4pxC23WXz4Mhc1FwxthFXuyrVtE7vsQaUPtuFP9exVN5GxgisIsH25P
 C+4+RqzP+vnSgnjgwGvfbB+SCECvWfkqCya3E9wahGc6axZCPyIz5jl2A
 Q6Fnf67j4eKZPHOsAYRlyG/CCMjwEA7m2wvchxnoa0Fxd+dWtWFMlLo0m
 DWLzgd+MelAyDavuAREZzsOll4aEX/+dzGssvjrNJSsgkwYSuJU4R1tqy
 FkC7JXrMlvrBcpJmWMbiAvLaWw+B+odIzT+F86XE59hu909zM2UuyDqKR g==;
X-CSE-ConnectionGUID: MOq3hvFxS6q4Vy1nH+jKKw==
X-CSE-MsgGUID: vQ+SG1cJQvyw2ApT9EgX+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="46950173"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="46950173"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 15:43:20 -0800
X-CSE-ConnectionGUID: C4okJVvwTayQVXkEmlFhYA==
X-CSE-MsgGUID: HQnjJpGYTUGPKJ+Zjw9sJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103444364"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 15:43:20 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Koby Elbaz <kelbaz@habana.ai>
Subject: [PATCH] drm/xe: Remove unused "mmio_ext" code
Date: Mon,  6 Jan 2025 15:43:13 -0800
Message-ID: <20250106234312.2986065-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.47.1
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

The "mmio_ext" and 'REG_EXT" code is currently unused on any existing
platform.  Going forward, this also isn't the design we want to use for
any future platforms/features either, so we should just go ahead and
remove the dead code to avoid confusion.

mmio_ext was originally added in an attempt to hack around the early
(mis)design of the Xe driver, which used xe_gt as the target for all
register MMIO access, even those completely unrelated to the GT subunit
of the hardware.  With the introduction of commit 34953ee349dd ("drm/xe:
Create dedicated xe_mmio structure") and its follow-up patches, that
misdesign has been corrected and access to register MMIO regions
specific to hardware units is now done through xe_mmio structures which
encapsulate an iomap, region size, and some other metadata.

Although all of the registers used by the driver today happen to fall
within one specific PCI BAR region, and thus re-use a single device-wide
iomap, there's no requirement that this stay true for future platforms
or features.  I.e., if a future platform adds a new 'foo' hardware unit
that exists at a different area in the BAR, or even in a completely
different BAR, then that would be handled by doing a separate iomap of
that unit's register region and wrapping it in its own 'struct xe_mmio
foo_regs' structure.  The pointer to the new 'foo_regs' could be placed
within the xe_device, xe_tile, xe_gt, etc., according to where the new
hardware unit falls within the current hardware hierarchy.

This effectively reverts the following commits, although parts of these
commits had already vanished or changed with the earlier xe_mmio
refactor work:

 - commit 399a13323f0d ("drm/xe: add 28-bit address support in struct
   xe_reg")
 - commit fdef72e02e20 ("drm/xe: add a flag to bypass multi-tile config
   from MTCFG reg")
 - commit 866b2b176434 ("drm/xe: add MMIO extension support flags")
 - commit ef29b390c734 ("drm/xe: map MMIO BAR according to the num of
   tiles in device desc")
 - commit a4e2f3a299ea ("drm/xe: refactor xe_mmio_probe_tiles to support
   MMIO extension")

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Koby Elbaz <kelbaz@habana.ai>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_reg_defs.h | 16 +----------
 drivers/gpu/drm/xe/xe_device_types.h  | 11 --------
 drivers/gpu/drm/xe/xe_mmio.c          | 39 ---------------------------
 drivers/gpu/drm/xe/xe_pci.c           |  3 ---
 drivers/gpu/drm/xe/xe_pci_types.h     |  2 --
 5 files changed, 1 insertion(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
index 51fd40ffafcb..0234d1e84139 100644
--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
@@ -21,7 +21,7 @@ struct xe_reg {
 	union {
 		struct {
 			/** @addr: address */
-			u32 addr:28;
+			u32 addr:22;
 			/**
 			 * @masked: register is "masked", with upper 16bits used
 			 * to identify the bits that are updated on the lower
@@ -41,10 +41,6 @@ struct xe_reg {
 			 * @vf: register is accessible from the Virtual Function.
 			 */
 			u32 vf:1;
-			/**
-			 * @ext: access MMIO extension space for current register.
-			 */
-			u32 ext:1;
 		};
 		/** @raw: Raw value with both address and options */
 		u32 raw;
@@ -111,16 +107,6 @@ struct xe_reg_mcr {
  */
 #define XE_REG(r_, ...)		((const struct xe_reg)XE_REG_INITIALIZER(r_, ##__VA_ARGS__))
 
-/**
- * XE_REG_EXT - Create a struct xe_reg from extension offset and additional
- * flags
- * @r_: Register extension offset
- * @...: Additional options like access mode. See struct xe_reg for available
- *       options.
- */
-#define XE_REG_EXT(r_, ...)	\
-	((const struct xe_reg)XE_REG_INITIALIZER(r_, ##__VA_ARGS__, .ext = 1))
-
 /**
  * XE_REG_MCR - Create a struct xe_reg_mcr from offset and additional flags
  * @r_: Register offset
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8a7b15972413..16ebb2859877 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -186,13 +186,6 @@ struct xe_tile {
 	 */
 	struct xe_mmio mmio;
 
-	/**
-	 * @mmio_ext: MMIO-extension info for a tile.
-	 *
-	 * Each tile has its own additional 256MB (28-bit) MMIO-extension space.
-	 */
-	struct xe_mmio mmio_ext;
-
 	/** @mem: memory management info for tile */
 	struct {
 		/**
@@ -263,8 +256,6 @@ struct xe_device {
 		const char *graphics_name;
 		/** @info.media_name: media IP name */
 		const char *media_name;
-		/** @info.tile_mmio_ext_size: size of MMIO extension space, per-tile */
-		u32 tile_mmio_ext_size;
 		/** @info.graphics_verx100: graphics IP version */
 		u32 graphics_verx100;
 		/** @info.media_verx100: media IP version */
@@ -314,8 +305,6 @@ struct xe_device {
 		u8 has_heci_gscfi:1;
 		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
 		u8 has_llc:1;
-		/** @info.has_mmio_ext: Device has extra MMIO address range */
-		u8 has_mmio_ext:1;
 		/** @info.has_range_tlb_invalidation: Has range based TLB invalidations */
 		u8 has_range_tlb_invalidation:1;
 		/** @info.has_sriov: Supports SR-IOV */
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index a48f239cad1c..d321a21aacf0 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -103,50 +103,11 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
 	}
 }
 
-/*
- * On top of all the multi-tile MMIO space there can be a platform-dependent
- * extension for each tile, resulting in a layout like below:
- *
- * .----------------------. <- ext_base + tile_count * tile_mmio_ext_size
- * |         ....         |
- * |----------------------| <- ext_base + 2 * tile_mmio_ext_size
- * | tile1->mmio_ext.regs |
- * |----------------------| <- ext_base + 1 * tile_mmio_ext_size
- * | tile0->mmio_ext.regs |
- * |======================| <- ext_base = tile_count * tile_mmio_size
- * |                      |
- * |       mmio.regs      |
- * |                      |
- * '----------------------' <- 0MB
- *
- * Set up the tile[]->mmio_ext pointers/sizes.
- */
-static void mmio_extension_setup(struct xe_device *xe, size_t tile_mmio_size,
-				 size_t tile_mmio_ext_size)
-{
-	struct xe_tile *tile;
-	void __iomem *regs;
-	u8 id;
-
-	if (!xe->info.has_mmio_ext)
-		return;
-
-	regs = xe->mmio.regs + tile_mmio_size * xe->info.tile_count;
-	for_each_tile(tile, xe, id) {
-		tile->mmio_ext.regs_size = tile_mmio_ext_size;
-		tile->mmio_ext.regs = regs;
-		tile->mmio_ext.tile = tile;
-		regs += tile_mmio_ext_size;
-	}
-}
-
 int xe_mmio_probe_tiles(struct xe_device *xe)
 {
 	size_t tile_mmio_size = SZ_16M;
-	size_t tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
 
 	mmio_multi_tile_setup(xe, tile_mmio_size);
-	mmio_extension_setup(xe, tile_mmio_size, tile_mmio_ext_size);
 
 	return devm_add_action_or_reset(xe->drm.dev, tiles_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 7d146e3e8e21..90fcfafd362f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -61,7 +61,6 @@ struct xe_device_desc {
 	u8 has_heci_gscfi:1;
 	u8 has_heci_cscfi:1;
 	u8 has_llc:1;
-	u8 has_mmio_ext:1;
 	u8 has_sriov:1;
 	u8 skip_guc_pc:1;
 	u8 skip_mtcfg:1;
@@ -622,7 +621,6 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
 	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
 	xe->info.has_llc = desc->has_llc;
-	xe->info.has_mmio_ext = desc->has_mmio_ext;
 	xe->info.has_sriov = desc->has_sriov;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
@@ -682,7 +680,6 @@ static int xe_info_init(struct xe_device *xe,
 
 	xe->info.graphics_name = graphics_desc->name;
 	xe->info.media_name = media_desc ? media_desc->name : "none";
-	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
 
 	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
 	xe->info.vram_flags = graphics_desc->vram_flags;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 79b0f80376a4..873efec5cdee 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -20,8 +20,6 @@ struct xe_graphics_desc {
 
 	u64 hw_engine_mask;	/* hardware engines provided by graphics IP */
 
-	u32 tile_mmio_ext_size; /* size of MMIO extension space, per-tile */
-
 	u8 max_remote_tiles:2;
 
 	u8 has_asid:1;
-- 
2.47.1

