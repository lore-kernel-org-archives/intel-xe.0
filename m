Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29B8C77B7E
	for <intel-xe@archiver.kernel.org>; Fri, 28 Apr 2023 21:00:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC4910E15E;
	Fri, 28 Apr 2023 21:00:40 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1467C10E02F
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Apr 2023 21:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682715638; x=1714251638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p+XuMd6QrIMLkHy919/PjQDJXVY2XtStmiGn93iXS08=;
 b=XT91OeZRRGZMQ0YhO36d0GVQe2ZsBRJxk25EARfLbrebc4swH3j/tHE/
 H9RqE2BoCENeEdw2vmWEIKoCC4IQfy4dl2MjiIXkh1VWAb8Md901JesXS
 zG2bQEWAzCFR6PC71bJjfMfpQfcBGQZ+IRCisL67iX6+B/AWfVdZtvfXq
 UhuD4h+2TN0lGkoSrvTn7abW/V8Qc2Bn2hUOSo/Cli6/an6pUE0+RbNNq
 wKCBQcCnZz41G5Qnw2KJ6IcUtbjGCe7c/0+deLLdHPnAZ2GFzEEYcZnWr
 FrmDnDl9NVCG7hMQGENiYUkWTsnXR87usP0fYHppww9tcrMaZHV5uetIf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="346625017"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="346625017"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 14:00:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="819147172"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="819147172"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 14:00:36 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 28 Apr 2023 17:00:25 -0400
Message-Id: <20230428210028.4084872-2-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230428210028.4084872-1-michael.j.ruhl@intel.com>
References: <20230428210028.4084872-1-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/4] drm/xe: Rework size helper to be a little
 more correct
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
Cc: michael.j.ruhl@intel.com, himal.prasad.ghimiray@intel.com,
 matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The _total_vram_size helper is device based and is not complete.

Teach the helper to be tile aware and add the ability to size
DG1 correctly.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h   |  3 +-
 drivers/gpu/drm/xe/xe_mmio.c           | 72 +++++++++++++++++---------
 drivers/gpu/drm/xe/xe_mmio.h           |  2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 28 +++++-----
 4 files changed, 65 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 05a03129dc54..dac24b99f526 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -75,7 +75,8 @@
 #define GEN12_VE1_AUX_NV			_MMIO(0x42b8)
 #define   AUX_INV				REG_BIT(0)
 
-#define XEHP_TILE0_ADDR_RANGE			MCR_REG(0x4900)
+#define XEHP_TILE_ADDR_RANGE(_idx)		MCR_REG(0x4900 + (_idx) * 4)
+
 #define XEHP_FLAT_CCS_BASE_ADDR			MCR_REG(0x4910)
 
 #define CHICKEN_RASTER_1			MCR_REG(0x6204)
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 5536f84682c0..1ce8d8ca32b4 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -148,33 +148,56 @@ static bool xe_pci_resource_valid(struct pci_dev *pdev, int bar)
 	return true;
 }
 
-int xe_mmio_total_vram_size(struct xe_device *xe, u64 *vram_size, u64 *usable_size)
+/**
+ * xe_mmio_tile_vram_size - Collect vram size and off set information
+ * @gt: tile to get info for
+ * @vram_size: available vram (size - device reserved portions)
+ * @tile_size: actual vram size
+ * @tile_offset: physical start point in the vram address space
+ *
+ * There are 4 places for size information:
+ * - io size (from pci_resource_len of LMEM bar) (only used for small bar and DG1)
+ * - TILEx size (actual vram size)
+ * - GSMBASE offset (TILEx - "stolen")
+ * - CSSBASE offset (TILEx - CSS space necessary)
+ *
+ * NOTE: CSSBASE is always a lower/smaller offset then GSMBASE.
+ *
+ * The actual available size of memory is to the CCS or GSM base.
+ * NOTE: multi-tile bases will include the tile offset.
+ *
+ */
+int xe_mmio_tile_vram_size(struct xe_gt *gt, u64 *vram_size, u64 *tile_size, u64 *tile_offset)
 {
-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	u64 offset;
 	int err;
 	u32 reg;
 
-	if (!xe->info.has_flat_ccs)  {
-		*vram_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
-		if (usable_size)
-			*usable_size = min(*vram_size, xe_mmio_read64(gt, GEN12_GSMBASE.reg));
-		return 0;
-	}
-
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		return err;
 
-	reg = xe_gt_mcr_unicast_read_any(gt, XEHP_TILE0_ADDR_RANGE);
-	*vram_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
-	if (usable_size) {
+	/* actual size */
+	if (unlikely(gt->xe->info.platform == XE_DG1)) {
+		*tile_size = pci_resource_len(to_pci_dev(gt->xe->drm.dev), GEN12_LMEM_BAR);
+		*tile_offset = 0;
+	} else {
+		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_TILE_ADDR_RANGE(gt->info.id));
+		*tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
+		*tile_offset = (u64)REG_FIELD_GET(GENMASK(7, 1), reg) * SZ_1G;
+	}
+
+	/* minus device usage */
+	if (gt->xe->info.has_flat_ccs) {
 		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
-		*usable_size = (u64)REG_FIELD_GET(GENMASK(31, 8), reg) * SZ_64K;
-		drm_info(&xe->drm, "vram_size: 0x%llx usable_size: 0x%llx\n",
-			 *vram_size, *usable_size);
+		offset = (u64)REG_FIELD_GET(GENMASK(31, 8), reg) * SZ_64K;
+	} else {
+		offset = xe_mmio_read64(gt, GEN12_GSMBASE.reg);
 	}
 
+	/* remove the tile offset so we have just the available size */
+	*vram_size = offset - *tile_offset;
+
 	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 }
 
