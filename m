Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19772C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 21:10:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D1210E4DF;
	Tue, 14 Nov 2023 21:10:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1446410E4DC
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 21:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699996235; x=1731532235;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o6Piu19eaUca4oUqCIqJR1fn2GoIIw5cOs9U94SJ4FI=;
 b=bX484/RWSPx+tauAoxrZvJTff/PQLvtSocXOy8SWmLo1QpPZt4Fw1iCC
 GHtFhznpcLp5nOlcEw+LGtNTF5U4pZhqTaRRwAq5qDR7OrzvKgNw1v+1v
 jgrxOptz0HBhysGmkwiJxAsxSSqrf4OYfxtrQ3jnVJlr1cjdS2Dc8kc+A
 KoWTqp/HVEaMA5E+53CwF+d41O+UhG1UF2xrRC/XpH1LHJwOa4IcboXno
 c4iwnWWkMyUST3ykg1cU2juQVYvrbYxQSyOmBY8S57oU2CLLfuX6fstcf
 FF7RaQSCRvsyqcNaGvhzmtx7lcHhPzoBTGHNUOVgeykXdT+i/IMqxeSY+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381143572"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="381143572"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 13:10:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="830732535"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; d="scan'208";a="830732535"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 13:10:33 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Nov 2023 13:10:33 -0800
Message-Id: <20231114211033.30945-1-brian.welty@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Make xe_mmio_tile_vram_size() static
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

During xe_mmio_probe_vram(), we already store the values returned from
xe_mmio_tile_vram_size() into the xe_tile structures.
There is no need to call xe_mmio_tile_vram_size() again later during
setup of the STOLEN region. Just use the values stored in the root tile.

Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c           | 3 ++-
 drivers/gpu/drm/xe/xe_mmio.h           | 1 -
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 7 ++-----
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index d8f9fabf715e..0baaef53f3a7 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -201,7 +201,8 @@ static int xe_determine_lmem_bar_size(struct xe_device *xe)
  * NOTE: multi-tile bases will include the tile offset.
  *
  */
-int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size, u64 *tile_size, u64 *tile_offset)
+static int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size,
+				  u64 *tile_size, u64 *tile_offset)
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *gt = tile->primary_gt;
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index ae09f777d711..54de7a433696 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -138,7 +138,6 @@ static inline bool xe_mmio_in_range(const struct xe_gt *gt,
 }
 
 int xe_mmio_probe_vram(struct xe_device *xe);
-int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size, u64 *tile_size, u64 *tile_base);
 u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 0c533d36791d..837b522cb91f 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -62,12 +62,9 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 	u64 stolen_size;
 	u64 tile_offset;
 	u64 tile_size;
-	u64 vram_size;
 
-	if (xe_mmio_tile_vram_size(tile, &vram_size, &tile_size, &tile_offset)) {
-		drm_err(&xe->drm, "Querying total vram size failed\n");
-		return 0;
-	}
+	tile_offset = tile->mem.vram.io_start - xe->mem.vram.io_start;
+	tile_size = tile->mem.vram.actual_physical_size;
 
 	/* Use DSM base address instead for stolen memory */
 	mgr->stolen_base = (xe_mmio_read64_2x32(mmio, DSMBASE) & BDSM_MASK) - tile_offset;
-- 
2.38.0

