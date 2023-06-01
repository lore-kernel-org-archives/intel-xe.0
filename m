Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4AAC7EE2F
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 20:30:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E5610E5C7;
	Thu,  1 Jun 2023 20:30:34 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830DA10E5C3
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 20:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685651431; x=1717187431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=An15Wj9gk7hex2WldofMMkFsIA05zgNdClRVyQnsn+U=;
 b=VzYe95dBLkORVftFgBXzHjc8XNGdUaFoaA0NSdr90Xfn48F1QBP1XOOa
 ZtXh9xxCqwsdqYbahkoTPYIYynl89s4DTgPJHvVpsQ2ClcLmRFpLU8gOW
 PD2huiSErXcjqioatFIhorKp/Htp74UdEUKUubd7LGhUNVwIThIE1sIuZ
 uZUzeCxduolzAmn4TmMaIvrEGAHX9ntfsVfUMk0CkkZRrSYbhGKiQ1Sz4
 Ub7sT7VtnT7OqKggcML9+HAXLRkThUh5i6QAnS6D9/NnTm5rLbDUae3C6
 XtWaVMUrSrA/5yQUIYaw14BkTAQ5WHHZHrZwBOKNLLVV8QJ+RP18FDR4d w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358102505"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="358102505"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 13:30:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="740493224"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="740493224"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 13:30:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 13:30:00 -0700
Message-Id: <20230601203025.615494-7-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601203025.615494-1-matthew.d.roper@intel.com>
References: <20230601203025.615494-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 06/31] drm/xe: Move register MMIO into xe_tile
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Each tile has its own register region in the BAR, containing instances
of all registers for the platform.  In contrast, the multiple GTs within
a tile share the same MMIO space; there's just a small subset of
registers (the GSI registers) which have multiple copies at different
offsets (0x0 for primary GT, 0x380000 for media GT).  Move the register
MMIO region size/pointers to the tile structure, leaving just the GSI
offset information in the GT structure.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c         |  3 ++-
 drivers/gpu/drm/xe/xe_gt_types.h     |  9 +++------
 drivers/gpu/drm/xe/xe_mmio.c         | 26 ++++++++++++++------------
 drivers/gpu/drm/xe/xe_mmio.h         | 21 ++++++++++++++++-----
 5 files changed, 51 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 396ee281e499..619f40a7e275 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -81,6 +81,22 @@ struct xe_tile {
 	struct xe_gt primary_gt;
 
 	/* TODO: Add media GT here */
+
+	/**
+	 * @mmio: MMIO info for a tile.
+	 *
+	 * Each tile has its own 16MB space in BAR0, laid out as:
+	 * * 0-4MB: registers
+	 * * 4MB-8MB: reserved
+	 * * 8MB-16MB: global GTT
+	 */
+	struct {
+		/** @size: size of tile's MMIO space */
+		size_t size;
+
+		/** @regs: pointer to tile's MMIO space (starting with registers) */
+		void *regs;
+	} mmio;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 189d377f8690..3333b2545740 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -93,6 +93,7 @@ static void ggtt_fini_noalloc(struct drm_device *drm, void *arg)
 int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_tile *tile = gt_to_tile(gt);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	unsigned int gsm_size;
 
@@ -106,7 +107,7 @@ int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
 		return -ENOMEM;
 	}
 