@@ -182,11 +205,12 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct xe_gt *gt;
-	u8 id;
-	u64 vram_size;
 	u64 original_size;
-	u64 usable_size;
+	u64 tile_offset;
+	u64 tile_size;
+	u64 vram_size;
 	int err;
+	u8 id;
 
 	if (!IS_DGFX(xe)) {
 		xe->mem.vram.mapping = 0;
@@ -211,25 +235,25 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 	gt = xe_device_get_gt(xe, 0);
 	original_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
 
-	err = xe_mmio_total_vram_size(xe, &vram_size, &usable_size);
+	err = xe_mmio_tile_vram_size(gt, &vram_size, &tile_size, &tile_offset);
 	if (err)
 		return err;
 
 	xe_resize_vram_bar(xe, vram_size);
 	xe->mem.vram.io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
-	xe->mem.vram.io_size = min(usable_size,
+	xe->mem.vram.io_size = min(vram_size,
 				   pci_resource_len(pdev, GEN12_LMEM_BAR));
 	xe->mem.vram.size = xe->mem.vram.io_size;
 
 	if (!xe->mem.vram.size)
 		return -EIO;
 
-	if (usable_size > xe->mem.vram.io_size)
+	if (vram_size > xe->mem.vram.io_size)
 		drm_warn(&xe->drm, "Restricting VRAM size to PCI resource size (%lluMiB->%lluMiB)\n",
-			 (u64)usable_size >> 20, (u64)xe->mem.vram.io_size >> 20);
+			 (u64)vram_size >> 20, (u64)xe->mem.vram.io_size >> 20);
 
 	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
-	xe->mem.vram.size = min_t(u64, xe->mem.vram.size, usable_size);
+	xe->mem.vram.size = min_t(u64, xe->mem.vram.size, vram_size);
 
 	drm_info(&xe->drm, "TOTAL VRAM: %pa, %pa\n", &xe->mem.vram.io_start, &xe->mem.vram.size);
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 1a32e0f52261..556cf3d9e4f5 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -120,6 +120,6 @@ static inline bool xe_mmio_in_range(const struct xe_mmio_range *range, u32 reg)
 }
 
 int xe_mmio_probe_vram(struct xe_device *xe);
-int xe_mmio_total_vram_size(struct xe_device *xe, u64 *vram_size, u64 *flat_ccs_base);
+int xe_mmio_tile_vram_size(struct xe_gt *gt, u64 *vram_size, u64 *tile_size, u64 *tile_base);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 31887fec1073..98bc5049a3f5 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -51,27 +51,27 @@ bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe)
 	return GRAPHICS_VERx100(xe) < 1270 && !IS_DGFX(xe);
 }
 
-static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
+static s64 detect_bar2_dgfx(struct xe_gt *gt, struct xe_ttm_stolen_mgr *mgr)
 {
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	struct xe_gt *gt = to_gt(xe);
-	u64 vram_size, stolen_size;
-	int err;
+	u64 stolen_size;
+	u64 tile_offset;
+	u64 tile_size;
+	u64 vram_size;
 
-	err = xe_mmio_total_vram_size(xe, &vram_size, NULL);
-	if (err) {
-		drm_info(&xe->drm, "Querying total vram size failed\n");
+	if (xe_mmio_tile_vram_size(gt, &vram_size, &tile_size, &tile_offset)) {
+		drm_info(&gt->xe->drm, "Querying total vram size failed\n");
 		return 0;
 	}
 
 	/* Use DSM base address instead for stolen memory */
-	mgr->stolen_base = xe_mmio_read64(gt, GEN12_DSMBASE.reg) & GEN12_BDSM_MASK;
-	if (drm_WARN_ON(&xe->drm, vram_size < mgr->stolen_base))
+	mgr->stolen_base = (xe_mmio_read64(gt, GEN12_DSMBASE.reg) & GEN12_BDSM_MASK) - tile_offset;
+	if (drm_WARN_ON(&gt->xe->drm, tile_size < mgr->stolen_base))
 		return 0;
 
-	stolen_size = vram_size - mgr->stolen_base;
-	if (mgr->stolen_base + stolen_size <= pci_resource_len(pdev, 2))
-		mgr->io_base = pci_resource_start(pdev, 2) + mgr->stolen_base;
+	stolen_size = tile_size - mgr->stolen_base;
+
+	if (mgr->stolen_base + stolen_size <= tile_size)
+		mgr->io_base = gt->mem.vram.io_start + mgr->stolen_base;
 
 	/*
 	 * There may be few KB of platform dependent reserved memory at the end
@@ -139,7 +139,7 @@ void xe_ttm_stolen_mgr_init(struct xe_device *xe)
 	int err;
 
 	if (IS_DGFX(xe))
-		stolen_size = detect_bar2_dgfx(xe, mgr);
+		stolen_size = detect_bar2_dgfx(to_gt(xe), mgr);
 	else if (GRAPHICS_VERx100(xe) >= 1270)
 		stolen_size = detect_bar2_integrated(xe, mgr);
 	else
-- 
2.39.2

