Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9119C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 23:19:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1DB810E648;
	Fri, 19 May 2023 23:19:05 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6A110E625
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 23:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684538328; x=1716074328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MKTOadssZz+0f7MlARfaSvFHH+OcZUH5iHO5bG1HzL0=;
 b=C0rYG29DreJ+ILTf+2ipbgLmie+j0BCmlU9zQNt9PwrLCsW8yW5LGe50
 GuLybBqxOg1BNd7AVZ9xUk1er6ab9MEro3SWwSBBZXegQT/zXuOIMWMYv
 Mf0Uy7lt9EXWy28SsV/bH+XvYeznR4fXQv4EwjIzUoOkGfrxtkArwRVlk
 4UGg4JSsWxAspsHHBt+EVJQqpMKrn9Wbc8g/lYSTuHs8HCi88r/bcqhBJ
 0cFQjAjRdP/TPb8onG/mERjS4MuwqtN+bygUbSVvI8EYfMv0+aAwRN4tB
 o9bJG6+wOVhfHjFzXRjxOUW0RvpFJLmfve5pRMhfBhiNRi83gK5pRt6lV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="352526343"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="352526343"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="696888694"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="696888694"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 16:18:02 -0700
Message-Id: <20230519231827.3572452-6-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230519231827.3572452-1-matthew.d.roper@intel.com>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 05/30] drm/xe: Move register MMIO into xe_tile
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
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
index 11d973508d6c..ea7143c04db9 100644
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
index 546240261e0a..200976da3dc1 100644
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
index 2bc88696af77..6f4243443d04 100644
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
index 254b4a63d901..54fa1212fcd9 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -307,6 +307,7 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
 
 	if (xe->info.tile_count > 1) {
 		const int mmio_bar = 0;
+		struct xe_tile *tile;
 		size_t size;
 		void *regs;
 
@@ -320,11 +321,11 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
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
@@ -340,15 +341,16 @@ static void mmio_fini(struct drm_device *drm, void *arg)
 
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
@@ -362,9 +364,9 @@ int xe_mmio_init(struct xe_device *xe)
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
index 1407f1189b0d..acf0b18f3111 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -10,6 +10,7 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 
 #include "regs/xe_reg_defs.h"
+#include "xe_device_types.h"
 #include "xe_gt_types.h"
 
 struct drm_device;
@@ -20,27 +21,33 @@ int xe_mmio_init(struct xe_device *xe);
 
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
@@ -58,18 +65,22 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
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
2.40.0

