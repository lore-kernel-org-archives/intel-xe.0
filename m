Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6668CC77B6F
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 20:18:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466B810ECDC;
	Thu,  6 Apr 2023 20:18:54 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EAB10ECCE
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 20:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680812333; x=1712348333;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l8zH0LU7pg09vw+6rtqWbDEDwzdbOslICHqudPgfg4Q=;
 b=WWo45AhtkwBdel96rsXiwv2HTV/HOmV8sfnbmCGQRXsj4NcdJyr2Xu8O
 3BIVm1rh9whycfq3X56QaRZmXLkphQem5lyeZDiJZ70nBtBJK/XDsh5Za
 iQ1a9SxZd9st4Tn62O0OtRQZiP10z7sYuBt+fDroCbu5ocUsXsPr4lEx7
 K95cinnr6MMsIHBf+rgGEzaJHo90+wUVWMs9VLdnMx/DUssEu4DmEclFf
 z5AViLowgSldbzTSc7xSDJyhId7khv7bLnUkMlpVLq9BG+XhruCMeN6NX
 8qJd/BBg8cl+YouXfU51g9sy76/WFCKJejoWACMQbsAtZ33wE6Uz2CU5L w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="322482254"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="322482254"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 13:18:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="751775482"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="751775482"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 13:18:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 13:18:43 -0700
Message-Id: <20230406201845.1797532-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406201845.1797532-1-matthew.d.roper@intel.com>
References: <20230406201845.1797532-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 7/9] drm/xe: Select graphics/media descriptors
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If graphics_desc and media_desc are not specified in a platform's
xe_device_desc, treat this as an indication that the IP version should
be determined from the hardware's GMD_ID register.

Note that leaving media_desc unset for a platform that simply doesn't
have the IP (e.g., PVC) is also okay --- a read of the GMD_ID register
offset will be attempted, but since there's no register at that location
a value of '0' will be returned, effectively disabling media support.

Mapping of version -> IP description is done via a table lookup; this
table will be re-used in future patches for some KUnit testing.

v2:
 - Drop dummy structures.  NULL can be safely used for both the GMD_ID
   cases and the "media not present case."
 - Use a table-based lookup of GMD_ID versions rather than a simple
   switch statement; the table will allow us to easily perform kunit
   testing of all the IP descriptors.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |   6 +
 drivers/gpu/drm/xe/xe_pci.c          | 184 +++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_pci.h          |   5 +
 3 files changed, 159 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index a8a37e6a45a3..f174758d8307 100644
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
index e91de6711b0e..32d177c22a0b 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -15,6 +15,7 @@
 #include <drm/xe_pciids.h>
 
 #include "regs/xe_regs.h"
+#include "regs/xe_gt_regs.h"
 #include "xe_device.h"
 #include "xe_display.h"
 #include "xe_drv.h"
