Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0893BC44520
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 22:20:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE1010E206;
	Mon, 20 Jul 2026 22:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EgdxRjop";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16FD10E206
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jul 2026 22:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784586010; x=1816122010;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xiSMPsOhcQRBkT1IagWtzxWO2/sqGzat0MiYgycDE1g=;
 b=EgdxRjop2TdF80WEPWIWzLZaEJ7RWZwOokD9raDvGhob11pwqdv/yXxg
 Nz29fskWA3Bws9w4x52hUOKP10rnzCOp5oCBfgS9P0gxDRh6P2aFRB5SB
 MBTJ0hNfdWlOp1ZoSoBtYsK5NfARVqNUwHlT9tIYoTVAe3JDowYgQErtg
 aXSaI74H87dNup/RXhMRZVKmHmjB4NsHvqhJwxgJzK/iqaPgRCfLXM2wC
 e4FX+2q5+SVTDbuO6wfmtjRlUNxFAn+pnU+8jK82tFbnWVB/0kApJMZUJ
 Z+JxXuk0+PSG3OX+PXVrZUokt8CyzIrOKdcx4EKMFCqQ5Zvv8osRNQYm6 A==;
X-CSE-ConnectionGUID: NeHu2rT1TFeozmdj7HLs6Q==
X-CSE-MsgGUID: nMB3jRYoTk6xflCABlDnHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85381777"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="85381777"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 15:20:10 -0700
X-CSE-ConnectionGUID: K/JF4lr5QO+ciR3oBNLeww==
X-CSE-MsgGUID: 43Zm9TUOSLi1iQQzLnGnSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="261144945"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 15:20:09 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 1/2] drm/xe/wopcm: Use the size from HW when excluding the
 wopcm range from GGTT
Date: Mon, 20 Jul 2026 15:19:56 -0700
Message-ID: <20260720221956.3875196-3-daniele.ceraolospurio@intel.com>
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