-	ggtt->gsm = gt->mmio.regs + SZ_8M;
+	ggtt->gsm = tile->mmio.regs + SZ_8M;
 	ggtt->size = (gsm_size / 8) * (u64) XE_PAGE_SIZE;
 
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 11605a99ad66..81e6ab0c77e0 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -124,14 +124,11 @@ struct xe_gt {
 	} info;
 
 	/**
-	 * @mmio: mmio info for GT, can be subset of the global device mmio
-	 * space
+	 * @mmio: mmio info for GT.  All GTs within a tile share the same
+	 * register space, but have their own copy of GSI registers at a
+	 * specific offset, as well as their own forcewake handling.
 	 */
 	struct {
-		/** @size: size of MMIO space on GT */
-		size_t size;
-		/** @regs: pointer to MMIO space on GT */
-		void *regs;
 		/** @fw: force wake for GT */
 		struct xe_force_wake fw;
 		/**
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 79f902d2faea..b27103080ca9 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -346,6 +346,7 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
 
 	if (xe->info.tile_count > 1) {
 		const int mmio_bar = 0;
+		struct xe_tile *tile;
 		size_t size;
 		void *regs;
 
@@ -359,11 +360,11 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
 		size = xe->mmio.size / adj_tile_count;
 		regs = xe->mmio.regs;
 
-		for_each_gt(gt, xe, id) {
-			if (id && !xe_gt_is_media_type(gt))
-				regs += size;
-			gt->mmio.size = size;
-			gt->mmio.regs = regs;
+		for_each_tile(tile, xe, id) {
+			tile->mmio.size = size;
+			tile->mmio.regs = regs;
+
+			regs += size;
 		}
 	}
 }
@@ -379,15 +380,16 @@ static void mmio_fini(struct drm_device *drm, void *arg)
 
 int xe_mmio_init(struct xe_device *xe)
 {
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 	struct xe_gt *gt = xe_device_get_gt(xe, 0);
 	const int mmio_bar = 0;
 	int err;
 
 	/*
-	 * Map the entire BAR, which includes registers (0-4MB), reserved space
-	 * (4MB-8MB), and GGTT (8MB-16MB). Other parts of the driver (GTs,
-	 * GGTTs) will derive the pointers they need from the mapping in the
-	 * device structure.
+	 * Map the first 16MB of th BAR, which includes the registers (0-4MB),
+	 * reserved space (4MB-8MB), and GGTT (8MB-16MB) for a single tile.
+	 * This will get remapped later if we determine that we're running
+	 * on a multi-tile system.
 	 */
 	xe->mmio.size = SZ_16M;
 	xe->mmio.regs = pci_iomap(to_pci_dev(xe->drm.dev), mmio_bar,
@@ -401,9 +403,9 @@ int xe_mmio_init(struct xe_device *xe)
 	if (err)
 		return err;
 
-	/* 1 GT for now, 1 to 1 mapping, may change on multi-GT devices */
-	gt->mmio.size = xe->mmio.size;
-	gt->mmio.regs = xe->mmio.regs;
+	/* Setup first tile; other tiles (if present) will be setup later. */
+	root_tile->mmio.size = xe->mmio.size;
+	root_tile->mmio.regs = xe->mmio.regs;
 
 	/*
 	 * The boot firmware initializes local memory and assesses its health.
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index da91729a3854..0ba7aa790f0b 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -10,6 +10,7 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 
 #include "regs/xe_reg_defs.h"
+#include "xe_device_types.h"
 #include "xe_gt_types.h"
 
 struct drm_device;
@@ -22,27 +23,33 @@ int xe_mmio_init(struct xe_device *xe);
 
 static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
 {
+	struct xe_tile *tile = gt_to_tile(gt);
+
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
-	return readb(gt->mmio.regs + reg.addr);
+	return readb(tile->mmio.regs + reg.addr);
 }
 
 static inline void xe_mmio_write32(struct xe_gt *gt,
 				   struct xe_reg reg, u32 val)
 {
+	struct xe_tile *tile = gt_to_tile(gt);
+
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
-	writel(val, gt->mmio.regs + reg.addr);
+	writel(val, tile->mmio.regs + reg.addr);
 }
 
 static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
 {
+	struct xe_tile *tile = gt_to_tile(gt);
+
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
-	return readl(gt->mmio.regs + reg.addr);
+	return readl(tile->mmio.regs + reg.addr);
 }
 
 static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
@@ -60,18 +67,22 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
 static inline void xe_mmio_write64(struct xe_gt *gt,
 				   struct xe_reg reg, u64 val)
 {
+	struct xe_tile *tile = gt_to_tile(gt);
+
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
-	writeq(val, gt->mmio.regs + reg.addr);
+	writeq(val, tile->mmio.regs + reg.addr);
 }
 
 static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
 {
+	struct xe_tile *tile = gt_to_tile(gt);
+
 	if (reg.addr < gt->mmio.adj_limit)
 		reg.addr += gt->mmio.adj_offset;
 
-	return readq(gt->mmio.regs + reg.addr);
+	return readq(tile->mmio.regs + reg.addr);
 }
 
 static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
-- 
2.40.1