@@ -171,9 +172,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
 
 static const struct xe_graphics_desc graphics_xelpg = {
 	.name = "Xe_LPG",
-	.ver = 12,
-	.rel = 70,
-
 	.hw_engine_mask =
 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
 		BIT(XE_HW_ENGINE_CCS0),
@@ -204,9 +202,6 @@ static const struct xe_media_desc media_xehpm = {
 
 static const struct xe_media_desc media_xelpmp = {
 	.name = "Xe_LPM+",
-	.ver = 13,
-	.rel = 0,
-
 	.hw_engine_mask =
 		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
 		BIT(XE_HW_ENGINE_VECS0),	/* TODO: add GSC0 */
@@ -308,12 +303,7 @@ static const struct xe_gt_desc xelpmp_gts[] = {
 };
 
 static const struct xe_device_desc mtl_desc = {
-	/*
-	 * FIXME:  Real graphics/media IP will be mapped from hardware
-	 * GMD_ID register.  Hardcoded assignments here will go away soon.
-	 */
-	.graphics = &graphics_xelpg,
-	.media = &media_xelpmp,
+	/* .graphics and .media determined via GMD_ID */
 	.require_force_probe = true,
 	PLATFORM(XE_METEORLAKE),
 	.extra_gts = xelpmp_gts,
@@ -322,6 +312,17 @@ static const struct xe_device_desc mtl_desc = {
 #undef PLATFORM
 __diag_pop();
 
+/* Map of GMD_ID values to graphics IP */
+static struct gmdid_map graphics_ip_map[] = {
+	{ 1270, &graphics_xelpg },
+	{ 1271, &graphics_xelpg },
+};
+
+/* Map of GMD_ID values to media IP */
+static struct gmdid_map media_ip_map[] = {
+	{ 1300, &media_xelpmp },
+};
+
 #define INTEL_VGA_DEVICE(id, info) {			\
 	PCI_DEVICE(PCI_VENDOR_ID_INTEL, id),		\
 	PCI_BASE_CLASS_DISPLAY << 16, 0xff << 16,	\
@@ -411,31 +412,135 @@ find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
 	return NULL;
 }
 
-static void xe_info_init(struct xe_device *xe,
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
 			 const struct xe_device_desc *desc,
-			 const struct xe_subplatform_desc *subplatform_desc)
+			 const struct xe_graphics_desc **graphics,
+			 const struct xe_media_desc **media)
+{
+	u32 ver;
+
+	if (desc->graphics) {
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
+		for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
+			if (ver == graphics_ip_map[i].ver) {
+				xe->info.graphics_verx100 = ver;
+				*graphics = graphics_ip_map[i].ip;
+
+				break;
+			}
+		}
+
+		if (!xe->info.graphics_verx100) {
+			drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
+				ver / 100, ver % 100);
+		}
+	}
+
+	if (desc->media) {
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
+		 *
+		 * desc->media can also be NULL for a pre-GMD_ID platform that
+		 * simply doesn't have media (e.g., PVC); in that case the
+		 * attempt to read GMD_ID will return 0 (since there's no
+		 * register at that location).
+		 */
+		ver = peek_gmdid(xe, GMD_ID.reg + 0x380000);
+		if (ver == 0)
+			return;
+
+		for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
+			if (ver == media_ip_map[i].ver) {
+				xe->info.media_verx100 = ver;
+				*media = media_ip_map[i].ip;
+
+				break;
+			}
+		}
+
+		if (!xe->info.media_verx100) {
+			drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
+				ver / 100, ver % 100);
+		}
+	}
+}
+
+
+static int xe_info_init(struct xe_device *xe,
+			const struct xe_device_desc *desc,
+			const struct xe_subplatform_desc *subplatform_desc)
 {
+	const struct xe_graphics_desc *graphics_desc = NULL;
+	const struct xe_media_desc *media_desc = NULL;
 	struct xe_gt *gt;
 	u8 id;
 
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
-	xe->info.graphics_name = desc->graphics->name;
-	xe->info.media_name = desc->media ? desc->media->name : "none";
-	xe->info.dma_mask_size = desc->graphics->dma_mask_size;
-	xe->info.vram_flags = desc->graphics->vram_flags;
-	xe->info.vm_max_level = desc->graphics->vm_max_level;
-	xe->info.supports_usm = desc->graphics->supports_usm;
-	xe->info.has_asid = desc->graphics->has_asid;
-	xe->info.has_flat_ccs = desc->graphics->has_flat_ccs;
+	xe->info.graphics_name = graphics_desc->name;
+	xe->info.media_name = media_desc ? media_desc->name : "none";
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
@@ -446,7 +551,7 @@ static void xe_info_init(struct xe_device *xe,
 	 * FIXME: 'tile_count' here is misnamed since the rest of the driver
 	 * treats it as the number of GTs rather than just the number of tiles.
 	 */
-	xe->info.tile_count = 1 + desc->graphics->max_remote_tiles;
+	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
 	if (MEDIA_VER(xe) >= 13)
 		xe->info.tile_count++;
 
@@ -463,9 +568,9 @@ static void xe_info_init(struct xe_device *xe,
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
@@ -473,14 +578,16 @@ static void xe_info_init(struct xe_device *xe,
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
 				desc->extra_gts[id - 1].mmio_adj_offset;
 		}
 	}
+
+	return 0;
 }
 
 static void xe_pci_remove(struct pci_dev *pdev)
@@ -527,7 +634,12 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	subplatform_desc = find_subplatform(xe, desc);
 
-	xe_info_init(xe, desc, subplatform_desc);
+	err = xe_info_init(xe, desc, subplatform_desc);
+	if (err) {
+		drm_dev_put(&xe->drm);
+		return err;
+	}
+
 	xe_display_info_init(xe);
 
 	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) dma_m_s:%d tc:%d",
diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
index 611c1209b14c..fb449b9319bf 100644
--- a/drivers/gpu/drm/xe/xe_pci.h
+++ b/drivers/gpu/drm/xe/xe_pci.h
@@ -6,6 +6,11 @@
 #ifndef _XE_PCI_H_
 #define _XE_PCI_H_
 
+struct gmdid_map {
+	unsigned int ver;
+	const void *ip;
+};
+
 int xe_register_pci_driver(void);
 void xe_unregister_pci_driver(void);
 
-- 
2.39.2