The WOPCM size is available in HW (we read it during the stolen memory
init), so when excluding the WOPCM range from the base of GGTT we can
use the HW value instead of an hardcoded one (which needs to be updated
any time the config changes on newer HW). This value is not available to
VFs, but the only use VF has for it is to make sure that the PF has done
its programming correctly, so we can just trust PF and drop the checks.
Since the WOPCM is a per-tile value, we can store its size in the tile
structure and re-use it for both GGTT and stolen memory setup.


Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: drop wopcm size usage from VF
---
 drivers/gpu/drm/xe/xe_device.c         |  4 ++
 drivers/gpu/drm/xe/xe_ggtt.c           | 15 +++++---
 drivers/gpu/drm/xe/xe_tile.c           | 38 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile.h           |  3 ++
 drivers/gpu/drm/xe/xe_tile_types.h     |  3 ++
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 53 +++++++++++---------------
 6 files changed, 79 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4eed9a251e65..9530db398067 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -960,6 +960,10 @@ int xe_device_probe(struct xe_device *xe)
 			xe->info.has_cached_pt = false;
 
 	for_each_tile(tile, xe, id) {
+		err = xe_tile_wopcm_init(tile);
+		if (err)
+			return err;
+
 		err = xe_ggtt_init_early(tile->mem.ggtt);
 		if (err)
 			return err;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8ec23862477f..b544e5681c18 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -28,11 +28,11 @@
 #include "xe_pm.h"
 #include "xe_res_cursor.h"
 #include "xe_sriov.h"
+#include "xe_tile.h"
 #include "xe_tile_printk.h"
 #include "xe_tile_sriov_vf.h"
 #include "xe_tlb_inval.h"
 #include "xe_wa.h"
-#include "xe_wopcm.h"
 
 /**
  * DOC: Global Graphics Translation Table (GGTT)
@@ -392,11 +392,13 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	u64 ggtt_start, ggtt_size;
 	unsigned int gsm_size;
-	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
 	int err;
 
 	if (!IS_SRIOV_VF(xe)) {
+		u64 wopcm = xe_tile_wopcm_size(ggtt->tile);
+
 		if (GRAPHICS_VERx100(xe) >= 1250)
 			gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
 		else
@@ -411,8 +413,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 		ggtt_start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
 		ggtt_size = xe_tile_sriov_vf_ggtt(ggtt->tile);
 
-		if (ggtt_start < wopcm ||
-		    ggtt_start + ggtt_size > GUC_GGTT_TOP) {
+		if (ggtt_start + ggtt_size > GUC_GGTT_TOP) {
 			xe_tile_err(ggtt->tile, "Invalid GGTT configuration: %#llx-%#llx\n",
 				    ggtt_start, ggtt_start + ggtt_size - 1);
 			return -ERANGE;
@@ -602,13 +603,15 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
  * This function may be called multiple times during recovery, but if
  * @new_start is unchanged from the current base, it's a noop.
  *
- * @new_start should be a value between xe_wopcm_size() and #GUC_GGTT_TOP.
+ * @new_start should be a value above the wopcm size and below #GUC_GGTT_TOP.
+ * VFs can't access the register with the wopcm size info, so we trust that PF
+ * has done the correct programming for that and we just assert on the upper
+ * bound.
  */
 void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
 {
 	guard(mutex)(&ggtt->lock);
 
-	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
 	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
 
 	/* pairs with READ_ONCE in xe_ggtt_node_addr() */
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 74d925a337b7..3bc0baf0e9ce 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -13,15 +13,18 @@
 #include "xe_ggtt.h"
 #include "xe_memirq.h"
 #include "xe_migrate.h"
+#include "xe_mmio.h"
 #include "xe_pcode.h"
 #include "xe_sa.h"
 #include "xe_svm.h"
 #include "xe_tile.h"
+#include "xe_tile_printk.h"
 #include "xe_tile_sysfs.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vram.h"
 #include "xe_vram_types.h"
 #include "xe_wa.h"
+#include "regs/xe_regs.h"
 
 /**
  * DOC: Multi-tile Design
@@ -225,6 +228,41 @@ void xe_tile_migrate_wait(struct xe_tile *tile)
 	xe_migrate_wait(tile->migrate);
 }
 
+int xe_tile_wopcm_init(struct xe_tile *tile)
+{
+	u32 wopcm_size;
+	u64 val;
+
+	if (IS_SRIOV_VF(tile_to_xe(tile)))
+		return 0;
+
+	val = xe_mmio_read64_2x32(&tile->mmio, STOLEN_RESERVED);
+	val = REG_FIELD_GET64(WOPCM_SIZE_MASK, val);
+
+	switch (val) {
+	case 0x5 ... 0x6:
+		val--;
+		fallthrough;
+	case 0x0 ... 0x3:
+		wopcm_size = (1U << val) * SZ_1M;
+		break;
+	default:
+		WARN(1, "Missing case wopcm_size=%llx\n", val);
+		return -EIO;
+	}
+
+	tile->mem.wopcm_size = wopcm_size;
+
+	xe_tile_info(tile, "WOPCM size: %uKB\n", wopcm_size / 1024);
+	return 0;
+}
+
+u32 xe_tile_wopcm_size(struct xe_tile *tile)
+{
+	xe_assert(tile_to_xe(tile), tile->mem.wopcm_size != 0);
+	return tile->mem.wopcm_size;
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 /**
  * xe_tile_local_pagemap() - Return a pointer to the tile's local drm_pagemap if any
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index a2a2c0e936b8..5ae9f6753f96 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -19,6 +19,9 @@ int xe_tile_alloc_vram(struct xe_tile *tile);
 
 void xe_tile_migrate_wait(struct xe_tile *tile);
 
+int xe_tile_wopcm_init(struct xe_tile *tile);
+u32 xe_tile_wopcm_size(struct xe_tile *tile);
+
 static inline bool xe_tile_is_root(struct xe_tile *tile)
 {
 	return tile->id == 0;
diff --git a/drivers/gpu/drm/xe/xe_tile_types.h b/drivers/gpu/drm/xe/xe_tile_types.h
index 0048100ccb72..e2769f5f0a89 100644
--- a/drivers/gpu/drm/xe/xe_tile_types.h
+++ b/drivers/gpu/drm/xe/xe_tile_types.h
@@ -84,6 +84,9 @@ struct xe_tile {
 		/** @mem.ggtt: Global graphics translation table */
 		struct xe_ggtt *ggtt;
 
+		/** @mem.wopcm_size: Size of the WOPCM for this tile */
+		u32 wopcm_size;
+
 		/**
 		 * @mem.kernel_bb_pool: Pool from which batchbuffers are allocated.
 		 *
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 60f39efb02d0..0af562017a70 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -19,6 +19,7 @@
 #include "xe_device.h"
 #include "xe_gt_printk.h"
 #include "xe_mmio.h"
+#include "xe_tile.h"
 #include "xe_sriov.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vram.h"
@@ -38,34 +39,12 @@ bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe)
 	return GRAPHICS_VERx100(xe) < 1270 && !IS_DGFX(xe);
 }
 
-static u32 get_wopcm_size(struct xe_device *xe)
-{
-	u32 wopcm_size;
-	u64 val;
-
-	val = xe_mmio_read64_2x32(xe_root_tile_mmio(xe), STOLEN_RESERVED);
-	val = REG_FIELD_GET64(WOPCM_SIZE_MASK, val);
-
-	switch (val) {
-	case 0x5 ... 0x6:
-		val--;
-		fallthrough;
-	case 0x0 ... 0x3:
-		wopcm_size = (1U << val) * SZ_1M;
-		break;
-	default:
-		WARN(1, "Missing case wopcm_size=%llx\n", val);
-		wopcm_size = 0;
-	}
-
-	return wopcm_size;
-}
-
 static u64 detect_lmembar_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 {
-	struct xe_vram_region *tile_vram = xe_device_get_root_tile(xe)->mem.vram;
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	struct xe_vram_region *tile_vram = root_tile->mem.vram;
 	resource_size_t tile_io_start = xe_vram_region_io_start(tile_vram);
-	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+	struct xe_mmio *mmio = &root_tile->mmio;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	u64 stolen_size, wopcm_size;
 	u64 tile_offset;
@@ -79,8 +58,14 @@ static u64 detect_lmembar_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *m
 	if (drm_WARN_ON(&xe->drm, tile_size < mgr->stolen_base))
 		return 0;
 
-	/* Carve out the top of DSM as it contains the reserved WOPCM region */
-	wopcm_size = get_wopcm_size(xe);
+	/*
+	 * Carve out the top of DSM as it contains the reserved WOPCM region.
+	 * Note that the WOPCM region is per-tile, but the code below only looks
+	 * at the root tile values for both stolen and WOPCM; this works because
+	 * on PVC there is no driver-usable stolen, so stolen_size is 0 for
+	 * both tiles, but if that changes we'll need to rework this.
+	 */
+	wopcm_size = xe_tile_wopcm_size(root_tile);
 	if (drm_WARN_ON(&xe->drm, !wopcm_size))
 		return 0;
 
@@ -105,11 +90,12 @@ static u64 detect_lmembar_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *m
 static u32 detect_lmembar_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	struct xe_gt *media_gt = xe_device_get_root_tile(xe)->media_gt;
+	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	struct xe_gt *media_gt = root_tile->media_gt;
 	u32 stolen_size, wopcm_size;
 	u32 ggc, gms;
 
-	ggc = xe_mmio_read32(xe_root_tile_mmio(xe), GGC);
+	ggc = xe_mmio_read32(&root_tile->mmio, GGC);
 
 	/*
 	 * Check GGMS: it should be fixed 0x3 (8MB), which corresponds to the
@@ -141,8 +127,13 @@ static u32 detect_lmembar_integrated(struct xe_device *xe, struct xe_ttm_stolen_
 		return 0;
 	}
 
-	/* Carve out the top of DSM as it contains the reserved WOPCM region */
-	wopcm_size = get_wopcm_size(xe);
+	/*
+	 * Carve out the top of DSM as it contains the reserved WOPCM region. We
+	 * assume only the root tile is present, so we don't need to worry about
+	 * the WOPCM size for the remote tiles.
+	 */
+	xe_assert(xe, xe->info.tile_count == 1);
+	wopcm_size = xe_tile_wopcm_size(root_tile);
 	if (drm_WARN_ON(&xe->drm, !wopcm_size))
 		return 0;
 
-- 
2.43.0

