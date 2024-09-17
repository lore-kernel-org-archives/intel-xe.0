Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EF6CAC5AB
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 22:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4DF10E02A;
	Tue, 17 Sep 2024 22:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XRxl3GdU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B9810E02A
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 22:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726611386; x=1758147386;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c9urFwejiqEG4z1c3C/osq4SXpfEtUw0q66cUis0j0c=;
 b=XRxl3GdUWs0sHkISYD635CTcWXxSWYzlwagJI1jddxkC7w62qaSBZIUk
 wHVnRwefUJX/4zyRfcJpCKyJLkuEhp9BALdpgGTWP6zs50Qxz4uRpfeJE
 b80a4b+B4h5hJHQH4Ha1DRNCf2N6RJ1KmQccBmn294ogDcEjCdoAU7CmD
 kLng20f++ckqREm79VWI1Wb4FlY9ACSj2g4qlNGmNH6Npzkp8jMiU1jRb
 8Qm2YmCr5uRBQU5+DpG1QVsenET+3ZcBsk4Y9ZNUpX55LqJqU57oRe1kA
 DF83wVFDEIU1wuQqpQ2IkzykkgVj0vFs8aZsf/HNrMb1OZT2dXLlmdcTi g==;
X-CSE-ConnectionGUID: sxgNkTUeQve0uEjLko4e8g==
X-CSE-MsgGUID: YUpIv9mvRXCMw+N/VbLR0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25657438"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="25657438"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 15:16:26 -0700
X-CSE-ConnectionGUID: 1VeImA8fTC+n8+IjWtagpw==
X-CSE-MsgGUID: GK24hpORTwyg1zXuYUi65g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="69559000"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 15:16:25 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH] drm/xe: Defer gt->mmio initialization until after multi-tile
 setup
Date: Tue, 17 Sep 2024 15:16:16 -0700
Message-ID: <20240917221615.875962-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.46.0
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

With the recent xe_mmio redesign, tiles and GTs each have their own MMIO
accessor, with the GT inheriting some of the information (such as the
iomap pointer) from their containing tile.  Given that non-root tiles
get initialized later than the root tile (and currently after the point
at which GT MMIO is initialized for _all_ GTs), we wind up incorrectly
inheriting uninitialized pointers for the initialization of GT MMIO for
GTs that reside on non-root tiles.  This causes a driver crash on
multi-tile PVC platforms.

With the general xe_mmio redesign, it's now only necessary to do the
GT-level MMIO setup before the point we start reading/writing GT
registers.  Move initialization of gt->mmio out of xe_info_init (which
runs before non-root tiles are initialized) and to the beginning of
where we start actually accessing the GTs themselves.

The high-level initialization flow now boils down to:
 - General device init, software-only setup
 - (no register access possible yet)
 - Root tile initialization
 - (access to device/tile0 registers possible via xe_root_tile_mmio())
 - Initialization of non-root tiles
 - (access to any tile's registers possible via tile->mmio)
 - GT MMIO initialization, inheriting iomap from each GT's tile
 - (access to any GT's registers possible via gt->mmio)

Fixes: fa599b8c95a7 ("drm/xe: Populate GT's mmio iomap from tile during init")
Reported-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  7 +++++++
 drivers/gpu/drm/xe/xe_gt.c     | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h     |  1 +
 drivers/gpu/drm/xe/xe_pci.c    | 12 ------------
 4 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4d3c794f134c..998165962cad 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -656,6 +656,13 @@ int xe_device_probe(struct xe_device *xe)
 		err = xe_gt_init_early(gt);
 		if (err)
 			return err;
+
+		/*
+		 * Only after this point can GT-specific MMIO operations
+		 * (including things like communication with the GuC)
+		 * be performed.
+		 */
+		xe_gt_mmio_init(gt);
 	}
 
 	for_each_tile(tile, xe, id) {
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index b32fb3fdf80d..9b0218109647 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -624,6 +624,30 @@ int xe_gt_init(struct xe_gt *gt)
 	return 0;
 }
 
+/**
+ * xe_gt_mmio_init() - Initialize GT's MMIO access
+ * @gt: the GT object
+ *
+ * Initialize GT's MMIO accessor, which will be used to access registers inside
+ * this GT.
+ */
+void xe_gt_mmio_init(struct xe_gt *gt)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+
+	gt->mmio.regs = tile->mmio.regs;
+	gt->mmio.regs_size = tile->mmio.regs_size;
+	gt->mmio.tile = tile;
+
+	if (gt->info.type == XE_GT_TYPE_MEDIA) {
+		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
+		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
+	}
+
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
+		gt->mmio.sriov_vf_gt = gt;
+}
+
 void xe_gt_record_user_engines(struct xe_gt *gt)
 {
 	struct xe_hw_engine *hwe;
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 97def44afa4c..05c8351d0f39 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -37,6 +37,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
 int xe_gt_init_hwconfig(struct xe_gt *gt);
 int xe_gt_init_early(struct xe_gt *gt);
 int xe_gt_init(struct xe_gt *gt);
+void xe_gt_mmio_init(struct xe_gt *gt);
 void xe_gt_declare_wedged(struct xe_gt *gt);
 int xe_gt_record_default_lrcs(struct xe_gt *gt);
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 5ba4ec229494..2afa05799b8d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -721,11 +721,6 @@ static int xe_info_init(struct xe_device *xe,
 		gt->info.type = XE_GT_TYPE_MAIN;
 		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
 		gt->info.engine_mask = graphics_desc->hw_engine_mask;
-		gt->mmio.regs = tile->mmio.regs;
-		gt->mmio.regs_size = tile->mmio.regs_size;
-		gt->mmio.tile = tile;
-		if (IS_SRIOV_VF(xe))
-			gt->mmio.sriov_vf_gt = gt;
 
 		if (MEDIA_VER(xe) < 13 && media_desc)
 			gt->info.engine_mask |= media_desc->hw_engine_mask;
@@ -745,13 +740,6 @@ static int xe_info_init(struct xe_device *xe,
 		gt->info.type = XE_GT_TYPE_MEDIA;
 		gt->info.has_indirect_ring_state = media_desc->has_indirect_ring_state;
 		gt->info.engine_mask = media_desc->hw_engine_mask;
-		gt->mmio.regs = tile->mmio.regs;
-		gt->mmio.regs_size = tile->mmio.regs_size;
-		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
-		gt->mmio.adj_limit = MEDIA_GT_GSI_LENGTH;
-		gt->mmio.tile = tile;
-		if (IS_SRIOV_VF(xe))
-			gt->mmio.sriov_vf_gt = gt;
 
 		/*
 		 * FIXME: At the moment multi-tile and standalone media are
-- 
2.46.0

