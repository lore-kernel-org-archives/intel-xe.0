Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAE7C77B6E
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 20:17:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049CF10E58D;
	Mon,  3 Apr 2023 20:17:16 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B409D10E564
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 20:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680553033; x=1712089033;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MqtW+h/POoU1XkXfH15Jo9Bnv+dWiwzX+kyeJ1KhSfI=;
 b=Ct9b1/ntVljRlMMyjEz2e8kmzjzgV2nDE5/u8oh1crCgeOERGaLmnQId
 2dQK+9BM/DitKZqOyXINrLlcLzjtIusAFQ50BKKHUXLePTRJXH02+O82R
 9kWIXZyxf+Umwg3rb2cfQKPZCyqoTQb2GZp2W+C9MMGJgn3LhPsdohDE7
 Gva5WiidTeW7O/ioh4Tg5la9Zi3RanvAVugccCvXFcMrf5TjCxfPffDiQ
 UpNzODrDeegDOGtiii7ZxuF2lWaIZU538g/7X464vFW/urqawKmmsgdb0
 u+oX9fAfGwMgSuHFVuYEAHMo/V6noJjUzsw6h1O9Igmgd/1IH9lBTuYLY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="330580147"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="330580147"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 13:17:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="636236502"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="636236502"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 13:17:13 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  3 Apr 2023 13:17:02 -0700
Message-Id: <20230403201702.996400-7-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403201702.996400-1-matthew.d.roper@intel.com>
References: <20230403201702.996400-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/6] drm/xe: Select graphics/media descriptors
 from GMD_ID
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

Hook up dummy graphics_desc and media_desc structures on platforms that
use GMD_ID.  When such a platform is probed, the IP version will be read
from the hardware's GMD_ID registers and that version number will be
used to select a graphics/media descriptor with the appropriate settings
for the detected IP.

If a GMD_ID platform reports a graphics version the driver does not
recognize and support, device probe will be aborted.  If an unrecognized
media version is reported the device probe will leave media
uninitialized and continue.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |   6 +
 drivers/gpu/drm/xe/xe_pci.c          | 161 +++++++++++++++++++++------
 2 files changed, 136 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index f45251df5715..2d265dbb7651 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -22,6 +22,12 @@
 #define FORCEWAKE_ACK_MEDIA_VDBOX_GEN11(n)	_MMIO(0xd50 + (n) * 4)
 #define FORCEWAKE_ACK_MEDIA_VEBOX_GEN11(n)	_MMIO(0xd70 + (n) * 4)
 #define FORCEWAKE_ACK_RENDER_GEN9		_MMIO(0xd84)
+
+#define GMD_ID					_MMIO(0xd8c)
+#define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
+#define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
+#define   GMD_ID_STEP				REG_GENMASK(5, 0)
+
 #define FORCEWAKE_ACK_GT_MTL			_MMIO(0xdfc)
 
 #define GEN9_LNCFCMOCS(i)			_MMIO(0xb020 + (i) * 4)	/* L3 Cache Control */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index d634e781858a..62685b14257b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -15,6 +15,7 @@
 #include <drm/xe_pciids.h>
 
 #include "regs/xe_regs.h"
+#include "regs/xe_gt_regs.h"
 #include "xe_device.h"
 #include "xe_display.h"
 #include "xe_drv.h"
@@ -99,6 +100,14 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 
 #define NOP(x)	x
 
