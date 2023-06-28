Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF88CEB64DC
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 07:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB4D10E367;
	Wed, 28 Jun 2023 07:09:29 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5055510E366
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 07:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687936167; x=1719472167;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6LP0iMMibTxe/+nxALWByXVoww4O8ZkcGXa35q1hiVY=;
 b=VTcSVqEcVBKnpLD0kIRXi2YWFfBBX9RaAqqSP4moIOHtiGp0y9GPqznA
 XHRnQlfVQ2c5i7aaz54htiwNSDeu/CbP2Sxs0J2rmM6IdGTiHVVcnqHuQ
 wDdgE1pJZdO00Zlkgs9Lep3+Ujsbz8woig/rVJIYO/ajt4g0S3b2Hgm7b
 mrHE8HEzusJ6Tj2sM1w+ceU+1c9i11Q/H42/P1HSwYN5f9w0HBxyBBqeW
 PjVwfU2pKNjnRApeR2JLMT3/xMfFrQyd4JZHmPhPXjkxaXvGoAtkTMRus
 24YT47ZQumcvn8U3cTufSWTkUfUtMWEz5XFzp6quJSQXMmQ6FRyIYccEO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="427777694"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="427777694"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 00:09:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="666984179"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="666984179"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga003.jf.intel.com with ESMTP; 28 Jun 2023 00:09:25 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 28 Jun 2023 12:45:27 +0530
Message-Id: <20230628071527.3579428-5-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230628071527.3579428-1-tejas.upadhyay@intel.com>
References: <20230628071527.3579428-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH V5 4/4] drm/xe: Make usable size of VRAM readable
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

Current size member of vram struct does not give
complete information as what "size" contains. Does
it contain reserved portions or not. Name it usable
size and accordingly describe other size members as
well.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 +-
 drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h          | 13 ++++++++++---
 drivers/gpu/drm/xe/xe_mmio.c                  |  6 +++---
 drivers/gpu/drm/xe/xe_query.c                 |  2 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  2 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  3 ++-
 7 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 99c35a4ef673..fad4c66a8226 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -83,7 +83,7 @@ initial_plane_bo(struct xe_device *xe,
 		 * We don't currently expect this to ever be placed in the
 		 * stolen portion.
 		 */
-		if (phys_base >= tile0->mem.vram.size) {
+		if (phys_base >= tile0->mem.vram.usable_size) {
 			drm_err(&xe->drm,
 				"Initial plane programming using invalid range, phys_base=%pa\n",
 				&phys_base);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 21fca198a882..e240df6c7ae6 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -125,7 +125,7 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 {
 	struct xe_tile *tile = mem_type_to_tile(xe, mem_type);
 
-	XE_BUG_ON(!tile->mem.vram.size);
+	XE_BUG_ON(!tile->mem.vram.usable_size);
 
 	places[*c] = (struct ttm_place) {
 		.mem_type = mem_type,
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index bd3e20ce3a4b..6afe37c8704e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -129,11 +129,18 @@ struct xe_tile {
 			resource_size_t io_size;
 			/** @base: offset of VRAM starting base */
 			resource_size_t base;
-			/** @size: size of VRAM. */
-			resource_size_t size;
+			/**
+			 * @usable_size: usable size of VRAM
+			 *
+			 * Usable size of VRAM excluding reserved portions
+			 * (e.g stolen mem)
+			 */
+			resource_size_t usable_size;
 			/**
 			 * @actual_physical_size: Actual VRAM size
-			 * including stolen mem for tile
+			 *
+			 * Actual VRAM size including reserved portions
+			 * (e.g stolen mem)
 			 */
 			resource_size_t actual_physical_size;
 			/** @mapping: pointer to VRAM mappable space */
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 7d92258cd35d..5effb21db9d4 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -289,13 +289,13 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		tile->mem.vram.base = tile_offset;
 
 		/* small bar can limit the visible size.  size accordingly */
-		tile->mem.vram.size = min_t(u64, vram_size, io_size);
+		tile->mem.vram.usable_size = min_t(u64, vram_size, io_size);
 		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
 
 		drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n", id, tile->id,
-			 &tile->mem.vram.io_start, &tile->mem.vram.size);
+			 &tile->mem.vram.io_start, &tile->mem.vram.usable_size);
 
-		if (tile->mem.vram.io_size < tile->mem.vram.size)
+		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
 			drm_info(&xe->drm, "VRAM[%u, %u]: CPU access limited to %pa\n", id,
 				 tile->id, &tile->mem.vram.io_size);
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 15e171ca7e62..9acbb27dfcab 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -188,7 +188,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->num_params = num_params;
 	config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
 		xe->info.devid | (xe->info.revid << 16);
-	if (xe_device_get_root_tile(xe)->mem.vram.size)
+	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
 		config->info[XE_QUERY_CONFIG_FLAGS] =
 			XE_QUERY_CONFIG_FLAGS_HAS_VRAM;
 	if (xe->info.enable_guc)
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index ac70486d09c3..e0bc2b60ab09 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -101,7 +101,7 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 	struct xe_device *xe = tile_to_xe(tile);
 	int err;
 
-	if (tile->mem.vram.size) {
+	if (tile->mem.vram.usable_size) {
 		err = xe_ttm_vram_mgr_init(tile, tile->mem.vram_mgr);
 		if (err)
 			return err;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 1a84abd35fcf..a10fd0366da3 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -360,7 +360,8 @@ int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
 	mgr->tile = tile;
 
 	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
-				      tile->mem.vram.size, tile->mem.vram.io_size,
+				      tile->mem.vram.usable_size,
+				      tile->mem.vram.io_size,
 				      PAGE_SIZE);
 }
 
-- 
2.25.1

