Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D30AC25B74
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 18:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0203510EEFB;
	Fri, 10 May 2024 18:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mcF4jf0W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCC410EC25
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 18:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715364769; x=1746900769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uc9IP8haF7jyGry8u107E4izHqVTM1afysdhmq2Gz9s=;
 b=mcF4jf0W+y+GFOPDh6CTo3dsFya6kWyk7F+q5ryzgFgJmo2Rf7qm+5ek
 W2OXbn17Tr2u25SWpRPEdXACp6GuGxBlTUWtdoJkJN+vA9/HUUoWKxdCH
 6OW/MIXq6HglGPdT53k1XJVhhP1lacBYggwBABmA7a3sF11or5p5kg/3u
 eVu9VzmGcq3D+msniaGynnP47r/g53/9p6xl2U0eoWA/NZXfrlNVmXDf/
 JIVMhi/7tYyWMXbw/ReZOgmIIA0pOn8ERc1k3hxKqZiH4ddw10YZbMbn9
 /be/X6vmnyzHHnlZvHm72Nv1KUa9WIVdIvVzRLow1hNZPA9sNK86o8ky6 g==;
X-CSE-ConnectionGUID: 0Q3ZJ2MgTwim7nBLORWuuA==
X-CSE-MsgGUID: 68oTerC/RpWa766W8ExVRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28844619"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="28844619"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:49 -0700
X-CSE-ConnectionGUID: 2gGvHILpQYmF3VVra6/ZzQ==
X-CSE-MsgGUID: 4JTY56FLQsO0s7O/xzzi0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="60544142"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.149])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:47 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 17/20] drm/xe: reset mmio mappings with devm
Date: Fri, 10 May 2024 19:12:30 +0100
Message-ID: <20240510181212.264622-39-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240510181212.264622-22-matthew.auld@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
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

Set our various mmio mappings to NULL. This should make it easier to
catch something rogue trying to mess with mmio after device removal. For
example, we might unmap everything and then start hitting some mmio
address which has already been unmamped by us and then remapped by
something else, causing all kinds of carnage.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  4 +++-
 drivers/gpu/drm/xe/xe_mmio.c   | 35 ++++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_mmio.h   |  2 +-
 3 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 40983ad66e3c..ce8bccbb06ba 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -554,7 +554,9 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	xe_mmio_probe_tiles(xe);
+	err = xe_mmio_probe_tiles(xe);
+	if (err)
+		return err;
 
 	xe_ttm_sys_mgr_init(xe);
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index a3094e741db8..0ad840bab8f3 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -255,6 +255,21 @@ static int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 }
 
+static void vram_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+	struct xe_tile *tile;
+	int id;
+
+	if (xe->mem.vram.mapping)
+		iounmap(xe->mem.vram.mapping);
+
+	xe->mem.vram.mapping = NULL;
+
+	for_each_tile(tile, xe, id)
+		tile->mem.vram.mapping = NULL;
+}
+
 int xe_mmio_probe_vram(struct xe_device *xe)
 {
 	struct xe_tile *tile;
@@ -331,10 +346,20 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
 		 &available_size);
 
-	return 0;
+	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
 }
 
-void xe_mmio_probe_tiles(struct xe_device *xe)
+static void tiles_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+	struct xe_tile *tile;
+	int id;
+
+	for_each_tile(tile, xe, id)
+		tile->mmio.regs = NULL;
+}
+
+int xe_mmio_probe_tiles(struct xe_device *xe)
 {
 	size_t tile_mmio_size = SZ_16M, tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
 	u8 id, tile_count = xe->info.tile_count;
@@ -385,6 +410,8 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
 			regs += tile_mmio_ext_size;
 		}
 	}
+
+	return devm_add_action_or_reset(xe->drm.dev, tiles_fini, xe);
 }
 
 static void mmio_fini(void *arg)
@@ -392,10 +419,6 @@ static void mmio_fini(void *arg)
 	struct xe_device *xe = arg;
 
 	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
-	if (xe->mem.vram.mapping)
-		iounmap(xe->mem.vram.mapping);
-
-	xe->mem.vram.mapping = NULL;
 	xe->mmio.regs = NULL;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 445ec6a0753e..6488705c1ffe 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -21,7 +21,7 @@ struct xe_device;
 #define LMEM_BAR		2
 
 int xe_mmio_init(struct xe_device *xe);
-void xe_mmio_probe_tiles(struct xe_device *xe);
+int xe_mmio_probe_tiles(struct xe_device *xe);
 
 u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg);
 u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg);
-- 
2.45.0

