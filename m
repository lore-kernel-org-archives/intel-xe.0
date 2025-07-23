Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CA0C83F1A
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 20:20:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A2410E069;
	Wed, 23 Jul 2025 20:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EGKYHXJ0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE1510E02D
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 20:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753302049; x=1784838049;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=fId4rCFFvE0GenZYPZ6ok5QOGTFblNKPAqxpWWmaT3s=;
 b=EGKYHXJ0qNXgCG1iJxtbb4h7Qx4/0pSwX+FF397rLNCwo+pXdfOKqL0/
 5GmSVkRNL+Cl/xeboS1qgP8R7cCZRO1kYd7oIa4WHf+3E1x3soGwNWTsJ
 ch3gw+6aTZf9xgjCLfVlkLe1q45OeiVwwgjVDtKd/iveqQru4GslgF3M2
 QCCEDRHcM7hsym3p75kL1/9o4+WLIiRrL34c4XoMOM2dx4xNm8+IPtbgB
 3fdd6eEqVpsp3UQEkA9g1XCcd9HFsYcbf5IsQrQHLmEbY1iGwPbzRIpB1
 y+VS/oeBKd2w8sY2m8N3xFaDQ0hQ9kl3co+711qJF3QrC0PA6CQ8SBvBs Q==;
X-CSE-ConnectionGUID: i8590uMeRvG6nkthr9EMhw==
X-CSE-MsgGUID: a/fgvBkKTXmAti2gGjEtDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55558269"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="55558269"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 13:20:49 -0700
X-CSE-ConnectionGUID: 6CE6pe9/TcmPEWQIl6rikA==
X-CSE-MsgGUID: BpB9eC7LSl2ROP4fvqzR8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="190651576"
Received: from uaeoff-desk2.amr.corp.intel.com (HELO
 gjsousa-mobl2.amr.corp.intel.com) ([10.125.108.176])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 13:20:48 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Wed, 23 Jul 2025 17:20:09 -0300
Subject: [PATCH 1/2] drm/xe: Probe for tile count during device info
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-gt_count-improvements-v1-1-3016134db9ea@intel.com>
References: <20250723-gt_count-improvements-v1-0-3016134db9ea@intel.com>
In-Reply-To: <20250723-gt_count-improvements-v1-0-3016134db9ea@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

The function mmio_multi_tile_setup() does not look like the proper
location for probing for the number of existing tiles in the hardware.
It should not be that function's responsibility and such information
should instead be already available when it gets called.

The fact that we need to adjust gt_count is a symptom of that.

Move probing of available tile count to a dedicated function named
xe_info_probe_tile_count() and call it from xe_info_init(), which seems
like a more appropriate place for that.

With that move, we don't need and should not adjust gt_count anymore,
because the function gets called before the original initialization of
that field.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 33 ---------------------------------
 drivers/gpu/drm/xe/xe_pci.c  | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index e4db8d58ea2d..ef6f3ea573a2 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -58,7 +58,6 @@ static void tiles_fini(void *arg)
 static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
 {
 	struct xe_tile *tile;
-	struct xe_gt *gt;
 	u8 id;
 
 	/*
@@ -68,38 +67,6 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
 	if (xe->info.tile_count == 1)
 		return;
 
-	/* Possibly override number of tile based on configuration register */
-	if (!xe->info.skip_mtcfg) {
-		struct xe_mmio *mmio = xe_root_tile_mmio(xe);
-		u8 tile_count, gt_count;
-		u32 mtcfg;
-
-		/*
-		 * Although the per-tile mmio regs are not yet initialized, this
-		 * is fine as it's going to the root tile's mmio, that's
-		 * guaranteed to be initialized earlier in xe_mmio_probe_early()
-		 */
-		mtcfg = xe_mmio_read32(mmio, XEHP_MTCFG_ADDR);
-		tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
-
-		if (tile_count < xe->info.tile_count) {
-			drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
-				 xe->info.tile_count, tile_count);
-			xe->info.tile_count = tile_count;
-
-			/*
-			 * We've already setup gt_count according to the full
-			 * tile count.  Re-calculate it to only include the GTs
-			 * that belong to the remaining tile(s).
-			 */
-			gt_count = 0;
-			for_each_gt(gt, xe, id)
-				if (gt->info.id < tile_count * xe->info.max_gt_per_tile)
-					gt_count++;
-			xe->info.gt_count = gt_count;
-		}
-	}
-
 	for_each_remote_tile(tile, xe, id)
 		xe_mmio_init(&tile->mmio, tile, xe->mmio.regs + id * tile_mmio_size, SZ_4M);
 }
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index f4ea13527945..4f5d4f0a8173 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -17,6 +17,7 @@
 
 #include "display/xe_display.h"
 #include "regs/xe_gt_regs.h"
+#include "regs/xe_regs.h"
 #include "xe_device.h"
 #include "xe_drv.h"
 #include "xe_gt.h"
@@ -603,6 +604,35 @@ static int xe_info_init_early(struct xe_device *xe,
 	return 0;
 }
 
+/*
+ * Possibly override number of tile based on configuration register.
+ */
+static void xe_info_probe_tile_count(struct xe_device *xe)
+{
+	struct xe_mmio *mmio;
+	u8 tile_count;
+	u32 mtcfg;
+
+	if (xe->info.skip_mtcfg)
+		return;
+
+	mmio = xe_root_tile_mmio(xe);
+
+	/*
+	 * Although the per-tile mmio regs are not yet initialized, this
+	 * is fine as it's going to the root tile's mmio, that's
+	 * guaranteed to be initialized earlier in xe_mmio_probe_early()
+	 */
+	mtcfg = xe_mmio_read32(mmio, XEHP_MTCFG_ADDR);
+	tile_count = REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
+
+	if (tile_count < xe->info.tile_count) {
+		drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
+			 xe->info.tile_count, tile_count);
+		xe->info.tile_count = tile_count;
+	}
+}
+
 /*
  * Initialize device info content that does require knowledge about
  * graphics / media IP version.
@@ -677,6 +707,8 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.has_usm = graphics_desc->has_usm;
 	xe->info.has_64bit_timestamp = graphics_desc->has_64bit_timestamp;
 
+	xe_info_probe_tile_count(xe);
+
 	for_each_remote_tile(tile, xe, id) {
 		int err;
 

-- 
2.50.1

