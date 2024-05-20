Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EBAC25B7C
	for <intel-xe@archiver.kernel.org>; Mon, 20 May 2024 15:45:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7321E10E315;
	Mon, 20 May 2024 15:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJVwjcAl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B9A10E567
 for <intel-xe@lists.freedesktop.org>; Mon, 20 May 2024 15:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716219953; x=1747755953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fy4YY0adgv2Mb7GzNQwxI/XXe4pl7yY9ouDOyn3MIf4=;
 b=IJVwjcAlhGgGNW2YuTZqlABx7GWRpdWsbivzoNwPWgLlRvHxvQH+ZOG9
 rrfOvHr7QSDSwZdlkGmqtQNdOM1ETuL548Nz5RVzt3WE5T02mzKEDJ+U+
 ni2LvAIerv2A1d6ANu9T1XXnby8fI0D51dssQixK83OOoBGWBok5UWmmp
 LPizbydNLFJAdCv7nhAv4pZIRBLVrcL4kXOmGYFx+eyBRyNmU8ZoPx+Yf
 wmYtYgQtAppX7+CnvI9XAxgGSFTnniBH8zvsJQe0tT2QEMf1Ldenn0chF
 SCyObCitovPzEEhKjk9LYARpxAyN/LPtHpEuYyDkak40wSHY0bThDICNG A==;
X-CSE-ConnectionGUID: ZGCGTwe1TW6REM5Ox8NE6g==
X-CSE-MsgGUID: 6AIuypwvQmSKFZlDnD9vgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="34873233"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="34873233"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:52 -0700
X-CSE-ConnectionGUID: 1rMwI+uBTPGcUqrdXJ4n3w==
X-CSE-MsgGUID: EIf2sUy+RZunVInb9604Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="32610524"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:52 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [CI v2 15/18] drm/xe: reset mmio mappings with devm
Date: Mon, 20 May 2024 16:43:04 +0100
Message-ID: <20240520154249.52888-33-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520154249.52888-19-matthew.auld@intel.com>
References: <20240520154249.52888-19-matthew.auld@intel.com>
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
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  4 +++-
 drivers/gpu/drm/xe/xe_mmio.c   | 35 ++++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_mmio.h   |  2 +-
 3 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 49ea1ba340e6..a9c1f353c2ad 100644
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
2.45.1