+static const struct xe_graphics_desc graphics_gmdid = {
+	/*
+	 * Unset graphics version implies GMD_ID support; driver will read
+	 * the IP version from hardware and then select a more appropriate
+	 * graphics descriptor.
+	 */
+};
+
 static const struct xe_graphics_desc graphics_xelp = {
 	.ver = 12,
 	.rel = 0,
@@ -164,9 +173,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
 };
 
 static const struct xe_graphics_desc graphics_xelpg = {
-	.ver = 12,
-	.rel = 70,
-
 	.hw_engine_mask =
 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
 		BIT(XE_HW_ENGINE_CCS0),
@@ -175,6 +181,14 @@ static const struct xe_graphics_desc graphics_xelpg = {
 	.has_flat_ccs = 0,
 };
 
+static const struct xe_media_desc media_gmdid = {
+	/*
+	 * Unset graphics version implies GMD_ID support; driver will read
+	 * the IP version from hardware and then select a more appropriate
+	 * media descriptor.
+	 */
+};
+
 static const struct xe_media_desc media_xelp = {
 	.ver = 12,
 	.rel = 0,
@@ -194,9 +208,6 @@ static const struct xe_media_desc media_xehpm = {
 };
 
 static const struct xe_media_desc media_xelpmp = {
-	.ver = 13,
-	.rel = 0,
-
 	.hw_engine_mask =
 		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
 		BIT(XE_HW_ENGINE_VECS0),	/* TODO: add GSC0 */
@@ -298,12 +309,8 @@ static const struct xe_gt_desc xelpmp_gts[] = {
 };
 
 static const struct xe_device_desc mtl_desc = {
-	/*
-	 * FIXME:  Real graphics/media IP will be mapped from hardware
-	 * GMD_ID register.  Hardcoded assignments here will go away soon.
-	 */
-	.graphics = &graphics_xelpg,
-	.media = &media_xelpmp,
+	.graphics = &graphics_gmdid,
+	.media = &media_gmdid,
 	.require_force_probe = true,
 	PLATFORM(XE_METEORLAKE),
 	.extra_gts = xelpmp_gts,
@@ -414,9 +421,91 @@ static void xe_pci_remove(struct pci_dev *pdev)
 	pci_set_drvdata(pdev, NULL);
 }
 
+static u32 peek_gmdid(struct xe_device *xe, u32 gmdid_offset)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
+	u32 ver;
+
+	if (!map) {
+		drm_err(&xe->drm, "Failed to read GMD_ID (%#x) from PCI BAR.\n",
+			gmdid_offset);
+		return 0;
+	}
+
+	ver = ioread32(map);
+	pci_iounmap(pdev, map);
+
+	return REG_FIELD_GET(GMD_ID_ARCH_MASK, ver) * 100 +
+		REG_FIELD_GET(GMD_ID_RELEASE_MASK, ver);
+}
+
+static void handle_gmdid(struct xe_device *xe,
+			 const struct xe_device_desc *desc,
+			 const struct xe_graphics_desc **graphics,
+			 const struct xe_media_desc **media)
+{
+	u32 ver;
+
+	if (desc->graphics->ver) {
+		/*
+		 * Pre-GMD_ID platform; device descriptor already points to
+		 * the appropriate graphics descriptor.
+		 */
+		*graphics = desc->graphics;
+		xe->info.graphics_verx100 = (*graphics)->ver * 100 + (*graphics)->rel;
+	} else {
+		/*
+		 * GMD_ID platform; read IP version from hardware and select
+		 * graphics descriptor based on the result.
+		 */
+		ver = peek_gmdid(xe, GMD_ID.reg);
+		switch (ver) {
+		case 1270:
+		case 1271:
+			*graphics = &graphics_xelpg;
+			xe->info.graphics_verx100 = ver;
+			break;
+		default:
+			drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
+				ver / 100, ver % 100);
+		}
+	}
+
+	if (!desc->media)
+		/* No media support at all */
+		return;
+
+	if (desc->media && desc->media->ver) {
+		/*
+		 * Pre-GMD_ID platform; device descriptor already points to
+		 * the appropriate media descriptor.
+		 */
+		*media = desc->media;
+		xe->info.media_verx100 = (*media)->ver * 100 + (*media)->rel;
+	} else {
+		/*
+		 * GMD_ID platform; read IP version from hardware and select
+		 * media descriptor based on the result.
+		 */
+		ver = peek_gmdid(xe, GMD_ID.reg + 0x380000);
+		switch (ver) {
+		case 1300:
+			*media = &media_xelpmp;
+			xe->info.media_verx100 = ver;
+			break;
+		default:
+			drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
+				ver / 100, ver % 100);
+		}
+	}
+}
+
 static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	const struct xe_device_desc *desc = (void *)ent->driver_data;
