Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E065C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 04:56:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB8D10E40E;
	Tue, 23 Jul 2024 04:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQJLgH8r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F4F10E40E
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 04:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721710567; x=1753246567;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YetWHpI5yDolIJdnalcERDI5K0X3DKWb7sYYTEWVxKc=;
 b=KQJLgH8rDUrxK8N4AxBve3nVaKQens5ADUAZAiBJUrf/UdUkimX4i9qy
 2fW+RTTRQWaWsOzfdmL7dBKLV45Jb+5CUuwsyNnka1OdzeYKzp1QsWK7m
 AUi3nPJzzOJm7q5Wlkzh8EW8PcxlWsSCY3sV3HtpSOTgmyXS7e1t0LPCV
 nJ16WmZZ80MU+Hl5TsUl/0SXKvhldn0IVRHJk6on7SBk2rWF02WAhaxpF
 FIqS2xM0bhBDwmJTVSbZaolWbHm8ouaoAR2xYA13DytYYUeJ6KweXtc58
 r/aSe7lUJsCSlPyHy2wvczGWu4XujTrP+lAn82niRGAc1Bjm9ojCBMWMk g==;
X-CSE-ConnectionGUID: g12fl/WrSgeSWQqwSV5fMg==
X-CSE-MsgGUID: hfNk8E8LRG2dGkBnzXBJkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19159869"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="19159869"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 21:56:07 -0700
X-CSE-ConnectionGUID: EAyrE5ENRE2UsgANnqn9Tg==
X-CSE-MsgGUID: 0yQkI6xNQpeWcGa7m6WpmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="51760329"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 21:56:06 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [CI] drm/xe: Refactor mmio setup for multi-tile
Date: Mon, 22 Jul 2024 21:54:57 -0700
Message-ID: <20240723045558.288693-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Extract functions to setup the multi-tile mmio space and extension
space, while better documenting the final memory layout.  No change in
behavior.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

v2: Remove needless assignment (Gustavo)

 drivers/gpu/drm/xe/xe_mmio.c | 99 ++++++++++++++++++++++++++++--------
 1 file changed, 77 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index ea3c37d3e13f..435c01d003a8 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -33,29 +33,56 @@ static void tiles_fini(void *arg)
 		tile->mmio.regs = NULL;
 }
 
-int xe_mmio_probe_tiles(struct xe_device *xe)
+/*
+ * On multi-tile devices, partition the BAR space for MMIO on each tile,
+ * possibly accounting for register override on the number of tiles available.
+ * Resulting memory layout is like below:
+ *
+ * .----------------------. <- tile_count * tile_mmio_size
+ * |         ....         |
+ * |----------------------| <- 2 * tile_mmio_size
+ * |   tile1->mmio.regs   |
+ * |----------------------| <- 1 * tile_mmio_size
+ * |   tile0->mmio.regs   |
+ * '----------------------' <- 0MB
+ */
+static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
 {
-	size_t tile_mmio_size = SZ_16M, tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
-	u8 id, tile_count = xe->info.tile_count;
-	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	struct xe_tile *tile;
 	void __iomem *regs;
-	u32 mtcfg;
+	u8 id;
 
-	if (tile_count == 1)
-		goto add_mmio_ext;
+	/*
+	 * Nothing to be done as tile 0 has already been setup earlier with the
+	 * entire BAR mapped - see xe_mmio_init()
+	 */
+	if (xe->info.tile_count == 1)
+		return;
 
+	/* Possibly override number of tile based on configuration register */
 	if (!xe->info.skip_mtcfg) {
+		struct xe_gt *gt = xe_root_mmio_gt(xe);
+		u8 tile_count;
+		u32 mtcfg;
+
+		/*
+		 * Although the per-tile mmio regs are not yet initialized, this
+		 * is fine as it's going to the root gt, that's guaranteed to be
+		 * initialized earlier in xe_mmio_init()
+		 */
 		mtcfg = xe_mmio_read64_2x32(gt, XEHP_MTCFG_ADDR);
 		tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
+
 		if (tile_count < xe->info.tile_count) {
 			drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
 					xe->info.tile_count, tile_count);
 			xe->info.tile_count = tile_count;
 
 			/*
-			 * FIXME: Needs some work for standalone media, but should be impossible
-			 * with multi-tile for now.
+			 * FIXME: Needs some work for standalone media, but
+			 * should be impossible with multi-tile for now:
+			 * multi-tile platform with standalone media doesn't
+			 * exist
 			 */
 			xe->info.gt_count = xe->info.tile_count;
 		}
@@ -67,23 +94,51 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
 		tile->mmio.regs = regs;
 		regs += tile_mmio_size;
 	}
+}
 
-add_mmio_ext:
-	/*
-	 * By design, there's a contiguous multi-tile MMIO space (16MB hard coded per tile).
-	 * When supported, there could be an additional contiguous multi-tile MMIO extension
-	 * space ON TOP of it, and hence the necessity for distinguished MMIO spaces.
-	 */
-	if (xe->info.has_mmio_ext) {
-		regs = xe->mmio.regs + tile_mmio_size * tile_count;
+/*
+ * On top of all the multi-tile MMIO space there can be a platform-dependent
+ * extension for each tile, resulting in a layout like below:
+ *
+ * .----------------------. <- ext_base + tile_count * tile_mmio_ext_size
+ * |         ....         |
+ * |----------------------| <- ext_base + 2 * tile_mmio_ext_size
+ * | tile1->mmio_ext.regs |
+ * |----------------------| <- ext_base + 1 * tile_mmio_ext_size
+ * | tile0->mmio_ext.regs |
+ * |======================| <- ext_base = tile_count * tile_mmio_size
+ * |                      |
+ * |       mmio.regs      |
+ * |                      |
+ * '----------------------' <- 0MB
+ *
+ * Set up the tile[]->mmio_ext pointers/sizes.
+ */
+static void mmio_extension_setup(struct xe_device *xe, size_t tile_mmio_size,
+				 size_t tile_mmio_ext_size)
+{
+	struct xe_tile *tile;
+	void __iomem *regs;
+	u8 id;
 
-		for_each_tile(tile, xe, id) {
-			tile->mmio_ext.size = tile_mmio_ext_size;
-			tile->mmio_ext.regs = regs;
+	if (!xe->info.has_mmio_ext)
+		return;
 
-			regs += tile_mmio_ext_size;
-		}
+	regs = xe->mmio.regs + tile_mmio_size * xe->info.tile_count;
+	for_each_tile(tile, xe, id) {
+		tile->mmio_ext.size = tile_mmio_ext_size;
+		tile->mmio_ext.regs = regs;
+		regs += tile_mmio_ext_size;
 	}
+}
+
+int xe_mmio_probe_tiles(struct xe_device *xe)
+{
+	size_t tile_mmio_size = SZ_16M;
+	size_t tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
+
+	mmio_multi_tile_setup(xe, tile_mmio_size);
+	mmio_extension_setup(xe, tile_mmio_size, tile_mmio_ext_size);
 
 	return devm_add_action_or_reset(xe->drm.dev, tiles_fini, xe);
 }
-- 
2.43.0