+	const struct xe_graphics_desc *graphics_desc = NULL;
+	const struct xe_media_desc *media_desc = NULL;
 	const struct xe_subplatform_desc *spd;
 	struct xe_device *xe;
 	struct xe_gt *gt;
@@ -445,22 +534,32 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (IS_ERR(xe))
 		return PTR_ERR(xe);
 
-	xe->info.graphics_verx100 = desc->graphics->ver * 100 +
-				    desc->graphics->rel;
-	if (desc->media)
-		xe->info.media_verx100 = desc->media->ver * 100 +
-					 desc->media->rel;
+	/*
+	 * If this platform supports GMD_ID, we'll detect the proper IP
+	 * descriptor to use from hardware registers.
+	 */
+	handle_gmdid(xe, desc, &graphics_desc, &media_desc);
+
+	/*
+	 * If we couldn't detect the graphics IP, that's considered a fatal
+	 * error and we should abort driver load.  Failing to detect media
+	 * IP is non-fatal; we'll just proceed without enabling media support.
+	 */
+	if (!graphics_desc)
+		return -ENODEV;
+
 	xe->info.is_dgfx = desc->is_dgfx;
 	xe->info.platform = desc->platform;
-	xe->info.dma_mask_size = desc->graphics->dma_mask_size;
-	xe->info.vram_flags = desc->graphics->vram_flags;
-	xe->info.vm_max_level = desc->graphics->vm_max_level;
-	xe->info.supports_usm = desc->graphics->supports_usm;
-	xe->info.has_asid = desc->graphics->has_asid;
-	xe->info.has_flat_ccs = desc->graphics->has_flat_ccs;
 	xe->info.has_4tile = desc->has_4tile;
-	xe->info.has_range_tlb_invalidation = desc->graphics->has_range_tlb_invalidation;
-	xe->info.has_link_copy_engine = desc->graphics->has_link_copy_engine;
+
+	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
+	xe->info.vram_flags = graphics_desc->vram_flags;
+	xe->info.vm_max_level = graphics_desc->vm_max_level;
+	xe->info.supports_usm = graphics_desc->supports_usm;
+	xe->info.has_asid = graphics_desc->has_asid;
+	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
+	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
+	xe->info.has_link_copy_engine = graphics_desc->has_link_copy_engine;
 
 	/*
 	 * All platforms have at least one primary GT.  Any platform with media
@@ -471,7 +570,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	 * FIXME: 'tile_count' here is misnamed since the rest of the driver
 	 * treats it as the number of GTs rather than just the number of tiles.
 	 */
-	xe->info.tile_count = 1 + desc->graphics->max_remote_tiles;
+	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
 	if (MEDIA_VER(xe) >= 13)
 		xe->info.tile_count++;
 
@@ -488,9 +587,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 			gt->info.type = XE_GT_TYPE_MAIN;
 			gt->info.vram_id = id;
 
-			gt->info.__engine_mask = desc->graphics->hw_engine_mask;
-			if (MEDIA_VER(xe) < 13 && desc->media)
-				gt->info.__engine_mask |= desc->media->hw_engine_mask;
+			gt->info.__engine_mask = graphics_desc->hw_engine_mask;
+			if (MEDIA_VER(xe) < 13 && media_desc)
+				gt->info.__engine_mask |= media_desc->hw_engine_mask;
 
 			gt->mmio.adj_limit = 0;
 			gt->mmio.adj_offset = 0;
@@ -498,8 +597,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 			gt->info.type = desc->extra_gts[id - 1].type;
 			gt->info.vram_id = desc->extra_gts[id - 1].vram_id;
 			gt->info.__engine_mask = (gt->info.type == XE_GT_TYPE_MEDIA) ?
-				desc->media->hw_engine_mask :
-				desc->graphics->hw_engine_mask;
+				media_desc->hw_engine_mask :
+				graphics_desc->hw_engine_mask;
 			gt->mmio.adj_limit =
 				desc->extra_gts[id - 1].mmio_adj_limit;
 			gt->mmio.adj_offset =
-- 
2.39.2

